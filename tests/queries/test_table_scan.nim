import std/[unittest, sequtils]

import
  ../../src/
    [api, database, query, query_result, config, vector, transaction, table_scan, types]

suite "tests":
  test "Test create table function":
    let con = connect()
    type MyBindStruct = object
      count*: int

    proc newMyBindStruct(count: int): MyBindStruct =
      result = MyBindStruct(count: count)

    proc destroyBindStruct(p: pointer) {.cdecl.} =
      var myStruct = cast[MyBindStruct](p)
      `=destroy`(myStruct)

    proc myBindFunction(info: BindInfo) =
      info.add_result_column("my_column", DuckType.INTEGER)
      let parameter = info.parameters.toSeq
      let data = newMyBindStruct(parameter[0].valueInteger)
      duckdb_bind_set_bind_data(info, cast[pointer](data), destroyBindStruct)

    type MyInitStruct = object
      pos*: int

    proc destroyInitStruct(p: pointer) {.cdecl.} =
      var myStruct = cast[MyInitStruct](p)
      `=destroy`(myStruct)

    proc myInitFunction(info: InitInfo) =
      let foo = MyInitStruct(pos: 0)
      duckdb_init_set_init_data(info, cast[pointer](foo), destroyInitStruct)

    proc myMainFunctionPrint(info: FunctionInfo, output: DataChunk) =
      let bindInfo = cast[MyBindStruct](duckdb_function_get_bind_data(info))
      var initInfo = cast[MyInitStruct](duckdb_function_get_init_data(info))

      let raw = duckdb_vector_get_data(duckdb_data_chunk_get_vector(output, 0.idx_t))
      var resultArray = cast[ptr UncheckedArray[int32]](raw)
      var count = 0
      while initInfo.pos < bindInfo.count and count < duckdb_vector_size().int:
        resultArray[count] = if initInfo.pos mod 2 == 0: 42 else: 84
        count += 1
        initInfo.pos += 1
      duckdb_data_chunk_set_size(output, count.idx_t)

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
    # let outcome = con.execute("SELECT my_column FROM my_function(3);")
    # echo outcome
    # assert outcome[0].valueInteger == @[42'i32, 84'i32]
