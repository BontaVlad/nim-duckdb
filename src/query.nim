import std/[strformat]
import /[api, database, queryset, exceptions]


type
  Query* = distinct string
  Statement = object of duckdbPreparedStatement
  Appender = object of duckdbAppender


converter toBase(s: ptr Statement): ptr duckdbPreparedStatement = cast[ptr duckdbPreparedStatement](s)
converter toBase(s: Statement): duckdbPreparedStatement = cast[duckdbPreparedStatement](s)

converter toBase*(a: ptr Appender): ptr duckdbappender = cast[ptr duckdbappender](a)
converter toBase*(a: Appender): duckdbappender = cast[duckdbappender](a)

converter toBase*(q: Query): cstring = q.cstring
converter toBase*(s: string): Query = Query(s)


proc `=destroy`(appender: Appender) =
  if not isNil(appender.addr):
    discard duckdbAppenderDestroy(appender.addr)


proc `=destroy`(statement: Statement) =
  if not isNil(statement.addr):
    duckdbDestroyPrepare(statement.addr)


proc execWithoutArgs*(con: Connection, query: Query): QuerySet =
  check(duckdbQuery(con, query, result.addr), result.error)


proc execWithArgs*(con: Connection, query: Query, args: varargs[string, `$`]): QuerySet =
  var statement: Statement
  check(duckdbPrepare(con, query, statement.addr), "Failed to create prepared statement")

  for i, arg in args:
    check(duckdbBindVarchar(statement, (i + 1).idx_t, arg.cstring), "Failed to bind char")
  check(duckdbExecutePrepared(statement, result.addr), result.error)


proc execute*(con: Connection, query: Query, args: varargs[string, `$`]): QuerySet {.discardable.}=
  if args.len() == 0:
    result = con.execWithoutArgs(query)
  else:
    result = con.execWithArgs(query, args)

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
