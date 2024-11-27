import std/[macros, sequtils, tables]
import fusion/[matching, astdsl]
import /[api, database, types, exceptions, value]

{.experimental: "caseStmtMacros".}

type
  ScalarFunctionBase* = object of RootObj
    name*: string
    handle*: duckdb_scalar_function

  ScalarFunction* = ref object of ScalarFunctionBase

proc `=destroy`(s: ScalarFunctionBase) =
  if not isNil(s.addr) and not isNil(s.handle.addr):
    duckdb_destroy_scalar_function(s.handle.addr)

proc newScalarFunction*(name: string): ScalarFunction =
  result = ScalarFunction(name: name, handle: duckdb_create_scalar_function())

macro scalar*(body: typed): untyped =
  if body.kind != nnkProcDef:
    error("The {.scalar.} pragma can only be applied to proc definitions.")

  dumpTree:
    proc myDoubleFunction(
        info: duckdb_function_info, chunk: duckdb_data_chunk, output: duckdb_vector
    ) {.cdecl.} =
      let
        size = duckdb_data_chunk_get_size(chunk)
        inputRaw = duckdb_data_chunk_get_vector(chunk, 0.idx_t)
        inputArray = cast[ptr UncheckedArray[int64]](duckdb_vector_get_data(inputRaw))

    var outputArray = cast[ptr UncheckedArray[int64]](duckdb_vector_get_data(output))

    for i in 0 ..< size:
      outputArray[i] = foo(inputArray[i.int])

  # echo body.treeRepr
  body.assertMatch:
    ProcDef:
      Sym(strVal: @name) | Postfix[_, Sym(strVal: @name)]
      _ # Term rewriting template
      _ # Generic params
      @formalParams
      @pragmas
      _ # Reserved
      @implementation
      all _

  let
    params = formalParams.toSeq
    returnType = params[0]
    scalarFunc = ident(name)
    nameNode = ident(name & "callBack")
    callback = newProc(name = nameNode, params = params, body = implementation)
    wrapperName = ident("scalarWrapper" & name)

  let wrapper = buildAst(stmtList):
    let parameters = [
      newEmptyNode(),
      newIdentDefs(ident("info"), ident("duckdb_function_info")),
      newIdentDefs(ident("chunk"), ident("duckdb_data_chunk")),
      newIdentDefs(ident("output"), ident("duckdb_vector")),
    ]

    let wrapperBody = buildAst(stmtList):
      newLetStmt(ident("size"), newCall("duckdb_data_chunk_get_size", ident("chunk")))
      newLetStmt(
        ident("inputRaw"),
        newCall(
          "duckdb_data_chunk_get_vector",
          ident("chunk"),
          newDotExpr(newLit(0), ident("idx_t")),
        ),
      )
      newCall(bindSym"echo", ident("size"))

    newProc(
      name = wrapperName,
      params = parameters,
      body = wrapperBody,
      pragmas = nnkPragma.newTree(ident("cdecl")),
    )

  var types = initTable[DuckType, NimNode]()
  let createdScalarFunc = buildAst(stmtList):
    newLetStmt scalarFunc, newCall(bindSym"newScalarFunction", newLit scalarFunc.strVal)

    for param in params[1 ..^ 1]:
      let duckTp = newDuckType(param[^2])

      if not types.contains(duckTp):
        let dTp = genSym(nskLet, $duckTp)
        newLetStmt dTp, newCall(bindSym"newDuckType", ident(param[^2].strVal))
        let lgTp = genSym(nskLet, $duckTp)
        newLetStmt lgTp, newCall(bindSym"newLogicalType", dTp)
        types[duckTp] = lgTp

      for p in param[0 ..< ^2]:
        newCall(
          bindSym("duckdb_scalar_function_add_parameter"),
          newDotExpr(scalarFunc, ident"handle"),
          newDotExpr(types[duckTp], ident"handle"),
        )

    let returnDkTp = newDuckType(params[0])

    if not types.contains(returnDkTp):
      let dTp = genSym(nskLet, $returnDkTp)
      newLetStmt dTp, newCall(bindSym"newDuckType", ident(params[0].strVal))
      let lgTp = genSym(nskLet, $returnDkTp)
      newLetStmt lgTp, newCall(bindSym"newLogicalType", dTp)
      types[returnDkTp] = lgTp

    newCall(
      bindSym("duckdb_scalar_function_set_return_type"),
      newDotExpr(scalarFunc, ident"handle"),
      newDotExpr(types[returnDkTp], ident"handle"),
    )

    newCall(
      bindSym("duckdb_scalar_function_set_function"),
      newDotExpr(scalarFunc, ident"handle"),
      wrapperName,
    )

  result = nnkStmtList.newTree()
  result.add quote do:
    `callback`

    `wrapper`

    `createdScalarFunc`

  echo result.repr

  # body.assertMatch:
  #   ProcDef:
  #   Sym(strVal: @scalarFunc) | Postfix[_, Sym(strVal: @scalarFunc)]
  #   _ # Term rewriting template
  #   _ # Generic params
  #   @formalParams
  #   @pragmas
  #   _ # Reserved
  #   @implementation
  #   all _

  # let
  #   params = formalParams.toSeq
  #   returnType = params[0]
  #   scalarFuncNode = ident(scalarFunc & "callback")
  #   callback = newProc(scalarFunc=scalarFuncNode, params=params, body=implementation)

  # result = nnkStmtList.newTree()
  # result.add quote do:
  #   `callback`

  # result.add(newLetStmt(ident($scalarFunc), newCall(bindSym"newScalarFunction", scalarFunc.toStrLit)))
  # echo result.repr

  # result = newStmtList()
  # result.add(newLetStmt(ident($scalarFunc), newCall("newScalarFunction", scalarFunc.toStrLit)))
  # result.add quote do:
  #   duckdb_scalar_function_set_name(`scalarFunc`.handle, scalarFunc.strVal.cstring)
  #   duckdb_scalar_function_add_parameter(`scalarFunc`.handle, bigInt.handle)
  #   duckdb_scalar_function_set_return_type(`scalarFunc`.handle, bigInt.handle)
  #   duckdb_scalar_function_set_function(scalarFunc.handle, myDoubleFunction)

  # let procName = ident(body[0].strVal)
  # let name = body[0].strVal

  # let wrapperName = ident("scalarWrapper" & procName.strVal)

  # echo body.treeRepr
  # result = quote do:
  #   let `procName` = newScalarFunction(name)
  #   proc `wrapperName`() =
  #     echo "foo"

  # echo "             "
  # echo "             "
  # echo result.repr

  #  proc myDoubleFunction(info: duckdb_function_info, chunk: duckdb_data_chunk, output: duckdb_vector) {.cdecl.} =
  #    let
  #      size = duckdb_data_chunk_get_size(chunk)
  #      inputRaw = duckdb_data_chunk_get_vector(chunk, 0.idx_t)
  #      inputArray = cast[ptr UncheckedArray[int64]](duckdb_vector_get_data(inputRaw))

  #  var outputArray = cast[ptr UncheckedArray[int64]](duckdb_vector_get_data(output))

  # for i in 0..< size:
  #  outputArray[i] = foo(inputArray[i.int])

  # let bigInt = newLogicalType(DuckType.BigInt)

  # duckdb_scalar_function_set_name(result.handle, name.cstring)
  # duckdb_scalar_function_add_parameter(result.handle, bigInt.handle)
  # duckdb_scalar_function_set_return_type(result.handle, bigInt.handle)
  # duckdb_scalar_function_set_function(result.handle, myDoubleFunction)

proc register*(con: Connection, fun: ScalarFunction) =
  check(duckdb_register_scalar_function(con, fun.handle), "Failed to register function")

    # proc `wrapperName`(info: duckdb_function_info, chunk: duckdb_data_chunk, output: duckdb_vector) {.cdecl.} =
    #   let
    #     size = newCall("duckdb_data_chunk_get_size"), ident("chunk"))
    #     inputRaw = newCall("duckdb_data_chunk_get_vector"), ident("chunk"), newLit(0))` # AST for function call
    #     inputArray = cast[ptr UncheckedArray[int64]](`nnkCall.newTree(ident("duckdb_vector_get_data"), ident("inputRaw"))`)

    #   var outputArray = cast[ptr UncheckedArray[int64]](`nnkCall.newTree(ident("duckdb_vector_get_data"), ident("output"))`)

    #   for i in 0..<size:
    #     outputArray[i] = `callbackName`(inputArray[i]) # This generates a runtime function call

    # let
    #   size = duckdb_data_chunk_get_size(chunk)
    #   inputRaw = duckdb_data_chunk_get_vector(chunk, 0.idx_t)
    #   inputArray = cast[ptr UncheckedArray[int64]](duckdb_vector_get_data(inputRaw))

    # var outputArray = cast[ptr UncheckedArray[int64]](duckdb_vector_get_data(output))

    # for i in 0..< size:
    #   outputArray[i] = foo(inputArray[i.int])
