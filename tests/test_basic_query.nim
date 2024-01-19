discard """
  cmd:      "nim cpp -r --panics:on --passl:-lduckdb $options $file"
  targets:  "c"
  action:   "run"
  exitcode: 0
  timeout:  60.0
"""

import unittest
import std/[enumerate]
import ../src/[database, query, queryset, exceptions]


suite "tests":

  test "DuckDB init":
    let con = connect()

  test "Create table":
    let con = connect()
    con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")

  test "Incorrect query throws an error":
    let con = connect()
    expect(OperationError):
        con.execute("something very wrong;")

  test "Insert with prepared statements":
    let con = connect()
    con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
    con.execute("INSERT INTO integers VALUES (6, 4), (5, 6), (?, ?);", 7, 8)
    let outcome = con.execute("SELECT * FROM integers").fetchall()
    assert outcome == @[@["6", "4"], @["5", "6"], @["7", "8"]]

  test "Insert and test select fetchall":
    let con = connect()
    con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
    con.execute("INSERT INTO integers VALUES (6, 4), (5, 6), (7, NULL);")
    let outcome = con.execute("SELECT * FROM integers").fetchall()
    assert outcome == @[@["6", "4"], @["5", "6"], @["7", ""]]

  test "Insert and test select as rows":
    let con = connect()
    con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
    con.execute("INSERT INTO integers VALUES (6, 4), (5, 6), (7, NULL);")
    let expected = @[@["6", "4"], @["5", "6"], @["7", ""]]
    for (index, row) in enumerate(con.execute("SELECT * FROM integers").rows):
      assert expected[index] == row

  test "Insert with appender":
    let con = connect()
    con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
    let expected = @[@["6", "4"], @["5", "6"], @["7", ""]]
    con.appender("integers", expected)

    for (index, row) in enumerate(con.execute("SELECT * FROM integers").rows):
      assert expected[index] == row
