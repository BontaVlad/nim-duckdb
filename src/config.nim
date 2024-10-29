import std/[strformat, tables]
import /[api, exceptions]

type
  Config* = distinct ptr duckdbConfig
  ConfigValues* = Table[string, string]

converter toBase*(c: ptr Config): ptr duckdbConfig =
  cast[ptr duckdbConfig](c)

converter toBase*(c: Config): duckdbConfig =
  cast[duckdbConfig](c)

proc `=destroy`(conf: Config) =
  if not isNil(conf.addr):
    duckdbDestroyConfig(conf.addr)

proc setConfig*(config: Config, name: string, option: string) =
  check(
    duckdb_set_config(config, name.cstring, option.cstring),
    fmt"Unrecognized configuration option {name}",
  )

proc newConfig*(): Config =
  check(duckdb_create_config(result.addr), "Failed to create config")

proc newConfig*(values: ConfigValues): Config =
  result = newConfig()
  for key, value in values:
    result.setConfig(key, value)
