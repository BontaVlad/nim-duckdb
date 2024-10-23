import std/[
  sugar, sequtils, math,
  times, tables,
  macros
]

import nint128
import decimal
import /[api]

const
  BITS_PER_VALUE = 64
  STRING_INLINE_LENGTH = 12
  SECONDS_PER_DAY = 86400

type
  QueryResult* = object of duckdb_result
  LogicalType* = object of duckdb_logical_type
  DataChunk* = distinct ptr duckdb_data_chunk
  PendingQueryResult* = object of duckdb_pending_result
  # TODO: maybe convert to int
  Type* {.pure.} = enum
    Invalid        = enumDuckdbType.DUCKDB_TYPE_INVALID
    Boolean        = enumDuckdbType.DUCKDB_TYPE_BOOLEAN
    TinyInt        = enumDuckdbType.DUCKDB_TYPE_TINYINT
    SmallInt       = enumDuckdbType.DUCKDB_TYPE_SMALLINT
    Integer        = enumDuckdbType.DUCKDB_TYPE_INTEGER
    BigInt         = enumDuckdbType.DUCKDB_TYPE_BIGINT
    UTinyInt       = enumDuckdbType.DUCKDB_TYPE_UTINYINT
    USmallInt      = enumDuckdbType.DUCKDB_TYPE_USMALLINT
    UInteger       = enumDuckdbType.DUCKDB_TYPE_UINTEGER
    UBigInt        = enumDuckdbType.DUCKDB_TYPE_UBIGINT
    Float          = enumDuckdbType.DUCKDB_TYPE_FLOAT
    Double         = enumDuckdbType.DUCKDB_TYPE_DOUBLE
    Timestamp      = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP
    Date           = enumDuckdbType.DUCKDB_TYPE_DATE
    Time           = enumDuckdbType.DUCKDB_TYPE_TIME
    Interval       = enumDuckdbType.DUCKDB_TYPE_INTERVAL
    HugeInt        = enumDuckdbType.DUCKDB_TYPE_HUGEINT
    Varchar        = enumDuckdbType.DUCKDB_TYPE_VARCHAR
    Blob           = enumDuckdbType.DUCKDB_TYPE_BLOB
    Decimal        = enumDuckdbType.DUCKDB_TYPE_DECIMAL
    TimestampS     = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP_S
    TimestampMs    = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP_MS
    TimestampNs    = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP_NS
    # Enum           = enumDuckdbType.DUCKDB_TYPE_ENUM
    # List           = enumDuckdbType.DUCKDB_TYPE_LIST
    # Struct         = enumDuckdbType.DUCKDB_TYPE_STRUCT
    # Map            = enumDuckdbType.DUCKDB_TYPE_MAP
    # UUID           = enumDuckdbType.DUCKDB_TYPE_UUID
    # Union          = enumDuckdbType.DUCKDB_TYPE_UNION
    # Bit            = enumDuckdbType.DUCKDB_TYPE_BIT
    # TimeTz         = enumDuckdbType.DUCKDB_TYPE_TIME_TZ
    # TimestampTz    = enumDuckdbType.DUCKDB_TYPE_TIMESTAMP_TZ
    # UHugeInt       = enumDuckdbType.DUCKDB_TYPE_UHUGEINT
    # Array          = enumDuckdbType.DUCKDB_TYPE_ARRAY
    # Any            = enumDuckdbType.DUCKDB_TYPE_ANY
    # VarInt         = enumDuckdbType.DUCKDB_TYPE_VARINT
    # SqlNull        = enumDuckdbType.DUCKDB_TYPE_SQLNULL

  Vector* = ref object
    case kind*: Type
    of Type.Invalid:        valueInvalid*: uint8
    of Type.Boolean:        valueBoolean*: seq[bool]
    of Type.TinyInt:        valueTinyint*: seq[int8]
    of Type.SmallInt:       valueSmallint*: seq[int16]
    of Type.Integer:        valueInteger*: seq[int32]
    of Type.BigInt:         valueBigint*: seq[int64]
    of Type.UTinyInt:       valueUTinyint*: seq[uint8]
    of Type.USmallInt:      valueUSmallint*: seq[uint16]
    of Type.UInteger:       valueUInteger*: seq[uint32]
    of Type.UBigInt:        valueUBigint*: seq[uint64]
    of Type.Float:          valueFloat*: seq[float32]
    of Type.Double:         valueDouble*: seq[float64]
    of Type.Timestamp:      valueTimestamp*: seq[DateTime]
    of Type.Date:           valueDate*: seq[DateTime]                              # DateTime for Date representation
    of Type.Time:           valueTime*: seq[Time]
    of Type.Interval:       valueInterval*: seq[TimeInterval]                             # Assuming Interval is a duration in seconds (can be changed)
    of Type.HugeInt:        valueHugeint*: seq[Int128]                              # Custom tuple for 128-bit int
    of Type.Varchar:        valueVarchar*: seq[string]
    of Type.Blob:           valueBlob*: seq[seq[byte]]                             # Blob as a sequence of bytes
    of Type.Decimal:        valueDecimal*: seq[DecimalType]                             # Decimal stored as string to avoid float precision issues
    of Type.TimestampS:     valueTimestampS*: seq[DateTime]
    of Type.TimestampMs:    valueTimestampMs*: seq[DateTime]
    of Type.TimestampNs:    valueTimestampNs*: seq[DateTime]
    # of Type.Enum:           valueEnum*: seq[int]                                   # Enum as int or custom type
    # of Type.List:           valueList*: seq[seq[Vector]]                           # List of Vectors
    # of Type.Struct:         valueStruct*: seq[Table[string, Vector]]               # Struct could be represented as a table
    # of Type.Map:            valueMap*: seq[Table[Vector, Vector]]                                  # Similar to Struct
    # of Type.UUID:           valueUUID*: seq[string]                                # UUID stored as a string
    # of Type.Union:          valueUnion*: seq[Vector]                               # Union of types
    # of Type.Bit:            valueBit*: seq[bool]
    # of Type.TimeTz:         valueTimeTz*: seq[tuple[time: Time, timezone: string]] # Time with timezone
    # of Type.TimestampTz:    valueTimestampTz*: seq[tuple[timestamp: Time, timezone: string]]
    # of Type.UHugeInt:       valueUHugeint*: seq[tuple[high: uint64, low: uint64]]  # Unsigned 128-bit int
    # of Type.Array:          valueArray*: seq[Vector]                               # Array of vectors
    # of Type.Any:            valueAny*: seq[RootRef]
    # of Type.VarInt:         valueVarint*: seq[int]                                 # Variable-sized integer
    # of Type.SqlNull:        valueSqlNull*: seq[bool]                               # SqlNull could be a boolean

  Column = object
    idx: idxt
    name: string
    kind: Type
    logical_type: LogicalType

  ValidityMask* = object
    mask: seq[uint64]

converter toBase*(d: ptr DataChunk): ptr duckdbdatachunk = cast[ptr duckdbdatachunk](d)
converter toBase*(d: DataChunk): duckdbdatachunk = cast[duckdbdatachunk](d)
converter toBool*(d: DataChunk): bool = not isNil(d) or duckdbdatachunkgetsize(d).int > 0

converter toBase*(p: ptr PendingQueryResult): ptr duckdb_pending_result = cast[ptr duckdb_pending_result](p)
converter toBase*(p: PendingQueryResult): duckdb_pending_result = cast[duckdb_pending_result](p)

converter toBase*(l: LogicalType): duckdb_logical_type = cast[duckdb_logical_type](l)
converter toBool*(l: duckdb_logical_type): LogicalType = cast[LogicalType](l)


proc `=destroy`(qresult: QueryResult) =
  if not isNil(qresult.addr):
    duckdbDestroyResult(qresult.addr)


proc `=destroy`(datachunk: DataChunk) =
    if not isNil(datachunk.addr):
      duckdbdestroydatachunk(datachunk.addr)


proc isStreaming(qresult: QueryResult): bool =
  duckdb_result_is_streaming(qresult)


proc newChunk(qresult: QueryResult): DataChunk =
  let chunk = cast[ptr duckdbdatachunk](duckdb_stream_fetch_chunk(qresult))
  DataChunk(chunk)


proc newChunk(qresult: QueryResult, at: idxt): DataChunk =
  let chunk = cast[ptr duckdbdatachunk](duckdb_result_get_chunk(qresult, at))
  DataChunk(chunk)


proc newColumn(qresult: QueryResult, at: idxt): Column =
  result.idx = at
  result.name = $duckdb_column_name(qresult.addr, at)
  result.kind = cast[Type](duckdb_column_type(qresult.addr, at))
  result.logical_type = duckdb_column_logical_type(qresult.addr, at)


proc newValidityMask(v: duckdbvector): ValidityMask =
  let
    size_words = duckdbvectorsize() div BITS_PER_VALUE
    raw = cast[ptr UncheckedArray[uint64]](duckdb_vector_get_validity(v))

  result.mask = collect:
      for i in 0..<size_words:
        raw[i]


proc isValid(m: ValidityMask, idx: int): bool {.inline.} =
  let
    entryIdx = idx div BITS_PER_VALUE
    indexInEntry = idx mod BITS_PER_VALUE
  result = (m.mask[entryIdx] and (1.uint64 shl indexInEntry)) != 0


template parseHandle(handle: pointer, rawType: untyped, resultField: untyped, castType: untyped): untyped =
  # echo repr handle
  let raw = cast[ptr UncheckedArray[rawType]](handle)
  resultField = collect:
    for i in 0..<chunk_size:
      if isValid(validityMask, i): castType(raw[i])

template parseHandle(handle: pointer, rawType: untyped, resultField: untyped): untyped =
  parseHandle(handle, rawType, resultField, rawType)


template parseHandle(handle: pointer, resultField: untyped): untyped =
  parseHandle(handle, typedesc(resultField[0]), resultField)

template parseDecimalBigInt(handle: pointer, scale: int, resultField: seq[DecimalType]) =
    let raw = cast[ptr UncheckedArray[int64]](handle)
    resultField = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i):
          let
            value = raw[i].float / pow(10.float, scale.float)
          newDecimal($value)

template parseDecimalHugeInt(handle: pointer, scale: int, resultField: seq[DecimalType]) =
  let raw = cast[ptr UncheckedArray[duckdb_hugeint]](handle)
  resultField = collect:
    for i in 0..<chunk_size:
      if isValid(validityMask, i):
        let
          value = add64Plus64ToI128(raw[i].lower.uint64, (raw[i].upper.int64 shl 64).uint64)
          fractional = cast[float](value) / pow(10.float, scale.float)
        newDecimal($fractional)


proc newVector(col: Column): Vector =
  result = Vector(kind: col.kind)
  case col.kind
  of Type.Invalid:        result.valueInvalid = 0
  of Type.Boolean:        result.valueBoolean = newSeq[bool]()
  of Type.TinyInt:        result.valueTinyint = newSeq[int8]()
  of Type.SmallInt:       result.valueSmallint = newSeq[int16]()
  of Type.Integer:        result.valueInteger = newSeq[int32]()
  of Type.BigInt:         result.valueBigint = newSeq[int64]()
  of Type.UTinyInt:       result.valueUTinyint = newSeq[uint8]()
  of Type.USmallInt:      result.valueUSmallint = newSeq[uint16]()
  of Type.UInteger:       result.valueUInteger = newSeq[uint32]()
  of Type.UBigInt:        result.valueUBigint = newSeq[uint64]()
  of Type.Float:          result.valueFloat = newSeq[float32]()
  of Type.Double:         result.valueDouble = newSeq[float64]()
  of Type.Timestamp:      result.valueTimestamp = newSeq[DateTime]()
  of Type.Date:           result.valueDate = newSeq[DateTime]()
  of Type.Time:           result.valueTime = newSeq[Time]()
  of Type.Interval:       result.valueInterval = newSeq[TimeInterval]()
  of Type.HugeInt:        result.valueHugeint = newSeq[Int128]()
  of Type.Varchar:        result.valueVarchar = newSeq[string]()
  of Type.Blob:           result.valueBlob = newSeq[seq[byte]]()
  of Type.Decimal:        result.valueDecimal = newSeq[DecimalType]()
  of Type.TimestampS:     result.valueTimestampS = newSeq[DateTime]()
  of Type.TimestampMs:    result.valueTimestampMs = newSeq[DateTime]()
  of Type.TimestampNs:    result.valueTimestampNs = newSeq[DateTime]()
  # of Type.Enum:           result.valueEnum = newSeq[int]()
  # of Type.List:           result.valueList = newSeq[seq[Vector]]()
  # of Type.Struct:         result.valueStruct = newSeq[Table[string, Vector]]()
  # of Type.Map:            result.valueMap = newSeq[Table[Vector, Vector]]()
  # of Type.UUID:           result.valueUUID = newSeq[string]()
  # of Type.Union:          result.valueUnion = newSeq[Vector]()
  # of Type.Bit:            result.valueBit = newSeq[bool]()
  # of Type.TimeTz:         result.valueTimeTz = newSeq[tuple[time: Time, timezone: string]]()
  # of Type.TimestampTz:    result.valueTimestampTz = newSeq[tuple[timestamp: Time, timezone: string]]()
  # of Type.UHugeInt:       result.valueUHugeint = newSeq[tuple[high: uint64, low: uint64]]()
  # of Type.Array:          result.valueArray = newSeq[Vector]()
  # of Type.Any:            result.valueAny = newSeq[RootRef]()
  # of Type.VarInt:         result.valueVarint = newSeq[int]()
  # of Type.SqlNull:        result.valueSqlNull = newSeq[bool]()


# TODO: make this prettier with macros
proc newVector(chunk: DataChunk, col: Column): Vector =
  result = Vector(kind: col.kind)
  let
    vec = duckdb_data_chunk_get_vector(chunk, col.idx)
    validityMask = newValidityMask(vec)
    handle = duckdbvectorgetdata(vec)
    # allValid = cast[ptr UncheckedArray[uint64]](duckdb_vector_get_validity(vec))

  let chunk_size = duckdb_data_chunk_get_size(chunk).int
  # TODO: abstract a lot of duplication around here
  case col.kind
  of Type.Invalid: raise newException(ValueError, "got invalid type")
  of Type.Boolean: parseHandle(handle, uint8, result.valueBoolean, bool)
  of Type.TinyInt: parseHandle(handle, result.valueTinyint)
  of Type.SmallInt: parseHandle(handle, result.valueSmallint)
  of Type.Integer: parseHandle(handle, cint, result.valueInteger, int32)
  of Type.BigInt: parseHandle(handle, result.valueBigint)
  of Type.UTinyInt: parseHandle(handle, result.valueUtinyint)
  of Type.USmallInt: parseHandle(handle, result.valueUSmallint)
  of Type.UInteger: parseHandle(handle, result.valueUInteger)
  of Type.UBigInt: parseHandle(handle, result.valueUBigint)
  of Type.Float: parseHandle(handle, result.valueFloat)
  of Type.Double: parseHandle(handle, result.valueDouble)
  of Type.Timestamp:
    let raw = cast[ptr UncheckedArray[int64]](handle)
    result.valueTimestamp = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i):
          let
            seconds = raw[i] div 1000000
            microseconds = raw[i] mod 1000000
          fromUnix(seconds).inZone(utc()) + initDuration(microseconds = microseconds)
  of Type.Date:
    let raw = cast[ptr UncheckedArray[int32]](handle)
    result.valueDate = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i): inZone(fromUnix(raw[i].int32 * SECONDS_PER_DAY), utc())
  of Type.Time:
    let raw = cast[ptr UncheckedArray[int64]](handle)
    result.valueTime = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i):
          let
            nanos = raw[i] * 1000  # Convert microseconds to nanoseconds
            seconds = nanos div 1_000_000_000
            remainingNanos = nanos mod 1_000_000_000
          initTime(seconds.int, remainingNanos.int)
  of Type.Interval:
    let raw = cast[ptr UncheckedArray[duckdbInterval]](handle)
    result.valueInterval = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i):
          initTimeInterval(months=raw[i].months, days=raw[i].days, microseconds=raw[i].micros)
  of Type.HugeInt:
    let raw = cast[ptr UncheckedArray[duckdb_hugeint]](handle)
    result.valueHugeInt = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i):
          add64Plus64ToI128(raw[i].lower.uint64, (raw[i].upper.int64 shl 64).uint64)

  of Type.VarChar:
    result.valueVarChar = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i):
          var
            basePtr = cast[pointer](cast[uint](handle) + (i * sizeof(duckdbstringt)).uint)
            strLength = cast[ptr int32](basePtr)[]
            rawStr: cstring

          if strLength <= STRING_INLINE_LENGTH:
            rawStr = cast[cstring](cast[uint](basePtr) + sizeof(int32).uint)
          else:
            rawStr = cast[ptr cstring](cast[uint](basePtr) + sizeof(int32).uint * 2)[]
          $rawStr
        else:
          "NULL"

  of Type.Blob:
    result.valueBlob = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i):
          var
            basePtr = cast[pointer](cast[uint](handle) + (i * sizeof(duckdbstringt)).uint)
            strLength = cast[ptr int32](basePtr)[]
            rawStr: cstring

          if strLength <= STRING_INLINE_LENGTH:
            rawStr = cast[cstring](cast[uint](basePtr) + sizeof(int32).uint)
          else:
            rawStr = cast[ptr cstring](cast[uint](basePtr) + sizeof(int32).uint * 2)[]
          var byteArray = newSeq[byte](rawStr.len)
          copyMem(addr byteArray[0], unsafeAddr rawStr[0], rawStr.len)
          byteArray

  of Type.Decimal:
    let
      # tp = duckdb_decimal_internal_type(col.logical_type)
      scale = duckdb_decimal_scale(col.logical_type).int
      width = duckdb_decimal_width(col.logical_type).int
    if width <= 18:
      parseDecimalBigInt(handle, scale, result.valueDecimal)
    else:
      parseDecimalHugeInt(handle, scale, result.valueDecimal)

  of Type.TimestampS:
    let raw = cast[ptr UncheckedArray[int64]](handle)
    result.valueTimestampS = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i):
          fromUnix(raw[i]).inZone(utc())

  of Type.TimestampMs:
    let raw = cast[ptr UncheckedArray[int64]](handle)
    result.valueTimestampMs = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i):
          fromUnix(raw[i] div 1000).inZone(utc()) + initDuration(milliseconds = raw[i] mod 1000)

  of Type.TimestampNs:
    let raw = cast[ptr UncheckedArray[int64]](handle)
    result.valueTimestampNs = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i):
          let
            seconds = raw[i] div 1_000_000_000
            microseconds = raw[i] mod 1_000_000_000 div 1000
          fromUnix(seconds).inZone(utc()) + initDuration(microseconds=microseconds)

iterator columns(qresult: QueryResult): Column {.inline.} =
  for i in 0..<duckdb_column_count(qresult.addr):
    yield newColumn(qresult, i)

iterator chunks*(qresult: QueryResult): seq[Vector] {.inline.} =
  let columns = qresult.columns.toSeq

  for i in 0..<duckdb_result_chunk_count(qresult):
    let chunk = if qresult.isStreaming: newChunk(qresult) else: newChunk(qresult, i)
    var column_values = newSeq[Vector](len(columns))
    for col in columns:
      column_values[col.idx] = newVector(chunk, col)
    yield column_values

macro getAttr(obj: typed, attr: static[string]): untyped =
  newDotExpr(obj, newIdentNode(attr))

template fetchAllImpl[T](ResultType: typedesc, getKey: untyped, qresult: QueryResult): T =
  let columns = qresult.columns.toSeq
  var result = when ResultType is seq: newSeq[Vector](len(columns))
               else: ResultType()

  for col in columns:
    result[getAttr(col, getKey)] = newVector(col)

  for chunk in qresult.chunks:
    for col in columns:
      let
        key = getAttr(col, getKey)

      case col.kind
      of Type.Invalid    : discard # for now
      of Type.Boolean    : result[key].valueBoolean    &= chunk[col.idx].valueBoolean
      of Type.TinyInt    : result[key].valueTinyint    &= chunk[col.idx].valueTinyint
      of Type.SmallInt   : result[key].valueSmallint   &= chunk[col.idx].valueSmallint
      of Type.Integer    : result[key].valueInteger    &= chunk[col.idx].valueInteger
      of Type.BigInt     : result[key].valueBigint     &= chunk[col.idx].valueBigint
      of Type.UTinyInt   : result[key].valueUtinyint   &= chunk[col.idx].valueUtinyint
      of Type.USmallInt  : result[key].valueUsmallint  &= chunk[col.idx].valueUsmallint
      of Type.UInteger   : result[key].valueUinteger   &= chunk[col.idx].valueUinteger
      of Type.UBigInt    : result[key].valueUbigint    &= chunk[col.idx].valueUbigint
      of Type.Float      : result[key].valueFloat      &= chunk[col.idx].valueFloat
      of Type.Double     : result[key].valueDouble     &= chunk[col.idx].valueDouble
      of Type.Timestamp  : result[key].valueTimestamp  &= chunk[col.idx].valueTimestamp
      of Type.Date       : result[key].valueDate       &= chunk[col.idx].valueDate
      of Type.Time       : result[key].valueTime       &= chunk[col.idx].valueTime
      of Type.Interval   : result[key].valueInterval   &= chunk[col.idx].valueInterval
      of Type.HugeInt    : result[key].valueHugeInt    &= chunk[col.idx].valueHugeInt
      of Type.VarChar    : result[key].valueVarchar    &= chunk[col.idx].valueVarchar
      of Type.Blob       : result[key].valueBlob       &= chunk[col.idx].valueBlob
      of Type.Decimal    : result[key].valueDecimal    &= chunk[col.idx].valueDecimal
      of Type.TimestampS : result[key].valueTimestampS &= chunk[col.idx].valueTimestampS
      of Type.TimestampMs : result[key].valueTimestampMs &= chunk[col.idx].valueTimestampMs
      of Type.TimestampNs : result[key].valueTimestampNs &= chunk[col.idx].valueTimestampNs
  result

# TODO: api not definitive
proc fetchAllNamed*(qresult: QueryResult): Table[string, Vector] =
  fetchAllImpl[Table[string, Vector]](Table[string, Vector], "name", qresult)

# TODO: api not definitive
proc fetchAll*(qresult: QueryResult): seq[Vector] =
  fetchAllImpl[seq[Vector]](seq[Vector], "idx", qresult)

proc error*(qresult: QueryResult): string =
  result = $duckdb_result_error(qresult.addr)
