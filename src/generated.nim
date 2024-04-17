
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
      Duckdbtypebit = 29, Duckdbtypetimetz = 30, Duckdbtypetimestamptz = 31,
      Duckdbtypeuhugeint = 32, Duckdbtypearray = 33
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
when not declared(enumduckdbresulttype):
  type
    enumduckdbresulttype* {.size: sizeof(cuint).} = enum
      Duckdbresulttypeinvalid = 0, Duckdbresulttypechangedrows = 1,
      Duckdbresulttypenothing = 2, Duckdbresulttypequeryresult = 3
else:
  static :
    hint("Declaration of " & "enumduckdbresulttype" &
        " already exists, not redeclaring")
when not declared(enumduckdbstatementtype):
  type
    enumduckdbstatementtype* {.size: sizeof(cuint).} = enum
      Duckdbstatementtypeinvalid = 0, Duckdbstatementtypeselect = 1,
      Duckdbstatementtypeinsert = 2, Duckdbstatementtypeupdate = 3,
      Duckdbstatementtypeexplain = 4, Duckdbstatementtypedelete = 5,
      Duckdbstatementtypeprepare = 6, Duckdbstatementtypecreate = 7,
      Duckdbstatementtypeexecute = 8, Duckdbstatementtypealter = 9,
      Duckdbstatementtypetransaction = 10, Duckdbstatementtypecopy = 11,
      Duckdbstatementtypeanalyze = 12, Duckdbstatementtypevariableset = 13,
      Duckdbstatementtypecreatefunc = 14, Duckdbstatementtypedrop = 15,
      Duckdbstatementtypeexport = 16, Duckdbstatementtypepragma = 17,
      Duckdbstatementtypevacuum = 18, Duckdbstatementtypecall = 19,
      Duckdbstatementtypeset = 20, Duckdbstatementtypeload = 21,
      Duckdbstatementtyperelation = 22, Duckdbstatementtypeextension = 23,
      Duckdbstatementtypelogicalplan = 24, Duckdbstatementtypeattach = 25,
      Duckdbstatementtypedetach = 26, Duckdbstatementtypemulti = 27
else:
  static :
    hint("Declaration of " & "enumduckdbstatementtype" &
        " already exists, not redeclaring")
type
  duckdbtype_1711276387 = enumduckdbtype_1711276386 ## Generated based on /usr/include/duckdb.h:138:3
  duckdbstate_1711276391 = enumduckdbstate_1711276390 ## Generated based on /usr/include/duckdb.h:140:53
  duckdbpendingstate_1711276395 = enumduckdbpendingstate_1711276394 ## Generated based on /usr/include/duckdb.h:147:3
  duckdbresulttype_1711276399 = enumduckdbresulttype_1711276398 ## Generated based on /usr/include/duckdb.h:154:3
  duckdbstatementtype_1711276403 = enumduckdbstatementtype_1711276402 ## Generated based on /usr/include/duckdb.h:185:3
  idxt_1711276405 = uint64   ## Generated based on /usr/include/duckdb.h:192:18
  duckdbdeletecallbackt_1711276407 = proc (a0: pointer): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:196:16
  duckdbtaskstate_1711276409 = pointer ## Generated based on /usr/include/duckdb.h:199:15
  structduckdbdate_1711276411 {.pure, inheritable, bycopy.} = object
    days*: int32             ## Generated based on /usr/include/duckdb.h:207:9
  duckdbdate_1711276413 = structduckdbdate_1711276412 ## Generated based on /usr/include/duckdb.h:209:3
  structduckdbdatestruct_1711276415 {.pure, inheritable, bycopy.} = object
    year*: int32             ## Generated based on /usr/include/duckdb.h:210:9
    month*: int8
    day*: int8
  duckdbdatestruct_1711276417 = structduckdbdatestruct_1711276416 ## Generated based on /usr/include/duckdb.h:214:3
  structduckdbtime_1711276419 {.pure, inheritable, bycopy.} = object
    micros*: int64           ## Generated based on /usr/include/duckdb.h:218:9
  duckdbtime_1711276421 = structduckdbtime_1711276420 ## Generated based on /usr/include/duckdb.h:220:3
  structduckdbtimestruct_1711276423 {.pure, inheritable, bycopy.} = object
    hour*: int8              ## Generated based on /usr/include/duckdb.h:221:9
    min*: int8
    sec*: int8
    micros*: int32
  duckdbtimestruct_1711276425 = structduckdbtimestruct_1711276424 ## Generated based on /usr/include/duckdb.h:226:3
  structduckdbtimetz_1711276427 {.pure, inheritable, bycopy.} = object
    bits*: uint64            ## Generated based on /usr/include/duckdb.h:229:9
  duckdbtimetz_1711276429 = structduckdbtimetz_1711276428 ## Generated based on /usr/include/duckdb.h:231:3
  structduckdbtimetzstruct_1711276431 {.pure, inheritable, bycopy.} = object
    time*: duckdbtimestruct_1711276426 ## Generated based on /usr/include/duckdb.h:232:9
    offset*: int32
  duckdbtimetzstruct_1711276433 = structduckdbtimetzstruct_1711276432 ## Generated based on /usr/include/duckdb.h:235:3
  structduckdbtimestamp_1711276435 {.pure, inheritable, bycopy.} = object
    micros*: int64           ## Generated based on /usr/include/duckdb.h:239:9
  duckdbtimestamp_1711276437 = structduckdbtimestamp_1711276436 ## Generated based on /usr/include/duckdb.h:241:3
  structduckdbtimestampstruct_1711276439 {.pure, inheritable, bycopy.} = object
    date*: duckdbdatestruct_1711276418 ## Generated based on /usr/include/duckdb.h:242:9
    time*: duckdbtimestruct_1711276426
  duckdbtimestampstruct_1711276441 = structduckdbtimestampstruct_1711276440 ## Generated based on /usr/include/duckdb.h:245:3
  structduckdbinterval_1711276443 {.pure, inheritable, bycopy.} = object
    months*: int32           ## Generated based on /usr/include/duckdb.h:246:9
    days*: int32
    micros*: int64
  duckdbinterval_1711276445 = structduckdbinterval_1711276444 ## Generated based on /usr/include/duckdb.h:250:3
  structduckdbhugeint_1711276447 {.pure, inheritable, bycopy.} = object
    lower*: uint64           ## Generated based on /usr/include/duckdb.h:255:9
    upper*: int64
  duckdbhugeint_1711276449 = structduckdbhugeint_1711276448 ## Generated based on /usr/include/duckdb.h:258:3
  structduckdbuhugeint_1711276451 {.pure, inheritable, bycopy.} = object
    lower*: uint64           ## Generated based on /usr/include/duckdb.h:259:9
    upper*: uint64
  duckdbuhugeint_1711276453 = structduckdbuhugeint_1711276452 ## Generated based on /usr/include/duckdb.h:262:3
  structduckdbdecimal_1711276455 {.pure, inheritable, bycopy.} = object
    width*: uint8            ## Generated based on /usr/include/duckdb.h:265:9
    scale*: uint8
    value*: duckdbhugeint_1711276450
  duckdbdecimal_1711276457 = structduckdbdecimal_1711276456 ## Generated based on /usr/include/duckdb.h:269:3
  structduckdbqueryprogresstype_1711276459 {.pure, inheritable, bycopy.} = object
    percentage*: cdouble     ## Generated based on /usr/include/duckdb.h:272:9
    rowsprocessed*: uint64
    totalrowstoprocess*: uint64
  duckdbqueryprogresstype_1711276461 = structduckdbqueryprogresstype_1711276460 ## Generated based on /usr/include/duckdb.h:276:3
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
  structduckdbstringt_1711276463 {.pure, inheritable, bycopy.} = object
    value*: structduckdbstringt_value_t ## Generated based on /usr/include/duckdb.h:282:9
  duckdbstringt_1711276465 = structduckdbstringt_1711276464 ## Generated based on /usr/include/duckdb.h:294:3
  structduckdblistentry_1711276467 {.pure, inheritable, bycopy.} = object
    offset*: uint64          ## Generated based on /usr/include/duckdb.h:299:9
    length*: uint64
  duckdblistentry_1711276469 = structduckdblistentry_1711276468 ## Generated based on /usr/include/duckdb.h:302:3
  structduckdbcolumn_1711276471 {.pure, inheritable, bycopy.} = object
    compilerdeprecateddata*: pointer ## Generated based on /usr/include/duckdb.h:308:9
    compilerdeprecatednullmask*: ptr bool
    compilerdeprecatedtype*: duckdbtype_1711276388
    compilerdeprecatedname*: cstring
    internaldata*: pointer
  duckdbcolumn_1711276480 = structduckdbcolumn_1711276479 ## Generated based on /usr/include/duckdb.h:325:3
  structduckdbvector_1711276482 {.pure, inheritable, bycopy.} = object
    compilervctr*: pointer   ## Generated based on /usr/include/duckdb.h:329:16
  duckdbvector_1711276484 = ptr structduckdbvector_1711276483 ## Generated based on /usr/include/duckdb.h:331:5
  structduckdbstring_1711276486 {.pure, inheritable, bycopy.} = object
    data*: cstring           ## Generated based on /usr/include/duckdb.h:339:9
    size*: idxt_1711276406
  duckdbstring_1711276488 = structduckdbstring_1711276487 ## Generated based on /usr/include/duckdb.h:342:3
  structduckdbblob_1711276490 {.pure, inheritable, bycopy.} = object
    data*: pointer           ## Generated based on /usr/include/duckdb.h:346:9
    size*: idxt_1711276406
  duckdbblob_1711276492 = structduckdbblob_1711276491 ## Generated based on /usr/include/duckdb.h:349:3
  structduckdbresult_1711276494 {.pure, inheritable, bycopy.} = object
    compilerdeprecatedcolumncount*: idxt_1711276406 ## Generated based on /usr/include/duckdb.h:353:9
    compilerdeprecatedrowcount*: idxt_1711276406
    compilerdeprecatedrowschanged*: idxt_1711276406
    compilerdeprecatedcolumns*: ptr duckdbcolumn_1711276481
    compilerdeprecatederrormessage*: cstring
    internaldata*: pointer
  duckdbresult_1711276496 = structduckdbresult_1711276495 ## Generated based on /usr/include/duckdb.h:373:3
  structduckdbdatabase_1711276498 {.pure, inheritable, bycopy.} = object
    compilerdb*: pointer     ## Generated based on /usr/include/duckdb.h:376:16
  duckdbdatabase_1711276500 = ptr structduckdbdatabase_1711276499 ## Generated based on /usr/include/duckdb.h:378:5
  structduckdbconnection_1711276502 {.pure, inheritable, bycopy.} = object
    compilerconn*: pointer   ## Generated based on /usr/include/duckdb.h:381:16
  duckdbconnection_1711276504 = ptr structduckdbconnection_1711276503 ## Generated based on /usr/include/duckdb.h:383:5
  structduckdbpreparedstatement_1711276506 {.pure, inheritable, bycopy.} = object
    compilerprep*: pointer   ## Generated based on /usr/include/duckdb.h:387:16
  duckdbpreparedstatement_1711276508 = ptr structduckdbpreparedstatement_1711276507 ## Generated based on /usr/include/duckdb.h:389:5
  structduckdbextractedstatements_1711276510 {.pure, inheritable, bycopy.} = object
    compilerextrac*: pointer ## Generated based on /usr/include/duckdb.h:392:16
  duckdbextractedstatements_1711276512 = ptr structduckdbextractedstatements_1711276511 ## Generated based on /usr/include/duckdb.h:394:5
  structduckdbpendingresult_1711276514 {.pure, inheritable, bycopy.} = object
    compilerpend*: pointer   ## Generated based on /usr/include/duckdb.h:398:16
  duckdbpendingresult_1711276516 = ptr structduckdbpendingresult_1711276515 ## Generated based on /usr/include/duckdb.h:400:5
  structduckdbappender_1711276518 {.pure, inheritable, bycopy.} = object
    compilerappn*: pointer   ## Generated based on /usr/include/duckdb.h:404:16
  duckdbappender_1711276520 = ptr structduckdbappender_1711276519 ## Generated based on /usr/include/duckdb.h:406:5
  structduckdbconfig_1711276522 {.pure, inheritable, bycopy.} = object
    compilercnfg*: pointer   ## Generated based on /usr/include/duckdb.h:410:16
  duckdbconfig_1711276524 = ptr structduckdbconfig_1711276523 ## Generated based on /usr/include/duckdb.h:412:5
  structduckdblogicaltype_1711276526 {.pure, inheritable, bycopy.} = object
    compilerlglt*: pointer   ## Generated based on /usr/include/duckdb.h:416:16
  duckdblogicaltype_1711276528 = ptr structduckdblogicaltype_1711276527 ## Generated based on /usr/include/duckdb.h:418:5
  structduckdbdatachunk_1711276530 {.pure, inheritable, bycopy.} = object
    compilerdtck*: pointer   ## Generated based on /usr/include/duckdb.h:422:16
  duckdbdatachunk_1711276532 = ptr structduckdbdatachunk_1711276531 ## Generated based on /usr/include/duckdb.h:424:5
  structduckdbvalue_1711276534 {.pure, inheritable, bycopy.} = object
    compilerval*: pointer    ## Generated based on /usr/include/duckdb.h:428:16
  duckdbvalue_1711276536 = ptr structduckdbvalue_1711276535 ## Generated based on /usr/include/duckdb.h:430:5
  duckdbtablefunction_1711276538 = pointer ## Generated based on /usr/include/duckdb.h:437:15
  duckdbbindinfo_1711276540 = pointer ## Generated based on /usr/include/duckdb.h:440:15
  duckdbinitinfo_1711276542 = pointer ## Generated based on /usr/include/duckdb.h:443:15
  duckdbfunctioninfo_1711276544 = pointer ## Generated based on /usr/include/duckdb.h:446:15
  duckdbtablefunctionbindt_1711276546 = proc (a0: duckdbbindinfo_1711276541): void {.
      cdecl.}                ## Generated based on /usr/include/duckdb.h:449:16
  duckdbtablefunctioninitt_1711276548 = proc (a0: duckdbinitinfo_1711276543): void {.
      cdecl.}                ## Generated based on /usr/include/duckdb.h:452:16
  duckdbtablefunctiont_1711276550 = proc (a0: duckdbfunctioninfo_1711276545;
      a1: duckdbdatachunk_1711276533): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:455:16
  duckdbreplacementscaninfo_1711276552 = pointer ## Generated based on /usr/include/duckdb.h:462:15
  duckdbreplacementcallbackt_1711276554 = proc (a0: duckdbreplacementscaninfo_1711276553;
      a1: cstring; a2: pointer): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:465:16
  structduckdbarrow_1711276556 {.pure, inheritable, bycopy.} = object
    compilerarrw*: pointer   ## Generated based on /usr/include/duckdb.h:472:16
  duckdbarrow_1711276558 = ptr structduckdbarrow_1711276557 ## Generated based on /usr/include/duckdb.h:474:5
  structduckdbarrowstream_1711276560 {.pure, inheritable, bycopy.} = object
    compilerarrwstr*: pointer ## Generated based on /usr/include/duckdb.h:477:16
  duckdbarrowstream_1711276562 = ptr structduckdbarrowstream_1711276561 ## Generated based on /usr/include/duckdb.h:479:5
  structduckdbarrowschema_1711276564 {.pure, inheritable, bycopy.} = object
    compilerarrs*: pointer   ## Generated based on /usr/include/duckdb.h:482:16
  duckdbarrowschema_1711276566 = ptr structduckdbarrowschema_1711276565 ## Generated based on /usr/include/duckdb.h:484:5
  structduckdbarrowarray_1711276568 {.pure, inheritable, bycopy.} = object
    compilerarra*: pointer   ## Generated based on /usr/include/duckdb.h:487:16
  duckdbarrowarray_1711276570 = ptr structduckdbarrowarray_1711276569 ## Generated based on /usr/include/duckdb.h:489:5
  duckdbtimestruct_1711276426 = (when declared(duckdbtimestruct):
    duckdbtimestruct
   else:
    duckdbtimestruct_1711276425)
  structduckdbpreparedstatement_1711276507 = (when declared(
      structduckdbpreparedstatement):
    structduckdbpreparedstatement
   else:
    structduckdbpreparedstatement_1711276506)
  duckdbbindinfo_1711276541 = (when declared(duckdbbindinfo):
    duckdbbindinfo
   else:
    duckdbbindinfo_1711276540)
  structduckdbcolumn_1711276479 = (when declared(structduckdbcolumn):
    structduckdbcolumn
   else:
    structduckdbcolumn_1711276471)
  duckdbtablefunctiont_1711276551 = (when declared(duckdbtablefunctiont):
    duckdbtablefunctiont
   else:
    duckdbtablefunctiont_1711276550)
  duckdblogicaltype_1711276529 = (when declared(duckdblogicaltype):
    duckdblogicaltype
   else:
    duckdblogicaltype_1711276528)
  duckdbstatementtype_1711276404 = (when declared(duckdbstatementtype):
    duckdbstatementtype
   else:
    duckdbstatementtype_1711276403)
  structduckdbdatachunk_1711276531 = (when declared(structduckdbdatachunk):
    structduckdbdatachunk
   else:
    structduckdbdatachunk_1711276530)
  duckdbstring_1711276489 = (when declared(duckdbstring):
    duckdbstring
   else:
    duckdbstring_1711276488)
  structduckdbinterval_1711276444 = (when declared(structduckdbinterval):
    structduckdbinterval
   else:
    structduckdbinterval_1711276443)
  enumduckdbstate_1711276390 = (when declared(enumduckdbstate):
    enumduckdbstate
   else:
    enumduckdbstate_1711276389)
  duckdbstringt_1711276466 = (when declared(duckdbstringt):
    duckdbstringt
   else:
    duckdbstringt_1711276465)
  duckdbconnection_1711276505 = (when declared(duckdbconnection):
    duckdbconnection
   else:
    duckdbconnection_1711276504)
  structduckdbdecimal_1711276456 = (when declared(structduckdbdecimal):
    structduckdbdecimal
   else:
    structduckdbdecimal_1711276455)
  structduckdbtimestruct_1711276424 = (when declared(structduckdbtimestruct):
    structduckdbtimestruct
   else:
    structduckdbtimestruct_1711276423)
  structduckdbtimetzstruct_1711276432 = (when declared(structduckdbtimetzstruct):
    structduckdbtimetzstruct
   else:
    structduckdbtimetzstruct_1711276431)
  duckdbhugeint_1711276450 = (when declared(duckdbhugeint):
    duckdbhugeint
   else:
    duckdbhugeint_1711276449)
  structduckdbresult_1711276495 = (when declared(structduckdbresult):
    structduckdbresult
   else:
    structduckdbresult_1711276494)
  duckdbpendingresult_1711276517 = (when declared(duckdbpendingresult):
    duckdbpendingresult
   else:
    duckdbpendingresult_1711276516)
  duckdbblob_1711276493 = (when declared(duckdbblob):
    duckdbblob
   else:
    duckdbblob_1711276492)
  duckdbdecimal_1711276458 = (when declared(duckdbdecimal):
    duckdbdecimal
   else:
    duckdbdecimal_1711276457)
  duckdbdatabase_1711276501 = (when declared(duckdbdatabase):
    duckdbdatabase
   else:
    duckdbdatabase_1711276500)
  structduckdbqueryprogresstype_1711276460 = (when declared(
      structduckdbqueryprogresstype):
    structduckdbqueryprogresstype
   else:
    structduckdbqueryprogresstype_1711276459)
  duckdblistentry_1711276470 = (when declared(duckdblistentry):
    duckdblistentry
   else:
    duckdblistentry_1711276469)
  enumduckdbpendingstate_1711276394 = (when declared(enumduckdbpendingstate):
    enumduckdbpendingstate
   else:
    enumduckdbpendingstate_1711276393)
  idxt_1711276406 = (when declared(idxt):
    idxt
   else:
    idxt_1711276405)
  structduckdbhugeint_1711276448 = (when declared(structduckdbhugeint):
    structduckdbhugeint
   else:
    structduckdbhugeint_1711276447)
  structduckdbconnection_1711276503 = (when declared(structduckdbconnection):
    structduckdbconnection
   else:
    structduckdbconnection_1711276502)
  duckdbinterval_1711276446 = (when declared(duckdbinterval):
    duckdbinterval
   else:
    duckdbinterval_1711276445)
  enumduckdbstatementtype_1711276402 = (when declared(enumduckdbstatementtype):
    enumduckdbstatementtype
   else:
    enumduckdbstatementtype_1711276401)
  duckdbfunctioninfo_1711276545 = (when declared(duckdbfunctioninfo):
    duckdbfunctioninfo
   else:
    duckdbfunctioninfo_1711276544)
  duckdbresult_1711276497 = (when declared(duckdbresult):
    duckdbresult
   else:
    duckdbresult_1711276496)
  structduckdbstring_1711276487 = (when declared(structduckdbstring):
    structduckdbstring
   else:
    structduckdbstring_1711276486)
  duckdbcolumn_1711276481 = (when declared(duckdbcolumn):
    duckdbcolumn
   else:
    duckdbcolumn_1711276480)
  duckdbdatachunk_1711276533 = (when declared(duckdbdatachunk):
    duckdbdatachunk
   else:
    duckdbdatachunk_1711276532)
  duckdbtablefunction_1711276539 = (when declared(duckdbtablefunction):
    duckdbtablefunction
   else:
    duckdbtablefunction_1711276538)
  duckdbvalue_1711276537 = (when declared(duckdbvalue):
    duckdbvalue
   else:
    duckdbvalue_1711276536)
  duckdbuhugeint_1711276454 = (when declared(duckdbuhugeint):
    duckdbuhugeint
   else:
    duckdbuhugeint_1711276453)
  structduckdbconfig_1711276523 = (when declared(structduckdbconfig):
    structduckdbconfig
   else:
    structduckdbconfig_1711276522)
  duckdbtablefunctioninitt_1711276549 = (when declared(duckdbtablefunctioninitt):
    duckdbtablefunctioninitt
   else:
    duckdbtablefunctioninitt_1711276548)
  duckdbinitinfo_1711276543 = (when declared(duckdbinitinfo):
    duckdbinitinfo
   else:
    duckdbinitinfo_1711276542)
  structduckdblistentry_1711276468 = (when declared(structduckdblistentry):
    structduckdblistentry
   else:
    structduckdblistentry_1711276467)
  structduckdbvalue_1711276535 = (when declared(structduckdbvalue):
    structduckdbvalue
   else:
    structduckdbvalue_1711276534)
  duckdbpreparedstatement_1711276509 = (when declared(duckdbpreparedstatement):
    duckdbpreparedstatement
   else:
    duckdbpreparedstatement_1711276508)
  duckdbdate_1711276414 = (when declared(duckdbdate):
    duckdbdate
   else:
    duckdbdate_1711276413)
  structduckdbtimestamp_1711276436 = (when declared(structduckdbtimestamp):
    structduckdbtimestamp
   else:
    structduckdbtimestamp_1711276435)
  duckdbtaskstate_1711276410 = (when declared(duckdbtaskstate):
    duckdbtaskstate
   else:
    duckdbtaskstate_1711276409)
  duckdbresulttype_1711276400 = (when declared(duckdbresulttype):
    duckdbresulttype
   else:
    duckdbresulttype_1711276399)
  duckdbvector_1711276485 = (when declared(duckdbvector):
    duckdbvector
   else:
    duckdbvector_1711276484)
  structduckdbappender_1711276519 = (when declared(structduckdbappender):
    structduckdbappender
   else:
    structduckdbappender_1711276518)
  structduckdbuhugeint_1711276452 = (when declared(structduckdbuhugeint):
    structduckdbuhugeint
   else:
    structduckdbuhugeint_1711276451)
  structduckdbdatestruct_1711276416 = (when declared(structduckdbdatestruct):
    structduckdbdatestruct
   else:
    structduckdbdatestruct_1711276415)
  duckdbarrow_1711276559 = (when declared(duckdbarrow):
    duckdbarrow
   else:
    duckdbarrow_1711276558)
  structduckdbdatabase_1711276499 = (when declared(structduckdbdatabase):
    structduckdbdatabase
   else:
    structduckdbdatabase_1711276498)
  structduckdbtime_1711276420 = (when declared(structduckdbtime):
    structduckdbtime
   else:
    structduckdbtime_1711276419)
  duckdbtimestampstruct_1711276442 = (when declared(duckdbtimestampstruct):
    duckdbtimestampstruct
   else:
    duckdbtimestampstruct_1711276441)
  duckdbtimestamp_1711276438 = (when declared(duckdbtimestamp):
    duckdbtimestamp
   else:
    duckdbtimestamp_1711276437)
  structduckdbtimetz_1711276428 = (when declared(structduckdbtimetz):
    structduckdbtimetz
   else:
    structduckdbtimetz_1711276427)
  duckdbtimetz_1711276430 = (when declared(duckdbtimetz):
    duckdbtimetz
   else:
    duckdbtimetz_1711276429)
  duckdbreplacementscaninfo_1711276553 = (when declared(
      duckdbreplacementscaninfo):
    duckdbreplacementscaninfo
   else:
    duckdbreplacementscaninfo_1711276552)
  structduckdbblob_1711276491 = (when declared(structduckdbblob):
    structduckdbblob
   else:
    structduckdbblob_1711276490)
  structduckdbarrow_1711276557 = (when declared(structduckdbarrow):
    structduckdbarrow
   else:
    structduckdbarrow_1711276556)
  enumduckdbtype_1711276386 = (when declared(enumduckdbtype):
    enumduckdbtype
   else:
    enumduckdbtype_1711276384)
  duckdbtimetzstruct_1711276434 = (when declared(duckdbtimetzstruct):
    duckdbtimetzstruct
   else:
    duckdbtimetzstruct_1711276433)
  structduckdblogicaltype_1711276527 = (when declared(structduckdblogicaltype):
    structduckdblogicaltype
   else:
    structduckdblogicaltype_1711276526)
  structduckdbextractedstatements_1711276511 = (when declared(
      structduckdbextractedstatements):
    structduckdbextractedstatements
   else:
    structduckdbextractedstatements_1711276510)
  duckdbstate_1711276392 = (when declared(duckdbstate):
    duckdbstate
   else:
    duckdbstate_1711276391)
  duckdbtablefunctionbindt_1711276547 = (when declared(duckdbtablefunctionbindt):
    duckdbtablefunctionbindt
   else:
    duckdbtablefunctionbindt_1711276546)
  duckdbextractedstatements_1711276513 = (when declared(
      duckdbextractedstatements):
    duckdbextractedstatements
   else:
    duckdbextractedstatements_1711276512)
  duckdbtype_1711276388 = (when declared(duckdbtype):
    duckdbtype
   else:
    duckdbtype_1711276387)
  enumduckdbresulttype_1711276398 = (when declared(enumduckdbresulttype):
    enumduckdbresulttype
   else:
    enumduckdbresulttype_1711276397)
  duckdbdatestruct_1711276418 = (when declared(duckdbdatestruct):
    duckdbdatestruct
   else:
    duckdbdatestruct_1711276417)
  duckdbreplacementcallbackt_1711276555 = (when declared(
      duckdbreplacementcallbackt):
    duckdbreplacementcallbackt
   else:
    duckdbreplacementcallbackt_1711276554)
  structduckdbarrowstream_1711276561 = (when declared(structduckdbarrowstream):
    structduckdbarrowstream
   else:
    structduckdbarrowstream_1711276560)
  duckdbtime_1711276422 = (when declared(duckdbtime):
    duckdbtime
   else:
    duckdbtime_1711276421)
  duckdbappender_1711276521 = (when declared(duckdbappender):
    duckdbappender
   else:
    duckdbappender_1711276520)
  structduckdbpendingresult_1711276515 = (when declared(
      structduckdbpendingresult):
    structduckdbpendingresult
   else:
    structduckdbpendingresult_1711276514)
  duckdbdeletecallbackt_1711276408 = (when declared(duckdbdeletecallbackt):
    duckdbdeletecallbackt
   else:
    duckdbdeletecallbackt_1711276407)
  structduckdbvector_1711276483 = (when declared(structduckdbvector):
    structduckdbvector
   else:
    structduckdbvector_1711276482)
  structduckdbtimestampstruct_1711276440 = (when declared(
      structduckdbtimestampstruct):
    structduckdbtimestampstruct
   else:
    structduckdbtimestampstruct_1711276439)
  duckdbqueryprogresstype_1711276462 = (when declared(duckdbqueryprogresstype):
    duckdbqueryprogresstype
   else:
    duckdbqueryprogresstype_1711276461)
  structduckdbarrowschema_1711276565 = (when declared(structduckdbarrowschema):
    structduckdbarrowschema
   else:
    structduckdbarrowschema_1711276564)
  structduckdbdate_1711276412 = (when declared(structduckdbdate):
    structduckdbdate
   else:
    structduckdbdate_1711276411)
  structduckdbstringt_1711276464 = (when declared(structduckdbstringt):
    structduckdbstringt
   else:
    structduckdbstringt_1711276463)
  duckdbconfig_1711276525 = (when declared(duckdbconfig):
    duckdbconfig
   else:
    duckdbconfig_1711276524)
  duckdbarrowschema_1711276567 = (when declared(duckdbarrowschema):
    duckdbarrowschema
   else:
    duckdbarrowschema_1711276566)
  duckdbarrowstream_1711276563 = (when declared(duckdbarrowstream):
    duckdbarrowstream
   else:
    duckdbarrowstream_1711276562)
  duckdbarrowarray_1711276571 = (when declared(duckdbarrowarray):
    duckdbarrowarray
   else:
    duckdbarrowarray_1711276570)
  structduckdbarrowarray_1711276569 = (when declared(structduckdbarrowarray):
    structduckdbarrowarray
   else:
    structduckdbarrowarray_1711276568)
  duckdbpendingstate_1711276396 = (when declared(duckdbpendingstate):
    duckdbpendingstate
   else:
    duckdbpendingstate_1711276395)
when not declared(duckdbtimestruct):
  type
    duckdbtimestruct* = duckdbtimestruct_1711276425
else:
  static :
    hint("Declaration of " & "duckdbtimestruct" &
        " already exists, not redeclaring")
when not declared(structduckdbpreparedstatement):
  type
    structduckdbpreparedstatement* = structduckdbpreparedstatement_1711276506
else:
  static :
    hint("Declaration of " & "structduckdbpreparedstatement" &
        " already exists, not redeclaring")
when not declared(duckdbbindinfo):
  type
    duckdbbindinfo* = duckdbbindinfo_1711276540
else:
  static :
    hint("Declaration of " & "duckdbbindinfo" &
        " already exists, not redeclaring")
when not declared(structduckdbcolumn):
  type
    structduckdbcolumn* = structduckdbcolumn_1711276471
else:
  static :
    hint("Declaration of " & "structduckdbcolumn" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctiont):
  type
    duckdbtablefunctiont* = duckdbtablefunctiont_1711276550
else:
  static :
    hint("Declaration of " & "duckdbtablefunctiont" &
        " already exists, not redeclaring")
when not declared(duckdblogicaltype):
  type
    duckdblogicaltype* = duckdblogicaltype_1711276528
else:
  static :
    hint("Declaration of " & "duckdblogicaltype" &
        " already exists, not redeclaring")
when not declared(duckdbstatementtype):
  type
    duckdbstatementtype* = duckdbstatementtype_1711276403
else:
  static :
    hint("Declaration of " & "duckdbstatementtype" &
        " already exists, not redeclaring")
when not declared(structduckdbdatachunk):
  type
    structduckdbdatachunk* = structduckdbdatachunk_1711276530
else:
  static :
    hint("Declaration of " & "structduckdbdatachunk" &
        " already exists, not redeclaring")
when not declared(duckdbstring):
  type
    duckdbstring* = duckdbstring_1711276488
else:
  static :
    hint("Declaration of " & "duckdbstring" & " already exists, not redeclaring")
when not declared(structduckdbinterval):
  type
    structduckdbinterval* = structduckdbinterval_1711276443
else:
  static :
    hint("Declaration of " & "structduckdbinterval" &
        " already exists, not redeclaring")
when not declared(duckdbstringt):
  type
    duckdbstringt* = duckdbstringt_1711276465
else:
  static :
    hint("Declaration of " & "duckdbstringt" &
        " already exists, not redeclaring")
when not declared(duckdbconnection):
  type
    duckdbconnection* = duckdbconnection_1711276504
else:
  static :
    hint("Declaration of " & "duckdbconnection" &
        " already exists, not redeclaring")
when not declared(structduckdbdecimal):
  type
    structduckdbdecimal* = structduckdbdecimal_1711276455
else:
  static :
    hint("Declaration of " & "structduckdbdecimal" &
        " already exists, not redeclaring")
when not declared(structduckdbtimestruct):
  type
    structduckdbtimestruct* = structduckdbtimestruct_1711276423
else:
  static :
    hint("Declaration of " & "structduckdbtimestruct" &
        " already exists, not redeclaring")
when not declared(structduckdbtimetzstruct):
  type
    structduckdbtimetzstruct* = structduckdbtimetzstruct_1711276431
else:
  static :
    hint("Declaration of " & "structduckdbtimetzstruct" &
        " already exists, not redeclaring")
when not declared(duckdbhugeint):
  type
    duckdbhugeint* = duckdbhugeint_1711276449
else:
  static :
    hint("Declaration of " & "duckdbhugeint" &
        " already exists, not redeclaring")
when not declared(structduckdbresult):
  type
    structduckdbresult* = structduckdbresult_1711276494
else:
  static :
    hint("Declaration of " & "structduckdbresult" &
        " already exists, not redeclaring")
when not declared(duckdbpendingresult):
  type
    duckdbpendingresult* = duckdbpendingresult_1711276516
else:
  static :
    hint("Declaration of " & "duckdbpendingresult" &
        " already exists, not redeclaring")
when not declared(duckdbblob):
  type
    duckdbblob* = duckdbblob_1711276492
else:
  static :
    hint("Declaration of " & "duckdbblob" & " already exists, not redeclaring")
when not declared(duckdbdecimal):
  type
    duckdbdecimal* = duckdbdecimal_1711276457
else:
  static :
    hint("Declaration of " & "duckdbdecimal" &
        " already exists, not redeclaring")
when not declared(duckdbdatabase):
  type
    duckdbdatabase* = duckdbdatabase_1711276500
else:
  static :
    hint("Declaration of " & "duckdbdatabase" &
        " already exists, not redeclaring")
when not declared(structduckdbqueryprogresstype):
  type
    structduckdbqueryprogresstype* = structduckdbqueryprogresstype_1711276459
else:
  static :
    hint("Declaration of " & "structduckdbqueryprogresstype" &
        " already exists, not redeclaring")
when not declared(duckdblistentry):
  type
    duckdblistentry* = duckdblistentry_1711276469
else:
  static :
    hint("Declaration of " & "duckdblistentry" &
        " already exists, not redeclaring")
when not declared(idxt):
  type
    idxt* = idxt_1711276405
else:
  static :
    hint("Declaration of " & "idxt" & " already exists, not redeclaring")
when not declared(structduckdbhugeint):
  type
    structduckdbhugeint* = structduckdbhugeint_1711276447
else:
  static :
    hint("Declaration of " & "structduckdbhugeint" &
        " already exists, not redeclaring")
when not declared(structduckdbconnection):
  type
    structduckdbconnection* = structduckdbconnection_1711276502
else:
  static :
    hint("Declaration of " & "structduckdbconnection" &
        " already exists, not redeclaring")
when not declared(duckdbinterval):
  type
    duckdbinterval* = duckdbinterval_1711276445
else:
  static :
    hint("Declaration of " & "duckdbinterval" &
        " already exists, not redeclaring")
when not declared(duckdbfunctioninfo):
  type
    duckdbfunctioninfo* = duckdbfunctioninfo_1711276544
else:
  static :
    hint("Declaration of " & "duckdbfunctioninfo" &
        " already exists, not redeclaring")
when not declared(duckdbresult):
  type
    duckdbresult* = duckdbresult_1711276496
else:
  static :
    hint("Declaration of " & "duckdbresult" & " already exists, not redeclaring")
when not declared(structduckdbstring):
  type
    structduckdbstring* = structduckdbstring_1711276486
else:
  static :
    hint("Declaration of " & "structduckdbstring" &
        " already exists, not redeclaring")
when not declared(duckdbcolumn):
  type
    duckdbcolumn* = duckdbcolumn_1711276480
else:
  static :
    hint("Declaration of " & "duckdbcolumn" & " already exists, not redeclaring")
when not declared(duckdbdatachunk):
  type
    duckdbdatachunk* = duckdbdatachunk_1711276532
else:
  static :
    hint("Declaration of " & "duckdbdatachunk" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunction):
  type
    duckdbtablefunction* = duckdbtablefunction_1711276538
else:
  static :
    hint("Declaration of " & "duckdbtablefunction" &
        " already exists, not redeclaring")
when not declared(duckdbvalue):
  type
    duckdbvalue* = duckdbvalue_1711276536
else:
  static :
    hint("Declaration of " & "duckdbvalue" & " already exists, not redeclaring")
when not declared(duckdbuhugeint):
  type
    duckdbuhugeint* = duckdbuhugeint_1711276453
else:
  static :
    hint("Declaration of " & "duckdbuhugeint" &
        " already exists, not redeclaring")
when not declared(structduckdbconfig):
  type
    structduckdbconfig* = structduckdbconfig_1711276522
else:
  static :
    hint("Declaration of " & "structduckdbconfig" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctioninitt):
  type
    duckdbtablefunctioninitt* = duckdbtablefunctioninitt_1711276548
else:
  static :
    hint("Declaration of " & "duckdbtablefunctioninitt" &
        " already exists, not redeclaring")
when not declared(duckdbinitinfo):
  type
    duckdbinitinfo* = duckdbinitinfo_1711276542
else:
  static :
    hint("Declaration of " & "duckdbinitinfo" &
        " already exists, not redeclaring")
when not declared(structduckdblistentry):
  type
    structduckdblistentry* = structduckdblistentry_1711276467
else:
  static :
    hint("Declaration of " & "structduckdblistentry" &
        " already exists, not redeclaring")
when not declared(structduckdbvalue):
  type
    structduckdbvalue* = structduckdbvalue_1711276534
else:
  static :
    hint("Declaration of " & "structduckdbvalue" &
        " already exists, not redeclaring")
when not declared(duckdbpreparedstatement):
  type
    duckdbpreparedstatement* = duckdbpreparedstatement_1711276508
else:
  static :
    hint("Declaration of " & "duckdbpreparedstatement" &
        " already exists, not redeclaring")
when not declared(duckdbdate):
  type
    duckdbdate* = duckdbdate_1711276413
else:
  static :
    hint("Declaration of " & "duckdbdate" & " already exists, not redeclaring")
when not declared(structduckdbtimestamp):
  type
    structduckdbtimestamp* = structduckdbtimestamp_1711276435
else:
  static :
    hint("Declaration of " & "structduckdbtimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbtaskstate):
  type
    duckdbtaskstate* = duckdbtaskstate_1711276409
else:
  static :
    hint("Declaration of " & "duckdbtaskstate" &
        " already exists, not redeclaring")
when not declared(duckdbresulttype):
  type
    duckdbresulttype* = duckdbresulttype_1711276399
else:
  static :
    hint("Declaration of " & "duckdbresulttype" &
        " already exists, not redeclaring")
when not declared(duckdbvector):
  type
    duckdbvector* = duckdbvector_1711276484
else:
  static :
    hint("Declaration of " & "duckdbvector" & " already exists, not redeclaring")
when not declared(structduckdbappender):
  type
    structduckdbappender* = structduckdbappender_1711276518
else:
  static :
    hint("Declaration of " & "structduckdbappender" &
        " already exists, not redeclaring")
when not declared(structduckdbuhugeint):
  type
    structduckdbuhugeint* = structduckdbuhugeint_1711276451
else:
  static :
    hint("Declaration of " & "structduckdbuhugeint" &
        " already exists, not redeclaring")
when not declared(structduckdbdatestruct):
  type
    structduckdbdatestruct* = structduckdbdatestruct_1711276415
else:
  static :
    hint("Declaration of " & "structduckdbdatestruct" &
        " already exists, not redeclaring")
when not declared(duckdbarrow):
  type
    duckdbarrow* = duckdbarrow_1711276558
else:
  static :
    hint("Declaration of " & "duckdbarrow" & " already exists, not redeclaring")
when not declared(structduckdbdatabase):
  type
    structduckdbdatabase* = structduckdbdatabase_1711276498
else:
  static :
    hint("Declaration of " & "structduckdbdatabase" &
        " already exists, not redeclaring")
when not declared(structduckdbtime):
  type
    structduckdbtime* = structduckdbtime_1711276419
else:
  static :
    hint("Declaration of " & "structduckdbtime" &
        " already exists, not redeclaring")
when not declared(duckdbtimestampstruct):
  type
    duckdbtimestampstruct* = duckdbtimestampstruct_1711276441
else:
  static :
    hint("Declaration of " & "duckdbtimestampstruct" &
        " already exists, not redeclaring")
when not declared(duckdbtimestamp):
  type
    duckdbtimestamp* = duckdbtimestamp_1711276437
else:
  static :
    hint("Declaration of " & "duckdbtimestamp" &
        " already exists, not redeclaring")
when not declared(structduckdbtimetz):
  type
    structduckdbtimetz* = structduckdbtimetz_1711276427
else:
  static :
    hint("Declaration of " & "structduckdbtimetz" &
        " already exists, not redeclaring")
when not declared(duckdbtimetz):
  type
    duckdbtimetz* = duckdbtimetz_1711276429
else:
  static :
    hint("Declaration of " & "duckdbtimetz" & " already exists, not redeclaring")
when not declared(duckdbreplacementscaninfo):
  type
    duckdbreplacementscaninfo* = duckdbreplacementscaninfo_1711276552
else:
  static :
    hint("Declaration of " & "duckdbreplacementscaninfo" &
        " already exists, not redeclaring")
when not declared(structduckdbblob):
  type
    structduckdbblob* = structduckdbblob_1711276490
else:
  static :
    hint("Declaration of " & "structduckdbblob" &
        " already exists, not redeclaring")
when not declared(structduckdbarrow):
  type
    structduckdbarrow* = structduckdbarrow_1711276556
else:
  static :
    hint("Declaration of " & "structduckdbarrow" &
        " already exists, not redeclaring")
when not declared(duckdbtimetzstruct):
  type
    duckdbtimetzstruct* = duckdbtimetzstruct_1711276433
else:
  static :
    hint("Declaration of " & "duckdbtimetzstruct" &
        " already exists, not redeclaring")
when not declared(structduckdblogicaltype):
  type
    structduckdblogicaltype* = structduckdblogicaltype_1711276526
else:
  static :
    hint("Declaration of " & "structduckdblogicaltype" &
        " already exists, not redeclaring")
when not declared(structduckdbextractedstatements):
  type
    structduckdbextractedstatements* = structduckdbextractedstatements_1711276510
else:
  static :
    hint("Declaration of " & "structduckdbextractedstatements" &
        " already exists, not redeclaring")
when not declared(duckdbstate):
  type
    duckdbstate* = duckdbstate_1711276391
else:
  static :
    hint("Declaration of " & "duckdbstate" & " already exists, not redeclaring")
when not declared(duckdbtablefunctionbindt):
  type
    duckdbtablefunctionbindt* = duckdbtablefunctionbindt_1711276546
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionbindt" &
        " already exists, not redeclaring")
when not declared(duckdbextractedstatements):
  type
    duckdbextractedstatements* = duckdbextractedstatements_1711276512
else:
  static :
    hint("Declaration of " & "duckdbextractedstatements" &
        " already exists, not redeclaring")
when not declared(duckdbtype):
  type
    duckdbtype* = duckdbtype_1711276387
else:
  static :
    hint("Declaration of " & "duckdbtype" & " already exists, not redeclaring")
when not declared(duckdbdatestruct):
  type
    duckdbdatestruct* = duckdbdatestruct_1711276417
else:
  static :
    hint("Declaration of " & "duckdbdatestruct" &
        " already exists, not redeclaring")
when not declared(duckdbreplacementcallbackt):
  type
    duckdbreplacementcallbackt* = duckdbreplacementcallbackt_1711276554
else:
  static :
    hint("Declaration of " & "duckdbreplacementcallbackt" &
        " already exists, not redeclaring")
when not declared(structduckdbarrowstream):
  type
    structduckdbarrowstream* = structduckdbarrowstream_1711276560
else:
  static :
    hint("Declaration of " & "structduckdbarrowstream" &
        " already exists, not redeclaring")
when not declared(duckdbtime):
  type
    duckdbtime* = duckdbtime_1711276421
else:
  static :
    hint("Declaration of " & "duckdbtime" & " already exists, not redeclaring")
when not declared(duckdbappender):
  type
    duckdbappender* = duckdbappender_1711276520
else:
  static :
    hint("Declaration of " & "duckdbappender" &
        " already exists, not redeclaring")
when not declared(structduckdbpendingresult):
  type
    structduckdbpendingresult* = structduckdbpendingresult_1711276514
else:
  static :
    hint("Declaration of " & "structduckdbpendingresult" &
        " already exists, not redeclaring")
when not declared(duckdbdeletecallbackt):
  type
    duckdbdeletecallbackt* = duckdbdeletecallbackt_1711276407
else:
  static :
    hint("Declaration of " & "duckdbdeletecallbackt" &
        " already exists, not redeclaring")
when not declared(structduckdbvector):
  type
    structduckdbvector* = structduckdbvector_1711276482
else:
  static :
    hint("Declaration of " & "structduckdbvector" &
        " already exists, not redeclaring")
when not declared(structduckdbtimestampstruct):
  type
    structduckdbtimestampstruct* = structduckdbtimestampstruct_1711276439
else:
  static :
    hint("Declaration of " & "structduckdbtimestampstruct" &
        " already exists, not redeclaring")
when not declared(duckdbqueryprogresstype):
  type
    duckdbqueryprogresstype* = duckdbqueryprogresstype_1711276461
else:
  static :
    hint("Declaration of " & "duckdbqueryprogresstype" &
        " already exists, not redeclaring")
when not declared(structduckdbarrowschema):
  type
    structduckdbarrowschema* = structduckdbarrowschema_1711276564
else:
  static :
    hint("Declaration of " & "structduckdbarrowschema" &
        " already exists, not redeclaring")
when not declared(structduckdbdate):
  type
    structduckdbdate* = structduckdbdate_1711276411
else:
  static :
    hint("Declaration of " & "structduckdbdate" &
        " already exists, not redeclaring")
when not declared(structduckdbstringt):
  type
    structduckdbstringt* = structduckdbstringt_1711276463
else:
  static :
    hint("Declaration of " & "structduckdbstringt" &
        " already exists, not redeclaring")
when not declared(duckdbconfig):
  type
    duckdbconfig* = duckdbconfig_1711276524
else:
  static :
    hint("Declaration of " & "duckdbconfig" & " already exists, not redeclaring")
when not declared(duckdbarrowschema):
  type
    duckdbarrowschema* = duckdbarrowschema_1711276566
else:
  static :
    hint("Declaration of " & "duckdbarrowschema" &
        " already exists, not redeclaring")
when not declared(duckdbarrowstream):
  type
    duckdbarrowstream* = duckdbarrowstream_1711276562
else:
  static :
    hint("Declaration of " & "duckdbarrowstream" &
        " already exists, not redeclaring")
when not declared(duckdbarrowarray):
  type
    duckdbarrowarray* = duckdbarrowarray_1711276570
else:
  static :
    hint("Declaration of " & "duckdbarrowarray" &
        " already exists, not redeclaring")
when not declared(structduckdbarrowarray):
  type
    structduckdbarrowarray* = structduckdbarrowarray_1711276568
else:
  static :
    hint("Declaration of " & "structduckdbarrowarray" &
        " already exists, not redeclaring")
when not declared(duckdbpendingstate):
  type
    duckdbpendingstate* = duckdbpendingstate_1711276395
else:
  static :
    hint("Declaration of " & "duckdbpendingstate" &
        " already exists, not redeclaring")
when not declared(Duckdbapi031):
  when 1 is static:
    const
      Duckdbapi031* = 1      ## Generated based on /usr/include/duckdb.h:43:9
  else:
    let Duckdbapi031* = 1    ## Generated based on /usr/include/duckdb.h:43:9
else:
  static :
    hint("Declaration of " & "Duckdbapi031" & " already exists, not redeclaring")
when not declared(Duckdbapi032):
  when 2 is static:
    const
      Duckdbapi032* = 2      ## Generated based on /usr/include/duckdb.h:46:9
  else:
    let Duckdbapi032* = 2    ## Generated based on /usr/include/duckdb.h:46:9
else:
  static :
    hint("Declaration of " & "Duckdbapi032" & " already exists, not redeclaring")
when not declared(Duckdbapilatest):
  when Duckdbapi032 is typedesc:
    type
      Duckdbapilatest* = Duckdbapi032 ## Generated based on /usr/include/duckdb.h:49:9
  else:
    when Duckdbapi032 is static:
      const
        Duckdbapilatest* = Duckdbapi032 ## Generated based on /usr/include/duckdb.h:49:9
    else:
      let Duckdbapilatest* = Duckdbapi032 ## Generated based on /usr/include/duckdb.h:49:9
else:
  static :
    hint("Declaration of " & "Duckdbapilatest" &
        " already exists, not redeclaring")
when not declared(duckdbopen):
  proc duckdbopen*(path: cstring; outdatabase: ptr duckdbdatabase_1711276501): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_open".}
else:
  static :
    hint("Declaration of " & "duckdbopen" & " already exists, not redeclaring")
when not declared(duckdbopenext):
  proc duckdbopenext*(path: cstring; outdatabase: ptr duckdbdatabase_1711276501;
                      config: duckdbconfig_1711276525; outerror: ptr cstring): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_open_ext".}
else:
  static :
    hint("Declaration of " & "duckdbopenext" &
        " already exists, not redeclaring")
when not declared(duckdbclose):
  proc duckdbclose*(database: ptr duckdbdatabase_1711276501): void {.cdecl,
      importc: "duckdb_close".}
else:
  static :
    hint("Declaration of " & "duckdbclose" & " already exists, not redeclaring")
when not declared(duckdbconnect):
  proc duckdbconnect*(database: duckdbdatabase_1711276501;
                      outconnection: ptr duckdbconnection_1711276505): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_connect".}
else:
  static :
    hint("Declaration of " & "duckdbconnect" &
        " already exists, not redeclaring")
when not declared(duckdbinterrupt):
  proc duckdbinterrupt*(connection: duckdbconnection_1711276505): void {.cdecl,
      importc: "duckdb_interrupt".}
else:
  static :
    hint("Declaration of " & "duckdbinterrupt" &
        " already exists, not redeclaring")
when not declared(duckdbqueryprogress):
  proc duckdbqueryprogress*(connection: duckdbconnection_1711276505): duckdbqueryprogresstype_1711276462 {.
      cdecl, importc: "duckdb_query_progress".}
else:
  static :
    hint("Declaration of " & "duckdbqueryprogress" &
        " already exists, not redeclaring")
when not declared(duckdbdisconnect):
  proc duckdbdisconnect*(connection: ptr duckdbconnection_1711276505): void {.
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
  proc duckdbcreateconfig*(outconfig: ptr duckdbconfig_1711276525): duckdbstate_1711276392 {.
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
                            outdescription: ptr cstring): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_get_config_flag".}
else:
  static :
    hint("Declaration of " & "duckdbgetconfigflag" &
        " already exists, not redeclaring")
when not declared(duckdbsetconfig):
  proc duckdbsetconfig*(config: duckdbconfig_1711276525; name: cstring;
                        option: cstring): duckdbstate_1711276392 {.cdecl,
      importc: "duckdb_set_config".}
else:
  static :
    hint("Declaration of " & "duckdbsetconfig" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyconfig):
  proc duckdbdestroyconfig*(config: ptr duckdbconfig_1711276525): void {.cdecl,
      importc: "duckdb_destroy_config".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyconfig" &
        " already exists, not redeclaring")
when not declared(duckdbquery):
  proc duckdbquery*(connection: duckdbconnection_1711276505; query: cstring;
                    outresult: ptr duckdbresult_1711276497): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_query".}
else:
  static :
    hint("Declaration of " & "duckdbquery" & " already exists, not redeclaring")
when not declared(duckdbdestroyresult):
  proc duckdbdestroyresult*(result: ptr duckdbresult_1711276497): void {.cdecl,
      importc: "duckdb_destroy_result".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyresult" &
        " already exists, not redeclaring")
when not declared(duckdbcolumnname):
  proc duckdbcolumnname*(result: ptr duckdbresult_1711276497; col: idxt_1711276406): cstring {.
      cdecl, importc: "duckdb_column_name".}
else:
  static :
    hint("Declaration of " & "duckdbcolumnname" &
        " already exists, not redeclaring")
when not declared(duckdbcolumntype):
  proc duckdbcolumntype*(result: ptr duckdbresult_1711276497; col: idxt_1711276406): duckdbtype_1711276388 {.
      cdecl, importc: "duckdb_column_type".}
else:
  static :
    hint("Declaration of " & "duckdbcolumntype" &
        " already exists, not redeclaring")
when not declared(duckdbresultstatementtype):
  proc duckdbresultstatementtype*(result: duckdbresult_1711276497): duckdbstatementtype_1711276404 {.
      cdecl, importc: "duckdb_result_statement_type".}
else:
  static :
    hint("Declaration of " & "duckdbresultstatementtype" &
        " already exists, not redeclaring")
when not declared(duckdbcolumnlogicaltype):
  proc duckdbcolumnlogicaltype*(result: ptr duckdbresult_1711276497; col: idxt_1711276406): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_column_logical_type".}
else:
  static :
    hint("Declaration of " & "duckdbcolumnlogicaltype" &
        " already exists, not redeclaring")
when not declared(duckdbcolumncount):
  proc duckdbcolumncount*(result: ptr duckdbresult_1711276497): idxt_1711276406 {.
      cdecl, importc: "duckdb_column_count".}
else:
  static :
    hint("Declaration of " & "duckdbcolumncount" &
        " already exists, not redeclaring")
when not declared(duckdbrowcount):
  proc duckdbrowcount*(result: ptr duckdbresult_1711276497): idxt_1711276406 {.
      cdecl, importc: "duckdb_row_count".}
else:
  static :
    hint("Declaration of " & "duckdbrowcount" &
        " already exists, not redeclaring")
when not declared(duckdbrowschanged):
  proc duckdbrowschanged*(result: ptr duckdbresult_1711276497): idxt_1711276406 {.
      cdecl, importc: "duckdb_rows_changed".}
else:
  static :
    hint("Declaration of " & "duckdbrowschanged" &
        " already exists, not redeclaring")
when not declared(duckdbcolumndata):
  proc duckdbcolumndata*(result: ptr duckdbresult_1711276497; col: idxt_1711276406): pointer {.
      cdecl, importc: "duckdb_column_data".}
else:
  static :
    hint("Declaration of " & "duckdbcolumndata" &
        " already exists, not redeclaring")
when not declared(duckdbnullmaskdata):
  proc duckdbnullmaskdata*(result: ptr duckdbresult_1711276497; col: idxt_1711276406): ptr bool {.
      cdecl, importc: "duckdb_nullmask_data".}
else:
  static :
    hint("Declaration of " & "duckdbnullmaskdata" &
        " already exists, not redeclaring")
when not declared(duckdbresulterror):
  proc duckdbresulterror*(result: ptr duckdbresult_1711276497): cstring {.cdecl,
      importc: "duckdb_result_error".}
else:
  static :
    hint("Declaration of " & "duckdbresulterror" &
        " already exists, not redeclaring")
when not declared(duckdbresultgetchunk):
  proc duckdbresultgetchunk*(result: duckdbresult_1711276497; chunkindex: idxt_1711276406): duckdbdatachunk_1711276533 {.
      cdecl, importc: "duckdb_result_get_chunk".}
else:
  static :
    hint("Declaration of " & "duckdbresultgetchunk" &
        " already exists, not redeclaring")
when not declared(duckdbresultisstreaming):
  proc duckdbresultisstreaming*(result: duckdbresult_1711276497): bool {.cdecl,
      importc: "duckdb_result_is_streaming".}
else:
  static :
    hint("Declaration of " & "duckdbresultisstreaming" &
        " already exists, not redeclaring")
when not declared(duckdbresultchunkcount):
  proc duckdbresultchunkcount*(result: duckdbresult_1711276497): idxt_1711276406 {.
      cdecl, importc: "duckdb_result_chunk_count".}
else:
  static :
    hint("Declaration of " & "duckdbresultchunkcount" &
        " already exists, not redeclaring")
when not declared(duckdbresultreturntype):
  proc duckdbresultreturntype*(result: duckdbresult_1711276497): duckdbresulttype_1711276400 {.
      cdecl, importc: "duckdb_result_return_type".}
else:
  static :
    hint("Declaration of " & "duckdbresultreturntype" &
        " already exists, not redeclaring")
when not declared(duckdbvalueboolean):
  proc duckdbvalueboolean*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                           row: idxt_1711276406): bool {.cdecl,
      importc: "duckdb_value_boolean".}
else:
  static :
    hint("Declaration of " & "duckdbvalueboolean" &
        " already exists, not redeclaring")
when not declared(duckdbvalueint8):
  proc duckdbvalueint8*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                        row: idxt_1711276406): int8 {.cdecl,
      importc: "duckdb_value_int8".}
else:
  static :
    hint("Declaration of " & "duckdbvalueint8" &
        " already exists, not redeclaring")
when not declared(duckdbvalueint16):
  proc duckdbvalueint16*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                         row: idxt_1711276406): int16 {.cdecl,
      importc: "duckdb_value_int16".}
else:
  static :
    hint("Declaration of " & "duckdbvalueint16" &
        " already exists, not redeclaring")
when not declared(duckdbvalueint32):
  proc duckdbvalueint32*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                         row: idxt_1711276406): int32 {.cdecl,
      importc: "duckdb_value_int32".}
else:
  static :
    hint("Declaration of " & "duckdbvalueint32" &
        " already exists, not redeclaring")
when not declared(duckdbvalueint64):
  proc duckdbvalueint64*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                         row: idxt_1711276406): int64 {.cdecl,
      importc: "duckdb_value_int64".}
else:
  static :
    hint("Declaration of " & "duckdbvalueint64" &
        " already exists, not redeclaring")
when not declared(duckdbvaluehugeint):
  proc duckdbvaluehugeint*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                           row: idxt_1711276406): duckdbhugeint_1711276450 {.
      cdecl, importc: "duckdb_value_hugeint".}
else:
  static :
    hint("Declaration of " & "duckdbvaluehugeint" &
        " already exists, not redeclaring")
when not declared(duckdbvalueuhugeint):
  proc duckdbvalueuhugeint*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                            row: idxt_1711276406): duckdbuhugeint_1711276454 {.
      cdecl, importc: "duckdb_value_uhugeint".}
else:
  static :
    hint("Declaration of " & "duckdbvalueuhugeint" &
        " already exists, not redeclaring")
when not declared(duckdbvaluedecimal):
  proc duckdbvaluedecimal*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                           row: idxt_1711276406): duckdbdecimal_1711276458 {.
      cdecl, importc: "duckdb_value_decimal".}
else:
  static :
    hint("Declaration of " & "duckdbvaluedecimal" &
        " already exists, not redeclaring")
when not declared(duckdbvalueuint8):
  proc duckdbvalueuint8*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                         row: idxt_1711276406): uint8 {.cdecl,
      importc: "duckdb_value_uint8".}
else:
  static :
    hint("Declaration of " & "duckdbvalueuint8" &
        " already exists, not redeclaring")
when not declared(duckdbvalueuint16):
  proc duckdbvalueuint16*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                          row: idxt_1711276406): uint16 {.cdecl,
      importc: "duckdb_value_uint16".}
else:
  static :
    hint("Declaration of " & "duckdbvalueuint16" &
        " already exists, not redeclaring")
when not declared(duckdbvalueuint32):
  proc duckdbvalueuint32*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                          row: idxt_1711276406): uint32 {.cdecl,
      importc: "duckdb_value_uint32".}
else:
  static :
    hint("Declaration of " & "duckdbvalueuint32" &
        " already exists, not redeclaring")
when not declared(duckdbvalueuint64):
  proc duckdbvalueuint64*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                          row: idxt_1711276406): uint64 {.cdecl,
      importc: "duckdb_value_uint64".}
else:
  static :
    hint("Declaration of " & "duckdbvalueuint64" &
        " already exists, not redeclaring")
when not declared(duckdbvaluefloat):
  proc duckdbvaluefloat*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                         row: idxt_1711276406): cfloat {.cdecl,
      importc: "duckdb_value_float".}
else:
  static :
    hint("Declaration of " & "duckdbvaluefloat" &
        " already exists, not redeclaring")
when not declared(duckdbvaluedouble):
  proc duckdbvaluedouble*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                          row: idxt_1711276406): cdouble {.cdecl,
      importc: "duckdb_value_double".}
else:
  static :
    hint("Declaration of " & "duckdbvaluedouble" &
        " already exists, not redeclaring")
when not declared(duckdbvaluedate):
  proc duckdbvaluedate*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                        row: idxt_1711276406): duckdbdate_1711276414 {.cdecl,
      importc: "duckdb_value_date".}
else:
  static :
    hint("Declaration of " & "duckdbvaluedate" &
        " already exists, not redeclaring")
when not declared(duckdbvaluetime):
  proc duckdbvaluetime*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                        row: idxt_1711276406): duckdbtime_1711276422 {.cdecl,
      importc: "duckdb_value_time".}
else:
  static :
    hint("Declaration of " & "duckdbvaluetime" &
        " already exists, not redeclaring")
when not declared(duckdbvaluetimestamp):
  proc duckdbvaluetimestamp*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                             row: idxt_1711276406): duckdbtimestamp_1711276438 {.
      cdecl, importc: "duckdb_value_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbvaluetimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbvalueinterval):
  proc duckdbvalueinterval*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                            row: idxt_1711276406): duckdbinterval_1711276446 {.
      cdecl, importc: "duckdb_value_interval".}
else:
  static :
    hint("Declaration of " & "duckdbvalueinterval" &
        " already exists, not redeclaring")
when not declared(duckdbvaluevarchar):
  proc duckdbvaluevarchar*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                           row: idxt_1711276406): cstring {.cdecl,
      importc: "duckdb_value_varchar".}
else:
  static :
    hint("Declaration of " & "duckdbvaluevarchar" &
        " already exists, not redeclaring")
when not declared(duckdbvaluestring):
  proc duckdbvaluestring*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                          row: idxt_1711276406): duckdbstring_1711276489 {.
      cdecl, importc: "duckdb_value_string".}
else:
  static :
    hint("Declaration of " & "duckdbvaluestring" &
        " already exists, not redeclaring")
when not declared(duckdbvaluevarcharinternal):
  proc duckdbvaluevarcharinternal*(result: ptr duckdbresult_1711276497;
                                   col: idxt_1711276406; row: idxt_1711276406): cstring {.
      cdecl, importc: "duckdb_value_varchar_internal".}
else:
  static :
    hint("Declaration of " & "duckdbvaluevarcharinternal" &
        " already exists, not redeclaring")
when not declared(duckdbvaluestringinternal):
  proc duckdbvaluestringinternal*(result: ptr duckdbresult_1711276497;
                                  col: idxt_1711276406; row: idxt_1711276406): duckdbstring_1711276489 {.
      cdecl, importc: "duckdb_value_string_internal".}
else:
  static :
    hint("Declaration of " & "duckdbvaluestringinternal" &
        " already exists, not redeclaring")
when not declared(duckdbvalueblob):
  proc duckdbvalueblob*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                        row: idxt_1711276406): duckdbblob_1711276493 {.cdecl,
      importc: "duckdb_value_blob".}
else:
  static :
    hint("Declaration of " & "duckdbvalueblob" &
        " already exists, not redeclaring")
when not declared(duckdbvalueisnull):
  proc duckdbvalueisnull*(result: ptr duckdbresult_1711276497; col: idxt_1711276406;
                          row: idxt_1711276406): bool {.cdecl,
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
  proc duckdbvectorsize*(): idxt_1711276406 {.cdecl,
      importc: "duckdb_vector_size".}
else:
  static :
    hint("Declaration of " & "duckdbvectorsize" &
        " already exists, not redeclaring")
when not declared(duckdbstringisinlined):
  proc duckdbstringisinlined*(string: duckdbstringt_1711276466): bool {.cdecl,
      importc: "duckdb_string_is_inlined".}
else:
  static :
    hint("Declaration of " & "duckdbstringisinlined" &
        " already exists, not redeclaring")
when not declared(duckdbfromdate):
  proc duckdbfromdate*(date: duckdbdate_1711276414): duckdbdatestruct_1711276418 {.
      cdecl, importc: "duckdb_from_date".}
else:
  static :
    hint("Declaration of " & "duckdbfromdate" &
        " already exists, not redeclaring")
when not declared(duckdbtodate):
  proc duckdbtodate*(date: duckdbdatestruct_1711276418): duckdbdate_1711276414 {.
      cdecl, importc: "duckdb_to_date".}
else:
  static :
    hint("Declaration of " & "duckdbtodate" & " already exists, not redeclaring")
when not declared(duckdbisfinitedate):
  proc duckdbisfinitedate*(date: duckdbdate_1711276414): bool {.cdecl,
      importc: "duckdb_is_finite_date".}
else:
  static :
    hint("Declaration of " & "duckdbisfinitedate" &
        " already exists, not redeclaring")
when not declared(duckdbfromtime):
  proc duckdbfromtime*(time: duckdbtime_1711276422): duckdbtimestruct_1711276426 {.
      cdecl, importc: "duckdb_from_time".}
else:
  static :
    hint("Declaration of " & "duckdbfromtime" &
        " already exists, not redeclaring")
when not declared(duckdbcreatetimetz):
  proc duckdbcreatetimetz*(micros: int64; offset: int32): duckdbtimetz_1711276430 {.
      cdecl, importc: "duckdb_create_time_tz".}
else:
  static :
    hint("Declaration of " & "duckdbcreatetimetz" &
        " already exists, not redeclaring")
when not declared(duckdbfromtimetz):
  proc duckdbfromtimetz*(micros: duckdbtimetz_1711276430): duckdbtimetzstruct_1711276434 {.
      cdecl, importc: "duckdb_from_time_tz".}
else:
  static :
    hint("Declaration of " & "duckdbfromtimetz" &
        " already exists, not redeclaring")
when not declared(duckdbtotime):
  proc duckdbtotime*(time: duckdbtimestruct_1711276426): duckdbtime_1711276422 {.
      cdecl, importc: "duckdb_to_time".}
else:
  static :
    hint("Declaration of " & "duckdbtotime" & " already exists, not redeclaring")
when not declared(duckdbfromtimestamp):
  proc duckdbfromtimestamp*(ts: duckdbtimestamp_1711276438): duckdbtimestampstruct_1711276442 {.
      cdecl, importc: "duckdb_from_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbfromtimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbtotimestamp):
  proc duckdbtotimestamp*(ts: duckdbtimestampstruct_1711276442): duckdbtimestamp_1711276438 {.
      cdecl, importc: "duckdb_to_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbtotimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbisfinitetimestamp):
  proc duckdbisfinitetimestamp*(ts: duckdbtimestamp_1711276438): bool {.cdecl,
      importc: "duckdb_is_finite_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbisfinitetimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbhugeinttodouble):
  proc duckdbhugeinttodouble*(val: duckdbhugeint_1711276450): cdouble {.cdecl,
      importc: "duckdb_hugeint_to_double".}
else:
  static :
    hint("Declaration of " & "duckdbhugeinttodouble" &
        " already exists, not redeclaring")
when not declared(duckdbdoubletohugeint):
  proc duckdbdoubletohugeint*(val: cdouble): duckdbhugeint_1711276450 {.cdecl,
      importc: "duckdb_double_to_hugeint".}
else:
  static :
    hint("Declaration of " & "duckdbdoubletohugeint" &
        " already exists, not redeclaring")
when not declared(duckdbuhugeinttodouble):
  proc duckdbuhugeinttodouble*(val: duckdbuhugeint_1711276454): cdouble {.cdecl,
      importc: "duckdb_uhugeint_to_double".}
else:
  static :
    hint("Declaration of " & "duckdbuhugeinttodouble" &
        " already exists, not redeclaring")
when not declared(duckdbdoubletouhugeint):
  proc duckdbdoubletouhugeint*(val: cdouble): duckdbuhugeint_1711276454 {.cdecl,
      importc: "duckdb_double_to_uhugeint".}
else:
  static :
    hint("Declaration of " & "duckdbdoubletouhugeint" &
        " already exists, not redeclaring")
when not declared(duckdbdoubletodecimal):
  proc duckdbdoubletodecimal*(val: cdouble; width: uint8; scale: uint8): duckdbdecimal_1711276458 {.
      cdecl, importc: "duckdb_double_to_decimal".}
else:
  static :
    hint("Declaration of " & "duckdbdoubletodecimal" &
        " already exists, not redeclaring")
when not declared(duckdbdecimaltodouble):
  proc duckdbdecimaltodouble*(val: duckdbdecimal_1711276458): cdouble {.cdecl,
      importc: "duckdb_decimal_to_double".}
else:
  static :
    hint("Declaration of " & "duckdbdecimaltodouble" &
        " already exists, not redeclaring")
when not declared(duckdbprepare):
  proc duckdbprepare*(connection: duckdbconnection_1711276505; query: cstring;
                      outpreparedstatement: ptr duckdbpreparedstatement_1711276509): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_prepare".}
else:
  static :
    hint("Declaration of " & "duckdbprepare" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyprepare):
  proc duckdbdestroyprepare*(preparedstatement: ptr duckdbpreparedstatement_1711276509): void {.
      cdecl, importc: "duckdb_destroy_prepare".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyprepare" &
        " already exists, not redeclaring")
when not declared(duckdbprepareerror):
  proc duckdbprepareerror*(preparedstatement: duckdbpreparedstatement_1711276509): cstring {.
      cdecl, importc: "duckdb_prepare_error".}
else:
  static :
    hint("Declaration of " & "duckdbprepareerror" &
        " already exists, not redeclaring")
when not declared(duckdbnparams):
  proc duckdbnparams*(preparedstatement: duckdbpreparedstatement_1711276509): idxt_1711276406 {.
      cdecl, importc: "duckdb_nparams".}
else:
  static :
    hint("Declaration of " & "duckdbnparams" &
        " already exists, not redeclaring")
when not declared(duckdbparametername):
  proc duckdbparametername*(preparedstatement: duckdbpreparedstatement_1711276509;
                            index: idxt_1711276406): cstring {.cdecl,
      importc: "duckdb_parameter_name".}
else:
  static :
    hint("Declaration of " & "duckdbparametername" &
        " already exists, not redeclaring")
when not declared(duckdbparamtype):
  proc duckdbparamtype*(preparedstatement: duckdbpreparedstatement_1711276509;
                        paramidx: idxt_1711276406): duckdbtype_1711276388 {.
      cdecl, importc: "duckdb_param_type".}
else:
  static :
    hint("Declaration of " & "duckdbparamtype" &
        " already exists, not redeclaring")
when not declared(duckdbclearbindings):
  proc duckdbclearbindings*(preparedstatement: duckdbpreparedstatement_1711276509): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_clear_bindings".}
else:
  static :
    hint("Declaration of " & "duckdbclearbindings" &
        " already exists, not redeclaring")
when not declared(duckdbpreparedstatementtype):
  proc duckdbpreparedstatementtype*(statement: duckdbpreparedstatement_1711276509): duckdbstatementtype_1711276404 {.
      cdecl, importc: "duckdb_prepared_statement_type".}
else:
  static :
    hint("Declaration of " & "duckdbpreparedstatementtype" &
        " already exists, not redeclaring")
when not declared(duckdbbindvalue):
  proc duckdbbindvalue*(preparedstatement: duckdbpreparedstatement_1711276509;
                        paramidx: idxt_1711276406; val: duckdbvalue_1711276537): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_value".}
else:
  static :
    hint("Declaration of " & "duckdbbindvalue" &
        " already exists, not redeclaring")
when not declared(duckdbbindparameterindex):
  proc duckdbbindparameterindex*(preparedstatement: duckdbpreparedstatement_1711276509;
                                 paramidxout: ptr idxt_1711276406; name: cstring): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_parameter_index".}
else:
  static :
    hint("Declaration of " & "duckdbbindparameterindex" &
        " already exists, not redeclaring")
when not declared(duckdbbindboolean):
  proc duckdbbindboolean*(preparedstatement: duckdbpreparedstatement_1711276509;
                          paramidx: idxt_1711276406; val: bool): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_boolean".}
else:
  static :
    hint("Declaration of " & "duckdbbindboolean" &
        " already exists, not redeclaring")
when not declared(duckdbbindint8):
  proc duckdbbindint8*(preparedstatement: duckdbpreparedstatement_1711276509;
                       paramidx: idxt_1711276406; val: int8): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_int8".}
else:
  static :
    hint("Declaration of " & "duckdbbindint8" &
        " already exists, not redeclaring")
when not declared(duckdbbindint16):
  proc duckdbbindint16*(preparedstatement: duckdbpreparedstatement_1711276509;
                        paramidx: idxt_1711276406; val: int16): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_int16".}
else:
  static :
    hint("Declaration of " & "duckdbbindint16" &
        " already exists, not redeclaring")
when not declared(duckdbbindint32):
  proc duckdbbindint32*(preparedstatement: duckdbpreparedstatement_1711276509;
                        paramidx: idxt_1711276406; val: int32): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_int32".}
else:
  static :
    hint("Declaration of " & "duckdbbindint32" &
        " already exists, not redeclaring")
when not declared(duckdbbindint64):
  proc duckdbbindint64*(preparedstatement: duckdbpreparedstatement_1711276509;
                        paramidx: idxt_1711276406; val: int64): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_int64".}
else:
  static :
    hint("Declaration of " & "duckdbbindint64" &
        " already exists, not redeclaring")
when not declared(duckdbbindhugeint):
  proc duckdbbindhugeint*(preparedstatement: duckdbpreparedstatement_1711276509;
                          paramidx: idxt_1711276406; val: duckdbhugeint_1711276450): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_hugeint".}
else:
  static :
    hint("Declaration of " & "duckdbbindhugeint" &
        " already exists, not redeclaring")
when not declared(duckdbbinduhugeint):
  proc duckdbbinduhugeint*(preparedstatement: duckdbpreparedstatement_1711276509;
                           paramidx: idxt_1711276406; val: duckdbuhugeint_1711276454): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_uhugeint".}
else:
  static :
    hint("Declaration of " & "duckdbbinduhugeint" &
        " already exists, not redeclaring")
when not declared(duckdbbinddecimal):
  proc duckdbbinddecimal*(preparedstatement: duckdbpreparedstatement_1711276509;
                          paramidx: idxt_1711276406; val: duckdbdecimal_1711276458): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_decimal".}
else:
  static :
    hint("Declaration of " & "duckdbbinddecimal" &
        " already exists, not redeclaring")
when not declared(duckdbbinduint8):
  proc duckdbbinduint8*(preparedstatement: duckdbpreparedstatement_1711276509;
                        paramidx: idxt_1711276406; val: uint8): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_uint8".}
else:
  static :
    hint("Declaration of " & "duckdbbinduint8" &
        " already exists, not redeclaring")
when not declared(duckdbbinduint16):
  proc duckdbbinduint16*(preparedstatement: duckdbpreparedstatement_1711276509;
                         paramidx: idxt_1711276406; val: uint16): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_uint16".}
else:
  static :
    hint("Declaration of " & "duckdbbinduint16" &
        " already exists, not redeclaring")
when not declared(duckdbbinduint32):
  proc duckdbbinduint32*(preparedstatement: duckdbpreparedstatement_1711276509;
                         paramidx: idxt_1711276406; val: uint32): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_uint32".}
else:
  static :
    hint("Declaration of " & "duckdbbinduint32" &
        " already exists, not redeclaring")
when not declared(duckdbbinduint64):
  proc duckdbbinduint64*(preparedstatement: duckdbpreparedstatement_1711276509;
                         paramidx: idxt_1711276406; val: uint64): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_uint64".}
else:
  static :
    hint("Declaration of " & "duckdbbinduint64" &
        " already exists, not redeclaring")
when not declared(duckdbbindfloat):
  proc duckdbbindfloat*(preparedstatement: duckdbpreparedstatement_1711276509;
                        paramidx: idxt_1711276406; val: cfloat): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_float".}
else:
  static :
    hint("Declaration of " & "duckdbbindfloat" &
        " already exists, not redeclaring")
when not declared(duckdbbinddouble):
  proc duckdbbinddouble*(preparedstatement: duckdbpreparedstatement_1711276509;
                         paramidx: idxt_1711276406; val: cdouble): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_double".}
else:
  static :
    hint("Declaration of " & "duckdbbinddouble" &
        " already exists, not redeclaring")
when not declared(duckdbbinddate):
  proc duckdbbinddate*(preparedstatement: duckdbpreparedstatement_1711276509;
                       paramidx: idxt_1711276406; val: duckdbdate_1711276414): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_date".}
else:
  static :
    hint("Declaration of " & "duckdbbinddate" &
        " already exists, not redeclaring")
when not declared(duckdbbindtime):
  proc duckdbbindtime*(preparedstatement: duckdbpreparedstatement_1711276509;
                       paramidx: idxt_1711276406; val: duckdbtime_1711276422): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_time".}
else:
  static :
    hint("Declaration of " & "duckdbbindtime" &
        " already exists, not redeclaring")
when not declared(duckdbbindtimestamp):
  proc duckdbbindtimestamp*(preparedstatement: duckdbpreparedstatement_1711276509;
                            paramidx: idxt_1711276406; val: duckdbtimestamp_1711276438): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbbindtimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbbindinterval):
  proc duckdbbindinterval*(preparedstatement: duckdbpreparedstatement_1711276509;
                           paramidx: idxt_1711276406; val: duckdbinterval_1711276446): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_interval".}
else:
  static :
    hint("Declaration of " & "duckdbbindinterval" &
        " already exists, not redeclaring")
when not declared(duckdbbindvarchar):
  proc duckdbbindvarchar*(preparedstatement: duckdbpreparedstatement_1711276509;
                          paramidx: idxt_1711276406; val: cstring): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_varchar".}
else:
  static :
    hint("Declaration of " & "duckdbbindvarchar" &
        " already exists, not redeclaring")
when not declared(duckdbbindvarcharlength):
  proc duckdbbindvarcharlength*(preparedstatement: duckdbpreparedstatement_1711276509;
                                paramidx: idxt_1711276406; val: cstring;
                                length: idxt_1711276406): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_varchar_length".}
else:
  static :
    hint("Declaration of " & "duckdbbindvarcharlength" &
        " already exists, not redeclaring")
when not declared(duckdbbindblob):
  proc duckdbbindblob*(preparedstatement: duckdbpreparedstatement_1711276509;
                       paramidx: idxt_1711276406; data: pointer; length: idxt_1711276406): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_blob".}
else:
  static :
    hint("Declaration of " & "duckdbbindblob" &
        " already exists, not redeclaring")
when not declared(duckdbbindnull):
  proc duckdbbindnull*(preparedstatement: duckdbpreparedstatement_1711276509;
                       paramidx: idxt_1711276406): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_bind_null".}
else:
  static :
    hint("Declaration of " & "duckdbbindnull" &
        " already exists, not redeclaring")
when not declared(duckdbexecuteprepared):
  proc duckdbexecuteprepared*(preparedstatement: duckdbpreparedstatement_1711276509;
                              outresult: ptr duckdbresult_1711276497): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_execute_prepared".}
else:
  static :
    hint("Declaration of " & "duckdbexecuteprepared" &
        " already exists, not redeclaring")
when not declared(duckdbexecutepreparedstreaming):
  proc duckdbexecutepreparedstreaming*(preparedstatement: duckdbpreparedstatement_1711276509;
                                       outresult: ptr duckdbresult_1711276497): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_execute_prepared_streaming".}
else:
  static :
    hint("Declaration of " & "duckdbexecutepreparedstreaming" &
        " already exists, not redeclaring")
when not declared(duckdbextractstatements):
  proc duckdbextractstatements*(connection: duckdbconnection_1711276505;
                                query: cstring; outextractedstatements: ptr duckdbextractedstatements_1711276513): idxt_1711276406 {.
      cdecl, importc: "duckdb_extract_statements".}
else:
  static :
    hint("Declaration of " & "duckdbextractstatements" &
        " already exists, not redeclaring")
when not declared(duckdbprepareextractedstatement):
  proc duckdbprepareextractedstatement*(connection: duckdbconnection_1711276505;
      extractedstatements: duckdbextractedstatements_1711276513; index: idxt_1711276406;
      outpreparedstatement: ptr duckdbpreparedstatement_1711276509): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_prepare_extracted_statement".}
else:
  static :
    hint("Declaration of " & "duckdbprepareextractedstatement" &
        " already exists, not redeclaring")
when not declared(duckdbextractstatementserror):
  proc duckdbextractstatementserror*(extractedstatements: duckdbextractedstatements_1711276513): cstring {.
      cdecl, importc: "duckdb_extract_statements_error".}
else:
  static :
    hint("Declaration of " & "duckdbextractstatementserror" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyextracted):
  proc duckdbdestroyextracted*(extractedstatements: ptr duckdbextractedstatements_1711276513): void {.
      cdecl, importc: "duckdb_destroy_extracted".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyextracted" &
        " already exists, not redeclaring")
when not declared(duckdbpendingprepared):
  proc duckdbpendingprepared*(preparedstatement: duckdbpreparedstatement_1711276509;
                              outresult: ptr duckdbpendingresult_1711276517): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_pending_prepared".}
else:
  static :
    hint("Declaration of " & "duckdbpendingprepared" &
        " already exists, not redeclaring")
when not declared(duckdbpendingpreparedstreaming):
  proc duckdbpendingpreparedstreaming*(preparedstatement: duckdbpreparedstatement_1711276509;
                                       outresult: ptr duckdbpendingresult_1711276517): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_pending_prepared_streaming".}
else:
  static :
    hint("Declaration of " & "duckdbpendingpreparedstreaming" &
        " already exists, not redeclaring")
when not declared(duckdbdestroypending):
  proc duckdbdestroypending*(pendingresult: ptr duckdbpendingresult_1711276517): void {.
      cdecl, importc: "duckdb_destroy_pending".}
else:
  static :
    hint("Declaration of " & "duckdbdestroypending" &
        " already exists, not redeclaring")
when not declared(duckdbpendingerror):
  proc duckdbpendingerror*(pendingresult: duckdbpendingresult_1711276517): cstring {.
      cdecl, importc: "duckdb_pending_error".}
else:
  static :
    hint("Declaration of " & "duckdbpendingerror" &
        " already exists, not redeclaring")
when not declared(duckdbpendingexecutetask):
  proc duckdbpendingexecutetask*(pendingresult: duckdbpendingresult_1711276517): duckdbpendingstate_1711276396 {.
      cdecl, importc: "duckdb_pending_execute_task".}
else:
  static :
    hint("Declaration of " & "duckdbpendingexecutetask" &
        " already exists, not redeclaring")
when not declared(duckdbpendingexecutecheckstate):
  proc duckdbpendingexecutecheckstate*(pendingresult: duckdbpendingresult_1711276517): duckdbpendingstate_1711276396 {.
      cdecl, importc: "duckdb_pending_execute_check_state".}
else:
  static :
    hint("Declaration of " & "duckdbpendingexecutecheckstate" &
        " already exists, not redeclaring")
when not declared(duckdbexecutepending):
  proc duckdbexecutepending*(pendingresult: duckdbpendingresult_1711276517;
                             outresult: ptr duckdbresult_1711276497): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_execute_pending".}
else:
  static :
    hint("Declaration of " & "duckdbexecutepending" &
        " already exists, not redeclaring")
when not declared(duckdbpendingexecutionisfinished):
  proc duckdbpendingexecutionisfinished*(pendingstate: duckdbpendingstate_1711276396): bool {.
      cdecl, importc: "duckdb_pending_execution_is_finished".}
else:
  static :
    hint("Declaration of " & "duckdbpendingexecutionisfinished" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyvalue):
  proc duckdbdestroyvalue*(value: ptr duckdbvalue_1711276537): void {.cdecl,
      importc: "duckdb_destroy_value".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyvalue" &
        " already exists, not redeclaring")
when not declared(duckdbcreatevarchar):
  proc duckdbcreatevarchar*(text: cstring): duckdbvalue_1711276537 {.cdecl,
      importc: "duckdb_create_varchar".}
else:
  static :
    hint("Declaration of " & "duckdbcreatevarchar" &
        " already exists, not redeclaring")
when not declared(duckdbcreatevarcharlength):
  proc duckdbcreatevarcharlength*(text: cstring; length: idxt_1711276406): duckdbvalue_1711276537 {.
      cdecl, importc: "duckdb_create_varchar_length".}
else:
  static :
    hint("Declaration of " & "duckdbcreatevarcharlength" &
        " already exists, not redeclaring")
when not declared(duckdbcreateint64):
  proc duckdbcreateint64*(val: int64): duckdbvalue_1711276537 {.cdecl,
      importc: "duckdb_create_int64".}
else:
  static :
    hint("Declaration of " & "duckdbcreateint64" &
        " already exists, not redeclaring")
when not declared(duckdbcreatestructvalue):
  proc duckdbcreatestructvalue*(typearg: duckdblogicaltype_1711276529;
                                values: ptr duckdbvalue_1711276537): duckdbvalue_1711276537 {.
      cdecl, importc: "duckdb_create_struct_value".}
else:
  static :
    hint("Declaration of " & "duckdbcreatestructvalue" &
        " already exists, not redeclaring")
when not declared(duckdbcreatelistvalue):
  proc duckdbcreatelistvalue*(typearg: duckdblogicaltype_1711276529;
                              values: ptr duckdbvalue_1711276537;
                              valuecount: idxt_1711276406): duckdbvalue_1711276537 {.
      cdecl, importc: "duckdb_create_list_value".}
else:
  static :
    hint("Declaration of " & "duckdbcreatelistvalue" &
        " already exists, not redeclaring")
when not declared(duckdbcreatearrayvalue):
  proc duckdbcreatearrayvalue*(typearg: duckdblogicaltype_1711276529;
                               values: ptr duckdbvalue_1711276537;
                               valuecount: idxt_1711276406): duckdbvalue_1711276537 {.
      cdecl, importc: "duckdb_create_array_value".}
else:
  static :
    hint("Declaration of " & "duckdbcreatearrayvalue" &
        " already exists, not redeclaring")
when not declared(duckdbgetvarchar):
  proc duckdbgetvarchar*(value: duckdbvalue_1711276537): cstring {.cdecl,
      importc: "duckdb_get_varchar".}
else:
  static :
    hint("Declaration of " & "duckdbgetvarchar" &
        " already exists, not redeclaring")
when not declared(duckdbgetint64):
  proc duckdbgetint64*(value: duckdbvalue_1711276537): int64 {.cdecl,
      importc: "duckdb_get_int64".}
else:
  static :
    hint("Declaration of " & "duckdbgetint64" &
        " already exists, not redeclaring")
when not declared(duckdbcreatelogicaltype):
  proc duckdbcreatelogicaltype*(typearg: duckdbtype_1711276388): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_create_logical_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatelogicaltype" &
        " already exists, not redeclaring")
when not declared(duckdblogicaltypegetalias):
  proc duckdblogicaltypegetalias*(typearg: duckdblogicaltype_1711276529): cstring {.
      cdecl, importc: "duckdb_logical_type_get_alias".}
else:
  static :
    hint("Declaration of " & "duckdblogicaltypegetalias" &
        " already exists, not redeclaring")
when not declared(duckdbcreatelisttype):
  proc duckdbcreatelisttype*(typearg: duckdblogicaltype_1711276529): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_create_list_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatelisttype" &
        " already exists, not redeclaring")
when not declared(duckdbcreatearraytype):
  proc duckdbcreatearraytype*(typearg: duckdblogicaltype_1711276529;
                              arraysize: idxt_1711276406): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_create_array_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatearraytype" &
        " already exists, not redeclaring")
when not declared(duckdbcreatemaptype):
  proc duckdbcreatemaptype*(keytype: duckdblogicaltype_1711276529;
                            valuetype: duckdblogicaltype_1711276529): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_create_map_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatemaptype" &
        " already exists, not redeclaring")
when not declared(duckdbcreateuniontype):
  proc duckdbcreateuniontype*(membertypes: ptr duckdblogicaltype_1711276529;
                              membernames: ptr cstring; membercount: idxt_1711276406): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_create_union_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreateuniontype" &
        " already exists, not redeclaring")
when not declared(duckdbcreatestructtype):
  proc duckdbcreatestructtype*(membertypes: ptr duckdblogicaltype_1711276529;
                               membernames: ptr cstring; membercount: idxt_1711276406): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_create_struct_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatestructtype" &
        " already exists, not redeclaring")
when not declared(duckdbcreateenumtype):
  proc duckdbcreateenumtype*(membernames: ptr cstring; membercount: idxt_1711276406): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_create_enum_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreateenumtype" &
        " already exists, not redeclaring")
when not declared(duckdbcreatedecimaltype):
  proc duckdbcreatedecimaltype*(width: uint8; scale: uint8): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_create_decimal_type".}
else:
  static :
    hint("Declaration of " & "duckdbcreatedecimaltype" &
        " already exists, not redeclaring")
when not declared(duckdbgettypeid):
  proc duckdbgettypeid*(typearg: duckdblogicaltype_1711276529): duckdbtype_1711276388 {.
      cdecl, importc: "duckdb_get_type_id".}
else:
  static :
    hint("Declaration of " & "duckdbgettypeid" &
        " already exists, not redeclaring")
when not declared(duckdbdecimalwidth):
  proc duckdbdecimalwidth*(typearg: duckdblogicaltype_1711276529): uint8 {.
      cdecl, importc: "duckdb_decimal_width".}
else:
  static :
    hint("Declaration of " & "duckdbdecimalwidth" &
        " already exists, not redeclaring")
when not declared(duckdbdecimalscale):
  proc duckdbdecimalscale*(typearg: duckdblogicaltype_1711276529): uint8 {.
      cdecl, importc: "duckdb_decimal_scale".}
else:
  static :
    hint("Declaration of " & "duckdbdecimalscale" &
        " already exists, not redeclaring")
when not declared(duckdbdecimalinternaltype):
  proc duckdbdecimalinternaltype*(typearg: duckdblogicaltype_1711276529): duckdbtype_1711276388 {.
      cdecl, importc: "duckdb_decimal_internal_type".}
else:
  static :
    hint("Declaration of " & "duckdbdecimalinternaltype" &
        " already exists, not redeclaring")
when not declared(duckdbenuminternaltype):
  proc duckdbenuminternaltype*(typearg: duckdblogicaltype_1711276529): duckdbtype_1711276388 {.
      cdecl, importc: "duckdb_enum_internal_type".}
else:
  static :
    hint("Declaration of " & "duckdbenuminternaltype" &
        " already exists, not redeclaring")
when not declared(duckdbenumdictionarysize):
  proc duckdbenumdictionarysize*(typearg: duckdblogicaltype_1711276529): uint32 {.
      cdecl, importc: "duckdb_enum_dictionary_size".}
else:
  static :
    hint("Declaration of " & "duckdbenumdictionarysize" &
        " already exists, not redeclaring")
when not declared(duckdbenumdictionaryvalue):
  proc duckdbenumdictionaryvalue*(typearg: duckdblogicaltype_1711276529;
                                  index: idxt_1711276406): cstring {.cdecl,
      importc: "duckdb_enum_dictionary_value".}
else:
  static :
    hint("Declaration of " & "duckdbenumdictionaryvalue" &
        " already exists, not redeclaring")
when not declared(duckdblisttypechildtype):
  proc duckdblisttypechildtype*(typearg: duckdblogicaltype_1711276529): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_list_type_child_type".}
else:
  static :
    hint("Declaration of " & "duckdblisttypechildtype" &
        " already exists, not redeclaring")
when not declared(duckdbarraytypechildtype):
  proc duckdbarraytypechildtype*(typearg: duckdblogicaltype_1711276529): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_array_type_child_type".}
else:
  static :
    hint("Declaration of " & "duckdbarraytypechildtype" &
        " already exists, not redeclaring")
when not declared(duckdbarraytypearraysize):
  proc duckdbarraytypearraysize*(typearg: duckdblogicaltype_1711276529): idxt_1711276406 {.
      cdecl, importc: "duckdb_array_type_array_size".}
else:
  static :
    hint("Declaration of " & "duckdbarraytypearraysize" &
        " already exists, not redeclaring")
when not declared(duckdbmaptypekeytype):
  proc duckdbmaptypekeytype*(typearg: duckdblogicaltype_1711276529): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_map_type_key_type".}
else:
  static :
    hint("Declaration of " & "duckdbmaptypekeytype" &
        " already exists, not redeclaring")
when not declared(duckdbmaptypevaluetype):
  proc duckdbmaptypevaluetype*(typearg: duckdblogicaltype_1711276529): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_map_type_value_type".}
else:
  static :
    hint("Declaration of " & "duckdbmaptypevaluetype" &
        " already exists, not redeclaring")
when not declared(duckdbstructtypechildcount):
  proc duckdbstructtypechildcount*(typearg: duckdblogicaltype_1711276529): idxt_1711276406 {.
      cdecl, importc: "duckdb_struct_type_child_count".}
else:
  static :
    hint("Declaration of " & "duckdbstructtypechildcount" &
        " already exists, not redeclaring")
when not declared(duckdbstructtypechildname):
  proc duckdbstructtypechildname*(typearg: duckdblogicaltype_1711276529;
                                  index: idxt_1711276406): cstring {.cdecl,
      importc: "duckdb_struct_type_child_name".}
else:
  static :
    hint("Declaration of " & "duckdbstructtypechildname" &
        " already exists, not redeclaring")
when not declared(duckdbstructtypechildtype):
  proc duckdbstructtypechildtype*(typearg: duckdblogicaltype_1711276529;
                                  index: idxt_1711276406): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_struct_type_child_type".}
else:
  static :
    hint("Declaration of " & "duckdbstructtypechildtype" &
        " already exists, not redeclaring")
when not declared(duckdbuniontypemembercount):
  proc duckdbuniontypemembercount*(typearg: duckdblogicaltype_1711276529): idxt_1711276406 {.
      cdecl, importc: "duckdb_union_type_member_count".}
else:
  static :
    hint("Declaration of " & "duckdbuniontypemembercount" &
        " already exists, not redeclaring")
when not declared(duckdbuniontypemembername):
  proc duckdbuniontypemembername*(typearg: duckdblogicaltype_1711276529;
                                  index: idxt_1711276406): cstring {.cdecl,
      importc: "duckdb_union_type_member_name".}
else:
  static :
    hint("Declaration of " & "duckdbuniontypemembername" &
        " already exists, not redeclaring")
when not declared(duckdbuniontypemembertype):
  proc duckdbuniontypemembertype*(typearg: duckdblogicaltype_1711276529;
                                  index: idxt_1711276406): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_union_type_member_type".}
else:
  static :
    hint("Declaration of " & "duckdbuniontypemembertype" &
        " already exists, not redeclaring")
when not declared(duckdbdestroylogicaltype):
  proc duckdbdestroylogicaltype*(typearg: ptr duckdblogicaltype_1711276529): void {.
      cdecl, importc: "duckdb_destroy_logical_type".}
else:
  static :
    hint("Declaration of " & "duckdbdestroylogicaltype" &
        " already exists, not redeclaring")
when not declared(duckdbcreatedatachunk):
  proc duckdbcreatedatachunk*(types: ptr duckdblogicaltype_1711276529;
                              columncount: idxt_1711276406): duckdbdatachunk_1711276533 {.
      cdecl, importc: "duckdb_create_data_chunk".}
else:
  static :
    hint("Declaration of " & "duckdbcreatedatachunk" &
        " already exists, not redeclaring")
when not declared(duckdbdestroydatachunk):
  proc duckdbdestroydatachunk*(chunk: ptr duckdbdatachunk_1711276533): void {.
      cdecl, importc: "duckdb_destroy_data_chunk".}
else:
  static :
    hint("Declaration of " & "duckdbdestroydatachunk" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunkreset):
  proc duckdbdatachunkreset*(chunk: duckdbdatachunk_1711276533): void {.cdecl,
      importc: "duckdb_data_chunk_reset".}
else:
  static :
    hint("Declaration of " & "duckdbdatachunkreset" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunkgetcolumncount):
  proc duckdbdatachunkgetcolumncount*(chunk: duckdbdatachunk_1711276533): idxt_1711276406 {.
      cdecl, importc: "duckdb_data_chunk_get_column_count".}
else:
  static :
    hint("Declaration of " & "duckdbdatachunkgetcolumncount" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunkgetvector):
  proc duckdbdatachunkgetvector*(chunk: duckdbdatachunk_1711276533; colidx: idxt_1711276406): duckdbvector_1711276485 {.
      cdecl, importc: "duckdb_data_chunk_get_vector".}
else:
  static :
    hint("Declaration of " & "duckdbdatachunkgetvector" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunkgetsize):
  proc duckdbdatachunkgetsize*(chunk: duckdbdatachunk_1711276533): idxt_1711276406 {.
      cdecl, importc: "duckdb_data_chunk_get_size".}
else:
  static :
    hint("Declaration of " & "duckdbdatachunkgetsize" &
        " already exists, not redeclaring")
when not declared(duckdbdatachunksetsize):
  proc duckdbdatachunksetsize*(chunk: duckdbdatachunk_1711276533; size: idxt_1711276406): void {.
      cdecl, importc: "duckdb_data_chunk_set_size".}
else:
  static :
    hint("Declaration of " & "duckdbdatachunksetsize" &
        " already exists, not redeclaring")
when not declared(duckdbvectorgetcolumntype):
  proc duckdbvectorgetcolumntype*(vector: duckdbvector_1711276485): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_vector_get_column_type".}
else:
  static :
    hint("Declaration of " & "duckdbvectorgetcolumntype" &
        " already exists, not redeclaring")
when not declared(duckdbvectorgetdata):
  proc duckdbvectorgetdata*(vector: duckdbvector_1711276485): pointer {.cdecl,
      importc: "duckdb_vector_get_data".}
else:
  static :
    hint("Declaration of " & "duckdbvectorgetdata" &
        " already exists, not redeclaring")
when not declared(duckdbvectorgetvalidity):
  proc duckdbvectorgetvalidity*(vector: duckdbvector_1711276485): ptr uint64 {.
      cdecl, importc: "duckdb_vector_get_validity".}
else:
  static :
    hint("Declaration of " & "duckdbvectorgetvalidity" &
        " already exists, not redeclaring")
when not declared(duckdbvectorensurevaliditywritable):
  proc duckdbvectorensurevaliditywritable*(vector: duckdbvector_1711276485): void {.
      cdecl, importc: "duckdb_vector_ensure_validity_writable".}
else:
  static :
    hint("Declaration of " & "duckdbvectorensurevaliditywritable" &
        " already exists, not redeclaring")
when not declared(duckdbvectorassignstringelement):
  proc duckdbvectorassignstringelement*(vector: duckdbvector_1711276485;
                                        index: idxt_1711276406; str: cstring): void {.
      cdecl, importc: "duckdb_vector_assign_string_element".}
else:
  static :
    hint("Declaration of " & "duckdbvectorassignstringelement" &
        " already exists, not redeclaring")
when not declared(duckdbvectorassignstringelementlen):
  proc duckdbvectorassignstringelementlen*(vector: duckdbvector_1711276485;
      index: idxt_1711276406; str: cstring; strlen: idxt_1711276406): void {.
      cdecl, importc: "duckdb_vector_assign_string_element_len".}
else:
  static :
    hint("Declaration of " & "duckdbvectorassignstringelementlen" &
        " already exists, not redeclaring")
when not declared(duckdblistvectorgetchild):
  proc duckdblistvectorgetchild*(vector: duckdbvector_1711276485): duckdbvector_1711276485 {.
      cdecl, importc: "duckdb_list_vector_get_child".}
else:
  static :
    hint("Declaration of " & "duckdblistvectorgetchild" &
        " already exists, not redeclaring")
when not declared(duckdblistvectorgetsize):
  proc duckdblistvectorgetsize*(vector: duckdbvector_1711276485): idxt_1711276406 {.
      cdecl, importc: "duckdb_list_vector_get_size".}
else:
  static :
    hint("Declaration of " & "duckdblistvectorgetsize" &
        " already exists, not redeclaring")
when not declared(duckdblistvectorsetsize):
  proc duckdblistvectorsetsize*(vector: duckdbvector_1711276485; size: idxt_1711276406): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_list_vector_set_size".}
else:
  static :
    hint("Declaration of " & "duckdblistvectorsetsize" &
        " already exists, not redeclaring")
when not declared(duckdblistvectorreserve):
  proc duckdblistvectorreserve*(vector: duckdbvector_1711276485;
                                requiredcapacity: idxt_1711276406): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_list_vector_reserve".}
else:
  static :
    hint("Declaration of " & "duckdblistvectorreserve" &
        " already exists, not redeclaring")
when not declared(duckdbstructvectorgetchild):
  proc duckdbstructvectorgetchild*(vector: duckdbvector_1711276485; index: idxt_1711276406): duckdbvector_1711276485 {.
      cdecl, importc: "duckdb_struct_vector_get_child".}
else:
  static :
    hint("Declaration of " & "duckdbstructvectorgetchild" &
        " already exists, not redeclaring")
when not declared(duckdbarrayvectorgetchild):
  proc duckdbarrayvectorgetchild*(vector: duckdbvector_1711276485): duckdbvector_1711276485 {.
      cdecl, importc: "duckdb_array_vector_get_child".}
else:
  static :
    hint("Declaration of " & "duckdbarrayvectorgetchild" &
        " already exists, not redeclaring")
when not declared(duckdbvalidityrowisvalid):
  proc duckdbvalidityrowisvalid*(validity: ptr uint64; row: idxt_1711276406): bool {.
      cdecl, importc: "duckdb_validity_row_is_valid".}
else:
  static :
    hint("Declaration of " & "duckdbvalidityrowisvalid" &
        " already exists, not redeclaring")
when not declared(duckdbvaliditysetrowvalidity):
  proc duckdbvaliditysetrowvalidity*(validity: ptr uint64; row: idxt_1711276406;
                                     valid: bool): void {.cdecl,
      importc: "duckdb_validity_set_row_validity".}
else:
  static :
    hint("Declaration of " & "duckdbvaliditysetrowvalidity" &
        " already exists, not redeclaring")
when not declared(duckdbvaliditysetrowinvalid):
  proc duckdbvaliditysetrowinvalid*(validity: ptr uint64; row: idxt_1711276406): void {.
      cdecl, importc: "duckdb_validity_set_row_invalid".}
else:
  static :
    hint("Declaration of " & "duckdbvaliditysetrowinvalid" &
        " already exists, not redeclaring")
when not declared(duckdbvaliditysetrowvalid):
  proc duckdbvaliditysetrowvalid*(validity: ptr uint64; row: idxt_1711276406): void {.
      cdecl, importc: "duckdb_validity_set_row_valid".}
else:
  static :
    hint("Declaration of " & "duckdbvaliditysetrowvalid" &
        " already exists, not redeclaring")
when not declared(duckdbcreatetablefunction):
  proc duckdbcreatetablefunction*(): duckdbtablefunction_1711276539 {.cdecl,
      importc: "duckdb_create_table_function".}
else:
  static :
    hint("Declaration of " & "duckdbcreatetablefunction" &
        " already exists, not redeclaring")
when not declared(duckdbdestroytablefunction):
  proc duckdbdestroytablefunction*(tablefunction: ptr duckdbtablefunction_1711276539): void {.
      cdecl, importc: "duckdb_destroy_table_function".}
else:
  static :
    hint("Declaration of " & "duckdbdestroytablefunction" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetname):
  proc duckdbtablefunctionsetname*(tablefunction: duckdbtablefunction_1711276539;
                                   name: cstring): void {.cdecl,
      importc: "duckdb_table_function_set_name".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetname" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionaddparameter):
  proc duckdbtablefunctionaddparameter*(tablefunction: duckdbtablefunction_1711276539;
                                        typearg: duckdblogicaltype_1711276529): void {.
      cdecl, importc: "duckdb_table_function_add_parameter".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionaddparameter" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionaddnamedparameter):
  proc duckdbtablefunctionaddnamedparameter*(tablefunction: duckdbtablefunction_1711276539;
      name: cstring; typearg: duckdblogicaltype_1711276529): void {.cdecl,
      importc: "duckdb_table_function_add_named_parameter".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionaddnamedparameter" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetextrainfo):
  proc duckdbtablefunctionsetextrainfo*(tablefunction: duckdbtablefunction_1711276539;
                                        extrainfo: pointer;
                                        destroy: duckdbdeletecallbackt_1711276408): void {.
      cdecl, importc: "duckdb_table_function_set_extra_info".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetextrainfo" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetbind):
  proc duckdbtablefunctionsetbind*(tablefunction: duckdbtablefunction_1711276539;
                                   bindarg: duckdbtablefunctionbindt_1711276547): void {.
      cdecl, importc: "duckdb_table_function_set_bind".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetbind" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetinit):
  proc duckdbtablefunctionsetinit*(tablefunction: duckdbtablefunction_1711276539;
                                   init: duckdbtablefunctioninitt_1711276549): void {.
      cdecl, importc: "duckdb_table_function_set_init".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetinit" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetlocalinit):
  proc duckdbtablefunctionsetlocalinit*(tablefunction: duckdbtablefunction_1711276539;
                                        init: duckdbtablefunctioninitt_1711276549): void {.
      cdecl, importc: "duckdb_table_function_set_local_init".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetlocalinit" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsetfunction):
  proc duckdbtablefunctionsetfunction*(tablefunction: duckdbtablefunction_1711276539;
                                       function: duckdbtablefunctiont_1711276551): void {.
      cdecl, importc: "duckdb_table_function_set_function".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsetfunction" &
        " already exists, not redeclaring")
when not declared(duckdbtablefunctionsupportsprojectionpushdown):
  proc duckdbtablefunctionsupportsprojectionpushdown*(
      tablefunction: duckdbtablefunction_1711276539; pushdown: bool): void {.
      cdecl, importc: "duckdb_table_function_supports_projection_pushdown".}
else:
  static :
    hint("Declaration of " & "duckdbtablefunctionsupportsprojectionpushdown" &
        " already exists, not redeclaring")
when not declared(duckdbregistertablefunction):
  proc duckdbregistertablefunction*(con: duckdbconnection_1711276505;
                                    function: duckdbtablefunction_1711276539): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_register_table_function".}
else:
  static :
    hint("Declaration of " & "duckdbregistertablefunction" &
        " already exists, not redeclaring")
when not declared(duckdbbindgetextrainfo):
  proc duckdbbindgetextrainfo*(info: duckdbbindinfo_1711276541): pointer {.
      cdecl, importc: "duckdb_bind_get_extra_info".}
else:
  static :
    hint("Declaration of " & "duckdbbindgetextrainfo" &
        " already exists, not redeclaring")
when not declared(duckdbbindaddresultcolumn):
  proc duckdbbindaddresultcolumn*(info: duckdbbindinfo_1711276541;
                                  name: cstring; typearg: duckdblogicaltype_1711276529): void {.
      cdecl, importc: "duckdb_bind_add_result_column".}
else:
  static :
    hint("Declaration of " & "duckdbbindaddresultcolumn" &
        " already exists, not redeclaring")
when not declared(duckdbbindgetparametercount):
  proc duckdbbindgetparametercount*(info: duckdbbindinfo_1711276541): idxt_1711276406 {.
      cdecl, importc: "duckdb_bind_get_parameter_count".}
else:
  static :
    hint("Declaration of " & "duckdbbindgetparametercount" &
        " already exists, not redeclaring")
when not declared(duckdbbindgetparameter):
  proc duckdbbindgetparameter*(info: duckdbbindinfo_1711276541; index: idxt_1711276406): duckdbvalue_1711276537 {.
      cdecl, importc: "duckdb_bind_get_parameter".}
else:
  static :
    hint("Declaration of " & "duckdbbindgetparameter" &
        " already exists, not redeclaring")
when not declared(duckdbbindgetnamedparameter):
  proc duckdbbindgetnamedparameter*(info: duckdbbindinfo_1711276541;
                                    name: cstring): duckdbvalue_1711276537 {.
      cdecl, importc: "duckdb_bind_get_named_parameter".}
else:
  static :
    hint("Declaration of " & "duckdbbindgetnamedparameter" &
        " already exists, not redeclaring")
when not declared(duckdbbindsetbinddata):
  proc duckdbbindsetbinddata*(info: duckdbbindinfo_1711276541;
                              binddata: pointer; destroy: duckdbdeletecallbackt_1711276408): void {.
      cdecl, importc: "duckdb_bind_set_bind_data".}
else:
  static :
    hint("Declaration of " & "duckdbbindsetbinddata" &
        " already exists, not redeclaring")
when not declared(duckdbbindsetcardinality):
  proc duckdbbindsetcardinality*(info: duckdbbindinfo_1711276541;
                                 cardinality: idxt_1711276406; isexact: bool): void {.
      cdecl, importc: "duckdb_bind_set_cardinality".}
else:
  static :
    hint("Declaration of " & "duckdbbindsetcardinality" &
        " already exists, not redeclaring")
when not declared(duckdbbindseterror):
  proc duckdbbindseterror*(info: duckdbbindinfo_1711276541; error: cstring): void {.
      cdecl, importc: "duckdb_bind_set_error".}
else:
  static :
    hint("Declaration of " & "duckdbbindseterror" &
        " already exists, not redeclaring")
when not declared(duckdbinitgetextrainfo):
  proc duckdbinitgetextrainfo*(info: duckdbinitinfo_1711276543): pointer {.
      cdecl, importc: "duckdb_init_get_extra_info".}
else:
  static :
    hint("Declaration of " & "duckdbinitgetextrainfo" &
        " already exists, not redeclaring")
when not declared(duckdbinitgetbinddata):
  proc duckdbinitgetbinddata*(info: duckdbinitinfo_1711276543): pointer {.cdecl,
      importc: "duckdb_init_get_bind_data".}
else:
  static :
    hint("Declaration of " & "duckdbinitgetbinddata" &
        " already exists, not redeclaring")
when not declared(duckdbinitsetinitdata):
  proc duckdbinitsetinitdata*(info: duckdbinitinfo_1711276543;
                              initdata: pointer; destroy: duckdbdeletecallbackt_1711276408): void {.
      cdecl, importc: "duckdb_init_set_init_data".}
else:
  static :
    hint("Declaration of " & "duckdbinitsetinitdata" &
        " already exists, not redeclaring")
when not declared(duckdbinitgetcolumncount):
  proc duckdbinitgetcolumncount*(info: duckdbinitinfo_1711276543): idxt_1711276406 {.
      cdecl, importc: "duckdb_init_get_column_count".}
else:
  static :
    hint("Declaration of " & "duckdbinitgetcolumncount" &
        " already exists, not redeclaring")
when not declared(duckdbinitgetcolumnindex):
  proc duckdbinitgetcolumnindex*(info: duckdbinitinfo_1711276543;
                                 columnindex: idxt_1711276406): idxt_1711276406 {.
      cdecl, importc: "duckdb_init_get_column_index".}
else:
  static :
    hint("Declaration of " & "duckdbinitgetcolumnindex" &
        " already exists, not redeclaring")
when not declared(duckdbinitsetmaxthreads):
  proc duckdbinitsetmaxthreads*(info: duckdbinitinfo_1711276543;
                                maxthreads: idxt_1711276406): void {.cdecl,
      importc: "duckdb_init_set_max_threads".}
else:
  static :
    hint("Declaration of " & "duckdbinitsetmaxthreads" &
        " already exists, not redeclaring")
when not declared(duckdbinitseterror):
  proc duckdbinitseterror*(info: duckdbinitinfo_1711276543; error: cstring): void {.
      cdecl, importc: "duckdb_init_set_error".}
else:
  static :
    hint("Declaration of " & "duckdbinitseterror" &
        " already exists, not redeclaring")
when not declared(duckdbfunctiongetextrainfo):
  proc duckdbfunctiongetextrainfo*(info: duckdbfunctioninfo_1711276545): pointer {.
      cdecl, importc: "duckdb_function_get_extra_info".}
else:
  static :
    hint("Declaration of " & "duckdbfunctiongetextrainfo" &
        " already exists, not redeclaring")
when not declared(duckdbfunctiongetbinddata):
  proc duckdbfunctiongetbinddata*(info: duckdbfunctioninfo_1711276545): pointer {.
      cdecl, importc: "duckdb_function_get_bind_data".}
else:
  static :
    hint("Declaration of " & "duckdbfunctiongetbinddata" &
        " already exists, not redeclaring")
when not declared(duckdbfunctiongetinitdata):
  proc duckdbfunctiongetinitdata*(info: duckdbfunctioninfo_1711276545): pointer {.
      cdecl, importc: "duckdb_function_get_init_data".}
else:
  static :
    hint("Declaration of " & "duckdbfunctiongetinitdata" &
        " already exists, not redeclaring")
when not declared(duckdbfunctiongetlocalinitdata):
  proc duckdbfunctiongetlocalinitdata*(info: duckdbfunctioninfo_1711276545): pointer {.
      cdecl, importc: "duckdb_function_get_local_init_data".}
else:
  static :
    hint("Declaration of " & "duckdbfunctiongetlocalinitdata" &
        " already exists, not redeclaring")
when not declared(duckdbfunctionseterror):
  proc duckdbfunctionseterror*(info: duckdbfunctioninfo_1711276545;
                               error: cstring): void {.cdecl,
      importc: "duckdb_function_set_error".}
else:
  static :
    hint("Declaration of " & "duckdbfunctionseterror" &
        " already exists, not redeclaring")
when not declared(duckdbaddreplacementscan):
  proc duckdbaddreplacementscan*(db: duckdbdatabase_1711276501;
                                 replacement: duckdbreplacementcallbackt_1711276555;
                                 extradata: pointer;
                                 deletecallback: duckdbdeletecallbackt_1711276408): void {.
      cdecl, importc: "duckdb_add_replacement_scan".}
else:
  static :
    hint("Declaration of " & "duckdbaddreplacementscan" &
        " already exists, not redeclaring")
when not declared(duckdbreplacementscansetfunctionname):
  proc duckdbreplacementscansetfunctionname*(info: duckdbreplacementscaninfo_1711276553;
      functionname: cstring): void {.cdecl, importc: "duckdb_replacement_scan_set_function_name".}
else:
  static :
    hint("Declaration of " & "duckdbreplacementscansetfunctionname" &
        " already exists, not redeclaring")
when not declared(duckdbreplacementscanaddparameter):
  proc duckdbreplacementscanaddparameter*(info: duckdbreplacementscaninfo_1711276553;
      parameter: duckdbvalue_1711276537): void {.cdecl,
      importc: "duckdb_replacement_scan_add_parameter".}
else:
  static :
    hint("Declaration of " & "duckdbreplacementscanaddparameter" &
        " already exists, not redeclaring")
when not declared(duckdbreplacementscanseterror):
  proc duckdbreplacementscanseterror*(info: duckdbreplacementscaninfo_1711276553;
                                      error: cstring): void {.cdecl,
      importc: "duckdb_replacement_scan_set_error".}
else:
  static :
    hint("Declaration of " & "duckdbreplacementscanseterror" &
        " already exists, not redeclaring")
when not declared(duckdbappendercreate):
  proc duckdbappendercreate*(connection: duckdbconnection_1711276505;
                             schema: cstring; table: cstring;
                             outappender: ptr duckdbappender_1711276521): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_appender_create".}
else:
  static :
    hint("Declaration of " & "duckdbappendercreate" &
        " already exists, not redeclaring")
when not declared(duckdbappendercolumncount):
  proc duckdbappendercolumncount*(appender: duckdbappender_1711276521): idxt_1711276406 {.
      cdecl, importc: "duckdb_appender_column_count".}
else:
  static :
    hint("Declaration of " & "duckdbappendercolumncount" &
        " already exists, not redeclaring")
when not declared(duckdbappendercolumntype):
  proc duckdbappendercolumntype*(appender: duckdbappender_1711276521;
                                 colidx: idxt_1711276406): duckdblogicaltype_1711276529 {.
      cdecl, importc: "duckdb_appender_column_type".}
else:
  static :
    hint("Declaration of " & "duckdbappendercolumntype" &
        " already exists, not redeclaring")
when not declared(duckdbappendererror):
  proc duckdbappendererror*(appender: duckdbappender_1711276521): cstring {.
      cdecl, importc: "duckdb_appender_error".}
else:
  static :
    hint("Declaration of " & "duckdbappendererror" &
        " already exists, not redeclaring")
when not declared(duckdbappenderflush):
  proc duckdbappenderflush*(appender: duckdbappender_1711276521): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_appender_flush".}
else:
  static :
    hint("Declaration of " & "duckdbappenderflush" &
        " already exists, not redeclaring")
when not declared(duckdbappenderclose):
  proc duckdbappenderclose*(appender: duckdbappender_1711276521): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_appender_close".}
else:
  static :
    hint("Declaration of " & "duckdbappenderclose" &
        " already exists, not redeclaring")
when not declared(duckdbappenderdestroy):
  proc duckdbappenderdestroy*(appender: ptr duckdbappender_1711276521): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_appender_destroy".}
else:
  static :
    hint("Declaration of " & "duckdbappenderdestroy" &
        " already exists, not redeclaring")
when not declared(duckdbappenderbeginrow):
  proc duckdbappenderbeginrow*(appender: duckdbappender_1711276521): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_appender_begin_row".}
else:
  static :
    hint("Declaration of " & "duckdbappenderbeginrow" &
        " already exists, not redeclaring")
when not declared(duckdbappenderendrow):
  proc duckdbappenderendrow*(appender: duckdbappender_1711276521): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_appender_end_row".}
else:
  static :
    hint("Declaration of " & "duckdbappenderendrow" &
        " already exists, not redeclaring")
when not declared(duckdbappendbool):
  proc duckdbappendbool*(appender: duckdbappender_1711276521; value: bool): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_bool".}
else:
  static :
    hint("Declaration of " & "duckdbappendbool" &
        " already exists, not redeclaring")
when not declared(duckdbappendint8):
  proc duckdbappendint8*(appender: duckdbappender_1711276521; value: int8): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_int8".}
else:
  static :
    hint("Declaration of " & "duckdbappendint8" &
        " already exists, not redeclaring")
when not declared(duckdbappendint16):
  proc duckdbappendint16*(appender: duckdbappender_1711276521; value: int16): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_int16".}
else:
  static :
    hint("Declaration of " & "duckdbappendint16" &
        " already exists, not redeclaring")
when not declared(duckdbappendint32):
  proc duckdbappendint32*(appender: duckdbappender_1711276521; value: int32): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_int32".}
else:
  static :
    hint("Declaration of " & "duckdbappendint32" &
        " already exists, not redeclaring")
when not declared(duckdbappendint64):
  proc duckdbappendint64*(appender: duckdbappender_1711276521; value: int64): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_int64".}
else:
  static :
    hint("Declaration of " & "duckdbappendint64" &
        " already exists, not redeclaring")
when not declared(duckdbappendhugeint):
  proc duckdbappendhugeint*(appender: duckdbappender_1711276521;
                            value: duckdbhugeint_1711276450): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_hugeint".}
else:
  static :
    hint("Declaration of " & "duckdbappendhugeint" &
        " already exists, not redeclaring")
when not declared(duckdbappenduint8):
  proc duckdbappenduint8*(appender: duckdbappender_1711276521; value: uint8): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_uint8".}
else:
  static :
    hint("Declaration of " & "duckdbappenduint8" &
        " already exists, not redeclaring")
when not declared(duckdbappenduint16):
  proc duckdbappenduint16*(appender: duckdbappender_1711276521; value: uint16): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_uint16".}
else:
  static :
    hint("Declaration of " & "duckdbappenduint16" &
        " already exists, not redeclaring")
when not declared(duckdbappenduint32):
  proc duckdbappenduint32*(appender: duckdbappender_1711276521; value: uint32): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_uint32".}
else:
  static :
    hint("Declaration of " & "duckdbappenduint32" &
        " already exists, not redeclaring")
when not declared(duckdbappenduint64):
  proc duckdbappenduint64*(appender: duckdbappender_1711276521; value: uint64): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_uint64".}
else:
  static :
    hint("Declaration of " & "duckdbappenduint64" &
        " already exists, not redeclaring")
when not declared(duckdbappenduhugeint):
  proc duckdbappenduhugeint*(appender: duckdbappender_1711276521;
                             value: duckdbuhugeint_1711276454): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_uhugeint".}
else:
  static :
    hint("Declaration of " & "duckdbappenduhugeint" &
        " already exists, not redeclaring")
when not declared(duckdbappendfloat):
  proc duckdbappendfloat*(appender: duckdbappender_1711276521; value: cfloat): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_float".}
else:
  static :
    hint("Declaration of " & "duckdbappendfloat" &
        " already exists, not redeclaring")
when not declared(duckdbappenddouble):
  proc duckdbappenddouble*(appender: duckdbappender_1711276521; value: cdouble): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_double".}
else:
  static :
    hint("Declaration of " & "duckdbappenddouble" &
        " already exists, not redeclaring")
when not declared(duckdbappenddate):
  proc duckdbappenddate*(appender: duckdbappender_1711276521; value: duckdbdate_1711276414): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_date".}
else:
  static :
    hint("Declaration of " & "duckdbappenddate" &
        " already exists, not redeclaring")
when not declared(duckdbappendtime):
  proc duckdbappendtime*(appender: duckdbappender_1711276521; value: duckdbtime_1711276422): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_time".}
else:
  static :
    hint("Declaration of " & "duckdbappendtime" &
        " already exists, not redeclaring")
when not declared(duckdbappendtimestamp):
  proc duckdbappendtimestamp*(appender: duckdbappender_1711276521;
                              value: duckdbtimestamp_1711276438): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_timestamp".}
else:
  static :
    hint("Declaration of " & "duckdbappendtimestamp" &
        " already exists, not redeclaring")
when not declared(duckdbappendinterval):
  proc duckdbappendinterval*(appender: duckdbappender_1711276521;
                             value: duckdbinterval_1711276446): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_interval".}
else:
  static :
    hint("Declaration of " & "duckdbappendinterval" &
        " already exists, not redeclaring")
when not declared(duckdbappendvarchar):
  proc duckdbappendvarchar*(appender: duckdbappender_1711276521; val: cstring): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_varchar".}
else:
  static :
    hint("Declaration of " & "duckdbappendvarchar" &
        " already exists, not redeclaring")
when not declared(duckdbappendvarcharlength):
  proc duckdbappendvarcharlength*(appender: duckdbappender_1711276521;
                                  val: cstring; length: idxt_1711276406): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_varchar_length".}
else:
  static :
    hint("Declaration of " & "duckdbappendvarcharlength" &
        " already exists, not redeclaring")
when not declared(duckdbappendblob):
  proc duckdbappendblob*(appender: duckdbappender_1711276521; data: pointer;
                         length: idxt_1711276406): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_blob".}
else:
  static :
    hint("Declaration of " & "duckdbappendblob" &
        " already exists, not redeclaring")
when not declared(duckdbappendnull):
  proc duckdbappendnull*(appender: duckdbappender_1711276521): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_null".}
else:
  static :
    hint("Declaration of " & "duckdbappendnull" &
        " already exists, not redeclaring")
when not declared(duckdbappenddatachunk):
  proc duckdbappenddatachunk*(appender: duckdbappender_1711276521;
                              chunk: duckdbdatachunk_1711276533): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_append_data_chunk".}
else:
  static :
    hint("Declaration of " & "duckdbappenddatachunk" &
        " already exists, not redeclaring")
when not declared(duckdbqueryarrow):
  proc duckdbqueryarrow*(connection: duckdbconnection_1711276505;
                         query: cstring; outresult: ptr duckdbarrow_1711276559): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_query_arrow".}
else:
  static :
    hint("Declaration of " & "duckdbqueryarrow" &
        " already exists, not redeclaring")
when not declared(duckdbqueryarrowschema):
  proc duckdbqueryarrowschema*(result: duckdbarrow_1711276559;
                               outschema: ptr duckdbarrowschema_1711276567): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_query_arrow_schema".}
else:
  static :
    hint("Declaration of " & "duckdbqueryarrowschema" &
        " already exists, not redeclaring")
when not declared(duckdbpreparedarrowschema):
  proc duckdbpreparedarrowschema*(prepared: duckdbpreparedstatement_1711276509;
                                  outschema: ptr duckdbarrowschema_1711276567): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_prepared_arrow_schema".}
else:
  static :
    hint("Declaration of " & "duckdbpreparedarrowschema" &
        " already exists, not redeclaring")
when not declared(duckdbresultarrowarray):
  proc duckdbresultarrowarray*(result: duckdbresult_1711276497;
                               chunk: duckdbdatachunk_1711276533;
                               outarray: ptr duckdbarrowarray_1711276571): void {.
      cdecl, importc: "duckdb_result_arrow_array".}
else:
  static :
    hint("Declaration of " & "duckdbresultarrowarray" &
        " already exists, not redeclaring")
when not declared(duckdbqueryarrowarray):
  proc duckdbqueryarrowarray*(result: duckdbarrow_1711276559;
                              outarray: ptr duckdbarrowarray_1711276571): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_query_arrow_array".}
else:
  static :
    hint("Declaration of " & "duckdbqueryarrowarray" &
        " already exists, not redeclaring")
when not declared(duckdbarrowcolumncount):
  proc duckdbarrowcolumncount*(result: duckdbarrow_1711276559): idxt_1711276406 {.
      cdecl, importc: "duckdb_arrow_column_count".}
else:
  static :
    hint("Declaration of " & "duckdbarrowcolumncount" &
        " already exists, not redeclaring")
when not declared(duckdbarrowrowcount):
  proc duckdbarrowrowcount*(result: duckdbarrow_1711276559): idxt_1711276406 {.
      cdecl, importc: "duckdb_arrow_row_count".}
else:
  static :
    hint("Declaration of " & "duckdbarrowrowcount" &
        " already exists, not redeclaring")
when not declared(duckdbarrowrowschanged):
  proc duckdbarrowrowschanged*(result: duckdbarrow_1711276559): idxt_1711276406 {.
      cdecl, importc: "duckdb_arrow_rows_changed".}
else:
  static :
    hint("Declaration of " & "duckdbarrowrowschanged" &
        " already exists, not redeclaring")
when not declared(duckdbqueryarrowerror):
  proc duckdbqueryarrowerror*(result: duckdbarrow_1711276559): cstring {.cdecl,
      importc: "duckdb_query_arrow_error".}
else:
  static :
    hint("Declaration of " & "duckdbqueryarrowerror" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyarrow):
  proc duckdbdestroyarrow*(result: ptr duckdbarrow_1711276559): void {.cdecl,
      importc: "duckdb_destroy_arrow".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyarrow" &
        " already exists, not redeclaring")
when not declared(duckdbdestroyarrowstream):
  proc duckdbdestroyarrowstream*(streamp: ptr duckdbarrowstream_1711276563): void {.
      cdecl, importc: "duckdb_destroy_arrow_stream".}
else:
  static :
    hint("Declaration of " & "duckdbdestroyarrowstream" &
        " already exists, not redeclaring")
when not declared(duckdbexecutepreparedarrow):
  proc duckdbexecutepreparedarrow*(preparedstatement: duckdbpreparedstatement_1711276509;
                                   outresult: ptr duckdbarrow_1711276559): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_execute_prepared_arrow".}
else:
  static :
    hint("Declaration of " & "duckdbexecutepreparedarrow" &
        " already exists, not redeclaring")
when not declared(duckdbarrowscan):
  proc duckdbarrowscan*(connection: duckdbconnection_1711276505;
                        tablename: cstring; arrow: duckdbarrowstream_1711276563): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_arrow_scan".}
else:
  static :
    hint("Declaration of " & "duckdbarrowscan" &
        " already exists, not redeclaring")
when not declared(duckdbarrowarrayscan):
  proc duckdbarrowarrayscan*(connection: duckdbconnection_1711276505;
                             tablename: cstring; arrowschema: duckdbarrowschema_1711276567;
                             arrowarray: duckdbarrowarray_1711276571;
                             outstream: ptr duckdbarrowstream_1711276563): duckdbstate_1711276392 {.
      cdecl, importc: "duckdb_arrow_array_scan".}
else:
  static :
    hint("Declaration of " & "duckdbarrowarrayscan" &
        " already exists, not redeclaring")
when not declared(duckdbexecutetasks):
  proc duckdbexecutetasks*(database: duckdbdatabase_1711276501; maxtasks: idxt_1711276406): void {.
      cdecl, importc: "duckdb_execute_tasks".}
else:
  static :
    hint("Declaration of " & "duckdbexecutetasks" &
        " already exists, not redeclaring")
when not declared(duckdbcreatetaskstate):
  proc duckdbcreatetaskstate*(database: duckdbdatabase_1711276501): duckdbtaskstate_1711276410 {.
      cdecl, importc: "duckdb_create_task_state".}
else:
  static :
    hint("Declaration of " & "duckdbcreatetaskstate" &
        " already exists, not redeclaring")
when not declared(duckdbexecutetasksstate):
  proc duckdbexecutetasksstate*(state: duckdbtaskstate_1711276410): void {.
      cdecl, importc: "duckdb_execute_tasks_state".}
else:
  static :
    hint("Declaration of " & "duckdbexecutetasksstate" &
        " already exists, not redeclaring")
when not declared(duckdbexecutentasksstate):
  proc duckdbexecutentasksstate*(state: duckdbtaskstate_1711276410;
                                 maxtasks: idxt_1711276406): idxt_1711276406 {.
      cdecl, importc: "duckdb_execute_n_tasks_state".}
else:
  static :
    hint("Declaration of " & "duckdbexecutentasksstate" &
        " already exists, not redeclaring")
when not declared(duckdbfinishexecution):
  proc duckdbfinishexecution*(state: duckdbtaskstate_1711276410): void {.cdecl,
      importc: "duckdb_finish_execution".}
else:
  static :
    hint("Declaration of " & "duckdbfinishexecution" &
        " already exists, not redeclaring")
when not declared(duckdbtaskstateisfinished):
  proc duckdbtaskstateisfinished*(state: duckdbtaskstate_1711276410): bool {.
      cdecl, importc: "duckdb_task_state_is_finished".}
else:
  static :
    hint("Declaration of " & "duckdbtaskstateisfinished" &
        " already exists, not redeclaring")
when not declared(duckdbdestroytaskstate):
  proc duckdbdestroytaskstate*(state: duckdbtaskstate_1711276410): void {.cdecl,
      importc: "duckdb_destroy_task_state".}
else:
  static :
    hint("Declaration of " & "duckdbdestroytaskstate" &
        " already exists, not redeclaring")
when not declared(duckdbexecutionisfinished):
  proc duckdbexecutionisfinished*(con: duckdbconnection_1711276505): bool {.
      cdecl, importc: "duckdb_execution_is_finished".}
else:
  static :
    hint("Declaration of " & "duckdbexecutionisfinished" &
        " already exists, not redeclaring")
when not declared(duckdbstreamfetchchunk):
  proc duckdbstreamfetchchunk*(result: duckdbresult_1711276497): duckdbdatachunk_1711276533 {.
      cdecl, importc: "duckdb_stream_fetch_chunk".}
else:
  static :
    hint("Declaration of " & "duckdbstreamfetchchunk" &
        " already exists, not redeclaring")