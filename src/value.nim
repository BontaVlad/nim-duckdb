import std/[sugar, tables, times, math, strformat, logging]
import nint128
import decimal

import /[api, logger]

type
  DuckType* {.pure.} = enum
    Invalid = enumDuckdbType.DUCKDB_TYPE_INVALID.int
    Boolean = enumDuckdbType.DUCKDB_TYPE_BOOLEAN.int
    TinyInt = enumDuckdbType.DUCKDB_TYPE_TINYINT.int
    SmallInt = enumDuckdbType.DUCKDB_TYPE_SMALLINT.int
    Integer = enumDuckdbType.DUCKDB_TYPE_INTEGER.int
    BigInt = enumDuckdbType.DUCKDB_TYPE_BIGINT.int
    UTinyInt = enumDuckdbType.DUCKDB_TYPE_UTINYINT.int
    USmallInt = enumDuckdbType.DUCKDB_TYPE_USMALLINT.int
    UInteger = enumDuckdbType.DUCKDB_TYPE_UINTEGER.int
    UBigInt = enumDuckdbType.DUCKDB_TYPE_UBIGINT.int
    Float = enumDuckdbType.DUCKDB_TYPE_FLOAT.int
    Double = enumDuckdbType.DUCKDB_TYPE_DOUBLE.int
    Timestamp = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP.int
    Date = enumDuckdbType.DUCKDB_TYPE_DATE.int
    Time = enumDuckdbType.DUCKDB_TYPE_TIME.int
    Interval = enumDuckdbType.DUCKDB_TYPE_INTERVAL.int
    HugeInt = enumDuckdbType.DUCKDB_TYPE_HUGEINT.int
    Varchar = enumDuckdbType.DUCKDB_TYPE_VARCHAR.int
    Blob = enumDuckdbType.DUCKDB_TYPE_BLOB.int
    Decimal = enumDuckdbType.DUCKDB_TYPE_DECIMAL.int
    TimestampS = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP_S.int
    TimestampMs = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP_MS.int
    TimestampNs = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP_NS.int
    Enum = enumDuckdbType.DUCKDB_TYPE_ENUM.int
    List = enumDuckdbType.DUCKDB_TYPE_LIST.int
    Struct = enumDuckdbType.DUCKDB_TYPE_STRUCT.int

  Value* = object
    isValid: bool
    case kind*: DuckType
    of DuckType.Invalid: valueInvalid*: uint8
    of DuckType.Boolean: valueBoolean*: bool
    of DuckType.TinyInt: valueTinyint*: int8
    of DuckType.SmallInt: valueSmallint*: int16
    of DuckType.Integer: valueInteger*: int32
    of DuckType.BigInt: valueBigint*: int64
    of DuckType.UTinyInt: valueUTinyint*: uint8
    of DuckType.USmallInt: valueUSmallint*: uint16
    of DuckType.UInteger: valueUInteger*: uint32
    of DuckType.UBigInt: valueUBigint*: uint64
    of DuckType.Float: valueFloat*: float32
    of DuckType.Double: valueDouble*: float64
    of DuckType.Timestamp: valueTimestamp*: DateTime
    of DuckType.Date: valueDate*: DateTime
    of DuckType.Time: valueTime*: Time
    of DuckType.Interval: valueInterval*: TimeInterval
    of DuckType.HugeInt: valueHugeint*: Int128
    of DuckType.Varchar: valueVarchar*: string
    of DuckType.Blob: valueBlob*: seq[byte]
    of DuckType.Decimal: valueDecimal*: DecimalType
    of DuckType.TimestampS: valueTimestampS*: DateTime
    of DuckType.TimestampMs: valueTimestampMs*: DateTime
    of DuckType.TimestampNs: valueTimestampNs*: DateTime
    of DuckType.Enum: valueEnum*: uint
    of DuckType.List: valueList*: seq[Value]
    of DuckType.Struct: valueStruct*: Table[string, Value]

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
  else:
    raise newException(
      ValueError, "Expected DuckType.Struct for Table[string, Value] value"
    )

# Default constructor for Invalid type
proc newValue*(kind: DuckType, isValid: bool): Value =
  result = Value(kind: kind, isValid: isValid)
  if kind == DuckType.Invalid:
    result.valueInvalid = 0
  else:
    raise newException(ValueError, "Expected DuckType.Invalid for default value")

proc `$`*(v: Value): string =
  if not v.isValid:
    return "Invalid Value"

  case v.kind
  of DuckType.Invalid:
    result = "Invalid DuckType"
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
  of DuckType.Timestamp, DuckType.TimestampS, DuckType.TimestampMs, DuckType.TimestampNs:
    result = $v.valueTimestamp
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
    result = fmt"Blob: [{v.valueBlob.len} bytes]"
  of DuckType.Decimal:
    result = $v.valueDecimal
  of DuckType.Enum:
    result = $v.valueEnum
  of DuckType.List:
    result = $v.valueList
  of DuckType.Struct:
    result = $v.valueStruct
