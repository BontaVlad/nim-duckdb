import std/[sugar, tables, times, math, strformat]
import nint128
import decimal
import pretty

import /[api]

const
  BITS_PER_VALUE = 64
  STRING_INLINE_LENGTH = 12
  SECONDS_PER_DAY = 86400

type
  DuckString = distinct cstring
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
    Enum           = enumDuckdbType.DUCKDB_TYPE_ENUM
    List           = enumDuckdbType.DUCKDB_TYPE_LIST
    Struct         = enumDuckdbType.DUCKDB_TYPE_STRUCT
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
    of Type.Invalid       :        valueInvalid*: uint8
    of Type.Boolean       :        valueBoolean*: seq[bool]
    of Type.TinyInt       :        valueTinyint*: seq[int8]
    of Type.SmallInt      :       valueSmallint*: seq[int16]
    of Type.Integer       :        valueInteger*: seq[int32]
    of Type.BigInt        :         valueBigint*: seq[int64]
    of Type.UTinyInt      :       valueUTinyint*: seq[uint8]
    of Type.USmallInt     :      valueUSmallint*: seq[uint16]
    of Type.UInteger      :       valueUInteger*: seq[uint32]
    of Type.UBigInt       :        valueUBigint*: seq[uint64]
    of Type.Float         :          valueFloat*: seq[float32]
    of Type.Double        :         valueDouble*: seq[float64]
    of Type.Timestamp     :      valueTimestamp*: seq[DateTime]
    of Type.Date          :           valueDate*: seq[DateTime]                              # DateTime for Date representation
    of Type.Time          :           valueTime*: seq[Time]
    of Type.Interval      :       valueInterval*: seq[TimeInterval]                             # Assuming Interval is a duration in seconds (can be changed)
    of Type.HugeInt       :        valueHugeint*: seq[Int128]                              # Custom tuple for 128-bit int
    of Type.Varchar       :        valueVarchar*: seq[string]
    of Type.Blob          :           valueBlob*: seq[seq[byte]]                             # Blob as a sequence of bytes
    of Type.Decimal       :        valueDecimal*: seq[DecimalType]                             # Decimal stored as string to avoid float precision issues
    of Type.TimestampS    :     valueTimestampS*: seq[DateTime]
    of Type.TimestampMs   :    valueTimestampMs*: seq[DateTime]
    of Type.TimestampNs   :    valueTimestampNs*: seq[DateTime]
    of Type.Enum          :           valueEnum*: seq[uint]                                   # Enum as int or custom type
    of Type.List          :           valueList*: seq[seq[Vector]]                           # List of Vectors
    of Type.Struct        :         valueStruct*: seq[Table[string, Vector]]               # Struct could be represented as a table
    # of Type.Map         :            valueMap*: seq[Table[Vector, Vector]]                                  # Similar to Struct
    # of Type.UUID        :           valueUUID*: seq[string]                                # UUID stored as a string
    # of Type.Union       :          valueUnion*: seq[Vector]                               # Union of types
    # of Type.Bit         :            valueBit*: seq[bool]
    # of Type.TimeTz      :         valueTimeTz*: seq[tuple[time: Time, timezone: string]] # Time with timezone
    # of Type.TimestampTz :    valueTimestampTz*: seq[tuple[timestamp: Time, timezone: string]]
    # of Type.UHugeInt    :       valueUHugeint*: seq[tuple[high: uint64, low: uint64]]  # Unsigned 128-bit int
    # of Type.Array       :          valueArray*: seq[Vector]                               # Array of vectors
    # of Type.Any         :            valueAny*: seq[RootRef]
    # of Type.VarInt      :         valueVarint*: seq[int]                                 # Variable-sized integer
    # of Type.SqlNull     :        valueSqlNull*: seq[bool]                               # SqlNull could be a boolean

  ValidityMask = object
    mask: seq[uint64]

  LogicalType* = distinct ptr duckdb_logical_type

converter toPtrBase*(l: ptr LogicalType): ptr duckdb_logical_type = cast[ptr duckdb_logical_type](l)
converter toBase*(l: LogicalType): duckdb_logical_type = cast[duckdb_logical_type](l)

proc `=destroy`(ltp: LogicalType) =
  if not isNil(ltp.addr):
    duckdb_destroy_logical_type(ltp.addr)

proc `=destroy`*(dstr: DuckString) =
  if not dstr.cstring.isNil:
    duckdb_free(cast[pointer](dstr.cstring))

proc `$`*(dstr: DuckString): string =
  if dstr.cstring.isNil:
    return ""
  result = $dstr.cstring

proc `$`*(ltp: LogicalType): string =
  # TODO: must be freed with duckdb_free
  $duckdb_logical_type_get_alias(ltp)


proc toType(ltp: LogicalType): Type =
  cast[Type](duckdb_get_type_id(ltp))


proc newValidityMask(v: duckdbvector): ValidityMask =
  let
    size_words = duckdbvectorsize() div BITS_PER_VALUE
    raw = cast[ptr UncheckedArray[uint64]](duckdb_vector_get_validity(v))
  result.mask = collect(for i in 0..<size_words: raw[i])


proc isValid(m: ValidityMask, idx: int): bool {.inline.} =
  let
    entryIdx = idx div BITS_PER_VALUE
    indexInEntry = idx mod BITS_PER_VALUE
  result = (m.mask[entryIdx] and (1.uint64 shl indexInEntry)) != 0

template collectValid[T, U](handle: pointer, validityMask: auto, offset, size: int, transform: untyped): seq[U] =
  let raw = cast[ptr UncheckedArray[T]](handle)
  collect:
    for i in offset..<size:
      if isValid(validityMask, i):
        transform(raw[i])

template collectValidString[T](handle: pointer, validityMask: auto, offset, size: int, resultField: var auto, transform: untyped): untyped =
  resultField = collect:
    for i in offset..<size:
      if isValid(validityMask, i):
        var
          basePtr = cast[pointer](cast[uint](handle) + (i * sizeof(duckdbstringt)).uint)
          strLength = cast[ptr int32](basePtr)[]
          rawStr: cstring

        if strLength <= STRING_INLINE_LENGTH:
          rawStr = cast[cstring](cast[uint](basePtr) + sizeof(int32).uint)
        else:
          rawStr = cast[ptr cstring](cast[uint](basePtr) + sizeof(int32).uint * 2)[]
        transform(rawStr)
      else:
        when T is string:
          ""  # TODO: not sure about this
        else:
          newSeq[byte](0)  # Empty byte array for blobs

template parseHandle(handle: pointer, rawType: untyped, resultField: untyped, castType: untyped): untyped =
  let raw = cast[ptr UncheckedArray[rawType]](handle)
  resultField = collectValid[rawType, type(resultField[0])](raw, validityMask, offset, size) do (val: rawType) -> auto:
    castType(val)

template parseHandle(handle: pointer, rawType: untyped, resultField: untyped): untyped =
  parseHandle(handle, rawType, resultField, rawType)

template parseDecimalBigInt(handle: pointer, scale: int, resultField: seq[DecimalType]) =
  resultField = collectValid[int64, DecimalType](handle, validityMask, offset, size) do (val: int64) -> DecimalType:
    let value = val.float / pow(10.float, scale.float)
    newDecimal($value)

template parseDecimalHugeInt(handle: pointer, scale: int, resultField: seq[DecimalType]) =
  resultField = collectValid[duckdb_hugeint, DecimalType](handle, validityMask, offset, size) do (val: duckdb_hugeint) -> DecimalType:
    let
      value = add64Plus64ToI128(val.lower.uint64, (val.upper.int64 shl 64).uint64)
      fractional = cast[float](value) / pow(10.float, scale.float)
    newDecimal($fractional)

proc newVector*(kind: Type): Vector =
  result = Vector(kind: kind)
  case kind
  of Type.Invalid:        result.valueInvalid       = 0  # TODO: maybe raise an exception
  of Type.Boolean:        result.valueBoolean       = newSeq[bool]()
  of Type.TinyInt:        result.valueTinyint       = newSeq[int8]()
  of Type.SmallInt:       result.valueSmallint      = newSeq[int16]()
  of Type.Integer:        result.valueInteger       = newSeq[int32]()
  of Type.BigInt:         result.valueBigint        = newSeq[int64]()
  of Type.UTinyInt:       result.valueUTinyint      = newSeq[uint8]()
  of Type.USmallInt:      result.valueUSmallint     = newSeq[uint16]()
  of Type.UInteger:       result.valueUInteger      = newSeq[uint32]()
  of Type.UBigInt:        result.valueUBigint       = newSeq[uint64]()
  of Type.Float:          result.valueFloat         = newSeq[float32]()
  of Type.Double:         result.valueDouble        = newSeq[float64]()
  of Type.Timestamp:      result.valueTimestamp     = newSeq[DateTime]()
  of Type.Date:           result.valueDate          = newSeq[DateTime]()
  of Type.Time:           result.valueTime          = newSeq[Time]()
  of Type.Interval:       result.valueInterval      = newSeq[TimeInterval]()
  of Type.HugeInt:        result.valueHugeint       = newSeq[Int128]()
  of Type.Varchar:        result.valueVarchar       = newSeq[string]()
  of Type.Blob:           result.valueBlob          = newSeq[seq[byte]]()
  of Type.Decimal:        result.valueDecimal       = newSeq[DecimalType]()
  of Type.TimestampS:     result.valueTimestampS    = newSeq[DateTime]()
  of Type.TimestampMs:    result.valueTimestampMs   = newSeq[DateTime]()
  of Type.TimestampNs:    result.valueTimestampNs   = newSeq[DateTime]()
  of Type.Enum:           result.valueEnum          = newSeq[uint]()
  of Type.List:           result.valueList          = newSeq[seq[Vector]]()
  of Type.Struct:         result.valueStruct        = newSeq[Table[string, Vector]]()
  # of Type.Map:            result.valueMap         = newSeq[Table[Vector, Vector]]()
  # of Type.UUID:           result.valueUUID        = newSeq[string]()
  # of Type.Union:          result.valueUnion       = newSeq[Vector]()
  # of Type.Bit:            result.valueBit         = newSeq[bool]()
  # of Type.TimeTz:         result.valueTimeTz      = newSeq[tuple[time: Time, timezone: string]]()
  # of Type.TimestampTz:    result.valueTimestampTz = newSeq[tuple[timestamp: Time, timezone: string]]()
  # of Type.UHugeInt:       result.valueUHugeint    = newSeq[tuple[high: uint64, low: uint64]]()
  # of Type.Array:          result.valueArray       = newSeq[Vector]()
  # of Type.Any:            result.valueAny         = newSeq[RootRef]()
  # of Type.VarInt:         result.valueVarint      = newSeq[int]()
  # of Type.SqlNull:        result.valueSqlNull     = newSeq[bool]()

proc `[]`*(this: Vector, r: HSlice[int, int]): Vector =
  echo repr r
  result = newVector(kind=this.kind)
  case this.kind
  of Type.Invalid     : discard # for now
  of Type.Boolean     : result.valueBoolean     = this.valueBoolean[r.a..r.b]
  of Type.TinyInt     : result.valueTinyint     = this.valueTinyint[r.a..r.b]
  of Type.SmallInt    : result.valueSmallint    = this.valueSmallint[r.a..r.b]
  of Type.Integer     : result.valueInteger     = this.valueInteger[r.a..r.b]
  of Type.BigInt      : result.valueBigint      = this.valueBigint[r.a..r.b]
  of Type.UTinyInt    : result.valueUtinyint    = this.valueUtinyint[r.a..r.b]
  of Type.USmallInt   : result.valueUsmallint   = this.valueUsmallint[r.a..r.b]
  of Type.UInteger    : result.valueUinteger    = this.valueUinteger[r.a..r.b]
  of Type.UBigInt     : result.valueUbigint     = this.valueUbigint[r.a..r.b]
  of Type.Float       : result.valueFloat       = this.valueFloat[r.a..r.b]
  of Type.Double      : result.valueDouble      = this.valueDouble[r.a..r.b]
  of Type.Timestamp   : result.valueTimestamp   = this.valueTimestamp[r.a..r.b]
  of Type.Date        : result.valueDate        = this.valueDate[r.a..r.b]
  of Type.Time        : result.valueTime        = this.valueTime[r.a..r.b]
  of Type.Interval    : result.valueInterval    = this.valueInterval[r.a..r.b]
  of Type.HugeInt     : result.valueHugeInt     = this.valueHugeInt[r.a..r.b]
  of Type.VarChar     : result.valueVarchar     = this.valueVarchar[r.a..r.b]
  of Type.Blob        : result.valueBlob        = this.valueBlob[r.a..r.b]
  of Type.Decimal     : result.valueDecimal     = this.valueDecimal[r.a..r.b]
  of Type.TimestampS  : result.valueTimestampS  = this.valueTimestampS[r.a..r.b]
  of Type.TimestampMs : result.valueTimestampMs = this.valueTimestampMs[r.a..r.b]
  of Type.TimestampNs : result.valueTimestampNs = this.valueTimestampNs[r.a..r.b]
  of Type.Enum        : result.valueEnum        = this.valueEnum[r.a..r.b]
  of Type.List        : result.valueList        = this.valueList[r.a..r.b]
  of Type.Struct      : result.valueStruct      = this.valueStruct[r.a..r.b]


proc `[]`*(this: Vector, x: int): Vector =
  result = this[x..x]

# TODO: make this prettier with macros
proc newVector*(vec: duckdb_vector, offset: int, size: int, kind: Type, logical_type: LogicalType): Vector =
  echo offset
  echo size
  result = Vector(kind: kind)
  let
    validityMask = newValidityMask(vec)
    handle = duckdb_vector_get_data(vec)

  # TODO: abstract a lot of duplication around here
  case kind
  of Type.Invalid: raise newException(ValueError, "got invalid type")
  of Type.Boolean: parseHandle(handle, uint8, result.valueBoolean, bool)
  of Type.TinyInt: parseHandle(handle, int8, result.valueTinyint)
  of Type.SmallInt: parseHandle(handle, int16, result.valueSmallint)
  of Type.Integer: parseHandle(handle, cint, result.valueInteger, int32)
  of Type.BigInt: parseHandle(handle, int64, result.valueBigint)
  of Type.UTinyInt: parseHandle(handle, uint8, result.valueUtinyint)
  of Type.USmallInt: parseHandle(handle, uint16, result.valueUSmallint)
  of Type.UInteger: parseHandle(handle, uint32, result.valueUInteger)
  of Type.UBigInt: parseHandle(handle, uint64, result.valueUBigint)
  of Type.Float: parseHandle(handle, float32, result.valueFloat)
  of Type.Double: parseHandle(handle, float64, result.valueDouble)
  of Type.Timestamp:
    result.valueTimestamp = collectValid[int64, DateTime](handle, validityMask, offset, size) do (val: int64) -> DateTime:
      let
        seconds = val div 1000000
        microseconds = val mod 1000000
      fromUnix(seconds).inZone(utc()) + initDuration(microseconds = microseconds)

  of Type.Date:
    result.valueDate = collectValid[int32, DateTime](handle, validityMask, offset, size) do (val: int32) -> DateTime:
      inZone(fromUnix(val.int32 * SECONDS_PER_DAY), utc())

  of Type.Time:
    result.valueTime = collectValid[int64, Time](handle, validityMask, offset, size) do (val: int64) -> Time:
      let
        nanos = val * 1000  # Convert microseconds to nanoseconds
        seconds = nanos div 1_000_000_000
        remainingNanos = nanos mod 1_000_000_000
      initTime(seconds.int, remainingNanos.int)

  of Type.Interval:
    result.valueInterval = collectValid[duckdbInterval, TimeInterval](handle, validityMask, offset, size) do (val: duckdbInterval) -> TimeInterval:
      initTimeInterval(months=val.months, days=val.days, microseconds=val.micros)

  of Type.HugeInt:
    result.valueHugeInt = collectValid[duckdb_hugeint, Int128](handle, validityMask, offset, size) do (val: duckdb_hugeint) -> Int128:
      add64Plus64ToI128(val.lower.uint64, (val.upper.int64 shl 64).uint64)

  of Type.VarChar:
    collectValidString[string](handle, validityMask, offset, size, result.valueVarChar) do (rawStr: cstring) -> string:
      $rawStr

  of Type.Blob:
    collectValidString[seq[byte]](handle, validityMask, offset, size, result.valueBlob) do (rawStr: cstring) -> seq[byte]:
      var byteArray = newSeq[byte](rawStr.len)
      copyMem(addr byteArray[0], unsafeAddr rawStr[0], rawStr.len)
      byteArray

  of Type.Decimal:
    let
      scale = duckdb_decimal_scale(logical_type).int
      width = duckdb_decimal_width(logical_type).int
    if width <= 18:
      parseDecimalBigInt(handle, scale, result.valueDecimal)
    else:
      parseDecimalHugeInt(handle, scale, result.valueDecimal)

  of Type.TimestampS:
    result.valueTimestampS = collectValid[int64, DateTime](handle, validityMask, offset, size) do (val: int64) -> DateTime:
      fromUnix(val).inZone(utc())

  of Type.TimestampMs:
    result.valueTimestampMs = collectValid[int64, DateTime](handle, validityMask, offset, size) do (val: int64) -> DateTime:
      fromUnix(val div 1000).inZone(utc()) + initDuration(milliseconds = val mod 1000)

  of Type.TimestampNs:
    result.valueTimestampNs = collectValid[int64, Datetime](handle, validityMask, offset, size) do (val: int64) -> DateTime:
      let
        seconds = val div 1_000_000_000
        microseconds = val mod 1_000_000_000 div 1000
      fromUnix(seconds).inZone(utc()) + initDuration(microseconds=microseconds)

  of Type.Enum:
    let enum_tp = cast[Type](duckdb_enum_internal_type(logical_type))
    case enum_tp:
      of UTinyInt: parseHandle(handle, uint8, result.valueEnum, uint)
      of USmallInt: parseHandle(handle, uint16, result.valueEnum, uint)
      of UInteger: parseHandle(handle, uint32, result.valueEnum, uint)
      else: raise newException(ValueError, fmt"got invalid enum type: {enum_tp}")

  of Type.List:
    let
      raw = cast[ptr UncheckedArray[duckdb_list_entry]](handle)
      children = duckdb_list_vector_get_child(vec)

    result.valueList = collect:
      for i in offset..<size:
        if isValid(validityMask, i):
          let
            list_data = raw[i]
            child_type = cast[LogicalType](duckdb_list_type_child_type(logical_type))
            child = newVector(
                vec=children,
                offset=list_data.offset.int,
                size=(list_data.offset + list_data.length).int,
                kind=child_type.toType,
                logical_type=child_type
            )
          @[child]
  of Type.Struct:
    let child_count = duckdb_struct_type_child_count(logical_type).int
    var vectorStruct = initTable[string, Vector]()
    for child_idx in 0..<child_count:
      let
        children = duckdb_struct_vector_get_child(vec, child_idx.idx_t)
        child_type = cast[LogicalType](duckdb_struct_type_child_type(logical_type, child_idx.idx_t))
        child_name = cast[DuckString](duckdb_struct_type_child_name(logical_type, child_idx.idx_t))
        child = newVector(
            vec=children,
            offset=0,
            size=size,
            kind=child_type.toType,
            logical_type=child_type
        )
      vectorStruct[$child_name] = child
    echo repr vectorStruct
    result.valueStruct = collect:
      for i in offset..<size:
        var row = initTable[string, Vector]()
        if isValid(validityMask, i):
          for key in vectorStruct.keys():
            echo key
            row[key] = vectorStruct[key][i]
        row

proc `$`*(vector: Vector): string =
  case vector.kind
  of Type.Invalid: $vector.valueInvalid
  of Type.Boolean: $vector.valueBoolean
  of Type.TinyInt: $vector.valueTinyint
  of Type.SmallInt: $vector.valueSmallint
  of Type.Integer: $vector.valueInteger
  of Type.BigInt: $vector.valueBigint
  of Type.UTinyInt: $vector.valueUtinyint
  of Type.USmallInt: $vector.valueUsmallint
  of Type.UInteger: $vector.valueUinteger
  of Type.UBigInt: $vector.valueUbigint
  of Type.Float: $vector.valueFloat
  of Type.Double: $vector.valueDouble
  of Type.Timestamp: $vector.valueTimestamp
  of Type.Date: $vector.valueDate
  of Type.Time: $vector.valueTime
  of Type.Interval: $vector.valueInterval
  of Type.HugeInt: $vector.valueHugeInt
  of Type.VarChar: $vector.valueVarchar
  of Type.Blob: $vector.valueBlob
  of Type.Decimal: $vector.valueDecimal
  of Type.TimestampS: $vector.valueTimestampS
  of Type.TimestampMs: $vector.valueTimestampMs
  of Type.TimestampNs: $vector.valueTimestampNs
  of Type.Enum: $vector.valueEnum
  of Type.List: $vector.valueList
  of Type.Struct: $vector.valueStruct

func `&=`*(left: var Vector, right: Vector): void =
  if left.kind != right.kind:
    raise newException(ValueError, fmt"Vector.kind:{left.kind} != Vector.kind:{right.kind}. Can't concatenate different kinds of vectors")

  case left.kind
  of Type.Invalid     : discard # for now
  of Type.Boolean     : left.valueBoolean     &= right.valueBoolean
  of Type.TinyInt     : left.valueTinyint     &= right.valueTinyint
  of Type.SmallInt    : left.valueSmallint    &= right.valueSmallint
  of Type.Integer     : left.valueInteger     &= right.valueInteger
  of Type.BigInt      : left.valueBigint      &= right.valueBigint
  of Type.UTinyInt    : left.valueUtinyint    &= right.valueUtinyint
  of Type.USmallInt   : left.valueUsmallint   &= right.valueUsmallint
  of Type.UInteger    : left.valueUinteger    &= right.valueUinteger
  of Type.UBigInt     : left.valueUbigint     &= right.valueUbigint
  of Type.Float       : left.valueFloat       &= right.valueFloat
  of Type.Double      : left.valueDouble      &= right.valueDouble
  of Type.Timestamp   : left.valueTimestamp   &= right.valueTimestamp
  of Type.Date        : left.valueDate        &= right.valueDate
  of Type.Time        : left.valueTime        &= right.valueTime
  of Type.Interval    : left.valueInterval    &= right.valueInterval
  of Type.HugeInt     : left.valueHugeInt     &= right.valueHugeInt
  of Type.VarChar     : left.valueVarchar     &= right.valueVarchar
  of Type.Blob        : left.valueBlob        &= right.valueBlob
  of Type.Decimal     : left.valueDecimal     &= right.valueDecimal
  of Type.TimestampS  : left.valueTimestampS  &= right.valueTimestampS
  of Type.TimestampMs : left.valueTimestampMs &= right.valueTimestampMs
  of Type.TimestampNs : left.valueTimestampNs &= right.valueTimestampNs
  of Type.Enum        : left.valueEnum        &= right.valueEnum
  of Type.List        : left.valueList        &= right.valueList
  of Type.Struct      : left.valueStruct      &= right.valueStruct
