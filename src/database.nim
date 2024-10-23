import std/[logging]

import /[api, config, exceptions, logger]


type
  Database* = object of duckdb_database
  Connection* = object of duckdb_connection


converter toBase*(d: Database): duckdb_database = cast[duckdb_database](d)
converter toBase*(d: ptr Database): ptr duckdb_database = cast[ptr duckdb_database](d)

converter toBase*(c: Connection): duckdb_connection = cast[duckdb_connection](c)
converter toBase*(c: ptr Connection): ptr duckdb_connection = cast[ptr duckdb_connection](c)


# This might be a problem, closing the database but not the connection
proc `=destroy`(db: var Database) =
  consoleLogger.log(lvlDebug, "Closing the database")
  if not isNil(db.addr):
    duckdb_close(db.addr)


proc `=destroy`(con: var Connection) =
  consoleLogger.log(lvlDebug, "Disconnecting")
  if not isNil(con.addr):
    duckdb_disconnect(con.addr)


proc connect*(path: string): Connection =
  let db = DataBase()
  check(duckdbOpen(path.cstring, db.addr), "Failed to open database")
  check(duckdbConnect(db, result.addr), "Failed to connect to database")


proc connect*(path: string, config: Config): Connection =
  let db = DataBase()
  var error: cstring
  let state = duckdbOpenExt(path.cstring, db.addr, config, error.addr)
  check(state, $error)
  check(duckdbConnect(db, result.addr), "Failed to connect to database")


proc connect*(config: Config): Connection =
  connect(":memory:", config)

proc connect*(): Connection =
  connect(":memory:")
