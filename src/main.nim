import std/[enumerate]
import /[
  database,
  query,
  query_result
]


when isMainModule:
  let con = connect()
  con.execute("CREATE TABLE integers AS SELECT * FROM range(7000) t(i);")

  # # con.execute("CREATE TABLE combined(i INTEGER, j VARCHAR);")
  # # con.execute("INSERT INTO combined VALUES (6, 'foo'), (5, 'bar'), (?, ?);", @["7", "baz"])
  # # let outcome = con.execute("SELECT * FROM combined").fetchall()
  # # echo repr outcome
  # let con = connect()
  # con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
  # con.execute("INSERT INTO integers VALUES (6, 1), (5, 2), (7, NULL);")
  let outcome = con.execute("SELECT * FROM integers").fetchall()
  echo len(outcome)
  echo repr outcome
