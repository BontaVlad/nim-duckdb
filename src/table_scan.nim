import /[api, database, query_result, types, exceptions, value]

type
  Table = object
  BindInfo* = object of duckdb_bind_info
  InitInfo* = object of duckdb_init_info
  FunctionInfo* = object of duckdb_function_info
  TableBindInfo* = ref object
    table: Table
    inputColumns: seq[Column]
    scanTypes: seq[DuckType]
    resultTypes: seq[DuckType]
    scanFunctions: seq[proc(x: pointer): pointer] # Adjust signature as needed

  TableFunction* = object
    name: string
    handle {.cursor.}: duckdb_table_function
    bindFunc: proc(info: BindInfo)
    initFunc: proc(info: InitInfo)
    initLocalFunc: proc(info: InitInfo)
    mainFunc: proc(info: FunctionInfo, chunk: DataChunk)
    extraData: RootRef

proc `=destroy`*(tf: TableFunction) {.nodestroy.} =
  echo "called destroy on table function"
  if not isNil(tf.addr) and not isNil(tf.handle.addr):
    duckdb_destroy_table_function(tf.handle.addr)

type TableFunctionRef* = ref TableFunction
  # globalObjects: HashSet[RootRef]
  # lock: Lock

# TODO: this is never called
proc destroyTableFunction(p: pointer) {.cdecl.} =
  let tf = cast[TableFunction](p)
  `=destroy`(tf)

proc `$`*(tf: TableFunctionRef): string =
  result = tf.name

converter toC*(bi: BindInfo): duckdb_bind_info =
  cast[duckdb_bind_info](bi)

converter toNim*(bi: duckdb_bind_info): BindInfo =
  cast[BindInfo](bi)

converter toCptr*(bi: ptr BindInfo): ptr duckdb_bind_info =
  cast[ptr duckdb_bind_info](bi)

converter toC*(ii: InitInfo): duckdb_init_info =
  cast[duckdb_init_info](ii)

converter toNim*(ii: duckdb_init_info): InitInfo =
  cast[InitInfo](ii)

converter toCptr*(ii: ptr InitInfo): ptr duckdb_init_info =
  cast[ptr duckdb_init_info](ii)

converter toC*(fi: FunctionInfo): duckdb_function_info =
  cast[duckdb_function_info](fi)

converter toNim*(fi: duckdb_function_info): FunctionInfo =
  cast[FunctionInfo](fi)

converter toCptr*(fi: ptr FunctionInfo): ptr duckdb_function_info =
  cast[ptr duckdb_function_info](fi)

proc parameter_count*(info: BindInfo): int =
  duckdb_bind_get_parameter_count(info).int

proc get_parameter(info: BindInfo, index: int): Value =
  result = newValue(newDuckValue(duckdb_bind_get_parameter(info, index.idx_t)))

iterator parameters*(info: BindInfo): Value =
  for idx in 0 ..< info.parameter_count:
    yield info.get_parameter(idx)

proc add_result_column*(info: BindInfo, name: string, tp: LogicalType) =
  duckdb_bind_add_result_column(info, name.cstring, tp.handle)

proc add_result_column*(info: BindInfo, name: string, tp: DuckType) =
  info.add_result_column(name, newLogicalType(tp))

# function set_stats_cardinality(bind_info::BindInfo, cardinality::UInt64, is_exact::Bool)
#     duckdb_bind_set_cardinality(bind_info.handle, cardinality, is_exact)
#     return
# end

# function get_extra_data(bind_info::BindInfo)
#     return bind_info.main_function.extra_data
# end

proc newTableFunction*(
    name: string,
    parameters: seq[LogicalType],
    bindFunc: proc(info: BindInfo),
    initFunc: proc(info: InitInfo),
    initLocalFunc: proc(info: InitInfo),
    mainFunc: proc(info: FunctionInfo, chunk: DataChunk),
    extraData: RootRef,
    projectionPushdown: bool,
): TableFunctionRef =
  result = new(TableFunctionRef)
  result.name = name
  result.handle = duckdb_create_table_function()
  result.bindFunc = bindFunc
  result.initFunc = initFunc
  result.initLocalFunc = initLocalFunc
  result.mainFunc = mainFunc
  result.extraData = extraData
  #   mainFunc: mainFunc,
  #   extraData: extraData,
  # result = TableFunction(
  #   name: name,
  #   handle: duckdb_create_table_function(),
  #   bindFunc: bindFunc,
  #   initFunc: initFunc,
  #   initLocalFunc: initLocalFunc,
  #   mainFunc: mainFunc,
  #   extraData: extraData,
  #     # globalObjects: initHashSet[RootRef](),
  #     # lock: initLock()
  # )

  duckdb_table_function_set_name(result.handle, name.cstring)

  for param in parameters:
    duckdb_table_function_add_parameter(result.handle, param.handle)

  # Store the TableFunction object pointer in DuckDB
  # We pass the object as a pointer along with the destroy callback
  duckdb_table_function_set_extra_info(
    result.handle, cast[pointer](result), destroyTableFunction
  )

  proc tableBind(info: duckdb_bind_info) {.cdecl.} =
    let tf = cast[TableFunctionRef](duckdb_bind_get_extra_info(info))
    tf.bindFunc(info)

  proc tableInit(info: duckdb_init_info) {.cdecl.} =
    let tf = cast[TableFunctionRef](duckdb_init_get_extra_info(info))
    tf.initFunc(info)

  proc tableLocalInit(info: duckdb_init_info) {.cdecl.} =
    let tf = cast[TableFunctionRef](duckdb_init_get_extra_info(info))
    tf.initLocalFunc(info)

  proc tableMain(info: duckdb_function_info, chunk: duckdb_data_chunk) {.cdecl.} =
    let tf = cast[TableFunctionRef](duckdb_function_get_extra_info(info))
    tf.mainFunc(info, chunk)

  # Register the callbacks
  duckdb_table_function_set_bind(result.handle, tableBind)
  duckdb_table_function_set_init(result.handle, tableInit)
  duckdb_table_function_set_local_init(result.handle, tableLocalInit)
  duckdb_table_function_set_function(result.handle, tableMain)

  duckdb_table_function_supports_projection_pushdown(result.handle, projectionPushdown)

# proc register*(con: Connection, ...) =
# #   echo con.execute("""CREATE OR REPLACE VIEW "{name}" AS SELECT * FROM nim_tbl_scan('{name}');""")

proc register*(con: Connection, fun: TableFunctionRef) =
  check(duckdb_register_table_function(con, fun.handle), "Failed to regiter function")

proc unregister*(con: Connection, name: string) {.discardable.} =
  discard
