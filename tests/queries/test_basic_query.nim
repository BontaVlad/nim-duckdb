discard """
  cmd:      "nim cpp -r --panics:on --passl:-lduckdb $options $file"
  targets:  "c"
  action:   "run"
  exitcode: 0
  timeout:  60.0
"""

import unittest
import std/[enumerate]
import ../src/[database, query, query_result, exceptions]


suite "tests":

  test "DuckDB init":
    let _ = connect()

  test "Create table":
    let con = connect()
    con.execute("CREATE TABLE integers(i INTEGER);")

  test "Incorrect query throws an error":
    let con = connect()
    expect(OperationError):
        con.execute("something very wrong;")

  test "Insert with prepared statements":
    let con = connect()
    con.execute("CREATE TABLE combined(i INTEGER, j VARCHAR);")
    con.execute("INSERT INTO combined VALUES (6, 'foo'), (5, 'bar'), (?, ?);", @["7", "baz"])
    let outcome = con.execute("SELECT * FROM combined").fetchall()
    assert outcome[0].valueInteger == @[6, 5, 7]
    assert outcome[1].valueVarChar == @["foo", "bar", "baz"]


  test "Insert and test select as rows":
    let con = connect()
    con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
    con.execute("INSERT INTO integers VALUES (6, 1), (5, 2), (7, NULL);")
    for row in con.execute("SELECT * FROM integers").fetchall():
      assert row.valueInteger == @[6, 5, 7]
      # assert expected[1] == row[1].valueInteger

  # test "Insert with appender":
  #   let con = connect()
  #   con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
  #   let expected = @[@["6", "4"], @["5", "6"], @["7", ""]]
  #   con.appender("integers", expected)

  #   for (index, row) in enumerate(con.execute("SELECT * FROM integers").rows):
  #     assert expected[index] == row

  # test "Insert with already made prepared statement":
  #   let con = connect()
  #   con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")

  #   let prepared = newStatement(con, "INSERT INTO integers VALUES (?, ?);")
  #   con.execute(prepared, @[1, 2])
  #   con.execute(prepared, @[3, 4])
  #   let outcome = con.execute("SELECT * FROM integers").fetchall()

  #   assert len(outcome) == 2
