import futhark


when  defined(useFuthark):
  # Tell futhark where to find the C libraries you will compile with, and what
  # header files you wish to import.
  importc:
    path "lib"
    "duckdb.h"

  {.passL: "-lduckdb".}
else:
  include "/home/vlad/.cache/nim/duckdb_d/futhark_913899250E75DDB5.nim"

type
  BaseError* = object of CatchableError
  OperationError* = object of BaseError
  Error* = enumduckdbstate
  Database* = object of duckdb_database
  Connection* = object of duckdb_connection
  Outcome* = object of duckdb_result


converter toBase(d: ptr Database): ptr duckdb_database = cast[ptr duckdb_database](d)
converter toBase(d: Database): duckdb_database = cast[duckdb_database](d)
converter toBase(c: Connection): duckdb_connection = cast[duckdb_connection](c)
converter toBase(c: ptr Connection): ptr duckdb_connection = cast[ptr duckdb_connection](c)
converter toBool(e: Error): bool = e != enumduckdbstate.Duckdbsuccess
converter toBase(o: ptr Outcome): ptr duckdb_result = cast[ptr duckdb_result](o)


proc `=destroy`(db: Database) =
  if not isNil(db.addr):
    echo "Clossing"
    duckdb_close(db.addr)


proc `=destroy`(con: Connection) =
  if not isNil(con.addr):
    echo "Disconnecting"
    duckdb_disconnect(con.addr)


proc `=destroy`(outcome: Outcome) =
  if not isNil(outcome.addr):
    echo "Cleanning out result"
    duckdbDestroyResult(outcome.addr)


proc connect*(path: string): Connection =
  var
    db: Database
    error = duckdbOpen(path.cstring, db.addr)

  if error:
    raise newException(OperationError, "Failed to open database")

  error = duckdbConnect(db, result.addr)
  if error:
    raise newException(OperationError, "Failed to connect to database")


proc connect*(): Connection =
  connect(":memory:")


proc getErrorMessage(outcome: Outcome): string =
  result = $duckdb_result_error(outcome.addr)


proc exec*(con: Connection, sqlQuery: string): Outcome =
  let error = duckdbQuery(con, sqlQuery.cstring, result.addr)
  if error:
    raise newException(OperationError, getErrorMessage(result))


echo duckdblibraryversion()
let con = connect()


let outcome = con.exec("CREATE TABLE integers(i INTEGER, j INTEGER);")
let outcome2 = con.exec("INSERT INTO integers VALUES (6, 4), (5, 6), (7, NULL);")
let outcome3 = con.exec("SELECT * FROM integers")

let
  row_count = duckdb_row_count(outcome3.addr)
  column_count = duckdb_column_count(outcome3.addr)

for row in 0..<row_count:
  for col in 0..<column_count:
    echo $duckdb_value_varchar(outcome3.addr, col, row)


let outcome_error = con.exec("CREATE throwError integers(i INTEGER, j INTEGER);")















# proc close*(database: duckdbDatabase) =
#   ## Closes a duckDB database.
#   duckdbClose(database.addr)


# proc disconnect*(connection: duckDbConnection) =
#   ## Disconnects the connection to a duckDB database.
#   duckdbDisconnect(connection.addr)


# proc `=destroy`(statement: PreparedStatement) =
#   if not isNil(statement.statement):
#     duckdbDestroyPrepare(statement.statement.addr)

# proc `=destroy`(varchar: ValueVarchar) =
#   if not isNil(varchar.varchar):
#     duckdbFree(varchar.varchar)

# proc `=destroy`(appender: Appender) =
#   if not isNil(appender.appender):
#     discard duckdbAppenderDestroy(appender.appender.addr)



# proc connect*(path: string): Session =
#   ## Opens a DuckDB database
#   ## `path` is the path of the output DuckDB. Set to ":memory:" to open an in-memory database.
#   let has_opened = duckdbOpen(path.cstring, result.database.addr)
#   checkStateSuccessful(has_opened)
#   let has_connected = duckdbConnect(result.database, result.connection.addr)
#   checkStateSuccessful(has_connected)

# proc connect*(): Session =
#   ## Opens an in-memory DuckDB database.
#   result = connect(":memory:")


# converter fromBase(r: duckdbresult): Outcome = cast[Outcome](r)

# proc newOutcome(): Outcome =
#   var duck: duckdbresult
#   result = Outcome(duck)

# proc execWithoutArgs(session: Session, sqlQuery: string) =
#   ## Executes a SQL query to a duckDB database.
#   var foo: duckdbresult
#   var outcome = newOutcome()
#   var bar = Outcome(foo)
#   echo repr foo.addr
#   echo repr outcome.addr
#   echo repr bar.addr
#   echo repr outcome.toBase()
#   var baz = outcome.toBase()
#   var
#     state = duckdbQuery(session.connection.toBase(), sqlQuery.cstring, baz)

#   let errorMessage = duckdbResultError(baz)
#   echo errorMessage
#   checkStateSuccessful(state, outcome)


# proc execWithArgs(session: Session, sqlQuery: string, args: varargs[string, `$`]) =
#   discard
#   # ## Executes a SQL query to a duckDB database.
#   # var statement = DuckDBPreparedStatement()

#   # # Create prepared statement
#   # let state1 = duckdbPrepare(conn.connection, sqlQuery.cstring, statement.statement.addr)
#   # checkStateSuccessful(state1, statement)

#   # # Parse prepared statement
#   # for i, arg in args:
#   #   let state2 = duckdbBindVarchar(statement.statement, (i + 1).idx_t, arg.cstring)
#   #   checkStateSuccessful(state2)

#   # # Result handler
#   # let result = DuckDBResult()
#   # let state3 = duckdbExecutePrepared(statement.statement, result.result)
#   # checkStateSuccessful(state3, result)


# proc exec*(session: Session, sqlQuery: string, args: varargs[string, `$`]) =
#   if args.len() == 0: session.execWithoutArgs(sqlQuery)
#   else: session.execWithArgs(sqlQuery, args)
#
#
# iterator getRows(result: DuckDBResult): DuckDBRow =
#   var rowCount = result.result.unsafeAddr.duckdbRowCount()
#   var columnCount = result.result.unsafeAddr.duckdbColumnCount()
#   var duckDBRow = newSeq[string](columnCount)
#   for idxRow in 0..<rowCount:
#     for idxCol in 0..<columnCount:
#       var varchar = DuckDBValueVarchar(varchar: duckdbValueVarchar(result.result.unsafeAddr, idxCol, idxRow))
#       duckDBRow[idxCol] = (
#         if varchar.varchar.isNil():
#           "NULL"
#         else:
#           $varchar.varchar
#       )
#     yield duckDBRow


# proc exec*(con: Connection, sqlQuery: string, args: varargs[string, `$`]) =
#   discard

#   ## Executes a SQL query to a duckDB database.
#   var foo: duckdbresult
#   var outcome = newOutcome()
#   var bar = Outcome(foo)
#   echo repr foo.addr
#   echo repr outcome.addr
#   echo repr bar.addr
#   echo repr outcome.toBase()
#   var baz = outcome.toBase()
#   var
#     state = duckdbQuery(session.connection.toBase(), sqlQuery.cstring, baz)

#   let errorMessage = duckdbResultError(baz)
#   echo errorMessage
#   checkStateSuccessful(state, outcome)
  # if args.len() == 0: session.execWithoutArgs(sqlQuery)
  # else: session.execWithArgs(sqlQuery, args)
  #
# duckdb_state duckdb_query(duckdb_connection connection, const char *query, duckdb_result *out_result);
# void duckdb_destroy_result(duckdb_result *result);
# const char *duckdb_column_name(duckdb_result *result, idx_t col);
# duckdb_type duckdb_column_type(duckdb_result *result, idx_t col);
# duckdb_logical_type duckdb_column_logical_type(duckdb_result *result, idx_t col);
# idx_t duckdb_column_count(duckdb_result *result);
# idx_t duckdb_row_count(duckdb_result *result);
# idx_t duckdb_rows_changed(duckdb_result *result);
# void *duckdb_column_data(duckdb_result *result, idx_t col);
# bool *duckdb_nullmask_data(duckdb_result *result, idx_t col);
# const char *duckdb_result_error(duckdb_result *result);
