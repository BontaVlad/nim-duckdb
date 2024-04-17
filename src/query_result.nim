import std/[sugar, sequtils, math, logging]
import api

const
  BITS_PER_VALUE = 64
  STRING_INLINE_LENGTH = 12


var logger = newConsoleLogger()


type
  QueryResult* = object of duckdb_result
  DataChunk* = distinct ptr duckdb_data_chunk
  PendingQueryResult* = object of duckdb_pending_result
  Column = object
    idx: idxt
    name: string
    tpy: enumduckdbtype
  ValidityMask* = object
    mask: seq[uint64]
  Vector* = ref object
    case kind*: enumduckdbtype
    of Duckdbtypeinvalid: valueInvalid*: uint8
    of Duckdbtypeboolean: valueBoolean*: seq[bool]
    of Duckdbtypetinyint: valueTinyint*: seq[int8]
    of Duckdbtypeutinyint: valueUtinyint*: seq[uint8]
    of Duckdbtypesmallint: valueSmallint*: seq[int16]
    of Duckdbtypeusmallint: valueUsmallint*: seq[uint16]
    of Duckdbtypeinteger: valueInteger*: seq[int32]
    of Duckdbtypeuinteger: valueUinteger*: seq[uint32]
    of Duckdbtypebigint: valueBigint*: seq[int64]
    of Duckdbtypeubigint: valueUbigint*: seq[uint64]
    of Duckdbtypefloat: valueFloat*: seq[float32]
    of Duckdbtypedouble: valueDouble*: seq[float64]
    of Duckdbtypevarchar: valueVarchar*: seq[string]
    else: discard
    # of Duckdbtypetimestamp: valueTimestamp: int
    # of Duckdbtypedate: valueDate: int
    # of Duckdbtypetime: valueTime: int
    # of Duckdbtypeinterval: valueInterval: int
    # of Duckdbtypehugeint: valueHugeint: int
    # of Duckdbtypedecimal: valueDecimal: cstring
    # of Duckdbtypetimestamps: valueTimestamps: int
    # of Duckdbtypetimestampms: valueTimestampms: int
    # of Duckdbtypetimestampns: valueTimestampns: int
    # of Duckdbtypeenum: valueEnum: int
    # of Duckdbtypelist: valueList: int
    # of Duckdbtypestruct: valueStruct: int
    # of Duckdbtypemap: valueMap: int
    # of Duckdbtypeuuid: valueUuid: int
    # of Duckdbtypeunion: valueUnion: int
    # of Duckdbtypebit: valueBit: int


converter toBase*(d: ptr DataChunk): ptr duckdbdatachunk = cast[ptr duckdbdatachunk](d)
converter toBase*(d: DataChunk): duckdbdatachunk = cast[duckdbdatachunk](d)
converter toBool*(d: DataChunk): bool = not isNil(d) or duckdbdatachunkgetsize(d).int > 0


converter toBase*(p: ptr PendingQueryResult): ptr duckdb_pending_result = cast[ptr duckdb_pending_result](p)
converter toBase*(p: PendingQueryResult): duckdb_pending_result = cast[duckdb_pending_result](p)


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
  result.tpy = duckdb_column_type(qresult.addr, at)
  echo repr result


proc newValidityMask(v: duckdbvector): ValidityMask =
  let
    size_words = duckdbvectorsize() div BITS_PER_VALUE
    raw = cast[ptr UncheckedArray[uint64]](duckdb_vector_get_validity(v))

  result.mask = collect:
      for i in 0..<size_words:
        raw[i]


proc isValid(m: ValidityMask, idx: int): bool =
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


proc newVector(col: Column): Vector =
  result = Vector(kind: col.tpy)
  case col.tpy
  of Duckdbtypeboolean: result.valueBoolean = newSeq[bool]()
  of Duckdbtypetinyint: result.valueTinyint = newSeq[int8]()
  of Duckdbtypeutinyint: result.valueUTinyint = newSeq[uint8]()
  of Duckdbtypeinteger: result.valueInteger = newSeq[int32]()
  of Duckdbtypeuinteger: result.valueUinteger = newSeq[uint32]()
  of Duckdbtypebigint: result.valueBigint = newSeq[int64]()
  of Duckdbtypeubigint: result.valueUbigint = newSeq[uint64]()
  of Duckdbtypefloat: result.valueFloat = newSeq[float32]()
  of Duckdbtypedouble: result.valueDouble = newSeq[float64]()
  of Duckdbtypevarchar: result.valueVarchar = newSeq[string]()
  else: discard


# TODO: make this prettier with macros
proc newVector(chunk: DataChunk, col: Column): Vector =
  result = Vector(kind: col.tpy)
  let
    vec = duckdb_data_chunk_get_vector(chunk, col.idx)
    validityMask = newValidityMask(vec)
    handle = duckdbvectorgetdata(vec)
    # allValid = cast[ptr UncheckedArray[uint64]](duckdb_vector_get_validity(vec))

  let chunk_size = duckdb_data_chunk_get_size(chunk).int
  case col.tpy
  of Duckdbtypeinvalid: raise newException(ValueError, "got invalid type")
  of Duckdbtypeboolean: parseHandle(handle, uint8, result.valueBoolean, bool)
  of Duckdbtypetinyint: parseHandle(handle, result.valueTinyint)
  of Duckdbtypeutinyint: parseHandle(handle, result.valueUtinyint)
  of Duckdbtypesmallint: parseHandle(handle, result.valueSmallint)
  of Duckdbtypeusmallint: parseHandle(handle, result.valueUsmallint)
  of Duckdbtypeinteger: parseHandle(handle, cint, result.valueInteger, int32)
  of Duckdbtypeuinteger: parseHandle(handle, result.valueUinteger)
  of Duckdbtypebigint: parseHandle(handle, result.valueBigint)
  of Duckdbtypeubigint: parseHandle(handle, result.valueUbigint)
  of Duckdbtypefloat: parseHandle(handle, result.valueFloat)
  of Duckdbtypedouble: parseHandle(handle, result.valueDouble)
  of Duckdbtypevarchar, Duckdbtypeblob:
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

  # of Duckdbtypetimestamp: result.valueTimestamp = 123456789
  # of Duckdbtypedate: result.valueDate = 20220101
  # of Duckdbtypetime: result.valueTime = 120000
  # of Duckdbtypeinterval: result.valueInterval = 500
  # of Duckdbtypehugeint: result.valueHugeint = 9876543210


  # of Duckdbtypeblob: result.valueBlob = "Binary data"
  # of Duckdbtypedecimal: result.valueDecimal = "3.14159265358979323846"
  # of Duckdbtypetimestamps: result.valueTimestamps = 987654321
  # of Duckdbtypetimestampms: result.valueTimestampms = 1234567890123
  # of Duckdbtypetimestampns: result.valueTimestampns = 987654321012345678
  # of Duckdbtypeenum: result.valueEnum = 2
  # # of Duckdbtypelist: result.valueList = @[newVal(Duckdbtypeinteger), newVal(Duckdbtypevarchar)]
  # # of Duckdbtypestruct: result.valueStruct = @[newVal(Duckdbtypeboolean), newVal(Duckdbtypetinyint)]
  # # of Duckdbtypemap: result.valueMap = @[@[newVal(Duckdbtypevarchar), newVal(Duckdbtypeinteger)]]
  # # of Duckdbtypeuuid: result.valueUuid = "123e4567-e89b-12d3-a456-426614174001"
  # # of Duckdbtypeunion: result.valueUnion = @[newVal(Duckdbtypevarchar), newVal(Duckdbtypetimestamp)]
  # # of Duckdbtypebit: result.valueBit = 1
  else: discard


iterator columns(qresult: QueryResult): Column =
  for i in 0..<duckdb_column_count(qresult.addr):
    yield newColumn(qresult, i)


iterator chunks*(qresult: QueryResult): seq[Vector] =
  let columns = qresult.columns.toSeq

  for i in 0..<duckdb_result_chunk_count(qresult):
    let chunk = if qresult.isStreaming: newChunk(qresult) else: newChunk(qresult, i)
    # for row_idx in 0..<duckdb_data_chunk_get_size(chunk):
    var row = newSeq[Vector](len(columns))
    for col in columns:
      row[col.idx] = newVector(chunk, col)
    yield row


proc fetchall*(qresult: QueryResult): seq[Vector] =
  let columns = qresult.columns.toSeq
  result = newSeq[Vector](len(columns))

  for col in columns:
    result[col.idx] = newVector(col)

  for chunk in qresult.chunks:
    for col in columns:
      case col.tpy
      of Duckdbtypeboolean: result[col.idx].valueBoolean &= chunk[col.idx].valueBoolean
      of Duckdbtypetinyint: result[col.idx].valueTinyint &= chunk[col.idx].valueTinyint
      of Duckdbtypeutinyint: result[col.idx].valueUtinyint &= chunk[col.idx].valueUtinyint
      of Duckdbtypesmallint: result[col.idx].valueSmallint &= chunk[col.idx].valueSmallint
      of Duckdbtypeusmallint: result[col.idx].valueUsmallint &= chunk[col.idx].valueUsmallint
      of Duckdbtypeinteger: result[col.idx].valueInteger &= chunk[col.idx].valueInteger
      of Duckdbtypeuinteger: result[col.idx].valueUinteger &= chunk[col.idx].valueUinteger
      of Duckdbtypebigint: result[col.idx].valueBigint &= chunk[col.idx].valueBigint
      of Duckdbtypeubigint: result[col.idx].valueUbigint &= chunk[col.idx].valueUbigint
      of Duckdbtypefloat: result[col.idx].valueFloat &= chunk[col.idx].valueFloat
      of Duckdbtypedouble: result[col.idx].valueDouble &= chunk[col.idx].valueDouble
      of Duckdbtypevarchar: result[col.idx].valueVarchar &= chunk[col.idx].valueVarchar
      else: discard


proc error*(qresult: QueryResult): string =
  result = $duckdb_result_error(qresult.addr)
