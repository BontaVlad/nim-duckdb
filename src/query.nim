import std/[strformat, logging]
import /[api, database, query_result, exceptions]


var logger = newConsoleLogger()


type
  Query* = distinct string
  Statement = object of duckdbPreparedStatement
  Appender = object of duckdbAppender


converter toBase*(s: ptr Statement): ptr duckdbPreparedStatement = cast[ptr duckdbPreparedStatement](s)
converter toBase*(s: Statement): duckdbPreparedStatement = cast[duckdbPreparedStatement](s)

converter toBase*(a: ptr Appender): ptr duckdbappender = cast[ptr duckdbappender](a)
converter toBase*(a: Appender): duckdbappender = cast[duckdbappender](a)

converter toBase*(q: Query): cstring = q.cstring
converter toBase*(s: string): Query = Query(s)


# duckdb_bind_internal(stmt::Stmt, i::Integer, val::Date) = duckdb_bind_date(stmt.handle, i, value_to_duckdb(val));
# duckdb_bind_internal(stmt::Stmt, i::Integer, val::Time) = duckdb_bind_time(stmt.handle, i, value_to_duckdb(val));
# duckdb_bind_internal(stmt::Stmt, i::Integer, val::DateTime) =
#     duckdb_bind_timestamp(stmt.handle, i, value_to_duckdb(val));
# duckdb_bind_internal(stmt::Stmt, i::Integer, val::Missing) = duckdb_bind_null(stmt.handle, i);
# duckdb_bind_internal(stmt::Stmt, i::Integer, val::Nothing) = duckdb_bind_null(stmt.handle, i);
# duckdb_bind_internal(stmt::Stmt, i::Integer, val::AbstractString) = duckdb_bind_varchar(stmt.handle, i, val);
# duckdb_bind_internal(stmt::Stmt, i::Integer, val::Vector{UInt8}) = duckdb_bind_blob(stmt.handle, i, val, sizeof(val));
# duckdb_bind_internal(stmt::Stmt, i::Integer, val::WeakRefString{UInt8}) =
#     duckdb_bind_varchar(stmt.handle, i, val.ptr, val.len);

template bind_val(statement: Statement, i: idx_t, val: bool): Error = duckdb_bind_bool(statement, i, val)
template bind_val(statement: Statement, i: idx_t, val: int8): Error = duckdb_bind_int8(statement, i, val)
template bind_val(statement: Statement, i: idx_t, val: int16): Error = duckdb_bind_int16(statement, i, val)
template bind_val(statement: Statement, i: idx_t, val: int32): Error = duckdb_bind_int32(statement, i, val)
template bind_val(statement: Statement, i: idx_t, val: int64): Error = duckdb_bind_int64(statement, i, val)
template bind_val(statement: Statement, i: idx_t, val: int): Error = duckdb_bind_int64(statement, i, int64(val))
template bind_val(statement: Statement, i: idx_t, val: uint8): Error = duckdb_bind_uint8(statement, i, val)
template bind_val(statement: Statement, i: idx_t, val: uint16): Error = duckdb_bind_uint16(statement, i, val)
template bind_val(statement: Statement, i: idx_t, val: uint32): Error = duckdb_bind_uint32(statement, i, val)
template bind_val(statement: Statement, i: idx_t, val: uint64): Error = duckdb_bind_uint64(statement, i, val)
template bind_val(statement: Statement, i: idx_t, val: float32): Error = duckdb_bind_float(statement, i, val)
template bind_val(statement: Statement, i: idx_t, val: float64): Error = duckdb_bind_double(statement, i, val)



proc `=destroy`(appender: Appender) =
  if not isNil(appender.addr):
    discard duckdbAppenderDestroy(appender.addr)


proc `=destroy`(statement: Statement) =
  if not isNil(statement.addr):
    duckdbDestroyPrepare(statement.addr)


proc newStatement*(con: Connection, query: Query): Statement =
  logger.log(lvlDebug, fmt"Creating statement {query}")
  check(duckdbPrepare(con, query, result.addr), "Failed to create prepared statement")


proc execute*[T](con: Connection, statement: Statement, args: openArray[T]): QueryResult {.discardable.} =
  logger.log(lvlDebug, fmt"Executing {statement} with {args}")
  for i, arg in args:
    check(bind_val(statement, (i + 1).idx_t, arg), "Failed to bind char")
  check(duckdbExecutePrepared(statement, result.addr), result.error)


proc execute*(con: Connection, statement: Statement, args: varargs[string, `$`]): QueryResult {.discardable.} =
  logger.log(lvlDebug, fmt"Executing {statement} with {args}")
  for i, arg in args:
    check(duckdbBindVarchar(statement, (i + 1).idx_t, arg.cstring), "Failed to bind char")
  check(duckdbExecutePrepared(statement, result.addr), result.error)


proc execute*(con: Connection, query: Query): QueryResult {.discardable.}=
  check(duckdbQuery(con, query, result.addr), result.error)


proc execute*[T](con: Connection, query: Query, args: openArray[T]): QueryResult {.discardable.}=
  let statement = newStatement(con, query)
  result = con.execute(statement, args)




# proc append(appender: Appender, val::Nothing) = duckdb_append_null(appender.handle)
# proc append(appender: Appender, val::Missing) = duckdb_append_null(appender.handle)
# proc append(appender: Appender, val::Nothing) = duckdb_append_null(appender.handle)
# proc append(appender: Appender, val::AbstractString) = duckdb_append_varchar(appender.handle, val);
# proc append(appender: Appender, val::Vector{UInt8}) = duckdb_append_blob(appender.handle, val, sizeof(val));
# proc append(appender: Appender, val::WeakRefString{UInt8}) = duckdb_append_varchar(stmt.handle, i, val.ptr, val.len);


template append(appender: Appender, val: bool): Error = duckdb_append_bool(appender, val)
template append(appender: Appender, val: int8): Error = duckdb_append_int8(appender, val)
template append(appender: Appender, val: int16): Error = duckdb_append_int16(appender, val)
template append(appender: Appender, val: int32): Error = duckdb_append_int32(appender, val)
template append(appender: Appender, val: int64): Error = duckdb_append_int64(appender, val)
template append(appender: Appender, val: int): Error = duckdb_append_int64(appender, int64(val))
template append(appender: Appender, val: uint8): Error = duckdb_append_uint8(appender, val)
template append(appender: Appender, val: uint16): Error = duckdb_append_uint16(appender, val)
template append(appender: Appender, val: uint32): Error = duckdb_append_uint32(appender, val)
template append(appender: Appender, val: uint64): Error = duckdb_append_uint64(appender, val)
template append(appender: Appender, val: float32): Error = duckdb_append_float(appender, val)
template append(appender: Appender, val: float64): Error = duckdb_append_double(appender, val)


template append(appender: Appender, val: string): Error =
  if val == "":
    duckdb_append_null(appender)
  else:
    duckdb_append_varchar(appender, val.cstring)


template append(appender: Appender, val: void): Error =
  duckdb_append_null(appender)


template append(appender: Appender, val: auto): Error =
    raise newException(ValueError, "I have no ideea how to convert val, got: ", $val)


proc newAppender(con: Connection, table: string): Appender =
  check(duckdb_appender_create(con, nil, table.cstring, result.addr), "Failed to create appender")


proc appender*[T](con: Connection, table: string, ent: seq[seq[T]]) =
  var appender = newAppender(con, table)
  for row in ent:
    for val in row:
      check(appender.append(val), fmt"Failed to append: {val}")
    check(duckdb_appender_end_row(appender), "Failed to end row on appender")
