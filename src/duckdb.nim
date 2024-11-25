import tables
import
  /[database, dataframe, vector, query, query_result]


when isMainModule:
  let con = connect()
  # echo con.execute("SELECT * FROM range(2048 * 10);")

  # echo con
  #   .execute(
  #     "SELECT CASE WHEN i % 5 = 0 THEN NULL WHEN i % 2 = 0 THEN [i, i + 1] ELSE [i * 42, NULL, i * 84] END FROM range(10) t(i)"
  #   )
  # echo con.execute("SELECT * FROM range(2000);")

  let df = newDataFrame(
    {"foo": newVector(@[10, 20, 30, 40, 50, 60, 70]), "bar": newVector(@["a", "b", "c", "d", "e", "f", "g"])}.toTable
  )
  echo df
