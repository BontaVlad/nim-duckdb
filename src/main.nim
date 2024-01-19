import std/[enumerate]
import /[
  database,
  query,
  queryset
]


when isMainModule:
  let con = connect()
  con.execute("CREATE TABLE integers AS SELECT * FROM range(1000000) t(i);")
  let nums = con.execute("SELECT * FROM integers;").fetchall()
  echo len(nums)
  # con.execute("CREATE TABLE integers(i INTEGER, j INTEGER);")
  # # con.execute("INSERT INTO integers VALUES (6, 4), (5, 6), (7, NULL);")
  # # let outcome = con.execute("SELECT * FROM integers").fetchall()
  # # echo outcome
  # let expected = @[@[6, 4], @[5, 6], @[7, 0]]
  # con.appender("integers", expected)

  # for (index, row) in enumerate(con.execute("SELECT * FROM integers").rows):
  #   echo row
