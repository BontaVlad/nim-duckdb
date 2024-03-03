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

  test "Test int result type":
    let con = connect()
    con.execute("CREATE TABLE integers AS SELECT * FROM range(3) t(i);")
    let outcome = con.execute("SELECT * FROM integers").fetchall()
