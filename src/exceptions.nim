import api


type
  BaseError* = object of CatchableError
  OperationError* = object of BaseError
  Error* = enumduckdbstate


converter toBool*(e: Error): bool = e != enumduckdbstate.Duckdbsuccess


template check*(error: Error, message: string): untyped =
  if error:
    raise newException(OperationError, message)