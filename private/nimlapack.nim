when defined(windows):
  const lapackSuffix = ".dll"
elif defined(macosx):
  const lapackSuffix = ".dylib"
else:
  const lapackSuffix = ".so"

const lapackPrefix = "liblapack"
const lapackName = lapackPrefix & lapackSuffix

proc gees*(jobvs: cstring; sort: cstring; select: proc(ar, ai: ptr cdouble): cint; n: ptr cint; a: ptr cdouble;
           lda: ptr cint; sdim: ptr cint; wr: ptr cdouble; wi: ptr cdouble; vs: ptr cdouble;
           ldvs: ptr cint; work: ptr cdouble; lwork: ptr cint; bwork: ptr cint;
           info: ptr cint): cint {.stdcall, discardable, importc: "dgees_", dynlib: lapackName.}

proc geev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
           wr: ptr cdouble; wi: ptr cdouble; vl: ptr cdouble; ldvl: ptr cint;
           vr: ptr cdouble; ldvr: ptr cint; work: ptr cdouble; lwork: ptr cint;
           info: ptr cint): cint {.stdcall, discardable, importc: "dgeev_", dynlib: lapackName.}

proc gesv*(n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
           b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgesv_", dynlib: lapackName.}

proc gesvd*(jobu: cstring; jobvt: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; s: ptr cdouble; u: ptr cdouble; ldu: ptr cint; vt: ptr cdouble;
            ldvt: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgesvd_", dynlib: lapackName.}

proc ggev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
           b: ptr cdouble; ldb: ptr cint; alphar: ptr cdouble; alphai: ptr cdouble;
           beta: ptr cdouble; vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble;
           ldvr: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dggev_", dynlib: lapackName.}

proc gbsv*(n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr cfloat;
           ldab: ptr cint; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgbsv_", dynlib: lapackName.}

proc gees*(jobvs: cstring; sort: cstring; select: proc(ar, ai: ptr cdouble): cint; n: ptr cint; a: ptr cfloat;
           lda: ptr cint; sdim: ptr cint; wr: ptr cfloat; wi: ptr cfloat; vs: ptr cfloat;
           ldvs: ptr cint; work: ptr cfloat; lwork: ptr cint; bwork: ptr cint;
           info: ptr cint): cint {.stdcall, discardable, importc: "sgees_", dynlib: lapackName.}

proc geev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
           wr: ptr cfloat; wi: ptr cfloat; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat;
           ldvr: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgeev_", dynlib: lapackName.}

proc gesv*(n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
           b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgesv_", dynlib: lapackName.}

proc gesvd*(jobu: cstring; jobvt: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; s: ptr cfloat; u: ptr cfloat; ldu: ptr cint; vt: ptr cfloat;
            ldvt: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgesvd_", dynlib: lapackName.}

proc ggev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
           b: ptr cfloat; ldb: ptr cint; alphar: ptr cfloat; alphai: ptr cfloat;
           beta: ptr cfloat; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint;
           work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sggev_", dynlib: lapackName.}
