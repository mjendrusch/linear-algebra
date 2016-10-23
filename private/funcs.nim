# Linear solvers (gesv)

########################### GESV #################################
#n is number of rows of A and B that are being used
#nrhs is number of columns of matrix B
#a is the matrix to be solved in data vector form (should be column-major)
#lda is number of rows of A
#ipvt is an integer array of size n
#b is the matrix B which gets filled with the X values
#ldb is the number of rows of B
#info is an integer with return OK or not
template matrixSolve(M, N, a, b: untyped, A: typedesc): auto =
  var ipvt_ptr = cast[ptr int32](alloc0(sizeOf(int32) * M))
  var info: cint
  var m: cint = M
  var n: cint = N
  var mptr = addr(m)
  var nptr = addr(n)
  gesv(mptr, nptr, a.fp, mptr, ipvt_ptr, b.fp, mptr, addr(info))
  if info > 0:
    raise newException( FloatingPointError, "Left hand matrix is singular or factorization failed")

template matrixVectorSolve(M, a, b: untyped, A: typedesc): auto =
  var ipvt_ptr = cast[ptr int32](alloc0(sizeOf(int32) * M))
  var info: cint
  var m: cint = M
  var n: cint = 1
  var mptr = addr(m)
  var nptr = addr(n)
  gesv(mptr, nptr, a.fp, mptr, ipvt_ptr, b.fp, mptr, addr(info))
  if info > 0:
    raise newException( FloatingPointError, "Left hand matrix is singular or factorization failed")

proc solve*[M, N: static[int]](a: Matrix64[M, M], b: Matrix64[M, N]): Matrix64[M, N] {.inline.} =
  new result.data
  result.order = b.order
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  copy(M*N, b.fp, 1, result.fp, 1)
  matrixSolve(M, N, acopy, result, float64)

proc solve*[M, N: static[int]](a: Matrix32[M, M], b: Matrix32[M, N]): Matrix32[M, N] {.inline.} =
  new result.data
  result.order = b.order
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  copy(M*N, b.fp, 1, result.fp, 1)
  matrixSolve(M, N, acopy, result, float32)

proc solve*[M: static[int]](a: Matrix64[M, M], b: Vector64[M]): Vector64[M] {.inline.} =
  new result
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  copy(M, b.fp, 1, result.fp, 1)
  matrixVectorSolve(M, acopy, result, float64)

proc solve*[M: static[int]](a: Matrix32[M, M], b: Vector32[M]): Vector32[M] {.inline.} =
  new result
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  copy(M, b.fp, 1, result.fp, 1)
  matrixVectorSolve(M, acopy, result, float32)

proc inv*[M: static[int]](a: Matrix64[M, M]): Matrix64[M, M] {.inline.} =
  result = eye(M.int)
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  matrixSolve(M, M, acopy, result, float64)

proc inv*[M: static[int]](a: Matrix32[M, M]): Matrix32[M, M] {.inline.} =
  result = eye(M.int, float32)
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  matrixSolve(M, M, acopy, result, float64)

# Solvers dynamic
proc solve*(a: DMatrix64, b: DMatrix64): DMatrix64 {.inline.} =
  assert(a.M == b.M)
  newDMatrix(result, b.M, b.N, b.order, float64)
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  copy(b.M*b.N, b.fp, 1, result.fp, 1)
  matrixSolve(cint(b.M), cint(b.N), acopy, result, float64)

proc solve*(a: DMatrix32, b: DMatrix32): DMatrix32 {.inline.} =
  assert(a.M == b.M)
  newDMatrix(result, b.M, b.N, b.order, float32)
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  copy(b.M*b.N, b.fp, 1, result.fp, 1)
  matrixSolve(cint(b.M), cint(b.N), acopy, result, float32)

proc solve*(a: DMatrix64, b: DVector64): DVector64 {.inline.} =
  assert(a.M == b.len)
  result = newSeq[float64](b.len)
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  copy(b.len, b.fp, 1, result.fp, 1)
  matrixVectorSolve(cint(a.M), acopy, result, float64)

proc solve*(a: DMatrix32, b: DVector32): DVector32 {.inline.} =
  assert(a.M == b.len)
  result = newSeq[float32](b.len)
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  copy(b.len, b.fp, 1, result.fp, 1)
  matrixVectorSolve(cint(a.M), acopy, result, float32)

proc inv*(a: DMatrix64): DMatrix64 {.inline.} =
  result = eye(a.M.int)
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  matrixSolve(cint(a.M), cint(a.M), acopy, result, float64)

proc inv*(a: DMatrix32): DMatrix32 {.inline.} =
  result = eye(a.M.int, float32)
  var acopy: type(a)
  if a.order == rowMajor:
    acopy = copyMemTranspose(a.t)
  else:
    acopy = a.clone
  matrixSolve(cint(a.M), cint(a.M), acopy, result, float32)

# Template for info-checking
template handleInfo(info: ptr cint) =
  if info[] > 0:
    raise newException( FloatingPointError, "The operation failed.")

## Eigensolvers (geev)
template eigenSolve(N, a, rvals, ivals, rvecs, lvecs, jobvr, jobvl: untyped; order: OrderType; T: typedesc) =
  var
    nval: cint = N
    lworkval: cint = N*34
  let
    n = addr(nval)
    info = cast[ptr cint](alloc0(sizeOf(cint)))
    work: ptr T = cast[ptr T](alloc0(lworkval*sizeOf(T)))
    lwork = addr(lworkval)
  if order == colMajor:
    geev(jobvr, jobvl, n, a, n, rvals, ivals, rvecs, n, lvecs, n,
         work, lwork, info)
  else:
    geev(jobvl, jobvr, n, a, n, rvals, ivals, lvecs, n, rvecs, n,
         work, lwork, info)
  handleInfo(info)
  dealloc work
  dealloc lwork
  dealloc info

# Assertions for dynamic matrices/vectors
template assertEigen(matrix, re, im: untyped) =
  assert(matrix.N == matrix.M)
  assert(re.len() == matrix.N)
  assert(im.len() == matrix.N)

template assertEigen(matrix, re, im, vecs: untyped) =
  assertEigen(matrix, re, im)
  assert(matrix.N == vecs.N)
  assert(vecs.N == vecs.M)

template assertGeneralEigen(a, b, re, im, beta: untyped) =
  assert(a.N == a.M)
  assert(b.N == b.M)
  assert(a.N == b.N)
  assert(re.len() == a.N)
  assert(im.len() == a.N)
  assert(beta.len() == a.N)

template assertGeneralEigen(a, b, re, im, beta, vecs: untyped) =
  assertGeneralEigen(a, b, re, im, beta)
  assert(a.N == vecs.N)
  assert(vecs.N == vecs.M)

template makeRealEigenSolversStatic(symMatrix, symVector: untyped; T: typedesc) =
  proc eigenvals*[N: static[int]](matrix: symMatrix[N, N], realEigenvalues: var symVector[N],
                           imaginaryEigenvalues: var symVector[N]) {.inline.} =
    eigenSolve(cint(N), matrix.fp(),
               realEigenvalues.fp(),
               imaginaryEigenvalues.fp(),
               cast[ptr T](nil),
               cast[ptr T](nil),
               "N".cstring,
               "N".cstring,
               matrix.order,
               T)

  proc eigenvals*[N: static[int]](matrix: symMatrix[N, N]): tuple[re: symVector[N], im: symVector[N]] =
    new result.re
    new result.im
    eigenvals(matrix, result.re, result.im)

  proc rightEigenvecs*[N: static[int]](matrix: symMatrix[N, N], realEigenvalues: var symVector[N],
                             imaginaryEigenvalues: var symVector[N], rightEigenvectors: var symMatrix[N, N]) =
    eigenSolve(cint(N), matrix.fp(),
               realEigenvalues.fp(),
               imaginaryEigenvalues.fp(),
               rightEigenvectors.fp(),
               cast[ptr T](nil),
               "V".cstring,
               "N".cstring,
               matrix.order,
               T)

  proc rightEigenvecs*[N: static[int]](matrix: symMatrix[N, N]):
    tuple[re: symVector[N], im: symVector[N], vecs: symMatrix[N, N]] =
    new result.re
    new result.im
    newSMatrix(result.vecs, colMajor)
    rightEigenvecs(matrix, result.re, result.im, result.vecs)

  proc leftEigenvecs*[N: static[int]](matrix: symMatrix[N, N], realEigenvalues: var symVector[N],
                             imaginaryEigenvalues: var symVector[N], leftEigenvectors: var symMatrix[N, N]) =
    eigenSolve(cint(N), matrix.fp(),
               realEigenvalues.fp(),
               imaginaryEigenvalues.fp(),
               cast[ptr T](nil),
               leftEigenvectors.fp(),
               "N".cstring,
               "V".cstring,
               matrix.order,
               T)

  proc leftEigenvecs*[N: static[int]](matrix: symMatrix[N, N]):
    tuple[re: symVector[N], im: symVector[N], vecs: symMatrix[N, N]] =
    new result.re
    new result.im
    newSMatrix(result.vecs, colMajor)
    leftEigenvecs(matrix, result.re, result.im, result.vecs)

template makeRealEigenSolversDynamic(symMatrix, symVector: untyped; T: typedesc) =
  proc eigenvals*(matrix: symMatrix, realEigenvalues: var symVector,
                           imaginaryEigenvalues: var symVector) {.inline.} =
    assertEigen(matrix, realEigenvalues, imaginaryEigenvalues)
    eigenSolve(cint(matrix.N), matrix.fp(),
               realEigenvalues.fp(),
               imaginaryEigenvalues.fp(),
               cast[ptr T](nil),
               cast[ptr T](nil),
               "N".cstring,
               "N".cstring,
               matrix.order,
               T)

  proc eigenvals*(matrix: symMatrix): tuple[re: symVector, im: symVector] =
    let N = matrix.N
    result.re = newSeq[T](N)
    result.im = newSeq[T](N)
    eigenvals(matrix, result.re, result.im)

  proc rightEigenvecs*(matrix: symMatrix, realEigenvalues: var symVector,
                             imaginaryEigenvalues: var symVector, rightEigenvectors: var symMatrix) =
    assertEigen(matrix, realEigenvalues, imaginaryEigenvalues, rightEigenvectors)
    eigenSolve(cint(matrix.N), matrix.fp(),
               realEigenvalues.fp(),
               imaginaryEigenvalues.fp(),
               rightEigenvectors.fp(),
               cast[ptr T](nil),
               "V".cstring,
               "N".cstring,
               matrix.order,
               T)

  proc rightEigenvecs*(matrix: symMatrix):
    tuple[re: symVector, im: symVector, vecs: symMatrix] =
    let N = matrix.N
    result.re = newSeq[T](N)
    result.im = newSeq[T](N)
    newDMatrix(result.vecs, N, N, colMajor, T)
    echo result.vecs.M
    echo result.vecs.N
    rightEigenvecs(matrix, result.re, result.im, result.vecs)

  proc leftEigenvecs*(matrix: symMatrix, realEigenvalues: var symVector,
                             imaginaryEigenvalues: var symVector, leftEigenvectors: var symMatrix) =
    assertEigen(matrix, realEigenvalues, imaginaryEigenvalues, leftEigenvectors)
    eigenSolve(cint(matrix.N), matrix.fp(),
               realEigenvalues.fp(),
               imaginaryEigenvalues.fp(),
               cast[ptr T](nil),
               leftEigenvectors.fp(),
               "N".cstring,
               "V".cstring,
               matrix.order,
               T)

  proc leftEigenvecs*(matrix: symMatrix):
    tuple[re: symVector, im: symVector, vecs: symMatrix] =
    let N = matrix.N
    result.re = newSeq[T](N)
    result.im = newSeq[T](N)
    newDMatrix(result.vecs, N, N, colMajor, T)
    leftEigenvecs(matrix, result.re, result.im, result.vecs)

makeRealEigenSolversStatic(Matrix32, Vector32, float32)
makeRealEigenSolversStatic(Matrix64, Vector64, float64)
makeRealEigenSolversDynamic(DMatrix32, DVector32, float32)
makeRealEigenSolversDynamic(DMatrix64, DVector64, float64)

# Generalised eigensolvers (gegv)
template generalEigenSolve(N, a, b, rvals, ivals, beta, rvecs, lvecs, jobvr, jobvl: untyped, T: typedesc) =
  var
    nval: cint = N
    lworkval: cint = N*34
  let
    n = addr(nval)
    info = cast[ptr cint](alloc0(sizeOf(cint)))
    work: ptr T = cast[ptr T](alloc0(lworkval*sizeOf(T)))
    lwork = addr(lworkval)
  discard ggev(jobvr, jobvl, n, a, n, b, n,
               rvals, ivals, beta, lvecs, n,
               rvecs, n, work, lwork, info)
  handleInfo(info)
  dealloc work
  dealloc lwork
  dealloc info

template makeRealGeneralEigenSolversStatic(symMatrix, symVector: untyped; T: typedesc) =
  proc generalEigenvals*[N: static[int]](a, b: symMatrix[N,N], realAlpha: var symVector[N],
                           imaginaryAlpha: var symVector[N], beta: var symVector[N]) {.inline.} =
    var
      aCopy: symMatrix[N, N]
      bCopy: symMatrix[N, N]
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()
    if b.order == rowMajor:
      bCopy = copyMemTranspose(b)
    else:
      bCopy = b.clone()

    generalEigenSolve(cint(N), aCopy.fp(), bCopy.fp(),
               realAlpha.fp(),
               imaginaryAlpha.fp(),
               beta.fp(),
               cast[ptr T](nil),
               cast[ptr T](nil),
               "N".cstring,
               "N".cstring,
               T)

  proc generalEigenvals*[N: static[int]](a, b: symMatrix[N, N]):
    tuple[re, im, beta: symVector[N]] =
    new result.re
    new result.im
    new result.beta
    generalEigenvals(matrix, result.re, result.im, result.beta)

  proc rightEigenvecs*[N: static[int]](a, b: symMatrix[N, N], realAlpha: var symVector[N],
                             imaginaryAlpha: var symVector[N], beta: var symVector[N],
                             rightEigenvectors: var symMatrix[N, N]) =
    var
      aCopy: symMatrix[N, N]
      bCopy: symMatrix[N, N]
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()
    if b.order == rowMajor:
      bCopy = copyMemTranspose(b)
    else:
      bCopy = b.clone()

    generalEigenSolve(cint(N), aCopy.fp(), bCopy.fp(),
               realAlpha.fp(),
               imaginaryAlpha.fp(),
               beta.fp(),
               rightEigenvectors.fp(),
               cast[ptr T](nil),
               "V".cstring,
               "N".cstring,
               T)

  proc rightEigenvecs*[N: static[int]](a, b: symMatrix[N, N]):
    tuple[re: symVector[N], im: symVector[N], beta: symVector[N], vecs: symMatrix[N, N]] =
    new result.re
    new result.im
    new result.beta
    newSMatrix(result.vecs, colMajor)
    rightEigenvecs(matrix, result.re, result.im, result.beta, result.vecs)

  proc leftEigenvecs*[N: static[int]](a, b: symMatrix[N, N], realAlpha: var symVector[N],
                               imaginaryAlpha: var symVector[N], beta: var symVector[N],
                               rightEigenvectors: var symMatrix[N, N]) =
    var
      aCopy: symMatrix[N, N]
      bCopy: symMatrix[N, N]
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()
    if b.order == rowMajor:
      bCopy = copyMemTranspose(b)
    else:
      bCopy = b.clone()

    generalEigenSolve(cint(N), aCopy.fp(), bCopy.fp(),
                      realAlpha.fp(),
                      imaginaryAlpha.fp(),
                      beta.fp(),
                      cast[ptr T](nil),
                      rightEigenvectors.fp(),
                      "N".cstring,
                      "V".cstring,
                      T)

  proc leftEigenvecs*[N: static[int]](a, b: symMatrix[N, N]):
    tuple[re: symVector[N], im: symVector[N], beta: symVector[N], vecs: symMatrix[N, N]] =
    new result.re
    new result.im
    new result.beta
    newSMatrix(result.vecs, colMajor)
    leftEigenvecs(matrix, result.re, result.im, result.beta, result.vecs)

template makeRealGeneralEigenSolversDynamic(symMatrix, symVector: untyped; T: typedesc) =
  proc generalEigenvals*(a, b: symMatrix; realAlpha, imaginaryAlpha, beta: symVector) {.inline.} =
    assertGeneralEigen(a, b, realAlpha, imaginaryAlpha, beta)
    var
      aCopy: symMatrix
      bCopy: symMatrix
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()
    if b.order == rowMajor:
      bCopy = copyMemTranspose(b)
    else:
      bCopy = b.clone()

    generalEigenSolve(cint(aCopy.N), aCopy.fp(), bCopy.fp(),
               realAlpha.fp(),
               imaginaryAlpha.fp(),
               beta.fp(),
               cast[ptr T](nil),
               cast[ptr T](nil),
               "N".cstring,
               "N".cstring,
               T)

  proc generalEigenvals*(a, b: symMatrix): tuple[re, im, beta: symVector] =
    let N = a.N
    result.re = newSeq[T](N)
    result.im = newSeq[T](N)
    result.beta = newSeq[T](N)
    generalEigenvals(a, b, result.re, result.im, result.beta)

  proc rightEigenvecs*(a, b: symMatrix; realAlpha, imaginaryAlpha, beta: var symVector,
                       rightEigenvectors: var symMatrix) =
    assertGeneralEigen(a, b, realAlpha, imaginaryAlpha, beta, rightEigenvectors)
    var
      aCopy: symMatrix
      bCopy: symMatrix
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()
    if b.order == rowMajor:
      bCopy = copyMemTranspose(b)
    else:
      bCopy = b.clone()

    generalEigenSolve(cint(aCopy.N), aCopy.fp(), bCopy.fp(),
               realAlpha.fp(),
               imaginaryAlpha.fp(),
               beta.fp(),
               rightEigenvectors.fp(),
               cast[ptr T](nil),
               "V".cstring,
               "N".cstring,
               T)

  proc rightEigenvecs*(a, b: symMatrix):
    tuple[re, im, beta: symVector, vecs: symMatrix] =
    let N = a.N
    result.re = newSeq[T](N)
    result.im = newSeq[T](N)
    result.beta = newSeq[T](N)
    newDMatrix(result.vecs, N, N, colMajor, T)
    rightEigenvecs(a, b, result.re, result.im, result.beta, result.vecs)

  proc leftEigenvecs*(a, b: symMatrix; realAlpha, imaginaryAlpha, beta: var symVector,
                       leftEigenvectors: var symMatrix) =
    assertGeneralEigen(a, b, realAlpha, imaginaryAlpha, beta, leftEigenvectors)
    var
      aCopy: symMatrix
      bCopy: symMatrix
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()
    if b.order == rowMajor:
      bCopy = copyMemTranspose(b)
    else:
      bCopy = b.clone()

    generalEigenSolve(cint(aCopy.N), aCopy.fp(), bCopy.fp(),
               realAlpha.fp(),
               imaginaryAlpha.fp(),
               beta.fp(),
               cast[ptr T](nil),
               leftEigenvectors.fp(),
               "N".cstring,
               "V".cstring,
               T)

  proc leftEigenvecs*(a, b: symMatrix):
    tuple[re, im, beta: symVector, vecs: symMatrix] =
    let N = a.N
    result.re = newSeq[T](N)
    result.im = newSeq[T](N)
    result.beta = newSeq[T](N)
    newDMatrix(result.vecs, N, N, colMajor, T)
    leftEigenvecs(a, b, result.re, result.im, result.beta, result.vecs)

makeRealGeneralEigenSolversStatic(Matrix32, Vector32, float32)
makeRealGeneralEigenSolversStatic(Matrix64, Vector64, float64)
makeRealGeneralEigenSolversDynamic(DMatrix32, DVector32, float32)
makeRealGeneralEigenSolversDynamic(DMatrix64, DVector64, float64)

template singularDecompose(M, N, a, singVals, u, vTrans, jobU, jobVTrans: untyped; T: typedesc) =
  var
    mVal = M
    nVal = N
  let
    optWork = cast[ptr T](alloc0(sizeOf(T)))
    calcWork = cast[ptr cint](alloc0(sizeOf(cint)))
    m = addr(mVal)
    n = addr(nVal)
    info = cast[ptr cint](alloc0(sizeOf(cint)))
  calcWork[] = -1
  discard gesvd(jobU, jobVTrans, m, n, a, m, singVals, u, m, vTrans, n, optWork, calcWork, info)
  let lWork = cast[ptr cint](alloc0(sizeOf(cint)))
  lWork[] = cint(optWork[])
  let work = cast[ptr T](alloc0(sizeOf(T) * lWork[]))
  discard gesvd(jobU, jobVTrans, m, n, a, m, singVals, u, m, vTrans, n, work, lWork, info)
  handleInfo(info)
  dealloc optWork
  dealloc calcWork
  dealloc info
  dealloc lWork
  dealloc work

template makeSVDStatic(symMatrix, symVector: untyped; T: typedesc) =
  proc singVals[M, N](a: symMatrix[M, N];
                      singularValues: var symVector[min(M, N)]) =
    var
      aCopy: symMatrix[M, N]
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()

    singularDecompose(M, N, aCopy.fp, singularValues.fp,
                      cast[ptr T](nil), cast[ptr T](nil),
                      cstring("N"), cstring("N"), T)

  proc singVals[M, N](a: symMatrix[M, N]): symVector[min(M, N)] =
    singVals(a, result)

  proc leftSVD[M, N](a: symMatrix[M, N];
    singularValues: var symVector[min(M, N)];
    leftVectors: var symMatrix[M, M]) =

    var aCopy: symMatrix[M, N]
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()

    singularDecompose(M, N, aCopy.fp, singularValues.fp,
                      leftVectors.fp, cast[ptr T](nil),
                      cstring("A"), cstring("N"), T)

  proc rightSVD[M, N](a: symMatrix[M, N];
    singularValues: var symVector[min(M, N)];
    rightVectors: var symMatrix[N, N]) =

    var aCopy: symMatrix[M, N]
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()

    singularDecompose(M, N, aCopy.fp, singularValues.fp,
                      cast[ptr T](nil), rightVectors,
                      cstring("N"), cstring("A"), T)

  proc leftSVD[M, N](a: symMatrix[M, N]):
    tuple[vals: symVector[min(M, N)], lVecs: symMatrix[M, M]] {. inline .} =
    new result.vals
    newSMatrix(result.lVecs, colMajor)
    leftSVD(a, result.vals, result.lVecs)

  proc rightSVD[M, N](a: symMatrix[M, N]):
    tuple[vals: symVector[min(M, N)], rVecs: symMatrix[N, N]] {. inline .} =
    new result.vals
    newSMatrix(result.rVecs, colMajor)
    rightSVD(a, result.vals, result.rVecs)

  proc svd[M, N](a: symMatrix[M, N]; singularValues: var symVector[min(M, N)];
    lVecs: var symMatrix[M, M]; rVecs: var symMatrix[N, N]) =

    var aCopy: symMatrix[M, N]
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()

    singularDecompose(M, N, aCopy.fp, singularValues.fp,
                      lVecs, rVecs, cstring("A"), cstring("A"), T)

  proc svd[M, N](a: symMatrix[M, N]):
    tuple[vals: symVector[min(M, N)], lVecs: symMatrix[M, M],
      rVecs: symMatrix[N, N]] {. inline .} =
    new result.vals
    newSMatrix(result.lVecs, colMajor)
    newSMatrix(result.rVecs, colMajor)
    svd(a, result.vals, result.lVecs, result.rVecs)

template makeSVDDynamic(symMatrix, symVector: untyped; T: typedesc) =
  proc singVals(a: symMatrix;
                      singularValues: var symVector) =
    assert(singularValues.len >= min(a.M, a.N))
    var
      aCopy: symMatrix
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()

    singularDecompose(cint(a.M), cint(a.N), aCopy.fp, singularValues.fp,
                      cast[ptr T](nil), cast[ptr T](nil),
                      cstring("N"), cstring("N"), T)

  proc singVals(a: symMatrix): symVector =
    singVals(a, result)

  proc leftSVD(a: symMatrix;
    singularValues: var symVector;
    leftVectors: var symMatrix) =

    assert(singularValues.len >= min(a.M, a.N))
    assert(leftVectors.M == a.M)
    assert(leftVectors.N == a.M)

    var aCopy: symMatrix
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()

    singularDecompose(cint(a.M), cint(a.N), aCopy.fp, singularValues.fp,
                      leftVectors.fp, cast[ptr T](nil),
                      cstring("A"), cstring("N"), T)

  proc rightSVD(a: symMatrix;
    singularValues: var symVector;
    rightVectors: var symMatrix) =

    assert(singularValues.len >= min(a.M, a.N))
    assert(rightVectors.M == a.N)
    assert(rightVectors.N == a.N)

    var aCopy: symMatrix
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()

    singularDecompose(cint(a.M), cint(a.N), aCopy.fp, singularValues.fp,
                      cast[ptr T](nil), rightVectors.fp,
                      cstring("N"), cstring("A"), T)

  proc leftSVD(a: symMatrix):
    tuple[vals: symVector, lVecs: symMatrix] {. inline .} =
    result.vals = newSeq[T](min(a.N, a.M))
    newDMatrix(result.lVecs, a.M, a.M, colMajor, T)
    leftSVD(a, result.vals, result.lVecs)

  proc rightSVD(a: symMatrix):
    tuple[vals: symVector, rVecs: symMatrix] {. inline .} =
    result.vals = newSeq[T](min(a.N, a.M))
    newDMatrix(result.rVecs, a.N, a.N, colMajor, T)
    rightSVD(a, result.vals, result.rVecs)

  proc svd(a: symMatrix; singularValues: var symVector;
    lVecs: var symMatrix; rVecs: var symMatrix) =
    assert(singularValues.len >= min(a.M, a.N))
    assert(lVecs.M == a.M)
    assert(lVecs.N == a.M)
    assert(rVecs.M == a.N)
    assert(rVecs.N == a.N)

    var aCopy: symMatrix
    if a.order == rowMajor:
      aCopy = copyMemTranspose(a)
    else:
      aCopy = a.clone()

    singularDecompose(cint(a.M), cint(a.N), aCopy.fp, singularValues.fp,
                      lVecs.fp, rVecs.fp, cstring("A"), cstring("A"), T)

  proc svd(a: symMatrix):
    tuple[vals: symVector, lVecs: symMatrix, rVecs: symMatrix] {. inline .} =
    result.vals = newSeq[T](min(a.N, a.M))
    newDMatrix(result.lVecs, a.M, a.M, colMajor, T)
    newDMatrix(result.rVecs, a.N, a.N, colMajor, T)
    svd(a, result.vals, result.lVecs, result.rVecs)

makeSVDStatic(Matrix32, Vector32, float32)
makeSVDStatic(Matrix64, Vector64, float64)
makeSVDDynamic(DMatrix32, DVector32, float32)
makeSVDDynamic(DMatrix64, DVector64, float64)
