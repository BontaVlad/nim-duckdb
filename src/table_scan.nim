import std/[sequtils]
import /[api, database, query, table_functions, types]


# type
#   TableBindInfo* = object
#     inputColumns: seq[Column]
#     scanTypes: seq[DuckType]
#     resultTypes: seq[DuckType]
#     scanFunctions: seq[proc(x: pointer): pointer] # Adjust signature as needed



# function tbl_global_init_function(info::DuckDB.InitInfo)
#     bind_info = DuckDB.get_bind_info(info, TableBindInfo)
#     # figure out the maximum number of threads to launch from the tbl size
#     row_count::Int64 = Tables.rowcount(bind_info.tbl)
#     max_threads::Int64 = ceil(row_count / DuckDB.ROW_GROUP_SIZE)
#     DuckDB.set_max_threads(info, max_threads)
#     return TableGlobalInfo()
# end

# function tbl_local_init_function(info::DuckDB.InitInfo)
#     columns = DuckDB.get_projected_columns(info)
#     return TableLocalInfo(columns)
# end

# function tbl_scan_function(info::DuckDB.FunctionInfo, output::DuckDB.DataChunk)
#     bind_info = DuckDB.get_bind_info(info, TableBindInfo)
#     global_info = DuckDB.get_init_info(info, TableGlobalInfo)
#     local_info = DuckDB.get_local_info(info, TableLocalInfo)

#     if local_info.current_pos >= local_info.end_pos
#         # ran out of data to scan in the local info: fetch new rows from the global state (if any)
#         # we can in increments of 100 vectors
#         lock(global_info.global_lock) do
#             row_count::Int64 = Tables.rowcount(bind_info.tbl)
#             local_info.current_pos = global_info.pos
#             total_scan_amount::Int64 = DuckDB.ROW_GROUP_SIZE
#             if local_info.current_pos + total_scan_amount >= row_count
#                 total_scan_amount = row_count - local_info.current_pos
#             end
#             local_info.end_pos = local_info.current_pos + total_scan_amount
#             return global_info.pos += total_scan_amount
#         end
#     end
#     scan_count::Int64 = DuckDB.VECTOR_SIZE
#     current_row::Int64 = local_info.current_pos
#     if current_row + scan_count >= local_info.end_pos
#         scan_count = local_info.end_pos - current_row
#     end
#     local_info.current_pos += scan_count

#     result_idx::Int64 = 1
#     for col_idx::Int64 in local_info.columns
#         if col_idx == 0
#             result_idx += 1
#             continue
#         end
#         bind_info.scan_functions[col_idx](
#             bind_info.input_columns[col_idx],
#             current_row,
#             col_idx,
#             result_idx,
#             scan_count,
#             output,
#             bind_info.result_types[col_idx],
#             bind_info.scan_types[col_idx]
#         )
#         result_idx += 1
#     end
#     DuckDB.set_size(output, scan_count)
#     return
# end

# function tbl_bind_function(info::DuckDB.BindInfo)
#     # fetch the tbl name from the function parameters
#     parameter = DuckDB.get_parameter(info, 0)
#     name = DuckDB.getvalue(parameter, String)
#     # fetch the actual tbl using the function name
#     extra_data = DuckDB.get_extra_data(info)
#     tbl = extra_data[name]

#     # set the cardinality
#     row_count::UInt64 = Tables.rowcount(tbl)
#     DuckDB.set_stats_cardinality(info, row_count, true)

#     # register the result columns
#     input_columns = Vector()
#     scan_types::Vector{Type} = Vector()
#     result_types::Vector{Type} = Vector()
#     scan_functions::Vector{Function} = Vector()
#     for entry in Tables.columnnames(tbl)
#         result_type = table_result_type(tbl, entry)
#         scan_function = tbl_scan_function(tbl, entry)
#         push!(input_columns, tbl[entry])
#         push!(scan_types, eltype(tbl[entry]))
#         push!(result_types, julia_to_duck_type(result_type))
#         push!(scan_functions, scan_function)

#         DuckDB.add_result_column(info, string(entry), result_type)
#     end
#     return TableBindInfo(tbl, input_columns, scan_types, result_types, scan_functions)
# end
proc register*(con: Connection, df: DataFrame) =

  proc bindFunction(info: duckdb_bind_info) =
    let
      parameter = info.parameters.toSeq
      # data = BindData(count: parameter[0].valueVarChar)
    # GC_ref(data)

  proc initFunction(info: duckdb_init_info) =
    discard

  proc mainFunction(info: duckdb_function_info, chunk: duckdb_data_chunk) =
    discard

  let tf = newTableFunction(
    name = "nim_tbl_scan",
    parameters = @[newLogicalType(DuckType.VARCHAR)],
    bindFunc = bindFunction,
    initFunc = initFunction,
    initLocalFunc = proc(_: duckdb_init_info) = discard,
    mainFunc = mainFunction,
    extraData = nil,
    projectionPushdown = true,
  )
  con.register(tf)
  echo con.execute("""CREATE OR REPLACE VIEW "{name}" AS SELECT * FROM nim_tbl_scan('{name}');""")

# function _add_table_scan(db::DB)
#     # add the table scan function
#     DuckDB.create_table_function(
#         db.main_connection,
#         "julia_tbl_scan",
#         [String],
#         tbl_bind_function,
#         tbl_global_init_function,
#         tbl_scan_function,
#         db.handle.registered_objects,
#         true,
#         tbl_local_init_function
#     )
#     return
# end
# function create_table_function(
#     db::DB,
#     name::AbstractString,
#     parameters::Vector{DataType},
#     bind_func::Function,
#     init_func::Function,
#     main_func::Function,
#     extra_data::Any = missing,
#     projection_pushdown::Bool = false,
#     init_local_func::Union{Missing, Function} = missing
# )
