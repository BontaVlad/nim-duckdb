import std/[sugar, tables, times, math, strformat, logging]

import nint128
import decimal

import /[api, logger, value]

const
  BITS_PER_VALUE = 64
  STRING_INLINE_LENGTH = 12
  SECONDS_PER_DAY = 86400

type
  DuckString = distinct cstring

  Vector* = object
    mask: seq[uint64] = newSeq[uint64]()
    case kind*: DuckType
    of DuckType.Invalid: valueInvalid*: uint8
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
    of DuckType.List: valueList*: seq[seq[Vector]]
    of DuckType.Struct: valueStruct*: seq[Table[string, Value]]
    # of DuckType.Map         :            valueMap*: seq[Table[Vector, Vector]]               # Similar to Struct
    # of DuckType.UUID        :           valueUUID*: seq[string]                              # UUID stored as a string
    # of DuckType.Union       :          valueUnion*: seq[Vector]                              # Union of types
    # of DuckType.Bit         :            valueBit*: seq[bool]
    # of DuckType.TimeTz      :         valueTimeTz*: seq[tuple[time: Time, timezone: string]] # Time with timezone
    # of DuckType.TimestampTz :    valueTimestampTz*: seq[tuple[timestamp: Time, timezone: string]]
    # of DuckType.UHugeInt    :       valueUHugeint*: seq[tuple[high: uint64, low: uint64]]    # Unsigned 128-bit int
    # of DuckType.Array       :          valueArray*: seq[Vector]                              # Array of vectors
    # of DuckType.Any         :            valueAny*: seq[RootRef]
    # of DuckType.VarInt      :         valueVarint*: seq[int]                                 # Variable-sized integer
    # of DuckType.SqlNull     :        valueSqlNull*: seq[bool]                                # SqlNull could be a boolean

  LogicalType* = object
    handle*: duckdb_logical_type

# converter toBase*(l: ptr LogicalType): ptr duckdb_logical_type =
#   cast[ptr duckdb_logical_type](l)

# converter toBase*(l: LogicalType): duckdb_logical_type =
#   cast[duckdb_logical_type](l)

proc `=destroy`*(ltp: LogicalType) =
  # consoleLogger.log(lvlDebug, fmt"destroy: {cast[int](addr(ltp)):#x}")
  # consoleLogger.log(lvlDebug, fmt"Freed logical type: {cast[int](addr(ltp)):#x}")
  # consoleLogger.log(
  #   lvlDebug, fmt"destroy: {cast[int](ltp.addr):#x} -> {cast[int](ltp.handle):#x}"
  # )
  if not isNil(ltp.addr) and not isNil(ltp.handle.addr):
    duckdb_destroy_logical_type(ltp.handle.addr)

proc `=destroy`*(dstr: DuckString) =
  if not dstr.cstring.isNil:
    duckdb_free(cast[pointer](dstr.cstring))

proc `$`*(dstr: DuckString): string =
  if dstr.cstring.isNil:
    return ""
  result = $dstr.cstring

proc newDuckType*(i: enum_DUCKDB_TYPE): DuckType =
  result = DuckType(ord(i))

proc newDuckType*(i: LogicalType): DuckType =
  let id = duckdb_get_type_id(i.handle)
  result = DuckType(ord(id))

proc newLogicalType*(i: duckdb_logical_type): LogicalType =
  result = LogicalType(handle: i)
  # consoleLogger.log(
  #   lvlDebug, fmt"create: {cast[int](result.addr):#x} -> {cast[int](result.handle):#x}"
  # )

proc `$`*(ltp: LogicalType): string =
  result = $DuckString(duckdb_logical_type_get_alias(ltp.handle))


proc isValid*(vec: Vector, idx: int): bool {.inline.} =
  let
    entryIdx = idx div BITS_PER_VALUE
    indexInEntry = idx mod BITS_PER_VALUE
  result = (vec.mask[entryIdx] and (1.uint64 shl indexInEntry)) != 0

template collectValid[T, U](
    handle: pointer, vec: Vector, offset, size: int, transform: untyped
): seq[U] =
  let raw = cast[ptr UncheckedArray[T]](handle)
  collect:
    for i in offset ..< size:
      # if vec.isValid(i):
      transform(raw[i])

template collectValidString[T](
    handle: pointer,
    vec: Vector,
    offset, size: int,
    resultField: var auto,
    transform: untyped,
): untyped =
  resultField = collect:
    for i in offset ..< size:
      if vec.isValid(i):
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
          "" # TODO: not sure about this
        else:
          newSeq[byte](0) # Empty byte array for blobs

template parseHandle(
    handle: pointer,
    vec: Vector,
    rawType: untyped,
    resultField: untyped,
    castType: untyped,
): untyped =
  let raw = cast[ptr UncheckedArray[rawType]](handle)
  resultField = collectValid[rawType, type(resultField[0])](raw, vec, offset, size) do(
    val: rawType
  ) -> auto:
    castType(val)

template parseHandle(
    handle: pointer, vec: Vector, rawType: untyped, resultField: untyped
): untyped =
  parseHandle(handle, vec, rawType, resultField, rawType)

template parseDecimalBigInt(
    handle: pointer, vec: Vector, scale: int, resultField: seq[DecimalType]
) =
  resultField = collectValid[int64, DecimalType](handle, vec, offset, size) do(
    val: int64
  ) -> DecimalType:
    let value = val.float / pow(10.float, scale.float)
    newDecimal($value)

template parseDecimalHugeInt(
    handle: pointer, vec: Vector, scale: int, resultField: seq[DecimalType]
) =
  resultField = collectValid[duckdb_hugeint, DecimalType](handle, vec, offset, size) do(
    val: duckdb_hugeint
  ) -> DecimalType:
    let
      value = add64Plus64ToI128(val.lower.uint64, (val.upper.int64 shl 64).uint64)
      fractional = cast[float](value) / pow(10.float, scale.float)
    newDecimal($fractional)

proc newValue*(vec: Vector, idx: int): Value =
  let isValid = vec.isValid(idx)
  case vec.kind
  of DuckType.Invalid:
    return newValue(vec.kind, isValid)
  of DuckType.Boolean:
    return newValue(vec.kind, isValid, vec.valueBoolean[idx])
  of DuckType.TinyInt:
    return newValue(vec.kind, isValid, vec.valueTinyint[idx])
  of DuckType.SmallInt:
    return newValue(vec.kind, isValid, vec.valueSmallint[idx])
  of DuckType.Integer:
    return newValue(vec.kind, isValid, vec.valueInteger[idx])
  of DuckType.BigInt:
    return newValue(vec.kind, isValid, vec.valueBigint[idx])
  of DuckType.UTinyInt:
    return newValue(vec.kind, isValid, vec.valueUTinyint[idx])
  of DuckType.USmallInt:
    return newValue(vec.kind, isValid, vec.valueUSmallint[idx])
  of DuckType.UInteger:
    return newValue(vec.kind, isValid, vec.valueUInteger[idx])
  of DuckType.UBigInt:
    return newValue(vec.kind, isValid, vec.valueUBigint[idx])
  of DuckType.Float:
    return newValue(vec.kind, isValid, vec.valueFloat[idx])
  of DuckType.Double:
    return newValue(vec.kind, isValid, vec.valueDouble[idx])
  of DuckType.Timestamp, DuckType.TimestampS, DuckType.TimestampMs, DuckType.TimestampNs:
    return newValue(vec.kind, isValid, vec.valueTimestamp[idx])
  of DuckType.Date:
    return newValue(vec.kind, isValid, vec.valueDate[idx])
  of DuckType.Time:
    return newValue(vec.kind, isValid, vec.valueTime[idx])
  of DuckType.Interval:
    return newValue(vec.kind, isValid, vec.valueInterval[idx])
  of DuckType.HugeInt:
    discard
    # let lower = uint64(vec.valueHugeint[idx])
    # let upper = uint64((vec.valueHugeint[idx] shr 64))
    # return newValue(vec.kind, isValid, lower, upper)
  of DuckType.Varchar:
    return newValue(vec.kind, isValid, vec.valueVarchar[idx])
  of DuckType.Blob:
    return newValue(vec.kind, isValid, vec.valueBlob[idx])
  of DuckType.Decimal:
    return newValue(vec.kind, isValid, vec.valueDecimal[idx])
  of DuckType.Enum:
    return newValue(vec.kind, isValid, vec.valueEnum[idx])
  of DuckType.List:
    discard
    # return newValue(vec.kind, isValid, vec.valueList[idx])
  of DuckType.Struct:
    discard
    # return newValue(vec.kind, isValid, vec.valueStruct[idx])
  else:
    raise newException(ValueError, "Unsupported DuckType in Vector")

proc newVector*(kind: DuckType): Vector =
  result = Vector(kind: kind)
  case kind
  of DuckType.Invalid:
    result.valueInvalid = 0
  # TODO: maybe raise an exception
  of DuckType.Boolean:
    result.valueBoolean = newSeq[bool]()
  of DuckType.TinyInt:
    result.valueTinyint = newSeq[int8]()
  of DuckType.SmallInt:
    result.valueSmallint = newSeq[int16]()
  of DuckType.Integer:
    result.valueInteger = newSeq[int32]()
  of DuckType.BigInt:
    result.valueBigint = newSeq[int64]()
  of DuckType.UTinyInt:
    result.valueUTinyint = newSeq[uint8]()
  of DuckType.USmallInt:
    result.valueUSmallint = newSeq[uint16]()
  of DuckType.UInteger:
    result.valueUInteger = newSeq[uint32]()
  of DuckType.UBigInt:
    result.valueUBigint = newSeq[uint64]()
  of DuckType.Float:
    result.valueFloat = newSeq[float32]()
  of DuckType.Double:
    result.valueDouble = newSeq[float64]()
  of DuckType.Timestamp:
    result.valueTimestamp = newSeq[DateTime]()
  of DuckType.Date:
    result.valueDate = newSeq[DateTime]()
  of DuckType.Time:
    result.valueTime = newSeq[Time]()
  of DuckType.Interval:
    result.valueInterval = newSeq[TimeInterval]()
  of DuckType.HugeInt:
    result.valueHugeint = newSeq[Int128]()
  of DuckType.Varchar:
    result.valueVarchar = newSeq[string]()
  of DuckType.Blob:
    result.valueBlob = newSeq[seq[byte]]()
  of DuckType.Decimal:
    result.valueDecimal = newSeq[DecimalType]()
  of DuckType.TimestampS:
    result.valueTimestampS = newSeq[DateTime]()
  of DuckType.TimestampMs:
    result.valueTimestampMs = newSeq[DateTime]()
  of DuckType.TimestampNs:
    result.valueTimestampNs = newSeq[DateTime]()
  of DuckType.Enum:
    result.valueEnum = newSeq[uint]()
  of DuckType.List:
    result.valueList = newSeq[seq[Vector]]()
  of DuckType.Struct:
    result.valueStruct = newSeq[Table[string, Value]]()
  # of DuckType.Map:            result.valueMap         = newSeq[Table[Vector, Vector]]()
  # of DuckType.UUID:           result.valueUUID        = newSeq[string]()
  # of DuckType.Union:          result.valueUnion       = newSeq[Vector]()
  # of DuckType.Bit:            result.valueBit         = newSeq[bool]()
  # of DuckType.TimeTz:         result.valueTimeTz      = newSeq[tuple[time: Time, timezone: string]]()
  # of DuckType.TimestampTz:    result.valueTimestampTz = newSeq[tuple[timestamp: Time, timezone: string]]()
  # of DuckType.UHugeInt:       result.valueUHugeint    = newSeq[tuple[high: uint64, low: uint64]]()
  # of DuckType.Array:          result.valueArray       = newSeq[Vector]()
  # of DuckType.Any:            result.valueAny         = newSeq[RootRef]()
  # of DuckType.VarInt:         result.valueVarint      = newSeq[int]()
  # of DuckType.SqlNull:        result.valueSqlNull     = newSeq[bool]()

# # TODO: this will not work
# proc `[]`*(this: Vector, r: HSlice[int, int]): Vector =
#   result = newVector(kind = this.kind)
#   case this.kind
#   of DuckType.Invalid:
#     discard
#   # for now
#   of DuckType.Boolean:
#     result.valueBoolean = this.valueBoolean[r.a .. r.b]
#   of DuckType.TinyInt:
#     result.valueTinyint = this.valueTinyint[r.a .. r.b]
#   of DuckType.SmallInt:
#     result.valueSmallint = this.valueSmallint[r.a .. r.b]
#   of DuckType.Integer:
#     result.valueInteger = this.valueInteger[r.a .. r.b]
#   of DuckType.BigInt:
#     result.valueBigint = this.valueBigint[r.a .. r.b]
#   of DuckType.UTinyInt:
#     result.valueUtinyint = this.valueUtinyint[r.a .. r.b]
#   of DuckType.USmallInt:
#     result.valueUsmallint = this.valueUsmallint[r.a .. r.b]
#   of DuckType.UInteger:
#     result.valueUinteger = this.valueUinteger[r.a .. r.b]
#   of DuckType.UBigInt:
#     result.valueUbigint = this.valueUbigint[r.a .. r.b]
#   of DuckType.Float:
#     result.valueFloat = this.valueFloat[r.a .. r.b]
#   of DuckType.Double:
#     result.valueDouble = this.valueDouble[r.a .. r.b]
#   of DuckType.Timestamp:
#     result.valueTimestamp = this.valueTimestamp[r.a .. r.b]
#   of DuckType.Date:
#     result.valueDate = this.valueDate[r.a .. r.b]
#   of DuckType.Time:
#     result.valueTime = this.valueTime[r.a .. r.b]
#   of DuckType.Interval:
#     result.valueInterval = this.valueInterval[r.a .. r.b]
#   of DuckType.HugeInt:
#     result.valueHugeInt = this.valueHugeInt[r.a .. r.b]
#   of DuckType.VarChar:
#     result.valueVarchar = this.valueVarchar[r.a .. r.b]
#   of DuckType.Blob:
#     result.valueBlob = this.valueBlob[r.a .. r.b]
#   of DuckType.Decimal:
#     result.valueDecimal = this.valueDecimal[r.a .. r.b]
#   of DuckType.TimestampS:
#     result.valueTimestampS = this.valueTimestampS[r.a .. r.b]
#   of DuckType.TimestampMs:
#     result.valueTimestampMs = this.valueTimestampMs[r.a .. r.b]
#   of DuckType.TimestampNs:
#     result.valueTimestampNs = this.valueTimestampNs[r.a .. r.b]
#   of DuckType.Enum:
#     result.valueEnum = this.valueEnum[r.a .. r.b]
#   of DuckType.List:
#     result.valueList = this.valueList[r.a .. r.b]
#   of DuckType.Struct:
#     result.valueStruct = this.valueStruct[r.a .. r.b]

# TODO: make this prettier with macros
proc newVector*(
    vec: duckdb_vector,
    offset: int,
    size: int,
    kind: DuckType,
    logical_type: LogicalType,
): Vector =
  result = Vector(kind: kind)

  let
    handle = duckdb_vector_get_data(vec)
    tuples_in_array = size div BITS_PER_VALUE
    # TODO: If all values are valid, this function MIGHT return NULL!
    raw = cast[ptr UncheckedArray[uint64]](duckdb_vector_get_validity(vec))

  for i in 0 .. tuples_in_array:
    result.mask.add(raw[i])

  # TODO: abstract a lot of duplication around here
  case kind
  of DuckType.Invalid:
    raise newException(ValueError, "got invalid type")
  of DuckType.Boolean:
    parseHandle(handle, result, uint8, result.valueBoolean, bool)
  of DuckType.TinyInt:
    parseHandle(handle, result, int8, result.valueTinyint)
  of DuckType.SmallInt:
    parseHandle(handle, result, int16, result.valueSmallint)
  of DuckType.Integer:
    parseHandle(handle, result, cint, result.valueInteger, int32)
  of DuckType.BigInt:
    parseHandle(handle, result, int64, result.valueBigint)
  of DuckType.UTinyInt:
    parseHandle(handle, result, uint8, result.valueUtinyint)
  of DuckType.USmallInt:
    parseHandle(handle, result, uint16, result.valueUSmallint)
  of DuckType.UInteger:
    parseHandle(handle, result, uint32, result.valueUInteger)
  of DuckType.UBigInt:
    parseHandle(handle, result, uint64, result.valueUBigint)
  of DuckType.Float:
    parseHandle(handle, result, float32, result.valueFloat)
  of DuckType.Double:
    parseHandle(handle, result, float64, result.valueDouble)
  of DuckType.Timestamp:
    result.valueTimestamp = collectValid[int64, DateTime](handle, result, offset, size) do(
      val: int64
    ) -> DateTime:
      let
        seconds = val div 1000000
        microseconds = val mod 1000000
      fromUnix(seconds).inZone(utc()) + initDuration(microseconds = microseconds)
  of DuckType.Date:
    result.valueDate = collectValid[int32, DateTime](handle, result, offset, size) do(
      val: int32
    ) -> DateTime:
      inZone(fromUnix(val.int32 * SECONDS_PER_DAY), utc())
  of DuckType.Time:
    result.valueTime = collectValid[int64, Time](handle, result, offset, size) do(
      val: int64
    ) -> Time:
      let
        nanos = val * 1000 # Convert microseconds to nanoseconds
        seconds = nanos div 1_000_000_000
        remainingNanos = nanos mod 1_000_000_000
      initTime(seconds.int, remainingNanos.int)
  of DuckType.Interval:
    result.valueInterval = collectValid[duckdbInterval, TimeInterval](
      handle, result, offset, size
    ) do(val: duckdbInterval) -> TimeInterval:
      initTimeInterval(months = val.months, days = val.days, microseconds = val.micros)
  of DuckType.HugeInt:
    result.valueHugeInt = collectValid[duckdb_hugeint, Int128](
      handle, result, offset, size
    ) do(val: duckdb_hugeint) -> Int128:
      add64Plus64ToI128(val.lower.uint64, (val.upper.int64 shl 64).uint64)
  of DuckType.VarChar:
    collectValidString[string](handle, result, offset, size, result.valueVarChar) do(
      rawStr: cstring
    ) -> string:
      $rawStr
  of DuckType.Blob:
    collectValidString[seq[byte]](handle, result, offset, size, result.valueBlob) do(
      rawStr: cstring
    ) -> seq[byte]:
      var byteArray = newSeq[byte](rawStr.len)
      copyMem(addr byteArray[0], unsafeAddr rawStr[0], rawStr.len)
      byteArray
  of DuckType.Decimal:
    let
      scale = duckdb_decimal_scale(logical_type.handle).int
      width = duckdb_decimal_width(logical_type.handle).int
    if width <= 18:
      parseDecimalBigInt(handle, result, scale, result.valueDecimal)
    else:
      parseDecimalHugeInt(handle, result, scale, result.valueDecimal)
  of DuckType.TimestampS:
    result.valueTimestampS = collectValid[int64, DateTime](handle, result, offset, size) do(
      val: int64
    ) -> DateTime:
      fromUnix(val).inZone(utc())
  of DuckType.TimestampMs:
    result.valueTimestampMs = collectValid[int64, DateTime](
      handle, result, offset, size
    ) do(val: int64) -> DateTime:
      fromUnix(val div 1000).inZone(utc()) + initDuration(milliseconds = val mod 1000)
  of DuckType.TimestampNs:
    result.valueTimestampNs = collectValid[int64, Datetime](
      handle, result, offset, size
    ) do(val: int64) -> DateTime:
      let
        seconds = val div 1_000_000_000
        microseconds = val mod 1_000_000_000 div 1000
      fromUnix(seconds).inZone(utc()) + initDuration(microseconds = microseconds)
  of DuckType.Enum:
    let enum_tp = cast[DuckType](duckdb_enum_internal_type(logical_type.handle))
    case enum_tp
    of UTinyInt:
      parseHandle(handle, result, uint8, result.valueEnum, uint)
    of USmallInt:
      parseHandle(handle, result, uint16, result.valueEnum, uint)
    of UInteger:
      parseHandle(handle, result, uint32, result.valueEnum, uint)
    else:
      raise newException(ValueError, fmt"got invalid enum type: {enum_tp}")
  of DuckType.List:
    let
      raw = cast[ptr UncheckedArray[duckdb_list_entry]](handle)
      children = duckdb_list_vector_get_child(vec)

    result.valueList = collect:
      for i in offset ..< size:
        echo isValid(result, i)
        if isValid(result, i):
          let
            list_data = raw[i]
            child_type =
              newLogicalType(duckdb_list_type_child_type(logical_type.handle))
            child = newVector(
              vec = children,
              offset = list_data.offset.int,
              size = (list_data.offset + list_data.length).int,
              kind = newDuckType(child_type),
              logical_type = child_type,
            )
          @[child]
  of DuckType.Struct:
    let child_count = duckdb_struct_type_child_count(logical_type.handle).int
    var vectorStruct = initTable[string, Vector]()
    for child_idx in 0 ..< child_count:
      let
        children = duckdb_struct_vector_get_child(vec, child_idx.idx_t)
        child_type = newLogicalType(
          duckdb_struct_type_child_type(logical_type.handle, child_idx.idx_t)
        )
        child_name = cast[DuckString](duckdb_struct_type_child_name(
          logical_type.handle, child_idx.idx_t
        ))
        child = newVector(
          vec = children,
          offset = 0,
          size = size,
          kind = newDuckType(child_type),
          logical_type = child_type,
        )

      vectorStruct[$child_name] = child
    result.valueStruct = collect:
      for i in offset ..< size:
        var row = initTable[string, Value]()
        for key, child_vector in vectorStruct.pairs:
          # row[key] = newValue(child_vector.kind, child_vector.valueBigint[i])
          row[key] = newValue(child_vector, i)
        row

proc `$`*(vector: Vector): string =
  case vector.kind
  of DuckType.Invalid:
    $vector.valueInvalid
  of DuckType.Boolean:
    $vector.valueBoolean
  of DuckType.TinyInt:
    $vector.valueTinyint
  of DuckType.SmallInt:
    $vector.valueSmallint
  of DuckType.Integer:
    $vector.valueInteger
  of DuckType.BigInt:
    $vector.valueBigint
  of DuckType.UTinyInt:
    $vector.valueUtinyint
  of DuckType.USmallInt:
    $vector.valueUsmallint
  of DuckType.UInteger:
    $vector.valueUinteger
  of DuckType.UBigInt:
    $vector.valueUbigint
  of DuckType.Float:
    $vector.valueFloat
  of DuckType.Double:
    $vector.valueDouble
  of DuckType.Timestamp:
    $vector.valueTimestamp
  of DuckType.Date:
    $vector.valueDate
  of DuckType.Time:
    $vector.valueTime
  of DuckType.Interval:
    $vector.valueInterval
  of DuckType.HugeInt:
    $vector.valueHugeInt
  of DuckType.VarChar:
    $vector.valueVarchar
  of DuckType.Blob:
    $vector.valueBlob
  of DuckType.Decimal:
    $vector.valueDecimal
  of DuckType.TimestampS:
    $vector.valueTimestampS
  of DuckType.TimestampMs:
    $vector.valueTimestampMs
  of DuckType.TimestampNs:
    $vector.valueTimestampNs
  of DuckType.Enum:
    $vector.valueEnum
  of DuckType.List:
    $vector.valueList
  of DuckType.Struct:
    $vector.valueStruct

func `&=`*(left: var Vector, right: Vector): void =
  if left.kind != right.kind:
    raise newException(
      ValueError,
      fmt"Vector.kind:{left.kind} != Vector.kind:{right.kind}. Can't concatenate different kinds of vectors",
    )

  case left.kind
  of DuckType.Invalid:
    discard
  # for now
  of DuckType.Boolean:
    left.valueBoolean &= right.valueBoolean
  of DuckType.TinyInt:
    left.valueTinyint &= right.valueTinyint
  of DuckType.SmallInt:
    left.valueSmallint &= right.valueSmallint
  of DuckType.Integer:
    left.valueInteger &= right.valueInteger
  of DuckType.BigInt:
    left.valueBigint &= right.valueBigint
  of DuckType.UTinyInt:
    left.valueUtinyint &= right.valueUtinyint
  of DuckType.USmallInt:
    left.valueUsmallint &= right.valueUsmallint
  of DuckType.UInteger:
    left.valueUinteger &= right.valueUinteger
  of DuckType.UBigInt:
    left.valueUbigint &= right.valueUbigint
  of DuckType.Float:
    left.valueFloat &= right.valueFloat
  of DuckType.Double:
    left.valueDouble &= right.valueDouble
  of DuckType.Timestamp:
    left.valueTimestamp &= right.valueTimestamp
  of DuckType.Date:
    left.valueDate &= right.valueDate
  of DuckType.Time:
    left.valueTime &= right.valueTime
  of DuckType.Interval:
    left.valueInterval &= right.valueInterval
  of DuckType.HugeInt:
    left.valueHugeInt &= right.valueHugeInt
  of DuckType.VarChar:
    left.valueVarchar &= right.valueVarchar
  of DuckType.Blob:
    left.valueBlob &= right.valueBlob
  of DuckType.Decimal:
    left.valueDecimal &= right.valueDecimal
  of DuckType.TimestampS:
    left.valueTimestampS &= right.valueTimestampS
  of DuckType.TimestampMs:
    left.valueTimestampMs &= right.valueTimestampMs
  of DuckType.TimestampNs:
    left.valueTimestampNs &= right.valueTimestampNs
  of DuckType.Enum:
    left.valueEnum &= right.valueEnum
  of DuckType.List:
    left.valueList &= right.valueList
  of DuckType.Struct:
    left.valueStruct &= right.valueStruct

proc len*(vec: Vector): int =
  case vec.kind
  of DuckType.Invalid:
    return 0
  of DuckType.Boolean:
    return vec.valueBoolean.len
  of DuckType.TinyInt:
    return vec.valueTinyint.len
  of DuckType.SmallInt:
    return vec.valueSmallint.len
  of DuckType.Integer:
    return vec.valueInteger.len
  of DuckType.BigInt:
    return vec.valueBigint.len
  of DuckType.UTinyInt:
    return vec.valueUTinyint.len
  of DuckType.USmallInt:
    return vec.valueUSmallint.len
  of DuckType.UInteger:
    return vec.valueUInteger.len
  of DuckType.UBigInt:
    return vec.valueUBigint.len
  of DuckType.Float:
    return vec.valueFloat.len
  of DuckType.Double:
    return vec.valueDouble.len
  of DuckType.Timestamp, DuckType.TimestampS, DuckType.TimestampMs, DuckType.TimestampNs:
    return vec.valueTimestamp.len
  of DuckType.Date:
    return vec.valueDate.len
  of DuckType.Time:
    return vec.valueTime.len
  of DuckType.Interval:
    return vec.valueInterval.len
  of DuckType.HugeInt:
    return vec.valueHugeint.len
  of DuckType.Varchar:
    return vec.valueVarchar.len
  of DuckType.Blob:
    return vec.valueBlob.len
  of DuckType.Decimal:
    return vec.valueDecimal.len
  of DuckType.Enum:
    return vec.valueEnum.len
  of DuckType.List:
    return vec.valueList.len
  of DuckType.Struct:
    return vec.valueStruct.len

iterator items*(vec: Vector): Value =
  for idx in 0 ..< vec.len:
    yield newValue(vec, idx)

proc `[]`*(v: Vector, idx: int): Value =
  result = newValue(v, idx)

proc `[]`*(v: Vector, slice: HSlice[int, int]): Vector =

  # Validate slice bounds
  let start = slice.a
  let stop = slice.b

  if start < 0 or stop >= v.mask.len or start > stop:
    raise newException(IndexDefect, "Invalid vector slice")

  # Create a new vector with the same kind
  result = Vector(kind: v.kind, mask: newSeq[uint64]())

  # Calculate the number of mask words needed for the slice
  let startMaskWord = start div 64
  let endMaskWord = stop div 64
  let startBit = start mod 64
  let endBit = stop mod 64

  # Copy and adjust the mask
  for i in startMaskWord .. endMaskWord:
    var maskWord = v.mask[i]

    # Adjust mask for the first and last words if needed
    if i == startMaskWord:
      maskWord = maskWord shr startBit
    if i == endMaskWord:
      # Clear bits after the last bit in the last mask word
      let clearBits = 64 - endBit - 1
      maskWord = maskWord and ((1'u64 shl (endBit + 1)) - 1)

    result.mask.add(maskWord)

  # Copy data based on the vector's kind
  case v.kind
  of DuckType.Invalid:
    discard
  of DuckType.Boolean:
    result.valueBoolean = v.valueBoolean[start .. stop]
  of DuckType.TinyInt:
    result.valueTinyint = v.valueTinyint[start .. stop]
  of DuckType.SmallInt:
    result.valueSmallint = v.valueSmallint[start .. stop]
  of DuckType.Integer:
    result.valueInteger = v.valueInteger[start .. stop]
  of DuckType.BigInt:
    result.valueBigint = v.valueBigint[start .. stop]
  of DuckType.UTinyInt:
    result.valueUTinyint = v.valueUTinyint[start .. stop]
  of DuckType.USmallInt:
    result.valueUSmallint = v.valueUSmallint[start .. stop]
  of DuckType.UInteger:
    result.valueUInteger = v.valueUInteger[start .. stop]
  of DuckType.UBigInt:
    result.valueUBigint = v.valueUBigint[start .. stop]
  of DuckType.Float:
    result.valueFloat = v.valueFloat[start .. stop]
  of DuckType.Double:
    result.valueDouble = v.valueDouble[start .. stop]
  of DuckType.Timestamp:
    result.valueTimestamp = v.valueTimestamp[start .. stop]
  of DuckType.Date:
    result.valueDate = v.valueDate[start .. stop]
  of DuckType.Time:
    result.valueTime = v.valueTime[start .. stop]
  of DuckType.Interval:
    result.valueInterval = v.valueInterval[start .. stop]
  of DuckType.HugeInt:
    result.valueHugeint = v.valueHugeint[start .. stop]
  of DuckType.Varchar:
    result.valueVarchar = v.valueVarchar[start .. stop]
  of DuckType.Blob:
    result.valueBlob = v.valueBlob[start .. stop]
  of DuckType.Decimal:
    result.valueDecimal = v.valueDecimal[start .. stop]
  of DuckType.TimestampS:
    result.valueTimestampS = v.valueTimestampS[start .. stop]
  of DuckType.TimestampMs:
    result.valueTimestampMs = v.valueTimestampMs[start .. stop]
  of DuckType.TimestampNs:
    result.valueTimestampNs = v.valueTimestampNs[start .. stop]
  of DuckType.Enum:
    result.valueEnum = v.valueEnum[start .. stop]
  of DuckType.List:
    result.valueList = v.valueList[start .. stop]
  of DuckType.Struct:
    result.valueStruct = v.valueStruct[start .. stop]
