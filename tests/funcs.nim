import unittest, linalg

suite "lapack funcs":
  test "matrix-matrix solver":
    let a = matrix(@[
      @[3.0, 1.0],
      @[1.0, -2.0]
    ], 2, 2)
    let b = matrix(@[@[1.0],
                     @[0.0]],
                     2, 1)
    let x = solve(a, b)
    let expected = matrix(@[@[2.0 / 7.0],
                            @[1.0 / 7.0]],
                            2, 1)
    check expected =~ x

  test "singular matrix error":
    let a = matrix(@[
      @[3.0, 3.0],
      @[1.0, 1.0]
    ], 2, 2)
    let b = matrix(@[@[1.0],
                     @[0.0]],
                     2, 1)
    expect FloatingPointError:
      discard solve(a, b)

  test "matrix-matrix solver 32":
    let a = matrix(@[
      @[3'f32, 1'f32],
      @[1'f32, -2'f32]
    ], 2, 2)
    let b = matrix(@[@[1'f32],
                     @[0'f32]],
                     2, 1)
    let x = solve(a, b)
    let expected = matrix(@[@[2'f32 / 7'f32],
                            @[1'f32 / 7'f32]],
                            2, 1)
    check expected =~ x

  test "dynamic matrix-matrix solver":
    let a = matrix(@[
      @[3.0, 1.0],
      @[1.0, -2.0]
    ], 2, 2)
    let b = matrix(@[@[1.0],
                     @[0.0]],
                     2, 1)
    let x = solve(a.toDynamic(), b.toDynamic())
    let expected = matrix(@[@[2.0 / 7.0],
                            @[1.0 / 7.0]],
                            2, 1)
    check expected.toDynamic() =~ x

  test "dynamic singular matrix error":
    let a = matrix(@[
      @[3.0, 3.0],
      @[1.0, 1.0]
    ], 2, 2)
    let b = matrix(@[@[1.0],
                     @[0.0]],
                     2, 1)
    expect FloatingPointError:
      discard solve(a.toDynamic(), b.toDynamic())

  test "dynamic matrix-matrix solver 32":
    let a = matrix(@[
      @[3'f32, 1'f32],
      @[1'f32, -2'f32]
    ], 2, 2)
    let b = matrix(@[@[1'f32],
                     @[0'f32]],
                     2, 1)
    let x = solve(a.toDynamic(), b.toDynamic())
    let expected = matrix(@[@[2'f32 / 7'f32],
                            @[1'f32 / 7'f32]],
                            2, 1)
    check expected.toDynamic() =~ x

  test "matrix-vector solver":
    let a = matrix(@[
      @[3.0, 1.0],
      @[1.0, -2.0]
    ], 2, 2)
    let b = vector([1.0, 0.0])
    let x = solve(a, b)
    let expected = vector([2.0/7.0, 1.0/7.0])
    check expected =~ x

  test "matrix-vector singular matrix error":
    let a = matrix(@[
      @[0.0, 0.0],
      @[0.0, 0.0]
    ], 2, 2)
    let b = vector([1.0, 0.0])
    expect FloatingPointError:
      discard solve(a, b)

  test "matrix-vector correct transpose":
    let a = matrix(@[
      @[3.0'f32, 2.0'f32],
      @[1.0'f32, -2.0'f32]
    ], 2, 2)
    let b = matrix(@[
      @[3.0'f32, 1.0],
      @[2.0'f32, -2.0]
    ], 2, 2)
    let c = vector([1.0'f32, 0.0'f32])
    let x = solve(a, c)
    let y = solve(b.t, c)
    check y =~ x

  test "matrix-vector solver 32":
    let a = matrix(@[
      @[3.0'f32, 1.0'f32],
      @[1.0'f32, -2.0'f32]
    ], 2, 2)
    let b = vector([1.0'f32, 0.0'f32])
    let x = solve(a, b)
    let expected = vector([2.0'f32/7.0'f32, 1.0'f32/7.0'f32])
    check expected =~ x

  test "dynamic matrix-vector solver":
    let a = matrix(@[
      @[3.0, 1.0],
      @[1.0, -2.0]
    ], 2, 2)
    let b = vector([1.0, 0.0])
    let x = solve(a.toDynamic(), b.toDynamic())
    let expected = vector([2.0/7.0, 1.0/7.0])
    check expected.toDynamic() =~ x

  test "dynamic matrix-vector singular matrix error":
    let a = matrix(@[
      @[0.0, 0.0],
      @[0.0, 0.0]
    ], 2, 2)
    let b = vector([1.0, 0.0])
    expect FloatingPointError:
      discard solve(a.toDynamic(), b.toDynamic())

  test "dynamic matrix-vector correct transpose":
    let a = matrix(@[
      @[3.0'f32, 2.0'f32],
      @[1.0'f32, -2.0'f32]
    ], 2, 2)
    let b = matrix(@[
      @[3.0'f32, 1.0],
      @[2.0'f32, -2.0]
    ], 2, 2)
    let c = vector([1.0'f32, 0.0'f32])
    let x = solve(a.toDynamic(), c.toDynamic())
    let y = solve(b.toDynamic().t, c.toDynamic())
    check y =~ x

  test "dynamic matrix-vector solver 32":
    let a = matrix(@[
      @[3.0'f32, 1.0'f32],
      @[1.0'f32, -2.0'f32]
    ], 2, 2)
    let b = vector([1.0'f32, 0.0'f32])
    let x = solve(a.toDynamic(), b.toDynamic())
    let expected = vector([2.0'f32/7.0'f32, 1.0'f32/7.0'f32])
    check expected.toDynamic() =~ x

  test "matrix inverse":
    let a = matrix(@[
      @[4.0, 3.0],
      @[3.0, 2.0]
    ], 2, 2)
    let expected = matrix(@[
      @[-2.0, 3.0],
      @[3.0, -4.0]
    ], 2, 2)
    let ainv = inv(a)
    check expected =~ ainv

  test "matrix inverse 32":
    let a = matrix(@[
      @[4.0'f32, 3.0'f32],
      @[3.0'f32, 2.0'f32]
    ], 2, 2)
    let expected = matrix(@[
      @[-2.0'f32, 3.0'f32],
      @[3.0'f32, -4.0'f32]
    ], 2, 2)
    let ainv = inv(a)
    check expected =~ ainv

  test "dynamic matrix inverse":
    let a = matrix(@[
      @[4.0, 3.0],
      @[3.0, 2.0]
    ], 2, 2)
    let expected = matrix(@[
      @[-2.0, 3.0],
      @[3.0, -4.0]
    ], 2, 2)
    let ainv = inv(a.toDynamic())
    check expected.toDynamic() =~ ainv

  test "dynamic matrix inverse 32":
    let a = matrix(@[
      @[4.0'f32, 3.0'f32],
      @[3.0'f32, 2.0'f32]
    ], 2, 2)
    let expected = matrix(@[
      @[-2.0'f32, 3.0'f32],
      @[3.0'f32, -4.0'f32]
    ], 2, 2)
    let ainv = inv(a.toDynamic())
    check expected.toDynamic() =~ ainv

  test "eigenvalues and eigenvectors 32":
    let
      matrix: Matrix32[3, 3] = 3 * eye(3).to32
      vrealExpected = 3 * ones(3).to32
      vimagExpected = zeros(3).to32
      evExpected = eye(3).to32
    let res = rightEigenvecs(matrix)
    check vrealExpected =~ res.re
    check vimagExpected =~ res.im
    check evExpected =~ res.vecs

  test "eigenvalues and eigenvectors 64":
    let
      matrix: Matrix64[3, 3] = 3 * eye(3)
      vrealExpected = 3 * ones(3)
      vimagExpected = zeros(3)
      evExpected = eye(3)
    let res = rightEigenvecs(matrix)
    check vrealExpected =~ res.re
    check vimagExpected =~ res.im
    check evExpected =~ res.vecs

  test "dynamic eigenvalues and eigenvectors 32":
    let
      matrix: Matrix32[3, 3] = 3 * eye(3).to32
      vrealExpected = 3 * ones(3).to32
      vimagExpected = zeros(3).to32
      evExpected = eye(3).to32
    let res = rightEigenvecs(matrix.toDynamic())
    check vrealExpected.toDynamic() =~ res.re
    check vimagExpected.toDynamic() =~ res.im
    check evExpected.toDynamic() =~ res.vecs

  test "dynamic eigenvalues and eigenvectors 64":
    let
      matrix: Matrix64[3, 3] = 3 * eye(3)
      vrealExpected = 3 * ones(3)
      vimagExpected = zeros(3)
      evExpected = eye(3)
    let res = rightEigenvecs(matrix.toDynamic())
    check vrealExpected.toDynamic() =~ res.re
    check vimagExpected.toDynamic() =~ res.im
    check evExpected.toDynamic() =~ res.vecs
