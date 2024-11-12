import unittest

import ../../src/[api, database, query, query_result, exceptions, table_scan, types]

suite "tests":
  test "Test create table function":
    let con = connect()
    let tf = newTableFunction(
      name = "my_function",
      parameters = @[newLogicalType(DuckType.Integer)],
      bindFunc = proc(info: BindInfo) =
        discard,
      initFunc = proc(info: InitInfo) =
        # Init logic here
        discard,
      initLocalFunc = proc(info: InitInfo) =
        # Local init logic here
        discard,
      mainFunc = proc(info: FunctionInfo, chunk: DataChunk) =
        # Main function logic here
        discard,
      extraData = nil,
      projectionPushdown = true,
    )
    con.register(tf)
    echo con.execute("SELECT * FROM my_function(3);")

  # test "Test register table":
  # let con = connect()
  # let foo = @[1, 2, 3, 4]
  # con.register("foo")
