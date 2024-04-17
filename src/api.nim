when defined(useFuthark):
  import os, futhark
  # Tell futhark where to find the C libraries you will compile with, and what
  # header files you wish to import.
  importc:
    outputPath currentSourcePath.parentDir / "generated.nim"
    path "src/include"
    "duckdb.h"

  {.passL: "-lduckdb".}
else:
  include "generated.nim"


when defined(cpp):
  echo "CPP"
  proc CreateScalarFunction(name: cstring, args: varargs[string, `$`]): void {.importcpp: "CreateScalarFunction", header: "include/duckdb/main/connection.hpp".}
# template <typename TR, typename... Args>
# 	void CreateScalarFunction(const string &name, TR (*udf_func)(Args...)) {
# 		scalar_function_t function = UDFWrapper::CreateScalarFunction<TR, Args...>(name, udf_func);
# 		UDFWrapper::RegisterFunction<TR, Args...>(name, function, *context);
# 	}

# 	template <typename TR, typename... Args>
# 	void CreateScalarFunction(const string &name, vector<LogicalType> args, LogicalType ret_type,
# 	                          TR (*udf_func)(Args...)) {
# 		scalar_function_t function = UDFWrapper::CreateScalarFunction<TR, Args...>(name, args, ret_type, udf_func);
# 		UDFWrapper::RegisterFunction(name, args, ret_type, function, *context);
# 	}

# 	template <typename TR, typename... Args>
# 	void CreateVectorizedFunction(const string &name, scalar_function_t udf_func,
# 	                              LogicalType varargs = LogicalType::INVALID) {
# 		UDFWrapper::RegisterFunction<TR, Args...>(name, udf_func, *context, std::move(varargs));
# 	}

# 	void CreateVectorizedFunction(const string &name, vector<LogicalType> args, LogicalType ret_type,
# 	                              scalar_function_t udf_func, LogicalType varargs = LogicalType::INVALID) {
# 		UDFWrapper::RegisterFunction(name, std::move(args), std::move(ret_type), udf_func, *context,
# 		                             std::move(varargs));
# 	}

# 	//------------------------------------- Aggreate Functions ----------------------------------------//
# 	template <typename UDF_OP, typename STATE, typename TR, typename TA>
# 	void CreateAggregateFunction(const string &name) {
# 		AggregateFunction function = UDFWrapper::CreateAggregateFunction<UDF_OP, STATE, TR, TA>(name);
# 		UDFWrapper::RegisterAggrFunction(function, *context);
# 	}

# 	template <typename UDF_OP, typename STATE, typename TR, typename TA, typename TB>
# 	void CreateAggregateFunction(const string &name) {
# 		AggregateFunction function = UDFWrapper::CreateAggregateFunction<UDF_OP, STATE, TR, TA, TB>(name);
# 		UDFWrapper::RegisterAggrFunction(function, *context);
# 	}

# 	template <typename UDF_OP, typename STATE, typename TR, typename TA>
# 	void CreateAggregateFunction(const string &name, LogicalType ret_type, LogicalType input_typeA) {
# 		AggregateFunction function =
# 		    UDFWrapper::CreateAggregateFunction<UDF_OP, STATE, TR, TA>(name, ret_type, input_typeA);
# 		UDFWrapper::RegisterAggrFunction(function, *context);
# 	}

# 	template <typename UDF_OP, typename STATE, typename TR, typename TA, typename TB>
# 	void CreateAggregateFunction(const string &name, LogicalType ret_type, LogicalType input_typeA,
# 	                             LogicalType input_typeB) {
# 		AggregateFunction function =
# 		    UDFWrapper::CreateAggregateFunction<UDF_OP, STATE, TR, TA, TB>(name, ret_type, input_typeA, input_typeB);
# 		UDFWrapper::RegisterAggrFunction(function, *context);
# 	}

# 	void CreateAggregateFunction(const string &name, vector<LogicalType> arguments, LogicalType return_type,
# 	                             aggregate_size_t state_size, aggregate_initialize_t initialize,
# 	                             aggregate_update_t update, aggregate_combine_t combine, aggregate_finalize_t finalize,
# 	                             aggregate_simple_update_t simple_update = nullptr,
# 	                             bind_aggregate_function_t bind = nullptr,
# 	                             aggregate_destructor_t destructor = nullptr) {
# 		AggregateFunction function =
# 		    UDFWrapper::CreateAggregateFunction(name, arguments, return_type, state_size, initialize, update, combine,
# 		                                        finalize, simple_update, bind, destructor);
# 		UDFWrapper::RegisterAggrFunction(function, *context);
# 	}
else:
  echo "C"
