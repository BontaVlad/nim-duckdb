import std/[strformat]
import /[api, exceptions]


type
  Config*  = object of duckdbConfig

converter toBase*(c: ptr Config): ptr duckdbConfig = cast[ptr duckdbConfig](c)
converter toBase*(c: Config): duckdbConfig = cast[duckdbConfig](c)


proc `=destroy`(conf: Config) =
  if not isNil(conf.addr):
    duckdbDestroyConfig(conf.addr)


proc newConfig*(): Config =
  var handle: Config
  result = cast[Config](duckdb_create_config(handle.addr))


proc setConfig*(config: Config, name: string, option: string) =
  check(duckdb_set_config(config, name.cstring, option.cstring), fmt"Unrecognized configuration option {name}")
