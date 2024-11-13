import std/[tables, times, strformat]

import nint128
import decimal
import uuid4

import /[api]

type
  DuckString* = distinct cstring
  RootValue* = ref object of RootObj
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
    Map = enumDuckdbType.DUCKDB_TYPE_MAP.int
    UUID = enumDuckdbType.DUCKDB_TYPE_UUID.int
    Union = enumDuckdbType.DUCKDB_TYPE_UNION.int
    Bit = enumDuckdbType.DUCKDB_TYPE_BIT.int
    TimeTz = enumDuckdbType.DUCKDB_TYPE_TIME_TZ.int
    Any = enumDuckdbType.DUCKDB_TYPE_ANY.int
    VarInt = enumDuckdbType.DUCKDB_TYPE_VARINT.int
    SqlNull = enumDuckdbType.DUCKDB_TYPE_SQLNULL.int

  Value* = ref object of RootValue
    isValid*: bool
    case kind*: DuckType
    of DuckType.Invalid, DuckType.Any, DuckType.VarInt, DuckType.SqlNull:
      valueInvalid*: uint8
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
    of DuckType.Map: valueMap*: Table[string, Value]
    of DuckType.UUID: valueUUID*: Uuid
    of DuckType.Union: valueUnion*: Table[string, Value]
    of DuckType.Bit: valueBit*: string
    of DuckType.TimeTz: valueTimeTz*: ZonedTime

  Vector* = ref object of RootValue
    mask*: seq[uint64] = newSeq[uint64]()
    case kind*: DuckType
    of DuckType.Invalid, DuckType.ANY, DuckType.VARINT, DuckType.SQLNULL:
      valueInvalid*: uint8
    of DuckType.Boolean: valueBoolean*: seq[bool]
    of DuckType.TinyInt: valueTinyint*: seq[int8]
    of DuckType.SmallInt: valueSmallint*: seq[int16]
    of DuckType.Integer: valueInteger*: seq[int32]
    of DuckType.BigInt: valueBigint*: seq[int64]
    of DuckType.UTinyInt: valueUTinyint*: seq[uint8]
    of DuckType.USmallInt: valueUSmallint*: seq[uint16]
    of DuckType.UInteger: valueUInteger*: seq[uint32]
    of DuckType.UBigInt: valueUBigint*: seq[uint64]
    of DuckType.Float: valueFloat*: seq[float32]
    of DuckType.Double: valueDouble*: seq[float64]
    of DuckType.Timestamp: valueTimestamp*: seq[DateTime]
    of DuckType.Date: valueDate*: seq[DateTime]
    of DuckType.Time: valueTime*: seq[Time]
    of DuckType.Interval: valueInterval*: seq[TimeInterval]
    of DuckType.HugeInt: valueHugeint*: seq[Int128]
    of DuckType.Varchar: valueVarchar*: seq[string]
    of DuckType.Blob: valueBlob*: seq[seq[byte]]
    of DuckType.Decimal: valueDecimal*: seq[DecimalType]
    of DuckType.TimestampS: valueTimestampS*: seq[DateTime]
    of DuckType.TimestampMs: valueTimestampMs*: seq[DateTime]
    of DuckType.TimestampNs: valueTimestampNs*: seq[DateTime]
    of DuckType.Enum: valueEnum*: seq[uint]
    of DuckType.List: valueList*: seq[seq[Value]]
    of DuckType.Struct: valueStruct*: seq[Table[string, Value]]
    of DuckType.Map: valueMap*: seq[Table[string, Value]]
    of DuckType.UUID: valueUUID*: seq[Uuid]
    of DuckType.Union: valueUnion*: seq[Table[string, Value]]
    of DuckType.Bit: valueBit*: seq[string]
    of DuckType.TimeTz: valueTimeTz*: seq[ZonedTime]
    # of DuckType.TimestampTz: valueTimestampTz*: seq[tuple[timestamp: Time, timezone: string]]
    # of DuckType.UHugeInt: valueUHugeint*: seq[tuple[high: uint64, low: uint64]]
    # of DuckType.Array: valueArray*: seq[Vector]
    # of DuckType.Any: valueAny*: seq[RootRef]
    # of DuckType.VarInt: valueVarint*: seq[int]
    # of DuckType.SqlNull: valueSqlNull*: seq[bool] # SqlNull could be a boolean

  LogicalType* = object
    handle* {.cursor.}: duckdb_logical_type

  DuckValue* = object
    handle* {.cursor.}: duckdb_value

proc `=destroy`*(ltp: LogicalType) {.nodestroy.} =
  if not isNil(ltp.addr) and not isNil(ltp.handle.addr):
    duckdb_destroy_logical_type(ltp.handle.addr)

proc `=destroy`*(dv: DuckValue) {.nodestroy.} =
  if not isNil(dv.addr) and not isNil(dv.handle.addr):
    duckdb_destroy_value(dv.handle.addr)

proc `=destroy`*(dstr: DuckString) =
  if not dstr.cstring.isNil:
    duckdb_free(cast[pointer](dstr.cstring))

proc `$`*(dstr: DuckString): string =
  if dstr.cstring.isNil:
    # TODO: maybe "" instead of Nill?
    return "Nill"
  result = $dstr.cstring

#TODO: this does not work
# proc `$`*(ltp: LogicalType): string =
#   result = $DuckString(duckdb_logical_type_get_alias(ltp.handle))

proc newDuckValue*(handle: duckdb_value): DuckValue =
  result = DuckValue(handle: handle)

proc newLogicalType*(i: duckdb_logical_type): LogicalType =
  result = LogicalType(handle: i)

proc newLogicalType*(pt: DuckType): LogicalType =
  # Returns an invalid logical type, if type is: `DUCKDB_TYPE_INVALID`, `DUCKDB_TYPE_DECIMAL`, `DUCKDB_TYPE_ENUM`,
  # `DUCKDB_TYPE_LIST`, `DUCKDB_TYPE_STRUCT`, `DUCKDB_TYPE_MAP`, `DUCKDB_TYPE_ARRAY`, or `DUCKDB_TYPE_UNION`.
  # TODO: why do I need to cast it to duckdb_type, maybe from distinct
  let handle = duckdb_create_logical_type(cast[duckdb_type](pt))
  result = LogicalType(handle: handle)

proc newDuckType*(i: LogicalType): DuckType =
  let id = duckdb_get_type_id(i.handle)
  result = DuckType(ord(id))

proc newDuckType*(i: duckdb_logical_type): DuckType =
  result = newDuckType(LogicalType(handle: i))

proc newDuckType*(i: enum_DUCKDB_TYPE): DuckType =
  result = DuckType(ord(i))

# this is not ok, read this:
proc `$`*(ltp: LogicalType): string =
  result = $newDuckType(ltp)
