import std/[unittest]
import ../../src/[api, database, query, query_result, exceptions, scalar_functions]

suite "Test scalar functions":
  test "Test scalar function":
    let con = connect()

    proc doubleValue(val: int): int {.scalar.} =
      result = val * 2

    con.register(doubleValue)

    con.execute("CREATE TABLE test_table AS SELECT i FROM range(3) t(i);")
    let outcome =
      con.execute("SELECT i, doubleValue(i) as doubled FROM test_table").fetchAll()
    assert outcome[0].valueBigInt == @[0'i64, 2'i64, 6'i64]
