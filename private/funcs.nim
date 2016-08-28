#####TODO: Add template and corresponding procedures for dynamic matrices/vectors

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
template matrixSolve(M, N, a, b: expr, A: typedesc): auto =
  var ipvt: array[M, int32]
  var ipvt_ptr = cast[ptr int32](addr(ipvt))
  var info: cint
  var m: cint = M
  var n: cint = N
  var mptr = addr(m)
  var nptr = addr(n)
  if a.order == colMajor and b.order == colMajor:
    gesv(mptr, nptr, a.fp, mptr, ipvt_ptr, b.fp, mptr, addr(info))
  elif a.order == rowMajor and b.order == rowMajor:
    gesv(mptr, nptr, a.t.fp, mptr, ipvt_ptr, b.t.fp, mptr, addr(info))
  elif a.order == colMajor and b.order == rowMajor:
    gesv(mptr, nptr, a.fp, mptr, ipvt_ptr, b.t.fp, mptr, addr(info))
  else:
    gesv(mptr, nptr, a.t.fp, mptr, ipvt_ptr, b.fp, mptr, addr(info))
  if info > 0:
    raise newException( FloatingPointError, "Left hand matrix is singular or factorization failed")

template matrixVectorSolve(M, a, b: expr, A: typedesc): auto =
  var ipvt: array[M, int32]
  var ipvt_ptr = cast[ptr int32](addr(ipvt))
  var info: cint
  var m: cint = M
  var n: cint = 1
  var mptr = addr(m)
  var nptr = addr(n)
  if a.order == colMajor:
    gesv(mptr, nptr, a.fp, mptr, ipvt_ptr, b.fp, mptr, addr(info))
  else:
    gesv(mptr, nptr, a.t.fp, mptr, ipvt_ptr, b.fp, mptr, addr(info))
  if info > 0:
    raise newException( FloatingPointError, "Left hand matrix is singular or factorization failed")

proc solve*[M, N: static[int]](a: Matrix64[M, M], b: Matrix64[M, N]): Matrix64[M, N] {.inline.} =
  new result.data
  result.order = b.order
  var acopy = a.clone
  copy(M*N, b.fp, 1, result.fp, 1)
  matrixSolve(M, N, acopy, result, float64)

proc solve*[M, N: static[int]](a: Matrix32[M, M], b: Matrix32[M, N]): Matrix32[M, N] {.inline.} =
  new result.data
  result.order = b.order
  var acopy = a.clone
  copy(M*N, b.fp, 1, result.fp, 1)
  matrixSolve(M, N, acopy, result, float32)

proc solve*[M: static[int]](a: Matrix64[M, M], b: Vector64[M]): Vector64[M] {.inline.} =
  new result
  var acopy = a.clone
  copy(M, b.fp, 1, result.fp, 1)
  matrixVectorSolve(M, acopy, result, float64)

proc solve*[M: static[int]](a: Matrix32[M, M], b: Vector32[M]): Vector32[M] {.inline.} =
  new result
  var acopy = a.clone
  copy(M, b.fp, 1, result.fp, 1)
  matrixVectorSolve(M, acopy, result, float32)

proc inv*[M: static[int]](a: Matrix64[M, M]): Matrix64[M, M] {.inline.} =
  result = eye(M.int)
  var acopy = a.clone
  matrixSolve(M, M, acopy, result, float64)

proc inv*[M: static[int]](a: Matrix32[M, M]): Matrix32[M, M] {.inline.} =
  result = eye(M.int, float32)
  var acopy = a.clone
  matrixSolve(M, M, acopy, result, float64)

# Template for info-checking
template handleInfo(info: ptr cint) =
  if info[] > 0:
    raise newException( FloatingPointError, "The operation failed.")

## Eigensolvers (geev)

template eigenSolve(N, a, rvals, ivals, rvecs, lvecs, jobvr, jobvl: untyped, T: typedesc) =
  var
    nval: cint = N
    lworkval: cint = N*34
  let
    n = addr(nval)
    info = cast[ptr cint](alloc0(sizeOf(cint)))
    work: ptr T = cast[ptr T](alloc0(lworkval*sizeOf(T)))
    lwork = addr(lworkval)
  discard geev(jobvr, jobvl, n, a, n, rvals, ivals, rvecs, n, lvecs, n,
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
    # TODO: find a way to compute the optimal
    # work size at compile time. This is a realistic
    # estimate, based on:
    # LWORK = 2*N + MAX(6*N, N*(NB + 1))
    lworkval: cint = N*34
  let
    n = addr(nval)
    info = cast[ptr cint](alloc0(sizeOf(cint)))
    work: ptr T = cast[ptr T](alloc0(lworkval*sizeOf(T)))
    lwork = addr(lworkval)
  discard gegv(jobvr, jobvl, n, a, n, b, n,
               rvals, ivals, beta, rvecs, n,
               lvecs, n, work, lwork, info)
  handleInfo(info)
  dealloc work
  dealloc lwork
  dealloc info

template makeRealGeneralEigenSolversStatic(symMatrix, symVector: untyped; T: typedesc) =
  proc generalEigenvals*[N: static[int]](a, b: symMatrix[N,N], realAlpha: var symVector[N],
                           imaginaryAlpha: var symVector[N], beta: var symVector[N]) {.inline.} =
    var
      aCopy = clone(a)
      bCopy = clone(b)
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
      aCopy = clone(a)
      bCopy = clone(b)
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
      aCopy = clone(a)
      bCopy = clone(b)
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
    generalEigenSolve(cint(a.N), a.fp(), b.fp(),
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
    generalEigenSolve(cint(a.N), a.fp(), b.fp(),
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
    generalEigenSolve(cint(a.N), a.fp(), b.fp(),
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
