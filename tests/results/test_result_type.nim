import unittest
import std/[times, tables, strformat, strutils]
import nint128
import decimal
import ../../src/[database, query, query_result, vector, value, types]

suite "results":
  test "Test each DuckdbType at least once":
    # this ensures that we don't skip on testing the types
    proc doTest(kind: DuckType) =
      case kind
      of DuckType.Invalid:
        discard
      of DuckType.Boolean:
        let con = connect()
        con.execute("CREATE TABLE booleans(i BOOLEAN);")
        con.execute("INSERT INTO booleans VALUES (true), (false), (true);")
        let outcome = con.execute("SELECT * FROM booleans").fetchall()
        assert outcome[0].valueBoolean == @[true, false, true]
      of DuckType.TinyInt:
        let con = connect()
        con.execute(
          "CREATE TABLE tinyints(i TINYINT); INSERT INTO tinyints VALUES (-128), (0), (127);"
        )
        let outcome = con.execute("SELECT * FROM tinyints").fetchall()
        assert outcome[0].valueTinyint == @[-128'i8, 0'i8, 127'i8]
      of DuckType.SmallInt:
        let con = connect()
        con.execute(
          "CREATE TABLE smallints(i SMALLINT); INSERT INTO smallints VALUES (-32768), (0), (32767);"
        )
        let outcome = con.execute("SELECT * FROM smallints").fetchall()
        assert outcome[0].valueSmallint == @[-32768'i16, 0'i16, 32767'i16]
      of DuckType.Integer:
        let con = connect()
        con.execute(
          "CREATE TABLE integers(i INTEGER); INSERT INTO integers VALUES (-2147483648), (0), (2147483647);"
        )
        let outcome = con.execute("SELECT * FROM integers").fetchall()
        assert outcome[0].valueInteger == @[-2147483648'i32, 0'i32, 2147483647'i32]
      of DuckType.BigInt:
        let con = connect()
        con.execute(
          "CREATE TABLE bigints(i BIGINT); INSERT INTO bigints VALUES (-9223372036854775808), (0), (9223372036854775807);"
        )
        let outcome = con.execute("SELECT * FROM bigints").fetchall()
        assert outcome[0].valueBigint ==
          @[-9223372036854775808'i64, 0'i64, 9223372036854775807'i64]
      of DuckType.UTinyInt:
        let con = connect()
        con.execute(
          "CREATE TABLE utinyints(i UTINYINT); INSERT INTO utinyints VALUES (255), (0), (127);"
        )
        let outcome = con.execute("SELECT * FROM utinyints").fetchall()
        assert outcome[0].valueUtinyint == @[255'u8, 0'u8, 127'u8]
      of DuckType.USmallInt:
        let con = connect()
        con.execute(
          "CREATE TABLE usmallints(i USMALLINT); INSERT INTO usmallints VALUES (0), (32767), (65535);"
        )
        let outcome = con.execute("SELECT * FROM usmallints").fetchall()
        assert outcome[0].valueUsmallint == @[0'u16, 32767'u16, 65535'u16]
      of DuckType.UInteger:
        let con = connect()
        con.execute(
          "CREATE TABLE uintegers(i UINTEGER); INSERT INTO uintegers VALUES (0), (2147483647), (4294967295);"
        )
        let outcome = con.execute("SELECT * FROM uintegers").fetchall()
        assert outcome[0].valueUinteger == @[0'u32, 2147483647'u32, 4294967295'u32]
      of DuckType.UBigInt:
        let con = connect()
        con.execute(
          "CREATE TABLE ubigints(i UBIGINT); INSERT INTO ubigints VALUES (0), (922337203685477580), (1844674407370940000);"
        )
        let outcome = con.execute("SELECT * FROM ubigints").fetchall()
        assert outcome[0].valueUbigint ==
          @[0'u64, 922337203685477580'u64, 1844674407370940000'u64]
      of DuckType.Float:
        let con = connect()
        con.execute(
          "CREATE TABLE floats(i FLOAT); INSERT INTO floats VALUES (-3.4), (0.0), (0.42);"
        )
        let outcome = con.execute("SELECT * FROM floats").fetchall()
        assert outcome[0].valueFloat == @[-3.4'f, 0.0'f, 0.42'f]
      of DuckType.Double:
        let con = connect()
        con.execute(
          "CREATE TABLE doubles(i DOUBLE); INSERT INTO doubles VALUES (-3.4), (0.0), (0.42);"
        )
        let outcome = con.execute("SELECT * FROM doubles").fetchall()
        assert outcome[0].valueDouble ==
          @[-3.4, 0.0, 0.42]
            # let one = con.execute("SELECT * FROM doubles").fetchOne()
            # assert one[0].valueDouble == @[-3.4]
      of DuckType.Timestamp:
        let con = connect()
        let outcome =
          con.execute("SELECT TIMESTAMP '1992-09-20 11:30:00.123456789';").fetchall()
        assert outcome[0].valueTimestamp[0].format("yyyy-MM-dd HH:mm:ss'.'ffffff") ==
          "1992-09-20 11:30:00.123456"
      of DuckType.Date:
        let con = connect()
        con.execute("CREATE TABLE IF NOT EXISTS dates (dt DATE);")
        con.execute("INSERT INTO dates VALUES ('1992-09-20')")
        let outcome = con.execute("SELECT * FROM dates").fetchall()
        assert outcome[0].valueDate[0].year == 1992
      of DuckType.Time:
        let con = connect()
        con.execute("CREATE TABLE IF NOT EXISTS times (tm TIME);")
        con.execute("INSERT INTO times VALUES ('01:02:03')")
        let outcome = con.execute("SELECT * FROM times").fetchall()
        assert outcome[0].valueTime[0] == initTime(3723, 0)
      of DuckType.Interval:
        let
          con = connect()
          # -- Returns 12 months; equivalent to `to_years(CAST(trunc(1.5) AS INTEGER))`
          outcome = con
            .execute("SELECT INTERVAL '1.5' YEARS AS months_interval;")
            .fetchAllNamed()
        assert outcome["months_interval"].valueInterval[0].months == 12
      of DuckType.HugeInt:
        let con = connect()
        con.execute("CREATE TABLE IF NOT EXISTS huge (hg HUGEINT);")
        con.execute(fmt"INSERT INTO huge VALUES ({high(Int128)})")
        let outcome = con.execute("SELECT * FROM huge").fetchall()
        assert i128(outcome[0].valueHugeInt[0].lo) == i128("18446744073709551615")
      of DuckType.VarChar:
        let con = connect()
        con.execute(
          "CREATE TABLE varchars(i VARCHAR); INSERT INTO varchars VALUES ('foo'), ('bar'), ('baz');"
        )
        let outcome = con.execute("SELECT * FROM varchars").fetchall()
        assert outcome[0].valueVarchar == @["foo", "bar", "baz"]
      of DuckType.Blob:
        let
          con = connect()
          outcome = con.execute("SELECT 'AB'::BLOB;").fetchAll()
        assert outcome[0].valueBlob[0] == @[byte(ord('A')), byte(ord('B'))]
      of DuckType.Decimal:
        let
          con = connect()
          outcome = con.execute("SELECT CAST(12.3456 AS DECIMAL);").fetchAll()
        assert outcome[0].valueDecimal[0] == newDecimal("12.346")
      of DuckType.TimestampS:
        let con = connect()
        let outcome =
          con.execute("SELECT TIMESTAMP_S '1992-09-20 11:30:00.123456789';").fetchall()
        assert outcome[0].valueTimestampS[0].format("yyyy-MM-dd HH:mm:ss'.'ffffff") ==
          "1992-09-20 11:30:00.000000"
      of DuckType.TimestampMs:
        let con = connect()
        let outcome =
          con.execute("SELECT TIMESTAMP_MS '1992-09-20 11:30:00.123456789';").fetchall()
        assert outcome[0].valueTimestampMs[0].format("yyyy-MM-dd HH:mm:ss'.'ffffff") ==
          "1992-09-20 11:30:00.123000"
      of DuckType.TimestampNs:
        let con = connect()
        let outcome =
          con.execute("SELECT TIMESTAMP_NS '1992-09-20 11:30:00.123456789';").fetchall()
        assert outcome[0].valueTimestampNs[0].format("yyyy-MM-dd HH:mm:ss'.'ffffff") ==
          "1992-09-20 11:30:00.123456"
      of DuckType.Enum:
        let con = connect()
        con.execute("CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');")
        con.execute("CREATE TABLE person (name TEXT, current_mood mood);")
        con.execute(
          "INSERT INTO person VALUES ('Pedro', 'happy'), ('Mark', NULL), ('Pagliacci', 'sad'), ('Mr. Mackey', 'ok');"
        )
        let outcome =
          con.execute("SELECT * FROM person WHERE current_mood = 'sad';").fetchall()
        assert outcome[0].valueVarchar[0] == "Pagliacci"
        assert outcome[1].valueEnum[0] == 0
      of DuckType.List:
        let
          con = connect()
          outcome = con
            .execute(
              "SELECT CASE WHEN i % 5 = 0 THEN NULL WHEN i % 2 = 0 THEN [i, i + 1] ELSE [i * 42, NULL, i * 84] END FROM range(10) t(i)"
            )
            .fetchAll()
        assert outcome[0].valueList[0][0].valueBigInt == @[42'i64, 84'i64]
        assert outcome[0].valueList[1][0].valueBigInt == @[2'i64, 3'i64]
        let outcomeChar = con
          .execute(
            "SELECT CASE WHEN i % 2 = 0 THEN ARRAY['a', 'b'] ELSE ARRAY['c', NULL, 'd'] END FROM range(2) t(i)"
          )
          .fetchAll()
        #@[@[42, 84], @[2, 3], @[126, 252], @[4, 5], @[6, 7], @[294, 588], @[8, 9], @[378, 756]]

        assert outcomeChar[0].valueList[0][0].valueVarchar == @["a", "b"]
        assert outcomeChar[0].valueList[1][0].valueVarchar == @["c", "", "d"]
      of DuckType.Struct:
        let con = connect()
        #   outcome = con
        #     .execute(
        #       "SELECT CASE WHEN i%5=0 THEN NULL ELSE {'col1': i, 'col2': CASE WHEN i%2=0 THEN NULL ELSE 100 + i * 42 END} END FROM range(10) t(i);"
        #     )
        #     .fetchAll()
        # echo outcome
        # {col1: 1, col2: 142}                                                                                                                                  │
        # │ {col1: 2, col2: }                                                                                                                                     │
        # │ {col1: 3, col2: 226}                                                                                                                                  │
        # │ {col1: 4, col2: }                                                                                                                                     │
        # │                                                                                                                                                       │
        # │ {col1: 6, col2: }                                                                                                                                     │
        # │ {col1: 7, col2: 394}                                                                                                                                  │
        # │ {col1: 8, col2: }                                                                                                                                     │
        # │ {col1: 9, col2: 478}

    for kind in DuckType:
      doTest(kind)
