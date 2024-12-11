import std/[macros, tables, times, typetraits, strutils, strformat, sugar, sequtils]

import nint128
import decimal
import uuid4

import /[api]

const
  BITS_PER_VALUE* = 64
  STRING_INLINE_LENGTH* = 12
  SECONDS_PER_DAY* = 86400

type
  ValidityMask = distinct seq[uint64]
  QueryResult* = object of duckdbResult
  PendingQueryResult* = object of duckdbPendingResult

  DuckType* {.pure.} = enum
    Invalid = enumDuckdbType.DUCKDB_TYPE_INVALID
    Boolean = enumDuckdbType.DUCKDB_TYPE_BOOLEAN
    TinyInt = enumDuckdbType.DUCKDB_TYPE_TINYINT
    SmallInt = enumDuckdbType.DUCKDB_TYPE_SMALLINT
    Integer = enumDuckdbType.DUCKDB_TYPE_INTEGER
    BigInt = enumDuckdbType.DUCKDB_TYPE_BIGINT
    UTinyInt = enumDuckdbType.DUCKDB_TYPE_UTINYINT
    USmallInt = enumDuckdbType.DUCKDB_TYPE_USMALLINT
    UInteger = enumDuckdbType.DUCKDB_TYPE_UINTEGER
    UBigInt = enumDuckdbType.DUCKDB_TYPE_UBIGINT
    Float = enumDuckdbType.DUCKDB_TYPE_FLOAT
    Double = enumDuckdbType.DUCKDB_TYPE_DOUBLE
    Timestamp = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP
    Date = enumDuckdbType.DUCKDB_TYPE_DATE
    Time = enumDuckdbType.DUCKDB_TYPE_TIME
    Interval = enumDuckdbType.DUCKDB_TYPE_INTERVAL
    HugeInt = enumDuckdbType.DUCKDB_TYPE_HUGEINT
    Varchar = enumDuckdbType.DUCKDB_TYPE_VARCHAR
    Blob = enumDuckdbType.DUCKDB_TYPE_BLOB
    Decimal = enumDuckdbType.DUCKDB_TYPE_DECIMAL
    TimestampS = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP_S
    TimestampMs = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP_MS
    TimestampNs = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP_NS
    Enum = enumDuckdbType.DUCKDB_TYPE_ENUM
    List = enumDuckdbType.DUCKDB_TYPE_LIST
    Struct = enumDuckdbType.DUCKDB_TYPE_STRUCT
    Map = enumDuckdbType.DUCKDB_TYPE_MAP
    UUID = enumDuckdbType.DUCKDB_TYPE_UUID
    Union = enumDuckdbType.DUCKDB_TYPE_UNION
    Bit = enumDuckdbType.DUCKDB_TYPE_BIT
    TimeTz = enumDuckdbType.DUCKDB_TYPE_TIME_TZ
    Any = enumDuckdbType.DUCKDB_TYPE_ANY
    VarInt = enumDuckdbType.DUCKDB_TYPE_VARINT
    SqlNull = enumDuckdbType.DUCKDB_TYPE_SQLNULL

  ValueBase = object of RootObj
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

  Value* = ref object of ValueBase

  Vector* = ref object
    mask*: ValidityMask
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

  LogicalTypeBase = object of RootObj
    handle*: duckdb_logical_type

  LogicalType* = ref object of LogicalTypeBase

  Column* = object
    idx*: int
    name*: string
    kind*: DuckType
    logicalType*: LogicalType

  DataChunkBase = object of RootObj
    handle*: duckdbDataChunk
    columns*: seq[Column]
    shouldDestroy: bool

  DataChunk* = ref object of DataChunkBase


proc `=destroy`(d: DataChunkBase) =
  if not isNil(d.addr) and not isNil(d.handle.addr) and d.shouldDestroy:
    duckdbdestroydatachunk(d.handle.addr)

proc `=copy`(a: var DataChunkBase, b: DataChunkBase) {.error.}

proc `=destroy`*(ltp: LogicalTypeBase) =
  if not isNil(ltp.addr) and not isNil(ltp.handle.addr):
    duckdb_destroy_logical_type(ltp.handle.addr)

proc `=destroy`(qresult: QueryResult) =
  if not isNil(qresult.addr):
    duckdbDestroyResult(qresult.addr)

# converter toCPtr*(d: ptr DataChunk): ptr duckdbDataChunk =
#   cast[ptr duckDbDataChunk](d)

proc newDataChunk*(handle: duckdb_data_chunk, shouldDestroy: bool=true): DataChunk =
  result = DataChunk(handle: handle, shouldDestroy: shouldDestroy)

proc newDataChunk*(handle: duckdb_data_chunk, columns: seq[Column], shouldDestroy: bool=true): DataChunk =
  result = DataChunk(handle: handle, columns: columns, shouldDestroy: shouldDestroy)

proc newDataChunk*(columns: seq[Column], shouldDestroy: bool=true): DataChunk =
  let types = columns.map(c => c.logicalType.handle)
  let chunk = duckdb_create_data_chunk(cast[ptr duckdb_logical_type](types[0].addr), len(columns).idx_t)
  result = newDataChunk(chunk, columns, shouldDestroy)

proc newDataChunk*(qresult: QueryResult, columns: seq[Column], shouldDestroy: bool=true): DataChunk =
  result = newDataChunk(duckdb_stream_fetch_chunk(qresult), columns, shouldDestroy)

proc newDataChunk*(qresult: QueryResult, idx: idxt, columns: seq[Column], shouldDestroy: bool=true): DataChunk =
  result = newDataChunk(duckdb_result_get_chunk(qresult, idx), columns, shouldDestroy)

converter toC*(d: DataChunk): duckdbdatachunk =
  d.handle

# converter toNim*(d: duckdbdatachunk): DataChunk =
#   cast[DataChunk](d)

converter toBool*(d: DataChunk): bool =
  not isNil(d) or duckdbdatachunkgetsize(d).int > 0

converter toBase*(p: ptr PendingQueryResult): ptr duckdb_pending_result =
  cast[ptr duckdb_pending_result](p)

converter toBase*(p: PendingQueryResult): duckdb_pending_result =
  cast[duckdb_pending_result](p)

proc add*(x: var ValidityMask, y: uint64) =
  (seq[uint64])(x).add(y)

proc len*(s: ValidityMask): int {.borrow.}
proc `[]`*[T](s: ValidityMask, i: T): uint64 =
  (seq[uint64])(s)[i]

proc `[]=`*(s: var ValidityMask, i: int, x: uint64) =
  (seq[uint64])(s)[i] = x

proc `&=`*(a: var ValidityMask, b: ValidityMask) =
  (seq[uint64])(a) &= (seq[uint64])(b)

proc newValidityMask*(): ValidityMask =
  const BITS_PER_VALUE = 64
  let
    size = duckdb_vector_size()
    numEntries = (size + BITS_PER_VALUE - 1) div BITS_PER_VALUE

  # Initialize the validity mask with a sequence of uint64
  result = ValidityMask(newSeq[uint64](numEntries))

  for i in 0 ..< numEntries:
    let remainingBits = size - i * BITS_PER_VALUE
    if remainingBits >= BITS_PER_VALUE:
      # All bits are valid
      result[i.int] = not 0.uint64
    else:
      # Only a partial mask for the remaining bits
      result[i.int] = (1.uint64 shl remainingBits) - 1

proc newValidityMask*(vec: duckdb_vector, size: int): ValidityMask =
  let tuples_in_array = size div BITS_PER_VALUE + 1
  var raw = cast[ptr UncheckedArray[uint64]](duckdb_vector_get_validity(vec))

  # If all values are valid, raw MIGHT be NULL!
  if isNil(raw):
    result = newValidityMask()
  else:
    result = ValidityMask(newSeq[uint64]())
    for i in 0 ..< tuples_in_array:
      result.add(raw[i])

proc newLogicalType*(i: duckdb_logical_type): LogicalType =
  result = LogicalType(handle: i)

proc newLogicalType*(pt: DuckType): LogicalType =
  # Returns an invalid logical type, if type is complex
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

proc newDuckType*[T](t: typedesc[T]): DuckType =
  when T is bool:
    DuckType.Boolean
  elif T is int8:
    DuckType.TinyInt
  elif T is int16:
    DuckType.SmallInt
  elif T is int32 | int:
    DuckType.Integer
  elif T is int64:
    DuckType.BigInt
  elif T is uint8:
    DuckType.UTinyInt
  elif T is uint16:
    DuckType.USmallInt
  elif T is uint32:
    DuckType.UInteger
  elif T is uint64:
    DuckType.UBigInt
  elif T is float32:
    DuckType.Float
  elif T is float64:
    DuckType.Double
  elif T is string:
    DuckType.Varchar
  elif T is seq[byte]:
    DuckType.Blob
  elif T is Time:
    DuckType.Time
  elif T is DateTime:
    DuckType.Timestamp
  elif T is tuple:
    DuckType.Struct
  elif T is seq:
    DuckType.List
  elif T is void:
    DuckType.SqlNull
  else:
    DuckType.Invalid

proc newDuckType*(node: NimNode): DuckType =
  let kind = node.strVal
  case kind
  of "int64":
    result = newDuckType(int64)
  of "int":
    result = newDuckType(int)
  of "string":
    result = newDuckType(string)
  else:
    raise newException(ValueError, fmt"invalid type {kind}")

proc `$`*(ltp: LogicalType): string =
  # returns nil for complext tipes
  result = $newDuckType(ltp)
