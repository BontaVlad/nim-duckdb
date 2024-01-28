import std/[sugar, sequtils, math, logging]
import /[api]


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
    of Duckdbtypeinvalid: valueInvalid: int
    of Duckdbtypeboolean: valueBoolean: int
    of Duckdbtypetinyint: valueTinyint: int
    of Duckdbtypesmallint: valueSmallint: int
    of Duckdbtypebigint: valueBigint: seq[int64]
    of Duckdbtypeutinyint: valueUtinyint: int
    of Duckdbtypeusmallint: valueUsmallint: int
    of Duckdbtypeuinteger: valueUinteger: int
    of Duckdbtypeinteger: valueInteger*: seq[int]
    of Duckdbtypeubigint: valueUbigint: int
    of Duckdbtypefloat: valueFloat: float
    of Duckdbtypedouble: valueDouble: float
    of Duckdbtypetimestamp: valueTimestamp: int
    of Duckdbtypedate: valueDate: int
    of Duckdbtypetime: valueTime: int
    of Duckdbtypeinterval: valueInterval: int
    of Duckdbtypehugeint: valueHugeint: int
    of Duckdbtypevarchar: valueVarchar*: seq[string]
    of Duckdbtypeblob: valueBlob: cstring
    of Duckdbtypedecimal: valueDecimal: cstring
    of Duckdbtypetimestamps: valueTimestamps: int
    of Duckdbtypetimestampms: valueTimestampms: int
    of Duckdbtypetimestampns: valueTimestampns: int
    of Duckdbtypeenum: valueEnum: int
    else: discard
    # of Duckdbtypelist: valueList: seq[Val]
    # of Duckdbtypestruct: valueStruct: seq[Val]
    # of Duckdbtypemap: valueMap: seq[seq[Val]]
    # of Duckdbtypeuuid: valueUuid: cstring
    # of Duckdbtypeunion: valueUnion: seq[Val]
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


proc newVector(chunk: DataChunk, col: Column): Vector =
  result = Vector(kind: col.tpy)
  let
    vec = duckdb_data_chunk_get_vector(chunk, col.idx)
    validityMask = newValidityMask(vec)
    handle = duckdbvectorgetdata(vec)
    # allValid = cast[ptr UncheckedArray[uint64]](duckdb_vector_get_validity(vec))

  let chunk_size = duckdb_data_chunk_get_size(chunk).int
  case col.tpy
  of Duckdbtypeinvalid: result.valueInvalid = 42
  of Duckdbtypeboolean: result.valueBoolean = 1
  of Duckdbtypetinyint: result.valueTinyint = 8
  of Duckdbtypesmallint: result.valueSmallint = 16

  of Duckdbtypebigint:
    let raw = cast[ptr UncheckedArray[int64]](handle)
    result.valueBigint = collect:
      for i in 0..<chunk_size:
        # echo isValid(validityMask, i)
        if isValid(validityMask, i): raw[i].int64

  of Duckdbtypeutinyint: result.valueUtinyint = 8
  of Duckdbtypeusmallint: result.valueUsmallint = 16
  of Duckdbtypeuinteger: result.valueUinteger = 32

  of Duckdbtypeinteger:
    let raw = cast[ptr UncheckedArray[cint]](handle)
    result.valueInteger = collect:
      for i in 0..<chunk_size:
        if isValid(validityMask, i): raw[i].int

  of Duckdbtypeubigint: result.valueUbigint = 64
  of Duckdbtypefloat: result.valueFloat = 3.14
  of Duckdbtypedouble: result.valueDouble = 2.71828
  of Duckdbtypetimestamp: result.valueTimestamp = 123456789
  of Duckdbtypedate: result.valueDate = 20220101
  of Duckdbtypetime: result.valueTime = 120000
  of Duckdbtypeinterval: result.valueInterval = 500
  of Duckdbtypehugeint: result.valueHugeint = 9876543210

  of Duckdbtypevarchar:
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

  of Duckdbtypeblob: result.valueBlob = "Binary data"
  of Duckdbtypedecimal: result.valueDecimal = "3.14159265358979323846"
  of Duckdbtypetimestamps: result.valueTimestamps = 987654321
  of Duckdbtypetimestampms: result.valueTimestampms = 1234567890123
  of Duckdbtypetimestampns: result.valueTimestampns = 987654321012345678
  of Duckdbtypeenum: result.valueEnum = 2
  # of Duckdbtypelist: result.valueList = @[newVal(Duckdbtypeinteger), newVal(Duckdbtypevarchar)]
  # of Duckdbtypestruct: result.valueStruct = @[newVal(Duckdbtypeboolean), newVal(Duckdbtypetinyint)]
  # of Duckdbtypemap: result.valueMap = @[@[newVal(Duckdbtypevarchar), newVal(Duckdbtypeinteger)]]
  # of Duckdbtypeuuid: result.valueUuid = "123e4567-e89b-12d3-a456-426614174001"
  # of Duckdbtypeunion: result.valueUnion = @[newVal(Duckdbtypevarchar), newVal(Duckdbtypetimestamp)]
  # of Duckdbtypebit: result.valueBit = 1
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


# proc `&`[T](s: sink seq[T], a: openArray[T]): seq[T] =
#   for t in a:
#     s.add t
#   return s

proc fetchall*(qresult: QueryResult): seq[Vector] =
  concat(collect(for e in qresult.chunks(): e))


proc error*(qresult: QueryResult): string =
  result = $duckdb_result_error(qresult.addr)
