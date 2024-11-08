import std/[enumerate, times, tables, strformat]
import /[database, query, query_result, config, vector]

import nint128

when compileOption("profiler"):
  import std/nimprof

when isMainModule:
  let con = connect()
  # echo con.execute("CREATE TABLE integers AS SELECT * FROM range(70000) t(i);")
  # con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
  # con.execute("INSERT INTO integers VALUES (6, 1), (5, 2), (7, 9), (7, 9);")
  # echo con.execute("SELECT * FROM integers LIMIT 10;")
  # echo con.execute("SELECT [union_value(num := 2), union_value(str := 'ABC')::UNION(str VARCHAR, num INTEGER)];")
  echo con.execute("SELECT MAP {'key1': 10, 'key2': 20, 'key3': 30};")
# {key1: 10, key2: 20, key3: 30}

# echo con.execute("SELECT CASE WHEN i % 5 = 0 THEN NULL WHEN i % 2 = 0 THEN [i, i + 1] ELSE [i * 42, NULL, i * 84] END FROM range(10) t(i);")
# echo task
# let outcome = task.fetchAll()
# echo outcome[0].valueList[0].valueVarchar[0]

# echo con.execute(
#   "SELECT CASE WHEN i%5=0 THEN NULL ELSE {'col1': i, 'col2': CASE WHEN i%2=0 THEN NULL ELSE 100 + i * 42 END} END FROM range(10) t(i);"
# )

# echo con.execute(
#   "SELECT * FROM integers;"
# )
# let outcome = task.fetchAllNamed()
# echo outcome

# [42, , 84]                                                                                                                                        │
# │ [2, 3]                                                                                                                                            │
# │ [126, , 252]                                                                                                                                      │
# │ [4, 5]                                                                                                                                            │
# │                                                                                                                                                   │
# │ [6, 7]                                                                                                                                            │
# │ [294, , 588]                                                                                                                                      │
# │ [8, 9]                                                                                                                                            │
# │ [378, , 756]

# │     Invalid Value                  │
# │     @[2, Invalid Value]            │
# │     @[126, Invalid Value, 252]     │
# │     @[4, Invalid Value]            │
# │     @[6, Invalid Value]            │
# │     Invalid Value                  │
# │     @[8, Invalid Value]            │
# │     @[378, Invalid Value, 756]     │

# let con = connect()
# con.execute(
#   """
#     CREATE TABLE prepared_table (
#       bool_val BOOLEAN,
#       int16_val SMALLINT,
#       int32_val INTEGER,
#       int64_val BIGINT,
#       float32_val FLOAT,
#       float64_val DOUBLE,
#       string_val VARCHAR,
#     );
#   """
# )

# let prepared = newStatement(
#   con, "INSERT INTO prepared_table VALUES (?, ?, ?, ?, ?, ?, ?);"
# )
# con.execute(
#   prepared,
#   (
#     true,
#     int16(32767),
#     int32(-2147483648),
#     int64(9223372036854775807),
#     float32(3.14'f32),
#     float64(3.14159265359'f64),
#     "hello",
#   ),
# )
# echo con.execute("SELECT * FROM prepared_table")
