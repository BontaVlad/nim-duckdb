import std/[enumerate]
import /[
  database,
  query,
  query_result,
  config
]


when isMainModule:
  # let con = connect()
  # con.execute("CREATE TABLE integers AS SELECT * FROM range(7000) t(i);")

  # # # let outcome = con.execute("SELECT * FROM combined").fetchall()
  # # # echo repr outcome
  # # let con = connect()
  # # con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
  # # con.execute("INSERT INTO integers VALUES (6, 1), (5, 2), (7, NULL);")
  # let outcome = con.execute("SELECT * FROM integers").fetchall()
  # echo len(outcome)
  # echo repr outcome

  # let con = connect()
  # # con.execute("CREATE TABLE integers AS SELECT * FROM range(3) t(i);")
  # # let outcome = con.execute("SELECT * FROM integers").fetchall()
  # # echo repr outcome

  # con.execute("CREATE TABLE combined(i INTEGER, j VARCHAR);")
  # con.execute("INSERT INTO combined VALUES (6, 'foo'), (5, 'bar'), (?, ?);", @["7", "baz"])
  # let outcome = con.execute("SELECT * FROM combined").fetchall()
  # for col in outcome:
  #   case col.kind
  #   of Duckdbtypeinteger: echo col.valueInteger
  #   of Duckdbtypevarchar: echo col.valueVarchar
  #   else: discard

  let con = connect()
  con.execute("CREATE TABLE booleans(i BOOLEAN);")
  con.execute("INSERT INTO booleans VALUES (true), (false), (true);")
  let outcome = con.execute("SELECT * FROM booleans").fetchall()
  echo repr outcome
