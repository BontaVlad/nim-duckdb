import std/[tables]
import /[api, database, query_result, types, exceptions, value]

type
  DataFrame* = ref object
    columns*: seq[Column]
    values*: seq[Vector]
  TableFunction* = ref object
    name: string
    handle: duckdb_table_function
    bindFunc: proc(info: duckdb_bind_info)
    initFunc: proc(info: duckdb_init_info)
    initLocalFunc: proc(info: duckdb_init_info)
    mainFunc: proc(info: duckdb_function_info, chunk: duckdb_data_chunk)
    extraData: RootRef
    globalObjects: Table[string, DataFrame]
    # globalLock::ReentrantLock

proc destroyTableFunction(p: pointer) {.cdecl.} =
  let tf = cast[TableFunction](p)
  duckdb_destroy_table_function(tf.handle.addr)
  `=destroy`(tf)

proc `$`*(tf: TableFunction): string =
  result = tf.name

proc parameter_count*(info: duckdb_bind_info): int =
  duckdb_bind_get_parameter_count(info).int

proc get_parameter(info: duckdb_bind_info, index: int): Value =
  result = newValue(newDuckValue(duckdb_bind_get_parameter(info, index.idx_t)))

iterator parameters*(info: duckdb_bind_info): Value =
  for idx in 0 ..< info.parameter_count:
    yield info.get_parameter(idx)

proc add_result_column*(info: duckdb_bind_info, name: string, tp: LogicalType) =
  duckdb_bind_add_result_column(info, name.cstring, tp.handle)

proc add_result_column*(info: duckdb_bind_info, name: string, tp: DuckType) =
  info.add_result_column(name, newLogicalType(tp))

proc tableBind(info: duckdb_bind_info) {.cdecl.} =
  var tf = cast[TableFunction](duckdb_bind_get_extra_info(info))
  tf.bindFunc(info)

proc tableInit(info: duckdb_init_info) {.cdecl.} =
  var tf = cast[TableFunction](duckdb_init_get_extra_info(info))
  tf.initFunc(info)

proc tableLocalInit(info: duckdb_init_info) {.cdecl.} =
  var tf = cast[TableFunction](duckdb_init_get_extra_info(info))
  tf.initLocalFunc(info)

proc tableMain(info: duckdb_function_info, chunk: duckdb_data_chunk) {.cdecl.} =
  var tf = cast[TableFunction](duckdb_function_get_extra_info(info))
  tf.mainFunc(info, chunk)

proc newTableFunction*(
    name: string,
    parameters: seq[LogicalType],
    bindFunc: proc(info: duckdb_bind_info),
    initFunc: proc(info: duckdb_init_info),
    initLocalFunc: proc(info: duckdb_init_info),
    mainFunc: proc(info: duckdb_function_info, chunk: duckdb_data_chunk),
    extraData: RootRef,
    projectionPushdown: bool,
): TableFunction =
  result = TableFunction(
    name: name,
    handle: duckdb_create_table_function(),
    bindFunc: bindFunc,
    initFunc: initFunc,
    initLocalFunc: initLocalFunc,
    mainFunc: mainFunc,
    extraData: extraData,
  )

  duckdb_table_function_set_name(result.handle, name.cstring)

  for param in parameters:
    duckdb_table_function_add_parameter(result.handle, param.handle)

  GC_ref(result)
  duckdb_table_function_set_extra_info(
    result.handle, cast[ptr TableFunction](result), destroyTableFunction
  )

  # Register the callbacks
  duckdb_table_function_set_bind(result.handle, tableBind)
  duckdb_table_function_set_init(result.handle, tableInit)
  duckdb_table_function_set_local_init(result.handle, tableLocalInit)
  duckdb_table_function_set_function(result.handle, tableMain)

  duckdb_table_function_supports_projection_pushdown(result.handle, projectionPushdown)

proc register*(con: Connection, fun: TableFunction) =
  check(duckdb_register_table_function(con, fun.handle), "Failed to regiter function")

proc unregister*(con: Connection, name: string) {.discardable.} =
  discard
