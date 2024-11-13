import std/[enumerate, times, tables, strformat, sequtils]
import
  /[api, database, query, query_result, config, vector, transaction, table_scan, types]

import nint128

when compileOption("profiler"):
  import std/nimprof

when isMainModule:
  let con = connect()
  type MyBindStruct = object
    count*: int

  proc newMyBindStruct(count: int): MyBindStruct =
    echo "called bind"
    result = MyBindStruct(count: count)

  proc destroyBindStruct(p: pointer) {.cdecl.} =
    var myStruct = cast[MyBindStruct](p)
    `=destroy`(myStruct)

  proc myBindFunction(info: BindInfo) =
    info.add_result_column("my_column", DuckType.INTEGER)
    # let parameter = info.parameters.toSeq
    # let data = newMyBindStruct(parameter[0].valueInteger)
    # duckdb_bind_set_bind_data(info, cast[pointer](data), destroyBindStruct)

  type MyInitStruct = object
    pos*: int

  proc destroyInitStruct(p: pointer) {.cdecl.} =
    var myStruct = cast[MyInitStruct](p)
    `=destroy`(myStruct)

  proc myInitFunction(info: InitInfo) =
    var foo = MyInitStruct(pos: 0)
    duckdb_init_set_init_data(info, cast[pointer](foo), destroyInitStruct)

  var calledCount = 0
  proc myMainFunctionPrint(info: FunctionInfo, output: DataChunk) =
    echo " "
    echo "-------------------------------"
    var bindInfo = cast[MyBindStruct](duckdb_function_get_bind_data(info))
    var initInfo = cast[MyInitStruct](duckdb_function_get_init_data(info))

    bindInfo.count = 3
    let raw = duckdb_vector_get_data(duckdb_data_chunk_get_vector(output, 0.idx_t))
    var resultArray = cast[ptr UncheckedArray[int32]](raw)
    echo "calledCount: ", calledCount
    calledCount += 1
    var count = 3
    while initInfo.pos < bindInfo.count and count < duckdb_vector_size().int:
      resultArray[count] = if initInfo.pos mod 2 == 0: 42 else: 84
      echo "pos: ", initInfo.pos, "count: ", count, "vector size ", duckdb_vector_size()
      count += 1
      initInfo.pos += 1
    # echo "returning chunk"
    duckdb_data_chunk_set_size(output, count.idx_t)
    let chunk_size = duckdb_data_chunk_get_size(output).int
    echo "chunk_size: ", chunk_size
    echo "-------------------------------"
    echo " "

  let tf = newTableFunction(
    name = "my_function",
    parameters = @[newLogicalType(DuckType.Integer)],
    bindFunc = myBindFunction,
    initFunc = myInitFunction,
    initLocalFunc = proc(info: InitInfo) =
      discard,
    mainFunc = myMainFunctionPrint,
    extraData = nil,
    projectionPushdown = true,
  )
  con.register(tf)
  # echo con.execute("SELECT * FROM range(4);")
  echo con.execute("SELECT my_column FROM my_function(3) LIMIT 3;")
  # let outcome = con.execute("SELECT my_column FROM my_function(3);").fetchall()
  # echo outcome
