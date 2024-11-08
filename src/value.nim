import std/[tables, times, math]
import nint128
import decimal

import /[types]

proc `$`*(v: Value): string =
  if not v.isValid:
    return "Invalid Value"

  case v.kind
  of DuckType.Invalid:
    raise newException(ValueError, "got invalid type")
  of DuckType.Boolean:
    result = $v.valueBoolean
  of DuckType.TinyInt:
    result = $v.valueTinyint
  of DuckType.SmallInt:
    result = $v.valueSmallint
  of DuckType.Integer:
    result = $v.valueInteger
  of DuckType.BigInt:
    result = $v.valueBigint
  of DuckType.UTinyInt:
    result = $v.valueUTinyint
  of DuckType.USmallInt:
    result = $v.valueUSmallint
  of DuckType.UInteger:
    result = $v.valueUInteger
  of DuckType.UBigInt:
    result = $v.valueUBigint
  of DuckType.Float:
    result = $v.valueFloat
  of DuckType.Double:
    result = $v.valueDouble
  of DuckType.Timestamp:
    result = $v.valueTimestamp
  of DuckType.TimestampS:
    result = $v.valueTimestampS
  of DuckType.TimestampMs:
    result = $v.valueTimestampMs
  of DuckType.TimestampNs:
    result = $v.valueTimestampNs
  of DuckType.Date:
    result = $v.valueDate
  of DuckType.Time:
    result = $v.valueTime
  of DuckType.Interval:
    result = $v.valueInterval
  of DuckType.HugeInt:
    result = $v.valueHugeint
  of DuckType.Varchar:
    result = v.valueVarchar
  of DuckType.Blob:
    result = $v.valueBlob
  of DuckType.Decimal:
    result = $v.valueDecimal
  of DuckType.Enum:
    result = $v.valueEnum
  of DuckType.List:
    result = $v.valueList
  of DuckType.Struct:
    result = $v.valueStruct
  of DuckType.Map:
    result = $v.valueMap

proc newValue*(kind: DuckType, isValid: bool, val: bool): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Boolean:
    result.valueBoolean = val
  else:
    raise newException(ValueError, "Expected DuckType.Boolean for boolean value")

proc newValue*(kind: DuckType, isValid: bool, val: int8): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.TinyInt:
    result.valueTinyint = val
  else:
    raise newException(ValueError, "Expected DuckType.TinyInt for int8 value")

proc newValue*(kind: DuckType, isValid: bool, val: int16): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.SmallInt:
    result.valueSmallint = val
  else:
    raise newException(ValueError, "Expected DuckType.SmallInt for int16 value")

proc newValue*(kind: DuckType, isValid: bool, val: int32): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Integer:
    result.valueInteger = val
  else:
    raise newException(ValueError, "Expected DuckType.Integer for int32 value")

proc newValue*(kind: DuckType, isValid: bool, val: int64): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.BigInt:
    result.valueBigint = val
  else:
    raise newException(ValueError, "Expected DuckType.BigInt for int64 value")

proc newValue*(kind: DuckType, isValid: bool, lower, upper: uint64): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.HugeInt:
    result.valueHugeint = add64Plus64ToI128(lower, (upper shl 64))
  else:
    raise newException(ValueError, "Expected DuckType.HugeInt for int64 value")

proc newValue*(kind: DuckType, isValid: bool, val: uint8): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.UTinyInt:
    result.valueUTinyint = val
  else:
    raise newException(ValueError, "Expected DuckType.UTinyInt for uint8 value")

proc newValue*(kind: DuckType, isValid: bool, val: uint16): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.USmallInt:
    result.valueUSmallint = val
  else:
    raise newException(ValueError, "Expected DuckType.USmallInt for uint16 value")

proc newValue*(kind: DuckType, isValid: bool, val: uint32): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.UInteger:
    result.valueUInteger = val
  else:
    raise newException(ValueError, "Expected DuckType.UInteger for uint32 value")

proc newValue*(kind: DuckType, isValid: bool, val: uint64): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.UBigInt:
    result.valueUBigint = val
  else:
    raise newException(ValueError, "Expected DuckType.UBigInt for uint64 value")

proc newValue*(kind: DuckType, isValid: bool, val: float32): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Float:
    result.valueFloat = val
  else:
    raise newException(ValueError, "Expected DuckType.Float for float32 value")

proc newValue*(kind: DuckType, isValid: bool, val: float64): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Double:
    result.valueDouble = val
  else:
    raise newException(ValueError, "Expected DuckType.Double for float64 value")

proc newValue*(kind: DuckType, isValid: bool, val: DateTime): Value =
  result = Value(kind: kind, isValid: isValid)
  case kind
  of DuckType.Timestamp, DuckType.TimestampS, DuckType.TimestampMs, DuckType.TimestampNs:
    result.valueTimestamp = val
  of DuckType.Date:
    result.valueDate = val
  else:
    raise newException(
      ValueError, "Expected DuckType.Timestamp, Date, or Timestamp variants"
    )

proc newValue*(kind: DuckType, isValid: bool, val: Time): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Time:
    result.valueTime = val
  else:
    raise newException(ValueError, "Expected DuckType.Time for Time value")

proc newValue*(kind: DuckType, isValid: bool, val: TimeInterval): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Interval:
    result.valueInterval = val
  else:
    raise newException(ValueError, "Expected DuckType.Interval for TimeInterval value")

proc newValue*(kind: DuckType, isValid: bool, val: string): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Varchar:
    result.valueVarchar = val
  else:
    raise newException(ValueError, "Expected DuckType.Varchar for string value")

proc newValue*(kind: DuckType, isValid: bool, val: seq[byte]): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Blob:
    result.valueBlob = val
  else:
    raise newException(ValueError, "Expected DuckType.Blob for seq[byte] value")

proc newValue*(kind: DuckType, isValid: bool, val: DecimalType): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Decimal:
    result.valueDecimal = val
  else:
    raise newException(ValueError, "Expected DuckType.Decimal for DecimalType value")

proc newValue*(kind: DuckType, isValid: bool, val: uint): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Enum:
    result.valueEnum = val
  else:
    raise newException(ValueError, "Expected DuckType.Enum for uint value")

proc newValue*(kind: DuckType, isValid: bool, val: seq[Value]): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.List:
    result.valueList = val
  else:
    raise newException(ValueError, "Expected DuckType.List for seq[Vector] value")

proc newValue*(kind: DuckType, isValid: bool, val: Table[string, Value]): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Struct:
    result.valueStruct = val
  elif kind == DuckType.Map:
    result.valueMap = val
  else:
    raise newException(
      ValueError, "Expected DuckType.Struct or Map for Table[string, Value] value"
    )

# Default constructor for Invalid type
proc newValue*(kind: DuckType, isValid: bool): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Invalid:
    result.valueInvalid = 0
  else:
    raise newException(ValueError, "Expected DuckType.Invalid for default value")
