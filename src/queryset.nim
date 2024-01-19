import std/[sugar]
import /[api]


# var logger = newConsoleLogger()


type
  QuerySet* = object of duckdb_result
  DataChunk* = object of duckdbdatachunk
  PendingQueryResult* = object of duckdb_pending_result


converter toBase*(d: ptr DataChunk): ptr duckdbdatachunk = cast[ptr duckdbdatachunk](d)
converter toBase*(d: DataChunk): duckdbdatachunk = cast[duckdbdatachunk](d)

converter toBase*(p: ptr PendingQueryResult): ptr duckdb_pending_result = cast[ptr duckdb_pending_result](p)
converter toBase*(p: PendingQueryResult): duckdb_pending_result = cast[duckdb_pending_result](p)


proc `=destroy`(queryset: QuerySet) =
  if not isNil(queryset.addr):
    duckdbDestroyResult(queryset.addr)


proc `=destroy`(datachunk: DataChunk) =
    if not isNil(datachunk.addr):
      duckdbdestroydatachunk(datachunk.addr)


iterator rows*(queryset: QuerySet): seq[string] =
  let
    row_count = duckdb_row_count(queryset.addr)
    column_count = duckdb_column_count(queryset.addr)

  for row_idx in 0..<row_count:
    var row = newSeq[string](column_count)
    for col_idx in 0..<column_count:
      row[col_idx] = $duckdb_value_varchar(queryset.addr, col_idx, row_idx)
    yield row


proc fetchall*(queryset: QuerySet): seq[seq[string]] =
  result = collect(for e in queryset.rows(): e)


proc error*(queryset: QuerySet): string =
  result = $duckdb_result_error(queryset.addr)




# # https://github.com/duckdb/duckdb/blob/main/tools/juliapkg/src/vector.jl#L7
# proc chunkedRows*(outcome: Outcome): seq[string] =
#   let streaming = duckdb_result_is_streaming(outcome)
#   echo streaming
#   # while True:
#   let count = duckdb_result_chunk_count(outcome)
#   echo count
#   echo streaming
#   let chunk = duckdb_result_get_chunk(outcome, 0)
#   let cnt = duckdbdatachunkgetcolumncount(chunk)
#   echo cnt
#   let vect = duckdb_data_chunk_get_vector(chunk, 0)
#   echo repr vect
#   let re = duckdb_vector_get_data(vect)
#   echo repr re
#   result = @[]
#   # result = duckdb_result_get_chunk(outcome.addr, 0)
#   # let
#   #   row_count = duckdb_row_count(outcome.addr)
#   #   column_count = duckdb_column_count(outcome.addr)
#   #   datachunk = duckdb_create_data_chunk(column_count)
#   #   count = duckdb_data_chunk_get_size(outcome.addr).int
#   #   columnCount = duckdb_data_chunk_get_size(outcome.addr).int


# # inal class DataChunk {

# #   var count: DBInt { duckdb_data_chunk_get_size(ptr.pointee) }
# #   var columnCount: DBInt { duckdb_data_chunk_get_column_count(ptr.pointee) }

# #   private let ptr = UnsafeMutablePointer<duckdb_data_chunk?>.allocate(capacity: 1)

# #   init(result: ResultSet, index: DBInt) {
# #     self.ptr.pointee = result.withCResult { duckdb_result_get_chunk($0.pointee, index)! }
# #   }

# #   deinit {
# #     duckdb_destroy_data_chunk(ptr)
# #     ptr.deallocate()
# #   }

# #   func withVector<T>(at index: DBInt, _ body: (Vector) throws -> T) rethrows -> T {
# #     try body(Vector(duckdb_data_chunk_get_vector(ptr.pointee, index), count: Int(count)))
# #   }
# # }
