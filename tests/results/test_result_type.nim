import unittest
import std/[enumerate, times]
import ../../src/[database, query, query_result, exceptions]

suite "results":

  test "Test each DuckdbType at least once":

    # this ensures that we don't skip on testing the types
    proc doTest(kind: Type) =
      case kind

      of Type.Invalid:
        discard

      of Type.Boolean:
        let con = connect()
        con.execute("CREATE TABLE booleans(i BOOLEAN);")
        con.execute("INSERT INTO booleans VALUES (true), (false), (true);")
        let outcome = con.execute("SELECT * FROM booleans").fetchall()
        assert outcome[0].valueBoolean == @[true, false, true]

      of Type.TinyInt:
        let con = connect()
        con.execute("CREATE TABLE tinyints(i TINYINT); INSERT INTO tinyints VALUES (-128), (0), (127);")
        let outcome = con.execute("SELECT * FROM tinyints").fetchall()
        assert outcome[0].valueTinyint == @[-128'i8, 0'i8, 127'i8]

      of Type.SmallInt:
        let con = connect()
        con.execute("CREATE TABLE smallints(i SMALLINT); INSERT INTO smallints VALUES (-32768), (0), (32767);")
        let outcome = con.execute("SELECT * FROM smallints").fetchall()
        assert outcome[0].valueSmallint == @[-32768'i16, 0'i16, 32767'i16]

      of Type.Integer:
        let con = connect()
        con.execute("CREATE TABLE integers(i INTEGER); INSERT INTO integers VALUES (-2147483648), (0), (2147483647);")
        let outcome = con.execute("SELECT * FROM integers").fetchall()
        assert outcome[0].valueInteger == @[-2147483648'i32, 0'i32, 2147483647'i32]

      of Type.BigInt:
        let con = connect()
        con.execute("CREATE TABLE bigints(i BIGINT); INSERT INTO bigints VALUES (-9223372036854775808), (0), (9223372036854775807);")
        let outcome = con.execute("SELECT * FROM bigints").fetchall()
        assert outcome[0].valueBigint == @[-9223372036854775808'i64, 0'i64, 9223372036854775807'i64]

      of Type.UTinyInt:
        let con = connect()
        con.execute("CREATE TABLE utinyints(i UTINYINT); INSERT INTO utinyints VALUES (255), (0), (127);")
        let outcome = con.execute("SELECT * FROM utinyints").fetchall()
        assert outcome[0].valueUtinyint == @[255'u8, 0'u8, 127'u8]

      of Type.USmallInt:
        let con = connect()
        con.execute("CREATE TABLE usmallints(i USMALLINT); INSERT INTO usmallints VALUES (0), (32767), (65535);")
        let outcome = con.execute("SELECT * FROM usmallints").fetchall()
        assert outcome[0].valueUsmallint == @[0'u16, 32767'u16, 65535'u16]

      of Type.UInteger:
        let con = connect()
        con.execute("CREATE TABLE uintegers(i UINTEGER); INSERT INTO uintegers VALUES (0), (2147483647), (4294967295);")
        let outcome = con.execute("SELECT * FROM uintegers").fetchall()
        assert outcome[0].valueUinteger == @[0'u32, 2147483647'u32, 4294967295'u32]

      of Type.UBigInt:
        let con = connect()
        con.execute("CREATE TABLE ubigints(i UBIGINT); INSERT INTO ubigints VALUES (0), (922337203685477580), (1844674407370940000);")
        let outcome = con.execute("SELECT * FROM ubigints").fetchall()
        assert outcome[0].valueUbigint == @[0'u64, 922337203685477580'u64, 1844674407370940000'u64]

      of Type.Float:
        let con = connect()
        con.execute("CREATE TABLE floats(i FLOAT); INSERT INTO floats VALUES (-3.4), (0.0), (0.42);")
        let outcome = con.execute("SELECT * FROM floats").fetchall()
        assert outcome[0].valueFloat == @[-3.4'f, 0.0'f, 0.42'f]

      of Type.Double:
        let con = connect()
        con.execute("CREATE TABLE doubles(i DOUBLE); INSERT INTO doubles VALUES (-3.4), (0.0), (0.42);")
        let outcome = con.execute("SELECT * FROM doubles").fetchall()
        assert outcome[0].valueDouble == @[-3.4, 0.0, 0.42]

      of Type.Timestamp:
        let con = connect()
        con.execute("CREATE TABLE IF NOT EXISTS foo (tmp TIMESTAMP);")
        con.execute("INSERT INTO foo VALUES ('1992-09-20 11:30:00.123456789')")
        let outcome = con.execute("SELECT * FROM foo").fetchall()
        assert outcome[0].valueTimestamp[0].year == 1992
        assert outcome[0].valueTimestamp[0].hour == 11

      of Type.Date:
        let con = connect()
        con.execute("CREATE TABLE IF NOT EXISTS dates (dt DATE);")
        con.execute("INSERT INTO dates VALUES ('1992-09-20')")
        let outcome = con.execute("SELECT * FROM dates").fetchall()
        assert outcome[0].valueDate[0].year == 1992

      of Type.Time:
        let con = connect()
        con.execute("CREATE TABLE IF NOT EXISTS times (tm TIME);")
        con.execute("INSERT INTO times VALUES ('01:02:03')")
        let
          outcome = con.execute("SELECT * FROM times").fetchall()
        assert outcome[0].valueTime[0] == initTime(3723, 0)

      of Type.Interval:
        let
          con = connect()
          outcome = con.execute("SELECT INTERVAL '1.5' YEARS;")
        echo repr outcome
        # assert false

    for kind in Type:
      doTest(kind)


  # test "Test var char result type":
  #   let con = connect()
  #   con.execute("CREATE TABLE varchars(i VARCHAR); INSERT INTO varchars VALUES ('foo'), ('bar'), ('baz');")
  #   let outcome = con.execute("SELECT * FROM varchars").fetchall()
  #   assert outcome[0].valueVarchar == @["foo", "bar", "baz"]
