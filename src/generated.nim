{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize

from os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

type enum_DUCKDB_TYPE_1711276471* {.size: sizeof(cuint).} = enum
  DUCKDB_TYPE_INVALID = 0
  DUCKDB_TYPE_BOOLEAN = 1
  DUCKDB_TYPE_TINYINT = 2
  DUCKDB_TYPE_SMALLINT = 3
  DUCKDB_TYPE_INTEGER = 4
  DUCKDB_TYPE_BIGINT = 5
  DUCKDB_TYPE_UTINYINT = 6
  DUCKDB_TYPE_USMALLINT = 7
  DUCKDB_TYPE_UINTEGER = 8
  DUCKDB_TYPE_UBIGINT = 9
  DUCKDB_TYPE_FLOAT = 10
  DUCKDB_TYPE_DOUBLE = 11
  DUCKDB_TYPE_TIMESTAMP = 12
  DUCKDB_TYPE_DATE = 13
  DUCKDB_TYPE_TIME = 14
  DUCKDB_TYPE_INTERVAL = 15
  DUCKDB_TYPE_HUGEINT = 16
  DUCKDB_TYPE_VARCHAR = 17
  DUCKDB_TYPE_BLOB = 18
  DUCKDB_TYPE_DECIMAL = 19
  DUCKDB_TYPE_TIMESTAMP_S = 20
  DUCKDB_TYPE_TIMESTAMP_MS = 21
  DUCKDB_TYPE_TIMESTAMP_NS = 22
  DUCKDB_TYPE_ENUM = 23
  DUCKDB_TYPE_LIST = 24
  DUCKDB_TYPE_STRUCT = 25
  DUCKDB_TYPE_MAP = 26
  DUCKDB_TYPE_UUID = 27
  DUCKDB_TYPE_UNION = 28
  DUCKDB_TYPE_BIT = 29
  DUCKDB_TYPE_TIME_TZ = 30
  DUCKDB_TYPE_TIMESTAMP_TZ = 31
  DUCKDB_TYPE_UHUGEINT = 32
  DUCKDB_TYPE_ARRAY = 33
  DUCKDB_TYPE_ANY = 34
  DUCKDB_TYPE_VARINT = 35
  DUCKDB_TYPE_SQLNULL = 36

type enum_duckdb_state_1711276476* {.size: sizeof(cuint).} = enum
  DuckDBSuccess = 0
  DuckDBError = 1

type enum_duckdb_pending_state_1711276480* {.size: sizeof(cuint).} = enum
  DUCKDB_PENDING_RESULT_READY = 0
  DUCKDB_PENDING_RESULT_NOT_READY = 1
  DUCKDB_PENDING_ERROR = 2
  DUCKDB_PENDING_NO_TASKS_AVAILABLE = 3

type enum_duckdb_result_type_1711276484* {.size: sizeof(cuint).} = enum
  DUCKDB_RESULT_TYPE_INVALID = 0
  DUCKDB_RESULT_TYPE_CHANGED_ROWS = 1
  DUCKDB_RESULT_TYPE_NOTHING = 2
  DUCKDB_RESULT_TYPE_QUERY_RESULT = 3

type enum_duckdb_statement_type_1711276488* {.size: sizeof(cuint).} = enum
  DUCKDB_STATEMENT_TYPE_INVALID = 0
  DUCKDB_STATEMENT_TYPE_SELECT = 1
  DUCKDB_STATEMENT_TYPE_INSERT = 2
  DUCKDB_STATEMENT_TYPE_UPDATE = 3
  DUCKDB_STATEMENT_TYPE_EXPLAIN = 4
  DUCKDB_STATEMENT_TYPE_DELETE = 5
  DUCKDB_STATEMENT_TYPE_PREPARE = 6
  DUCKDB_STATEMENT_TYPE_CREATE = 7
  DUCKDB_STATEMENT_TYPE_EXECUTE = 8
  DUCKDB_STATEMENT_TYPE_ALTER = 9
  DUCKDB_STATEMENT_TYPE_TRANSACTION = 10
  DUCKDB_STATEMENT_TYPE_COPY = 11
  DUCKDB_STATEMENT_TYPE_ANALYZE = 12
  DUCKDB_STATEMENT_TYPE_VARIABLE_SET = 13
  DUCKDB_STATEMENT_TYPE_CREATE_FUNC = 14
  DUCKDB_STATEMENT_TYPE_DROP = 15
  DUCKDB_STATEMENT_TYPE_EXPORT = 16
  DUCKDB_STATEMENT_TYPE_PRAGMA = 17
  DUCKDB_STATEMENT_TYPE_VACUUM = 18
  DUCKDB_STATEMENT_TYPE_CALL = 19
  DUCKDB_STATEMENT_TYPE_SET = 20
  DUCKDB_STATEMENT_TYPE_LOAD = 21
  DUCKDB_STATEMENT_TYPE_RELATION = 22
  DUCKDB_STATEMENT_TYPE_EXTENSION = 23
  DUCKDB_STATEMENT_TYPE_LOGICAL_PLAN = 24
  DUCKDB_STATEMENT_TYPE_ATTACH = 25
  DUCKDB_STATEMENT_TYPE_DETACH = 26
  DUCKDB_STATEMENT_TYPE_MULTI = 27

type enum_duckdb_error_type_1711276492* {.size: sizeof(cuint).} = enum
  DUCKDB_ERROR_INVALID = 0
  DUCKDB_ERROR_OUT_OF_RANGE = 1
  DUCKDB_ERROR_CONVERSION = 2
  DUCKDB_ERROR_UNKNOWN_TYPE = 3
  DUCKDB_ERROR_DECIMAL = 4
  DUCKDB_ERROR_MISMATCH_TYPE = 5
  DUCKDB_ERROR_DIVIDE_BY_ZERO = 6
  DUCKDB_ERROR_OBJECT_SIZE = 7
  DUCKDB_ERROR_INVALID_TYPE = 8
  DUCKDB_ERROR_SERIALIZATION = 9
  DUCKDB_ERROR_TRANSACTION = 10
  DUCKDB_ERROR_NOT_IMPLEMENTED = 11
  DUCKDB_ERROR_EXPRESSION = 12
  DUCKDB_ERROR_CATALOG = 13
  DUCKDB_ERROR_PARSER = 14
  DUCKDB_ERROR_PLANNER = 15
  DUCKDB_ERROR_SCHEDULER = 16
  DUCKDB_ERROR_EXECUTOR = 17
  DUCKDB_ERROR_CONSTRAINT = 18
  DUCKDB_ERROR_INDEX = 19
  DUCKDB_ERROR_STAT = 20
  DUCKDB_ERROR_CONNECTION = 21
  DUCKDB_ERROR_SYNTAX = 22
  DUCKDB_ERROR_SETTINGS = 23
  DUCKDB_ERROR_BINDER = 24
  DUCKDB_ERROR_NETWORK = 25
  DUCKDB_ERROR_OPTIMIZER = 26
  DUCKDB_ERROR_NULL_POINTER = 27
  DUCKDB_ERROR_IO = 28
  DUCKDB_ERROR_INTERRUPT = 29
  DUCKDB_ERROR_FATAL = 30
  DUCKDB_ERROR_INTERNAL = 31
  DUCKDB_ERROR_INVALID_INPUT = 32
  DUCKDB_ERROR_OUT_OF_MEMORY = 33
  DUCKDB_ERROR_PERMISSION = 34
  DUCKDB_ERROR_PARAMETER_NOT_RESOLVED = 35
  DUCKDB_ERROR_PARAMETER_NOT_ALLOWED = 36
  DUCKDB_ERROR_DEPENDENCY = 37
  DUCKDB_ERROR_HTTP = 38
  DUCKDB_ERROR_MISSING_EXTENSION = 39
  DUCKDB_ERROR_AUTOLOAD = 40
  DUCKDB_ERROR_SEQUENCE = 41
  DUCKDB_INVALID_CONFIGURATION = 42

type enum_duckdb_cast_mode_1711276496* {.size: sizeof(cuint).} = enum
  DUCKDB_CAST_NORMAL = 0
  DUCKDB_CAST_TRY = 1

type
  duckdb_type_1711276474 = enum_DUCKDB_TYPE_1711276473
    ## Generated based on /usr/include/duckdb.h:138:3
  duckdb_state_1711276478 = enum_duckdb_state_1711276477
    ## Generated based on /usr/include/duckdb.h:140:66
  duckdb_pending_state_1711276482 = enum_duckdb_pending_state_1711276481
    ## Generated based on /usr/include/duckdb.h:147:3
  duckdb_result_type_1711276486 = enum_duckdb_result_type_1711276485
    ## Generated based on /usr/include/duckdb.h:154:3
  duckdb_statement_type_1711276490 = enum_duckdb_statement_type_1711276489
    ## Generated based on /usr/include/duckdb.h:185:3
  duckdb_error_type_1711276494 = enum_duckdb_error_type_1711276493
    ## Generated based on /usr/include/duckdb.h:231:3
  duckdb_cast_mode_1711276498 = enum_duckdb_cast_mode_1711276497
    ## Generated based on /usr/include/duckdb.h:233:79
  idx_t_1711276500 = uint64 ## Generated based on /usr/include/duckdb.h:240:18
  duckdb_delete_callback_t_1711276502 = proc(a0: pointer): void {.cdecl.}
    ## Generated based on /usr/include/duckdb.h:244:16
  duckdb_task_state_1711276504 = pointer
    ## Generated based on /usr/include/duckdb.h:247:15
  struct_duckdb_date_1711276506 {.pure, inheritable, bycopy.} = object
    days*: int32 ## Generated based on /usr/include/duckdb.h:255:9

  duckdb_date_1711276508 = struct_duckdb_date_1711276507
    ## Generated based on /usr/include/duckdb.h:257:3
  struct_duckdb_date_struct_1711276510 {.pure, inheritable, bycopy.} = object
    year*: int32 ## Generated based on /usr/include/duckdb.h:258:9
    month*: int8
    day*: int8

  duckdb_date_struct_1711276512 = struct_duckdb_date_struct_1711276511
    ## Generated based on /usr/include/duckdb.h:262:3
  struct_duckdb_time_1711276514 {.pure, inheritable, bycopy.} = object
    micros*: int64 ## Generated based on /usr/include/duckdb.h:266:9

  duckdb_time_1711276516 = struct_duckdb_time_1711276515
    ## Generated based on /usr/include/duckdb.h:268:3
  struct_duckdb_time_struct_1711276518 {.pure, inheritable, bycopy.} = object
    hour*: int8 ## Generated based on /usr/include/duckdb.h:269:9
    min*: int8
    sec*: int8
    micros*: int32

  duckdb_time_struct_1711276520 = struct_duckdb_time_struct_1711276519
    ## Generated based on /usr/include/duckdb.h:274:3
  struct_duckdb_time_tz_1711276522 {.pure, inheritable, bycopy.} = object
    bits*: uint64 ## Generated based on /usr/include/duckdb.h:277:9

  duckdb_time_tz_1711276524 = struct_duckdb_time_tz_1711276523
    ## Generated based on /usr/include/duckdb.h:279:3
  struct_duckdb_time_tz_struct_1711276526 {.pure, inheritable, bycopy.} = object
    time*: duckdb_time_struct_1711276521
      ## Generated based on /usr/include/duckdb.h:280:9
    offset*: int32

  duckdb_time_tz_struct_1711276528 = struct_duckdb_time_tz_struct_1711276527
    ## Generated based on /usr/include/duckdb.h:283:3
  struct_duckdb_timestamp_1711276530 {.pure, inheritable, bycopy.} = object
    micros*: int64 ## Generated based on /usr/include/duckdb.h:287:9

  duckdb_timestamp_1711276532 = struct_duckdb_timestamp_1711276531
    ## Generated based on /usr/include/duckdb.h:289:3
  struct_duckdb_timestamp_struct_1711276534 {.pure, inheritable, bycopy.} = object
    date*: duckdb_date_struct_1711276513
      ## Generated based on /usr/include/duckdb.h:290:9
    time*: duckdb_time_struct_1711276521

  duckdb_timestamp_struct_1711276536 = struct_duckdb_timestamp_struct_1711276535
    ## Generated based on /usr/include/duckdb.h:293:3
  struct_duckdb_interval_1711276538 {.pure, inheritable, bycopy.} = object
    months*: int32 ## Generated based on /usr/include/duckdb.h:294:9
    days*: int32
    micros*: int64

  duckdb_interval_1711276540 = struct_duckdb_interval_1711276539
    ## Generated based on /usr/include/duckdb.h:298:3
  struct_duckdb_hugeint_1711276542 {.pure, inheritable, bycopy.} = object
    lower*: uint64 ## Generated based on /usr/include/duckdb.h:303:9
    upper*: int64

  duckdb_hugeint_1711276544 = struct_duckdb_hugeint_1711276543
    ## Generated based on /usr/include/duckdb.h:306:3
  struct_duckdb_uhugeint_1711276546 {.pure, inheritable, bycopy.} = object
    lower*: uint64 ## Generated based on /usr/include/duckdb.h:307:9
    upper*: uint64

  duckdb_uhugeint_1711276548 = struct_duckdb_uhugeint_1711276547
    ## Generated based on /usr/include/duckdb.h:310:3
  struct_duckdb_decimal_1711276550 {.pure, inheritable, bycopy.} = object
    width*: uint8 ## Generated based on /usr/include/duckdb.h:313:9
    scale*: uint8
    value*: duckdb_hugeint_1711276545

  duckdb_decimal_1711276552 = struct_duckdb_decimal_1711276551
    ## Generated based on /usr/include/duckdb.h:317:3
  struct_duckdb_query_progress_type_1711276554 {.pure, inheritable, bycopy.} = object
    percentage*: cdouble ## Generated based on /usr/include/duckdb.h:320:9
    rows_processed*: uint64
    total_rows_to_process*: uint64

  duckdb_query_progress_type_1711276556 = struct_duckdb_query_progress_type_1711276555
    ## Generated based on /usr/include/duckdb.h:324:3
  struct_duckdb_string_t_value_t_pointer_field_t {.pure, inheritable, bycopy.} = object
    length*: uint32
    prefix*: array[4'i64, cschar]
    ptr_field*: cstring

  struct_duckdb_string_t_value_t_inlined_t {.pure, inheritable, bycopy.} = object
    length*: uint32
    inlined*: array[12'i64, cschar]

  struct_duckdb_string_t_value_t {.union, bycopy.} = object
    pointer_field*: struct_duckdb_string_t_value_t_pointer_field_t
    inlined*: struct_duckdb_string_t_value_t_inlined_t

  struct_duckdb_string_t_1711276558 {.pure, inheritable, bycopy.} = object
    value*: struct_duckdb_string_t_value_t
      ## Generated based on /usr/include/duckdb.h:330:9

  duckdb_string_t_1711276560 = struct_duckdb_string_t_1711276559
    ## Generated based on /usr/include/duckdb.h:342:3
  struct_duckdb_list_entry_1711276569 {.pure, inheritable, bycopy.} = object
    offset*: uint64 ## Generated based on /usr/include/duckdb.h:347:9
    length*: uint64

  duckdb_list_entry_1711276571 = struct_duckdb_list_entry_1711276570
    ## Generated based on /usr/include/duckdb.h:350:3
  struct_duckdb_column_1711276573 {.pure, inheritable, bycopy.} = object
    deprecated_data*: pointer ## Generated based on /usr/include/duckdb.h:356:9
    deprecated_nullmask*: ptr bool
    deprecated_type*: duckdb_type_1711276475
    deprecated_name*: cstring
    internal_data*: pointer

  duckdb_column_1711276575 = struct_duckdb_column_1711276574
    ## Generated based on /usr/include/duckdb.h:366:3
  struct_duckdb_vector_1711276577 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:370:16

  duckdb_vector_1711276579 = ptr struct_duckdb_vector_1711276578
    ## Generated based on /usr/include/duckdb.h:372:5
  struct_duckdb_string_1711276581 {.pure, inheritable, bycopy.} = object
    data*: cstring ## Generated based on /usr/include/duckdb.h:380:9
    size*: idx_t_1711276501

  duckdb_string_1711276583 = struct_duckdb_string_1711276582
    ## Generated based on /usr/include/duckdb.h:383:3
  struct_duckdb_blob_1711276585 {.pure, inheritable, bycopy.} = object
    data*: pointer ## Generated based on /usr/include/duckdb.h:387:9
    size*: idx_t_1711276501

  duckdb_blob_1711276587 = struct_duckdb_blob_1711276586
    ## Generated based on /usr/include/duckdb.h:390:3
  struct_duckdb_result_1711276589 {.pure, inheritable, bycopy.} = object
    deprecated_column_count*: idx_t_1711276501
      ## Generated based on /usr/include/duckdb.h:394:9
    deprecated_row_count*: idx_t_1711276501
    deprecated_rows_changed*: idx_t_1711276501
    deprecated_columns*: ptr duckdb_column_1711276576
    deprecated_error_message*: cstring
    internal_data*: pointer

  duckdb_result_1711276591 = struct_duckdb_result_1711276590
    ## Generated based on /usr/include/duckdb.h:406:3
  struct_duckdb_database_1711276593 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:409:16

  duckdb_database_1711276595 = ptr struct_duckdb_database_1711276594
    ## Generated based on /usr/include/duckdb.h:411:5
  struct_duckdb_connection_1711276597 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:414:16

  duckdb_connection_1711276599 = ptr struct_duckdb_connection_1711276598
    ## Generated based on /usr/include/duckdb.h:416:5
  struct_duckdb_prepared_statement_1711276601 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:420:16

  duckdb_prepared_statement_1711276603 = ptr struct_duckdb_prepared_statement_1711276602
    ## Generated based on /usr/include/duckdb.h:422:5
  struct_duckdb_extracted_statements_1711276605 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:425:16

  duckdb_extracted_statements_1711276607 =
    ptr struct_duckdb_extracted_statements_1711276606
    ## Generated based on /usr/include/duckdb.h:427:5
  struct_duckdb_pending_result_1711276609 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:431:16

  duckdb_pending_result_1711276611 = ptr struct_duckdb_pending_result_1711276610
    ## Generated based on /usr/include/duckdb.h:433:5
  struct_duckdb_appender_1711276613 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:437:16

  duckdb_appender_1711276615 = ptr struct_duckdb_appender_1711276614
    ## Generated based on /usr/include/duckdb.h:439:5
  struct_duckdb_table_description_1711276617 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:443:16

  duckdb_table_description_1711276619 = ptr struct_duckdb_table_description_1711276618
    ## Generated based on /usr/include/duckdb.h:445:5
  struct_duckdb_config_1711276621 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:449:16

  duckdb_config_1711276623 = ptr struct_duckdb_config_1711276622
    ## Generated based on /usr/include/duckdb.h:451:5
  struct_duckdb_logical_type_1711276625 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:455:16

  duckdb_logical_type_1711276627 = ptr struct_duckdb_logical_type_1711276626
    ## Generated based on /usr/include/duckdb.h:457:5
  struct_duckdb_create_type_info_1711276629 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:461:16

  duckdb_create_type_info_1711276631 = ptr struct_duckdb_create_type_info_1711276630
    ## Generated based on /usr/include/duckdb.h:463:5
  struct_duckdb_data_chunk_1711276633 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:467:16

  duckdb_data_chunk_1711276635 = ptr struct_duckdb_data_chunk_1711276634
    ## Generated based on /usr/include/duckdb.h:469:5
  struct_duckdb_value_1711276637 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:473:16

  duckdb_value_1711276639 = ptr struct_duckdb_value_1711276638
    ## Generated based on /usr/include/duckdb.h:475:5
  struct_duckdb_profiling_info_1711276641 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:478:16

  duckdb_profiling_info_1711276643 = ptr struct_duckdb_profiling_info_1711276642
    ## Generated based on /usr/include/duckdb.h:480:5
  struct_duckdb_extension_info_1711276645 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:486:16

  duckdb_extension_info_1711276647 = ptr struct_duckdb_extension_info_1711276646
    ## Generated based on /usr/include/duckdb.h:488:5
  struct_duckdb_function_info_1711276649 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:494:16

  duckdb_function_info_1711276651 = ptr struct_duckdb_function_info_1711276650
    ## Generated based on /usr/include/duckdb.h:496:5
  struct_duckdb_scalar_function_1711276653 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:502:16

  duckdb_scalar_function_1711276655 = ptr struct_duckdb_scalar_function_1711276654
    ## Generated based on /usr/include/duckdb.h:504:5
  struct_duckdb_scalar_function_set_1711276657 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:507:16

  duckdb_scalar_function_set_1711276659 =
    ptr struct_duckdb_scalar_function_set_1711276658
    ## Generated based on /usr/include/duckdb.h:509:5
  duckdb_scalar_function_t_1711276661 = proc(
    a0: duckdb_function_info_1711276652,
    a1: duckdb_data_chunk_1711276636,
    a2: duckdb_vector_1711276580,
  ): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:512:16
  struct_duckdb_aggregate_function_1711276663 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:518:16

  duckdb_aggregate_function_1711276665 = ptr struct_duckdb_aggregate_function_1711276664
    ## Generated based on /usr/include/duckdb.h:520:5
  struct_duckdb_aggregate_function_set_1711276667 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:523:16

  duckdb_aggregate_function_set_1711276669 =
    ptr struct_duckdb_aggregate_function_set_1711276668
    ## Generated based on /usr/include/duckdb.h:525:5
  struct_duckdb_aggregate_state_1711276671 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:528:16

  duckdb_aggregate_state_1711276673 = ptr struct_duckdb_aggregate_state_1711276672
    ## Generated based on /usr/include/duckdb.h:530:5
  duckdb_aggregate_state_size_1711276675 =
    proc(a0: duckdb_function_info_1711276652): idx_t_1711276501 {.cdecl.}
    ## Generated based on /usr/include/duckdb.h:533:17
  duckdb_aggregate_init_t_1711276677 = proc(
    a0: duckdb_function_info_1711276652, a1: duckdb_aggregate_state_1711276674
  ): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:535:16
  duckdb_aggregate_destroy_t_1711276679 = proc(
    a0: ptr duckdb_aggregate_state_1711276674, a1: idx_t_1711276501
  ): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:537:16
  duckdb_aggregate_update_t_1711276681 = proc(
    a0: duckdb_function_info_1711276652,
    a1: duckdb_data_chunk_1711276636,
    a2: ptr duckdb_aggregate_state_1711276674,
  ): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:539:16
  duckdb_aggregate_combine_t_1711276683 = proc(
    a0: duckdb_function_info_1711276652,
    a1: ptr duckdb_aggregate_state_1711276674,
    a2: ptr duckdb_aggregate_state_1711276674,
    a3: idx_t_1711276501,
  ): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:542:16
  duckdb_aggregate_finalize_t_1711276685 = proc(
    a0: duckdb_function_info_1711276652,
    a1: ptr duckdb_aggregate_state_1711276674,
    a2: duckdb_vector_1711276580,
    a3: idx_t_1711276501,
    a4: idx_t_1711276501,
  ): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:545:16
  struct_duckdb_table_function_1711276687 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:553:16

  duckdb_table_function_1711276689 = ptr struct_duckdb_table_function_1711276688
    ## Generated based on /usr/include/duckdb.h:555:5
  struct_duckdb_bind_info_1711276691 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:558:16

  duckdb_bind_info_1711276693 = ptr struct_duckdb_bind_info_1711276692
    ## Generated based on /usr/include/duckdb.h:560:5
  struct_duckdb_init_info_1711276695 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:563:16

  duckdb_init_info_1711276697 = ptr struct_duckdb_init_info_1711276696
    ## Generated based on /usr/include/duckdb.h:565:5
  duckdb_table_function_bind_t_1711276699 =
    proc(a0: duckdb_bind_info_1711276694): void {.cdecl.}
    ## Generated based on /usr/include/duckdb.h:568:16
  duckdb_table_function_init_t_1711276701 =
    proc(a0: duckdb_init_info_1711276698): void {.cdecl.}
    ## Generated based on /usr/include/duckdb.h:571:16
  duckdb_table_function_t_1711276703 = proc(
    a0: duckdb_function_info_1711276652, a1: duckdb_data_chunk_1711276636
  ): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:574:16
  struct_duckdb_cast_function_1711276705 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:581:16

  duckdb_cast_function_1711276707 = ptr struct_duckdb_cast_function_1711276706
    ## Generated based on /usr/include/duckdb.h:583:5
  duckdb_cast_function_t_1711276709 = proc(
    a0: duckdb_function_info_1711276652,
    a1: idx_t_1711276501,
    a2: duckdb_vector_1711276580,
    a3: duckdb_vector_1711276580,
  ): bool {.cdecl.} ## Generated based on /usr/include/duckdb.h:585:16
  struct_duckdb_replacement_scan_info_1711276711 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:593:16

  duckdb_replacement_scan_info_1711276713 =
    ptr struct_duckdb_replacement_scan_info_1711276712
    ## Generated based on /usr/include/duckdb.h:595:5
  duckdb_replacement_callback_t_1711276715 = proc(
    a0: duckdb_replacement_scan_info_1711276714, a1: cstring, a2: pointer
  ): void {.cdecl.} ## Generated based on /usr/include/duckdb.h:598:16
  struct_duckdb_arrow_1711276717 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:605:16

  duckdb_arrow_1711276719 = ptr struct_duckdb_arrow_1711276718
    ## Generated based on /usr/include/duckdb.h:607:5
  struct_duckdb_arrow_stream_1711276721 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:610:16

  duckdb_arrow_stream_1711276723 = ptr struct_duckdb_arrow_stream_1711276722
    ## Generated based on /usr/include/duckdb.h:612:5
  struct_duckdb_arrow_schema_1711276725 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:615:16

  duckdb_arrow_schema_1711276727 = ptr struct_duckdb_arrow_schema_1711276726
    ## Generated based on /usr/include/duckdb.h:617:5
  struct_duckdb_arrow_array_1711276729 {.pure, inheritable, bycopy.} = object
    internal_ptr*: pointer ## Generated based on /usr/include/duckdb.h:620:16

  duckdb_arrow_array_1711276731 = ptr struct_duckdb_arrow_array_1711276730
    ## Generated based on /usr/include/duckdb.h:622:5
  struct_duckdb_extension_access_1711276733 {.pure, inheritable, bycopy.} = object
    set_error*: proc(a0: duckdb_extension_info_1711276648, a1: cstring): void {.cdecl.}
      ## Generated based on /usr/include/duckdb.h:628:8
    get_database*: proc(
      a0: duckdb_extension_info_1711276648
    ): ptr duckdb_database_1711276596 {.cdecl.}
    get_api*: proc(a0: duckdb_extension_info_1711276648, a1: cstring): pointer {.cdecl.}

  duckdb_time_1711276517 = (
    when declared(duckdb_time):
      when ownSizeof(duckdb_time) != ownSizeof(duckdb_time_1711276516):
        static:
          warning("Declaration of " & "duckdb_time" & " exists but with different size")
      duckdb_time
    else:
      duckdb_time_1711276516
  )
  enum_duckdb_cast_mode_1711276497 = (
    when declared(enum_duckdb_cast_mode):
      when ownSizeof(enum_duckdb_cast_mode) !=
          ownSizeof(enum_duckdb_cast_mode_1711276496):
        static:
          warning(
            "Declaration of " & "enum_duckdb_cast_mode" &
              " exists but with different size"
          )
      enum_duckdb_cast_mode
    else:
      enum_duckdb_cast_mode_1711276496
  )
  duckdb_function_info_1711276652 = (
    when declared(duckdb_function_info):
      when ownSizeof(duckdb_function_info) != ownSizeof(duckdb_function_info_1711276651):
        static:
          warning(
            "Declaration of " & "duckdb_function_info" &
              " exists but with different size"
          )
      duckdb_function_info
    else:
      duckdb_function_info_1711276651
  )
  struct_duckdb_scalar_function_set_1711276658 = (
    when declared(struct_duckdb_scalar_function_set):
      when ownSizeof(struct_duckdb_scalar_function_set) !=
          ownSizeof(struct_duckdb_scalar_function_set_1711276657):
        static:
          warning(
            "Declaration of " & "struct_duckdb_scalar_function_set" &
              " exists but with different size"
          )
      struct_duckdb_scalar_function_set
    else:
      struct_duckdb_scalar_function_set_1711276657
  )
  struct_duckdb_column_1711276574 = (
    when declared(struct_duckdb_column):
      when ownSizeof(struct_duckdb_column) != ownSizeof(struct_duckdb_column_1711276573):
        static:
          warning(
            "Declaration of " & "struct_duckdb_column" &
              " exists but with different size"
          )
      struct_duckdb_column
    else:
      struct_duckdb_column_1711276573
  )
  struct_duckdb_database_1711276594 = (
    when declared(struct_duckdb_database):
      when ownSizeof(struct_duckdb_database) !=
          ownSizeof(struct_duckdb_database_1711276593):
        static:
          warning(
            "Declaration of " & "struct_duckdb_database" &
              " exists but with different size"
          )
      struct_duckdb_database
    else:
      struct_duckdb_database_1711276593
  )
  duckdb_date_struct_1711276513 = (
    when declared(duckdb_date_struct):
      when ownSizeof(duckdb_date_struct) != ownSizeof(duckdb_date_struct_1711276512):
        static:
          warning(
            "Declaration of " & "duckdb_date_struct" & " exists but with different size"
          )
      duckdb_date_struct
    else:
      duckdb_date_struct_1711276512
  )
  duckdb_decimal_1711276553 = (
    when declared(duckdb_decimal):
      when ownSizeof(duckdb_decimal) != ownSizeof(duckdb_decimal_1711276552):
        static:
          warning(
            "Declaration of " & "duckdb_decimal" & " exists but with different size"
          )
      duckdb_decimal
    else:
      duckdb_decimal_1711276552
  )
  struct_duckdb_decimal_1711276551 = (
    when declared(struct_duckdb_decimal):
      when ownSizeof(struct_duckdb_decimal) !=
          ownSizeof(struct_duckdb_decimal_1711276550):
        static:
          warning(
            "Declaration of " & "struct_duckdb_decimal" &
              " exists but with different size"
          )
      struct_duckdb_decimal
    else:
      struct_duckdb_decimal_1711276550
  )
  struct_duckdb_cast_function_1711276706 = (
    when declared(struct_duckdb_cast_function):
      when ownSizeof(struct_duckdb_cast_function) !=
          ownSizeof(struct_duckdb_cast_function_1711276705):
        static:
          warning(
            "Declaration of " & "struct_duckdb_cast_function" &
              " exists but with different size"
          )
      struct_duckdb_cast_function
    else:
      struct_duckdb_cast_function_1711276705
  )
  duckdb_database_1711276596 = (
    when declared(duckdb_database):
      when ownSizeof(duckdb_database) != ownSizeof(duckdb_database_1711276595):
        static:
          warning(
            "Declaration of " & "duckdb_database" & " exists but with different size"
          )
      duckdb_database
    else:
      duckdb_database_1711276595
  )
  duckdb_aggregate_function_1711276666 = (
    when declared(duckdb_aggregate_function):
      when ownSizeof(duckdb_aggregate_function) !=
          ownSizeof(duckdb_aggregate_function_1711276665):
        static:
          warning(
            "Declaration of " & "duckdb_aggregate_function" &
              " exists but with different size"
          )
      duckdb_aggregate_function
    else:
      duckdb_aggregate_function_1711276665
  )
  duckdb_aggregate_function_set_1711276670 = (
    when declared(duckdb_aggregate_function_set):
      when ownSizeof(duckdb_aggregate_function_set) !=
          ownSizeof(duckdb_aggregate_function_set_1711276669):
        static:
          warning(
            "Declaration of " & "duckdb_aggregate_function_set" &
              " exists but with different size"
          )
      duckdb_aggregate_function_set
    else:
      duckdb_aggregate_function_set_1711276669
  )
  duckdb_arrow_1711276720 = (
    when declared(duckdb_arrow):
      when ownSizeof(duckdb_arrow) != ownSizeof(duckdb_arrow_1711276719):
        static:
          warning(
            "Declaration of " & "duckdb_arrow" & " exists but with different size"
          )
      duckdb_arrow
    else:
      duckdb_arrow_1711276719
  )
  struct_duckdb_string_t_1711276559 = (
    when declared(struct_duckdb_string_t):
      when ownSizeof(struct_duckdb_string_t) !=
          ownSizeof(struct_duckdb_string_t_1711276558):
        static:
          warning(
            "Declaration of " & "struct_duckdb_string_t" &
              " exists but with different size"
          )
      struct_duckdb_string_t
    else:
      struct_duckdb_string_t_1711276558
  )
  struct_duckdb_data_chunk_1711276634 = (
    when declared(struct_duckdb_data_chunk):
      when ownSizeof(struct_duckdb_data_chunk) !=
          ownSizeof(struct_duckdb_data_chunk_1711276633):
        static:
          warning(
            "Declaration of " & "struct_duckdb_data_chunk" &
              " exists but with different size"
          )
      struct_duckdb_data_chunk
    else:
      struct_duckdb_data_chunk_1711276633
  )
  duckdb_arrow_stream_1711276724 = (
    when declared(duckdb_arrow_stream):
      when ownSizeof(duckdb_arrow_stream) != ownSizeof(duckdb_arrow_stream_1711276723):
        static:
          warning(
            "Declaration of " & "duckdb_arrow_stream" & " exists but with different size"
          )
      duckdb_arrow_stream
    else:
      duckdb_arrow_stream_1711276723
  )
  duckdb_cast_function_t_1711276710 = (
    when declared(duckdb_cast_function_t):
      when ownSizeof(duckdb_cast_function_t) !=
          ownSizeof(duckdb_cast_function_t_1711276709):
        static:
          warning(
            "Declaration of " & "duckdb_cast_function_t" &
              " exists but with different size"
          )
      duckdb_cast_function_t
    else:
      duckdb_cast_function_t_1711276709
  )
  idx_t_1711276501 = (
    when declared(idx_t):
      when ownSizeof(idx_t) != ownSizeof(idx_t_1711276500):
        static:
          warning("Declaration of " & "idx_t" & " exists but with different size")
      idx_t
    else:
      idx_t_1711276500
  )
  struct_duckdb_extracted_statements_1711276606 = (
    when declared(struct_duckdb_extracted_statements):
      when ownSizeof(struct_duckdb_extracted_statements) !=
          ownSizeof(struct_duckdb_extracted_statements_1711276605):
        static:
          warning(
            "Declaration of " & "struct_duckdb_extracted_statements" &
              " exists but with different size"
          )
      struct_duckdb_extracted_statements
    else:
      struct_duckdb_extracted_statements_1711276605
  )
  struct_duckdb_bind_info_1711276692 = (
    when declared(struct_duckdb_bind_info):
      when ownSizeof(struct_duckdb_bind_info) !=
          ownSizeof(struct_duckdb_bind_info_1711276691):
        static:
          warning(
            "Declaration of " & "struct_duckdb_bind_info" &
              " exists but with different size"
          )
      struct_duckdb_bind_info
    else:
      struct_duckdb_bind_info_1711276691
  )
  struct_duckdb_time_tz_1711276523 = (
    when declared(struct_duckdb_time_tz):
      when ownSizeof(struct_duckdb_time_tz) !=
          ownSizeof(struct_duckdb_time_tz_1711276522):
        static:
          warning(
            "Declaration of " & "struct_duckdb_time_tz" &
              " exists but with different size"
          )
      struct_duckdb_time_tz
    else:
      struct_duckdb_time_tz_1711276522
  )
  duckdb_uhugeint_1711276549 = (
    when declared(duckdb_uhugeint):
      when ownSizeof(duckdb_uhugeint) != ownSizeof(duckdb_uhugeint_1711276548):
        static:
          warning(
            "Declaration of " & "duckdb_uhugeint" & " exists but with different size"
          )
      duckdb_uhugeint
    else:
      duckdb_uhugeint_1711276548
  )
  struct_duckdb_create_type_info_1711276630 = (
    when declared(struct_duckdb_create_type_info):
      when ownSizeof(struct_duckdb_create_type_info) !=
          ownSizeof(struct_duckdb_create_type_info_1711276629):
        static:
          warning(
            "Declaration of " & "struct_duckdb_create_type_info" &
              " exists but with different size"
          )
      struct_duckdb_create_type_info
    else:
      struct_duckdb_create_type_info_1711276629
  )
  duckdb_blob_1711276588 = (
    when declared(duckdb_blob):
      when ownSizeof(duckdb_blob) != ownSizeof(duckdb_blob_1711276587):
        static:
          warning("Declaration of " & "duckdb_blob" & " exists but with different size")
      duckdb_blob
    else:
      duckdb_blob_1711276587
  )
  duckdb_aggregate_init_t_1711276678 = (
    when declared(duckdb_aggregate_init_t):
      when ownSizeof(duckdb_aggregate_init_t) !=
          ownSizeof(duckdb_aggregate_init_t_1711276677):
        static:
          warning(
            "Declaration of " & "duckdb_aggregate_init_t" &
              " exists but with different size"
          )
      duckdb_aggregate_init_t
    else:
      duckdb_aggregate_init_t_1711276677
  )
  duckdb_type_1711276475 = (
    when declared(duckdb_type):
      when ownSizeof(duckdb_type) != ownSizeof(duckdb_type_1711276474):
        static:
          warning("Declaration of " & "duckdb_type" & " exists but with different size")
      duckdb_type
    else:
      duckdb_type_1711276474
  )
  struct_duckdb_string_1711276582 = (
    when declared(struct_duckdb_string):
      when ownSizeof(struct_duckdb_string) != ownSizeof(struct_duckdb_string_1711276581):
        static:
          warning(
            "Declaration of " & "struct_duckdb_string" &
              " exists but with different size"
          )
      struct_duckdb_string
    else:
      struct_duckdb_string_1711276581
  )
  duckdb_table_function_t_1711276704 = (
    when declared(duckdb_table_function_t):
      when ownSizeof(duckdb_table_function_t) !=
          ownSizeof(duckdb_table_function_t_1711276703):
        static:
          warning(
            "Declaration of " & "duckdb_table_function_t" &
              " exists but with different size"
          )
      duckdb_table_function_t
    else:
      duckdb_table_function_t_1711276703
  )
  struct_duckdb_time_struct_1711276519 = (
    when declared(struct_duckdb_time_struct):
      when ownSizeof(struct_duckdb_time_struct) !=
          ownSizeof(struct_duckdb_time_struct_1711276518):
        static:
          warning(
            "Declaration of " & "struct_duckdb_time_struct" &
              " exists but with different size"
          )
      struct_duckdb_time_struct
    else:
      struct_duckdb_time_struct_1711276518
  )
  duckdb_task_state_1711276505 = (
    when declared(duckdb_task_state):
      when ownSizeof(duckdb_task_state) != ownSizeof(duckdb_task_state_1711276504):
        static:
          warning(
            "Declaration of " & "duckdb_task_state" & " exists but with different size"
          )
      duckdb_task_state
    else:
      duckdb_task_state_1711276504
  )
  duckdb_scalar_function_1711276656 = (
    when declared(duckdb_scalar_function):
      when ownSizeof(duckdb_scalar_function) !=
          ownSizeof(duckdb_scalar_function_1711276655):
        static:
          warning(
            "Declaration of " & "duckdb_scalar_function" &
              " exists but with different size"
          )
      duckdb_scalar_function
    else:
      duckdb_scalar_function_1711276655
  )
  struct_duckdb_query_progress_type_1711276555 = (
    when declared(struct_duckdb_query_progress_type):
      when ownSizeof(struct_duckdb_query_progress_type) !=
          ownSizeof(struct_duckdb_query_progress_type_1711276554):
        static:
          warning(
            "Declaration of " & "struct_duckdb_query_progress_type" &
              " exists but with different size"
          )
      struct_duckdb_query_progress_type
    else:
      struct_duckdb_query_progress_type_1711276554
  )
  enum_duckdb_error_type_1711276493 = (
    when declared(enum_duckdb_error_type):
      when ownSizeof(enum_duckdb_error_type) !=
          ownSizeof(enum_duckdb_error_type_1711276492):
        static:
          warning(
            "Declaration of " & "enum_duckdb_error_type" &
              " exists but with different size"
          )
      enum_duckdb_error_type
    else:
      enum_duckdb_error_type_1711276492
  )
  duckdb_pending_state_1711276483 = (
    when declared(duckdb_pending_state):
      when ownSizeof(duckdb_pending_state) != ownSizeof(duckdb_pending_state_1711276482):
        static:
          warning(
            "Declaration of " & "duckdb_pending_state" &
              " exists but with different size"
          )
      duckdb_pending_state
    else:
      duckdb_pending_state_1711276482
  )
  struct_duckdb_timestamp_1711276531 = (
    when declared(struct_duckdb_timestamp):
      when ownSizeof(struct_duckdb_timestamp) !=
          ownSizeof(struct_duckdb_timestamp_1711276530):
        static:
          warning(
            "Declaration of " & "struct_duckdb_timestamp" &
              " exists but with different size"
          )
      struct_duckdb_timestamp
    else:
      struct_duckdb_timestamp_1711276530
  )
  struct_duckdb_hugeint_1711276543 = (
    when declared(struct_duckdb_hugeint):
      when ownSizeof(struct_duckdb_hugeint) !=
          ownSizeof(struct_duckdb_hugeint_1711276542):
        static:
          warning(
            "Declaration of " & "struct_duckdb_hugeint" &
              " exists but with different size"
          )
      struct_duckdb_hugeint
    else:
      struct_duckdb_hugeint_1711276542
  )
  struct_duckdb_blob_1711276586 = (
    when declared(struct_duckdb_blob):
      when ownSizeof(struct_duckdb_blob) != ownSizeof(struct_duckdb_blob_1711276585):
        static:
          warning(
            "Declaration of " & "struct_duckdb_blob" & " exists but with different size"
          )
      struct_duckdb_blob
    else:
      struct_duckdb_blob_1711276585
  )
  enum_duckdb_state_1711276477 = (
    when declared(enum_duckdb_state):
      when ownSizeof(enum_duckdb_state) != ownSizeof(enum_duckdb_state_1711276476):
        static:
          warning(
            "Declaration of " & "enum_duckdb_state" & " exists but with different size"
          )
      enum_duckdb_state
    else:
      enum_duckdb_state_1711276476
  )
  duckdb_aggregate_combine_t_1711276684 = (
    when declared(duckdb_aggregate_combine_t):
      when ownSizeof(duckdb_aggregate_combine_t) !=
          ownSizeof(duckdb_aggregate_combine_t_1711276683):
        static:
          warning(
            "Declaration of " & "duckdb_aggregate_combine_t" &
              " exists but with different size"
          )
      duckdb_aggregate_combine_t
    else:
      duckdb_aggregate_combine_t_1711276683
  )
  duckdb_table_function_bind_t_1711276700 = (
    when declared(duckdb_table_function_bind_t):
      when ownSizeof(duckdb_table_function_bind_t) !=
          ownSizeof(duckdb_table_function_bind_t_1711276699):
        static:
          warning(
            "Declaration of " & "duckdb_table_function_bind_t" &
              " exists but with different size"
          )
      duckdb_table_function_bind_t
    else:
      duckdb_table_function_bind_t_1711276699
  )
  struct_duckdb_extension_access_1711276734 = (
    when declared(struct_duckdb_extension_access):
      when ownSizeof(struct_duckdb_extension_access) !=
          ownSizeof(struct_duckdb_extension_access_1711276733):
        static:
          warning(
            "Declaration of " & "struct_duckdb_extension_access" &
              " exists but with different size"
          )
      struct_duckdb_extension_access
    else:
      struct_duckdb_extension_access_1711276733
  )
  duckdb_scalar_function_set_1711276660 = (
    when declared(duckdb_scalar_function_set):
      when ownSizeof(duckdb_scalar_function_set) !=
          ownSizeof(duckdb_scalar_function_set_1711276659):
        static:
          warning(
            "Declaration of " & "duckdb_scalar_function_set" &
              " exists but with different size"
          )
      duckdb_scalar_function_set
    else:
      duckdb_scalar_function_set_1711276659
  )
  duckdb_value_1711276640 = (
    when declared(duckdb_value):
      when ownSizeof(duckdb_value) != ownSizeof(duckdb_value_1711276639):
        static:
          warning(
            "Declaration of " & "duckdb_value" & " exists but with different size"
          )
      duckdb_value
    else:
      duckdb_value_1711276639
  )
  duckdb_delete_callback_t_1711276503 = (
    when declared(duckdb_delete_callback_t):
      when ownSizeof(duckdb_delete_callback_t) !=
          ownSizeof(duckdb_delete_callback_t_1711276502):
        static:
          warning(
            "Declaration of " & "duckdb_delete_callback_t" &
              " exists but with different size"
          )
      duckdb_delete_callback_t
    else:
      duckdb_delete_callback_t_1711276502
  )
  duckdb_list_entry_1711276572 = (
    when declared(duckdb_list_entry):
      when ownSizeof(duckdb_list_entry) != ownSizeof(duckdb_list_entry_1711276571):
        static:
          warning(
            "Declaration of " & "duckdb_list_entry" & " exists but with different size"
          )
      duckdb_list_entry
    else:
      duckdb_list_entry_1711276571
  )
  struct_duckdb_scalar_function_1711276654 = (
    when declared(struct_duckdb_scalar_function):
      when ownSizeof(struct_duckdb_scalar_function) !=
          ownSizeof(struct_duckdb_scalar_function_1711276653):
        static:
          warning(
            "Declaration of " & "struct_duckdb_scalar_function" &
              " exists but with different size"
          )
      struct_duckdb_scalar_function
    else:
      struct_duckdb_scalar_function_1711276653
  )
  struct_duckdb_vector_1711276578 = (
    when declared(struct_duckdb_vector):
      when ownSizeof(struct_duckdb_vector) != ownSizeof(struct_duckdb_vector_1711276577):
        static:
          warning(
            "Declaration of " & "struct_duckdb_vector" &
              " exists but with different size"
          )
      struct_duckdb_vector
    else:
      struct_duckdb_vector_1711276577
  )
  struct_duckdb_interval_1711276539 = (
    when declared(struct_duckdb_interval):
      when ownSizeof(struct_duckdb_interval) !=
          ownSizeof(struct_duckdb_interval_1711276538):
        static:
          warning(
            "Declaration of " & "struct_duckdb_interval" &
              " exists but with different size"
          )
      struct_duckdb_interval
    else:
      struct_duckdb_interval_1711276538
  )
  struct_duckdb_arrow_1711276718 = (
    when declared(struct_duckdb_arrow):
      when ownSizeof(struct_duckdb_arrow) != ownSizeof(struct_duckdb_arrow_1711276717):
        static:
          warning(
            "Declaration of " & "struct_duckdb_arrow" & " exists but with different size"
          )
      struct_duckdb_arrow
    else:
      struct_duckdb_arrow_1711276717
  )
  duckdb_timestamp_struct_1711276537 = (
    when declared(duckdb_timestamp_struct):
      when ownSizeof(duckdb_timestamp_struct) !=
          ownSizeof(duckdb_timestamp_struct_1711276536):
        static:
          warning(
            "Declaration of " & "duckdb_timestamp_struct" &
              " exists but with different size"
          )
      duckdb_timestamp_struct
    else:
      duckdb_timestamp_struct_1711276536
  )
  duckdb_query_progress_type_1711276557 = (
    when declared(duckdb_query_progress_type):
      when ownSizeof(duckdb_query_progress_type) !=
          ownSizeof(duckdb_query_progress_type_1711276556):
        static:
          warning(
            "Declaration of " & "duckdb_query_progress_type" &
              " exists but with different size"
          )
      duckdb_query_progress_type
    else:
      duckdb_query_progress_type_1711276556
  )
  duckdb_init_info_1711276698 = (
    when declared(duckdb_init_info):
      when ownSizeof(duckdb_init_info) != ownSizeof(duckdb_init_info_1711276697):
        static:
          warning(
            "Declaration of " & "duckdb_init_info" & " exists but with different size"
          )
      duckdb_init_info
    else:
      duckdb_init_info_1711276697
  )
  duckdb_table_function_1711276690 = (
    when declared(duckdb_table_function):
      when ownSizeof(duckdb_table_function) !=
          ownSizeof(duckdb_table_function_1711276689):
        static:
          warning(
            "Declaration of " & "duckdb_table_function" &
              " exists but with different size"
          )
      duckdb_table_function
    else:
      duckdb_table_function_1711276689
  )
  duckdb_replacement_scan_info_1711276714 = (
    when declared(duckdb_replacement_scan_info):
      when ownSizeof(duckdb_replacement_scan_info) !=
          ownSizeof(duckdb_replacement_scan_info_1711276713):
        static:
          warning(
            "Declaration of " & "duckdb_replacement_scan_info" &
              " exists but with different size"
          )
      duckdb_replacement_scan_info
    else:
      duckdb_replacement_scan_info_1711276713
  )
  struct_duckdb_prepared_statement_1711276602 = (
    when declared(struct_duckdb_prepared_statement):
      when ownSizeof(struct_duckdb_prepared_statement) !=
          ownSizeof(struct_duckdb_prepared_statement_1711276601):
        static:
          warning(
            "Declaration of " & "struct_duckdb_prepared_statement" &
              " exists but with different size"
          )
      struct_duckdb_prepared_statement
    else:
      struct_duckdb_prepared_statement_1711276601
  )
  duckdb_replacement_callback_t_1711276716 = (
    when declared(duckdb_replacement_callback_t):
      when ownSizeof(duckdb_replacement_callback_t) !=
          ownSizeof(duckdb_replacement_callback_t_1711276715):
        static:
          warning(
            "Declaration of " & "duckdb_replacement_callback_t" &
              " exists but with different size"
          )
      duckdb_replacement_callback_t
    else:
      duckdb_replacement_callback_t_1711276715
  )
  duckdb_logical_type_1711276628 = (
    when declared(duckdb_logical_type):
      when ownSizeof(duckdb_logical_type) != ownSizeof(duckdb_logical_type_1711276627):
        static:
          warning(
            "Declaration of " & "duckdb_logical_type" & " exists but with different size"
          )
      duckdb_logical_type
    else:
      duckdb_logical_type_1711276627
  )
  duckdb_profiling_info_1711276644 = (
    when declared(duckdb_profiling_info):
      when ownSizeof(duckdb_profiling_info) !=
          ownSizeof(duckdb_profiling_info_1711276643):
        static:
          warning(
            "Declaration of " & "duckdb_profiling_info" &
              " exists but with different size"
          )
      duckdb_profiling_info
    else:
      duckdb_profiling_info_1711276643
  )
  duckdb_date_1711276509 = (
    when declared(duckdb_date):
      when ownSizeof(duckdb_date) != ownSizeof(duckdb_date_1711276508):
        static:
          warning("Declaration of " & "duckdb_date" & " exists but with different size")
      duckdb_date
    else:
      duckdb_date_1711276508
  )
  duckdb_table_description_1711276620 = (
    when declared(duckdb_table_description):
      when ownSizeof(duckdb_table_description) !=
          ownSizeof(duckdb_table_description_1711276619):
        static:
          warning(
            "Declaration of " & "duckdb_table_description" &
              " exists but with different size"
          )
      duckdb_table_description
    else:
      duckdb_table_description_1711276619
  )
  duckdb_connection_1711276600 = (
    when declared(duckdb_connection):
      when ownSizeof(duckdb_connection) != ownSizeof(duckdb_connection_1711276599):
        static:
          warning(
            "Declaration of " & "duckdb_connection" & " exists but with different size"
          )
      duckdb_connection
    else:
      duckdb_connection_1711276599
  )
  struct_duckdb_date_struct_1711276511 = (
    when declared(struct_duckdb_date_struct):
      when ownSizeof(struct_duckdb_date_struct) !=
          ownSizeof(struct_duckdb_date_struct_1711276510):
        static:
          warning(
            "Declaration of " & "struct_duckdb_date_struct" &
              " exists but with different size"
          )
      struct_duckdb_date_struct
    else:
      struct_duckdb_date_struct_1711276510
  )
  struct_duckdb_arrow_schema_1711276726 = (
    when declared(struct_duckdb_arrow_schema):
      when ownSizeof(struct_duckdb_arrow_schema) !=
          ownSizeof(struct_duckdb_arrow_schema_1711276725):
        static:
          warning(
            "Declaration of " & "struct_duckdb_arrow_schema" &
              " exists but with different size"
          )
      struct_duckdb_arrow_schema
    else:
      struct_duckdb_arrow_schema_1711276725
  )
  duckdb_time_tz_1711276525 = (
    when declared(duckdb_time_tz):
      when ownSizeof(duckdb_time_tz) != ownSizeof(duckdb_time_tz_1711276524):
        static:
          warning(
            "Declaration of " & "duckdb_time_tz" & " exists but with different size"
          )
      duckdb_time_tz
    else:
      duckdb_time_tz_1711276524
  )
  struct_duckdb_aggregate_function_1711276664 = (
    when declared(struct_duckdb_aggregate_function):
      when ownSizeof(struct_duckdb_aggregate_function) !=
          ownSizeof(struct_duckdb_aggregate_function_1711276663):
        static:
          warning(
            "Declaration of " & "struct_duckdb_aggregate_function" &
              " exists but with different size"
          )
      struct_duckdb_aggregate_function
    else:
      struct_duckdb_aggregate_function_1711276663
  )
  enum_duckdb_statement_type_1711276489 = (
    when declared(enum_duckdb_statement_type):
      when ownSizeof(enum_duckdb_statement_type) !=
          ownSizeof(enum_duckdb_statement_type_1711276488):
        static:
          warning(
            "Declaration of " & "enum_duckdb_statement_type" &
              " exists but with different size"
          )
      enum_duckdb_statement_type
    else:
      enum_duckdb_statement_type_1711276488
  )
  duckdb_vector_1711276580 = (
    when declared(duckdb_vector):
      when ownSizeof(duckdb_vector) != ownSizeof(duckdb_vector_1711276579):
        static:
          warning(
            "Declaration of " & "duckdb_vector" & " exists but with different size"
          )
      duckdb_vector
    else:
      duckdb_vector_1711276579
  )
  struct_duckdb_table_description_1711276618 = (
    when declared(struct_duckdb_table_description):
      when ownSizeof(struct_duckdb_table_description) !=
          ownSizeof(struct_duckdb_table_description_1711276617):
        static:
          warning(
            "Declaration of " & "struct_duckdb_table_description" &
              " exists but with different size"
          )
      struct_duckdb_table_description
    else:
      struct_duckdb_table_description_1711276617
  )
  duckdb_interval_1711276541 = (
    when declared(duckdb_interval):
      when ownSizeof(duckdb_interval) != ownSizeof(duckdb_interval_1711276540):
        static:
          warning(
            "Declaration of " & "duckdb_interval" & " exists but with different size"
          )
      duckdb_interval
    else:
      duckdb_interval_1711276540
  )
  duckdb_create_type_info_1711276632 = (
    when declared(duckdb_create_type_info):
      when ownSizeof(duckdb_create_type_info) !=
          ownSizeof(duckdb_create_type_info_1711276631):
        static:
          warning(
            "Declaration of " & "duckdb_create_type_info" &
              " exists but with different size"
          )
      duckdb_create_type_info
    else:
      duckdb_create_type_info_1711276631
  )
  duckdb_pending_result_1711276612 = (
    when declared(duckdb_pending_result):
      when ownSizeof(duckdb_pending_result) !=
          ownSizeof(duckdb_pending_result_1711276611):
        static:
          warning(
            "Declaration of " & "duckdb_pending_result" &
              " exists but with different size"
          )
      duckdb_pending_result
    else:
      duckdb_pending_result_1711276611
  )
  struct_duckdb_aggregate_state_1711276672 = (
    when declared(struct_duckdb_aggregate_state):
      when ownSizeof(struct_duckdb_aggregate_state) !=
          ownSizeof(struct_duckdb_aggregate_state_1711276671):
        static:
          warning(
            "Declaration of " & "struct_duckdb_aggregate_state" &
              " exists but with different size"
          )
      struct_duckdb_aggregate_state
    else:
      struct_duckdb_aggregate_state_1711276671
  )
  enum_duckdb_pending_state_1711276481 = (
    when declared(enum_duckdb_pending_state):
      when ownSizeof(enum_duckdb_pending_state) !=
          ownSizeof(enum_duckdb_pending_state_1711276480):
        static:
          warning(
            "Declaration of " & "enum_duckdb_pending_state" &
              " exists but with different size"
          )
      enum_duckdb_pending_state
    else:
      enum_duckdb_pending_state_1711276480
  )
  duckdb_string_1711276584 = (
    when declared(duckdb_string):
      when ownSizeof(duckdb_string) != ownSizeof(duckdb_string_1711276583):
        static:
          warning(
            "Declaration of " & "duckdb_string" & " exists but with different size"
          )
      duckdb_string
    else:
      duckdb_string_1711276583
  )
  duckdb_config_1711276624 = (
    when declared(duckdb_config):
      when ownSizeof(duckdb_config) != ownSizeof(duckdb_config_1711276623):
        static:
          warning(
            "Declaration of " & "duckdb_config" & " exists but with different size"
          )
      duckdb_config
    else:
      duckdb_config_1711276623
  )
  duckdb_prepared_statement_1711276604 = (
    when declared(duckdb_prepared_statement):
      when ownSizeof(duckdb_prepared_statement) !=
          ownSizeof(duckdb_prepared_statement_1711276603):
        static:
          warning(
            "Declaration of " & "duckdb_prepared_statement" &
              " exists but with different size"
          )
      duckdb_prepared_statement
    else:
      duckdb_prepared_statement_1711276603
  )
  duckdb_aggregate_update_t_1711276682 = (
    when declared(duckdb_aggregate_update_t):
      when ownSizeof(duckdb_aggregate_update_t) !=
          ownSizeof(duckdb_aggregate_update_t_1711276681):
        static:
          warning(
            "Declaration of " & "duckdb_aggregate_update_t" &
              " exists but with different size"
          )
      duckdb_aggregate_update_t
    else:
      duckdb_aggregate_update_t_1711276681
  )
  struct_duckdb_pending_result_1711276610 = (
    when declared(struct_duckdb_pending_result):
      when ownSizeof(struct_duckdb_pending_result) !=
          ownSizeof(struct_duckdb_pending_result_1711276609):
        static:
          warning(
            "Declaration of " & "struct_duckdb_pending_result" &
              " exists but with different size"
          )
      struct_duckdb_pending_result
    else:
      struct_duckdb_pending_result_1711276609
  )
  duckdb_bind_info_1711276694 = (
    when declared(duckdb_bind_info):
      when ownSizeof(duckdb_bind_info) != ownSizeof(duckdb_bind_info_1711276693):
        static:
          warning(
            "Declaration of " & "duckdb_bind_info" & " exists but with different size"
          )
      duckdb_bind_info
    else:
      duckdb_bind_info_1711276693
  )
  struct_duckdb_result_1711276590 = (
    when declared(struct_duckdb_result):
      when ownSizeof(struct_duckdb_result) != ownSizeof(struct_duckdb_result_1711276589):
        static:
          warning(
            "Declaration of " & "struct_duckdb_result" &
              " exists but with different size"
          )
      struct_duckdb_result
    else:
      struct_duckdb_result_1711276589
  )
  duckdb_time_tz_struct_1711276529 = (
    when declared(duckdb_time_tz_struct):
      when ownSizeof(duckdb_time_tz_struct) !=
          ownSizeof(duckdb_time_tz_struct_1711276528):
        static:
          warning(
            "Declaration of " & "duckdb_time_tz_struct" &
              " exists but with different size"
          )
      duckdb_time_tz_struct
    else:
      duckdb_time_tz_struct_1711276528
  )
  duckdb_aggregate_destroy_t_1711276680 = (
    when declared(duckdb_aggregate_destroy_t):
      when ownSizeof(duckdb_aggregate_destroy_t) !=
          ownSizeof(duckdb_aggregate_destroy_t_1711276679):
        static:
          warning(
            "Declaration of " & "duckdb_aggregate_destroy_t" &
              " exists but with different size"
          )
      duckdb_aggregate_destroy_t
    else:
      duckdb_aggregate_destroy_t_1711276679
  )
  struct_duckdb_profiling_info_1711276642 = (
    when declared(struct_duckdb_profiling_info):
      when ownSizeof(struct_duckdb_profiling_info) !=
          ownSizeof(struct_duckdb_profiling_info_1711276641):
        static:
          warning(
            "Declaration of " & "struct_duckdb_profiling_info" &
              " exists but with different size"
          )
      struct_duckdb_profiling_info
    else:
      struct_duckdb_profiling_info_1711276641
  )
  duckdb_cast_function_1711276708 = (
    when declared(duckdb_cast_function):
      when ownSizeof(duckdb_cast_function) != ownSizeof(duckdb_cast_function_1711276707):
        static:
          warning(
            "Declaration of " & "duckdb_cast_function" &
              " exists but with different size"
          )
      duckdb_cast_function
    else:
      duckdb_cast_function_1711276707
  )
  duckdb_timestamp_1711276533 = (
    when declared(duckdb_timestamp):
      when ownSizeof(duckdb_timestamp) != ownSizeof(duckdb_timestamp_1711276532):
        static:
          warning(
            "Declaration of " & "duckdb_timestamp" & " exists but with different size"
          )
      duckdb_timestamp
    else:
      duckdb_timestamp_1711276532
  )
  struct_duckdb_extension_info_1711276646 = (
    when declared(struct_duckdb_extension_info):
      when ownSizeof(struct_duckdb_extension_info) !=
          ownSizeof(struct_duckdb_extension_info_1711276645):
        static:
          warning(
            "Declaration of " & "struct_duckdb_extension_info" &
              " exists but with different size"
          )
      struct_duckdb_extension_info
    else:
      struct_duckdb_extension_info_1711276645
  )
  duckdb_aggregate_state_1711276674 = (
    when declared(duckdb_aggregate_state):
      when ownSizeof(duckdb_aggregate_state) !=
          ownSizeof(duckdb_aggregate_state_1711276673):
        static:
          warning(
            "Declaration of " & "duckdb_aggregate_state" &
              " exists but with different size"
          )
      duckdb_aggregate_state
    else:
      duckdb_aggregate_state_1711276673
  )
  duckdb_time_struct_1711276521 = (
    when declared(duckdb_time_struct):
      when ownSizeof(duckdb_time_struct) != ownSizeof(duckdb_time_struct_1711276520):
        static:
          warning(
            "Declaration of " & "duckdb_time_struct" & " exists but with different size"
          )
      duckdb_time_struct
    else:
      duckdb_time_struct_1711276520
  )
  duckdb_statement_type_1711276491 = (
    when declared(duckdb_statement_type):
      when ownSizeof(duckdb_statement_type) !=
          ownSizeof(duckdb_statement_type_1711276490):
        static:
          warning(
            "Declaration of " & "duckdb_statement_type" &
              " exists but with different size"
          )
      duckdb_statement_type
    else:
      duckdb_statement_type_1711276490
  )
  struct_duckdb_uhugeint_1711276547 = (
    when declared(struct_duckdb_uhugeint):
      when ownSizeof(struct_duckdb_uhugeint) !=
          ownSizeof(struct_duckdb_uhugeint_1711276546):
        static:
          warning(
            "Declaration of " & "struct_duckdb_uhugeint" &
              " exists but with different size"
          )
      struct_duckdb_uhugeint
    else:
      struct_duckdb_uhugeint_1711276546
  )
  duckdb_column_1711276576 = (
    when declared(duckdb_column):
      when ownSizeof(duckdb_column) != ownSizeof(duckdb_column_1711276575):
        static:
          warning(
            "Declaration of " & "duckdb_column" & " exists but with different size"
          )
      duckdb_column
    else:
      duckdb_column_1711276575
  )
  struct_duckdb_replacement_scan_info_1711276712 = (
    when declared(struct_duckdb_replacement_scan_info):
      when ownSizeof(struct_duckdb_replacement_scan_info) !=
          ownSizeof(struct_duckdb_replacement_scan_info_1711276711):
        static:
          warning(
            "Declaration of " & "struct_duckdb_replacement_scan_info" &
              " exists but with different size"
          )
      struct_duckdb_replacement_scan_info
    else:
      struct_duckdb_replacement_scan_info_1711276711
  )
  duckdb_result_1711276592 = (
    when declared(duckdb_result):
      when ownSizeof(duckdb_result) != ownSizeof(duckdb_result_1711276591):
        static:
          warning(
            "Declaration of " & "duckdb_result" & " exists but with different size"
          )
      duckdb_result
    else:
      duckdb_result_1711276591
  )
  duckdb_aggregate_state_size_1711276676 = (
    when declared(duckdb_aggregate_state_size):
      when ownSizeof(duckdb_aggregate_state_size) !=
          ownSizeof(duckdb_aggregate_state_size_1711276675):
        static:
          warning(
            "Declaration of " & "duckdb_aggregate_state_size" &
              " exists but with different size"
          )
      duckdb_aggregate_state_size
    else:
      duckdb_aggregate_state_size_1711276675
  )
  struct_duckdb_arrow_stream_1711276722 = (
    when declared(struct_duckdb_arrow_stream):
      when ownSizeof(struct_duckdb_arrow_stream) !=
          ownSizeof(struct_duckdb_arrow_stream_1711276721):
        static:
          warning(
            "Declaration of " & "struct_duckdb_arrow_stream" &
              " exists but with different size"
          )
      struct_duckdb_arrow_stream
    else:
      struct_duckdb_arrow_stream_1711276721
  )
  duckdb_scalar_function_t_1711276662 = (
    when declared(duckdb_scalar_function_t):
      when ownSizeof(duckdb_scalar_function_t) !=
          ownSizeof(duckdb_scalar_function_t_1711276661):
        static:
          warning(
            "Declaration of " & "duckdb_scalar_function_t" &
              " exists but with different size"
          )
      duckdb_scalar_function_t
    else:
      duckdb_scalar_function_t_1711276661
  )
  duckdb_cast_mode_1711276499 = (
    when declared(duckdb_cast_mode):
      when ownSizeof(duckdb_cast_mode) != ownSizeof(duckdb_cast_mode_1711276498):
        static:
          warning(
            "Declaration of " & "duckdb_cast_mode" & " exists but with different size"
          )
      duckdb_cast_mode
    else:
      duckdb_cast_mode_1711276498
  )
  struct_duckdb_aggregate_function_set_1711276668 = (
    when declared(struct_duckdb_aggregate_function_set):
      when ownSizeof(struct_duckdb_aggregate_function_set) !=
          ownSizeof(struct_duckdb_aggregate_function_set_1711276667):
        static:
          warning(
            "Declaration of " & "struct_duckdb_aggregate_function_set" &
              " exists but with different size"
          )
      struct_duckdb_aggregate_function_set
    else:
      struct_duckdb_aggregate_function_set_1711276667
  )
  struct_duckdb_time_1711276515 = (
    when declared(struct_duckdb_time):
      when ownSizeof(struct_duckdb_time) != ownSizeof(struct_duckdb_time_1711276514):
        static:
          warning(
            "Declaration of " & "struct_duckdb_time" & " exists but with different size"
          )
      struct_duckdb_time
    else:
      struct_duckdb_time_1711276514
  )
  struct_duckdb_time_tz_struct_1711276527 = (
    when declared(struct_duckdb_time_tz_struct):
      when ownSizeof(struct_duckdb_time_tz_struct) !=
          ownSizeof(struct_duckdb_time_tz_struct_1711276526):
        static:
          warning(
            "Declaration of " & "struct_duckdb_time_tz_struct" &
              " exists but with different size"
          )
      struct_duckdb_time_tz_struct
    else:
      struct_duckdb_time_tz_struct_1711276526
  )
  duckdb_string_t_1711276568 = (
    when declared(duckdb_string_t):
      when ownSizeof(duckdb_string_t) != ownSizeof(duckdb_string_t_1711276560):
        static:
          warning(
            "Declaration of " & "duckdb_string_t" & " exists but with different size"
          )
      duckdb_string_t
    else:
      duckdb_string_t_1711276560
  )
  struct_duckdb_table_function_1711276688 = (
    when declared(struct_duckdb_table_function):
      when ownSizeof(struct_duckdb_table_function) !=
          ownSizeof(struct_duckdb_table_function_1711276687):
        static:
          warning(
            "Declaration of " & "struct_duckdb_table_function" &
              " exists but with different size"
          )
      struct_duckdb_table_function
    else:
      struct_duckdb_table_function_1711276687
  )
  struct_duckdb_arrow_array_1711276730 = (
    when declared(struct_duckdb_arrow_array):
      when ownSizeof(struct_duckdb_arrow_array) !=
          ownSizeof(struct_duckdb_arrow_array_1711276729):
        static:
          warning(
            "Declaration of " & "struct_duckdb_arrow_array" &
              " exists but with different size"
          )
      struct_duckdb_arrow_array
    else:
      struct_duckdb_arrow_array_1711276729
  )
  duckdb_extension_info_1711276648 = (
    when declared(duckdb_extension_info):
      when ownSizeof(duckdb_extension_info) !=
          ownSizeof(duckdb_extension_info_1711276647):
        static:
          warning(
            "Declaration of " & "duckdb_extension_info" &
              " exists but with different size"
          )
      duckdb_extension_info
    else:
      duckdb_extension_info_1711276647
  )
  struct_duckdb_init_info_1711276696 = (
    when declared(struct_duckdb_init_info):
      when ownSizeof(struct_duckdb_init_info) !=
          ownSizeof(struct_duckdb_init_info_1711276695):
        static:
          warning(
            "Declaration of " & "struct_duckdb_init_info" &
              " exists but with different size"
          )
      struct_duckdb_init_info
    else:
      struct_duckdb_init_info_1711276695
  )
  struct_duckdb_connection_1711276598 = (
    when declared(struct_duckdb_connection):
      when ownSizeof(struct_duckdb_connection) !=
          ownSizeof(struct_duckdb_connection_1711276597):
        static:
          warning(
            "Declaration of " & "struct_duckdb_connection" &
              " exists but with different size"
          )
      struct_duckdb_connection
    else:
      struct_duckdb_connection_1711276597
  )
  struct_duckdb_logical_type_1711276626 = (
    when declared(struct_duckdb_logical_type):
      when ownSizeof(struct_duckdb_logical_type) !=
          ownSizeof(struct_duckdb_logical_type_1711276625):
        static:
          warning(
            "Declaration of " & "struct_duckdb_logical_type" &
              " exists but with different size"
          )
      struct_duckdb_logical_type
    else:
      struct_duckdb_logical_type_1711276625
  )
  struct_duckdb_date_1711276507 = (
    when declared(struct_duckdb_date):
      when ownSizeof(struct_duckdb_date) != ownSizeof(struct_duckdb_date_1711276506):
        static:
          warning(
            "Declaration of " & "struct_duckdb_date" & " exists but with different size"
          )
      struct_duckdb_date
    else:
      struct_duckdb_date_1711276506
  )
  duckdb_aggregate_finalize_t_1711276686 = (
    when declared(duckdb_aggregate_finalize_t):
      when ownSizeof(duckdb_aggregate_finalize_t) !=
          ownSizeof(duckdb_aggregate_finalize_t_1711276685):
        static:
          warning(
            "Declaration of " & "duckdb_aggregate_finalize_t" &
              " exists but with different size"
          )
      duckdb_aggregate_finalize_t
    else:
      duckdb_aggregate_finalize_t_1711276685
  )
  struct_duckdb_value_1711276638 = (
    when declared(struct_duckdb_value):
      when ownSizeof(struct_duckdb_value) != ownSizeof(struct_duckdb_value_1711276637):
        static:
          warning(
            "Declaration of " & "struct_duckdb_value" & " exists but with different size"
          )
      struct_duckdb_value
    else:
      struct_duckdb_value_1711276637
  )
  duckdb_arrow_schema_1711276728 = (
    when declared(duckdb_arrow_schema):
      when ownSizeof(duckdb_arrow_schema) != ownSizeof(duckdb_arrow_schema_1711276727):
        static:
          warning(
            "Declaration of " & "duckdb_arrow_schema" & " exists but with different size"
          )
      duckdb_arrow_schema
    else:
      duckdb_arrow_schema_1711276727
  )
  struct_duckdb_config_1711276622 = (
    when declared(struct_duckdb_config):
      when ownSizeof(struct_duckdb_config) != ownSizeof(struct_duckdb_config_1711276621):
        static:
          warning(
            "Declaration of " & "struct_duckdb_config" &
              " exists but with different size"
          )
      struct_duckdb_config
    else:
      struct_duckdb_config_1711276621
  )
  duckdb_table_function_init_t_1711276702 = (
    when declared(duckdb_table_function_init_t):
      when ownSizeof(duckdb_table_function_init_t) !=
          ownSizeof(duckdb_table_function_init_t_1711276701):
        static:
          warning(
            "Declaration of " & "duckdb_table_function_init_t" &
              " exists but with different size"
          )
      duckdb_table_function_init_t
    else:
      duckdb_table_function_init_t_1711276701
  )
  struct_duckdb_list_entry_1711276570 = (
    when declared(struct_duckdb_list_entry):
      when ownSizeof(struct_duckdb_list_entry) !=
          ownSizeof(struct_duckdb_list_entry_1711276569):
        static:
          warning(
            "Declaration of " & "struct_duckdb_list_entry" &
              " exists but with different size"
          )
      struct_duckdb_list_entry
    else:
      struct_duckdb_list_entry_1711276569
  )
  struct_duckdb_appender_1711276614 = (
    when declared(struct_duckdb_appender):
      when ownSizeof(struct_duckdb_appender) !=
          ownSizeof(struct_duckdb_appender_1711276613):
        static:
          warning(
            "Declaration of " & "struct_duckdb_appender" &
              " exists but with different size"
          )
      struct_duckdb_appender
    else:
      struct_duckdb_appender_1711276613
  )
  duckdb_data_chunk_1711276636 = (
    when declared(duckdb_data_chunk):
      when ownSizeof(duckdb_data_chunk) != ownSizeof(duckdb_data_chunk_1711276635):
        static:
          warning(
            "Declaration of " & "duckdb_data_chunk" & " exists but with different size"
          )
      duckdb_data_chunk
    else:
      duckdb_data_chunk_1711276635
  )
  struct_duckdb_timestamp_struct_1711276535 = (
    when declared(struct_duckdb_timestamp_struct):
      when ownSizeof(struct_duckdb_timestamp_struct) !=
          ownSizeof(struct_duckdb_timestamp_struct_1711276534):
        static:
          warning(
            "Declaration of " & "struct_duckdb_timestamp_struct" &
              " exists but with different size"
          )
      struct_duckdb_timestamp_struct
    else:
      struct_duckdb_timestamp_struct_1711276534
  )
  duckdb_arrow_array_1711276732 = (
    when declared(duckdb_arrow_array):
      when ownSizeof(duckdb_arrow_array) != ownSizeof(duckdb_arrow_array_1711276731):
        static:
          warning(
            "Declaration of " & "duckdb_arrow_array" & " exists but with different size"
          )
      duckdb_arrow_array
    else:
      duckdb_arrow_array_1711276731
  )
  duckdb_appender_1711276616 = (
    when declared(duckdb_appender):
      when ownSizeof(duckdb_appender) != ownSizeof(duckdb_appender_1711276615):
        static:
          warning(
            "Declaration of " & "duckdb_appender" & " exists but with different size"
          )
      duckdb_appender
    else:
      duckdb_appender_1711276615
  )
  duckdb_error_type_1711276495 = (
    when declared(duckdb_error_type):
      when ownSizeof(duckdb_error_type) != ownSizeof(duckdb_error_type_1711276494):
        static:
          warning(
            "Declaration of " & "duckdb_error_type" & " exists but with different size"
          )
      duckdb_error_type
    else:
      duckdb_error_type_1711276494
  )
  duckdb_extracted_statements_1711276608 = (
    when declared(duckdb_extracted_statements):
      when ownSizeof(duckdb_extracted_statements) !=
          ownSizeof(duckdb_extracted_statements_1711276607):
        static:
          warning(
            "Declaration of " & "duckdb_extracted_statements" &
              " exists but with different size"
          )
      duckdb_extracted_statements
    else:
      duckdb_extracted_statements_1711276607
  )
  struct_duckdb_function_info_1711276650 = (
    when declared(struct_duckdb_function_info):
      when ownSizeof(struct_duckdb_function_info) !=
          ownSizeof(struct_duckdb_function_info_1711276649):
        static:
          warning(
            "Declaration of " & "struct_duckdb_function_info" &
              " exists but with different size"
          )
      struct_duckdb_function_info
    else:
      struct_duckdb_function_info_1711276649
  )
  enum_DUCKDB_TYPE_1711276473 = (
    when declared(enum_DUCKDB_TYPE):
      when ownSizeof(enum_DUCKDB_TYPE) != ownSizeof(enum_DUCKDB_TYPE_1711276471):
        static:
          warning(
            "Declaration of " & "enum_DUCKDB_TYPE" & " exists but with different size"
          )
      enum_DUCKDB_TYPE
    else:
      enum_DUCKDB_TYPE_1711276471
  )
  duckdb_result_type_1711276487 = (
    when declared(duckdb_result_type):
      when ownSizeof(duckdb_result_type) != ownSizeof(duckdb_result_type_1711276486):
        static:
          warning(
            "Declaration of " & "duckdb_result_type" & " exists but with different size"
          )
      duckdb_result_type
    else:
      duckdb_result_type_1711276486
  )
  duckdb_state_1711276479 = (
    when declared(duckdb_state):
      when ownSizeof(duckdb_state) != ownSizeof(duckdb_state_1711276478):
        static:
          warning(
            "Declaration of " & "duckdb_state" & " exists but with different size"
          )
      duckdb_state
    else:
      duckdb_state_1711276478
  )
  enum_duckdb_result_type_1711276485 = (
    when declared(enum_duckdb_result_type):
      when ownSizeof(enum_duckdb_result_type) !=
          ownSizeof(enum_duckdb_result_type_1711276484):
        static:
          warning(
            "Declaration of " & "enum_duckdb_result_type" &
              " exists but with different size"
          )
      enum_duckdb_result_type
    else:
      enum_duckdb_result_type_1711276484
  )
  duckdb_hugeint_1711276545 = (
    when declared(duckdb_hugeint):
      when ownSizeof(duckdb_hugeint) != ownSizeof(duckdb_hugeint_1711276544):
        static:
          warning(
            "Declaration of " & "duckdb_hugeint" & " exists but with different size"
          )
      duckdb_hugeint
    else:
      duckdb_hugeint_1711276544
  )

when not declared(duckdb_time):
  type duckdb_time* = duckdb_time_1711276516
else:
  static:
    hint("Declaration of " & "duckdb_time" & " already exists, not redeclaring")
when not declared(enum_duckdb_cast_mode):
  type enum_duckdb_cast_mode* = enum_duckdb_cast_mode_1711276496
else:
  static:
    hint(
      "Declaration of " & "enum_duckdb_cast_mode" & " already exists, not redeclaring"
    )
when not declared(duckdb_function_info):
  type duckdb_function_info* = duckdb_function_info_1711276651
else:
  static:
    hint(
      "Declaration of " & "duckdb_function_info" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_scalar_function_set):
  type struct_duckdb_scalar_function_set* = struct_duckdb_scalar_function_set_1711276657
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_scalar_function_set" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_column):
  type struct_duckdb_column* = struct_duckdb_column_1711276573
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_column" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_database):
  type struct_duckdb_database* = struct_duckdb_database_1711276593
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_database" & " already exists, not redeclaring"
    )
when not declared(duckdb_date_struct):
  type duckdb_date_struct* = duckdb_date_struct_1711276512
else:
  static:
    hint("Declaration of " & "duckdb_date_struct" & " already exists, not redeclaring")
when not declared(duckdb_decimal):
  type duckdb_decimal* = duckdb_decimal_1711276552
else:
  static:
    hint("Declaration of " & "duckdb_decimal" & " already exists, not redeclaring")
when not declared(struct_duckdb_decimal):
  type struct_duckdb_decimal* = struct_duckdb_decimal_1711276550
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_decimal" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_cast_function):
  type struct_duckdb_cast_function* = struct_duckdb_cast_function_1711276705
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_cast_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_database):
  type duckdb_database* = duckdb_database_1711276595
else:
  static:
    hint("Declaration of " & "duckdb_database" & " already exists, not redeclaring")
when not declared(duckdb_aggregate_function):
  type duckdb_aggregate_function* = duckdb_aggregate_function_1711276665
else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_function_set):
  type duckdb_aggregate_function_set* = duckdb_aggregate_function_set_1711276669
else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function_set" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_arrow):
  type duckdb_arrow* = duckdb_arrow_1711276719
else:
  static:
    hint("Declaration of " & "duckdb_arrow" & " already exists, not redeclaring")
when not declared(struct_duckdb_string_t):
  type struct_duckdb_string_t* = struct_duckdb_string_t_1711276558
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_string_t" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_data_chunk):
  type struct_duckdb_data_chunk* = struct_duckdb_data_chunk_1711276633
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_data_chunk" & " already exists, not redeclaring"
    )
when not declared(duckdb_arrow_stream):
  type duckdb_arrow_stream* = duckdb_arrow_stream_1711276723
else:
  static:
    hint("Declaration of " & "duckdb_arrow_stream" & " already exists, not redeclaring")
when not declared(duckdb_cast_function_t):
  type duckdb_cast_function_t* = duckdb_cast_function_t_1711276709
else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function_t" & " already exists, not redeclaring"
    )
when not declared(idx_t):
  type idx_t* = idx_t_1711276500
else:
  static:
    hint("Declaration of " & "idx_t" & " already exists, not redeclaring")
when not declared(struct_duckdb_extracted_statements):
  type struct_duckdb_extracted_statements* =
    struct_duckdb_extracted_statements_1711276605

else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_extracted_statements" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_bind_info):
  type struct_duckdb_bind_info* = struct_duckdb_bind_info_1711276691
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_bind_info" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_time_tz):
  type struct_duckdb_time_tz* = struct_duckdb_time_tz_1711276522
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_time_tz" & " already exists, not redeclaring"
    )
when not declared(duckdb_uhugeint):
  type duckdb_uhugeint* = duckdb_uhugeint_1711276548
else:
  static:
    hint("Declaration of " & "duckdb_uhugeint" & " already exists, not redeclaring")
when not declared(struct_duckdb_create_type_info):
  type struct_duckdb_create_type_info* = struct_duckdb_create_type_info_1711276629
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_create_type_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_blob):
  type duckdb_blob* = duckdb_blob_1711276587
else:
  static:
    hint("Declaration of " & "duckdb_blob" & " already exists, not redeclaring")
when not declared(duckdb_aggregate_init_t):
  type duckdb_aggregate_init_t* = duckdb_aggregate_init_t_1711276677
else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_init_t" & " already exists, not redeclaring"
    )
when not declared(duckdb_type):
  type duckdb_type* = duckdb_type_1711276474
else:
  static:
    hint("Declaration of " & "duckdb_type" & " already exists, not redeclaring")
when not declared(struct_duckdb_string):
  type struct_duckdb_string* = struct_duckdb_string_1711276581
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_string" & " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_t):
  type duckdb_table_function_t* = duckdb_table_function_t_1711276703
else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_t" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_time_struct):
  type struct_duckdb_time_struct* = struct_duckdb_time_struct_1711276518
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_time_struct" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_task_state):
  type duckdb_task_state* = duckdb_task_state_1711276504
else:
  static:
    hint("Declaration of " & "duckdb_task_state" & " already exists, not redeclaring")
when not declared(duckdb_scalar_function):
  type duckdb_scalar_function* = duckdb_scalar_function_1711276655
else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_query_progress_type):
  type struct_duckdb_query_progress_type* = struct_duckdb_query_progress_type_1711276554
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_query_progress_type" &
        " already exists, not redeclaring"
    )
when not declared(enum_duckdb_error_type):
  type enum_duckdb_error_type* = enum_duckdb_error_type_1711276492
else:
  static:
    hint(
      "Declaration of " & "enum_duckdb_error_type" & " already exists, not redeclaring"
    )
when not declared(duckdb_pending_state):
  type duckdb_pending_state* = duckdb_pending_state_1711276482
else:
  static:
    hint(
      "Declaration of " & "duckdb_pending_state" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_timestamp):
  type struct_duckdb_timestamp* = struct_duckdb_timestamp_1711276530
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_timestamp" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_hugeint):
  type struct_duckdb_hugeint* = struct_duckdb_hugeint_1711276542
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_hugeint" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_blob):
  type struct_duckdb_blob* = struct_duckdb_blob_1711276585
else:
  static:
    hint("Declaration of " & "struct_duckdb_blob" & " already exists, not redeclaring")
when not declared(enum_duckdb_state):
  type enum_duckdb_state* = enum_duckdb_state_1711276476
else:
  static:
    hint("Declaration of " & "enum_duckdb_state" & " already exists, not redeclaring")
when not declared(duckdb_aggregate_combine_t):
  type duckdb_aggregate_combine_t* = duckdb_aggregate_combine_t_1711276683
else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_combine_t" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_bind_t):
  type duckdb_table_function_bind_t* = duckdb_table_function_bind_t_1711276699
else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_bind_t" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_extension_access):
  type struct_duckdb_extension_access* = struct_duckdb_extension_access_1711276733
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_extension_access" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_set):
  type duckdb_scalar_function_set* = duckdb_scalar_function_set_1711276659
else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_set" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_value):
  type duckdb_value* = duckdb_value_1711276639
else:
  static:
    hint("Declaration of " & "duckdb_value" & " already exists, not redeclaring")
when not declared(duckdb_delete_callback_t):
  type duckdb_delete_callback_t* = duckdb_delete_callback_t_1711276502
else:
  static:
    hint(
      "Declaration of " & "duckdb_delete_callback_t" & " already exists, not redeclaring"
    )
when not declared(duckdb_list_entry):
  type duckdb_list_entry* = duckdb_list_entry_1711276571
else:
  static:
    hint("Declaration of " & "duckdb_list_entry" & " already exists, not redeclaring")
when not declared(struct_duckdb_scalar_function):
  type struct_duckdb_scalar_function* = struct_duckdb_scalar_function_1711276653
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_scalar_function" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_vector):
  type struct_duckdb_vector* = struct_duckdb_vector_1711276577
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_vector" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_interval):
  type struct_duckdb_interval* = struct_duckdb_interval_1711276538
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_interval" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_arrow):
  type struct_duckdb_arrow* = struct_duckdb_arrow_1711276717
else:
  static:
    hint("Declaration of " & "struct_duckdb_arrow" & " already exists, not redeclaring")
when not declared(duckdb_timestamp_struct):
  type duckdb_timestamp_struct* = duckdb_timestamp_struct_1711276536
else:
  static:
    hint(
      "Declaration of " & "duckdb_timestamp_struct" & " already exists, not redeclaring"
    )
when not declared(duckdb_query_progress_type):
  type duckdb_query_progress_type* = duckdb_query_progress_type_1711276556
else:
  static:
    hint(
      "Declaration of " & "duckdb_query_progress_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_init_info):
  type duckdb_init_info* = duckdb_init_info_1711276697
else:
  static:
    hint("Declaration of " & "duckdb_init_info" & " already exists, not redeclaring")
when not declared(duckdb_table_function):
  type duckdb_table_function* = duckdb_table_function_1711276689
else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function" & " already exists, not redeclaring"
    )
when not declared(duckdb_replacement_scan_info):
  type duckdb_replacement_scan_info* = duckdb_replacement_scan_info_1711276713
else:
  static:
    hint(
      "Declaration of " & "duckdb_replacement_scan_info" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_prepared_statement):
  type struct_duckdb_prepared_statement* = struct_duckdb_prepared_statement_1711276601
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_prepared_statement" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_replacement_callback_t):
  type duckdb_replacement_callback_t* = duckdb_replacement_callback_t_1711276715
else:
  static:
    hint(
      "Declaration of " & "duckdb_replacement_callback_t" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_logical_type):
  type duckdb_logical_type* = duckdb_logical_type_1711276627
else:
  static:
    hint("Declaration of " & "duckdb_logical_type" & " already exists, not redeclaring")
when not declared(duckdb_profiling_info):
  type duckdb_profiling_info* = duckdb_profiling_info_1711276643
else:
  static:
    hint(
      "Declaration of " & "duckdb_profiling_info" & " already exists, not redeclaring"
    )
when not declared(duckdb_date):
  type duckdb_date* = duckdb_date_1711276508
else:
  static:
    hint("Declaration of " & "duckdb_date" & " already exists, not redeclaring")
when not declared(duckdb_table_description):
  type duckdb_table_description* = duckdb_table_description_1711276619
else:
  static:
    hint(
      "Declaration of " & "duckdb_table_description" & " already exists, not redeclaring"
    )
when not declared(duckdb_connection):
  type duckdb_connection* = duckdb_connection_1711276599
else:
  static:
    hint("Declaration of " & "duckdb_connection" & " already exists, not redeclaring")
when not declared(struct_duckdb_date_struct):
  type struct_duckdb_date_struct* = struct_duckdb_date_struct_1711276510
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_date_struct" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_arrow_schema):
  type struct_duckdb_arrow_schema* = struct_duckdb_arrow_schema_1711276725
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_arrow_schema" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_time_tz):
  type duckdb_time_tz* = duckdb_time_tz_1711276524
else:
  static:
    hint("Declaration of " & "duckdb_time_tz" & " already exists, not redeclaring")
when not declared(struct_duckdb_aggregate_function):
  type struct_duckdb_aggregate_function* = struct_duckdb_aggregate_function_1711276663
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_aggregate_function" &
        " already exists, not redeclaring"
    )
when not declared(enum_duckdb_statement_type):
  type enum_duckdb_statement_type* = enum_duckdb_statement_type_1711276488
else:
  static:
    hint(
      "Declaration of " & "enum_duckdb_statement_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_vector):
  type duckdb_vector* = duckdb_vector_1711276579
else:
  static:
    hint("Declaration of " & "duckdb_vector" & " already exists, not redeclaring")
when not declared(struct_duckdb_table_description):
  type struct_duckdb_table_description* = struct_duckdb_table_description_1711276617
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_table_description" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_interval):
  type duckdb_interval* = duckdb_interval_1711276540
else:
  static:
    hint("Declaration of " & "duckdb_interval" & " already exists, not redeclaring")
when not declared(duckdb_create_type_info):
  type duckdb_create_type_info* = duckdb_create_type_info_1711276631
else:
  static:
    hint(
      "Declaration of " & "duckdb_create_type_info" & " already exists, not redeclaring"
    )
when not declared(duckdb_pending_result):
  type duckdb_pending_result* = duckdb_pending_result_1711276611
else:
  static:
    hint(
      "Declaration of " & "duckdb_pending_result" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_aggregate_state):
  type struct_duckdb_aggregate_state* = struct_duckdb_aggregate_state_1711276671
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_aggregate_state" &
        " already exists, not redeclaring"
    )
when not declared(enum_duckdb_pending_state):
  type enum_duckdb_pending_state* = enum_duckdb_pending_state_1711276480
else:
  static:
    hint(
      "Declaration of " & "enum_duckdb_pending_state" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_string):
  type duckdb_string* = duckdb_string_1711276583
else:
  static:
    hint("Declaration of " & "duckdb_string" & " already exists, not redeclaring")
when not declared(duckdb_config):
  type duckdb_config* = duckdb_config_1711276623
else:
  static:
    hint("Declaration of " & "duckdb_config" & " already exists, not redeclaring")
when not declared(duckdb_prepared_statement):
  type duckdb_prepared_statement* = duckdb_prepared_statement_1711276603
else:
  static:
    hint(
      "Declaration of " & "duckdb_prepared_statement" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_update_t):
  type duckdb_aggregate_update_t* = duckdb_aggregate_update_t_1711276681
else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_update_t" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_pending_result):
  type struct_duckdb_pending_result* = struct_duckdb_pending_result_1711276609
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_pending_result" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_info):
  type duckdb_bind_info* = duckdb_bind_info_1711276693
else:
  static:
    hint("Declaration of " & "duckdb_bind_info" & " already exists, not redeclaring")
when not declared(struct_duckdb_result):
  type struct_duckdb_result* = struct_duckdb_result_1711276589
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_result" & " already exists, not redeclaring"
    )
when not declared(duckdb_time_tz_struct):
  type duckdb_time_tz_struct* = duckdb_time_tz_struct_1711276528
else:
  static:
    hint(
      "Declaration of " & "duckdb_time_tz_struct" & " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_destroy_t):
  type duckdb_aggregate_destroy_t* = duckdb_aggregate_destroy_t_1711276679
else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_destroy_t" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_profiling_info):
  type struct_duckdb_profiling_info* = struct_duckdb_profiling_info_1711276641
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_profiling_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_cast_function):
  type duckdb_cast_function* = duckdb_cast_function_1711276707
else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function" & " already exists, not redeclaring"
    )
when not declared(duckdb_timestamp):
  type duckdb_timestamp* = duckdb_timestamp_1711276532
else:
  static:
    hint("Declaration of " & "duckdb_timestamp" & " already exists, not redeclaring")
when not declared(struct_duckdb_extension_info):
  type struct_duckdb_extension_info* = struct_duckdb_extension_info_1711276645
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_extension_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_state):
  type duckdb_aggregate_state* = duckdb_aggregate_state_1711276673
else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_state" & " already exists, not redeclaring"
    )
when not declared(duckdb_time_struct):
  type duckdb_time_struct* = duckdb_time_struct_1711276520
else:
  static:
    hint("Declaration of " & "duckdb_time_struct" & " already exists, not redeclaring")
when not declared(duckdb_statement_type):
  type duckdb_statement_type* = duckdb_statement_type_1711276490
else:
  static:
    hint(
      "Declaration of " & "duckdb_statement_type" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_uhugeint):
  type struct_duckdb_uhugeint* = struct_duckdb_uhugeint_1711276546
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_uhugeint" & " already exists, not redeclaring"
    )
when not declared(duckdb_column):
  type duckdb_column* = duckdb_column_1711276575
else:
  static:
    hint("Declaration of " & "duckdb_column" & " already exists, not redeclaring")
when not declared(struct_duckdb_replacement_scan_info):
  type struct_duckdb_replacement_scan_info* =
    struct_duckdb_replacement_scan_info_1711276711

else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_replacement_scan_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_result):
  type duckdb_result* = duckdb_result_1711276591
else:
  static:
    hint("Declaration of " & "duckdb_result" & " already exists, not redeclaring")
when not declared(duckdb_aggregate_state_size):
  type duckdb_aggregate_state_size* = duckdb_aggregate_state_size_1711276675
else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_state_size" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_arrow_stream):
  type struct_duckdb_arrow_stream* = struct_duckdb_arrow_stream_1711276721
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_arrow_stream" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_t):
  type duckdb_scalar_function_t* = duckdb_scalar_function_t_1711276661
else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_t" & " already exists, not redeclaring"
    )
when not declared(duckdb_cast_mode):
  type duckdb_cast_mode* = duckdb_cast_mode_1711276498
else:
  static:
    hint("Declaration of " & "duckdb_cast_mode" & " already exists, not redeclaring")
when not declared(struct_duckdb_aggregate_function_set):
  type struct_duckdb_aggregate_function_set* =
    struct_duckdb_aggregate_function_set_1711276667

else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_aggregate_function_set" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_time):
  type struct_duckdb_time* = struct_duckdb_time_1711276514
else:
  static:
    hint("Declaration of " & "struct_duckdb_time" & " already exists, not redeclaring")
when not declared(struct_duckdb_time_tz_struct):
  type struct_duckdb_time_tz_struct* = struct_duckdb_time_tz_struct_1711276526
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_time_tz_struct" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_string_t):
  type duckdb_string_t* = duckdb_string_t_1711276560
else:
  static:
    hint("Declaration of " & "duckdb_string_t" & " already exists, not redeclaring")
when not declared(struct_duckdb_table_function):
  type struct_duckdb_table_function* = struct_duckdb_table_function_1711276687
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_table_function" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_arrow_array):
  type struct_duckdb_arrow_array* = struct_duckdb_arrow_array_1711276729
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_arrow_array" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_extension_info):
  type duckdb_extension_info* = duckdb_extension_info_1711276647
else:
  static:
    hint(
      "Declaration of " & "duckdb_extension_info" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_init_info):
  type struct_duckdb_init_info* = struct_duckdb_init_info_1711276695
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_init_info" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_connection):
  type struct_duckdb_connection* = struct_duckdb_connection_1711276597
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_connection" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_logical_type):
  type struct_duckdb_logical_type* = struct_duckdb_logical_type_1711276625
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_logical_type" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_date):
  type struct_duckdb_date* = struct_duckdb_date_1711276506
else:
  static:
    hint("Declaration of " & "struct_duckdb_date" & " already exists, not redeclaring")
when not declared(duckdb_aggregate_finalize_t):
  type duckdb_aggregate_finalize_t* = duckdb_aggregate_finalize_t_1711276685
else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_finalize_t" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_value):
  type struct_duckdb_value* = struct_duckdb_value_1711276637
else:
  static:
    hint("Declaration of " & "struct_duckdb_value" & " already exists, not redeclaring")
when not declared(duckdb_arrow_schema):
  type duckdb_arrow_schema* = duckdb_arrow_schema_1711276727
else:
  static:
    hint("Declaration of " & "duckdb_arrow_schema" & " already exists, not redeclaring")
when not declared(struct_duckdb_config):
  type struct_duckdb_config* = struct_duckdb_config_1711276621
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_config" & " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_init_t):
  type duckdb_table_function_init_t* = duckdb_table_function_init_t_1711276701
else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_init_t" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_list_entry):
  type struct_duckdb_list_entry* = struct_duckdb_list_entry_1711276569
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_list_entry" & " already exists, not redeclaring"
    )
when not declared(struct_duckdb_appender):
  type struct_duckdb_appender* = struct_duckdb_appender_1711276613
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_appender" & " already exists, not redeclaring"
    )
when not declared(duckdb_data_chunk):
  type duckdb_data_chunk* = duckdb_data_chunk_1711276635
else:
  static:
    hint("Declaration of " & "duckdb_data_chunk" & " already exists, not redeclaring")
when not declared(struct_duckdb_timestamp_struct):
  type struct_duckdb_timestamp_struct* = struct_duckdb_timestamp_struct_1711276534
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_timestamp_struct" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_arrow_array):
  type duckdb_arrow_array* = duckdb_arrow_array_1711276731
else:
  static:
    hint("Declaration of " & "duckdb_arrow_array" & " already exists, not redeclaring")
when not declared(duckdb_appender):
  type duckdb_appender* = duckdb_appender_1711276615
else:
  static:
    hint("Declaration of " & "duckdb_appender" & " already exists, not redeclaring")
when not declared(duckdb_error_type):
  type duckdb_error_type* = duckdb_error_type_1711276494
else:
  static:
    hint("Declaration of " & "duckdb_error_type" & " already exists, not redeclaring")
when not declared(duckdb_extracted_statements):
  type duckdb_extracted_statements* = duckdb_extracted_statements_1711276607
else:
  static:
    hint(
      "Declaration of " & "duckdb_extracted_statements" &
        " already exists, not redeclaring"
    )
when not declared(struct_duckdb_function_info):
  type struct_duckdb_function_info* = struct_duckdb_function_info_1711276649
else:
  static:
    hint(
      "Declaration of " & "struct_duckdb_function_info" &
        " already exists, not redeclaring"
    )
when not declared(enum_DUCKDB_TYPE):
  type enum_DUCKDB_TYPE* = enum_DUCKDB_TYPE_1711276471
else:
  static:
    hint("Declaration of " & "enum_DUCKDB_TYPE" & " already exists, not redeclaring")
when not declared(duckdb_result_type):
  type duckdb_result_type* = duckdb_result_type_1711276486
else:
  static:
    hint("Declaration of " & "duckdb_result_type" & " already exists, not redeclaring")
when not declared(duckdb_state):
  type duckdb_state* = duckdb_state_1711276478
else:
  static:
    hint("Declaration of " & "duckdb_state" & " already exists, not redeclaring")
when not declared(enum_duckdb_result_type):
  type enum_duckdb_result_type* = enum_duckdb_result_type_1711276484
else:
  static:
    hint(
      "Declaration of " & "enum_duckdb_result_type" & " already exists, not redeclaring"
    )
when not declared(duckdb_hugeint):
  type duckdb_hugeint* = duckdb_hugeint_1711276544
else:
  static:
    hint("Declaration of " & "duckdb_hugeint" & " already exists, not redeclaring")
when not declared(duckdb_open):
  proc duckdb_open*(
    path: cstring, out_database: ptr duckdb_database_1711276596
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_open".}

else:
  static:
    hint("Declaration of " & "duckdb_open" & " already exists, not redeclaring")
when not declared(duckdb_open_ext):
  proc duckdb_open_ext*(
    path: cstring,
    out_database: ptr duckdb_database_1711276596,
    config: duckdb_config_1711276624,
    out_error: ptr cstring,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_open_ext".}

else:
  static:
    hint("Declaration of " & "duckdb_open_ext" & " already exists, not redeclaring")
when not declared(duckdb_close):
  proc duckdb_close*(
    database: ptr duckdb_database_1711276596
  ): void {.cdecl, importc: "duckdb_close".}

else:
  static:
    hint("Declaration of " & "duckdb_close" & " already exists, not redeclaring")
when not declared(duckdb_connect):
  proc duckdb_connect*(
    database: duckdb_database_1711276596,
    out_connection: ptr duckdb_connection_1711276600,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_connect".}

else:
  static:
    hint("Declaration of " & "duckdb_connect" & " already exists, not redeclaring")
when not declared(duckdb_interrupt):
  proc duckdb_interrupt*(
    connection: duckdb_connection_1711276600
  ): void {.cdecl, importc: "duckdb_interrupt".}

else:
  static:
    hint("Declaration of " & "duckdb_interrupt" & " already exists, not redeclaring")
when not declared(duckdb_query_progress):
  proc duckdb_query_progress*(
    connection: duckdb_connection_1711276600
  ): duckdb_query_progress_type_1711276557 {.cdecl, importc: "duckdb_query_progress".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_query_progress" & " already exists, not redeclaring"
    )
when not declared(duckdb_disconnect):
  proc duckdb_disconnect*(
    connection: ptr duckdb_connection_1711276600
  ): void {.cdecl, importc: "duckdb_disconnect".}

else:
  static:
    hint("Declaration of " & "duckdb_disconnect" & " already exists, not redeclaring")
when not declared(duckdb_library_version):
  proc duckdb_library_version*(): cstring {.cdecl, importc: "duckdb_library_version".}
else:
  static:
    hint(
      "Declaration of " & "duckdb_library_version" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_config):
  proc duckdb_create_config*(
    out_config: ptr duckdb_config_1711276624
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_create_config".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_config" & " already exists, not redeclaring"
    )
when not declared(duckdb_config_count):
  proc duckdb_config_count*(): csize_t {.cdecl, importc: "duckdb_config_count".}
else:
  static:
    hint("Declaration of " & "duckdb_config_count" & " already exists, not redeclaring")
when not declared(duckdb_get_config_flag):
  proc duckdb_get_config_flag*(
    index: csize_t, out_name: ptr cstring, out_description: ptr cstring
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_get_config_flag".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_get_config_flag" & " already exists, not redeclaring"
    )
when not declared(duckdb_set_config):
  proc duckdb_set_config*(
    config: duckdb_config_1711276624, name: cstring, option: cstring
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_set_config".}

else:
  static:
    hint("Declaration of " & "duckdb_set_config" & " already exists, not redeclaring")
when not declared(duckdb_destroy_config):
  proc duckdb_destroy_config*(
    config: ptr duckdb_config_1711276624
  ): void {.cdecl, importc: "duckdb_destroy_config".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_config" & " already exists, not redeclaring"
    )
when not declared(duckdb_query):
  proc duckdb_query*(
    connection: duckdb_connection_1711276600,
    query: cstring,
    out_result: ptr duckdb_result_1711276592,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_query".}

else:
  static:
    hint("Declaration of " & "duckdb_query" & " already exists, not redeclaring")
when not declared(duckdb_destroy_result):
  proc duckdb_destroy_result*(
    result: ptr duckdb_result_1711276592
  ): void {.cdecl, importc: "duckdb_destroy_result".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_result" & " already exists, not redeclaring"
    )
when not declared(duckdb_column_name):
  proc duckdb_column_name*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501
  ): cstring {.cdecl, importc: "duckdb_column_name".}

else:
  static:
    hint("Declaration of " & "duckdb_column_name" & " already exists, not redeclaring")
when not declared(duckdb_column_type):
  proc duckdb_column_type*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501
  ): duckdb_type_1711276475 {.cdecl, importc: "duckdb_column_type".}

else:
  static:
    hint("Declaration of " & "duckdb_column_type" & " already exists, not redeclaring")
when not declared(duckdb_result_statement_type):
  proc duckdb_result_statement_type*(
    result: duckdb_result_1711276592
  ): duckdb_statement_type_1711276491 {.cdecl, importc: "duckdb_result_statement_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_result_statement_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_column_logical_type):
  proc duckdb_column_logical_type*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_column_logical_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_column_logical_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_column_count):
  proc duckdb_column_count*(
    result: ptr duckdb_result_1711276592
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_column_count".}

else:
  static:
    hint("Declaration of " & "duckdb_column_count" & " already exists, not redeclaring")
when not declared(duckdb_row_count):
  proc duckdb_row_count*(
    result: ptr duckdb_result_1711276592
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_row_count".}

else:
  static:
    hint("Declaration of " & "duckdb_row_count" & " already exists, not redeclaring")
when not declared(duckdb_rows_changed):
  proc duckdb_rows_changed*(
    result: ptr duckdb_result_1711276592
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_rows_changed".}

else:
  static:
    hint("Declaration of " & "duckdb_rows_changed" & " already exists, not redeclaring")
when not declared(duckdb_column_data):
  proc duckdb_column_data*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501
  ): pointer {.cdecl, importc: "duckdb_column_data".}

else:
  static:
    hint("Declaration of " & "duckdb_column_data" & " already exists, not redeclaring")
when not declared(duckdb_nullmask_data):
  proc duckdb_nullmask_data*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501
  ): ptr bool {.cdecl, importc: "duckdb_nullmask_data".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_nullmask_data" & " already exists, not redeclaring"
    )
when not declared(duckdb_result_error):
  proc duckdb_result_error*(
    result: ptr duckdb_result_1711276592
  ): cstring {.cdecl, importc: "duckdb_result_error".}

else:
  static:
    hint("Declaration of " & "duckdb_result_error" & " already exists, not redeclaring")
when not declared(duckdb_result_error_type):
  proc duckdb_result_error_type*(
    result: ptr duckdb_result_1711276592
  ): duckdb_error_type_1711276495 {.cdecl, importc: "duckdb_result_error_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_result_error_type" & " already exists, not redeclaring"
    )
when not declared(duckdb_result_get_chunk):
  proc duckdb_result_get_chunk*(
    result: duckdb_result_1711276592, chunk_index: idx_t_1711276501
  ): duckdb_data_chunk_1711276636 {.cdecl, importc: "duckdb_result_get_chunk".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_result_get_chunk" & " already exists, not redeclaring"
    )
when not declared(duckdb_result_is_streaming):
  proc duckdb_result_is_streaming*(
    result: duckdb_result_1711276592
  ): bool {.cdecl, importc: "duckdb_result_is_streaming".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_result_is_streaming" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_result_chunk_count):
  proc duckdb_result_chunk_count*(
    result: duckdb_result_1711276592
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_result_chunk_count".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_result_chunk_count" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_result_return_type):
  proc duckdb_result_return_type*(
    result: duckdb_result_1711276592
  ): duckdb_result_type_1711276487 {.cdecl, importc: "duckdb_result_return_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_result_return_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_value_boolean):
  proc duckdb_value_boolean*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): bool {.cdecl, importc: "duckdb_value_boolean".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_value_boolean" & " already exists, not redeclaring"
    )
when not declared(duckdb_value_int8):
  proc duckdb_value_int8*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): int8 {.cdecl, importc: "duckdb_value_int8".}

else:
  static:
    hint("Declaration of " & "duckdb_value_int8" & " already exists, not redeclaring")
when not declared(duckdb_value_int16):
  proc duckdb_value_int16*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): int16 {.cdecl, importc: "duckdb_value_int16".}

else:
  static:
    hint("Declaration of " & "duckdb_value_int16" & " already exists, not redeclaring")
when not declared(duckdb_value_int32):
  proc duckdb_value_int32*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): int32 {.cdecl, importc: "duckdb_value_int32".}

else:
  static:
    hint("Declaration of " & "duckdb_value_int32" & " already exists, not redeclaring")
when not declared(duckdb_value_int64):
  proc duckdb_value_int64*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): int64 {.cdecl, importc: "duckdb_value_int64".}

else:
  static:
    hint("Declaration of " & "duckdb_value_int64" & " already exists, not redeclaring")
when not declared(duckdb_value_hugeint):
  proc duckdb_value_hugeint*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): duckdb_hugeint_1711276545 {.cdecl, importc: "duckdb_value_hugeint".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_value_hugeint" & " already exists, not redeclaring"
    )
when not declared(duckdb_value_uhugeint):
  proc duckdb_value_uhugeint*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): duckdb_uhugeint_1711276549 {.cdecl, importc: "duckdb_value_uhugeint".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_value_uhugeint" & " already exists, not redeclaring"
    )
when not declared(duckdb_value_decimal):
  proc duckdb_value_decimal*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): duckdb_decimal_1711276553 {.cdecl, importc: "duckdb_value_decimal".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_value_decimal" & " already exists, not redeclaring"
    )
when not declared(duckdb_value_uint8):
  proc duckdb_value_uint8*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): uint8 {.cdecl, importc: "duckdb_value_uint8".}

else:
  static:
    hint("Declaration of " & "duckdb_value_uint8" & " already exists, not redeclaring")
when not declared(duckdb_value_uint16):
  proc duckdb_value_uint16*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): uint16 {.cdecl, importc: "duckdb_value_uint16".}

else:
  static:
    hint("Declaration of " & "duckdb_value_uint16" & " already exists, not redeclaring")
when not declared(duckdb_value_uint32):
  proc duckdb_value_uint32*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): uint32 {.cdecl, importc: "duckdb_value_uint32".}

else:
  static:
    hint("Declaration of " & "duckdb_value_uint32" & " already exists, not redeclaring")
when not declared(duckdb_value_uint64):
  proc duckdb_value_uint64*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): uint64 {.cdecl, importc: "duckdb_value_uint64".}

else:
  static:
    hint("Declaration of " & "duckdb_value_uint64" & " already exists, not redeclaring")
when not declared(duckdb_value_float):
  proc duckdb_value_float*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): cfloat {.cdecl, importc: "duckdb_value_float".}

else:
  static:
    hint("Declaration of " & "duckdb_value_float" & " already exists, not redeclaring")
when not declared(duckdb_value_double):
  proc duckdb_value_double*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): cdouble {.cdecl, importc: "duckdb_value_double".}

else:
  static:
    hint("Declaration of " & "duckdb_value_double" & " already exists, not redeclaring")
when not declared(duckdb_value_date):
  proc duckdb_value_date*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): duckdb_date_1711276509 {.cdecl, importc: "duckdb_value_date".}

else:
  static:
    hint("Declaration of " & "duckdb_value_date" & " already exists, not redeclaring")
when not declared(duckdb_value_time):
  proc duckdb_value_time*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): duckdb_time_1711276517 {.cdecl, importc: "duckdb_value_time".}

else:
  static:
    hint("Declaration of " & "duckdb_value_time" & " already exists, not redeclaring")
when not declared(duckdb_value_timestamp):
  proc duckdb_value_timestamp*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): duckdb_timestamp_1711276533 {.cdecl, importc: "duckdb_value_timestamp".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_value_timestamp" & " already exists, not redeclaring"
    )
when not declared(duckdb_value_interval):
  proc duckdb_value_interval*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): duckdb_interval_1711276541 {.cdecl, importc: "duckdb_value_interval".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_value_interval" & " already exists, not redeclaring"
    )
when not declared(duckdb_value_varchar):
  proc duckdb_value_varchar*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): cstring {.cdecl, importc: "duckdb_value_varchar".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_value_varchar" & " already exists, not redeclaring"
    )
when not declared(duckdb_value_string):
  proc duckdb_value_string*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): duckdb_string_1711276584 {.cdecl, importc: "duckdb_value_string".}

else:
  static:
    hint("Declaration of " & "duckdb_value_string" & " already exists, not redeclaring")
when not declared(duckdb_value_varchar_internal):
  proc duckdb_value_varchar_internal*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): cstring {.cdecl, importc: "duckdb_value_varchar_internal".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_value_varchar_internal" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_value_string_internal):
  proc duckdb_value_string_internal*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): duckdb_string_1711276584 {.cdecl, importc: "duckdb_value_string_internal".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_value_string_internal" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_value_blob):
  proc duckdb_value_blob*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): duckdb_blob_1711276588 {.cdecl, importc: "duckdb_value_blob".}

else:
  static:
    hint("Declaration of " & "duckdb_value_blob" & " already exists, not redeclaring")
when not declared(duckdb_value_is_null):
  proc duckdb_value_is_null*(
    result: ptr duckdb_result_1711276592, col: idx_t_1711276501, row: idx_t_1711276501
  ): bool {.cdecl, importc: "duckdb_value_is_null".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_value_is_null" & " already exists, not redeclaring"
    )
when not declared(duckdb_malloc):
  proc duckdb_malloc*(size: csize_t): pointer {.cdecl, importc: "duckdb_malloc".}
else:
  static:
    hint("Declaration of " & "duckdb_malloc" & " already exists, not redeclaring")
when not declared(duckdb_free):
  proc duckdb_free*(ptr_arg: pointer): void {.cdecl, importc: "duckdb_free".}
else:
  static:
    hint("Declaration of " & "duckdb_free" & " already exists, not redeclaring")
when not declared(duckdb_vector_size):
  proc duckdb_vector_size*(): idx_t_1711276501 {.cdecl, importc: "duckdb_vector_size".}
else:
  static:
    hint("Declaration of " & "duckdb_vector_size" & " already exists, not redeclaring")
when not declared(duckdb_string_is_inlined):
  proc duckdb_string_is_inlined*(
    string_arg: duckdb_string_t_1711276568
  ): bool {.cdecl, importc: "duckdb_string_is_inlined".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_string_is_inlined" & " already exists, not redeclaring"
    )
when not declared(duckdb_string_t_length):
  proc duckdb_string_t_length*(
    string_arg: duckdb_string_t_1711276568
  ): uint32 {.cdecl, importc: "duckdb_string_t_length".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_string_t_length" & " already exists, not redeclaring"
    )
when not declared(duckdb_string_t_data):
  proc duckdb_string_t_data*(
    string_arg: ptr duckdb_string_t_1711276568
  ): cstring {.cdecl, importc: "duckdb_string_t_data".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_string_t_data" & " already exists, not redeclaring"
    )
when not declared(duckdb_from_date):
  proc duckdb_from_date*(
    date: duckdb_date_1711276509
  ): duckdb_date_struct_1711276513 {.cdecl, importc: "duckdb_from_date".}

else:
  static:
    hint("Declaration of " & "duckdb_from_date" & " already exists, not redeclaring")
when not declared(duckdb_to_date):
  proc duckdb_to_date*(
    date: duckdb_date_struct_1711276513
  ): duckdb_date_1711276509 {.cdecl, importc: "duckdb_to_date".}

else:
  static:
    hint("Declaration of " & "duckdb_to_date" & " already exists, not redeclaring")
when not declared(duckdb_is_finite_date):
  proc duckdb_is_finite_date*(
    date: duckdb_date_1711276509
  ): bool {.cdecl, importc: "duckdb_is_finite_date".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_is_finite_date" & " already exists, not redeclaring"
    )
when not declared(duckdb_from_time):
  proc duckdb_from_time*(
    time: duckdb_time_1711276517
  ): duckdb_time_struct_1711276521 {.cdecl, importc: "duckdb_from_time".}

else:
  static:
    hint("Declaration of " & "duckdb_from_time" & " already exists, not redeclaring")
when not declared(duckdb_create_time_tz):
  proc duckdb_create_time_tz*(
    micros: int64, offset: int32
  ): duckdb_time_tz_1711276525 {.cdecl, importc: "duckdb_create_time_tz".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_time_tz" & " already exists, not redeclaring"
    )
when not declared(duckdb_from_time_tz):
  proc duckdb_from_time_tz*(
    micros: duckdb_time_tz_1711276525
  ): duckdb_time_tz_struct_1711276529 {.cdecl, importc: "duckdb_from_time_tz".}

else:
  static:
    hint("Declaration of " & "duckdb_from_time_tz" & " already exists, not redeclaring")
when not declared(duckdb_to_time):
  proc duckdb_to_time*(
    time: duckdb_time_struct_1711276521
  ): duckdb_time_1711276517 {.cdecl, importc: "duckdb_to_time".}

else:
  static:
    hint("Declaration of " & "duckdb_to_time" & " already exists, not redeclaring")
when not declared(duckdb_from_timestamp):
  proc duckdb_from_timestamp*(
    ts: duckdb_timestamp_1711276533
  ): duckdb_timestamp_struct_1711276537 {.cdecl, importc: "duckdb_from_timestamp".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_from_timestamp" & " already exists, not redeclaring"
    )
when not declared(duckdb_to_timestamp):
  proc duckdb_to_timestamp*(
    ts: duckdb_timestamp_struct_1711276537
  ): duckdb_timestamp_1711276533 {.cdecl, importc: "duckdb_to_timestamp".}

else:
  static:
    hint("Declaration of " & "duckdb_to_timestamp" & " already exists, not redeclaring")
when not declared(duckdb_is_finite_timestamp):
  proc duckdb_is_finite_timestamp*(
    ts: duckdb_timestamp_1711276533
  ): bool {.cdecl, importc: "duckdb_is_finite_timestamp".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_is_finite_timestamp" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_hugeint_to_double):
  proc duckdb_hugeint_to_double*(
    val: duckdb_hugeint_1711276545
  ): cdouble {.cdecl, importc: "duckdb_hugeint_to_double".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_hugeint_to_double" & " already exists, not redeclaring"
    )
when not declared(duckdb_double_to_hugeint):
  proc duckdb_double_to_hugeint*(
    val: cdouble
  ): duckdb_hugeint_1711276545 {.cdecl, importc: "duckdb_double_to_hugeint".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_double_to_hugeint" & " already exists, not redeclaring"
    )
when not declared(duckdb_uhugeint_to_double):
  proc duckdb_uhugeint_to_double*(
    val: duckdb_uhugeint_1711276549
  ): cdouble {.cdecl, importc: "duckdb_uhugeint_to_double".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_uhugeint_to_double" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_double_to_uhugeint):
  proc duckdb_double_to_uhugeint*(
    val: cdouble
  ): duckdb_uhugeint_1711276549 {.cdecl, importc: "duckdb_double_to_uhugeint".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_double_to_uhugeint" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_double_to_decimal):
  proc duckdb_double_to_decimal*(
    val: cdouble, width: uint8, scale: uint8
  ): duckdb_decimal_1711276553 {.cdecl, importc: "duckdb_double_to_decimal".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_double_to_decimal" & " already exists, not redeclaring"
    )
when not declared(duckdb_decimal_to_double):
  proc duckdb_decimal_to_double*(
    val: duckdb_decimal_1711276553
  ): cdouble {.cdecl, importc: "duckdb_decimal_to_double".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_decimal_to_double" & " already exists, not redeclaring"
    )
when not declared(duckdb_prepare):
  proc duckdb_prepare*(
    connection: duckdb_connection_1711276600,
    query: cstring,
    out_prepared_statement: ptr duckdb_prepared_statement_1711276604,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_prepare".}

else:
  static:
    hint("Declaration of " & "duckdb_prepare" & " already exists, not redeclaring")
when not declared(duckdb_destroy_prepare):
  proc duckdb_destroy_prepare*(
    prepared_statement: ptr duckdb_prepared_statement_1711276604
  ): void {.cdecl, importc: "duckdb_destroy_prepare".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_prepare" & " already exists, not redeclaring"
    )
when not declared(duckdb_prepare_error):
  proc duckdb_prepare_error*(
    prepared_statement: duckdb_prepared_statement_1711276604
  ): cstring {.cdecl, importc: "duckdb_prepare_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_prepare_error" & " already exists, not redeclaring"
    )
when not declared(duckdb_nparams):
  proc duckdb_nparams*(
    prepared_statement: duckdb_prepared_statement_1711276604
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_nparams".}

else:
  static:
    hint("Declaration of " & "duckdb_nparams" & " already exists, not redeclaring")
when not declared(duckdb_parameter_name):
  proc duckdb_parameter_name*(
    prepared_statement: duckdb_prepared_statement_1711276604, index: idx_t_1711276501
  ): cstring {.cdecl, importc: "duckdb_parameter_name".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_parameter_name" & " already exists, not redeclaring"
    )
when not declared(duckdb_param_type):
  proc duckdb_param_type*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
  ): duckdb_type_1711276475 {.cdecl, importc: "duckdb_param_type".}

else:
  static:
    hint("Declaration of " & "duckdb_param_type" & " already exists, not redeclaring")
when not declared(duckdb_clear_bindings):
  proc duckdb_clear_bindings*(
    prepared_statement: duckdb_prepared_statement_1711276604
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_clear_bindings".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_clear_bindings" & " already exists, not redeclaring"
    )
when not declared(duckdb_prepared_statement_type):
  proc duckdb_prepared_statement_type*(
    statement: duckdb_prepared_statement_1711276604
  ): duckdb_statement_type_1711276491 {.
    cdecl, importc: "duckdb_prepared_statement_type"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_prepared_statement_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_value):
  proc duckdb_bind_value*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: duckdb_value_1711276640,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_value".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_value" & " already exists, not redeclaring")
when not declared(duckdb_bind_parameter_index):
  proc duckdb_bind_parameter_index*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx_out: ptr idx_t_1711276501,
    name: cstring,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_parameter_index".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_parameter_index" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_boolean):
  proc duckdb_bind_boolean*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: bool,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_boolean".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_boolean" & " already exists, not redeclaring")
when not declared(duckdb_bind_int8):
  proc duckdb_bind_int8*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: int8,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_int8".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_int8" & " already exists, not redeclaring")
when not declared(duckdb_bind_int16):
  proc duckdb_bind_int16*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: int16,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_int16".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_int16" & " already exists, not redeclaring")
when not declared(duckdb_bind_int32):
  proc duckdb_bind_int32*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: int32,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_int32".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_int32" & " already exists, not redeclaring")
when not declared(duckdb_bind_int64):
  proc duckdb_bind_int64*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: int64,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_int64".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_int64" & " already exists, not redeclaring")
when not declared(duckdb_bind_hugeint):
  proc duckdb_bind_hugeint*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: duckdb_hugeint_1711276545,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_hugeint".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_hugeint" & " already exists, not redeclaring")
when not declared(duckdb_bind_uhugeint):
  proc duckdb_bind_uhugeint*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: duckdb_uhugeint_1711276549,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_uhugeint".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_uhugeint" & " already exists, not redeclaring"
    )
when not declared(duckdb_bind_decimal):
  proc duckdb_bind_decimal*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: duckdb_decimal_1711276553,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_decimal".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_decimal" & " already exists, not redeclaring")
when not declared(duckdb_bind_uint8):
  proc duckdb_bind_uint8*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: uint8,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_uint8".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_uint8" & " already exists, not redeclaring")
when not declared(duckdb_bind_uint16):
  proc duckdb_bind_uint16*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: uint16,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_uint16".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_uint16" & " already exists, not redeclaring")
when not declared(duckdb_bind_uint32):
  proc duckdb_bind_uint32*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: uint32,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_uint32".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_uint32" & " already exists, not redeclaring")
when not declared(duckdb_bind_uint64):
  proc duckdb_bind_uint64*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: uint64,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_uint64".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_uint64" & " already exists, not redeclaring")
when not declared(duckdb_bind_float):
  proc duckdb_bind_float*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: cfloat,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_float".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_float" & " already exists, not redeclaring")
when not declared(duckdb_bind_double):
  proc duckdb_bind_double*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: cdouble,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_double".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_double" & " already exists, not redeclaring")
when not declared(duckdb_bind_date):
  proc duckdb_bind_date*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: duckdb_date_1711276509,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_date".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_date" & " already exists, not redeclaring")
when not declared(duckdb_bind_time):
  proc duckdb_bind_time*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: duckdb_time_1711276517,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_time".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_time" & " already exists, not redeclaring")
when not declared(duckdb_bind_timestamp):
  proc duckdb_bind_timestamp*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: duckdb_timestamp_1711276533,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_timestamp".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_timestamp" & " already exists, not redeclaring"
    )
when not declared(duckdb_bind_timestamp_tz):
  proc duckdb_bind_timestamp_tz*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: duckdb_timestamp_1711276533,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_timestamp_tz".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_timestamp_tz" & " already exists, not redeclaring"
    )
when not declared(duckdb_bind_interval):
  proc duckdb_bind_interval*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: duckdb_interval_1711276541,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_interval".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_interval" & " already exists, not redeclaring"
    )
when not declared(duckdb_bind_varchar):
  proc duckdb_bind_varchar*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: cstring,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_varchar".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_varchar" & " already exists, not redeclaring")
when not declared(duckdb_bind_varchar_length):
  proc duckdb_bind_varchar_length*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    val: cstring,
    length: idx_t_1711276501,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_varchar_length".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_varchar_length" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_blob):
  proc duckdb_bind_blob*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
    data: pointer,
    length: idx_t_1711276501,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_blob".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_blob" & " already exists, not redeclaring")
when not declared(duckdb_bind_null):
  proc duckdb_bind_null*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    param_idx: idx_t_1711276501,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_bind_null".}

else:
  static:
    hint("Declaration of " & "duckdb_bind_null" & " already exists, not redeclaring")
when not declared(duckdb_execute_prepared):
  proc duckdb_execute_prepared*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    out_result: ptr duckdb_result_1711276592,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_execute_prepared".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_execute_prepared" & " already exists, not redeclaring"
    )
when not declared(duckdb_execute_prepared_streaming):
  proc duckdb_execute_prepared_streaming*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    out_result: ptr duckdb_result_1711276592,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_execute_prepared_streaming".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_execute_prepared_streaming" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_extract_statements):
  proc duckdb_extract_statements*(
    connection: duckdb_connection_1711276600,
    query: cstring,
    out_extracted_statements: ptr duckdb_extracted_statements_1711276608,
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_extract_statements".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_extract_statements" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_prepare_extracted_statement):
  proc duckdb_prepare_extracted_statement*(
    connection: duckdb_connection_1711276600,
    extracted_statements: duckdb_extracted_statements_1711276608,
    index: idx_t_1711276501,
    out_prepared_statement: ptr duckdb_prepared_statement_1711276604,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_prepare_extracted_statement".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_prepare_extracted_statement" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_extract_statements_error):
  proc duckdb_extract_statements_error*(
    extracted_statements: duckdb_extracted_statements_1711276608
  ): cstring {.cdecl, importc: "duckdb_extract_statements_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_extract_statements_error" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_extracted):
  proc duckdb_destroy_extracted*(
    extracted_statements: ptr duckdb_extracted_statements_1711276608
  ): void {.cdecl, importc: "duckdb_destroy_extracted".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_extracted" & " already exists, not redeclaring"
    )
when not declared(duckdb_pending_prepared):
  proc duckdb_pending_prepared*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    out_result: ptr duckdb_pending_result_1711276612,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_pending_prepared".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_pending_prepared" & " already exists, not redeclaring"
    )
when not declared(duckdb_pending_prepared_streaming):
  proc duckdb_pending_prepared_streaming*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    out_result: ptr duckdb_pending_result_1711276612,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_pending_prepared_streaming".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_pending_prepared_streaming" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_pending):
  proc duckdb_destroy_pending*(
    pending_result: ptr duckdb_pending_result_1711276612
  ): void {.cdecl, importc: "duckdb_destroy_pending".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_pending" & " already exists, not redeclaring"
    )
when not declared(duckdb_pending_error):
  proc duckdb_pending_error*(
    pending_result: duckdb_pending_result_1711276612
  ): cstring {.cdecl, importc: "duckdb_pending_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_pending_error" & " already exists, not redeclaring"
    )
when not declared(duckdb_pending_execute_task):
  proc duckdb_pending_execute_task*(
    pending_result: duckdb_pending_result_1711276612
  ): duckdb_pending_state_1711276483 {.cdecl, importc: "duckdb_pending_execute_task".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_pending_execute_task" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_pending_execute_check_state):
  proc duckdb_pending_execute_check_state*(
    pending_result: duckdb_pending_result_1711276612
  ): duckdb_pending_state_1711276483 {.
    cdecl, importc: "duckdb_pending_execute_check_state"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_pending_execute_check_state" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_execute_pending):
  proc duckdb_execute_pending*(
    pending_result: duckdb_pending_result_1711276612,
    out_result: ptr duckdb_result_1711276592,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_execute_pending".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_execute_pending" & " already exists, not redeclaring"
    )
when not declared(duckdb_pending_execution_is_finished):
  proc duckdb_pending_execution_is_finished*(
    pending_state: duckdb_pending_state_1711276483
  ): bool {.cdecl, importc: "duckdb_pending_execution_is_finished".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_pending_execution_is_finished" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_value):
  proc duckdb_destroy_value*(
    value: ptr duckdb_value_1711276640
  ): void {.cdecl, importc: "duckdb_destroy_value".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_value" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_varchar):
  proc duckdb_create_varchar*(
    text: cstring
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_varchar".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_varchar" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_varchar_length):
  proc duckdb_create_varchar_length*(
    text: cstring, length: idx_t_1711276501
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_varchar_length".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_varchar_length" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_bool):
  proc duckdb_create_bool*(
    input: bool
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_bool".}

else:
  static:
    hint("Declaration of " & "duckdb_create_bool" & " already exists, not redeclaring")
when not declared(duckdb_create_int8):
  proc duckdb_create_int8*(
    input: int8
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_int8".}

else:
  static:
    hint("Declaration of " & "duckdb_create_int8" & " already exists, not redeclaring")
when not declared(duckdb_create_uint8):
  proc duckdb_create_uint8*(
    input: uint8
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_uint8".}

else:
  static:
    hint("Declaration of " & "duckdb_create_uint8" & " already exists, not redeclaring")
when not declared(duckdb_create_int16):
  proc duckdb_create_int16*(
    input: int16
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_int16".}

else:
  static:
    hint("Declaration of " & "duckdb_create_int16" & " already exists, not redeclaring")
when not declared(duckdb_create_uint16):
  proc duckdb_create_uint16*(
    input: uint16
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_uint16".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_uint16" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_int32):
  proc duckdb_create_int32*(
    input: int32
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_int32".}

else:
  static:
    hint("Declaration of " & "duckdb_create_int32" & " already exists, not redeclaring")
when not declared(duckdb_create_uint32):
  proc duckdb_create_uint32*(
    input: uint32
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_uint32".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_uint32" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_uint64):
  proc duckdb_create_uint64*(
    input: uint64
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_uint64".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_uint64" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_int64):
  proc duckdb_create_int64*(
    val: int64
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_int64".}

else:
  static:
    hint("Declaration of " & "duckdb_create_int64" & " already exists, not redeclaring")
when not declared(duckdb_create_hugeint):
  proc duckdb_create_hugeint*(
    input: duckdb_hugeint_1711276545
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_hugeint".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_hugeint" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_uhugeint):
  proc duckdb_create_uhugeint*(
    input: duckdb_uhugeint_1711276549
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_uhugeint".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_uhugeint" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_float):
  proc duckdb_create_float*(
    input: cfloat
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_float".}

else:
  static:
    hint("Declaration of " & "duckdb_create_float" & " already exists, not redeclaring")
when not declared(duckdb_create_double):
  proc duckdb_create_double*(
    input: cdouble
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_double".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_double" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_date):
  proc duckdb_create_date*(
    input: duckdb_date_1711276509
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_date".}

else:
  static:
    hint("Declaration of " & "duckdb_create_date" & " already exists, not redeclaring")
when not declared(duckdb_create_time):
  proc duckdb_create_time*(
    input: duckdb_time_1711276517
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_time".}

else:
  static:
    hint("Declaration of " & "duckdb_create_time" & " already exists, not redeclaring")
when not declared(duckdb_create_time_tz_value):
  proc duckdb_create_time_tz_value*(
    value: duckdb_time_tz_1711276525
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_time_tz_value".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_time_tz_value" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_timestamp):
  proc duckdb_create_timestamp*(
    input: duckdb_timestamp_1711276533
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_timestamp".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_timestamp" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_interval):
  proc duckdb_create_interval*(
    input: duckdb_interval_1711276541
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_interval".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_interval" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_blob):
  proc duckdb_create_blob*(
    data: ptr uint8, length: idx_t_1711276501
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_blob".}

else:
  static:
    hint("Declaration of " & "duckdb_create_blob" & " already exists, not redeclaring")
when not declared(duckdb_get_bool):
  proc duckdb_get_bool*(
    val: duckdb_value_1711276640
  ): bool {.cdecl, importc: "duckdb_get_bool".}

else:
  static:
    hint("Declaration of " & "duckdb_get_bool" & " already exists, not redeclaring")
when not declared(duckdb_get_int8):
  proc duckdb_get_int8*(
    val: duckdb_value_1711276640
  ): int8 {.cdecl, importc: "duckdb_get_int8".}

else:
  static:
    hint("Declaration of " & "duckdb_get_int8" & " already exists, not redeclaring")
when not declared(duckdb_get_uint8):
  proc duckdb_get_uint8*(
    val: duckdb_value_1711276640
  ): uint8 {.cdecl, importc: "duckdb_get_uint8".}

else:
  static:
    hint("Declaration of " & "duckdb_get_uint8" & " already exists, not redeclaring")
when not declared(duckdb_get_int16):
  proc duckdb_get_int16*(
    val: duckdb_value_1711276640
  ): int16 {.cdecl, importc: "duckdb_get_int16".}

else:
  static:
    hint("Declaration of " & "duckdb_get_int16" & " already exists, not redeclaring")
when not declared(duckdb_get_uint16):
  proc duckdb_get_uint16*(
    val: duckdb_value_1711276640
  ): uint16 {.cdecl, importc: "duckdb_get_uint16".}

else:
  static:
    hint("Declaration of " & "duckdb_get_uint16" & " already exists, not redeclaring")
when not declared(duckdb_get_int32):
  proc duckdb_get_int32*(
    val: duckdb_value_1711276640
  ): int32 {.cdecl, importc: "duckdb_get_int32".}

else:
  static:
    hint("Declaration of " & "duckdb_get_int32" & " already exists, not redeclaring")
when not declared(duckdb_get_uint32):
  proc duckdb_get_uint32*(
    val: duckdb_value_1711276640
  ): uint32 {.cdecl, importc: "duckdb_get_uint32".}

else:
  static:
    hint("Declaration of " & "duckdb_get_uint32" & " already exists, not redeclaring")
when not declared(duckdb_get_int64):
  proc duckdb_get_int64*(
    val: duckdb_value_1711276640
  ): int64 {.cdecl, importc: "duckdb_get_int64".}

else:
  static:
    hint("Declaration of " & "duckdb_get_int64" & " already exists, not redeclaring")
when not declared(duckdb_get_uint64):
  proc duckdb_get_uint64*(
    val: duckdb_value_1711276640
  ): uint64 {.cdecl, importc: "duckdb_get_uint64".}

else:
  static:
    hint("Declaration of " & "duckdb_get_uint64" & " already exists, not redeclaring")
when not declared(duckdb_get_hugeint):
  proc duckdb_get_hugeint*(
    val: duckdb_value_1711276640
  ): duckdb_hugeint_1711276545 {.cdecl, importc: "duckdb_get_hugeint".}

else:
  static:
    hint("Declaration of " & "duckdb_get_hugeint" & " already exists, not redeclaring")
when not declared(duckdb_get_uhugeint):
  proc duckdb_get_uhugeint*(
    val: duckdb_value_1711276640
  ): duckdb_uhugeint_1711276549 {.cdecl, importc: "duckdb_get_uhugeint".}

else:
  static:
    hint("Declaration of " & "duckdb_get_uhugeint" & " already exists, not redeclaring")
when not declared(duckdb_get_float):
  proc duckdb_get_float*(
    val: duckdb_value_1711276640
  ): cfloat {.cdecl, importc: "duckdb_get_float".}

else:
  static:
    hint("Declaration of " & "duckdb_get_float" & " already exists, not redeclaring")
when not declared(duckdb_get_double):
  proc duckdb_get_double*(
    val: duckdb_value_1711276640
  ): cdouble {.cdecl, importc: "duckdb_get_double".}

else:
  static:
    hint("Declaration of " & "duckdb_get_double" & " already exists, not redeclaring")
when not declared(duckdb_get_date):
  proc duckdb_get_date*(
    val: duckdb_value_1711276640
  ): duckdb_date_1711276509 {.cdecl, importc: "duckdb_get_date".}

else:
  static:
    hint("Declaration of " & "duckdb_get_date" & " already exists, not redeclaring")
when not declared(duckdb_get_time):
  proc duckdb_get_time*(
    val: duckdb_value_1711276640
  ): duckdb_time_1711276517 {.cdecl, importc: "duckdb_get_time".}

else:
  static:
    hint("Declaration of " & "duckdb_get_time" & " already exists, not redeclaring")
when not declared(duckdb_get_time_tz):
  proc duckdb_get_time_tz*(
    val: duckdb_value_1711276640
  ): duckdb_time_tz_1711276525 {.cdecl, importc: "duckdb_get_time_tz".}

else:
  static:
    hint("Declaration of " & "duckdb_get_time_tz" & " already exists, not redeclaring")
when not declared(duckdb_get_timestamp):
  proc duckdb_get_timestamp*(
    val: duckdb_value_1711276640
  ): duckdb_timestamp_1711276533 {.cdecl, importc: "duckdb_get_timestamp".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_get_timestamp" & " already exists, not redeclaring"
    )
when not declared(duckdb_get_interval):
  proc duckdb_get_interval*(
    val: duckdb_value_1711276640
  ): duckdb_interval_1711276541 {.cdecl, importc: "duckdb_get_interval".}

else:
  static:
    hint("Declaration of " & "duckdb_get_interval" & " already exists, not redeclaring")
when not declared(duckdb_get_value_type):
  proc duckdb_get_value_type*(
    val: duckdb_value_1711276640
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_get_value_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_get_value_type" & " already exists, not redeclaring"
    )
when not declared(duckdb_get_blob):
  proc duckdb_get_blob*(
    val: duckdb_value_1711276640
  ): duckdb_blob_1711276588 {.cdecl, importc: "duckdb_get_blob".}

else:
  static:
    hint("Declaration of " & "duckdb_get_blob" & " already exists, not redeclaring")
when not declared(duckdb_get_varchar):
  proc duckdb_get_varchar*(
    value: duckdb_value_1711276640
  ): cstring {.cdecl, importc: "duckdb_get_varchar".}

else:
  static:
    hint("Declaration of " & "duckdb_get_varchar" & " already exists, not redeclaring")
when not declared(duckdb_create_struct_value):
  proc duckdb_create_struct_value*(
    type_arg: duckdb_logical_type_1711276628, values: ptr duckdb_value_1711276640
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_struct_value".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_struct_value" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_list_value):
  proc duckdb_create_list_value*(
    type_arg: duckdb_logical_type_1711276628,
    values: ptr duckdb_value_1711276640,
    value_count: idx_t_1711276501,
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_list_value".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_list_value" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_array_value):
  proc duckdb_create_array_value*(
    type_arg: duckdb_logical_type_1711276628,
    values: ptr duckdb_value_1711276640,
    value_count: idx_t_1711276501,
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_create_array_value".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_array_value" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_get_map_size):
  proc duckdb_get_map_size*(
    value: duckdb_value_1711276640
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_get_map_size".}

else:
  static:
    hint("Declaration of " & "duckdb_get_map_size" & " already exists, not redeclaring")
when not declared(duckdb_get_map_key):
  proc duckdb_get_map_key*(
    value: duckdb_value_1711276640, index: idx_t_1711276501
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_get_map_key".}

else:
  static:
    hint("Declaration of " & "duckdb_get_map_key" & " already exists, not redeclaring")
when not declared(duckdb_get_map_value):
  proc duckdb_get_map_value*(
    value: duckdb_value_1711276640, index: idx_t_1711276501
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_get_map_value".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_get_map_value" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_logical_type):
  proc duckdb_create_logical_type*(
    type_arg: duckdb_type_1711276475
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_create_logical_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_logical_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_logical_type_get_alias):
  proc duckdb_logical_type_get_alias*(
    type_arg: duckdb_logical_type_1711276628
  ): cstring {.cdecl, importc: "duckdb_logical_type_get_alias".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_logical_type_get_alias" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_logical_type_set_alias):
  proc duckdb_logical_type_set_alias*(
    type_arg: duckdb_logical_type_1711276628, alias: cstring
  ): void {.cdecl, importc: "duckdb_logical_type_set_alias".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_logical_type_set_alias" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_list_type):
  proc duckdb_create_list_type*(
    type_arg: duckdb_logical_type_1711276628
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_create_list_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_list_type" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_array_type):
  proc duckdb_create_array_type*(
    type_arg: duckdb_logical_type_1711276628, array_size: idx_t_1711276501
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_create_array_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_array_type" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_map_type):
  proc duckdb_create_map_type*(
    key_type: duckdb_logical_type_1711276628, value_type: duckdb_logical_type_1711276628
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_create_map_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_map_type" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_union_type):
  proc duckdb_create_union_type*(
    member_types: ptr duckdb_logical_type_1711276628,
    member_names: ptr cstring,
    member_count: idx_t_1711276501,
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_create_union_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_union_type" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_struct_type):
  proc duckdb_create_struct_type*(
    member_types: ptr duckdb_logical_type_1711276628,
    member_names: ptr cstring,
    member_count: idx_t_1711276501,
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_create_struct_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_struct_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_enum_type):
  proc duckdb_create_enum_type*(
    member_names: ptr cstring, member_count: idx_t_1711276501
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_create_enum_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_enum_type" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_decimal_type):
  proc duckdb_create_decimal_type*(
    width: uint8, scale: uint8
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_create_decimal_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_decimal_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_get_type_id):
  proc duckdb_get_type_id*(
    type_arg: duckdb_logical_type_1711276628
  ): duckdb_type_1711276475 {.cdecl, importc: "duckdb_get_type_id".}

else:
  static:
    hint("Declaration of " & "duckdb_get_type_id" & " already exists, not redeclaring")
when not declared(duckdb_decimal_width):
  proc duckdb_decimal_width*(
    type_arg: duckdb_logical_type_1711276628
  ): uint8 {.cdecl, importc: "duckdb_decimal_width".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_decimal_width" & " already exists, not redeclaring"
    )
when not declared(duckdb_decimal_scale):
  proc duckdb_decimal_scale*(
    type_arg: duckdb_logical_type_1711276628
  ): uint8 {.cdecl, importc: "duckdb_decimal_scale".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_decimal_scale" & " already exists, not redeclaring"
    )
when not declared(duckdb_decimal_internal_type):
  proc duckdb_decimal_internal_type*(
    type_arg: duckdb_logical_type_1711276628
  ): duckdb_type_1711276475 {.cdecl, importc: "duckdb_decimal_internal_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_decimal_internal_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_enum_internal_type):
  proc duckdb_enum_internal_type*(
    type_arg: duckdb_logical_type_1711276628
  ): duckdb_type_1711276475 {.cdecl, importc: "duckdb_enum_internal_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_enum_internal_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_enum_dictionary_size):
  proc duckdb_enum_dictionary_size*(
    type_arg: duckdb_logical_type_1711276628
  ): uint32 {.cdecl, importc: "duckdb_enum_dictionary_size".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_enum_dictionary_size" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_enum_dictionary_value):
  proc duckdb_enum_dictionary_value*(
    type_arg: duckdb_logical_type_1711276628, index: idx_t_1711276501
  ): cstring {.cdecl, importc: "duckdb_enum_dictionary_value".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_enum_dictionary_value" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_list_type_child_type):
  proc duckdb_list_type_child_type*(
    type_arg: duckdb_logical_type_1711276628
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_list_type_child_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_list_type_child_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_array_type_child_type):
  proc duckdb_array_type_child_type*(
    type_arg: duckdb_logical_type_1711276628
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_array_type_child_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_array_type_child_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_array_type_array_size):
  proc duckdb_array_type_array_size*(
    type_arg: duckdb_logical_type_1711276628
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_array_type_array_size".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_array_type_array_size" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_map_type_key_type):
  proc duckdb_map_type_key_type*(
    type_arg: duckdb_logical_type_1711276628
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_map_type_key_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_map_type_key_type" & " already exists, not redeclaring"
    )
when not declared(duckdb_map_type_value_type):
  proc duckdb_map_type_value_type*(
    type_arg: duckdb_logical_type_1711276628
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_map_type_value_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_map_type_value_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_struct_type_child_count):
  proc duckdb_struct_type_child_count*(
    type_arg: duckdb_logical_type_1711276628
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_struct_type_child_count".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_struct_type_child_count" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_struct_type_child_name):
  proc duckdb_struct_type_child_name*(
    type_arg: duckdb_logical_type_1711276628, index: idx_t_1711276501
  ): cstring {.cdecl, importc: "duckdb_struct_type_child_name".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_struct_type_child_name" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_struct_type_child_type):
  proc duckdb_struct_type_child_type*(
    type_arg: duckdb_logical_type_1711276628, index: idx_t_1711276501
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_struct_type_child_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_struct_type_child_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_union_type_member_count):
  proc duckdb_union_type_member_count*(
    type_arg: duckdb_logical_type_1711276628
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_union_type_member_count".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_union_type_member_count" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_union_type_member_name):
  proc duckdb_union_type_member_name*(
    type_arg: duckdb_logical_type_1711276628, index: idx_t_1711276501
  ): cstring {.cdecl, importc: "duckdb_union_type_member_name".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_union_type_member_name" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_union_type_member_type):
  proc duckdb_union_type_member_type*(
    type_arg: duckdb_logical_type_1711276628, index: idx_t_1711276501
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_union_type_member_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_union_type_member_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_logical_type):
  proc duckdb_destroy_logical_type*(
    type_arg: ptr duckdb_logical_type_1711276628
  ): void {.cdecl, importc: "duckdb_destroy_logical_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_logical_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_register_logical_type):
  proc duckdb_register_logical_type*(
    con: duckdb_connection_1711276600,
    type_arg: duckdb_logical_type_1711276628,
    info: duckdb_create_type_info_1711276632,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_register_logical_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_register_logical_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_data_chunk):
  proc duckdb_create_data_chunk*(
    types: ptr duckdb_logical_type_1711276628, column_count: idx_t_1711276501
  ): duckdb_data_chunk_1711276636 {.cdecl, importc: "duckdb_create_data_chunk".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_data_chunk" & " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_data_chunk):
  proc duckdb_destroy_data_chunk*(
    chunk: ptr duckdb_data_chunk_1711276636
  ): void {.cdecl, importc: "duckdb_destroy_data_chunk".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_data_chunk" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_data_chunk_reset):
  proc duckdb_data_chunk_reset*(
    chunk: duckdb_data_chunk_1711276636
  ): void {.cdecl, importc: "duckdb_data_chunk_reset".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_data_chunk_reset" & " already exists, not redeclaring"
    )
when not declared(duckdb_data_chunk_get_column_count):
  proc duckdb_data_chunk_get_column_count*(
    chunk: duckdb_data_chunk_1711276636
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_data_chunk_get_column_count".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_data_chunk_get_column_count" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_data_chunk_get_vector):
  proc duckdb_data_chunk_get_vector*(
    chunk: duckdb_data_chunk_1711276636, col_idx: idx_t_1711276501
  ): duckdb_vector_1711276580 {.cdecl, importc: "duckdb_data_chunk_get_vector".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_data_chunk_get_vector" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_data_chunk_get_size):
  proc duckdb_data_chunk_get_size*(
    chunk: duckdb_data_chunk_1711276636
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_data_chunk_get_size".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_data_chunk_get_size" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_data_chunk_set_size):
  proc duckdb_data_chunk_set_size*(
    chunk: duckdb_data_chunk_1711276636, size: idx_t_1711276501
  ): void {.cdecl, importc: "duckdb_data_chunk_set_size".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_data_chunk_set_size" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_vector_get_column_type):
  proc duckdb_vector_get_column_type*(
    vector: duckdb_vector_1711276580
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_vector_get_column_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_vector_get_column_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_vector_get_data):
  proc duckdb_vector_get_data*(
    vector: duckdb_vector_1711276580
  ): pointer {.cdecl, importc: "duckdb_vector_get_data".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_vector_get_data" & " already exists, not redeclaring"
    )
when not declared(duckdb_vector_get_validity):
  proc duckdb_vector_get_validity*(
    vector: duckdb_vector_1711276580
  ): ptr uint64 {.cdecl, importc: "duckdb_vector_get_validity".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_vector_get_validity" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_vector_ensure_validity_writable):
  proc duckdb_vector_ensure_validity_writable*(
    vector: duckdb_vector_1711276580
  ): void {.cdecl, importc: "duckdb_vector_ensure_validity_writable".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_vector_ensure_validity_writable" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_vector_assign_string_element):
  proc duckdb_vector_assign_string_element*(
    vector: duckdb_vector_1711276580, index: idx_t_1711276501, str: cstring
  ): void {.cdecl, importc: "duckdb_vector_assign_string_element".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_vector_assign_string_element" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_vector_assign_string_element_len):
  proc duckdb_vector_assign_string_element_len*(
    vector: duckdb_vector_1711276580,
    index: idx_t_1711276501,
    str: cstring,
    str_len: idx_t_1711276501,
  ): void {.cdecl, importc: "duckdb_vector_assign_string_element_len".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_vector_assign_string_element_len" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_list_vector_get_child):
  proc duckdb_list_vector_get_child*(
    vector: duckdb_vector_1711276580
  ): duckdb_vector_1711276580 {.cdecl, importc: "duckdb_list_vector_get_child".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_list_vector_get_child" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_list_vector_get_size):
  proc duckdb_list_vector_get_size*(
    vector: duckdb_vector_1711276580
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_list_vector_get_size".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_list_vector_get_size" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_list_vector_set_size):
  proc duckdb_list_vector_set_size*(
    vector: duckdb_vector_1711276580, size: idx_t_1711276501
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_list_vector_set_size".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_list_vector_set_size" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_list_vector_reserve):
  proc duckdb_list_vector_reserve*(
    vector: duckdb_vector_1711276580, required_capacity: idx_t_1711276501
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_list_vector_reserve".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_list_vector_reserve" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_struct_vector_get_child):
  proc duckdb_struct_vector_get_child*(
    vector: duckdb_vector_1711276580, index: idx_t_1711276501
  ): duckdb_vector_1711276580 {.cdecl, importc: "duckdb_struct_vector_get_child".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_struct_vector_get_child" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_array_vector_get_child):
  proc duckdb_array_vector_get_child*(
    vector: duckdb_vector_1711276580
  ): duckdb_vector_1711276580 {.cdecl, importc: "duckdb_array_vector_get_child".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_array_vector_get_child" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_validity_row_is_valid):
  proc duckdb_validity_row_is_valid*(
    validity: ptr uint64, row: idx_t_1711276501
  ): bool {.cdecl, importc: "duckdb_validity_row_is_valid".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_validity_row_is_valid" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_validity_set_row_validity):
  proc duckdb_validity_set_row_validity*(
    validity: ptr uint64, row: idx_t_1711276501, valid: bool
  ): void {.cdecl, importc: "duckdb_validity_set_row_validity".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_validity_set_row_validity" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_validity_set_row_invalid):
  proc duckdb_validity_set_row_invalid*(
    validity: ptr uint64, row: idx_t_1711276501
  ): void {.cdecl, importc: "duckdb_validity_set_row_invalid".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_validity_set_row_invalid" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_validity_set_row_valid):
  proc duckdb_validity_set_row_valid*(
    validity: ptr uint64, row: idx_t_1711276501
  ): void {.cdecl, importc: "duckdb_validity_set_row_valid".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_validity_set_row_valid" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_scalar_function):
  proc duckdb_create_scalar_function*(): duckdb_scalar_function_1711276656 {.
    cdecl, importc: "duckdb_create_scalar_function"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_scalar_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_scalar_function):
  proc duckdb_destroy_scalar_function*(
    scalar_function: ptr duckdb_scalar_function_1711276656
  ): void {.cdecl, importc: "duckdb_destroy_scalar_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_scalar_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_set_name):
  proc duckdb_scalar_function_set_name*(
    scalar_function: duckdb_scalar_function_1711276656, name: cstring
  ): void {.cdecl, importc: "duckdb_scalar_function_set_name".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_set_name" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_set_varargs):
  proc duckdb_scalar_function_set_varargs*(
    scalar_function: duckdb_scalar_function_1711276656,
    type_arg: duckdb_logical_type_1711276628,
  ): void {.cdecl, importc: "duckdb_scalar_function_set_varargs".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_set_varargs" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_set_special_handling):
  proc duckdb_scalar_function_set_special_handling*(
    scalar_function: duckdb_scalar_function_1711276656
  ): void {.cdecl, importc: "duckdb_scalar_function_set_special_handling".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_set_special_handling" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_set_volatile):
  proc duckdb_scalar_function_set_volatile*(
    scalar_function: duckdb_scalar_function_1711276656
  ): void {.cdecl, importc: "duckdb_scalar_function_set_volatile".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_set_volatile" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_add_parameter):
  proc duckdb_scalar_function_add_parameter*(
    scalar_function: duckdb_scalar_function_1711276656,
    type_arg: duckdb_logical_type_1711276628,
  ): void {.cdecl, importc: "duckdb_scalar_function_add_parameter".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_add_parameter" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_set_return_type):
  proc duckdb_scalar_function_set_return_type*(
    scalar_function: duckdb_scalar_function_1711276656,
    type_arg: duckdb_logical_type_1711276628,
  ): void {.cdecl, importc: "duckdb_scalar_function_set_return_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_set_return_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_set_extra_info):
  proc duckdb_scalar_function_set_extra_info*(
    scalar_function: duckdb_scalar_function_1711276656,
    extra_info: pointer,
    destroy: duckdb_delete_callback_t_1711276503,
  ): void {.cdecl, importc: "duckdb_scalar_function_set_extra_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_set_extra_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_set_function):
  proc duckdb_scalar_function_set_function*(
    scalar_function: duckdb_scalar_function_1711276656,
    function: duckdb_scalar_function_t_1711276662,
  ): void {.cdecl, importc: "duckdb_scalar_function_set_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_set_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_register_scalar_function):
  proc duckdb_register_scalar_function*(
    con: duckdb_connection_1711276600,
    scalar_function: duckdb_scalar_function_1711276656,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_register_scalar_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_register_scalar_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_get_extra_info):
  proc duckdb_scalar_function_get_extra_info*(
    info: duckdb_function_info_1711276652
  ): pointer {.cdecl, importc: "duckdb_scalar_function_get_extra_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_get_extra_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_scalar_function_set_error):
  proc duckdb_scalar_function_set_error*(
    info: duckdb_function_info_1711276652, error: cstring
  ): void {.cdecl, importc: "duckdb_scalar_function_set_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_scalar_function_set_error" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_scalar_function_set):
  proc duckdb_create_scalar_function_set*(
    name: cstring
  ): duckdb_scalar_function_set_1711276660 {.
    cdecl, importc: "duckdb_create_scalar_function_set"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_scalar_function_set" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_scalar_function_set):
  proc duckdb_destroy_scalar_function_set*(
    scalar_function_set: ptr duckdb_scalar_function_set_1711276660
  ): void {.cdecl, importc: "duckdb_destroy_scalar_function_set".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_scalar_function_set" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_add_scalar_function_to_set):
  proc duckdb_add_scalar_function_to_set*(
    set_arg: duckdb_scalar_function_set_1711276660,
    function: duckdb_scalar_function_1711276656,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_add_scalar_function_to_set".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_add_scalar_function_to_set" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_register_scalar_function_set):
  proc duckdb_register_scalar_function_set*(
    con: duckdb_connection_1711276600, set_arg: duckdb_scalar_function_set_1711276660
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_register_scalar_function_set".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_register_scalar_function_set" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_aggregate_function):
  proc duckdb_create_aggregate_function*(): duckdb_aggregate_function_1711276666 {.
    cdecl, importc: "duckdb_create_aggregate_function"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_aggregate_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_aggregate_function):
  proc duckdb_destroy_aggregate_function*(
    aggregate_function: ptr duckdb_aggregate_function_1711276666
  ): void {.cdecl, importc: "duckdb_destroy_aggregate_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_aggregate_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_function_set_name):
  proc duckdb_aggregate_function_set_name*(
    aggregate_function: duckdb_aggregate_function_1711276666, name: cstring
  ): void {.cdecl, importc: "duckdb_aggregate_function_set_name".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function_set_name" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_function_add_parameter):
  proc duckdb_aggregate_function_add_parameter*(
    aggregate_function: duckdb_aggregate_function_1711276666,
    type_arg: duckdb_logical_type_1711276628,
  ): void {.cdecl, importc: "duckdb_aggregate_function_add_parameter".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function_add_parameter" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_function_set_return_type):
  proc duckdb_aggregate_function_set_return_type*(
    aggregate_function: duckdb_aggregate_function_1711276666,
    type_arg: duckdb_logical_type_1711276628,
  ): void {.cdecl, importc: "duckdb_aggregate_function_set_return_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function_set_return_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_function_set_functions):
  proc duckdb_aggregate_function_set_functions*(
    aggregate_function: duckdb_aggregate_function_1711276666,
    state_size: duckdb_aggregate_state_size_1711276676,
    state_init: duckdb_aggregate_init_t_1711276678,
    update: duckdb_aggregate_update_t_1711276682,
    combine: duckdb_aggregate_combine_t_1711276684,
    finalize: duckdb_aggregate_finalize_t_1711276686,
  ): void {.cdecl, importc: "duckdb_aggregate_function_set_functions".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function_set_functions" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_function_set_destructor):
  proc duckdb_aggregate_function_set_destructor*(
    aggregate_function: duckdb_aggregate_function_1711276666,
    destroy: duckdb_aggregate_destroy_t_1711276680,
  ): void {.cdecl, importc: "duckdb_aggregate_function_set_destructor".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function_set_destructor" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_register_aggregate_function):
  proc duckdb_register_aggregate_function*(
    con: duckdb_connection_1711276600,
    aggregate_function: duckdb_aggregate_function_1711276666,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_register_aggregate_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_register_aggregate_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_function_set_special_handling):
  proc duckdb_aggregate_function_set_special_handling*(
    aggregate_function: duckdb_aggregate_function_1711276666
  ): void {.cdecl, importc: "duckdb_aggregate_function_set_special_handling".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function_set_special_handling" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_function_set_extra_info):
  proc duckdb_aggregate_function_set_extra_info*(
    aggregate_function: duckdb_aggregate_function_1711276666,
    extra_info: pointer,
    destroy: duckdb_delete_callback_t_1711276503,
  ): void {.cdecl, importc: "duckdb_aggregate_function_set_extra_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function_set_extra_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_function_get_extra_info):
  proc duckdb_aggregate_function_get_extra_info*(
    info: duckdb_function_info_1711276652
  ): pointer {.cdecl, importc: "duckdb_aggregate_function_get_extra_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function_get_extra_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_aggregate_function_set_error):
  proc duckdb_aggregate_function_set_error*(
    info: duckdb_function_info_1711276652, error: cstring
  ): void {.cdecl, importc: "duckdb_aggregate_function_set_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_aggregate_function_set_error" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_aggregate_function_set):
  proc duckdb_create_aggregate_function_set*(
    name: cstring
  ): duckdb_aggregate_function_set_1711276670 {.
    cdecl, importc: "duckdb_create_aggregate_function_set"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_aggregate_function_set" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_aggregate_function_set):
  proc duckdb_destroy_aggregate_function_set*(
    aggregate_function_set: ptr duckdb_aggregate_function_set_1711276670
  ): void {.cdecl, importc: "duckdb_destroy_aggregate_function_set".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_aggregate_function_set" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_add_aggregate_function_to_set):
  proc duckdb_add_aggregate_function_to_set*(
    set_arg: duckdb_aggregate_function_set_1711276670,
    function: duckdb_aggregate_function_1711276666,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_add_aggregate_function_to_set".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_add_aggregate_function_to_set" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_register_aggregate_function_set):
  proc duckdb_register_aggregate_function_set*(
    con: duckdb_connection_1711276600, set_arg: duckdb_aggregate_function_set_1711276670
  ): duckdb_state_1711276479 {.
    cdecl, importc: "duckdb_register_aggregate_function_set"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_register_aggregate_function_set" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_create_table_function):
  proc duckdb_create_table_function*(): duckdb_table_function_1711276690 {.
    cdecl, importc: "duckdb_create_table_function"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_table_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_table_function):
  proc duckdb_destroy_table_function*(
    table_function: ptr duckdb_table_function_1711276690
  ): void {.cdecl, importc: "duckdb_destroy_table_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_table_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_set_name):
  proc duckdb_table_function_set_name*(
    table_function: duckdb_table_function_1711276690, name: cstring
  ): void {.cdecl, importc: "duckdb_table_function_set_name".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_set_name" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_add_parameter):
  proc duckdb_table_function_add_parameter*(
    table_function: duckdb_table_function_1711276690,
    type_arg: duckdb_logical_type_1711276628,
  ): void {.cdecl, importc: "duckdb_table_function_add_parameter".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_add_parameter" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_add_named_parameter):
  proc duckdb_table_function_add_named_parameter*(
    table_function: duckdb_table_function_1711276690,
    name: cstring,
    type_arg: duckdb_logical_type_1711276628,
  ): void {.cdecl, importc: "duckdb_table_function_add_named_parameter".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_add_named_parameter" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_set_extra_info):
  proc duckdb_table_function_set_extra_info*(
    table_function: duckdb_table_function_1711276690,
    extra_info: pointer,
    destroy: duckdb_delete_callback_t_1711276503,
  ): void {.cdecl, importc: "duckdb_table_function_set_extra_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_set_extra_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_set_bind):
  proc duckdb_table_function_set_bind*(
    table_function: duckdb_table_function_1711276690,
    bind_arg: duckdb_table_function_bind_t_1711276700,
  ): void {.cdecl, importc: "duckdb_table_function_set_bind".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_set_bind" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_set_init):
  proc duckdb_table_function_set_init*(
    table_function: duckdb_table_function_1711276690,
    init: duckdb_table_function_init_t_1711276702,
  ): void {.cdecl, importc: "duckdb_table_function_set_init".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_set_init" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_set_local_init):
  proc duckdb_table_function_set_local_init*(
    table_function: duckdb_table_function_1711276690,
    init: duckdb_table_function_init_t_1711276702,
  ): void {.cdecl, importc: "duckdb_table_function_set_local_init".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_set_local_init" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_set_function):
  proc duckdb_table_function_set_function*(
    table_function: duckdb_table_function_1711276690,
    function: duckdb_table_function_t_1711276704,
  ): void {.cdecl, importc: "duckdb_table_function_set_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_set_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_function_supports_projection_pushdown):
  proc duckdb_table_function_supports_projection_pushdown*(
    table_function: duckdb_table_function_1711276690, pushdown: bool
  ): void {.cdecl, importc: "duckdb_table_function_supports_projection_pushdown".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_function_supports_projection_pushdown" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_register_table_function):
  proc duckdb_register_table_function*(
    con: duckdb_connection_1711276600, function: duckdb_table_function_1711276690
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_register_table_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_register_table_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_get_extra_info):
  proc duckdb_bind_get_extra_info*(
    info: duckdb_bind_info_1711276694
  ): pointer {.cdecl, importc: "duckdb_bind_get_extra_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_get_extra_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_add_result_column):
  proc duckdb_bind_add_result_column*(
    info: duckdb_bind_info_1711276694,
    name: cstring,
    type_arg: duckdb_logical_type_1711276628,
  ): void {.cdecl, importc: "duckdb_bind_add_result_column".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_add_result_column" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_get_parameter_count):
  proc duckdb_bind_get_parameter_count*(
    info: duckdb_bind_info_1711276694
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_bind_get_parameter_count".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_get_parameter_count" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_get_parameter):
  proc duckdb_bind_get_parameter*(
    info: duckdb_bind_info_1711276694, index: idx_t_1711276501
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_bind_get_parameter".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_get_parameter" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_get_named_parameter):
  proc duckdb_bind_get_named_parameter*(
    info: duckdb_bind_info_1711276694, name: cstring
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_bind_get_named_parameter".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_get_named_parameter" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_set_bind_data):
  proc duckdb_bind_set_bind_data*(
    info: duckdb_bind_info_1711276694,
    bind_data: pointer,
    destroy: duckdb_delete_callback_t_1711276503,
  ): void {.cdecl, importc: "duckdb_bind_set_bind_data".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_set_bind_data" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_set_cardinality):
  proc duckdb_bind_set_cardinality*(
    info: duckdb_bind_info_1711276694, cardinality: idx_t_1711276501, is_exact: bool
  ): void {.cdecl, importc: "duckdb_bind_set_cardinality".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_set_cardinality" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_bind_set_error):
  proc duckdb_bind_set_error*(
    info: duckdb_bind_info_1711276694, error: cstring
  ): void {.cdecl, importc: "duckdb_bind_set_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_bind_set_error" & " already exists, not redeclaring"
    )
when not declared(duckdb_init_get_extra_info):
  proc duckdb_init_get_extra_info*(
    info: duckdb_init_info_1711276698
  ): pointer {.cdecl, importc: "duckdb_init_get_extra_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_init_get_extra_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_init_get_bind_data):
  proc duckdb_init_get_bind_data*(
    info: duckdb_init_info_1711276698
  ): pointer {.cdecl, importc: "duckdb_init_get_bind_data".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_init_get_bind_data" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_init_set_init_data):
  proc duckdb_init_set_init_data*(
    info: duckdb_init_info_1711276698,
    init_data: pointer,
    destroy: duckdb_delete_callback_t_1711276503,
  ): void {.cdecl, importc: "duckdb_init_set_init_data".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_init_set_init_data" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_init_get_column_count):
  proc duckdb_init_get_column_count*(
    info: duckdb_init_info_1711276698
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_init_get_column_count".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_init_get_column_count" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_init_get_column_index):
  proc duckdb_init_get_column_index*(
    info: duckdb_init_info_1711276698, column_index: idx_t_1711276501
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_init_get_column_index".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_init_get_column_index" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_init_set_max_threads):
  proc duckdb_init_set_max_threads*(
    info: duckdb_init_info_1711276698, max_threads: idx_t_1711276501
  ): void {.cdecl, importc: "duckdb_init_set_max_threads".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_init_set_max_threads" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_init_set_error):
  proc duckdb_init_set_error*(
    info: duckdb_init_info_1711276698, error: cstring
  ): void {.cdecl, importc: "duckdb_init_set_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_init_set_error" & " already exists, not redeclaring"
    )
when not declared(duckdb_function_get_extra_info):
  proc duckdb_function_get_extra_info*(
    info: duckdb_function_info_1711276652
  ): pointer {.cdecl, importc: "duckdb_function_get_extra_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_function_get_extra_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_function_get_bind_data):
  proc duckdb_function_get_bind_data*(
    info: duckdb_function_info_1711276652
  ): pointer {.cdecl, importc: "duckdb_function_get_bind_data".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_function_get_bind_data" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_function_get_init_data):
  proc duckdb_function_get_init_data*(
    info: duckdb_function_info_1711276652
  ): pointer {.cdecl, importc: "duckdb_function_get_init_data".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_function_get_init_data" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_function_get_local_init_data):
  proc duckdb_function_get_local_init_data*(
    info: duckdb_function_info_1711276652
  ): pointer {.cdecl, importc: "duckdb_function_get_local_init_data".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_function_get_local_init_data" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_function_set_error):
  proc duckdb_function_set_error*(
    info: duckdb_function_info_1711276652, error: cstring
  ): void {.cdecl, importc: "duckdb_function_set_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_function_set_error" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_add_replacement_scan):
  proc duckdb_add_replacement_scan*(
    db: duckdb_database_1711276596,
    replacement: duckdb_replacement_callback_t_1711276716,
    extra_data: pointer,
    delete_callback: duckdb_delete_callback_t_1711276503,
  ): void {.cdecl, importc: "duckdb_add_replacement_scan".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_add_replacement_scan" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_replacement_scan_set_function_name):
  proc duckdb_replacement_scan_set_function_name*(
    info: duckdb_replacement_scan_info_1711276714, function_name: cstring
  ): void {.cdecl, importc: "duckdb_replacement_scan_set_function_name".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_replacement_scan_set_function_name" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_replacement_scan_add_parameter):
  proc duckdb_replacement_scan_add_parameter*(
    info: duckdb_replacement_scan_info_1711276714, parameter: duckdb_value_1711276640
  ): void {.cdecl, importc: "duckdb_replacement_scan_add_parameter".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_replacement_scan_add_parameter" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_replacement_scan_set_error):
  proc duckdb_replacement_scan_set_error*(
    info: duckdb_replacement_scan_info_1711276714, error: cstring
  ): void {.cdecl, importc: "duckdb_replacement_scan_set_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_replacement_scan_set_error" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_get_profiling_info):
  proc duckdb_get_profiling_info*(
    connection: duckdb_connection_1711276600
  ): duckdb_profiling_info_1711276644 {.cdecl, importc: "duckdb_get_profiling_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_get_profiling_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_profiling_info_get_value):
  proc duckdb_profiling_info_get_value*(
    info: duckdb_profiling_info_1711276644, key: cstring
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_profiling_info_get_value".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_profiling_info_get_value" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_profiling_info_get_metrics):
  proc duckdb_profiling_info_get_metrics*(
    info: duckdb_profiling_info_1711276644
  ): duckdb_value_1711276640 {.cdecl, importc: "duckdb_profiling_info_get_metrics".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_profiling_info_get_metrics" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_profiling_info_get_child_count):
  proc duckdb_profiling_info_get_child_count*(
    info: duckdb_profiling_info_1711276644
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_profiling_info_get_child_count".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_profiling_info_get_child_count" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_profiling_info_get_child):
  proc duckdb_profiling_info_get_child*(
    info: duckdb_profiling_info_1711276644, index: idx_t_1711276501
  ): duckdb_profiling_info_1711276644 {.
    cdecl, importc: "duckdb_profiling_info_get_child"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_profiling_info_get_child" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_appender_create):
  proc duckdb_appender_create*(
    connection: duckdb_connection_1711276600,
    schema: cstring,
    table: cstring,
    out_appender: ptr duckdb_appender_1711276616,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_appender_create".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_appender_create" & " already exists, not redeclaring"
    )
when not declared(duckdb_appender_column_count):
  proc duckdb_appender_column_count*(
    appender: duckdb_appender_1711276616
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_appender_column_count".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_appender_column_count" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_appender_column_type):
  proc duckdb_appender_column_type*(
    appender: duckdb_appender_1711276616, col_idx: idx_t_1711276501
  ): duckdb_logical_type_1711276628 {.cdecl, importc: "duckdb_appender_column_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_appender_column_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_appender_error):
  proc duckdb_appender_error*(
    appender: duckdb_appender_1711276616
  ): cstring {.cdecl, importc: "duckdb_appender_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_appender_error" & " already exists, not redeclaring"
    )
when not declared(duckdb_appender_flush):
  proc duckdb_appender_flush*(
    appender: duckdb_appender_1711276616
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_appender_flush".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_appender_flush" & " already exists, not redeclaring"
    )
when not declared(duckdb_appender_close):
  proc duckdb_appender_close*(
    appender: duckdb_appender_1711276616
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_appender_close".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_appender_close" & " already exists, not redeclaring"
    )
when not declared(duckdb_appender_destroy):
  proc duckdb_appender_destroy*(
    appender: ptr duckdb_appender_1711276616
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_appender_destroy".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_appender_destroy" & " already exists, not redeclaring"
    )
when not declared(duckdb_appender_begin_row):
  proc duckdb_appender_begin_row*(
    appender: duckdb_appender_1711276616
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_appender_begin_row".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_appender_begin_row" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_appender_end_row):
  proc duckdb_appender_end_row*(
    appender: duckdb_appender_1711276616
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_appender_end_row".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_appender_end_row" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_default):
  proc duckdb_append_default*(
    appender: duckdb_appender_1711276616
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_default".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_default" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_bool):
  proc duckdb_append_bool*(
    appender: duckdb_appender_1711276616, value: bool
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_bool".}

else:
  static:
    hint("Declaration of " & "duckdb_append_bool" & " already exists, not redeclaring")
when not declared(duckdb_append_int8):
  proc duckdb_append_int8*(
    appender: duckdb_appender_1711276616, value: int8
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_int8".}

else:
  static:
    hint("Declaration of " & "duckdb_append_int8" & " already exists, not redeclaring")
when not declared(duckdb_append_int16):
  proc duckdb_append_int16*(
    appender: duckdb_appender_1711276616, value: int16
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_int16".}

else:
  static:
    hint("Declaration of " & "duckdb_append_int16" & " already exists, not redeclaring")
when not declared(duckdb_append_int32):
  proc duckdb_append_int32*(
    appender: duckdb_appender_1711276616, value: int32
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_int32".}

else:
  static:
    hint("Declaration of " & "duckdb_append_int32" & " already exists, not redeclaring")
when not declared(duckdb_append_int64):
  proc duckdb_append_int64*(
    appender: duckdb_appender_1711276616, value: int64
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_int64".}

else:
  static:
    hint("Declaration of " & "duckdb_append_int64" & " already exists, not redeclaring")
when not declared(duckdb_append_hugeint):
  proc duckdb_append_hugeint*(
    appender: duckdb_appender_1711276616, value: duckdb_hugeint_1711276545
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_hugeint".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_hugeint" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_uint8):
  proc duckdb_append_uint8*(
    appender: duckdb_appender_1711276616, value: uint8
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_uint8".}

else:
  static:
    hint("Declaration of " & "duckdb_append_uint8" & " already exists, not redeclaring")
when not declared(duckdb_append_uint16):
  proc duckdb_append_uint16*(
    appender: duckdb_appender_1711276616, value: uint16
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_uint16".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_uint16" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_uint32):
  proc duckdb_append_uint32*(
    appender: duckdb_appender_1711276616, value: uint32
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_uint32".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_uint32" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_uint64):
  proc duckdb_append_uint64*(
    appender: duckdb_appender_1711276616, value: uint64
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_uint64".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_uint64" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_uhugeint):
  proc duckdb_append_uhugeint*(
    appender: duckdb_appender_1711276616, value: duckdb_uhugeint_1711276549
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_uhugeint".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_uhugeint" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_float):
  proc duckdb_append_float*(
    appender: duckdb_appender_1711276616, value: cfloat
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_float".}

else:
  static:
    hint("Declaration of " & "duckdb_append_float" & " already exists, not redeclaring")
when not declared(duckdb_append_double):
  proc duckdb_append_double*(
    appender: duckdb_appender_1711276616, value: cdouble
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_double".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_double" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_date):
  proc duckdb_append_date*(
    appender: duckdb_appender_1711276616, value: duckdb_date_1711276509
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_date".}

else:
  static:
    hint("Declaration of " & "duckdb_append_date" & " already exists, not redeclaring")
when not declared(duckdb_append_time):
  proc duckdb_append_time*(
    appender: duckdb_appender_1711276616, value: duckdb_time_1711276517
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_time".}

else:
  static:
    hint("Declaration of " & "duckdb_append_time" & " already exists, not redeclaring")
when not declared(duckdb_append_timestamp):
  proc duckdb_append_timestamp*(
    appender: duckdb_appender_1711276616, value: duckdb_timestamp_1711276533
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_timestamp".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_timestamp" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_interval):
  proc duckdb_append_interval*(
    appender: duckdb_appender_1711276616, value: duckdb_interval_1711276541
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_interval".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_interval" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_varchar):
  proc duckdb_append_varchar*(
    appender: duckdb_appender_1711276616, val: cstring
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_varchar".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_varchar" & " already exists, not redeclaring"
    )
when not declared(duckdb_append_varchar_length):
  proc duckdb_append_varchar_length*(
    appender: duckdb_appender_1711276616, val: cstring, length: idx_t_1711276501
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_varchar_length".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_varchar_length" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_append_blob):
  proc duckdb_append_blob*(
    appender: duckdb_appender_1711276616, data: pointer, length: idx_t_1711276501
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_blob".}

else:
  static:
    hint("Declaration of " & "duckdb_append_blob" & " already exists, not redeclaring")
when not declared(duckdb_append_null):
  proc duckdb_append_null*(
    appender: duckdb_appender_1711276616
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_null".}

else:
  static:
    hint("Declaration of " & "duckdb_append_null" & " already exists, not redeclaring")
when not declared(duckdb_append_data_chunk):
  proc duckdb_append_data_chunk*(
    appender: duckdb_appender_1711276616, chunk: duckdb_data_chunk_1711276636
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_append_data_chunk".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_append_data_chunk" & " already exists, not redeclaring"
    )
when not declared(duckdb_table_description_create):
  proc duckdb_table_description_create*(
    connection: duckdb_connection_1711276600,
    schema: cstring,
    table: cstring,
    out_arg: ptr duckdb_table_description_1711276620,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_table_description_create".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_description_create" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_description_destroy):
  proc duckdb_table_description_destroy*(
    table_description: ptr duckdb_table_description_1711276620
  ): void {.cdecl, importc: "duckdb_table_description_destroy".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_description_destroy" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_table_description_error):
  proc duckdb_table_description_error*(
    table_description: duckdb_table_description_1711276620
  ): cstring {.cdecl, importc: "duckdb_table_description_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_table_description_error" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_column_has_default):
  proc duckdb_column_has_default*(
    table_description: duckdb_table_description_1711276620,
    index: idx_t_1711276501,
    out_arg: ptr bool,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_column_has_default".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_column_has_default" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_query_arrow):
  proc duckdb_query_arrow*(
    connection: duckdb_connection_1711276600,
    query: cstring,
    out_result: ptr duckdb_arrow_1711276720,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_query_arrow".}

else:
  static:
    hint("Declaration of " & "duckdb_query_arrow" & " already exists, not redeclaring")
when not declared(duckdb_query_arrow_schema):
  proc duckdb_query_arrow_schema*(
    result: duckdb_arrow_1711276720, out_schema: ptr duckdb_arrow_schema_1711276728
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_query_arrow_schema".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_query_arrow_schema" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_prepared_arrow_schema):
  proc duckdb_prepared_arrow_schema*(
    prepared: duckdb_prepared_statement_1711276604,
    out_schema: ptr duckdb_arrow_schema_1711276728,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_prepared_arrow_schema".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_prepared_arrow_schema" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_result_arrow_array):
  proc duckdb_result_arrow_array*(
    result: duckdb_result_1711276592,
    chunk: duckdb_data_chunk_1711276636,
    out_array: ptr duckdb_arrow_array_1711276732,
  ): void {.cdecl, importc: "duckdb_result_arrow_array".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_result_arrow_array" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_query_arrow_array):
  proc duckdb_query_arrow_array*(
    result: duckdb_arrow_1711276720, out_array: ptr duckdb_arrow_array_1711276732
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_query_arrow_array".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_query_arrow_array" & " already exists, not redeclaring"
    )
when not declared(duckdb_arrow_column_count):
  proc duckdb_arrow_column_count*(
    result: duckdb_arrow_1711276720
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_arrow_column_count".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_arrow_column_count" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_arrow_row_count):
  proc duckdb_arrow_row_count*(
    result: duckdb_arrow_1711276720
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_arrow_row_count".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_arrow_row_count" & " already exists, not redeclaring"
    )
when not declared(duckdb_arrow_rows_changed):
  proc duckdb_arrow_rows_changed*(
    result: duckdb_arrow_1711276720
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_arrow_rows_changed".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_arrow_rows_changed" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_query_arrow_error):
  proc duckdb_query_arrow_error*(
    result: duckdb_arrow_1711276720
  ): cstring {.cdecl, importc: "duckdb_query_arrow_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_query_arrow_error" & " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_arrow):
  proc duckdb_destroy_arrow*(
    result: ptr duckdb_arrow_1711276720
  ): void {.cdecl, importc: "duckdb_destroy_arrow".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_arrow" & " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_arrow_stream):
  proc duckdb_destroy_arrow_stream*(
    stream_p: ptr duckdb_arrow_stream_1711276724
  ): void {.cdecl, importc: "duckdb_destroy_arrow_stream".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_arrow_stream" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_execute_prepared_arrow):
  proc duckdb_execute_prepared_arrow*(
    prepared_statement: duckdb_prepared_statement_1711276604,
    out_result: ptr duckdb_arrow_1711276720,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_execute_prepared_arrow".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_execute_prepared_arrow" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_arrow_scan):
  proc duckdb_arrow_scan*(
    connection: duckdb_connection_1711276600,
    table_name: cstring,
    arrow: duckdb_arrow_stream_1711276724,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_arrow_scan".}

else:
  static:
    hint("Declaration of " & "duckdb_arrow_scan" & " already exists, not redeclaring")
when not declared(duckdb_arrow_array_scan):
  proc duckdb_arrow_array_scan*(
    connection: duckdb_connection_1711276600,
    table_name: cstring,
    arrow_schema: duckdb_arrow_schema_1711276728,
    arrow_array: duckdb_arrow_array_1711276732,
    out_stream: ptr duckdb_arrow_stream_1711276724,
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_arrow_array_scan".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_arrow_array_scan" & " already exists, not redeclaring"
    )
when not declared(duckdb_execute_tasks):
  proc duckdb_execute_tasks*(
    database: duckdb_database_1711276596, max_tasks: idx_t_1711276501
  ): void {.cdecl, importc: "duckdb_execute_tasks".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_execute_tasks" & " already exists, not redeclaring"
    )
when not declared(duckdb_create_task_state):
  proc duckdb_create_task_state*(
    database: duckdb_database_1711276596
  ): duckdb_task_state_1711276505 {.cdecl, importc: "duckdb_create_task_state".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_task_state" & " already exists, not redeclaring"
    )
when not declared(duckdb_execute_tasks_state):
  proc duckdb_execute_tasks_state*(
    state: duckdb_task_state_1711276505
  ): void {.cdecl, importc: "duckdb_execute_tasks_state".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_execute_tasks_state" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_execute_n_tasks_state):
  proc duckdb_execute_n_tasks_state*(
    state: duckdb_task_state_1711276505, max_tasks: idx_t_1711276501
  ): idx_t_1711276501 {.cdecl, importc: "duckdb_execute_n_tasks_state".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_execute_n_tasks_state" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_finish_execution):
  proc duckdb_finish_execution*(
    state: duckdb_task_state_1711276505
  ): void {.cdecl, importc: "duckdb_finish_execution".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_finish_execution" & " already exists, not redeclaring"
    )
when not declared(duckdb_task_state_is_finished):
  proc duckdb_task_state_is_finished*(
    state: duckdb_task_state_1711276505
  ): bool {.cdecl, importc: "duckdb_task_state_is_finished".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_task_state_is_finished" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_task_state):
  proc duckdb_destroy_task_state*(
    state: duckdb_task_state_1711276505
  ): void {.cdecl, importc: "duckdb_destroy_task_state".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_task_state" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_execution_is_finished):
  proc duckdb_execution_is_finished*(
    con: duckdb_connection_1711276600
  ): bool {.cdecl, importc: "duckdb_execution_is_finished".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_execution_is_finished" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_stream_fetch_chunk):
  proc duckdb_stream_fetch_chunk*(
    result: duckdb_result_1711276592
  ): duckdb_data_chunk_1711276636 {.cdecl, importc: "duckdb_stream_fetch_chunk".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_stream_fetch_chunk" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_fetch_chunk):
  proc duckdb_fetch_chunk*(
    result: duckdb_result_1711276592
  ): duckdb_data_chunk_1711276636 {.cdecl, importc: "duckdb_fetch_chunk".}

else:
  static:
    hint("Declaration of " & "duckdb_fetch_chunk" & " already exists, not redeclaring")
when not declared(duckdb_create_cast_function):
  proc duckdb_create_cast_function*(): duckdb_cast_function_1711276708 {.
    cdecl, importc: "duckdb_create_cast_function"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_create_cast_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_cast_function_set_source_type):
  proc duckdb_cast_function_set_source_type*(
    cast_function: duckdb_cast_function_1711276708,
    source_type: duckdb_logical_type_1711276628,
  ): void {.cdecl, importc: "duckdb_cast_function_set_source_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function_set_source_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_cast_function_set_target_type):
  proc duckdb_cast_function_set_target_type*(
    cast_function: duckdb_cast_function_1711276708,
    target_type: duckdb_logical_type_1711276628,
  ): void {.cdecl, importc: "duckdb_cast_function_set_target_type".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function_set_target_type" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_cast_function_set_implicit_cast_cost):
  proc duckdb_cast_function_set_implicit_cast_cost*(
    cast_function: duckdb_cast_function_1711276708, cost: int64
  ): void {.cdecl, importc: "duckdb_cast_function_set_implicit_cast_cost".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function_set_implicit_cast_cost" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_cast_function_set_function):
  proc duckdb_cast_function_set_function*(
    cast_function: duckdb_cast_function_1711276708,
    function: duckdb_cast_function_t_1711276710,
  ): void {.cdecl, importc: "duckdb_cast_function_set_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function_set_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_cast_function_set_extra_info):
  proc duckdb_cast_function_set_extra_info*(
    cast_function: duckdb_cast_function_1711276708,
    extra_info: pointer,
    destroy: duckdb_delete_callback_t_1711276503,
  ): void {.cdecl, importc: "duckdb_cast_function_set_extra_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function_set_extra_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_cast_function_get_extra_info):
  proc duckdb_cast_function_get_extra_info*(
    info: duckdb_function_info_1711276652
  ): pointer {.cdecl, importc: "duckdb_cast_function_get_extra_info".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function_get_extra_info" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_cast_function_get_cast_mode):
  proc duckdb_cast_function_get_cast_mode*(
    info: duckdb_function_info_1711276652
  ): duckdb_cast_mode_1711276499 {.
    cdecl, importc: "duckdb_cast_function_get_cast_mode"
  .}

else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function_get_cast_mode" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_cast_function_set_error):
  proc duckdb_cast_function_set_error*(
    info: duckdb_function_info_1711276652, error: cstring
  ): void {.cdecl, importc: "duckdb_cast_function_set_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function_set_error" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_cast_function_set_row_error):
  proc duckdb_cast_function_set_row_error*(
    info: duckdb_function_info_1711276652,
    error: cstring,
    row: idx_t_1711276501,
    output: duckdb_vector_1711276580,
  ): void {.cdecl, importc: "duckdb_cast_function_set_row_error".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_cast_function_set_row_error" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_register_cast_function):
  proc duckdb_register_cast_function*(
    con: duckdb_connection_1711276600, cast_function: duckdb_cast_function_1711276708
  ): duckdb_state_1711276479 {.cdecl, importc: "duckdb_register_cast_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_register_cast_function" &
        " already exists, not redeclaring"
    )
when not declared(duckdb_destroy_cast_function):
  proc duckdb_destroy_cast_function*(
    cast_function: ptr duckdb_cast_function_1711276708
  ): void {.cdecl, importc: "duckdb_destroy_cast_function".}

else:
  static:
    hint(
      "Declaration of " & "duckdb_destroy_cast_function" &
        " already exists, not redeclaring"
    )
