import std/[
  sugar, sequtils, math,
  times, tables,
  macros
]

import /[api, vector]

type
  QueryResult* = object of duckdb_result
  DataChunk* = distinct ptr duckdb_data_chunk
  PendingQueryResult* = object of duckdb_pending_result

  Column = object
    idx: idxt
    name: string
    kind: Type
    logical_type: LogicalType

converter toBase*(d: ptr DataChunk): ptr duckdbdatachunk = cast[ptr duckdbdatachunk](d)
converter toBase*(d: DataChunk): duckdbdatachunk = cast[duckdbdatachunk](d)
converter toBool*(d: DataChunk): bool = not isNil(d) or duckdbdatachunkgetsize(d).int > 0
converter toBase*(p: ptr PendingQueryResult): ptr duckdb_pending_result = cast[ptr duckdb_pending_result](p)
converter toBase*(p: PendingQueryResult): duckdb_pending_result = cast[duckdb_pending_result](p)

proc `=destroy`(qresult: QueryResult) =
  if not isNil(qresult.addr):
    duckdbDestroyResult(qresult.addr)

proc `=destroy`(datachunk: DataChunk) =
  if not isNil(datachunk.addr):
    duckdbdestroydatachunk(datachunk.addr)

proc isStreaming(qresult: QueryResult): bool =
  result = duckdb_result_is_streaming(qresult)

proc newChunk(qresult: QueryResult): DataChunk =
  result = cast[DataChunk](duckdb_stream_fetch_chunk(qresult))

proc newChunk(qresult: QueryResult, idx: idxt): DataChunk =
  result = cast[DataChunk](duckdb_result_get_chunk(qresult, idx))

  # TODO: add error checking here
proc newColumn(qresult: QueryResult, idx: idxt): Column =
  result.idx = idx
  result.name = $duckdb_column_name(qresult.addr, idx)
  result.logical_type = cast[LogicalType](duckdb_column_logical_type(qresult.addr, idx))
  result.kind = cast[Type](duckdb_column_type(qresult.addr, idx))

iterator columns(qresult: QueryResult): Column {.inline.} =
  for i in 0..<duckdb_column_count(qresult.addr):
    yield newColumn(qresult, i)

proc fetchChunk(qresult: QueryResult, idx: idx_t): seq[Vector] {.inline.} =
  let
    columns = qresult.columns.toSeq
    chunk = if qresult.isStreaming: newChunk(qresult) else: newChunk(qresult, idx) # TODO: should check for empty

  result = newSeq[Vector](len(columns))
  for col in columns:
    let
      vec: duckdb_vector = duckdb_data_chunk_get_vector(chunk, col.idx)
      chunk_size = duckdb_data_chunk_get_size(chunk).int
    result[col.idx] = newVector(vec, 0, chunk_size, col.kind, col.logical_type)
  # TODO: not sure why I need to return here
  return result

# proc fetchOne*(qresult: QueryResult): seq[Vector] {.inline.} =
#   return fetchChunk(qresult, 0)[0..0]

iterator chunks*(qresult: QueryResult): seq[Vector] {.inline.} =
  for i in 0..<duckdb_result_chunk_count(qresult):
    yield fetchChunk(qresult, i)

# macro getAttr(obj: typed, attr: static[string]): untyped =
#   newDotExpr(obj, newIdentNode(attr))

# TODO: api not definitive
proc fetchAllNamed*(qresult: QueryResult): Table[string, Vector] =
  # fetchAllImpl[Table[string, Vector]]("name", qresult)
  let columns = qresult.columns.toSeq

  result = initTable[string, Vector]()
  for column in columns:
    let bar = newVector(column.kind)
    result[column.name] = newVector(column.kind)

  for chunk in qresult.chunks:
    for column in columns:
      result[column.name] &= chunk[column.idx]

# TODO: api not definitive
proc fetchAll*(qresult: QueryResult): seq[Vector] =
  # fetchAllImpl[seq[Vector]]("idx", qresult)
  let columns = qresult.columns.toSeq

  result = newSeq[Vector](len(columns))
  for column in columns:
    result[column.idx] = newVector(column.kind)

  for chunk in qresult.chunks:
    for column in columns:
      result[column.idx] &= chunk[column.idx]

proc error*(qresult: QueryResult): string =
  result = $duckdb_result_error(qresult.addr)
