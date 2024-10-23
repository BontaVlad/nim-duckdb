import std/[enumerate, times, tables, strformat]
import /[
  database,
  query,
  query_result,
  config,
]

import nint128


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
  # con.execute("CREATE TABLE thruth(anwser BOOLEAN);")
  # con.execute("INSERT INTO thruth VALUES (true), (false)")
  # for vals in con.execute("SELECT * FROM thruth").chunks:
  #   echo repr vals

  # # con.execute("CREATE TABLE IF NOT EXISTS timestamps (sec TIMESTAMP_S, milli TIMESTAMP_MS,micro TIMESTAMP_US, nano TIMESTAMP_NS );")
  # # con.execute("INSERT INTO timestamps VALUES ('2008-01-01 00:00:11','2008-01-01 00:00:01.794','2008-01-01 00:00:01.98926','2008-01-01 00:00:01.899268321' )")
  # con.execute("CREATE TABLE IF NOT EXISTS foo (nano TIMESTAMP_NS);")
  # con.execute("INSERT INTO foo VALUES ('2022-03-05 17:59:17.877')")


  let con = connect()
  con.execute("CREATE TABLE IF NOT EXISTS huge (hg HUGEINT);")
  con.execute(fmt"INSERT INTO huge VALUES ({high(Int128)})")
  let
    outcome = con.execute("SELECT * FROM huge").fetchall()
  echo repr outcome

  # con.execute("CREATE TABLE combined(i INTEGER, j VARCHAR);")
  # con.execute("INSERT INTO combined VALUES (6, 'foo'), (5, 'bar'), (?, ?);", (7, "baz"))
  # for vals in con.execute("SELECT * FROM combined").chunks:
  #   echo repr vals
  # for col in outcome:
  #   case col.kind
  #   of Duckdbtypeinteger: echo col.valueInteger
  #   of Duckdbtypevarchar: echo col.valueVarchar
  #   else: discard

  # let con = connect()
  # con.execute("CREATE TABLE booleans(i BOOLEAN);")
  # con.execute("INSERT INTO booleans VALUES (true), (false), (true);")
  # let outcome = con.execute("SELECT * FROM booleans").fetchall()
  # echo repr outcome


  # let con = connect()
  # con.execute("CREATE TABLE IF NOT EXISTS timestamps (sec TIMESTAMP_S, milli TIMESTAMP_MS,micro TIMESTAMP_US, nano TIMESTAMP_NS );")
  # con.execute("INSERT INTO timestamps VALUES ('2008-01-01 00:00:11','2008-01-01 00:00:01.794','2008-01-01 00:00:01.98926','2008-01-01 00:00:01.899268321' )")
  # con.execute("CREATE TABLE IF NOT EXISTS timestamps (t TIMESTAMP);")
  # con.execute("INSERT INTO timestamps VALUES ('2024-01-02T02:00:00Z')")
  # let outcome = con.execute("SELECT * FROM timestamps").fetchall()
  # echo outcome[0].valueTimestamp[0].format("yyyy-MM-dd'T'HH:mm:ss'Z'")
  # echo outcome[0].valueTimestamp
