import std/[enumerate, times, tables, strformat]
import /[database, query, query_result, config, vector, transaction]

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
  # echo con.execute("SELECT MAP {'key1': 10, 'key2': 20, 'key3': 30};")
  # echo con.execute("SELECT CASE WHEN i%5=0 THEN NULL ELSE {'col1': i, 'col2': CASE WHEN i%2=0 THEN NULL ELSE 100 + i * 42 END} END FROM range(10) t(i);")
  transaction(con):
    echo con.execute("SELECT '10111101'::BITSTRING;")

  # echo con.execute("SELECT TIMETZ '1992-09-20 11:30:00.123456';")
  # echo con.execute("SELECT uuid();")
  # echo con.execute(
  #   "select '00000000-0000-0000-0000-000000000012'::uuid from generate_series(1, 10);"
  # )
  # echo con.execute("SELECT '00000000-0000-0000-0000-000000000001'::uuid;")
  # echo con.execute("SELECT 'd46a5a42-2915-44e9-9fb0-c38509bd9908'::uuid;")
  # '546a5a42-2915-44e9-9fb0-c38509bd9908'
  # "0899bd09-85c3-b09f-e944-1529425a6a54"
  #                         # 546a5a42-2915-44e9-9fb0-c38509bd9908
  # con.execute("CREATE TABLE tbl1 (u UNION(num INTEGER, str VARCHAR));")
  # con.execute("INSERT INTO tbl1 values (1), ('two'), (union_value(str := 'three'));")
  # echo con.execute("SELECT u FROM tbl1;")
  # echo con.execute("SELECT u.str FROM tbl1;")
  # echo con.execute("SELECT union_extract(u, 'str') AS str FROM tbl1;")
  # echo con.execute("SELECT union_tag(u) AS t FROM tbl1;")
# | {num=1}     │
# │ {str=two}   │
# │ {str=three} |

# echo con.execute("SELECT 170141183460469231731687303715884105727::HUGEINT;")
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
