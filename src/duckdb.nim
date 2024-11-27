import tables
import macros
import sequtils
import fusion/[matching, astdsl]
import strformat
import types
import api
import scalar_functions

# import
#   /[database, dataframe, vector, query, query_result, scalar_functions]

# ProcDef
#   Sym "doubleMyValue"
#   Empty
#   Empty
#   FormalParams
#     Sym "int"
#     IdentDefs
#       Sym "foo"
#       Sym "string"
#       Empty
#     IdentDefs
#       Sym "val"
#       Sym "bar"
#       Sym "int"
#       Empty
#   Empty
#   Empty
#   Asgn
#     Sym "result"
#     Infix
#       Sym "*"
#       Sym "val"
#       IntLit 2
#   Sym "result"

when isMainModule:
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
      newLetStmt scalarFunc,
        newCall(bindSym"newScalarFunction", newLit scalarFunc.strVal)

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

  proc doubleMyValue(foo: string, val, bar: int, baz: string): int {.scalar, gcsafe.} =
    result = val * 2
