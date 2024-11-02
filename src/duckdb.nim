import std/[enumerate, times, tables, strformat]
import /[database, query, query_result, config]

import nint128

when compileOption("profiler"):
  import std/nimprof

when isMainModule:
  let con = connect()
  # echo con.execute("CREATE TABLE integers AS SELECT * FROM range(7000000) t(i);")
  # # con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
  # # con.execute("INSERT INTO integers VALUES (6, 1), (5, 2), (7, 9), (7, 9);")
  # echo con.execute("SELECT * FROM integers LIMIT 10")

  let task = con.execute(
      "SELECT CASE WHEN i % 2 = 0 THEN ARRAY['a', 'b'] ELSE ARRAY['c', NULL, 'd'] END FROM range(2) t(i)"
    )
  echo task

  # echo con.execute(
  #   "SELECT CASE WHEN i%5=0 THEN NULL ELSE {'col1': i, 'col2': CASE WHEN i%2=0 THEN NULL ELSE 100 + i * 42 END} END FROM range(10) t(i);"
  # )
