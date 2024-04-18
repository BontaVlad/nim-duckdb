discard """
  cmd:      "nim c -r --panics:on --passl:-lduckdb $options $file"
  targets:  "c"
  action:   "run"
  exitcode: 0
  timeout:  60.0
"""

import unittest
import std/[enumerate]
import ../../src/[database, query, query_result, exceptions]


suite "results":

  test "Test boolean result type":
    let con = connect()
    con.execute("CREATE TABLE booleans(i BOOLEAN);")
    con.execute("INSERT INTO booleans VALUES (true), (false), (true);")
    let outcome = con.execute("SELECT * FROM booleans").fetchall()
    assert outcome[0].valueBoolean == @[true, false, true]

  test "Test tinyint result type":
    let con = connect()
    con.execute("CREATE TABLE tinyints(i TINYINT); INSERT INTO tinyints VALUES (-128), (0), (127);")
    let outcome = con.execute("SELECT * FROM tinyints").fetchall()
    assert outcome[0].valueTinyint == @[-128'i8, 0'i8, 127'i8]

  test "Test unsigned tinyint result type":
    let con = connect()
    con.execute("CREATE TABLE utinyints(i UTINYINT); INSERT INTO utinyints VALUES (255), (0), (127);")
    let outcome = con.execute("SELECT * FROM utinyints").fetchall()
    assert outcome[0].valueUtinyint == @[255'u8, 0'u8, 127'u8]

  test "Test smallint result type":
    let con = connect()
    con.execute("CREATE TABLE smallints(i SMALLINT); INSERT INTO smallints VALUES (-32768), (0), (32767);")
    let outcome = con.execute("SELECT * FROM smallints").fetchall()
    assert outcome[0].valueSmallint == @[-32768'i16, 0'i16, 32767'i16]

  test "Test unsigned smallint result type":
    let con = connect()
    con.execute("CREATE TABLE usmallints(i USMALLINT); INSERT INTO usmallints VALUES (0), (32767), (65535);")
    let outcome = con.execute("SELECT * FROM usmallints").fetchall()
    assert outcome[0].valueUsmallint == @[0'u16, 32767'u16, 65535'u16]

  test "Test unsigned integer result type":
    let con = connect()
    con.execute("CREATE TABLE uintegers(i UINTEGER); INSERT INTO uintegers VALUES (0), (2147483647), (4294967295);")
    let outcome = con.execute("SELECT * FROM uintegers").fetchall()
    assert outcome[0].valueUinteger == @[0'u32, 2147483647'u32, 4294967295'u32]

  test "Test integer result type":
    let con = connect()
    con.execute("CREATE TABLE integers(i INTEGER); INSERT INTO integers VALUES (-2147483648), (0), (2147483647);")
    let outcome = con.execute("SELECT * FROM integers").fetchall()
    assert outcome[0].valueInteger == @[-2147483648'i32, 0'i32, 2147483647'i32]

  test "Test big int result type":
    let con = connect()
    con.execute("CREATE TABLE bigints(i BIGINT); INSERT INTO bigints VALUES (-9223372036854775808), (0), (9223372036854775807);")
    let outcome = con.execute("SELECT * FROM bigints").fetchall()
    assert outcome[0].valueBigint == @[-9223372036854775808'i64, 0'i64, 9223372036854775807'i64]

  test "Test unsigned big int result type":
    let con = connect()
    con.execute("CREATE TABLE ubigints(i UBIGINT); INSERT INTO ubigints VALUES (0), (922337203685477580), (1844674407370940000);")
    let outcome = con.execute("SELECT * FROM ubigints").fetchall()
    assert outcome[0].valueUbigint == @[0'u64, 922337203685477580'u64, 1844674407370940000'u64]

  test "Test float result type":
    let con = connect()
    con.execute("CREATE TABLE floats(i FLOAT); INSERT INTO floats VALUES (-3.4), (0.0), (0.42);")
    let outcome = con.execute("SELECT * FROM floats").fetchall()
    assert outcome[0].valueFloat == @[-3.4'f, 0.0'f, 0.42'f]

  test "Test double result type":
    let con = connect()
    con.execute("CREATE TABLE doubles(i DOUBLE); INSERT INTO doubles VALUES (-3.4), (0.0), (0.42);")
    let outcome = con.execute("SELECT * FROM doubles").fetchall()
    assert outcome[0].valueDouble == @[-3.4, 0.0, 0.42]

  test "Test var char result type":
    let con = connect()
    con.execute("CREATE TABLE varchars(i VARCHAR); INSERT INTO varchars VALUES ('foo'), ('bar'), ('baz');")
    let outcome = con.execute("SELECT * FROM varchars").fetchall()
    assert outcome[0].valueVarchar == @["foo", "bar", "baz"]

  test "Test timestamp result type":
    let con = connect()
    con.execute("CREATE TABLE IF NOT EXISTS timestamps (sec TIMESTAMP_S, milli TIMESTAMP_MS,micro TIMESTAMP_US, nano TIMESTAMP_NS );")
    con.execute("INSERT INTO timestamps VALUES ('2008-01-01 00:00:11','2008-01-01 00:00:01.794','2008-01-01 00:00:01.98926','2008-01-01 00:00:01.899268321' )")
    let outcome = con.execute("SELECT * FROM timestamps").fetchall()
    echo repr outcome
    # assert outcome[0].valueVarchar == @["foo", "bar", "baz"]


        # cursor.execute(
        #     'CREATE TABLE IF NOT EXISTS timestamps (sec TIMESTAMP_S, milli TIMESTAMP_MS,micro TIMESTAMP_US, nano TIMESTAMP_NS );'
        # )
        # cursor.execute(
        #     "INSERT INTO timestamps VALUES ('2008-01-01 00:00:11','2008-01-01 00:00:01.794','2008-01-01 00:00:01.98926','2008-01-01 00:00:01.899268321' )"
        # )
