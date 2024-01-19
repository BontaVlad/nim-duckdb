
from macros import hint

when not declared(enumduckdbtype):
  type
    enumduckdbtype* {.size: sizeof(cuint).} = enum
      Duckdbtypeinvalid = 0, Duckdbtypeboolean = 1, Duckdbtypetinyint = 2,
      Duckdbtypesmallint = 3, Duckdbtypeinteger = 4, Duckdbtypebigint = 5,
      Duckdbtypeutinyint = 6, Duckdbtypeusmallint = 7, Duckdbtypeuinteger = 8,
      Duckdbtypeubigint = 9, Duckdbtypefloat = 10, Duckdbtypedouble = 11,
      Duckdbtypetimestamp = 12, Duckdbtypedate = 13, Duckdbtypetime = 14,
      Duckdbtypeinterval = 15, Duckdbtypehugeint = 16, Duckdbtypevarchar = 17,
      Duckdbtypeblob = 18, Duckdbtypedecimal = 19, Duckdbtypetimestamps = 20,
      Duckdbtypetimestampms = 21, Duckdbtypetimestampns = 22,
      Duckdbtypeenum = 23, Duckdbtypelist = 24, Duckdbtypestruct = 25,
      Duckdbtypemap = 26, Duckdbtypeuuid = 27, Duckdbtypeunion = 28,
      Duckdbtypebit = 29
else:
  static :
    hint("Declaration of " & "enumduckdbtype" &
        " already exists, not redeclaring")
when not declared(enumduckdbstate):
  type
    enumduckdbstate* {.size: sizeof(cuint).} = enum
      Duckdbsuccess = 0, Duckdberror = 1
else:
  static :
    hint("Declaration of " & "enumduckdbstate" &
        " already exists, not redeclaring")
when not declared(enumduckdbpendingstate):
  type
    enumduckdbpendingstate* {.size: sizeof(cuint).} = enum
      Duckdbpendingresultready = 0, Duckdbpendingresultnotready = 1,
      Duckdbpendingerror = 2, Duckdbpendingnotasksavailable = 3
else:
  static :
    hint("Declaration of " & "enumduckdbpendingstate" &
        " already exists, not redeclaring")
type
  idxt_1174405465 = uint64   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:67:18
  duckdbtype_1174405470 = enumduckdbtype_1174405469 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:129:3
  structduckdbdate_1174405472 {.pure, inheritable, bycopy.} = object
    days*: int32             ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:133:9
  duckdbdate_1174405474 = structduckdbdate_1174405473 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:135:3
  structduckdbdatestruct_1174405476 {.pure, inheritable, bycopy.} = object
    year*: int32             ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:137:9
    month*: int8
    day*: int8
  duckdbdatestruct_1174405478 = structduckdbdatestruct_1174405477 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:141:3
  structduckdbtime_1174405480 {.pure, inheritable, bycopy.} = object
    micros*: int64           ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:145:9
  duckdbtime_1174405482 = structduckdbtime_1174405481 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:147:3
  structduckdbtimestruct_1174405484 {.pure, inheritable, bycopy.} = object
    hour*: int8              ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:149:9
    min*: int8
    sec*: int8
    micros*: int32
  duckdbtimestruct_1174405486 = structduckdbtimestruct_1174405485 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:154:3
  structduckdbtimestamp_1174405488 {.pure, inheritable, bycopy.} = object
    micros*: int64           ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:158:9
  duckdbtimestamp_1174405490 = structduckdbtimestamp_1174405489 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:160:3
  structduckdbtimestampstruct_1174405492 {.pure, inheritable, bycopy.} = object
    date*: duckdbdatestruct_1174405479 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:162:9
    time*: duckdbtimestruct_1174405487
  duckdbtimestampstruct_1174405494 = structduckdbtimestampstruct_1174405493 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:165:3
  structduckdbinterval_1174405496 {.pure, inheritable, bycopy.} = object
    months*: int32           ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:167:9
    days*: int32
    micros*: int64
  duckdbinterval_1174405498 = structduckdbinterval_1174405497 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:171:3
  structduckdbhugeint_1174405500 {.pure, inheritable, bycopy.} = object
    lower*: uint64           ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:176:9
    upper*: int64
  duckdbhugeint_1174405502 = structduckdbhugeint_1174405501 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:179:3
  structduckdbdecimal_1174405504 {.pure, inheritable, bycopy.} = object
    width*: uint8            ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:181:9
    scale*: uint8
    value*: duckdbhugeint_1174405503
  duckdbdecimal_1174405506 = structduckdbdecimal_1174405505 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:186:3
  structduckdbstring_1174405508 {.pure, inheritable, bycopy.} = object
    data*: cstring           ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:188:9
    size*: idxt_1174405467
  duckdbstring_1174405510 = structduckdbstring_1174405509 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:191:3
  structduckdbstringt_value_t_pointer_t {.pure, inheritable, bycopy.} = object
    length*: uint32
    prefix*: array[4'i64, cschar]
    ptrfield*: cstring
  structduckdbstringt_value_t_inlined_t {.pure, inheritable, bycopy.} = object
    length*: uint32
    inlined*: array[12'i64, cschar]
  structduckdbstringt_value_t {.union, bycopy.} = object
    pointer*: structduckdbstringt_value_t_pointer_t
    inlined*: structduckdbstringt_value_t_inlined_t
  structduckdbstringt_1174405512 {.pure, inheritable, bycopy.} = object
    value*: structduckdbstringt_value_t ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:196:9
  duckdbstringt_1174405514 = structduckdbstringt_1174405513 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:208:3
  structduckdbblob_1174405516 {.pure, inheritable, bycopy.} = object
    data*: pointer           ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:210:9
    size*: idxt_1174405467
  duckdbblob_1174405518 = structduckdbblob_1174405517 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:213:3
  structduckdblistentry_1174405520 {.pure, inheritable, bycopy.} = object
    offset*: uint64          ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:215:9
    length*: uint64
  duckdblistentry_1174405522 = structduckdblistentry_1174405521 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:218:3
  structduckdbcolumn_1174405524 {.pure, inheritable, bycopy.} = object
    compilerdeprecateddata*: pointer ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:220:9
    compilerdeprecatednullmask*: ptr bool
    compilerdeprecatedtype*: duckdbtype_1174405471
    compilerdeprecatedname*: cstring
    internaldata*: pointer
  duckdbcolumn_1174405526 = structduckdbcolumn_1174405525 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:237:3
  structduckdbresult_1174405528 {.pure, inheritable, bycopy.} = object
    compilerdeprecatedcolumncount*: idxt_1174405467 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:239:9
    compilerdeprecatedrowcount*: idxt_1174405467
    compilerdeprecatedrowschanged*: idxt_1174405467
    compilerdeprecatedcolumns*: ptr duckdbcolumn_1174405527
    compilerdeprecatederrormessage*: cstring
    internaldata*: pointer
  duckdbresult_1174405530 = structduckdbresult_1174405529 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:259:3
  structduckdbdatabase_1174405532 {.pure, inheritable, bycopy.} = object
    compilerdb*: pointer     ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:261:16
  duckdbdatabase_1174405534 = ptr structduckdbdatabase_1174405533 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:263:5
  structduckdbconnection_1174405536 {.pure, inheritable, bycopy.} = object
    compilerconn*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:264:16
  duckdbconnection_1174405538 = ptr structduckdbconnection_1174405537 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:266:5
  structduckdbpreparedstatement_1174405540 {.pure, inheritable, bycopy.} = object
    compilerprep*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:267:16
  duckdbpreparedstatement_1174405542 = ptr structduckdbpreparedstatement_1174405541 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:269:5
  structduckdbextractedstatements_1174405544 {.pure, inheritable, bycopy.} = object
    compilerextrac*: pointer ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:270:16
  duckdbextractedstatements_1174405546 = ptr structduckdbextractedstatements_1174405545 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:272:5
  structduckdbpendingresult_1174405548 {.pure, inheritable, bycopy.} = object
    compilerpend*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:273:16
  duckdbpendingresult_1174405550 = ptr structduckdbpendingresult_1174405549 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:275:5
  structduckdbappender_1174405552 {.pure, inheritable, bycopy.} = object
    compilerappn*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:276:16
  duckdbappender_1174405561 = ptr structduckdbappender_1174405560 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:278:5
  structduckdbarrow_1174405563 {.pure, inheritable, bycopy.} = object
    compilerarrw*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:279:16
  duckdbarrow_1174405565 = ptr structduckdbarrow_1174405564 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:281:5
  structduckdbarrowstream_1174405567 {.pure, inheritable, bycopy.} = object
    compilerarrwstr*: pointer ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:282:16
  duckdbarrowstream_1174405569 = ptr structduckdbarrowstream_1174405568 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:284:5
  structduckdbconfig_1174405571 {.pure, inheritable, bycopy.} = object
    compilercnfg*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:285:16
  duckdbconfig_1174405573 = ptr structduckdbconfig_1174405572 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:287:5
  structduckdbarrowschema_1174405575 {.pure, inheritable, bycopy.} = object
    compilerarrs*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:288:16
  duckdbarrowschema_1174405577 = ptr structduckdbarrowschema_1174405576 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:290:5
  structduckdbarrowarray_1174405579 {.pure, inheritable, bycopy.} = object
    compilerarra*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:291:16
  duckdbarrowarray_1174405581 = ptr structduckdbarrowarray_1174405580 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:293:5
  structduckdblogicaltype_1174405583 {.pure, inheritable, bycopy.} = object
    compilerlglt*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:294:16
  duckdblogicaltype_1174405585 = ptr structduckdblogicaltype_1174405584 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:296:5
  structduckdbdatachunk_1174405587 {.pure, inheritable, bycopy.} = object
    compilerdtck*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:297:16
  duckdbdatachunk_1174405589 = ptr structduckdbdatachunk_1174405588 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:299:5
  structduckdbvector_1174405591 {.pure, inheritable, bycopy.} = object
    compilervctr*: pointer   ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:300:16
  duckdbvector_1174405593 = ptr structduckdbvector_1174405592 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:302:5
  structduckdbvalue_1174405595 {.pure, inheritable, bycopy.} = object
    compilerval*: pointer    ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:303:16
  duckdbvalue_1174405597 = ptr structduckdbvalue_1174405596 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:305:5
  duckdbstate_1174405601 = enumduckdbstate_1174405600 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:307:53
  duckdbpendingstate_1174405605 = enumduckdbpendingstate_1174405604 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:313:3
  duckdbtablefunction_1174405607 = pointer ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:1784:15
  duckdbbindinfo_1174405609 = pointer ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:1785:15
  duckdbinitinfo_1174405611 = pointer ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:1786:15
  duckdbfunctioninfo_1174405613 = pointer ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:1787:15
  duckdbtablefunctionbindt_1174405615 = proc (a0: duckdbbindinfo_1174405610): void {.
      cdecl.}                ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:1789:16
  duckdbtablefunctioninitt_1174405617 = proc (a0: duckdbinitinfo_1174405612): void {.
      cdecl.}                ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:1790:16
  duckdbtablefunctiont_1174405619 = proc (a0: duckdbfunctioninfo_1174405614;
      a1: duckdbdatachunk_1174405590): void {.cdecl.} ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:1791:16
  duckdbdeletecallbackt_1174405621 = proc (a0: pointer): void {.cdecl.} ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:1792:16
  duckdbreplacementscaninfo_1174405623 = pointer ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:2098:15
  duckdbreplacementcallbackt_1174405625 = proc (a0: duckdbreplacementscaninfo_1174405624;
      a1: cstring; a2: pointer): void {.cdecl.} ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:2100:16
  duckdbtaskstate_1174405627 = pointer ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:2413:15
  duckdbtaskstate_1174405628 = (when declared(duckdbtaskstate):
    duckdbtaskstate
   else:
    duckdbtaskstate_1174405627)
  duckdbtimestruct_1174405487 = (when declared(duckdbtimestruct):
    duckdbtimestruct
   else:
    duckdbtimestruct_1174405486)
  structduckdbpreparedstatement_1174405541 = (when declared(
      structduckdbpreparedstatement):
    structduckdbpreparedstatement
   else:
    structduckdbpreparedstatement_1174405540)
  duckdbbindinfo_1174405610 = (when declared(duckdbbindinfo):
    duckdbbindinfo
   else:
    duckdbbindinfo_1174405609)
  structduckdbcolumn_1174405525 = (when declared(structduckdbcolumn):
    structduckdbcolumn
   else:
    structduckdbcolumn_1174405524)
  duckdbtablefunctiont_1174405620 = (when declared(duckdbtablefunctiont):
    duckdbtablefunctiont
   else:
    duckdbtablefunctiont_1174405619)
  duckdblogicaltype_1174405586 = (when declared(duckdblogicaltype):
    duckdblogicaltype
   else:
    duckdblogicaltype_1174405585)
  structduckdbdatachunk_1174405588 = (when declared(structduckdbdatachunk):
    structduckdbdatachunk
   else:
    structduckdbdatachunk_1174405587)
  structduckdbappender_1174405560 = (when declared(structduckdbappender):
    structduckdbappender
   else:
    structduckdbappender_1174405552)
  duckdbstring_1174405511 = (when declared(duckdbstring):
    duckdbstring
   else:
    duckdbstring_1174405510)
  structduckdbinterval_1174405497 = (when declared(structduckdbinterval):
    structduckdbinterval
   else:
    structduckdbinterval_1174405496)
  duckdbvector_1174405594 = (when declared(duckdbvector):
    duckdbvector
   else:
    duckdbvector_1174405593)
  enumduckdbstate_1174405600 = (when declared(enumduckdbstate):
    enumduckdbstate
   else:
    enumduckdbstate_1174405599)
  structduckdbdatestruct_1174405477 = (when declared(structduckdbdatestruct):
    structduckdbdatestruct
   else:
    structduckdbdatestruct_1174405476)
  duckdbstringt_1174405515 = (when declared(duckdbstringt):
    duckdbstringt
   else:
    duckdbstringt_1174405514)
  duckdbconnection_1174405539 = (when declared(duckdbconnection):
    duckdbconnection
   else:
    duckdbconnection_1174405538)
  structduckdbdecimal_1174405505 = (when declared(structduckdbdecimal):
    structduckdbdecimal
   else:
    structduckdbdecimal_1174405504)
  duckdbarrow_1174405566 = (when declared(duckdbarrow):
    duckdbarrow
   else:
    duckdbarrow_1174405565)
  structduckdbdatabase_1174405533 = (when declared(structduckdbdatabase):
    structduckdbdatabase
   else:
    structduckdbdatabase_1174405532)
  structduckdbtime_1174405481 = (when declared(structduckdbtime):
    structduckdbtime
   else:
    structduckdbtime_1174405480)
  structduckdbtimestruct_1174405485 = (when declared(structduckdbtimestruct):
    structduckdbtimestruct
   else:
    structduckdbtimestruct_1174405484)
  duckdbtimestampstruct_1174405495 = (when declared(duckdbtimestampstruct):
    duckdbtimestampstruct
   else:
    duckdbtimestampstruct_1174405494)
  duckdbhugeint_1174405503 = (when declared(duckdbhugeint):
    duckdbhugeint
   else:
    duckdbhugeint_1174405502)
  structduckdbresult_1174405529 = (when declared(structduckdbresult):
    structduckdbresult
   else:
    structduckdbresult_1174405528)
  duckdbpendingresult_1174405551 = (when declared(duckdbpendingresult):
    duckdbpendingresult
   else:
    duckdbpendingresult_1174405550)
  duckdbtimestamp_1174405491 = (when declared(duckdbtimestamp):
    duckdbtimestamp
   else:
    duckdbtimestamp_1174405490)
  duckdbblob_1174405519 = (when declared(duckdbblob):
    duckdbblob
   else:
    duckdbblob_1174405518)
  duckdbdecimal_1174405507 = (when declared(duckdbdecimal):
    duckdbdecimal
   else:
    duckdbdecimal_1174405506)
  duckdbreplacementscaninfo_1174405624 = (when declared(
      duckdbreplacementscaninfo):
    duckdbreplacementscaninfo
   else:
    duckdbreplacementscaninfo_1174405623)
  structduckdbblob_1174405517 = (when declared(structduckdbblob):
    structduckdbblob
   else:
    structduckdbblob_1174405516)
  structduckdbarrow_1174405564 = (when declared(structduckdbarrow):
    structduckdbarrow
   else:
    structduckdbarrow_1174405563)
  enumduckdbtype_1174405469 = (when declared(enumduckdbtype):
    enumduckdbtype
   else:
    enumduckdbtype_1174405468)
  duckdbdatabase_1174405535 = (when declared(duckdbdatabase):
    duckdbdatabase
   else:
    duckdbdatabase_1174405534)
  duckdblistentry_1174405523 = (when declared(duckdblistentry):
    duckdblistentry
   else:
    duckdblistentry_1174405522)
  enumduckdbpendingstate_1174405604 = (when declared(enumduckdbpendingstate):
    enumduckdbpendingstate
   else:
    enumduckdbpendingstate_1174405603)
  structduckdblogicaltype_1174405584 = (when declared(structduckdblogicaltype):
    structduckdblogicaltype
   else:
    structduckdblogicaltype_1174405583)
  structduckdbhugeint_1174405501 = (when declared(structduckdbhugeint):
    structduckdbhugeint
   else:
    structduckdbhugeint_1174405500)
  idxt_1174405467 = (when declared(idxt):
    idxt
   else:
    idxt_1174405465)
  structduckdbextractedstatements_1174405545 = (when declared(
      structduckdbextractedstatements):
    structduckdbextractedstatements
   else:
    structduckdbextractedstatements_1174405544)
  structduckdbconnection_1174405537 = (when declared(structduckdbconnection):
    structduckdbconnection
   else:
    structduckdbconnection_1174405536)
  duckdbstate_1174405602 = (when declared(duckdbstate):
    duckdbstate
   else:
    duckdbstate_1174405601)
  duckdbtablefunctionbindt_1174405616 = (when declared(duckdbtablefunctionbindt):
    duckdbtablefunctionbindt
   else:
    duckdbtablefunctionbindt_1174405615)
  duckdbinterval_1174405499 = (when declared(duckdbinterval):
    duckdbinterval
   else:
    duckdbinterval_1174405498)
  duckdbextractedstatements_1174405547 = (when declared(
      duckdbextractedstatements):
    duckdbextractedstatements
   else:
    duckdbextractedstatements_1174405546)
  duckdbfunctioninfo_1174405614 = (when declared(duckdbfunctioninfo):
    duckdbfunctioninfo
   else:
    duckdbfunctioninfo_1174405613)
  duckdbtype_1174405471 = (when declared(duckdbtype):
    duckdbtype
   else:
    duckdbtype_1174405470)
  duckdbdatestruct_1174405479 = (when declared(duckdbdatestruct):
    duckdbdatestruct
   else:
    duckdbdatestruct_1174405478)
  duckdbresult_1174405531 = (when declared(duckdbresult):
    duckdbresult
   else:
    duckdbresult_1174405530)
  duckdbreplacementcallbackt_1174405626 = (when declared(
      duckdbreplacementcallbackt):
    duckdbreplacementcallbackt
   else:
    duckdbreplacementcallbackt_1174405625)
  structduckdbarrowstream_1174405568 = (when declared(structduckdbarrowstream):
    structduckdbarrowstream
   else:
    structduckdbarrowstream_1174405567)
  duckdbtime_1174405483 = (when declared(duckdbtime):
    duckdbtime
   else:
    duckdbtime_1174405482)
  structduckdbstring_1174405509 = (when declared(structduckdbstring):
    structduckdbstring
   else:
    structduckdbstring_1174405508)
  duckdbcolumn_1174405527 = (when declared(duckdbcolumn):
    duckdbcolumn
   else:
    duckdbcolumn_1174405526)
  structduckdbpendingresult_1174405549 = (when declared(
      structduckdbpendingresult):
    structduckdbpendingresult
   else:
    structduckdbpendingresult_1174405548)
  duckdbappender_1174405562 = (when declared(duckdbappender):
    duckdbappender
   else:
    duckdbappender_1174405561)
  duckdbdeletecallbackt_1174405622 = (when declared(duckdbdeletecallbackt):
    duckdbdeletecallbackt
   else:
    duckdbdeletecallbackt_1174405621)
  structduckdbvector_1174405592 = (when declared(structduckdbvector):
    structduckdbvector
   else:
    structduckdbvector_1174405591)
  duckdbdatachunk_1174405590 = (when declared(duckdbdatachunk):
    duckdbdatachunk
   else:
    duckdbdatachunk_1174405589)
  structduckdbtimestampstruct_1174405493 = (when declared(
      structduckdbtimestampstruct):
    structduckdbtimestampstruct
   else:
    structduckdbtimestampstruct_1174405492)
  duckdbtablefunction_1174405608 = (when declared(duckdbtablefunction):
    duckdbtablefunction
   else:
    duckdbtablefunction_1174405607)
  duckdbvalue_1174405598 = (when declared(duckdbvalue):
    duckdbvalue
   else:
    duckdbvalue_1174405597)
  structduckdbconfig_1174405572 = (when declared(structduckdbconfig):
    structduckdbconfig
   else:
    structduckdbconfig_1174405571)
  structduckdbarrowschema_1174405576 = (when declared(structduckdbarrowschema):
    structduckdbarrowschema
   else:
    structduckdbarrowschema_1174405575)
  duckdbtablefunctioninitt_1174405618 = (when declared(duckdbtablefunctioninitt):
    duckdbtablefunctioninitt
   else:
    duckdbtablefunctioninitt_1174405617)
  duckdbinitinfo_1174405612 = (when declared(duckdbinitinfo):
    duckdbinitinfo
   else:
    duckdbinitinfo_1174405611)
  structduckdbdate_1174405473 = (when declared(structduckdbdate):
    structduckdbdate
   else:
    structduckdbdate_1174405472)
  structduckdblistentry_1174405521 = (when declared(structduckdblistentry):
    structduckdblistentry
   else:
    structduckdblistentry_1174405520)
  structduckdbvalue_1174405596 = (when declared(structduckdbvalue):
    structduckdbvalue
   else:
    structduckdbvalue_1174405595)
  duckdbpreparedstatement_1174405543 = (when declared(duckdbpreparedstatement):
    duckdbpreparedstatement
   else:
    duckdbpreparedstatement_1174405542)
  structduckdbstringt_1174405513 = (when declared(structduckdbstringt):
    structduckdbstringt
   else:
    structduckdbstringt_1174405512)
  duckdbconfig_1174405574 = (when declared(duckdbconfig):
    duckdbconfig
   else:
    duckdbconfig_1174405573)
  duckdbarrowschema_1174405578 = (when declared(duckdbarrowschema):
    duckdbarrowschema
   else:
    duckdbarrowschema_1174405577)
  duckdbdate_1174405475 = (when declared(duckdbdate):
    duckdbdate
   else:
    duckdbdate_1174405474)
  structduckdbtimestamp_1174405489 = (when declared(structduckdbtimestamp):
    structduckdbtimestamp
   else:
    structduckdbtimestamp_1174405488)
  duckdbarrowstream_1174405570 = (when declared(duckdbarrowstream):
    duckdbarrowstream
   else:
    duckdbarrowstream_1174405569)
  duckdbarrowarray_1174405582 = (when declared(duckdbarrowarray):
    duckdbarrowarray
   else:
    duckdbarrowarray_1174405581)
  structduckdbarrowarray_1174405580 = (when declared(structduckdbarrowarray):
    structduckdbarrowarray
   else:
    structduckdbarrowarray_1174405579)
  duckdbpendingstate_1174405606 = (when declared(duckdbpendingstate):
    duckdbpendingstate
   else:
    duckdbpendingstate_1174405605)
when not declared(duckdbtaskstate):
  type
    duckdbtaskstate* = duckdbtaskstate_1174405627
else:
  static :
    hint("Declaration of " & "duckdbtaskstate" &
        " already exists, not redeclaring")
when not declared(duckdbtimestruct):
  type
    duckdbtimestruct* = duckdbtimestruct_1174405486
else:
  static :
    hint("Declaration of " & "duckdbtimestruct" &
        " already exists, not redeclaring")
when not declared(structduckdbpreparedstatement):
  type
    structduckdbpreparedstatement* = structduckdbpreparedstatement_1174405540
else:
  static :
    hint("Declaration of " & "structduckdbpreparedstatement" &
        " already exists, not redeclaring")
when not declared(duckdbbindinfo):
  type
    duckdbbindinfo* = duckdbbindinfo_1174405609
else:
  static :
    hint("Declaration of " & "duckdbbindinfo" &
        " already exists, not redeclaring")
when not declared(structduckdbcolumn):
  type
    structduckdbcolumn* = structduckdbcolumn_1174405524
else:
  static :
    hint("Declaration of " & "structduckdbcolumn" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctiont):
  type
    duckdbtablefunctiont* = duckdbtablefunctiont_1174405619
else:
  static :
    hint("Declaration of " & "duckdbtablefunctiont" &
        " already exists, not redeclaring")
when not declared(duckdblogicaltype):
  type
    duckdblogicaltype* = duckdblogicaltype_1174405585
else:
  static :
    hint("Declaration of " & "duckdblogicaltype" &
        " already exists, not redeclaring")
when not declared(structduckdbdatachunk):
  type
    structduckdbdatachunk* = structduckdbdatachunk_1174405587
else:
  static :
    hint("Declaration of " & "structduckdbdatachunk" &
        " already exists, not redeclaring")
when not declared(structduckdbappender):
  type
    structduckdbappender* = structduckdbappender_1174405552
else:
  static :
    hint("Declaration of " & "structduckdbappender" &
        " already exists, not redeclaring")
when not declared(duckdbstring):
  type
    duckdbstring* = duckdbstring_1174405510
else:
  static :
    hint("Declaration of " & "duckdbstring" & " already exists, not redeclaring")
when not declared(structduckdbinterval):
  type
    structduckdbinterval* = structduckdbinterval_1174405496
else:
  static :
    hint("Declaration of " & "structduckdbinterval" &
        " already exists, not redeclaring")
when not declared(duckdbvector):
  type
    duckdbvector* = duckdbvector_1174405593
else:
  static :
    hint("Declaration of " & "duckdbvector" & " already exists, not redeclaring")
when not declared(structduckdbdatestruct):
  type
    structduckdbdatestruct* = structduckdbdatestruct_1174405476
else:
  static :
    hint("Declaration of " & "structduckdbdatestruct" &
        " already exists, not redeclaring")
when not declared(duckdbstringt):
  type
    duckdbstringt* = duckdbstringt_1174405514
else:
  static :
    hint("Declaration of " & "duckdbstringt" &
        " already exists, not redeclaring")
when not declared(duckdbconnection):
  type
    duckdbconnection* = duckdbconnection_1174405538
else:
  static :
    hint("Declaration of " & "duckdbconnection" &
        " already exists, not redeclaring")
when not declared(structduckdbdecimal):
  type
    structduckdbdecimal* = structduckdbdecimal_1174405504
else:
  static :
    hint("Declaration of " & "structduckdbdecimal" &
        " already exists, not redeclaring")
when not declared(duckdbarrow):
  type
    duckdbarrow* = duckdbarrow_1174405565
else:
  static :
    hint("Declaration of " & "duckdbarrow" & " already exists, not redeclaring")
when not declared(structduckdbdatabase):
  type
    structduckdbdatabase* = structduckdbdatabase_1174405532
else:
  static :
    hint("Declaration of " & "structduckdbdatabase" &
        " already exists, not redeclaring")
when not declared(structduckdbtime):
  type
    structduckdbtime* = structduckdbtime_1174405480
else:
  static :
    hint("Declaration of " & "structduckdbtime" &
        " already exists, not redeclaring")
when not declared(structduckdbtimestruct):
  type
    structduckdbtimestruct* = structduckdbtimestruct_1174405484
else:
  static :
    hint("Declaration of " & "structduckdbtimestruct" &
        " already exists, not redeclaring")
when not declared(duckdbtimestampstruct):
  type
    duckdbtimestampstruct* = duckdbtimestampstruct_1174405494
else:
  static :
    hint("Declaration of " & "duckdbtimestampstruct" &
        " already exists, not redeclaring")
when not declared(duckdbhugeint):
  type
    duckdbhugeint* = duckdbhugeint_1174405502
else:
  static :
    hint("Declaration of " & "duckdbhugeint" &
        " already exists, not redeclaring")
when not declared(structduckdbresult):
  type
    structduckdbresult* = structduckdbresult_1174405528
else:
  static :
    hint("Declaration of " & "structduckdbresult" &
        " already exists, not redeclaring")
when not declared(duckdbpendingresult):
  type
    duckdbpendingresult* = duckdbpendingresult_1174405550
else:
  static :
    hint("Declaration of " & "duckdbpendingresult" &
        " already exists, not redeclaring")
when not declared(duckdbtimestamp):
  type
    duckdbtimestamp* = duckdbtimestamp_1174405490
else:
  static :
    hint("Declaration of " & "duckdbtimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbblob):
  type
    duckdbblob* = duckdbblob_1174405518
else:
  static :
    hint("Declaration of " & "duckdbblob" & " already exists, not redeclaring")
when not declared(duckdbdecimal):
  type
    duckdbdecimal* = duckdbdecimal_1174405506
else:
  static :
    hint("Declaration of " & "duckdbdecimal" &
        " already exists, not redeclaring")
when not declared(duckdbreplacementscaninfo):
  type
    duckdbreplacementscaninfo* = duckdbreplacementscaninfo_1174405623
else:
  static :
    hint("Declaration of " & "duckdbreplacementscaninfo" &
        " already exists, not redeclaring")
when not declared(structduckdbblob):
  type
    structduckdbblob* = structduckdbblob_1174405516
else:
  static :
    hint("Declaration of " & "structduckdbblob" &
        " already exists, not redeclaring")
when not declared(structduckdbarrow):
  type
    structduckdbarrow* = structduckdbarrow_1174405563
else:
  static :
    hint("Declaration of " & "structduckdbarrow" &
        " already exists, not redeclaring")
when not declared(duckdbdatabase):
  type
    duckdbdatabase* = duckdbdatabase_1174405534
else:
  static :
    hint("Declaration of " & "duckdbdatabase" &
        " already exists, not redeclaring")
when not declared(duckdblistentry):
  type
    duckdblistentry* = duckdblistentry_1174405522
else:
  static :
    hint("Declaration of " & "duckdblistentry" &
        " already exists, not redeclaring")
when not declared(structduckdblogicaltype):
  type
    structduckdblogicaltype* = structduckdblogicaltype_1174405583
else:
  static :
    hint("Declaration of " & "structduckdblogicaltype" &
        " already exists, not redeclaring")
when not declared(structduckdbhugeint):
  type
    structduckdbhugeint* = structduckdbhugeint_1174405500
else:
  static :
    hint("Declaration of " & "structduckdbhugeint" &
        " already exists, not redeclaring")
when not declared(idxt):
  type
    idxt* = idxt_1174405465
else:
  static :
    hint("Declaration of " & "idxt" & " already exists, not redeclaring")
when not declared(structduckdbextractedstatements):
  type
    structduckdbextractedstatements* = structduckdbextractedstatements_1174405544
else:
  static :
    hint("Declaration of " & "structduckdbextractedstatements" &
        " already exists, not redeclaring")
when not declared(structduckdbconnection):
  type
    structduckdbconnection* = structduckdbconnection_1174405536
else:
  static :
    hint("Declaration of " & "structduckdbconnection" &
        " already exists, not redeclaring")
when not declared(duckdbstate):
  type
    duckdbstate* = duckdbstate_1174405601
else:
  static :
    hint("Declaration of " & "duckdbstate" & " already exists, not redeclaring")
when not declared(duckdbtablefunctionbindt):
  type
    duckdbtablefunctionbindt* = duckdbtablefunctionbindt_1174405615
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionbindt" &
        " already exists, not redeclaring")
when not declared(duckdbinterval):
  type
    duckdbinterval* = duckdbinterval_1174405498
else:
  static :
    hint("Declaration of " & "duckdbinterval" &
        " already exists, not redeclaring")
when not declared(duckdbextractedstatements):
  type
    duckdbextractedstatements* = duckdbextractedstatements_1174405546
else:
  static :
    hint("Declaration of " & "duckdbextractedstatements" &
        " already exists, not redeclaring")
when not declared(duckdbfunctioninfo):
  type
    duckdbfunctioninfo* = duckdbfunctioninfo_1174405613
else:
  static :
    hint("Declaration of " & "duckdbfunctioninfo" &
        " already exists, not redeclaring")
when not declared(duckdbtype):
  type
    duckdbtype* = duckdbtype_1174405470
else:
  static :
    hint("Declaration of " & "duckdbtype" & " already exists, not redeclaring")
when not declared(duckdbdatestruct):
  type
    duckdbdatestruct* = duckdbdatestruct_1174405478
else:
  static :
    hint("Declaration of " & "duckdbdatestruct" &
        " already exists, not redeclaring")
when not declared(duckdbresult):
  type
    duckdbresult* = duckdbresult_1174405530
else:
  static :
    hint("Declaration of " & "duckdbresult" & " already exists, not redeclaring")
when not declared(duckdbreplacementcallbackt):
  type
    duckdbreplacementcallbackt* = duckdbreplacementcallbackt_1174405625
else:
  static :
    hint("Declaration of " & "duckdbreplacementcallbackt" &
        " already exists, not redeclaring")
when not declared(structduckdbarrowstream):
  type
    structduckdbarrowstream* = structduckdbarrowstream_1174405567
else:
  static :
    hint("Declaration of " & "structduckdbarrowstream" &
        " already exists, not redeclaring")
when not declared(duckdbtime):
  type
    duckdbtime* = duckdbtime_1174405482
else:
  static :
    hint("Declaration of " & "duckdbtime" & " already exists, not redeclaring")
when not declared(structduckdbstring):
  type
    structduckdbstring* = structduckdbstring_1174405508
else:
  static :
    hint("Declaration of " & "structduckdbstring" &
        " already exists, not redeclaring")
when not declared(duckdbcolumn):
  type
    duckdbcolumn* = duckdbcolumn_1174405526
else:
  static :
    hint("Declaration of " & "duckdbcolumn" & " already exists, not redeclaring")
when not declared(structduckdbpendingresult):
  type
    structduckdbpendingresult* = structduckdbpendingresult_1174405548
else:
  static :
    hint("Declaration of " & "structduckdbpendingresult" &
        " already exists, not redeclaring")
when not declared(duckdbappender):
  type
    duckdbappender* = duckdbappender_1174405561
else:
  static :
    hint("Declaration of " & "duckdbappender" &
        " already exists, not redeclaring")
when not declared(duckdbdeletecallbackt):
  type
    duckdbdeletecallbackt* = duckdbdeletecallbackt_1174405621
else:
  static :
    hint("Declaration of " & "duckdbdeletecallbackt" &
        " already exists, not redeclaring")
when not declared(structduckdbvector):
  type
    structduckdbvector* = structduckdbvector_1174405591
else:
  static :
    hint("Declaration of " & "structduckdbvector" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunk):
  type
    duckdbdatachunk* = duckdbdatachunk_1174405589
else:
  static :
    hint("Declaration of " & "duckdbdatachunk" &
        " already exists, not redeclaring")
when not declared(structduckdbtimestampstruct):
  type
    structduckdbtimestampstruct* = structduckdbtimestampstruct_1174405492
else:
  static :
    hint("Declaration of " & "structduckdbtimestampstruct" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunction):
  type
    duckdbtablefunction* = duckdbtablefunction_1174405607
else:
  static :
    hint("Declaration of " & "duckdbtablefunction" &
        " already exists, not redeclaring")
when not declared(duckdbvalue):
  type
    duckdbvalue* = duckdbvalue_1174405597
else:
  static :
    hint("Declaration of " & "duckdbvalue" & " already exists, not redeclaring")
when not declared(structduckdbconfig):
  type
    structduckdbconfig* = structduckdbconfig_1174405571
else:
  static :
    hint("Declaration of " & "structduckdbconfig" &
        " already exists, not redeclaring")
when not declared(structduckdbarrowschema):
  type
    structduckdbarrowschema* = structduckdbarrowschema_1174405575
else:
  static :
    hint("Declaration of " & "structduckdbarrowschema" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctioninitt):
  type
    duckdbtablefunctioninitt* = duckdbtablefunctioninitt_1174405617
else:
  static :
    hint("Declaration of " & "duckdbtablefunctioninitt" &
        " already exists, not redeclaring")
when not declared(duckdbinitinfo):
  type
    duckdbinitinfo* = duckdbinitinfo_1174405611
else:
  static :
    hint("Declaration of " & "duckdbinitinfo" &
        " already exists, not redeclaring")
when not declared(structduckdbdate):
  type
    structduckdbdate* = structduckdbdate_1174405472
else:
  static :
    hint("Declaration of " & "structduckdbdate" &
        " already exists, not redeclaring")
when not declared(structduckdblistentry):
  type
    structduckdblistentry* = structduckdblistentry_1174405520
else:
  static :
    hint("Declaration of " & "structduckdblistentry" &
        " already exists, not redeclaring")
when not declared(structduckdbvalue):
  type
    structduckdbvalue* = structduckdbvalue_1174405595
else:
  static :
    hint("Declaration of " & "structduckdbvalue" &
        " already exists, not redeclaring")
when not declared(duckdbpreparedstatement):
  type
    duckdbpreparedstatement* = duckdbpreparedstatement_1174405542
else:
  static :
    hint("Declaration of " & "duckdbpreparedstatement" &
        " already exists, not redeclaring")
when not declared(structduckdbstringt):
  type
    structduckdbstringt* = structduckdbstringt_1174405512
else:
  static :
    hint("Declaration of " & "structduckdbstringt" &
        " already exists, not redeclaring")
when not declared(duckdbconfig):
  type
    duckdbconfig* = duckdbconfig_1174405573
else:
  static :
    hint("Declaration of " & "duckdbconfig" & " already exists, not redeclaring")
when not declared(duckdbarrowschema):
  type
    duckdbarrowschema* = duckdbarrowschema_1174405577
else:
  static :
    hint("Declaration of " & "duckdbarrowschema" &
        " already exists, not redeclaring")
when not declared(duckdbdate):
  type
    duckdbdate* = duckdbdate_1174405474
else:
  static :
    hint("Declaration of " & "duckdbdate" & " already exists, not redeclaring")
when not declared(structduckdbtimestamp):
  type
    structduckdbtimestamp* = structduckdbtimestamp_1174405488
else:
  static :
    hint("Declaration of " & "structduckdbtimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbarrowstream):
  type
    duckdbarrowstream* = duckdbarrowstream_1174405569
else:
  static :
    hint("Declaration of " & "duckdbarrowstream" &
        " already exists, not redeclaring")
when not declared(duckdbarrowarray):
  type
    duckdbarrowarray* = duckdbarrowarray_1174405581
else:
  static :
    hint("Declaration of " & "duckdbarrowarray" &
        " already exists, not redeclaring")
when not declared(structduckdbarrowarray):
  type
    structduckdbarrowarray* = structduckdbarrowarray_1174405579
else:
  static :
    hint("Declaration of " & "structduckdbarrowarray" &
        " already exists, not redeclaring")
when not declared(duckdbpendingstate):
  type
    duckdbpendingstate* = duckdbpendingstate_1174405605
else:
  static :
    hint("Declaration of " & "duckdbpendingstate" &
        " already exists, not redeclaring")
when not declared(Duckdbapi031):
  when 1 is static:
    const
      Duckdbapi031* = 1      ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:43:9
  else:
    let Duckdbapi031* = 1    ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:43:9
else:
  static :
    hint("Declaration of " & "Duckdbapi031" & " already exists, not redeclaring")
when not declared(Duckdbapi032):
  when 2 is static:
    const
      Duckdbapi032* = 2      ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:46:9
  else:
    let Duckdbapi032* = 2    ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:46:9
else:
  static :
    hint("Declaration of " & "Duckdbapi032" & " already exists, not redeclaring")
when not declared(Duckdbapilatest):
  when Duckdbapi032 is typedesc:
    type
      Duckdbapilatest* = Duckdbapi032 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:49:9
  else:
    when Duckdbapi032 is static:
      const
        Duckdbapilatest* = Duckdbapi032 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:49:9
    else:
      let Duckdbapilatest* = Duckdbapi032 ## Generated based on /home/vlad/Sandbox/nim-duckdb/src/lib/duckdb.h:49:9
else:
  static :
    hint("Declaration of " & "Duckdbapilatest" &
        " already exists, not redeclaring")
when not declared(duckdbopen):
  proc duckdbopen*(path: cstring; outdatabase: ptr duckdbdatabase_1174405535): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_open".}
else:
  static :
    hint("Declaration of " & "duckdbopen" & " already exists, not redeclaring")
when not declared(duckdbopenext):
  proc duckdbopenext*(path: cstring; outdatabase: ptr duckdbdatabase_1174405535;
                      config: duckdbconfig_1174405574; outerror: ptr cstring): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_open_ext".}
else:
  static :
    hint("Declaration of " & "duckdbopenext" &
        " already exists, not redeclaring")
when not declared(duckdbclose):
  proc duckdbclose*(database: ptr duckdbdatabase_1174405535): void {.cdecl,
      importc: "duckdb_close".}
else:
  static :
    hint("Declaration of " & "duckdbclose" & " already exists, not redeclaring")
when not declared(duckdbconnect):
  proc duckdbconnect*(database: duckdbdatabase_1174405535;
                      outconnection: ptr duckdbconnection_1174405539): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_connect".}
else:
  static :
    hint("Declaration of " & "duckdbconnect" &
        " already exists, not redeclaring")
when not declared(duckdbinterrupt):
  proc duckdbinterrupt*(connection: duckdbconnection_1174405539): void {.cdecl,
      importc: "duckdb_interrupt".}
else:
  static :
    hint("Declaration of " & "duckdbinterrupt" &
        " already exists, not redeclaring")
when not declared(duckdbqueryprogress):
  proc duckdbqueryprogress*(connection: duckdbconnection_1174405539): cdouble {.
      cdecl, importc: "duckdb_query_progress".}
else:
  static :
    hint("Declaration of " & "duckdbqueryprogress" &
        " already exists, not redeclaring")
when not declared(duckdbdisconnect):
  proc duckdbdisconnect*(connection: ptr duckdbconnection_1174405539): void {.
      cdecl, importc: "duckdb_disconnect".}
else:
  static :
    hint("Declaration of " & "duckdbdisconnect" &
        " already exists, not redeclaring")
when not declared(duckdblibraryversion):
  proc duckdblibraryversion*(): cstring {.cdecl,
      importc: "duckdb_library_version".}
else:
  static :
    hint("Declaration of " & "duckdblibraryversion" &
        " already exists, not redeclaring")
when not declared(duckdbcreateconfig):
  proc duckdbcreateconfig*(outconfig: ptr duckdbconfig_1174405574): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_create_config".}
else:
  static :
    hint("Declaration of " & "duckdbcreateconfig" &
        " already exists, not redeclaring")
when not declared(duckdbconfigcount):
  proc duckdbconfigcount*(): csize_t {.cdecl, importc: "duckdb_config_count".}
else:
  static :
    hint("Declaration of " & "duckdbconfigcount" &
        " already exists, not redeclaring")
when not declared(duckdbgetconfigflag):
  proc duckdbgetconfigflag*(index: csize_t; outname: ptr cstring;
                            outdescription: ptr cstring): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_get_config_flag".}
else:
  static :
    hint("Declaration of " & "duckdbgetconfigflag" &
        " already exists, not redeclaring")
when not declared(duckdbsetconfig):
  proc duckdbsetconfig*(config: duckdbconfig_1174405574; name: cstring;
                        option: cstring): duckdbstate_1174405602 {.cdecl,
      importc: "duckdb_set_config".}
else:
  static :
    hint("Declaration of " & "duckdbsetconfig" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyconfig):
  proc duckdbdestroyconfig*(config: ptr duckdbconfig_1174405574): void {.cdecl,
      importc: "duckdb_destroy_config".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyconfig" &
        " already exists, not redeclaring")
when not declared(duckdbquery):
  proc duckdbquery*(connection: duckdbconnection_1174405539; query: cstring;
                    outresult: ptr duckdbresult_1174405531): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_query".}
else:
  static :
    hint("Declaration of " & "duckdbquery" & " already exists, not redeclaring")
when not declared(duckdbdestroyresult):
  proc duckdbdestroyresult*(result: ptr duckdbresult_1174405531): void {.cdecl,
      importc: "duckdb_destroy_result".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyresult" &
        " already exists, not redeclaring")
when not declared(duckdbcolumnname):
  proc duckdbcolumnname*(result: ptr duckdbresult_1174405531; col: idxt_1174405467): cstring {.
      cdecl, importc: "duckdb_column_name".}
else:
  static :
    hint("Declaration of " & "duckdbcolumnname" &
        " already exists, not redeclaring")
when not declared(duckdbcolumntype):
  proc duckdbcolumntype*(result: ptr duckdbresult_1174405531; col: idxt_1174405467): duckdbtype_1174405471 {.
      cdecl, importc: "duckdb_column_type".}
else:
  static :
    hint("Declaration of " & "duckdbcolumntype" &
        " already exists, not redeclaring")
when not declared(duckdbcolumnlogicaltype):
  proc duckdbcolumnlogicaltype*(result: ptr duckdbresult_1174405531; col: idxt_1174405467): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_column_logical_type".}
else:
  static :
    hint("Declaration of " & "duckdbcolumnlogicaltype" &
        " already exists, not redeclaring")
when not declared(duckdbcolumncount):
  proc duckdbcolumncount*(result: ptr duckdbresult_1174405531): idxt_1174405467 {.
      cdecl, importc: "duckdb_column_count".}
else:
  static :
    hint("Declaration of " & "duckdbcolumncount" &
        " already exists, not redeclaring")
when not declared(duckdbrowcount):
  proc duckdbrowcount*(result: ptr duckdbresult_1174405531): idxt_1174405467 {.
      cdecl, importc: "duckdb_row_count".}
else:
  static :
    hint("Declaration of " & "duckdbrowcount" &
        " already exists, not redeclaring")
when not declared(duckdbrowschanged):
  proc duckdbrowschanged*(result: ptr duckdbresult_1174405531): idxt_1174405467 {.
      cdecl, importc: "duckdb_rows_changed".}
else:
  static :
    hint("Declaration of " & "duckdbrowschanged" &
        " already exists, not redeclaring")
when not declared(duckdbcolumndata):
  proc duckdbcolumndata*(result: ptr duckdbresult_1174405531; col: idxt_1174405467): pointer {.
      cdecl, importc: "duckdb_column_data".}
else:
  static :
    hint("Declaration of " & "duckdbcolumndata" &
        " already exists, not redeclaring")
when not declared(duckdbnullmaskdata):
  proc duckdbnullmaskdata*(result: ptr duckdbresult_1174405531; col: idxt_1174405467): ptr bool {.
      cdecl, importc: "duckdb_nullmask_data".}
else:
  static :
    hint("Declaration of " & "duckdbnullmaskdata" &
        " already exists, not redeclaring")
when not declared(duckdbresulterror):
  proc duckdbresulterror*(result: ptr duckdbresult_1174405531): cstring {.cdecl,
      importc: "duckdb_result_error".}
else:
  static :
    hint("Declaration of " & "duckdbresulterror" &
        " already exists, not redeclaring")
when not declared(duckdbresultgetchunk):
  proc duckdbresultgetchunk*(result: duckdbresult_1174405531; chunkindex: idxt_1174405467): duckdbdatachunk_1174405590 {.
      cdecl, importc: "duckdb_result_get_chunk".}
else:
  static :
    hint("Declaration of " & "duckdbresultgetchunk" &
        " already exists, not redeclaring")
when not declared(duckdbresultisstreaming):
  proc duckdbresultisstreaming*(result: duckdbresult_1174405531): bool {.cdecl,
      importc: "duckdb_result_is_streaming".}
else:
  static :
    hint("Declaration of " & "duckdbresultisstreaming" &
        " already exists, not redeclaring")
when not declared(duckdbresultchunkcount):
  proc duckdbresultchunkcount*(result: duckdbresult_1174405531): idxt_1174405467 {.
      cdecl, importc: "duckdb_result_chunk_count".}
else:
  static :
    hint("Declaration of " & "duckdbresultchunkcount" &
        " already exists, not redeclaring")
when not declared(duckdbvalueboolean):
  proc duckdbvalueboolean*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                           row: idxt_1174405467): bool {.cdecl,
      importc: "duckdb_value_boolean".}
else:
  static :
    hint("Declaration of " & "duckdbvalueboolean" &
        " already exists, not redeclaring")
when not declared(duckdbvalueint8):
  proc duckdbvalueint8*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                        row: idxt_1174405467): int8 {.cdecl,
      importc: "duckdb_value_int8".}
else:
  static :
    hint("Declaration of " & "duckdbvalueint8" &
        " already exists, not redeclaring")
when not declared(duckdbvalueint16):
  proc duckdbvalueint16*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                         row: idxt_1174405467): int16 {.cdecl,
      importc: "duckdb_value_int16".}
else:
  static :
    hint("Declaration of " & "duckdbvalueint16" &
        " already exists, not redeclaring")
when not declared(duckdbvalueint32):
  proc duckdbvalueint32*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                         row: idxt_1174405467): int32 {.cdecl,
      importc: "duckdb_value_int32".}
else:
  static :
    hint("Declaration of " & "duckdbvalueint32" &
        " already exists, not redeclaring")
when not declared(duckdbvalueint64):
  proc duckdbvalueint64*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                         row: idxt_1174405467): int64 {.cdecl,
      importc: "duckdb_value_int64".}
else:
  static :
    hint("Declaration of " & "duckdbvalueint64" &
        " already exists, not redeclaring")
when not declared(duckdbvaluehugeint):
  proc duckdbvaluehugeint*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                           row: idxt_1174405467): duckdbhugeint_1174405503 {.
      cdecl, importc: "duckdb_value_hugeint".}
else:
  static :
    hint("Declaration of " & "duckdbvaluehugeint" &
        " already exists, not redeclaring")
when not declared(duckdbvaluedecimal):
  proc duckdbvaluedecimal*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                           row: idxt_1174405467): duckdbdecimal_1174405507 {.
      cdecl, importc: "duckdb_value_decimal".}
else:
  static :
    hint("Declaration of " & "duckdbvaluedecimal" &
        " already exists, not redeclaring")
when not declared(duckdbvalueuint8):
  proc duckdbvalueuint8*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                         row: idxt_1174405467): uint8 {.cdecl,
      importc: "duckdb_value_uint8".}
else:
  static :
    hint("Declaration of " & "duckdbvalueuint8" &
        " already exists, not redeclaring")
when not declared(duckdbvalueuint16):
  proc duckdbvalueuint16*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                          row: idxt_1174405467): uint16 {.cdecl,
      importc: "duckdb_value_uint16".}
else:
  static :
    hint("Declaration of " & "duckdbvalueuint16" &
        " already exists, not redeclaring")
when not declared(duckdbvalueuint32):
  proc duckdbvalueuint32*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                          row: idxt_1174405467): uint32 {.cdecl,
      importc: "duckdb_value_uint32".}
else:
  static :
    hint("Declaration of " & "duckdbvalueuint32" &
        " already exists, not redeclaring")
when not declared(duckdbvalueuint64):
  proc duckdbvalueuint64*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                          row: idxt_1174405467): uint64 {.cdecl,
      importc: "duckdb_value_uint64".}
else:
  static :
    hint("Declaration of " & "duckdbvalueuint64" &
        " already exists, not redeclaring")
when not declared(duckdbvaluefloat):
  proc duckdbvaluefloat*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                         row: idxt_1174405467): cfloat {.cdecl,
      importc: "duckdb_value_float".}
else:
  static :
    hint("Declaration of " & "duckdbvaluefloat" &
        " already exists, not redeclaring")
when not declared(duckdbvaluedouble):
  proc duckdbvaluedouble*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                          row: idxt_1174405467): cdouble {.cdecl,
      importc: "duckdb_value_double".}
else:
  static :
    hint("Declaration of " & "duckdbvaluedouble" &
        " already exists, not redeclaring")
when not declared(duckdbvaluedate):
  proc duckdbvaluedate*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                        row: idxt_1174405467): duckdbdate_1174405475 {.cdecl,
      importc: "duckdb_value_date".}
else:
  static :
    hint("Declaration of " & "duckdbvaluedate" &
        " already exists, not redeclaring")
when not declared(duckdbvaluetime):
  proc duckdbvaluetime*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                        row: idxt_1174405467): duckdbtime_1174405483 {.cdecl,
      importc: "duckdb_value_time".}
else:
  static :
    hint("Declaration of " & "duckdbvaluetime" &
        " already exists, not redeclaring")
when not declared(duckdbvaluetimestamp):
  proc duckdbvaluetimestamp*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                             row: idxt_1174405467): duckdbtimestamp_1174405491 {.
      cdecl, importc: "duckdb_value_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbvaluetimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbvalueinterval):
  proc duckdbvalueinterval*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                            row: idxt_1174405467): duckdbinterval_1174405499 {.
      cdecl, importc: "duckdb_value_interval".}
else:
  static :
    hint("Declaration of " & "duckdbvalueinterval" &
        " already exists, not redeclaring")
when not declared(duckdbvaluevarchar):
  proc duckdbvaluevarchar*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                           row: idxt_1174405467): cstring {.cdecl,
      importc: "duckdb_value_varchar".}
else:
  static :
    hint("Declaration of " & "duckdbvaluevarchar" &
        " already exists, not redeclaring")
when not declared(duckdbvaluestring):
  proc duckdbvaluestring*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                          row: idxt_1174405467): duckdbstring_1174405511 {.
      cdecl, importc: "duckdb_value_string".}
else:
  static :
    hint("Declaration of " & "duckdbvaluestring" &
        " already exists, not redeclaring")
when not declared(duckdbvaluevarcharinternal):
  proc duckdbvaluevarcharinternal*(result: ptr duckdbresult_1174405531;
                                   col: idxt_1174405467; row: idxt_1174405467): cstring {.
      cdecl, importc: "duckdb_value_varchar_internal".}
else:
  static :
    hint("Declaration of " & "duckdbvaluevarcharinternal" &
        " already exists, not redeclaring")
when not declared(duckdbvaluestringinternal):
  proc duckdbvaluestringinternal*(result: ptr duckdbresult_1174405531;
                                  col: idxt_1174405467; row: idxt_1174405467): duckdbstring_1174405511 {.
      cdecl, importc: "duckdb_value_string_internal".}
else:
  static :
    hint("Declaration of " & "duckdbvaluestringinternal" &
        " already exists, not redeclaring")
when not declared(duckdbvalueblob):
  proc duckdbvalueblob*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                        row: idxt_1174405467): duckdbblob_1174405519 {.cdecl,
      importc: "duckdb_value_blob".}
else:
  static :
    hint("Declaration of " & "duckdbvalueblob" &
        " already exists, not redeclaring")
when not declared(duckdbvalueisnull):
  proc duckdbvalueisnull*(result: ptr duckdbresult_1174405531; col: idxt_1174405467;
                          row: idxt_1174405467): bool {.cdecl,
      importc: "duckdb_value_is_null".}
else:
  static :
    hint("Declaration of " & "duckdbvalueisnull" &
        " already exists, not redeclaring")
when not declared(duckdbmalloc):
  proc duckdbmalloc*(size: csize_t): pointer {.cdecl, importc: "duckdb_malloc".}
else:
  static :
    hint("Declaration of " & "duckdbmalloc" & " already exists, not redeclaring")
when not declared(duckdbfree):
  proc duckdbfree*(ptrarg: pointer): void {.cdecl, importc: "duckdb_free".}
else:
  static :
    hint("Declaration of " & "duckdbfree" & " already exists, not redeclaring")
when not declared(duckdbvectorsize):
  proc duckdbvectorsize*(): idxt_1174405467 {.cdecl,
      importc: "duckdb_vector_size".}
else:
  static :
    hint("Declaration of " & "duckdbvectorsize" &
        " already exists, not redeclaring")
when not declared(duckdbstringisinlined):
  proc duckdbstringisinlined*(string: duckdbstringt_1174405515): bool {.cdecl,
      importc: "duckdb_string_is_inlined".}
else:
  static :
    hint("Declaration of " & "duckdbstringisinlined" &
        " already exists, not redeclaring")
when not declared(duckdbfromdate):
  proc duckdbfromdate*(date: duckdbdate_1174405475): duckdbdatestruct_1174405479 {.
      cdecl, importc: "duckdb_from_date".}
else:
  static :
    hint("Declaration of " & "duckdbfromdate" &
        " already exists, not redeclaring")
when not declared(duckdbtodate):
  proc duckdbtodate*(date: duckdbdatestruct_1174405479): duckdbdate_1174405475 {.
      cdecl, importc: "duckdb_to_date".}
else:
  static :
    hint("Declaration of " & "duckdbtodate" & " already exists, not redeclaring")
when not declared(duckdbfromtime):
  proc duckdbfromtime*(time: duckdbtime_1174405483): duckdbtimestruct_1174405487 {.
      cdecl, importc: "duckdb_from_time".}
else:
  static :
    hint("Declaration of " & "duckdbfromtime" &
        " already exists, not redeclaring")
when not declared(duckdbtotime):
  proc duckdbtotime*(time: duckdbtimestruct_1174405487): duckdbtime_1174405483 {.
      cdecl, importc: "duckdb_to_time".}
else:
  static :
    hint("Declaration of " & "duckdbtotime" & " already exists, not redeclaring")
when not declared(duckdbfromtimestamp):
  proc duckdbfromtimestamp*(ts: duckdbtimestamp_1174405491): duckdbtimestampstruct_1174405495 {.
      cdecl, importc: "duckdb_from_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbfromtimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbtotimestamp):
  proc duckdbtotimestamp*(ts: duckdbtimestampstruct_1174405495): duckdbtimestamp_1174405491 {.
      cdecl, importc: "duckdb_to_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbtotimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbhugeinttodouble):
  proc duckdbhugeinttodouble*(val: duckdbhugeint_1174405503): cdouble {.cdecl,
      importc: "duckdb_hugeint_to_double".}
else:
  static :
    hint("Declaration of " & "duckdbhugeinttodouble" &
        " already exists, not redeclaring")
when not declared(duckdbdoubletohugeint):
  proc duckdbdoubletohugeint*(val: cdouble): duckdbhugeint_1174405503 {.cdecl,
      importc: "duckdb_double_to_hugeint".}
else:
  static :
    hint("Declaration of " & "duckdbdoubletohugeint" &
        " already exists, not redeclaring")
when not declared(duckdbdoubletodecimal):
  proc duckdbdoubletodecimal*(val: cdouble; width: uint8; scale: uint8): duckdbdecimal_1174405507 {.
      cdecl, importc: "duckdb_double_to_decimal".}
else:
  static :
    hint("Declaration of " & "duckdbdoubletodecimal" &
        " already exists, not redeclaring")
when not declared(duckdbdecimaltodouble):
  proc duckdbdecimaltodouble*(val: duckdbdecimal_1174405507): cdouble {.cdecl,
      importc: "duckdb_decimal_to_double".}
else:
  static :
    hint("Declaration of " & "duckdbdecimaltodouble" &
        " already exists, not redeclaring")
when not declared(duckdbprepare):
  proc duckdbprepare*(connection: duckdbconnection_1174405539; query: cstring;
                      outpreparedstatement: ptr duckdbpreparedstatement_1174405543): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_prepare".}
else:
  static :
    hint("Declaration of " & "duckdbprepare" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyprepare):
  proc duckdbdestroyprepare*(preparedstatement: ptr duckdbpreparedstatement_1174405543): void {.
      cdecl, importc: "duckdb_destroy_prepare".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyprepare" &
        " already exists, not redeclaring")
when not declared(duckdbprepareerror):
  proc duckdbprepareerror*(preparedstatement: duckdbpreparedstatement_1174405543): cstring {.
      cdecl, importc: "duckdb_prepare_error".}
else:
  static :
    hint("Declaration of " & "duckdbprepareerror" &
        " already exists, not redeclaring")
when not declared(duckdbnparams):
  proc duckdbnparams*(preparedstatement: duckdbpreparedstatement_1174405543): idxt_1174405467 {.
      cdecl, importc: "duckdb_nparams".}
else:
  static :
    hint("Declaration of " & "duckdbnparams" &
        " already exists, not redeclaring")
when not declared(duckdbparametername):
  proc duckdbparametername*(preparedstatement: duckdbpreparedstatement_1174405543;
                            index: idxt_1174405467): cstring {.cdecl,
      importc: "duckdb_parameter_name".}
else:
  static :
    hint("Declaration of " & "duckdbparametername" &
        " already exists, not redeclaring")
when not declared(duckdbparamtype):
  proc duckdbparamtype*(preparedstatement: duckdbpreparedstatement_1174405543;
                        paramidx: idxt_1174405467): duckdbtype_1174405471 {.
      cdecl, importc: "duckdb_param_type".}
else:
  static :
    hint("Declaration of " & "duckdbparamtype" &
        " already exists, not redeclaring")
when not declared(duckdbclearbindings):
  proc duckdbclearbindings*(preparedstatement: duckdbpreparedstatement_1174405543): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_clear_bindings".}
else:
  static :
    hint("Declaration of " & "duckdbclearbindings" &
        " already exists, not redeclaring")
when not declared(duckdbbindvalue):
  proc duckdbbindvalue*(preparedstatement: duckdbpreparedstatement_1174405543;
                        paramidx: idxt_1174405467; val: duckdbvalue_1174405598): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_value".}
else:
  static :
    hint("Declaration of " & "duckdbbindvalue" &
        " already exists, not redeclaring")
when not declared(duckdbbindparameterindex):
  proc duckdbbindparameterindex*(preparedstatement: duckdbpreparedstatement_1174405543;
                                 paramidxout: ptr idxt_1174405467; name: cstring): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_parameter_index".}
else:
  static :
    hint("Declaration of " & "duckdbbindparameterindex" &
        " already exists, not redeclaring")
when not declared(duckdbbindboolean):
  proc duckdbbindboolean*(preparedstatement: duckdbpreparedstatement_1174405543;
                          paramidx: idxt_1174405467; val: bool): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_boolean".}
else:
  static :
    hint("Declaration of " & "duckdbbindboolean" &
        " already exists, not redeclaring")
when not declared(duckdbbindint8):
  proc duckdbbindint8*(preparedstatement: duckdbpreparedstatement_1174405543;
                       paramidx: idxt_1174405467; val: int8): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_int8".}
else:
  static :
    hint("Declaration of " & "duckdbbindint8" &
        " already exists, not redeclaring")
when not declared(duckdbbindint16):
  proc duckdbbindint16*(preparedstatement: duckdbpreparedstatement_1174405543;
                        paramidx: idxt_1174405467; val: int16): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_int16".}
else:
  static :
    hint("Declaration of " & "duckdbbindint16" &
        " already exists, not redeclaring")
when not declared(duckdbbindint32):
  proc duckdbbindint32*(preparedstatement: duckdbpreparedstatement_1174405543;
                        paramidx: idxt_1174405467; val: int32): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_int32".}
else:
  static :
    hint("Declaration of " & "duckdbbindint32" &
        " already exists, not redeclaring")
when not declared(duckdbbindint64):
  proc duckdbbindint64*(preparedstatement: duckdbpreparedstatement_1174405543;
                        paramidx: idxt_1174405467; val: int64): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_int64".}
else:
  static :
    hint("Declaration of " & "duckdbbindint64" &
        " already exists, not redeclaring")
when not declared(duckdbbindhugeint):
  proc duckdbbindhugeint*(preparedstatement: duckdbpreparedstatement_1174405543;
                          paramidx: idxt_1174405467; val: duckdbhugeint_1174405503): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_hugeint".}
else:
  static :
    hint("Declaration of " & "duckdbbindhugeint" &
        " already exists, not redeclaring")
when not declared(duckdbbinddecimal):
  proc duckdbbinddecimal*(preparedstatement: duckdbpreparedstatement_1174405543;
                          paramidx: idxt_1174405467; val: duckdbdecimal_1174405507): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_decimal".}
else:
  static :
    hint("Declaration of " & "duckdbbinddecimal" &
        " already exists, not redeclaring")
when not declared(duckdbbinduint8):
  proc duckdbbinduint8*(preparedstatement: duckdbpreparedstatement_1174405543;
                        paramidx: idxt_1174405467; val: uint8): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_uint8".}
else:
  static :
    hint("Declaration of " & "duckdbbinduint8" &
        " already exists, not redeclaring")
when not declared(duckdbbinduint16):
  proc duckdbbinduint16*(preparedstatement: duckdbpreparedstatement_1174405543;
                         paramidx: idxt_1174405467; val: uint16): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_uint16".}
else:
  static :
    hint("Declaration of " & "duckdbbinduint16" &
        " already exists, not redeclaring")
when not declared(duckdbbinduint32):
  proc duckdbbinduint32*(preparedstatement: duckdbpreparedstatement_1174405543;
                         paramidx: idxt_1174405467; val: uint32): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_uint32".}
else:
  static :
    hint("Declaration of " & "duckdbbinduint32" &
        " already exists, not redeclaring")
when not declared(duckdbbinduint64):
  proc duckdbbinduint64*(preparedstatement: duckdbpreparedstatement_1174405543;
                         paramidx: idxt_1174405467; val: uint64): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_uint64".}
else:
  static :
    hint("Declaration of " & "duckdbbinduint64" &
        " already exists, not redeclaring")
when not declared(duckdbbindfloat):
  proc duckdbbindfloat*(preparedstatement: duckdbpreparedstatement_1174405543;
                        paramidx: idxt_1174405467; val: cfloat): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_float".}
else:
  static :
    hint("Declaration of " & "duckdbbindfloat" &
        " already exists, not redeclaring")
when not declared(duckdbbinddouble):
  proc duckdbbinddouble*(preparedstatement: duckdbpreparedstatement_1174405543;
                         paramidx: idxt_1174405467; val: cdouble): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_double".}
else:
  static :
    hint("Declaration of " & "duckdbbinddouble" &
        " already exists, not redeclaring")
when not declared(duckdbbinddate):
  proc duckdbbinddate*(preparedstatement: duckdbpreparedstatement_1174405543;
                       paramidx: idxt_1174405467; val: duckdbdate_1174405475): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_date".}
else:
  static :
    hint("Declaration of " & "duckdbbinddate" &
        " already exists, not redeclaring")
when not declared(duckdbbindtime):
  proc duckdbbindtime*(preparedstatement: duckdbpreparedstatement_1174405543;
                       paramidx: idxt_1174405467; val: duckdbtime_1174405483): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_time".}
else:
  static :
    hint("Declaration of " & "duckdbbindtime" &
        " already exists, not redeclaring")
when not declared(duckdbbindtimestamp):
  proc duckdbbindtimestamp*(preparedstatement: duckdbpreparedstatement_1174405543;
                            paramidx: idxt_1174405467; val: duckdbtimestamp_1174405491): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbbindtimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbbindinterval):
  proc duckdbbindinterval*(preparedstatement: duckdbpreparedstatement_1174405543;
                           paramidx: idxt_1174405467; val: duckdbinterval_1174405499): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_interval".}
else:
  static :
    hint("Declaration of " & "duckdbbindinterval" &
        " already exists, not redeclaring")
when not declared(duckdbbindvarchar):
  proc duckdbbindvarchar*(preparedstatement: duckdbpreparedstatement_1174405543;
                          paramidx: idxt_1174405467; val: cstring): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_varchar".}
else:
  static :
    hint("Declaration of " & "duckdbbindvarchar" &
        " already exists, not redeclaring")
when not declared(duckdbbindvarcharlength):
  proc duckdbbindvarcharlength*(preparedstatement: duckdbpreparedstatement_1174405543;
                                paramidx: idxt_1174405467; val: cstring;
                                length: idxt_1174405467): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_varchar_length".}
else:
  static :
    hint("Declaration of " & "duckdbbindvarcharlength" &
        " already exists, not redeclaring")
when not declared(duckdbbindblob):
  proc duckdbbindblob*(preparedstatement: duckdbpreparedstatement_1174405543;
                       paramidx: idxt_1174405467; data: pointer; length: idxt_1174405467): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_blob".}
else:
  static :
    hint("Declaration of " & "duckdbbindblob" &
        " already exists, not redeclaring")
when not declared(duckdbbindnull):
  proc duckdbbindnull*(preparedstatement: duckdbpreparedstatement_1174405543;
                       paramidx: idxt_1174405467): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_bind_null".}
else:
  static :
    hint("Declaration of " & "duckdbbindnull" &
        " already exists, not redeclaring")
when not declared(duckdbexecuteprepared):
  proc duckdbexecuteprepared*(preparedstatement: duckdbpreparedstatement_1174405543;
                              outresult: ptr duckdbresult_1174405531): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_execute_prepared".}
else:
  static :
    hint("Declaration of " & "duckdbexecuteprepared" &
        " already exists, not redeclaring")
when not declared(duckdbexecutepreparedarrow):
  proc duckdbexecutepreparedarrow*(preparedstatement: duckdbpreparedstatement_1174405543;
                                   outresult: ptr duckdbarrow_1174405566): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_execute_prepared_arrow".}
else:
  static :
    hint("Declaration of " & "duckdbexecutepreparedarrow" &
        " already exists, not redeclaring")
when not declared(duckdbarrowscan):
  proc duckdbarrowscan*(connection: duckdbconnection_1174405539;
                        tablename: cstring; arrow: duckdbarrowstream_1174405570): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_arrow_scan".}
else:
  static :
    hint("Declaration of " & "duckdbarrowscan" &
        " already exists, not redeclaring")
when not declared(duckdbarrowarrayscan):
  proc duckdbarrowarrayscan*(connection: duckdbconnection_1174405539;
                             tablename: cstring; arrowschema: duckdbarrowschema_1174405578;
                             arrowarray: duckdbarrowarray_1174405582;
                             outstream: ptr duckdbarrowstream_1174405570): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_arrow_array_scan".}
else:
  static :
    hint("Declaration of " & "duckdbarrowarrayscan" &
        " already exists, not redeclaring")
when not declared(duckdbextractstatements):
  proc duckdbextractstatements*(connection: duckdbconnection_1174405539;
                                query: cstring; outextractedstatements: ptr duckdbextractedstatements_1174405547): idxt_1174405467 {.
      cdecl, importc: "duckdb_extract_statements".}
else:
  static :
    hint("Declaration of " & "duckdbextractstatements" &
        " already exists, not redeclaring")
when not declared(duckdbprepareextractedstatement):
  proc duckdbprepareextractedstatement*(connection: duckdbconnection_1174405539;
      extractedstatements: duckdbextractedstatements_1174405547; index: idxt_1174405467;
      outpreparedstatement: ptr duckdbpreparedstatement_1174405543): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_prepare_extracted_statement".}
else:
  static :
    hint("Declaration of " & "duckdbprepareextractedstatement" &
        " already exists, not redeclaring")
when not declared(duckdbextractstatementserror):
  proc duckdbextractstatementserror*(extractedstatements: duckdbextractedstatements_1174405547): cstring {.
      cdecl, importc: "duckdb_extract_statements_error".}
else:
  static :
    hint("Declaration of " & "duckdbextractstatementserror" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyextracted):
  proc duckdbdestroyextracted*(extractedstatements: ptr duckdbextractedstatements_1174405547): void {.
      cdecl, importc: "duckdb_destroy_extracted".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyextracted" &
        " already exists, not redeclaring")
when not declared(duckdbpendingprepared):
  proc duckdbpendingprepared*(preparedstatement: duckdbpreparedstatement_1174405543;
                              outresult: ptr duckdbpendingresult_1174405551): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_pending_prepared".}
else:
  static :
    hint("Declaration of " & "duckdbpendingprepared" &
        " already exists, not redeclaring")
when not declared(duckdbpendingpreparedstreaming):
  proc duckdbpendingpreparedstreaming*(preparedstatement: duckdbpreparedstatement_1174405543;
                                       outresult: ptr duckdbpendingresult_1174405551): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_pending_prepared_streaming".}
else:
  static :
    hint("Declaration of " & "duckdbpendingpreparedstreaming" &
        " already exists, not redeclaring")
when not declared(duckdbdestroypending):
  proc duckdbdestroypending*(pendingresult: ptr duckdbpendingresult_1174405551): void {.
      cdecl, importc: "duckdb_destroy_pending".}
else:
  static :
    hint("Declaration of " & "duckdbdestroypending" &
        " already exists, not redeclaring")
when not declared(duckdbpendingerror):
  proc duckdbpendingerror*(pendingresult: duckdbpendingresult_1174405551): cstring {.
      cdecl, importc: "duckdb_pending_error".}
else:
  static :
    hint("Declaration of " & "duckdbpendingerror" &
        " already exists, not redeclaring")
when not declared(duckdbpendingexecutetask):
  proc duckdbpendingexecutetask*(pendingresult: duckdbpendingresult_1174405551): duckdbpendingstate_1174405606 {.
      cdecl, importc: "duckdb_pending_execute_task".}
else:
  static :
    hint("Declaration of " & "duckdbpendingexecutetask" &
        " already exists, not redeclaring")
when not declared(duckdbexecutepending):
  proc duckdbexecutepending*(pendingresult: duckdbpendingresult_1174405551;
                             outresult: ptr duckdbresult_1174405531): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_execute_pending".}
else:
  static :
    hint("Declaration of " & "duckdbexecutepending" &
        " already exists, not redeclaring")
when not declared(duckdbpendingexecutionisfinished):
  proc duckdbpendingexecutionisfinished*(pendingstate: duckdbpendingstate_1174405606): bool {.
      cdecl, importc: "duckdb_pending_execution_is_finished".}
else:
  static :
    hint("Declaration of " & "duckdbpendingexecutionisfinished" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyvalue):
  proc duckdbdestroyvalue*(value: ptr duckdbvalue_1174405598): void {.cdecl,
      importc: "duckdb_destroy_value".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyvalue" &
        " already exists, not redeclaring")
when not declared(duckdbcreatevarchar):
  proc duckdbcreatevarchar*(text: cstring): duckdbvalue_1174405598 {.cdecl,
      importc: "duckdb_create_varchar".}
else:
  static :
    hint("Declaration of " & "duckdbcreatevarchar" &
        " already exists, not redeclaring")
when not declared(duckdbcreatevarcharlength):
  proc duckdbcreatevarcharlength*(text: cstring; length: idxt_1174405467): duckdbvalue_1174405598 {.
      cdecl, importc: "duckdb_create_varchar_length".}
else:
  static :
    hint("Declaration of " & "duckdbcreatevarcharlength" &
        " already exists, not redeclaring")
when not declared(duckdbcreateint64):
  proc duckdbcreateint64*(val: int64): duckdbvalue_1174405598 {.cdecl,
      importc: "duckdb_create_int64".}
else:
  static :
    hint("Declaration of " & "duckdbcreateint64" &
        " already exists, not redeclaring")
when not declared(duckdbgetvarchar):
  proc duckdbgetvarchar*(value: duckdbvalue_1174405598): cstring {.cdecl,
      importc: "duckdb_get_varchar".}
else:
  static :
    hint("Declaration of " & "duckdbgetvarchar" &
        " already exists, not redeclaring")
when not declared(duckdbgetint64):
  proc duckdbgetint64*(value: duckdbvalue_1174405598): int64 {.cdecl,
      importc: "duckdb_get_int64".}
else:
  static :
    hint("Declaration of " & "duckdbgetint64" &
        " already exists, not redeclaring")
when not declared(duckdbcreatelogicaltype):
  proc duckdbcreatelogicaltype*(typearg: duckdbtype_1174405471): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_create_logical_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatelogicaltype" &
        " already exists, not redeclaring")
when not declared(duckdbcreatelisttype):
  proc duckdbcreatelisttype*(typearg: duckdblogicaltype_1174405586): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_create_list_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatelisttype" &
        " already exists, not redeclaring")
when not declared(duckdbcreatemaptype):
  proc duckdbcreatemaptype*(keytype: duckdblogicaltype_1174405586;
                            valuetype: duckdblogicaltype_1174405586): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_create_map_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatemaptype" &
        " already exists, not redeclaring")
when not declared(duckdbcreateuniontype):
  proc duckdbcreateuniontype*(membertypes: duckdblogicaltype_1174405586;
                              membernames: ptr cstring; membercount: idxt_1174405467): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_create_union_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreateuniontype" &
        " already exists, not redeclaring")
when not declared(duckdbcreatestructtype):
  proc duckdbcreatestructtype*(membertypes: ptr duckdblogicaltype_1174405586;
                               membernames: ptr cstring; membercount: idxt_1174405467): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_create_struct_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatestructtype" &
        " already exists, not redeclaring")
when not declared(duckdbcreatedecimaltype):
  proc duckdbcreatedecimaltype*(width: uint8; scale: uint8): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_create_decimal_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatedecimaltype" &
        " already exists, not redeclaring")
when not declared(duckdbgettypeid):
  proc duckdbgettypeid*(typearg: duckdblogicaltype_1174405586): duckdbtype_1174405471 {.
      cdecl, importc: "duckdb_get_type_id".}
else:
  static :
    hint("Declaration of " & "duckdbgettypeid" &
        " already exists, not redeclaring")
when not declared(duckdbdecimalwidth):
  proc duckdbdecimalwidth*(typearg: duckdblogicaltype_1174405586): uint8 {.
      cdecl, importc: "duckdb_decimal_width".}
else:
  static :
    hint("Declaration of " & "duckdbdecimalwidth" &
        " already exists, not redeclaring")
when not declared(duckdbdecimalscale):
  proc duckdbdecimalscale*(typearg: duckdblogicaltype_1174405586): uint8 {.
      cdecl, importc: "duckdb_decimal_scale".}
else:
  static :
    hint("Declaration of " & "duckdbdecimalscale" &
        " already exists, not redeclaring")
when not declared(duckdbdecimalinternaltype):
  proc duckdbdecimalinternaltype*(typearg: duckdblogicaltype_1174405586): duckdbtype_1174405471 {.
      cdecl, importc: "duckdb_decimal_internal_type".}
else:
  static :
    hint("Declaration of " & "duckdbdecimalinternaltype" &
        " already exists, not redeclaring")
when not declared(duckdbenuminternaltype):
  proc duckdbenuminternaltype*(typearg: duckdblogicaltype_1174405586): duckdbtype_1174405471 {.
      cdecl, importc: "duckdb_enum_internal_type".}
else:
  static :
    hint("Declaration of " & "duckdbenuminternaltype" &
        " already exists, not redeclaring")
when not declared(duckdbenumdictionarysize):
  proc duckdbenumdictionarysize*(typearg: duckdblogicaltype_1174405586): uint32 {.
      cdecl, importc: "duckdb_enum_dictionary_size".}
else:
  static :
    hint("Declaration of " & "duckdbenumdictionarysize" &
        " already exists, not redeclaring")
when not declared(duckdbenumdictionaryvalue):
  proc duckdbenumdictionaryvalue*(typearg: duckdblogicaltype_1174405586;
                                  index: idxt_1174405467): cstring {.cdecl,
      importc: "duckdb_enum_dictionary_value".}
else:
  static :
    hint("Declaration of " & "duckdbenumdictionaryvalue" &
        " already exists, not redeclaring")
when not declared(duckdblisttypechildtype):
  proc duckdblisttypechildtype*(typearg: duckdblogicaltype_1174405586): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_list_type_child_type".}
else:
  static :
    hint("Declaration of " & "duckdblisttypechildtype" &
        " already exists, not redeclaring")
when not declared(duckdbmaptypekeytype):
  proc duckdbmaptypekeytype*(typearg: duckdblogicaltype_1174405586): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_map_type_key_type".}
else:
  static :
    hint("Declaration of " & "duckdbmaptypekeytype" &
        " already exists, not redeclaring")
when not declared(duckdbmaptypevaluetype):
  proc duckdbmaptypevaluetype*(typearg: duckdblogicaltype_1174405586): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_map_type_value_type".}
else:
  static :
    hint("Declaration of " & "duckdbmaptypevaluetype" &
        " already exists, not redeclaring")
when not declared(duckdbstructtypechildcount):
  proc duckdbstructtypechildcount*(typearg: duckdblogicaltype_1174405586): idxt_1174405467 {.
      cdecl, importc: "duckdb_struct_type_child_count".}
else:
  static :
    hint("Declaration of " & "duckdbstructtypechildcount" &
        " already exists, not redeclaring")
when not declared(duckdbstructtypechildname):
  proc duckdbstructtypechildname*(typearg: duckdblogicaltype_1174405586;
                                  index: idxt_1174405467): cstring {.cdecl,
      importc: "duckdb_struct_type_child_name".}
else:
  static :
    hint("Declaration of " & "duckdbstructtypechildname" &
        " already exists, not redeclaring")
when not declared(duckdbstructtypechildtype):
  proc duckdbstructtypechildtype*(typearg: duckdblogicaltype_1174405586;
                                  index: idxt_1174405467): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_struct_type_child_type".}
else:
  static :
    hint("Declaration of " & "duckdbstructtypechildtype" &
        " already exists, not redeclaring")
when not declared(duckdbuniontypemembercount):
  proc duckdbuniontypemembercount*(typearg: duckdblogicaltype_1174405586): idxt_1174405467 {.
      cdecl, importc: "duckdb_union_type_member_count".}
else:
  static :
    hint("Declaration of " & "duckdbuniontypemembercount" &
        " already exists, not redeclaring")
when not declared(duckdbuniontypemembername):
  proc duckdbuniontypemembername*(typearg: duckdblogicaltype_1174405586;
                                  index: idxt_1174405467): cstring {.cdecl,
      importc: "duckdb_union_type_member_name".}
else:
  static :
    hint("Declaration of " & "duckdbuniontypemembername" &
        " already exists, not redeclaring")
when not declared(duckdbuniontypemembertype):
  proc duckdbuniontypemembertype*(typearg: duckdblogicaltype_1174405586;
                                  index: idxt_1174405467): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_union_type_member_type".}
else:
  static :
    hint("Declaration of " & "duckdbuniontypemembertype" &
        " already exists, not redeclaring")
when not declared(duckdbdestroylogicaltype):
  proc duckdbdestroylogicaltype*(typearg: ptr duckdblogicaltype_1174405586): void {.
      cdecl, importc: "duckdb_destroy_logical_type".}
else:
  static :
    hint("Declaration of " & "duckdbdestroylogicaltype" &
        " already exists, not redeclaring")
when not declared(duckdbcreatedatachunk):
  proc duckdbcreatedatachunk*(types: ptr duckdblogicaltype_1174405586;
                              columncount: idxt_1174405467): duckdbdatachunk_1174405590 {.
      cdecl, importc: "duckdb_create_data_chunk".}
else:
  static :
    hint("Declaration of " & "duckdbcreatedatachunk" &
        " already exists, not redeclaring")
when not declared(duckdbdestroydatachunk):
  proc duckdbdestroydatachunk*(chunk: ptr duckdbdatachunk_1174405590): void {.
      cdecl, importc: "duckdb_destroy_data_chunk".}
else:
  static :
    hint("Declaration of " & "duckdbdestroydatachunk" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunkreset):
  proc duckdbdatachunkreset*(chunk: duckdbdatachunk_1174405590): void {.cdecl,
      importc: "duckdb_data_chunk_reset".}
else:
  static :
    hint("Declaration of " & "duckdbdatachunkreset" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunkgetcolumncount):
  proc duckdbdatachunkgetcolumncount*(chunk: duckdbdatachunk_1174405590): idxt_1174405467 {.
      cdecl, importc: "duckdb_data_chunk_get_column_count".}
else:
  static :
    hint("Declaration of " & "duckdbdatachunkgetcolumncount" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunkgetvector):
  proc duckdbdatachunkgetvector*(chunk: duckdbdatachunk_1174405590; colidx: idxt_1174405467): duckdbvector_1174405594 {.
      cdecl, importc: "duckdb_data_chunk_get_vector".}
else:
  static :
    hint("Declaration of " & "duckdbdatachunkgetvector" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunkgetsize):
  proc duckdbdatachunkgetsize*(chunk: duckdbdatachunk_1174405590): idxt_1174405467 {.
      cdecl, importc: "duckdb_data_chunk_get_size".}
else:
  static :
    hint("Declaration of " & "duckdbdatachunkgetsize" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunksetsize):
  proc duckdbdatachunksetsize*(chunk: duckdbdatachunk_1174405590; size: idxt_1174405467): void {.
      cdecl, importc: "duckdb_data_chunk_set_size".}
else:
  static :
    hint("Declaration of " & "duckdbdatachunksetsize" &
        " already exists, not redeclaring")
when not declared(duckdbvectorgetcolumntype):
  proc duckdbvectorgetcolumntype*(vector: duckdbvector_1174405594): duckdblogicaltype_1174405586 {.
      cdecl, importc: "duckdb_vector_get_column_type".}
else:
  static :
    hint("Declaration of " & "duckdbvectorgetcolumntype" &
        " already exists, not redeclaring")
when not declared(duckdbvectorgetdata):
  proc duckdbvectorgetdata*(vector: duckdbvector_1174405594): pointer {.cdecl,
      importc: "duckdb_vector_get_data".}
else:
  static :
    hint("Declaration of " & "duckdbvectorgetdata" &
        " already exists, not redeclaring")
when not declared(duckdbvectorgetvalidity):
  proc duckdbvectorgetvalidity*(vector: duckdbvector_1174405594): ptr uint64 {.
      cdecl, importc: "duckdb_vector_get_validity".}
else:
  static :
    hint("Declaration of " & "duckdbvectorgetvalidity" &
        " already exists, not redeclaring")
when not declared(duckdbvectorensurevaliditywritable):
  proc duckdbvectorensurevaliditywritable*(vector: duckdbvector_1174405594): void {.
      cdecl, importc: "duckdb_vector_ensure_validity_writable".}
else:
  static :
    hint("Declaration of " & "duckdbvectorensurevaliditywritable" &
        " already exists, not redeclaring")
when not declared(duckdbvectorassignstringelement):
  proc duckdbvectorassignstringelement*(vector: duckdbvector_1174405594;
                                        index: idxt_1174405467; str: cstring): void {.
      cdecl, importc: "duckdb_vector_assign_string_element".}
else:
  static :
    hint("Declaration of " & "duckdbvectorassignstringelement" &
        " already exists, not redeclaring")
when not declared(duckdbvectorassignstringelementlen):
  proc duckdbvectorassignstringelementlen*(vector: duckdbvector_1174405594;
      index: idxt_1174405467; str: cstring; strlen: idxt_1174405467): void {.
      cdecl, importc: "duckdb_vector_assign_string_element_len".}
else:
  static :
    hint("Declaration of " & "duckdbvectorassignstringelementlen" &
        " already exists, not redeclaring")
when not declared(duckdblistvectorgetchild):
  proc duckdblistvectorgetchild*(vector: duckdbvector_1174405594): duckdbvector_1174405594 {.
      cdecl, importc: "duckdb_list_vector_get_child".}
else:
  static :
    hint("Declaration of " & "duckdblistvectorgetchild" &
        " already exists, not redeclaring")
when not declared(duckdblistvectorgetsize):
  proc duckdblistvectorgetsize*(vector: duckdbvector_1174405594): idxt_1174405467 {.
      cdecl, importc: "duckdb_list_vector_get_size".}
else:
  static :
    hint("Declaration of " & "duckdblistvectorgetsize" &
        " already exists, not redeclaring")
when not declared(duckdblistvectorsetsize):
  proc duckdblistvectorsetsize*(vector: duckdbvector_1174405594; size: idxt_1174405467): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_list_vector_set_size".}
else:
  static :
    hint("Declaration of " & "duckdblistvectorsetsize" &
        " already exists, not redeclaring")
when not declared(duckdblistvectorreserve):
  proc duckdblistvectorreserve*(vector: duckdbvector_1174405594;
                                requiredcapacity: idxt_1174405467): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_list_vector_reserve".}
else:
  static :
    hint("Declaration of " & "duckdblistvectorreserve" &
        " already exists, not redeclaring")
when not declared(duckdbstructvectorgetchild):
  proc duckdbstructvectorgetchild*(vector: duckdbvector_1174405594; index: idxt_1174405467): duckdbvector_1174405594 {.
      cdecl, importc: "duckdb_struct_vector_get_child".}
else:
  static :
    hint("Declaration of " & "duckdbstructvectorgetchild" &
        " already exists, not redeclaring")
when not declared(duckdbvalidityrowisvalid):
  proc duckdbvalidityrowisvalid*(validity: ptr uint64; row: idxt_1174405467): bool {.
      cdecl, importc: "duckdb_validity_row_is_valid".}
else:
  static :
    hint("Declaration of " & "duckdbvalidityrowisvalid" &
        " already exists, not redeclaring")
when not declared(duckdbvaliditysetrowvalidity):
  proc duckdbvaliditysetrowvalidity*(validity: ptr uint64; row: idxt_1174405467;
                                     valid: bool): void {.cdecl,
      importc: "duckdb_validity_set_row_validity".}
else:
  static :
    hint("Declaration of " & "duckdbvaliditysetrowvalidity" &
        " already exists, not redeclaring")
when not declared(duckdbvaliditysetrowinvalid):
  proc duckdbvaliditysetrowinvalid*(validity: ptr uint64; row: idxt_1174405467): void {.
      cdecl, importc: "duckdb_validity_set_row_invalid".}
else:
  static :
    hint("Declaration of " & "duckdbvaliditysetrowinvalid" &
        " already exists, not redeclaring")
when not declared(duckdbvaliditysetrowvalid):
  proc duckdbvaliditysetrowvalid*(validity: ptr uint64; row: idxt_1174405467): void {.
      cdecl, importc: "duckdb_validity_set_row_valid".}
else:
  static :
    hint("Declaration of " & "duckdbvaliditysetrowvalid" &
        " already exists, not redeclaring")
when not declared(duckdbcreatetablefunction):
  proc duckdbcreatetablefunction*(): duckdbtablefunction_1174405608 {.cdecl,
      importc: "duckdb_create_table_function".}
else:
  static :
    hint("Declaration of " & "duckdbcreatetablefunction" &
        " already exists, not redeclaring")
when not declared(duckdbdestroytablefunction):
  proc duckdbdestroytablefunction*(tablefunction: ptr duckdbtablefunction_1174405608): void {.
      cdecl, importc: "duckdb_destroy_table_function".}
else:
  static :
    hint("Declaration of " & "duckdbdestroytablefunction" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetname):
  proc duckdbtablefunctionsetname*(tablefunction: duckdbtablefunction_1174405608;
                                   name: cstring): void {.cdecl,
      importc: "duckdb_table_function_set_name".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetname" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionaddparameter):
  proc duckdbtablefunctionaddparameter*(tablefunction: duckdbtablefunction_1174405608;
                                        typearg: duckdblogicaltype_1174405586): void {.
      cdecl, importc: "duckdb_table_function_add_parameter".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionaddparameter" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionaddnamedparameter):
  proc duckdbtablefunctionaddnamedparameter*(tablefunction: duckdbtablefunction_1174405608;
      name: cstring; typearg: duckdblogicaltype_1174405586): void {.cdecl,
      importc: "duckdb_table_function_add_named_parameter".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionaddnamedparameter" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetextrainfo):
  proc duckdbtablefunctionsetextrainfo*(tablefunction: duckdbtablefunction_1174405608;
                                        extrainfo: pointer;
                                        destroy: duckdbdeletecallbackt_1174405622): void {.
      cdecl, importc: "duckdb_table_function_set_extra_info".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetextrainfo" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetbind):
  proc duckdbtablefunctionsetbind*(tablefunction: duckdbtablefunction_1174405608;
                                   bindarg: duckdbtablefunctionbindt_1174405616): void {.
      cdecl, importc: "duckdb_table_function_set_bind".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetbind" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetinit):
  proc duckdbtablefunctionsetinit*(tablefunction: duckdbtablefunction_1174405608;
                                   init: duckdbtablefunctioninitt_1174405618): void {.
      cdecl, importc: "duckdb_table_function_set_init".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetinit" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetlocalinit):
  proc duckdbtablefunctionsetlocalinit*(tablefunction: duckdbtablefunction_1174405608;
                                        init: duckdbtablefunctioninitt_1174405618): void {.
      cdecl, importc: "duckdb_table_function_set_local_init".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetlocalinit" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetfunction):
  proc duckdbtablefunctionsetfunction*(tablefunction: duckdbtablefunction_1174405608;
                                       function: duckdbtablefunctiont_1174405620): void {.
      cdecl, importc: "duckdb_table_function_set_function".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetfunction" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsupportsprojectionpushdown):
  proc duckdbtablefunctionsupportsprojectionpushdown*(
      tablefunction: duckdbtablefunction_1174405608; pushdown: bool): void {.
      cdecl, importc: "duckdb_table_function_supports_projection_pushdown".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsupportsprojectionpushdown" &
        " already exists, not redeclaring")
when not declared(duckdbregistertablefunction):
  proc duckdbregistertablefunction*(con: duckdbconnection_1174405539;
                                    function: duckdbtablefunction_1174405608): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_register_table_function".}
else:
  static :
    hint("Declaration of " & "duckdbregistertablefunction" &
        " already exists, not redeclaring")
when not declared(duckdbbindgetextrainfo):
  proc duckdbbindgetextrainfo*(info: duckdbbindinfo_1174405610): pointer {.
      cdecl, importc: "duckdb_bind_get_extra_info".}
else:
  static :
    hint("Declaration of " & "duckdbbindgetextrainfo" &
        " already exists, not redeclaring")
when not declared(duckdbbindaddresultcolumn):
  proc duckdbbindaddresultcolumn*(info: duckdbbindinfo_1174405610;
                                  name: cstring; typearg: duckdblogicaltype_1174405586): void {.
      cdecl, importc: "duckdb_bind_add_result_column".}
else:
  static :
    hint("Declaration of " & "duckdbbindaddresultcolumn" &
        " already exists, not redeclaring")
when not declared(duckdbbindgetparametercount):
  proc duckdbbindgetparametercount*(info: duckdbbindinfo_1174405610): idxt_1174405467 {.
      cdecl, importc: "duckdb_bind_get_parameter_count".}
else:
  static :
    hint("Declaration of " & "duckdbbindgetparametercount" &
        " already exists, not redeclaring")
when not declared(duckdbbindgetparameter):
  proc duckdbbindgetparameter*(info: duckdbbindinfo_1174405610; index: idxt_1174405467): duckdbvalue_1174405598 {.
      cdecl, importc: "duckdb_bind_get_parameter".}
else:
  static :
    hint("Declaration of " & "duckdbbindgetparameter" &
        " already exists, not redeclaring")
when not declared(duckdbbindgetnamedparameter):
  proc duckdbbindgetnamedparameter*(info: duckdbbindinfo_1174405610;
                                    name: cstring): duckdbvalue_1174405598 {.
      cdecl, importc: "duckdb_bind_get_named_parameter".}
else:
  static :
    hint("Declaration of " & "duckdbbindgetnamedparameter" &
        " already exists, not redeclaring")
when not declared(duckdbbindsetbinddata):
  proc duckdbbindsetbinddata*(info: duckdbbindinfo_1174405610;
                              binddata: pointer; destroy: duckdbdeletecallbackt_1174405622): void {.
      cdecl, importc: "duckdb_bind_set_bind_data".}
else:
  static :
    hint("Declaration of " & "duckdbbindsetbinddata" &
        " already exists, not redeclaring")
when not declared(duckdbbindsetcardinality):
  proc duckdbbindsetcardinality*(info: duckdbbindinfo_1174405610;
                                 cardinality: idxt_1174405467; isexact: bool): void {.
      cdecl, importc: "duckdb_bind_set_cardinality".}
else:
  static :
    hint("Declaration of " & "duckdbbindsetcardinality" &
        " already exists, not redeclaring")
when not declared(duckdbbindseterror):
  proc duckdbbindseterror*(info: duckdbbindinfo_1174405610; error: cstring): void {.
      cdecl, importc: "duckdb_bind_set_error".}
else:
  static :
    hint("Declaration of " & "duckdbbindseterror" &
        " already exists, not redeclaring")
when not declared(duckdbinitgetextrainfo):
  proc duckdbinitgetextrainfo*(info: duckdbinitinfo_1174405612): pointer {.
      cdecl, importc: "duckdb_init_get_extra_info".}
else:
  static :
    hint("Declaration of " & "duckdbinitgetextrainfo" &
        " already exists, not redeclaring")
when not declared(duckdbinitgetbinddata):
  proc duckdbinitgetbinddata*(info: duckdbinitinfo_1174405612): pointer {.cdecl,
      importc: "duckdb_init_get_bind_data".}
else:
  static :
    hint("Declaration of " & "duckdbinitgetbinddata" &
        " already exists, not redeclaring")
when not declared(duckdbinitsetinitdata):
  proc duckdbinitsetinitdata*(info: duckdbinitinfo_1174405612;
                              initdata: pointer; destroy: duckdbdeletecallbackt_1174405622): void {.
      cdecl, importc: "duckdb_init_set_init_data".}
else:
  static :
    hint("Declaration of " & "duckdbinitsetinitdata" &
        " already exists, not redeclaring")
when not declared(duckdbinitgetcolumncount):
  proc duckdbinitgetcolumncount*(info: duckdbinitinfo_1174405612): idxt_1174405467 {.
      cdecl, importc: "duckdb_init_get_column_count".}
else:
  static :
    hint("Declaration of " & "duckdbinitgetcolumncount" &
        " already exists, not redeclaring")
when not declared(duckdbinitgetcolumnindex):
  proc duckdbinitgetcolumnindex*(info: duckdbinitinfo_1174405612;
                                 columnindex: idxt_1174405467): idxt_1174405467 {.
      cdecl, importc: "duckdb_init_get_column_index".}
else:
  static :
    hint("Declaration of " & "duckdbinitgetcolumnindex" &
        " already exists, not redeclaring")
when not declared(duckdbinitsetmaxthreads):
  proc duckdbinitsetmaxthreads*(info: duckdbinitinfo_1174405612;
                                maxthreads: idxt_1174405467): void {.cdecl,
      importc: "duckdb_init_set_max_threads".}
else:
  static :
    hint("Declaration of " & "duckdbinitsetmaxthreads" &
        " already exists, not redeclaring")
when not declared(duckdbinitseterror):
  proc duckdbinitseterror*(info: duckdbinitinfo_1174405612; error: cstring): void {.
      cdecl, importc: "duckdb_init_set_error".}
else:
  static :
    hint("Declaration of " & "duckdbinitseterror" &
        " already exists, not redeclaring")
when not declared(duckdbfunctiongetextrainfo):
  proc duckdbfunctiongetextrainfo*(info: duckdbfunctioninfo_1174405614): pointer {.
      cdecl, importc: "duckdb_function_get_extra_info".}
else:
  static :
    hint("Declaration of " & "duckdbfunctiongetextrainfo" &
        " already exists, not redeclaring")
when not declared(duckdbfunctiongetbinddata):
  proc duckdbfunctiongetbinddata*(info: duckdbfunctioninfo_1174405614): pointer {.
      cdecl, importc: "duckdb_function_get_bind_data".}
else:
  static :
    hint("Declaration of " & "duckdbfunctiongetbinddata" &
        " already exists, not redeclaring")
when not declared(duckdbfunctiongetinitdata):
  proc duckdbfunctiongetinitdata*(info: duckdbfunctioninfo_1174405614): pointer {.
      cdecl, importc: "duckdb_function_get_init_data".}
else:
  static :
    hint("Declaration of " & "duckdbfunctiongetinitdata" &
        " already exists, not redeclaring")
when not declared(duckdbfunctiongetlocalinitdata):
  proc duckdbfunctiongetlocalinitdata*(info: duckdbfunctioninfo_1174405614): pointer {.
      cdecl, importc: "duckdb_function_get_local_init_data".}
else:
  static :
    hint("Declaration of " & "duckdbfunctiongetlocalinitdata" &
        " already exists, not redeclaring")
when not declared(duckdbfunctionseterror):
  proc duckdbfunctionseterror*(info: duckdbfunctioninfo_1174405614;
                               error: cstring): void {.cdecl,
      importc: "duckdb_function_set_error".}
else:
  static :
    hint("Declaration of " & "duckdbfunctionseterror" &
        " already exists, not redeclaring")
when not declared(duckdbaddreplacementscan):
  proc duckdbaddreplacementscan*(db: duckdbdatabase_1174405535;
                                 replacement: duckdbreplacementcallbackt_1174405626;
                                 extradata: pointer;
                                 deletecallback: duckdbdeletecallbackt_1174405622): void {.
      cdecl, importc: "duckdb_add_replacement_scan".}
else:
  static :
    hint("Declaration of " & "duckdbaddreplacementscan" &
        " already exists, not redeclaring")
when not declared(duckdbreplacementscansetfunctionname):
  proc duckdbreplacementscansetfunctionname*(info: duckdbreplacementscaninfo_1174405624;
      functionname: cstring): void {.cdecl, importc: "duckdb_replacement_scan_set_function_name".}
else:
  static :
    hint("Declaration of " & "duckdbreplacementscansetfunctionname" &
        " already exists, not redeclaring")
when not declared(duckdbreplacementscanaddparameter):
  proc duckdbreplacementscanaddparameter*(info: duckdbreplacementscaninfo_1174405624;
      parameter: duckdbvalue_1174405598): void {.cdecl,
      importc: "duckdb_replacement_scan_add_parameter".}
else:
  static :
    hint("Declaration of " & "duckdbreplacementscanaddparameter" &
        " already exists, not redeclaring")
when not declared(duckdbreplacementscanseterror):
  proc duckdbreplacementscanseterror*(info: duckdbreplacementscaninfo_1174405624;
                                      error: cstring): void {.cdecl,
      importc: "duckdb_replacement_scan_set_error".}
else:
  static :
    hint("Declaration of " & "duckdbreplacementscanseterror" &
        " already exists, not redeclaring")
when not declared(duckdbappendercreate):
  proc duckdbappendercreate*(connection: duckdbconnection_1174405539;
                             schema: cstring; table: cstring;
                             outappender: ptr duckdbappender_1174405562): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_appender_create".}
else:
  static :
    hint("Declaration of " & "duckdbappendercreate" &
        " already exists, not redeclaring")
when not declared(duckdbappendererror):
  proc duckdbappendererror*(appender: duckdbappender_1174405562): cstring {.
      cdecl, importc: "duckdb_appender_error".}
else:
  static :
    hint("Declaration of " & "duckdbappendererror" &
        " already exists, not redeclaring")
when not declared(duckdbappenderflush):
  proc duckdbappenderflush*(appender: duckdbappender_1174405562): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_appender_flush".}
else:
  static :
    hint("Declaration of " & "duckdbappenderflush" &
        " already exists, not redeclaring")
when not declared(duckdbappenderclose):
  proc duckdbappenderclose*(appender: duckdbappender_1174405562): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_appender_close".}
else:
  static :
    hint("Declaration of " & "duckdbappenderclose" &
        " already exists, not redeclaring")
when not declared(duckdbappenderdestroy):
  proc duckdbappenderdestroy*(appender: ptr duckdbappender_1174405562): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_appender_destroy".}
else:
  static :
    hint("Declaration of " & "duckdbappenderdestroy" &
        " already exists, not redeclaring")
when not declared(duckdbappenderbeginrow):
  proc duckdbappenderbeginrow*(appender: duckdbappender_1174405562): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_appender_begin_row".}
else:
  static :
    hint("Declaration of " & "duckdbappenderbeginrow" &
        " already exists, not redeclaring")
when not declared(duckdbappenderendrow):
  proc duckdbappenderendrow*(appender: duckdbappender_1174405562): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_appender_end_row".}
else:
  static :
    hint("Declaration of " & "duckdbappenderendrow" &
        " already exists, not redeclaring")
when not declared(duckdbappendbool):
  proc duckdbappendbool*(appender: duckdbappender_1174405562; value: bool): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_bool".}
else:
  static :
    hint("Declaration of " & "duckdbappendbool" &
        " already exists, not redeclaring")
when not declared(duckdbappendint8):
  proc duckdbappendint8*(appender: duckdbappender_1174405562; value: int8): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_int8".}
else:
  static :
    hint("Declaration of " & "duckdbappendint8" &
        " already exists, not redeclaring")
when not declared(duckdbappendint16):
  proc duckdbappendint16*(appender: duckdbappender_1174405562; value: int16): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_int16".}
else:
  static :
    hint("Declaration of " & "duckdbappendint16" &
        " already exists, not redeclaring")
when not declared(duckdbappendint32):
  proc duckdbappendint32*(appender: duckdbappender_1174405562; value: int32): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_int32".}
else:
  static :
    hint("Declaration of " & "duckdbappendint32" &
        " already exists, not redeclaring")
when not declared(duckdbappendint64):
  proc duckdbappendint64*(appender: duckdbappender_1174405562; value: int64): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_int64".}
else:
  static :
    hint("Declaration of " & "duckdbappendint64" &
        " already exists, not redeclaring")
when not declared(duckdbappendhugeint):
  proc duckdbappendhugeint*(appender: duckdbappender_1174405562;
                            value: duckdbhugeint_1174405503): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_hugeint".}
else:
  static :
    hint("Declaration of " & "duckdbappendhugeint" &
        " already exists, not redeclaring")
when not declared(duckdbappenduint8):
  proc duckdbappenduint8*(appender: duckdbappender_1174405562; value: uint8): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_uint8".}
else:
  static :
    hint("Declaration of " & "duckdbappenduint8" &
        " already exists, not redeclaring")
when not declared(duckdbappenduint16):
  proc duckdbappenduint16*(appender: duckdbappender_1174405562; value: uint16): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_uint16".}
else:
  static :
    hint("Declaration of " & "duckdbappenduint16" &
        " already exists, not redeclaring")
when not declared(duckdbappenduint32):
  proc duckdbappenduint32*(appender: duckdbappender_1174405562; value: uint32): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_uint32".}
else:
  static :
    hint("Declaration of " & "duckdbappenduint32" &
        " already exists, not redeclaring")
when not declared(duckdbappenduint64):
  proc duckdbappenduint64*(appender: duckdbappender_1174405562; value: uint64): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_uint64".}
else:
  static :
    hint("Declaration of " & "duckdbappenduint64" &
        " already exists, not redeclaring")
when not declared(duckdbappendfloat):
  proc duckdbappendfloat*(appender: duckdbappender_1174405562; value: cfloat): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_float".}
else:
  static :
    hint("Declaration of " & "duckdbappendfloat" &
        " already exists, not redeclaring")
when not declared(duckdbappenddouble):
  proc duckdbappenddouble*(appender: duckdbappender_1174405562; value: cdouble): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_double".}
else:
  static :
    hint("Declaration of " & "duckdbappenddouble" &
        " already exists, not redeclaring")
when not declared(duckdbappenddate):
  proc duckdbappenddate*(appender: duckdbappender_1174405562; value: duckdbdate_1174405475): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_date".}
else:
  static :
    hint("Declaration of " & "duckdbappenddate" &
        " already exists, not redeclaring")
when not declared(duckdbappendtime):
  proc duckdbappendtime*(appender: duckdbappender_1174405562; value: duckdbtime_1174405483): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_time".}
else:
  static :
    hint("Declaration of " & "duckdbappendtime" &
        " already exists, not redeclaring")
when not declared(duckdbappendtimestamp):
  proc duckdbappendtimestamp*(appender: duckdbappender_1174405562;
                              value: duckdbtimestamp_1174405491): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbappendtimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbappendinterval):
  proc duckdbappendinterval*(appender: duckdbappender_1174405562;
                             value: duckdbinterval_1174405499): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_interval".}
else:
  static :
    hint("Declaration of " & "duckdbappendinterval" &
        " already exists, not redeclaring")
when not declared(duckdbappendvarchar):
  proc duckdbappendvarchar*(appender: duckdbappender_1174405562; val: cstring): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_varchar".}
else:
  static :
    hint("Declaration of " & "duckdbappendvarchar" &
        " already exists, not redeclaring")
when not declared(duckdbappendvarcharlength):
  proc duckdbappendvarcharlength*(appender: duckdbappender_1174405562;
                                  val: cstring; length: idxt_1174405467): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_varchar_length".}
else:
  static :
    hint("Declaration of " & "duckdbappendvarcharlength" &
        " already exists, not redeclaring")
when not declared(duckdbappendblob):
  proc duckdbappendblob*(appender: duckdbappender_1174405562; data: pointer;
                         length: idxt_1174405467): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_blob".}
else:
  static :
    hint("Declaration of " & "duckdbappendblob" &
        " already exists, not redeclaring")
when not declared(duckdbappendnull):
  proc duckdbappendnull*(appender: duckdbappender_1174405562): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_null".}
else:
  static :
    hint("Declaration of " & "duckdbappendnull" &
        " already exists, not redeclaring")
when not declared(duckdbappenddatachunk):
  proc duckdbappenddatachunk*(appender: duckdbappender_1174405562;
                              chunk: duckdbdatachunk_1174405590): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_append_data_chunk".}
else:
  static :
    hint("Declaration of " & "duckdbappenddatachunk" &
        " already exists, not redeclaring")
when not declared(duckdbqueryarrow):
  proc duckdbqueryarrow*(connection: duckdbconnection_1174405539;
                         query: cstring; outresult: ptr duckdbarrow_1174405566): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_query_arrow".}
else:
  static :
    hint("Declaration of " & "duckdbqueryarrow" &
        " already exists, not redeclaring")
when not declared(duckdbqueryarrowschema):
  proc duckdbqueryarrowschema*(result: duckdbarrow_1174405566;
                               outschema: ptr duckdbarrowschema_1174405578): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_query_arrow_schema".}
else:
  static :
    hint("Declaration of " & "duckdbqueryarrowschema" &
        " already exists, not redeclaring")
when not declared(duckdbpreparedarrowschema):
  proc duckdbpreparedarrowschema*(prepared: duckdbpreparedstatement_1174405543;
                                  outschema: ptr duckdbarrowschema_1174405578): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_prepared_arrow_schema".}
else:
  static :
    hint("Declaration of " & "duckdbpreparedarrowschema" &
        " already exists, not redeclaring")
when not declared(duckdbqueryarrowarray):
  proc duckdbqueryarrowarray*(result: duckdbarrow_1174405566;
                              outarray: ptr duckdbarrowarray_1174405582): duckdbstate_1174405602 {.
      cdecl, importc: "duckdb_query_arrow_array".}
else:
  static :
    hint("Declaration of " & "duckdbqueryarrowarray" &
        " already exists, not redeclaring")
when not declared(duckdbarrowcolumncount):
  proc duckdbarrowcolumncount*(result: duckdbarrow_1174405566): idxt_1174405467 {.
      cdecl, importc: "duckdb_arrow_column_count".}
else:
  static :
    hint("Declaration of " & "duckdbarrowcolumncount" &
        " already exists, not redeclaring")
when not declared(duckdbarrowrowcount):
  proc duckdbarrowrowcount*(result: duckdbarrow_1174405566): idxt_1174405467 {.
      cdecl, importc: "duckdb_arrow_row_count".}
else:
  static :
    hint("Declaration of " & "duckdbarrowrowcount" &
        " already exists, not redeclaring")
when not declared(duckdbarrowrowschanged):
  proc duckdbarrowrowschanged*(result: duckdbarrow_1174405566): idxt_1174405467 {.
      cdecl, importc: "duckdb_arrow_rows_changed".}
else:
  static :
    hint("Declaration of " & "duckdbarrowrowschanged" &
        " already exists, not redeclaring")
when not declared(duckdbqueryarrowerror):
  proc duckdbqueryarrowerror*(result: duckdbarrow_1174405566): cstring {.cdecl,
      importc: "duckdb_query_arrow_error".}
else:
  static :
    hint("Declaration of " & "duckdbqueryarrowerror" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyarrow):
  proc duckdbdestroyarrow*(result: ptr duckdbarrow_1174405566): void {.cdecl,
      importc: "duckdb_destroy_arrow".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyarrow" &
        " already exists, not redeclaring")
when not declared(duckdbexecutetasks):
  proc duckdbexecutetasks*(database: duckdbdatabase_1174405535; maxtasks: idxt_1174405467): void {.
      cdecl, importc: "duckdb_execute_tasks".}
else:
  static :
    hint("Declaration of " & "duckdbexecutetasks" &
        " already exists, not redeclaring")
when not declared(duckdbcreatetaskstate):
  proc duckdbcreatetaskstate*(database: duckdbdatabase_1174405535): duckdbtaskstate_1174405628 {.
      cdecl, importc: "duckdb_create_task_state".}
else:
  static :
    hint("Declaration of " & "duckdbcreatetaskstate" &
        " already exists, not redeclaring")
when not declared(duckdbexecutetasksstate):
  proc duckdbexecutetasksstate*(state: duckdbtaskstate_1174405628): void {.
      cdecl, importc: "duckdb_execute_tasks_state".}
else:
  static :
    hint("Declaration of " & "duckdbexecutetasksstate" &
        " already exists, not redeclaring")
when not declared(duckdbexecutentasksstate):
  proc duckdbexecutentasksstate*(state: duckdbtaskstate_1174405628;
                                 maxtasks: idxt_1174405467): idxt_1174405467 {.
      cdecl, importc: "duckdb_execute_n_tasks_state".}
else:
  static :
    hint("Declaration of " & "duckdbexecutentasksstate" &
        " already exists, not redeclaring")
when not declared(duckdbfinishexecution):
  proc duckdbfinishexecution*(state: duckdbtaskstate_1174405628): void {.cdecl,
      importc: "duckdb_finish_execution".}
else:
  static :
    hint("Declaration of " & "duckdbfinishexecution" &
        " already exists, not redeclaring")
when not declared(duckdbtaskstateisfinished):
  proc duckdbtaskstateisfinished*(state: duckdbtaskstate_1174405628): bool {.
      cdecl, importc: "duckdb_task_state_is_finished".}
else:
  static :
    hint("Declaration of " & "duckdbtaskstateisfinished" &
        " already exists, not redeclaring")
when not declared(duckdbdestroytaskstate):
  proc duckdbdestroytaskstate*(state: duckdbtaskstate_1174405628): void {.cdecl,
      importc: "duckdb_destroy_task_state".}
else:
  static :
    hint("Declaration of " & "duckdbdestroytaskstate" &
        " already exists, not redeclaring")
when not declared(duckdbexecutionisfinished):
  proc duckdbexecutionisfinished*(con: duckdbconnection_1174405539): bool {.
      cdecl, importc: "duckdb_execution_is_finished".}
else:
  static :
    hint("Declaration of " & "duckdbexecutionisfinished" &
        " already exists, not redeclaring")
when not declared(duckdbstreamfetchchunk):
  proc duckdbstreamfetchchunk*(result: duckdbresult_1174405531): duckdbdatachunk_1174405590 {.
      cdecl, importc: "duckdb_stream_fetch_chunk".}
else:
  static :
    hint("Declaration of " & "duckdbstreamfetchchunk" &
        " already exists, not redeclaring")