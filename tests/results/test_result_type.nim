discard """
  cmd:      "nim cpp -r --panics:on --passl:-lduckdb $options $file"
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
    con.execute("CREATE TABLE tinyints(i UTINYINT); INSERT INTO tinyints VALUES (255), (0), (127);")
    let outcome = con.execute("SELECT * FROM tinyints").fetchall()
    assert outcome[0].valueUtinyint == @[255'u8, 0'u8, 127'u8]

  test "Test smallint result type":
    let con = connect()
    con.execute("CREATE TABLE smallints(i SMALLINT); INSERT INTO smallints VALUES (-32768), (0), (32767);")
    let outcome = con.execute("SELECT * FROM smallints").fetchall()
    assert outcome[0].valueSmallint == @[-32768'i16, 0'i16, 32767'i16]

  test "Test bigint result type":
    let con = connect()
    con.execute("CREATE TABLE bigints(i BIGINT); INSERT INTO bigints SELECT i::BIGINT FROM generate_series(1, 3) t(i);")
    let outcome = con.execute("SELECT * FROM bigints").fetchall()
    assert outcome[0].valueBigint == @[1'i64, 2'i64, 3'i64]

  # test "Test utinyint result type":
  #   let con = connect()
  #   con.execute("CREATE TABLE utinyints(i UTINYINT); INSERT INTO utinyints VALUES (0), (127), (255);")
  #   let outcome = con.execute("SELECT * FROM utinyints").fetchall()
  #   assert outcome[0] == @[0'u8, 127'u8, 255'u8]

  # test "Test usmallint result type":
  #   let con = connect()
  #   con.execute("CREATE TABLE usmallints(i USMALLINT); INSERT INTO usmallints VALUES (0), (32767), (65535);")
  #   let outcome = con.execute("SELECT * FROM usmallints").fetchall()
  #   assert outcome == @[0, 32767, 65535]

  # test "Test uinteger result type":
  #   let con = connect()
  #   con.execute("CREATE TABLE uintegers(i UINTEGER); INSERT INTO uintegers VALUES (0), (2147483647), (4294967295);")
  #   let outcome = con.execute("SELECT * FROM uintegers").fetchall()
  #   assert outcome == @[0, 2147483647, 4294967295]

  # test "Test integer result type":
  #   let con = connect()
  #   con.execute("CREATE TABLE integers(i INTEGER); INSERT INTO integers VALUES (-2147483648), (0), (2147483647);")
  #   let outcome = con.execute("SELECT * FROM integers").fetchall()
  #   assert outcome == @[-2147483648, 0, 2147483647]

  # test "Test ubigint result type":
  #   let con = connect()
  #   con.execute("CREATE TABLE ubigints(i UBIGINT); INSERT INTO ubigints VALUES (0), (922337203685477580), (1844674407370940000);")
  #   let outcome = con.execute("SELECT * FROM ubigints").fetchall()
  #   assert outcome == @[0, 922337203685477580, 1844674407370940000]

  # test "Test float result type":
  #   let con = connect()
  #   con.execute("CREATE TABLE floats(i FLOAT); INSERT INTO floats VALUES (-3.402823466E+38), (0), (3.402823466E+38);")
  #   let outcome = con.execute("SELECT * FROM floats").fetchall()
  #   assert outcome == @[-3.402823466E+38, 0.0, 3.402823466E+38]

  # test "Test double result type":
  #   let con = connect()
  #   con.execute("CREATE TABLE doubles(i DOUBLE); INSERT INTO doubles VALUES (-1.7976931348623157E+308), (0), (1.7976931348623157E+308);")
  #   let outcome = con.execute("SELECT * FROM doubles").fetchall()
  #   assert outcome == @[-1.7976931348623157E+308, 0.0, 1.7976931348623157E+308]
