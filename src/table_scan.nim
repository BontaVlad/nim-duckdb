import /[api, database, query_result, types, exceptions]

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

  TableFunction* = ref object
    name: string
    handle: duckdb_table_function
    bindFunc: proc(info: BindInfo)
    initFunc: proc(info: InitInfo)
    initLocalFunc: proc(info: InitInfo)
    mainFunc: proc(info: FunctionInfo, chunk: DataChunk)
    extraData: RootRef
    # globalObjects: HashSet[RootRef]
    # lock: Lock
    #

converter toC*(bi: BindInfo): duckdb_bind_info =
  cast[duckdb_bind_info](bi)

converter toNim(bi: duckdb_bind_info): BindInfo =
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

proc destroyTableFunction(p: pointer) {.cdecl.} =
  let tf = cast[TableFunction](p)
  `=destroy`(tf)

proc newTableFunction*(
    name: string,
    parameters: seq[LogicalType],
    bindFunc: proc(info: BindInfo),
    initFunc: proc(info: InitInfo),
    initLocalFunc: proc(info: InitInfo),
    mainFunc: proc(info: FunctionInfo, chunk: DataChunk),
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
      # globalObjects: initHashSet[RootRef](),
      # lock: initLock()
  )

  duckdb_table_function_set_name(result.handle, name.cstring)

  for param in parameters:
    echo param
    duckdb_table_function_add_parameter(result.handle, param.handle)

  # Store the TableFunction object pointer in DuckDB
  # We pass the object as a pointer along with the destroy callback
  duckdb_table_function_set_extra_info(
    result.handle, cast[pointer](result), destroyTableFunction
  )

  proc tableBind(info: duckdb_bind_info) {.cdecl.} =
    let tf = cast[TableFunction](duckdb_bind_get_extra_info(info))
    tf.bindFunc(info)

  proc tableInit(info: duckdb_init_info) {.cdecl.} =
    let tf = cast[TableFunction](duckdb_init_get_extra_info(info))
    tf.initFunc(info)

  proc tableLocalInit(info: duckdb_init_info) {.cdecl.} =
    let tf = cast[TableFunction](duckdb_init_get_extra_info(info))
    tf.initLocalFunc(info)

  proc tableMain(info: duckdb_function_info, chunk: duckdb_data_chunk) {.cdecl.} =
    let tf = cast[TableFunction](duckdb_function_get_extra_info(info))
    tf.mainFunc(info, chunk)

  # Register the callbacks
  duckdb_table_function_set_bind(result.handle, tableBind)
  duckdb_table_function_set_init(result.handle, tableInit)
  duckdb_table_function_set_local_init(result.handle, tableLocalInit)
  duckdb_table_function_set_function(result.handle, tableMain)

  duckdb_table_function_supports_projection_pushdown(result.handle, projectionPushdown)

# proc register*(con: Connection, ...) =
# #   echo con.execute("""CREATE OR REPLACE VIEW "{name}" AS SELECT * FROM nim_tbl_scan('{name}');""")

proc register*(con: Connection, fun: TableFunction) =
  check(duckdb_register_table_function(con, fun.handle), "Failed to regiter function")

proc unregister*(con: Connection, name: string) {.discardable.} =
  discard
