when defined(windows):
  const lapackSuffix = ".dll"
elif defined(macosx):
  const lapackSuffix = ".dylib"
else:
  const lapackSuffix = ".so"

const lapackPrefix = "liblapack"
const lapackName = lapackPrefix & lapackSuffix

type
  Complex32 = tuple[re: float32, im: float32]
  Complex64 = tuple[re: float64, im: float64]

proc axpy*(n: ptr cint; ca: ptr Complex32; cx: ptr Complex32; incx: ptr cint;
           cy: ptr Complex32; incy: ptr cint): cint {.stdcall, discardable, importc: "caxpy_",
    dynlib: lapackName.}

proc copy*(n: ptr cint; cx: ptr Complex32; incx: ptr cint; cy: ptr Complex32; incy: ptr cint): cint {.
    stdcall, discardable, importc: "ccopy_", dynlib: lapackName.}

proc dotc*(retVal: ptr Complex32; n: ptr cint; cx: ptr Complex32; incx: ptr cint;
           cy: ptr Complex32; incy: ptr cint) {.stdcall, discardable, importc: "cdotc_",
    dynlib: lapackName.}

proc dotu*(retVal: ptr Complex32; n: ptr cint; cx: ptr Complex32; incx: ptr cint;
           cy: ptr Complex32; incy: ptr cint) {.stdcall, discardable, importc: "cdotu_",
    dynlib: lapackName.}

proc gbmv*(trans: cstring; m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
           alpha: ptr Complex32; a: ptr Complex32; lda: ptr cint; x: ptr Complex32;
           incx: ptr cint; beta: ptr Complex32; y: ptr Complex32; incy: ptr cint): cint {.
    stdcall, discardable, importc: "cgbmv_", dynlib: lapackName.}

proc gemm*(transa: cstring; transb: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
           alpha: ptr Complex32; a: ptr Complex32; lda: ptr cint; b: ptr Complex32;
           ldb: ptr cint; beta: ptr Complex32; c: ptr Complex32; ldc: ptr cint): cint {.
    stdcall, discardable, importc: "cgemm_", dynlib: lapackName.}

proc gemv*(trans: cstring; m: ptr cint; n: ptr cint; alpha: ptr Complex32;
           a: ptr Complex32; lda: ptr cint; x: ptr Complex32; incx: ptr cint;
           beta: ptr Complex32; y: ptr Complex32; incy: ptr cint): cint {.stdcall, discardable,
    importc: "cgemv_", dynlib: lapackName.}

proc gerc*(m: ptr cint; n: ptr cint; alpha: ptr Complex32; x: ptr Complex32; incx: ptr cint;
           y: ptr Complex32; incy: ptr cint; a: ptr Complex32; lda: ptr cint): cint {.
    stdcall, discardable, importc: "cgerc_", dynlib: lapackName.}

proc geru*(m: ptr cint; n: ptr cint; alpha: ptr Complex32; x: ptr Complex32; incx: ptr cint;
           y: ptr Complex32; incy: ptr cint; a: ptr Complex32; lda: ptr cint): cint {.
    stdcall, discardable, importc: "cgeru_", dynlib: lapackName.}

proc hbmv*(uplo: cstring; n: ptr cint; k: ptr cint; alpha: ptr Complex32; a: ptr Complex32;
           lda: ptr cint; x: ptr Complex32; incx: ptr cint; beta: ptr Complex32;
           y: ptr Complex32; incy: ptr cint): cint {.stdcall, discardable, importc: "chbmv_",
    dynlib: lapackName.}

proc hemm*(side: cstring; uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr Complex32;
           a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
           beta: ptr Complex32; c: ptr Complex32; ldc: ptr cint): cint {.stdcall, discardable,
    importc: "chemm_", dynlib: lapackName.}

proc hemv*(uplo: cstring; n: ptr cint; alpha: ptr Complex32; a: ptr Complex32;
           lda: ptr cint; x: ptr Complex32; incx: ptr cint; beta: ptr Complex32;
           y: ptr Complex32; incy: ptr cint): cint {.stdcall, discardable, importc: "chemv_",
    dynlib: lapackName.}

proc her*(uplo: cstring; n: ptr cint; alpha: ptr cfloat; x: ptr Complex32; incx: ptr cint;
          a: ptr Complex32; lda: ptr cint): cint {.stdcall, discardable, importc: "cher_",
    dynlib: lapackName.}

proc her2*(uplo: cstring; n: ptr cint; alpha: ptr Complex32; x: ptr Complex32;
           incx: ptr cint; y: ptr Complex32; incy: ptr cint; a: ptr Complex32; lda: ptr cint): cint {.
    stdcall, discardable, importc: "cher2_", dynlib: lapackName.}

proc her2k*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr Complex32;
            a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
            beta: ptr cfloat; c: ptr Complex32; ldc: ptr cint): cint {.stdcall, discardable,
    importc: "cher2k_", dynlib: lapackName.}

proc herk*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr cfloat;
           a: ptr Complex32; lda: ptr cint; beta: ptr cfloat; c: ptr Complex32;
           ldc: ptr cint): cint {.stdcall, discardable, importc: "cherk_", dynlib: lapackName.}

proc hpmv*(uplo: cstring; n: ptr cint; alpha: ptr Complex32; ap: ptr Complex32;
           x: ptr Complex32; incx: ptr cint; beta: ptr Complex32; y: ptr Complex32;
           incy: ptr cint): cint {.stdcall, discardable, importc: "chpmv_", dynlib: lapackName.}

proc hpr*(uplo: cstring; n: ptr cint; alpha: ptr cfloat; x: ptr Complex32; incx: ptr cint;
          ap: ptr Complex32): cint {.stdcall, discardable, importc: "chpr_", dynlib: lapackName.}

proc hpr2*(uplo: cstring; n: ptr cint; alpha: ptr Complex32; x: ptr Complex32;
           incx: ptr cint; y: ptr Complex32; incy: ptr cint; ap: ptr Complex32): cint {.
    stdcall, discardable, importc: "chpr2_", dynlib: lapackName.}

proc rotg*(ca: ptr Complex32; cb: ptr Complex32; c: ptr cfloat; s: ptr Complex32): cint {.
    stdcall, discardable, importc: "crotg_", dynlib: lapackName.}

proc scal*(n: ptr cint; ca: ptr Complex32; cx: ptr Complex32; incx: ptr cint): cint {.
    stdcall, discardable, importc: "cscal_", dynlib: lapackName.}

proc rot*(n: ptr cint; cx: ptr Complex32; incx: ptr cint; cy: ptr Complex32;
           incy: ptr cint; c: ptr cfloat; s: ptr cfloat): cint {.stdcall, discardable,
    importc: "csrot_", dynlib: lapackName.}

proc scal*(n: ptr cint; sa: ptr cfloat; cx: ptr Complex32; incx: ptr cint): cint {.stdcall, discardable,
    importc: "csscal_", dynlib: lapackName.}

proc wap*(n: ptr cint; cx: ptr Complex32; incx: ptr cint; cy: ptr Complex32; incy: ptr cint): cint {.
    stdcall, discardable, importc: "cswap_", dynlib: lapackName.}

proc ymm*(side: cstring; uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr Complex32;
           a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
           beta: ptr Complex32; c: ptr Complex32; ldc: ptr cint): cint {.stdcall, discardable,
    importc: "csymm_", dynlib: lapackName.}

proc yr2k*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr Complex32;
            a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
            beta: ptr Complex32; c: ptr Complex32; ldc: ptr cint): cint {.stdcall, discardable,
    importc: "csyr2k_", dynlib: lapackName.}

proc yrk*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr Complex32;
           a: ptr Complex32; lda: ptr cint; beta: ptr Complex32; c: ptr Complex32;
           ldc: ptr cint): cint {.stdcall, discardable, importc: "csyrk_", dynlib: lapackName.}

proc tbmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; k: ptr cint;
           a: ptr Complex32; lda: ptr cint; x: ptr Complex32; incx: ptr cint): cint {.
    stdcall, discardable, importc: "ctbmv_", dynlib: lapackName.}

proc tbsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; k: ptr cint;
           a: ptr Complex32; lda: ptr cint; x: ptr Complex32; incx: ptr cint): cint {.
    stdcall, discardable, importc: "ctbsv_", dynlib: lapackName.}

proc tpmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; ap: ptr Complex32;
           x: ptr Complex32; incx: ptr cint): cint {.stdcall, discardable, importc: "ctpmv_",
    dynlib: lapackName.}

proc tpsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; ap: ptr Complex32;
           x: ptr Complex32; incx: ptr cint): cint {.stdcall, discardable, importc: "ctpsv_",
    dynlib: lapackName.}

proc trmm*(side: cstring; uplo: cstring; transa: cstring; diag: cstring; m: ptr cint;
           n: ptr cint; alpha: ptr Complex32; a: ptr Complex32; lda: ptr cint;
           b: ptr Complex32; ldb: ptr cint): cint {.stdcall, discardable, importc: "ctrmm_",
    dynlib: lapackName.}

proc trmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; a: ptr Complex32;
           lda: ptr cint; x: ptr Complex32; incx: ptr cint): cint {.stdcall, discardable,
    importc: "ctrmv_", dynlib: lapackName.}

proc trsm*(side: cstring; uplo: cstring; transa: cstring; diag: cstring; m: ptr cint;
           n: ptr cint; alpha: ptr Complex32; a: ptr Complex32; lda: ptr cint;
           b: ptr Complex32; ldb: ptr cint): cint {.stdcall, discardable, importc: "ctrsm_",
    dynlib: lapackName.}

proc trsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; a: ptr Complex32;
           lda: ptr cint; x: ptr Complex32; incx: ptr cint): cint {.stdcall, discardable,
    importc: "ctrsv_", dynlib: lapackName.}
proc asum*(n: ptr cint; dx: ptr cdouble; incx: ptr cint): cdouble {.stdcall, discardable,
    importc: "dasum_", dynlib: lapackName.}

proc axpy*(n: ptr cint; da: ptr cdouble; dx: ptr cdouble; incx: ptr cint; dy: ptr cdouble;
           incy: ptr cint): cint {.stdcall, discardable, importc: "daxpy_", dynlib: lapackName.}
proc cabs1*(z: ptr Complex64): cdouble {.stdcall, discardable, importc: "dcabs1_", dynlib: lapackName.}

proc copy*(n: ptr cint; dx: ptr cdouble; incx: ptr cint; dy: ptr cdouble; incy: ptr cint): cint {.
    stdcall, discardable, importc: "dcopy_", dynlib: lapackName.}
proc dot*(n: ptr cint; dx: ptr cdouble; incx: ptr cint; dy: ptr cdouble; incy: ptr cint): cdouble {.
    stdcall, discardable, importc: "ddot_", dynlib: lapackName.}

proc gbmv*(trans: cstring; m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
           alpha: ptr cdouble; a: ptr cdouble; lda: ptr cint; x: ptr cdouble;
           incx: ptr cint; beta: ptr cdouble; y: ptr cdouble; incy: ptr cint): cint {.
    stdcall, discardable, importc: "dgbmv_", dynlib: lapackName.}

proc gemm*(transa: cstring; transb: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
           alpha: ptr cdouble; a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
           beta: ptr cdouble; c: ptr cdouble; ldc: ptr cint): cint {.stdcall, discardable,
    importc: "dgemm_", dynlib: lapackName.}

proc gemv*(trans: cstring; m: ptr cint; n: ptr cint; alpha: ptr cdouble; a: ptr cdouble;
           lda: ptr cint; x: ptr cdouble; incx: ptr cint; beta: ptr cdouble; y: ptr cdouble;
           incy: ptr cint): cint {.stdcall, discardable, importc: "dgemv_", dynlib: lapackName.}

proc ger*(m: ptr cint; n: ptr cint; alpha: ptr cdouble; x: ptr cdouble; incx: ptr cint;
          y: ptr cdouble; incy: ptr cint; a: ptr cdouble; lda: ptr cint): cint {.stdcall, discardable,
    importc: "dger_", dynlib: lapackName.}
proc nrm2*(n: ptr cint; x: ptr cdouble; incx: ptr cint): cdouble {.stdcall, discardable,
    importc: "dnrm2_", dynlib: lapackName.}

proc rot*(n: ptr cint; dx: ptr cdouble; incx: ptr cint; dy: ptr cdouble; incy: ptr cint;
          c: ptr cdouble; s: ptr cdouble): cint {.stdcall, discardable, importc: "drot_",
    dynlib: lapackName.}

proc rotg*(da: ptr cdouble; db: ptr cdouble; c: ptr cdouble; s: ptr cdouble): cint {.stdcall, discardable,
    importc: "drotg_", dynlib: lapackName.}

proc rotm*(n: ptr cint; dx: ptr cdouble; incx: ptr cint; dy: ptr cdouble; incy: ptr cint;
           dparam: ptr cdouble): cint {.stdcall, discardable, importc: "drotm_", dynlib: lapackName.}

proc rotmg*(dd1: ptr cdouble; dd2: ptr cdouble; dx1: ptr cdouble; dy1: ptr cdouble;
            dparam: ptr cdouble): cint {.stdcall, discardable, importc: "drotmg_", dynlib: lapackName.}

proc bmv*(uplo: cstring; n: ptr cint; k: ptr cint; alpha: ptr cdouble; a: ptr cdouble;
           lda: ptr cint; x: ptr cdouble; incx: ptr cint; beta: ptr cdouble; y: ptr cdouble;
           incy: ptr cint): cint {.stdcall, discardable, importc: "dsbmv_", dynlib: lapackName.}

proc cal*(n: ptr cint; da: ptr cdouble; dx: ptr cdouble; incx: ptr cint): cint {.stdcall, discardable,
    importc: "dscal_", dynlib: lapackName.}
proc dot*(n: ptr cint; sx: ptr cfloat; incx: ptr cint; sy: ptr cfloat; incy: ptr cint): cdouble {.
    stdcall, discardable, importc: "dsdot_", dynlib: lapackName.}

proc pmv*(uplo: cstring; n: ptr cint; alpha: ptr cdouble; ap: ptr cdouble; x: ptr cdouble;
           incx: ptr cint; beta: ptr cdouble; y: ptr cdouble; incy: ptr cint): cint {.
    stdcall, discardable, importc: "dspmv_", dynlib: lapackName.}

proc pr*(uplo: cstring; n: ptr cint; alpha: ptr cdouble; x: ptr cdouble; incx: ptr cint;
          ap: ptr cdouble): cint {.stdcall, discardable, importc: "dspr_", dynlib: lapackName.}

proc pr2*(uplo: cstring; n: ptr cint; alpha: ptr cdouble; x: ptr cdouble; incx: ptr cint;
           y: ptr cdouble; incy: ptr cint; ap: ptr cdouble): cint {.stdcall, discardable,
    importc: "dspr2_", dynlib: lapackName.}

proc wap*(n: ptr cint; dx: ptr cdouble; incx: ptr cint; dy: ptr cdouble; incy: ptr cint): cint {.
    stdcall, discardable, importc: "dswap_", dynlib: lapackName.}

proc ymm*(side: cstring; uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr cdouble;
           a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; beta: ptr cdouble;
           c: ptr cdouble; ldc: ptr cint): cint {.stdcall, discardable, importc: "dsymm_",
    dynlib: lapackName.}

proc ymv*(uplo: cstring; n: ptr cint; alpha: ptr cdouble; a: ptr cdouble; lda: ptr cint;
           x: ptr cdouble; incx: ptr cint; beta: ptr cdouble; y: ptr cdouble; incy: ptr cint): cint {.
    stdcall, discardable, importc: "dsymv_", dynlib: lapackName.}

proc yr*(uplo: cstring; n: ptr cint; alpha: ptr cdouble; x: ptr cdouble; incx: ptr cint;
          a: ptr cdouble; lda: ptr cint): cint {.stdcall, discardable, importc: "dsyr_",
    dynlib: lapackName.}

proc yr2*(uplo: cstring; n: ptr cint; alpha: ptr cdouble; x: ptr cdouble; incx: ptr cint;
           y: ptr cdouble; incy: ptr cint; a: ptr cdouble; lda: ptr cint): cint {.stdcall, discardable,
    importc: "dsyr2_", dynlib: lapackName.}

proc yr2k*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr cdouble;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; beta: ptr cdouble;
            c: ptr cdouble; ldc: ptr cint): cint {.stdcall, discardable, importc: "dsyr2k_",
    dynlib: lapackName.}

proc yrk*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr cdouble;
           a: ptr cdouble; lda: ptr cint; beta: ptr cdouble; c: ptr cdouble; ldc: ptr cint): cint {.
    stdcall, discardable, importc: "dsyrk_", dynlib: lapackName.}

proc tbmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; k: ptr cint;
           a: ptr cdouble; lda: ptr cint; x: ptr cdouble; incx: ptr cint): cint {.stdcall, discardable,
    importc: "dtbmv_", dynlib: lapackName.}

proc tbsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; k: ptr cint;
           a: ptr cdouble; lda: ptr cint; x: ptr cdouble; incx: ptr cint): cint {.stdcall, discardable,
    importc: "dtbsv_", dynlib: lapackName.}

proc tpmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; ap: ptr cdouble;
           x: ptr cdouble; incx: ptr cint): cint {.stdcall, discardable, importc: "dtpmv_",
    dynlib: lapackName.}

proc tpsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; ap: ptr cdouble;
           x: ptr cdouble; incx: ptr cint): cint {.stdcall, discardable, importc: "dtpsv_",
    dynlib: lapackName.}

proc trmm*(side: cstring; uplo: cstring; transa: cstring; diag: cstring; m: ptr cint;
           n: ptr cint; alpha: ptr cdouble; a: ptr cdouble; lda: ptr cint; b: ptr cdouble;
           ldb: ptr cint): cint {.stdcall, discardable, importc: "dtrmm_", dynlib: lapackName.}

proc trmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; a: ptr cdouble;
           lda: ptr cint; x: ptr cdouble; incx: ptr cint): cint {.stdcall, discardable,
    importc: "dtrmv_", dynlib: lapackName.}

proc trsm*(side: cstring; uplo: cstring; transa: cstring; diag: cstring; m: ptr cint;
           n: ptr cint; alpha: ptr cdouble; a: ptr cdouble; lda: ptr cint; b: ptr cdouble;
           ldb: ptr cint): cint {.stdcall, discardable, importc: "dtrsm_", dynlib: lapackName.}

proc trsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; a: ptr cdouble;
           lda: ptr cint; x: ptr cdouble; incx: ptr cint): cint {.stdcall, discardable,
    importc: "dtrsv_", dynlib: lapackName.}
proc asum*(n: ptr cint; zx: ptr Complex64; incx: ptr cint): cdouble {.stdcall, discardable,
    importc: "dzasum_", dynlib: lapackName.}
proc nrm2*(n: ptr cint; x: ptr Complex64; incx: ptr cint): cdouble {.stdcall, discardable,
    importc: "dznrm2_", dynlib: lapackName.}
proc icamax*(n: ptr cint; cx: ptr Complex32; incx: ptr cint): cint {.stdcall, discardable,
    importc: "icamax_", dynlib: lapackName.}
proc idamax*(n: ptr cint; dx: ptr cdouble; incx: ptr cint): cint {.stdcall, discardable,
    importc: "idamax_", dynlib: lapackName.}
proc isamax*(n: ptr cint; sx: ptr cfloat; incx: ptr cint): cint {.stdcall, discardable,
    importc: "isamax_", dynlib: lapackName.}
proc izamax*(n: ptr cint; zx: ptr Complex64; incx: ptr cint): cint {.stdcall, discardable,
    importc: "izamax_", dynlib: lapackName.}
proc lsame*(ca: cstring; cb: cstring): cint {.stdcall, discardable, importc: "lsame_",
    dynlib: lapackName.}
proc asum*(n: ptr cint; sx: ptr cfloat; incx: ptr cint): cdouble {.stdcall, discardable,
    importc: "sasum_", dynlib: lapackName.}

proc axpy*(n: ptr cint; sa: ptr cfloat; sx: ptr cfloat; incx: ptr cint; sy: ptr cfloat;
           incy: ptr cint): cint {.stdcall, discardable, importc: "saxpy_", dynlib: lapackName.}
proc cabs1*(z: ptr Complex32): cdouble {.stdcall, discardable, importc: "scabs1_", dynlib: lapackName.}
proc casum*(n: ptr cint; cx: ptr Complex32; incx: ptr cint): cdouble {.stdcall, discardable,
    importc: "scasum_", dynlib: lapackName.}
proc cnrm2*(n: ptr cint; x: ptr Complex32; incx: ptr cint): cdouble {.stdcall, discardable,
    importc: "scnrm2_", dynlib: lapackName.}

proc copy*(n: ptr cint; sx: ptr cfloat; incx: ptr cint; sy: ptr cfloat; incy: ptr cint): cint {.
    stdcall, discardable, importc: "scopy_", dynlib: lapackName.}
proc sdot*(n: ptr cint; sx: ptr cfloat; incx: ptr cint; sy: ptr cfloat; incy: ptr cint): cdouble {.
    stdcall, discardable, importc: "sdot_", dynlib: lapackName.}
proc dsdot*(n: ptr cint; sb: ptr cfloat; sx: ptr cfloat; incx: ptr cint; sy: ptr cfloat;
            incy: ptr cint): cdouble {.stdcall, discardable, importc: "sdsdot_", dynlib: lapackName.}

proc gbmv*(trans: cstring; m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
           alpha: ptr cfloat; a: ptr cfloat; lda: ptr cint; x: ptr cfloat; incx: ptr cint;
           beta: ptr cfloat; y: ptr cfloat; incy: ptr cint): cint {.stdcall, discardable,
    importc: "sgbmv_", dynlib: lapackName.}

proc gemm*(transa: cstring; transb: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
           alpha: ptr cfloat; a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint;
           beta: ptr cfloat; c: ptr cfloat; ldc: ptr cint): cint {.stdcall, discardable,
    importc: "sgemm_", dynlib: lapackName.}

proc gemv*(trans: cstring; m: ptr cint; n: ptr cint; alpha: ptr cfloat; a: ptr cfloat;
           lda: ptr cint; x: ptr cfloat; incx: ptr cint; beta: ptr cfloat; y: ptr cfloat;
           incy: ptr cint): cint {.stdcall, discardable, importc: "sgemv_", dynlib: lapackName.}

proc ger*(m: ptr cint; n: ptr cint; alpha: ptr cfloat; x: ptr cfloat; incx: ptr cint;
          y: ptr cfloat; incy: ptr cint; a: ptr cfloat; lda: ptr cint): cint {.stdcall, discardable,
    importc: "sger_", dynlib: lapackName.}
proc nrm2*(n: ptr cint; x: ptr cfloat; incx: ptr cint): cdouble {.stdcall, discardable,
    importc: "snrm2_", dynlib: lapackName.}

proc rot*(n: ptr cint; sx: ptr cfloat; incx: ptr cint; sy: ptr cfloat; incy: ptr cint;
          c: ptr cfloat; s: ptr cfloat): cint {.stdcall, discardable, importc: "srot_",
    dynlib: lapackName.}

proc rotg*(sa: ptr cfloat; sb: ptr cfloat; c: ptr cfloat; s: ptr cfloat): cint {.stdcall, discardable,
    importc: "srotg_", dynlib: lapackName.}

proc rotm*(n: ptr cint; sx: ptr cfloat; incx: ptr cint; sy: ptr cfloat; incy: ptr cint;
           sparam: ptr cfloat): cint {.stdcall, discardable, importc: "srotm_", dynlib: lapackName.}

proc rotmg*(sd1: ptr cfloat; sd2: ptr cfloat; sx1: ptr cfloat; sy1: ptr cfloat;
            sparam: ptr cfloat): cint {.stdcall, discardable, importc: "srotmg_", dynlib: lapackName.}

proc sbmv*(uplo: cstring; n: ptr cint; k: ptr cint; alpha: ptr cfloat; a: ptr cfloat;
           lda: ptr cint; x: ptr cfloat; incx: ptr cint; beta: ptr cfloat; y: ptr cfloat;
           incy: ptr cint): cint {.stdcall, discardable, importc: "ssbmv_", dynlib: lapackName.}

proc scal*(n: ptr cint; sa: ptr cfloat; sx: ptr cfloat; incx: ptr cint): cint {.stdcall, discardable,
    importc: "sscal_", dynlib: lapackName.}

proc spmv*(uplo: cstring; n: ptr cint; alpha: ptr cfloat; ap: ptr cfloat; x: ptr cfloat;
           incx: ptr cint; beta: ptr cfloat; y: ptr cfloat; incy: ptr cint): cint {.stdcall, discardable,
    importc: "sspmv_", dynlib: lapackName.}

proc spr*(uplo: cstring; n: ptr cint; alpha: ptr cfloat; x: ptr cfloat; incx: ptr cint;
          ap: ptr cfloat): cint {.stdcall, discardable, importc: "sspr_", dynlib: lapackName.}

proc spr2*(uplo: cstring; n: ptr cint; alpha: ptr cfloat; x: ptr cfloat; incx: ptr cint;
           y: ptr cfloat; incy: ptr cint; ap: ptr cfloat): cint {.stdcall, discardable,
    importc: "sspr2_", dynlib: lapackName.}

proc swap*(n: ptr cint; sx: ptr cfloat; incx: ptr cint; sy: ptr cfloat; incy: ptr cint): cint {.
    stdcall, discardable, importc: "sswap_", dynlib: lapackName.}

proc symm*(side: cstring; uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr cfloat;
           a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; beta: ptr cfloat;
           c: ptr cfloat; ldc: ptr cint): cint {.stdcall, discardable, importc: "ssymm_",
    dynlib: lapackName.}

proc symv*(uplo: cstring; n: ptr cint; alpha: ptr cfloat; a: ptr cfloat; lda: ptr cint;
           x: ptr cfloat; incx: ptr cint; beta: ptr cfloat; y: ptr cfloat; incy: ptr cint): cint {.
    stdcall, discardable, importc: "ssymv_", dynlib: lapackName.}

proc syr*(uplo: cstring; n: ptr cint; alpha: ptr cfloat; x: ptr cfloat; incx: ptr cint;
          a: ptr cfloat; lda: ptr cint): cint {.stdcall, discardable, importc: "ssyr_",
    dynlib: lapackName.}

proc syr2*(uplo: cstring; n: ptr cint; alpha: ptr cfloat; x: ptr cfloat; incx: ptr cint;
           y: ptr cfloat; incy: ptr cint; a: ptr cfloat; lda: ptr cint): cint {.stdcall, discardable,
    importc: "ssyr2_", dynlib: lapackName.}

proc syr2k*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr cfloat;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; beta: ptr cfloat;
            c: ptr cfloat; ldc: ptr cint): cint {.stdcall, discardable, importc: "ssyr2k_",
    dynlib: lapackName.}

proc syrk*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr cfloat;
           a: ptr cfloat; lda: ptr cint; beta: ptr cfloat; c: ptr cfloat; ldc: ptr cint): cint {.
    stdcall, discardable, importc: "ssyrk_", dynlib: lapackName.}

proc tbmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; k: ptr cint;
           a: ptr cfloat; lda: ptr cint; x: ptr cfloat; incx: ptr cint): cint {.stdcall, discardable,
    importc: "stbmv_", dynlib: lapackName.}

proc tbsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; k: ptr cint;
           a: ptr cfloat; lda: ptr cint; x: ptr cfloat; incx: ptr cint): cint {.stdcall, discardable,
    importc: "stbsv_", dynlib: lapackName.}

proc tpmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; ap: ptr cfloat;
           x: ptr cfloat; incx: ptr cint): cint {.stdcall, discardable, importc: "stpmv_",
    dynlib: lapackName.}

proc tpsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; ap: ptr cfloat;
           x: ptr cfloat; incx: ptr cint): cint {.stdcall, discardable, importc: "stpsv_",
    dynlib: lapackName.}

proc trmm*(side: cstring; uplo: cstring; transa: cstring; diag: cstring; m: ptr cint;
           n: ptr cint; alpha: ptr cfloat; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
           ldb: ptr cint): cint {.stdcall, discardable, importc: "strmm_", dynlib: lapackName.}

proc trmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; a: ptr cfloat;
           lda: ptr cint; x: ptr cfloat; incx: ptr cint): cint {.stdcall, discardable,
    importc: "strmv_", dynlib: lapackName.}

proc trsm*(side: cstring; uplo: cstring; transa: cstring; diag: cstring; m: ptr cint;
           n: ptr cint; alpha: ptr cfloat; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
           ldb: ptr cint): cint {.stdcall, discardable, importc: "strsm_", dynlib: lapackName.}

proc trsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; a: ptr cfloat;
           lda: ptr cint; x: ptr cfloat; incx: ptr cint): cint {.stdcall, discardable,
    importc: "strsv_", dynlib: lapackName.}

proc xerbla*(srname: cstring; info: ptr cint): cint {.stdcall, discardable, importc: "xerbla_",
    dynlib: lapackName.}

# proc xerblaArray*(srnameArray: cstring; srnameLen: ptr cint; info: ptr cint;
#                  srnameArrayLen: int16): cint {.stdcall, discardable, importc: "xerbla_array__",
#     dynlib: lapackName.}

proc axpy*(n: ptr cint; za: ptr Complex64; zx: ptr Complex64; incx: ptr cint;
           zy: ptr Complex64; incy: ptr cint): cint {.stdcall, discardable, importc: "zaxpy_",
    dynlib: lapackName.}

proc copy*(n: ptr cint; zx: ptr Complex64; incx: ptr cint; zy: ptr Complex64; incy: ptr cint): cint {.
    stdcall, discardable, importc: "zcopy_", dynlib: lapackName.}

proc dotc*(retVal: ptr Complex64; n: ptr cint; zx: ptr Complex64; incx: ptr cint;
           zy: ptr Complex64; incy: ptr cint) {.stdcall, discardable, importc: "zdotc_",
    dynlib: lapackName.}

proc dotu*(retVal: ptr Complex64; n: ptr cint; zx: ptr Complex64; incx: ptr cint;
           zy: ptr Complex64; incy: ptr cint) {.stdcall, discardable, importc: "zdotu_",
    dynlib: lapackName.}

proc drot*(n: ptr cint; cx: ptr Complex64; incx: ptr cint; cy: ptr Complex64;
           incy: ptr cint; c: ptr cdouble; s: ptr cdouble): cint {.stdcall, discardable,
    importc: "zdrot_", dynlib: lapackName.}

proc dscal*(n: ptr cint; da: ptr cdouble; zx: ptr Complex64; incx: ptr cint): cint {.stdcall, discardable,
    importc: "zdscal_", dynlib: lapackName.}

proc gbmv*(trans: cstring; m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
           alpha: ptr Complex64; a: ptr Complex64; lda: ptr cint; x: ptr Complex64;
           incx: ptr cint; beta: ptr Complex64; y: ptr Complex64; incy: ptr cint): cint {.
    stdcall, discardable, importc: "zgbmv_", dynlib: lapackName.}

proc gemm*(transa: cstring; transb: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
           alpha: ptr Complex64; a: ptr Complex64; lda: ptr cint; b: ptr Complex64;
           ldb: ptr cint; beta: ptr Complex64; c: ptr Complex64; ldc: ptr cint): cint {.
    stdcall, discardable, importc: "zgemm_", dynlib: lapackName.}

proc gemv*(trans: cstring; m: ptr cint; n: ptr cint; alpha: ptr Complex64;
           a: ptr Complex64; lda: ptr cint; x: ptr Complex64; incx: ptr cint;
           beta: ptr Complex64; y: ptr Complex64; incy: ptr cint): cint {.stdcall, discardable,
    importc: "zgemv_", dynlib: lapackName.}

proc gerc*(m: ptr cint; n: ptr cint; alpha: ptr Complex64; x: ptr Complex64; incx: ptr cint;
           y: ptr Complex64; incy: ptr cint; a: ptr Complex64; lda: ptr cint): cint {.
    stdcall, discardable, importc: "zgerc_", dynlib: lapackName.}

proc geru*(m: ptr cint; n: ptr cint; alpha: ptr Complex64; x: ptr Complex64; incx: ptr cint;
           y: ptr Complex64; incy: ptr cint; a: ptr Complex64; lda: ptr cint): cint {.
    stdcall, discardable, importc: "zgeru_", dynlib: lapackName.}

proc hbmv*(uplo: cstring; n: ptr cint; k: ptr cint; alpha: ptr Complex64; a: ptr Complex64;
           lda: ptr cint; x: ptr Complex64; incx: ptr cint; beta: ptr Complex64;
           y: ptr Complex64; incy: ptr cint): cint {.stdcall, discardable, importc: "zhbmv_",
    dynlib: lapackName.}

proc hemm*(side: cstring; uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr Complex64;
           a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
           beta: ptr Complex64; c: ptr Complex64; ldc: ptr cint): cint {.stdcall, discardable,
    importc: "zhemm_", dynlib: lapackName.}

proc hemv*(uplo: cstring; n: ptr cint; alpha: ptr Complex64; a: ptr Complex64;
           lda: ptr cint; x: ptr Complex64; incx: ptr cint; beta: ptr Complex64;
           y: ptr Complex64; incy: ptr cint): cint {.stdcall, discardable, importc: "zhemv_",
    dynlib: lapackName.}

proc her*(uplo: cstring; n: ptr cint; alpha: ptr cdouble; x: ptr Complex64; incx: ptr cint;
          a: ptr Complex64; lda: ptr cint): cint {.stdcall, discardable, importc: "zher_",
    dynlib: lapackName.}

proc her2*(uplo: cstring; n: ptr cint; alpha: ptr Complex64; x: ptr Complex64;
           incx: ptr cint; y: ptr Complex64; incy: ptr cint; a: ptr Complex64; lda: ptr cint): cint {.
    stdcall, discardable, importc: "zher2_", dynlib: lapackName.}

proc her2k*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr Complex64;
            a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
            beta: ptr cdouble; c: ptr Complex64; ldc: ptr cint): cint {.stdcall, discardable,
    importc: "zher2k_", dynlib: lapackName.}

proc herk*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr cdouble;
           a: ptr Complex64; lda: ptr cint; beta: ptr cdouble; c: ptr Complex64;
           ldc: ptr cint): cint {.stdcall, discardable, importc: "zherk_", dynlib: lapackName.}

proc hpmv*(uplo: cstring; n: ptr cint; alpha: ptr Complex64; ap: ptr Complex64;
           x: ptr Complex64; incx: ptr cint; beta: ptr Complex64; y: ptr Complex64;
           incy: ptr cint): cint {.stdcall, discardable, importc: "zhpmv_", dynlib: lapackName.}

proc hpr*(uplo: cstring; n: ptr cint; alpha: ptr cdouble; x: ptr Complex64; incx: ptr cint;
          ap: ptr Complex64): cint {.stdcall, discardable, importc: "zhpr_", dynlib: lapackName.}

proc hpr2*(uplo: cstring; n: ptr cint; alpha: ptr Complex64; x: ptr Complex64;
           incx: ptr cint; y: ptr Complex64; incy: ptr cint; ap: ptr Complex64): cint {.
    stdcall, discardable, importc: "zhpr2_", dynlib: lapackName.}

proc rotg*(ca: ptr Complex64; cb: ptr Complex64; c: ptr cdouble; s: ptr Complex64): cint {.
    stdcall, discardable, importc: "zrotg_", dynlib: lapackName.}

proc scal*(n: ptr cint; za: ptr Complex64; zx: ptr Complex64; incx: ptr cint): cint {.
    stdcall, discardable, importc: "zscal_", dynlib: lapackName.}

proc swap*(n: ptr cint; zx: ptr Complex64; incx: ptr cint; zy: ptr Complex64; incy: ptr cint): cint {.
    stdcall, discardable, importc: "zswap_", dynlib: lapackName.}

proc symm*(side: cstring; uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr Complex64;
           a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
           beta: ptr Complex64; c: ptr Complex64; ldc: ptr cint): cint {.stdcall, discardable,
    importc: "zsymm_", dynlib: lapackName.}

proc syr2k*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr Complex64;
            a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
            beta: ptr Complex64; c: ptr Complex64; ldc: ptr cint): cint {.stdcall, discardable,
    importc: "zsyr2k_", dynlib: lapackName.}

proc syrk*(uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint; alpha: ptr Complex64;
           a: ptr Complex64; lda: ptr cint; beta: ptr Complex64; c: ptr Complex64;
           ldc: ptr cint): cint {.stdcall, discardable, importc: "zsyrk_", dynlib: lapackName.}

proc tbmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; k: ptr cint;
           a: ptr Complex64; lda: ptr cint; x: ptr Complex64; incx: ptr cint): cint {.
    stdcall, discardable, importc: "ztbmv_", dynlib: lapackName.}

proc tbsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; k: ptr cint;
           a: ptr Complex64; lda: ptr cint; x: ptr Complex64; incx: ptr cint): cint {.
    stdcall, discardable, importc: "ztbsv_", dynlib: lapackName.}

proc tpmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; ap: ptr Complex64;
           x: ptr Complex64; incx: ptr cint): cint {.stdcall, discardable, importc: "ztpmv_",
    dynlib: lapackName.}

proc tpsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; ap: ptr Complex64;
           x: ptr Complex64; incx: ptr cint): cint {.stdcall, discardable, importc: "ztpsv_",
    dynlib: lapackName.}

proc trmm*(side: cstring; uplo: cstring; transa: cstring; diag: cstring; m: ptr cint;
           n: ptr cint; alpha: ptr Complex64; a: ptr Complex64; lda: ptr cint;
           b: ptr Complex64; ldb: ptr cint): cint {.stdcall, discardable, importc: "ztrmm_",
    dynlib: lapackName.}

proc trmv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; a: ptr Complex64;
           lda: ptr cint; x: ptr Complex64; incx: ptr cint): cint {.stdcall, discardable,
    importc: "ztrmv_", dynlib: lapackName.}

proc trsm*(side: cstring; uplo: cstring; transa: cstring; diag: cstring; m: ptr cint;
           n: ptr cint; alpha: ptr Complex64; a: ptr Complex64; lda: ptr cint;
           b: ptr Complex64; ldb: ptr cint): cint {.stdcall, discardable, importc: "ztrsm_",
    dynlib: lapackName.}

proc trsv*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; a: ptr Complex64;
           lda: ptr cint; x: ptr Complex64; incx: ptr cint): cint {.stdcall, discardable,
    importc: "ztrsv_", dynlib: lapackName.}

proc bdsqr*(uplo: cstring; n: ptr cint; ncvt: ptr cint; nru: ptr cint; ncc: ptr cint;
            d: ptr cfloat; e: ptr cfloat; vt: ptr Complex32; ldvt: ptr cint;
            u: ptr Complex32; ldu: ptr cint; c: ptr Complex32; ldc: ptr cint;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cbdsqr_",
    dynlib: lapackName.}

proc gbbrd*(vect: cstring; m: ptr cint; n: ptr cint; ncc: ptr cint; kl: ptr cint;
            ku: ptr cint; ab: ptr Complex32; ldab: ptr cint; d: ptr cfloat; e: ptr cfloat;
            q: ptr Complex32; ldq: ptr cint; pt: ptr Complex32; ldpt: ptr cint;
            c: ptr Complex32; ldc: ptr cint; work: ptr Complex32; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgbbrd_", dynlib: lapackName.}

proc gbcon*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; ipiv: ptr cint; anorm: ptr cfloat; rcond: ptr cfloat;
            work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgbcon_", dynlib: lapackName.}

proc gbequ*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; r: ptr cfloat; c: ptr cfloat; rowcnd: ptr cfloat;
            colcnd: ptr cfloat; amax: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgbequ_", dynlib: lapackName.}

proc gbequb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex32;
             ldab: ptr cint; r: ptr cfloat; c: ptr cfloat; rowcnd: ptr cfloat;
             colcnd: ptr cfloat; amax: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgbequb_", dynlib: lapackName.}

proc gbrfs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr Complex32; ldab: ptr cint; afb: ptr Complex32; ldafb: ptr cint;
            ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint; x: ptr Complex32;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat; work: ptr Complex32;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cgbrfs_",
    dynlib: lapackName.}

# proc gbrfsx*(trans: cstring; equed: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#              nrhs: ptr cint; ab: ptr Complex32; ldab: ptr cint; afb: ptr Complex32;
#              ldafb: ptr cint; ipiv: ptr cint; r: ptr cfloat; c: ptr cfloat;
#              b: ptr Complex32; ldb: ptr cint; x: ptr Complex32; ldx: ptr cint;
#              rcond: ptr cfloat; berr: ptr cfloat; nErrBnds: ptr cint;
#              errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat; nparams: ptr cint;
#              params: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
#     stdcall, discardable, importc: "cgbrfsx_", dynlib: lapackName.}

proc gbsv*(n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr Complex32;
           ldab: ptr cint; ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgbsv_", dynlib: lapackName.}

proc gbsvx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
            nrhs: ptr cint; ab: ptr Complex32; ldab: ptr cint; afb: ptr Complex32;
            ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cfloat; c: ptr cfloat;
            b: ptr Complex32; ldb: ptr cint; x: ptr Complex32; ldx: ptr cint;
            rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat; work: ptr Complex32;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cgbsvx_",
    dynlib: lapackName.}

# proc gbsvxx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#              nrhs: ptr cint; ab: ptr Complex32; ldab: ptr cint; afb: ptr Complex32;
#              ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cfloat; c: ptr cfloat;
#              b: ptr Complex32; ldb: ptr cint; x: ptr Complex32; ldx: ptr cint;
#              rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat; nErrBnds: ptr cint;
#              errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat; nparams: ptr cint;
#              params: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
#     stdcall, discardable, importc: "cgbsvxx_", dynlib: lapackName.}

proc gbtf2*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgbtf2_", dynlib: lapackName.}

proc gbtrf*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgbtrf_", dynlib: lapackName.}

proc gbtrs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr Complex32; ldab: ptr cint; ipiv: ptr cint; b: ptr Complex32;
            ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cgbtrs_",
    dynlib: lapackName.}

proc gebak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            scale: ptr cfloat; m: ptr cint; v: ptr Complex32; ldv: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgebak_", dynlib: lapackName.}

proc gebal*(job: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgebal_", dynlib: lapackName.}

proc gebd2*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; d: ptr cfloat;
            e: ptr cfloat; tauq: ptr Complex32; taup: ptr Complex32; work: ptr Complex32;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgebd2_", dynlib: lapackName.}

proc gebrd*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; d: ptr cfloat;
            e: ptr cfloat; tauq: ptr Complex32; taup: ptr Complex32; work: ptr Complex32;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cgebrd_",
    dynlib: lapackName.}

proc gecon*(norm: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgecon_", dynlib: lapackName.}

proc geequ*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; r: ptr cfloat;
            c: ptr cfloat; rowcnd: ptr cfloat; colcnd: ptr cfloat; amax: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgeequ_", dynlib: lapackName.}

proc geequb*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; r: ptr cfloat;
             c: ptr cfloat; rowcnd: ptr cfloat; colcnd: ptr cfloat; amax: ptr cfloat;
             info: ptr cint): cint {.stdcall, discardable, importc: "cgeequb_", dynlib: lapackName.}

proc gees*(jobvs: cstring; sort: cstring; select: proc(ar, ai: ptr cdouble): cint; n: ptr cint; a: ptr Complex32;
           lda: ptr cint; sdim: ptr cint; w: ptr Complex32; vs: ptr Complex32;
           ldvs: ptr cint; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
           bwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cgees_",
    dynlib: lapackName.}

proc geesx*(jobvs: cstring; sort: cstring; select: proc(ar, ai: ptr cdouble): cint; sense: cstring; n: ptr cint;
            a: ptr Complex32; lda: ptr cint; sdim: ptr cint; w: ptr Complex32;
            vs: ptr Complex32; ldvs: ptr cint; rconde: ptr cfloat; rcondv: ptr cfloat;
            work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat; bwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgeesx_", dynlib: lapackName.}

proc geev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
           w: ptr Complex32; vl: ptr Complex32; ldvl: ptr cint; vr: ptr Complex32;
           ldvr: ptr cint; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
           info: ptr cint): cint {.stdcall, discardable, importc: "cgeev_", dynlib: lapackName.}

proc geevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr Complex32; lda: ptr cint; w: ptr Complex32;
            vl: ptr Complex32; ldvl: ptr cint; vr: ptr Complex32; ldvr: ptr cint;
            ilo: ptr cint; ihi: ptr cint; scale: ptr cfloat; abnrm: ptr cfloat;
            rconde: ptr cfloat; rcondv: ptr cfloat; work: ptr Complex32; lwork: ptr cint;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cgeevx_",
    dynlib: lapackName.}

proc gegs*(jobvsl: cstring; jobvsr: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
           b: ptr Complex32; ldb: ptr cint; alpha: ptr Complex32; beta: ptr Complex32;
           vsl: ptr Complex32; ldvsl: ptr cint; vsr: ptr Complex32; ldvsr: ptr cint;
           work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgegs_", dynlib: lapackName.}

proc gegv*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
           b: ptr Complex32; ldb: ptr cint; alpha: ptr Complex32; beta: ptr Complex32;
           vl: ptr Complex32; ldvl: ptr cint; vr: ptr Complex32; ldvr: ptr cint;
           work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgegv_", dynlib: lapackName.}

proc gehd2*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgehd2_", dynlib: lapackName.}

proc gehrd*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgehrd_", dynlib: lapackName.}

proc gelq2*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "cgelq2_",
    dynlib: lapackName.}

proc gelqf*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgelqf_", dynlib: lapackName.}

proc gels*(trans: cstring; m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
           lda: ptr cint; b: ptr Complex32; ldb: ptr cint; work: ptr Complex32;
           lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cgels_",
    dynlib: lapackName.}

proc gelsd*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; s: ptr cfloat; rcond: ptr cfloat;
            rank: ptr cint; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cgelsd_",
    dynlib: lapackName.}

proc gelss*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; s: ptr cfloat; rcond: ptr cfloat;
            rank: ptr cint; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgelss_", dynlib: lapackName.}

proc gelsx*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; jpvt: ptr cint; rcond: ptr cfloat;
            rank: ptr cint; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgelsx_", dynlib: lapackName.}

proc gelsy*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; jpvt: ptr cint; rcond: ptr cfloat;
            rank: ptr cint; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgelsy_", dynlib: lapackName.}

proc geql2*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "cgeql2_",
    dynlib: lapackName.}

proc geqlf*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgeqlf_", dynlib: lapackName.}

proc geqp3*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; jpvt: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgeqp3_", dynlib: lapackName.}

proc geqpf*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; jpvt: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgeqpf_", dynlib: lapackName.}

proc geqr2*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "cgeqr2_",
    dynlib: lapackName.}

proc geqrf*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgeqrf_", dynlib: lapackName.}

proc gerfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint; b: ptr Complex32;
            ldb: ptr cint; x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgerfs_", dynlib: lapackName.}

# proc gerfsx*(trans: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint;
#              a: ptr Complex32; lda: ptr cint; af: ptr Complex32; ldaf: ptr cint;
#              ipiv: ptr cint; r: ptr cfloat; c: ptr cfloat; b: ptr Complex32; ldb: ptr cint;
#              x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat; berr: ptr cfloat;
#              nErrBnds: ptr cint; errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat;
#              nparams: ptr cint; params: ptr cfloat; work: ptr Complex32;
#              rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cgerfsx_",
#     dynlib: lapackName.}

proc gerq2*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "cgerq2_",
    dynlib: lapackName.}

proc gerqf*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgerqf_", dynlib: lapackName.}

proc gesc2*(n: ptr cint; a: ptr Complex32; lda: ptr cint; rhs: ptr Complex32;
            ipiv: ptr cint; jpiv: ptr cint; scale: ptr cfloat): cint {.stdcall, discardable,
    importc: "cgesc2_", dynlib: lapackName.}

proc gesdd*(jobz: cstring; m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            s: ptr cfloat; u: ptr Complex32; ldu: ptr cint; vt: ptr Complex32;
            ldvt: ptr cint; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cgesdd_",
    dynlib: lapackName.}

proc gesv*(n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
           b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgesv_", dynlib: lapackName.}

proc gesvd*(jobu: cstring; jobvt: cstring; m: ptr cint; n: ptr cint; a: ptr Complex32;
            lda: ptr cint; s: ptr cfloat; u: ptr Complex32; ldu: ptr cint;
            vt: ptr Complex32; ldvt: ptr cint; work: ptr Complex32; lwork: ptr cint;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cgesvd_",
    dynlib: lapackName.}

proc gesvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
            lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
            equed: cstring; r: ptr cfloat; c: ptr cfloat; b: ptr Complex32; ldb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgesvx_", dynlib: lapackName.}

# proc gesvxx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
#              lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
#              equed: cstring; r: ptr cfloat; c: ptr cfloat; b: ptr Complex32; ldb: ptr cint;
#              x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat; rpvgrw: ptr cfloat;
#              berr: ptr cfloat; nErrBnds: ptr cint; errBndsNorm: ptr cfloat;
#              errBndsComp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
#              work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
#     importc: "cgesvxx_", dynlib: lapackName.}

proc getc2*(n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint; jpiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgetc2_", dynlib: lapackName.}

proc getf2*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgetf2_", dynlib: lapackName.}

proc getrf*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgetrf_", dynlib: lapackName.}

proc getri*(n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgetri_", dynlib: lapackName.}

proc getrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgetrs_", dynlib: lapackName.}

proc ggbak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cfloat; rscale: ptr cfloat; m: ptr cint; v: ptr Complex32;
            ldv: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cggbak_",
    dynlib: lapackName.}

proc ggbal*(job: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; b: ptr Complex32;
            ldb: ptr cint; ilo: ptr cint; ihi: ptr cint; lscale: ptr cfloat;
            rscale: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "cggbal_", dynlib: lapackName.}

proc gges*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: proc(ar, ai: ptr cdouble): cint; n: ptr cint;
           a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint; sdim: ptr cint;
           alpha: ptr Complex32; beta: ptr Complex32; vsl: ptr Complex32;
           ldvsl: ptr cint; vsr: ptr Complex32; ldvsr: ptr cint; work: ptr Complex32;
           lwork: ptr cint; rwork: ptr cfloat; bwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgges_", dynlib: lapackName.}

proc ggesx*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: proc(ar, ai: ptr cdouble): cint;
            sense: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; b: ptr Complex32;
            ldb: ptr cint; sdim: ptr cint; alpha: ptr Complex32; beta: ptr Complex32;
            vsl: ptr Complex32; ldvsl: ptr cint; vsr: ptr Complex32; ldvsr: ptr cint;
            rconde: ptr cfloat; rcondv: ptr cfloat; work: ptr Complex32; lwork: ptr cint;
            rwork: ptr cfloat; iwork: ptr cint; liwork: ptr cint; bwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cggesx_", dynlib: lapackName.}

proc ggev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
           b: ptr Complex32; ldb: ptr cint; alpha: ptr Complex32; beta: ptr Complex32;
           vl: ptr Complex32; ldvl: ptr cint; vr: ptr Complex32; ldvr: ptr cint;
           work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cggev_", dynlib: lapackName.}

proc ggevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
            alpha: ptr Complex32; beta: ptr Complex32; vl: ptr Complex32; ldvl: ptr cint;
            vr: ptr Complex32; ldvr: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cfloat; rscale: ptr cfloat; abnrm: ptr cfloat; bbnrm: ptr cfloat;
            rconde: ptr cfloat; rcondv: ptr cfloat; work: ptr Complex32; lwork: ptr cint;
            rwork: ptr cfloat; iwork: ptr cint; bwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cggevx_", dynlib: lapackName.}

proc ggglm*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; d: ptr Complex32; x: ptr Complex32;
            y: ptr Complex32; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cggglm_", dynlib: lapackName.}

proc gghrd*(compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
            q: ptr Complex32; ldq: ptr cint; z: ptr Complex32; ldz: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgghrd_", dynlib: lapackName.}

proc gglse*(m: ptr cint; n: ptr cint; p: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; c: ptr Complex32; d: ptr Complex32;
            x: ptr Complex32; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgglse_", dynlib: lapackName.}

proc ggqrf*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr Complex32; lda: ptr cint;
            taua: ptr Complex32; b: ptr Complex32; ldb: ptr cint; taub: ptr Complex32;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cggqrf_", dynlib: lapackName.}

proc ggrqf*(m: ptr cint; p: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            taua: ptr Complex32; b: ptr Complex32; ldb: ptr cint; taub: ptr Complex32;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cggrqf_", dynlib: lapackName.}

proc ggsvd*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; n: ptr cint;
            p: ptr cint; k: ptr cint; l: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; alpha: ptr cfloat; beta: ptr cfloat;
            u: ptr Complex32; ldu: ptr cint; v: ptr Complex32; ldv: ptr cint;
            q: ptr Complex32; ldq: ptr cint; work: ptr Complex32; rwork: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cggsvd_",
    dynlib: lapackName.}

proc ggsvp*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
            tola: ptr cfloat; tolb: ptr cfloat; k: ptr cint; l: ptr cint; u: ptr Complex32;
            ldu: ptr cint; v: ptr Complex32; ldv: ptr cint; q: ptr Complex32; ldq: ptr cint;
            iwork: ptr cint; rwork: ptr cfloat; tau: ptr Complex32; work: ptr Complex32;
            info: ptr cint): cint {.stdcall, discardable, importc: "cggsvp_", dynlib: lapackName.}

proc gtcon*(norm: cstring; n: ptr cint; dl: ptr Complex32; d: ptr Complex32;
            du: ptr Complex32; du2: ptr Complex32; ipiv: ptr cint; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgtcon_", dynlib: lapackName.}

proc gtrfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr Complex32;
            d: ptr Complex32; du: ptr Complex32; dlf: ptr Complex32; df: ptr Complex32;
            duf: ptr Complex32; du2: ptr Complex32; ipiv: ptr cint; b: ptr Complex32;
            ldb: ptr cint; x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgtrfs_", dynlib: lapackName.}

proc gtsv*(n: ptr cint; nrhs: ptr cint; dl: ptr Complex32; d: ptr Complex32;
           du: ptr Complex32; b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cgtsv_", dynlib: lapackName.}

proc gtsvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr Complex32;
            d: ptr Complex32; du: ptr Complex32; dlf: ptr Complex32; df: ptr Complex32;
            duf: ptr Complex32; du2: ptr Complex32; ipiv: ptr cint; b: ptr Complex32;
            ldb: ptr cint; x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "cgtsvx_", dynlib: lapackName.}

proc gttrf*(n: ptr cint; dl: ptr Complex32; d: ptr Complex32; du: ptr Complex32;
            du2: ptr Complex32; ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgttrf_", dynlib: lapackName.}

proc gttrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr Complex32;
            d: ptr Complex32; du: ptr Complex32; du2: ptr Complex32; ipiv: ptr cint;
            b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cgttrs_", dynlib: lapackName.}

proc gtts2*(itrans: ptr cint; n: ptr cint; nrhs: ptr cint; dl: ptr Complex32;
            d: ptr Complex32; du: ptr Complex32; du2: ptr Complex32; ipiv: ptr cint;
            b: ptr Complex32; ldb: ptr cint): cint {.stdcall, discardable, importc: "cgtts2_",
    dynlib: lapackName.}

proc hbev*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex32;
           ldab: ptr cint; w: ptr cfloat; z: ptr Complex32; ldz: ptr cint;
           work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "chbev_", dynlib: lapackName.}

proc hbevd*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; w: ptr cfloat; z: ptr Complex32; ldz: ptr cint;
            work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat; lrwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chbevd_", dynlib: lapackName.}

proc hbevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr Complex32; ldab: ptr cint; q: ptr Complex32; ldq: ptr cint;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr Complex32; ldz: ptr cint;
            work: ptr Complex32; rwork: ptr cfloat; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "chbevx_", dynlib: lapackName.}

proc hbgst*(vect: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr Complex32; ldab: ptr cint; bb: ptr Complex32; ldbb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; work: ptr Complex32; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "chbgst_", dynlib: lapackName.}

proc hbgv*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
           ab: ptr Complex32; ldab: ptr cint; bb: ptr Complex32; ldbb: ptr cint;
           w: ptr cfloat; z: ptr Complex32; ldz: ptr cint; work: ptr Complex32;
           rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "chbgv_",
    dynlib: lapackName.}

proc hbgvd*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr Complex32; ldab: ptr cint; bb: ptr Complex32; ldbb: ptr cint;
            w: ptr cfloat; z: ptr Complex32; ldz: ptr cint; work: ptr Complex32;
            lwork: ptr cint; rwork: ptr cfloat; lrwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "chbgvd_",
    dynlib: lapackName.}

proc hbgvx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ka: ptr cint;
            kb: ptr cint; ab: ptr Complex32; ldab: ptr cint; bb: ptr Complex32;
            ldbb: ptr cint; q: ptr Complex32; ldq: ptr cint; vl: ptr cfloat; vu: ptr cfloat;
            il: ptr cint; iu: ptr cint; abstol: ptr cfloat; m: ptr cint; w: ptr cfloat;
            z: ptr Complex32; ldz: ptr cint; work: ptr Complex32; rwork: ptr cfloat;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chbgvx_", dynlib: lapackName.}

proc hbtrd*(vect: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; d: ptr cfloat; e: ptr cfloat; q: ptr Complex32; ldq: ptr cint;
            work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "chbtrd_",
    dynlib: lapackName.}

proc hecon*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "checon_", dynlib: lapackName.}

proc heequb*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; s: ptr cfloat;
             scond: ptr cfloat; amax: ptr cfloat; work: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "cheequb_", dynlib: lapackName.}

proc heev*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
           w: ptr cfloat; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
           info: ptr cint): cint {.stdcall, discardable, importc: "cheev_", dynlib: lapackName.}

proc heevd*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            w: ptr cfloat; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cheevd_", dynlib: lapackName.}

proc heevr*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32;
            lda: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint;
            abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr Complex32; ldz: ptr cint;
            isuppz: ptr cint; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cheevr_", dynlib: lapackName.}

proc heevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32;
            lda: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint;
            abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr Complex32; ldz: ptr cint;
            work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cheevx_",
    dynlib: lapackName.}

proc hegs2*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chegs2_", dynlib: lapackName.}

proc hegst*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chegst_", dynlib: lapackName.}

proc hegv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32;
           lda: ptr cint; b: ptr Complex32; ldb: ptr cint; w: ptr cfloat;
           work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "chegv_", dynlib: lapackName.}

proc hegvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32;
            lda: ptr cint; b: ptr Complex32; ldb: ptr cint; w: ptr cfloat;
            work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat; lrwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chegvd_", dynlib: lapackName.}

proc hegvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr Complex32; ldz: ptr cint;
            work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "chegvx_",
    dynlib: lapackName.}

proc herfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint; b: ptr Complex32;
            ldb: ptr cint; x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cherfs_", dynlib: lapackName.}

# proc herfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
#              lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
#              s: ptr cfloat; b: ptr Complex32; ldb: ptr cint; x: ptr Complex32;
#              ldx: ptr cint; rcond: ptr cfloat; berr: ptr cfloat; nErrBnds: ptr cint;
#              errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat; nparams: ptr cint;
#              params: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
#     stdcall, discardable, importc: "cherfsx_", dynlib: lapackName.}

proc hesv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
           ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint; work: ptr Complex32;
           lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "chesv_",
    dynlib: lapackName.}

proc hesvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
            lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr Complex32; ldb: ptr cint; x: ptr Complex32; ldx: ptr cint;
            rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat; work: ptr Complex32;
            lwork: ptr cint; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "chesvx_", dynlib: lapackName.}

# proc hesvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
#              lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
#              equed: cstring; s: ptr cfloat; b: ptr Complex32; ldb: ptr cint;
#              x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat; rpvgrw: ptr cfloat;
#              berr: ptr cfloat; nErrBnds: ptr cint; errBndsNorm: ptr cfloat;
#              errBndsComp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
#              work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
#     importc: "chesvxx_", dynlib: lapackName.}

proc hetd2*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; d: ptr cfloat;
            e: ptr cfloat; tau: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "chetd2_", dynlib: lapackName.}

proc hetf2*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "chetf2_", dynlib: lapackName.}

proc hetrd*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; d: ptr cfloat;
            e: ptr cfloat; tau: ptr Complex32; work: ptr Complex32; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "chetrd_", dynlib: lapackName.}

proc hetrf*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chetrf_", dynlib: lapackName.}

proc hetri*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "chetri_",
    dynlib: lapackName.}

proc hetrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chetrs_", dynlib: lapackName.}

proc hfrk*(transr: cstring; uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint;
           alpha: ptr cfloat; a: ptr Complex32; lda: ptr cint; beta: ptr cfloat;
           c: ptr Complex32): cint {.stdcall, discardable, importc: "chfrk_", dynlib: lapackName.}

proc hgeqz*(job: cstring; compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr Complex32; ldh: ptr cint; t: ptr Complex32; ldt: ptr cint;
            alpha: ptr Complex32; beta: ptr Complex32; q: ptr Complex32; ldq: ptr cint;
            z: ptr Complex32; ldz: ptr cint; work: ptr Complex32; lwork: ptr cint;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "chgeqz_",
    dynlib: lapackName.}

# proc hlaTranstype*(retVal: cstring; retValLen: int16; trans: ptr cint) {.stdcall, discardable,
#     importc: "chla_transtype__", dynlib: lapackName.}

proc hpcon*(uplo: cstring; n: ptr cint; ap: ptr Complex32; ipiv: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "chpcon_", dynlib: lapackName.}

proc hpev*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex32; w: ptr cfloat;
           z: ptr Complex32; ldz: ptr cint; work: ptr Complex32; rwork: ptr cfloat;
           info: ptr cint): cint {.stdcall, discardable, importc: "chpev_", dynlib: lapackName.}

proc hpevd*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex32; w: ptr cfloat;
            z: ptr Complex32; ldz: ptr cint; work: ptr Complex32; lwork: ptr cint;
            rwork: ptr cfloat; lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "chpevd_", dynlib: lapackName.}

proc hpevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex32;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr Complex32; ldz: ptr cint;
            work: ptr Complex32; rwork: ptr cfloat; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "chpevx_", dynlib: lapackName.}

proc hpgst*(itype: ptr cint; uplo: cstring; n: ptr cint; ap: ptr Complex32;
            bp: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "chpgst_",
    dynlib: lapackName.}

proc hpgv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex32;
           bp: ptr Complex32; w: ptr cfloat; z: ptr Complex32; ldz: ptr cint;
           work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "chpgv_", dynlib: lapackName.}

proc hpgvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex32;
            bp: ptr Complex32; w: ptr cfloat; z: ptr Complex32; ldz: ptr cint;
            work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat; lrwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chpgvd_", dynlib: lapackName.}

proc hpgvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            ap: ptr Complex32; bp: ptr Complex32; vl: ptr cfloat; vu: ptr cfloat;
            il: ptr cint; iu: ptr cint; abstol: ptr cfloat; m: ptr cint; w: ptr cfloat;
            z: ptr Complex32; ldz: ptr cint; work: ptr Complex32; rwork: ptr cfloat;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chpgvx_", dynlib: lapackName.}

proc hprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32;
            afp: ptr Complex32; ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "chprfs_", dynlib: lapackName.}

proc hpsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32; ipiv: ptr cint;
           b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chpsv_", dynlib: lapackName.}

proc hpsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32;
            afp: ptr Complex32; ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "chpsvx_", dynlib: lapackName.}

proc hptrd*(uplo: cstring; n: ptr cint; ap: ptr Complex32; d: ptr cfloat; e: ptr cfloat;
            tau: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "chptrd_",
    dynlib: lapackName.}

proc hptrf*(uplo: cstring; n: ptr cint; ap: ptr Complex32; ipiv: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "chptrf_", dynlib: lapackName.}

proc hptri*(uplo: cstring; n: ptr cint; ap: ptr Complex32; ipiv: ptr cint;
            work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "chptri_",
    dynlib: lapackName.}

proc hptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32; ipiv: ptr cint;
            b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chptrs_", dynlib: lapackName.}

proc hsein*(side: cstring; eigsrc: cstring; initv: cstring; select: ptr cint;
            n: ptr cint; h: ptr Complex32; ldh: ptr cint; w: ptr Complex32;
            vl: ptr Complex32; ldvl: ptr cint; vr: ptr Complex32; ldvr: ptr cint;
            mm: ptr cint; m: ptr cint; work: ptr Complex32; rwork: ptr cfloat;
            ifaill: ptr cint; ifailr: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "chsein_", dynlib: lapackName.}

proc hseqr*(job: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            h: ptr Complex32; ldh: ptr cint; w: ptr Complex32; z: ptr Complex32;
            ldz: ptr cint; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "chseqr_", dynlib: lapackName.}

# proc laGbamv*(trans: ptr cint; m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
#               alpha: ptr cfloat; ab: ptr Complex32; ldab: ptr cint; x: ptr Complex32;
#               incx: ptr cint; beta: ptr cfloat; y: ptr cfloat; incy: ptr cint): cint {.
#     stdcall, discardable, importc: "cla_gbamv__", dynlib: lapackName.}
# proc laGbrcondC*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#                  ab: ptr Complex32; ldab: ptr cint; afb: ptr Complex32; ldafb: ptr cint;
#                  ipiv: ptr cint; c: ptr cfloat; capply: ptr cint; info: ptr cint;
#                  work: ptr Complex32; rwork: ptr cfloat; transLen: int16): cdouble {.
#     stdcall, discardable, importc: "cla_gbrcond_c__", dynlib: lapackName.}
# proc laGbrcondX*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#                  ab: ptr Complex32; ldab: ptr cint; afb: ptr Complex32; ldafb: ptr cint;
#                  ipiv: ptr cint; x: ptr Complex32; info: ptr cint; work: ptr Complex32;
#                  rwork: ptr cfloat; transLen: int16): cdouble {.stdcall, discardable,
#     importc: "cla_gbrcond_x__", dynlib: lapackName.}
#
# proc laGbrfsxExtended*(precType: ptr cint; transType: ptr cint; n: ptr cint;
#                        kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr Complex32;
#                        ldab: ptr cint; afb: ptr Complex32; ldafb: ptr cint;
#                        ipiv: ptr cint; colequ: ptr cint; c: ptr cfloat;
#                        b: ptr Complex32; ldb: ptr cint; y: ptr Complex32; ldy: ptr cint;
#                        berrOut: ptr cfloat; nNorms: ptr cint; errsN: ptr cfloat;
#                        errsC: ptr cfloat; res: ptr Complex32; ayb: ptr cfloat;
#                        dy: ptr Complex32; yTail: ptr Complex32; rcond: ptr cfloat;
#                        ithresh: ptr cint; rthresh: ptr cfloat; dzUb: ptr cfloat;
#                        ignoreCwise: ptr cint; info: ptr cint): cint {.stdcall, discardable,
#     importc: "cla_gbrfsx_extended__", dynlib: lapackName.}
# proc laGbrpvgrw*(n: ptr cint; kl: ptr cint; ku: ptr cint; ncols: ptr cint;
#                  ab: ptr Complex32; ldab: ptr cint; afb: ptr Complex32; ldafb: ptr cint): cdouble {.
#     stdcall, discardable, importc: "cla_gbrpvgrw__", dynlib: lapackName.}
#
# proc laGeamv*(trans: ptr cint; m: ptr cint; n: ptr cint; alpha: ptr cfloat;
#               a: ptr Complex32; lda: ptr cint; x: ptr Complex32; incx: ptr cint;
#               beta: ptr cfloat; y: ptr cfloat; incy: ptr cint): cint {.stdcall, discardable,
#     importc: "cla_geamv__", dynlib: lapackName.}
# proc laGercondC*(trans: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
#                  af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint; c: ptr cfloat;
#                  capply: ptr cint; info: ptr cint; work: ptr Complex32;
#                  rwork: ptr cfloat; transLen: int16): cdouble {.stdcall, discardable,
#     importc: "cla_gercond_c__", dynlib: lapackName.}
# proc laGercondX*(trans: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
#                  af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint; x: ptr Complex32;
#                  info: ptr cint; work: ptr Complex32; rwork: ptr cfloat; transLen: int16): cdouble {.
#     stdcall, discardable, importc: "cla_gercond_x__", dynlib: lapackName.}
#
# proc laGerfsxExtended*(precType: ptr cint; transType: ptr cint; n: ptr cint;
#                        nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
#                        af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
#                        colequ: ptr cint; c: ptr cfloat; b: ptr Complex32;
#                        ldb: ptr cint; y: ptr Complex32; ldy: ptr cint;
#                        berrOut: ptr cfloat; nNorms: ptr cint; errsN: ptr cfloat;
#                        errsC: ptr cfloat; res: ptr Complex32; ayb: ptr cfloat;
#                        dy: ptr Complex32; yTail: ptr Complex32; rcond: ptr cfloat;
#                        ithresh: ptr cint; rthresh: ptr cfloat; dzUb: ptr cfloat;
#                        ignoreCwise: ptr cint; info: ptr cint): cint {.stdcall, discardable,
#     importc: "cla_gerfsx_extended__", dynlib: lapackName.}
#
# proc laHeamv*(uplo: ptr cint; n: ptr cint; alpha: ptr cfloat; a: ptr Complex32;
#               lda: ptr cint; x: ptr Complex32; incx: ptr cint; beta: ptr cfloat;
#               y: ptr cfloat; incy: ptr cint): cint {.stdcall, discardable, importc: "cla_heamv__",
#     dynlib: lapackName.}
# proc laHercondC*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
#                  af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint; c: ptr cfloat;
#                  capply: ptr cint; info: ptr cint; work: ptr Complex32;
#                  rwork: ptr cfloat; uploLen: int16): cdouble {.stdcall, discardable,
#     importc: "cla_hercond_c__", dynlib: lapackName.}
# proc laHercondX*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
#                  af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint; x: ptr Complex32;
#                  info: ptr cint; work: ptr Complex32; rwork: ptr cfloat; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "cla_hercond_x__", dynlib: lapackName.}
#
# proc laHerfsxExtended*(precType: ptr cint; uplo: cstring; n: ptr cint; nrhs: ptr cint;
#                        a: ptr Complex32; lda: ptr cint; af: ptr Complex32;
#                        ldaf: ptr cint; ipiv: ptr cint; colequ: ptr cint;
#                        c: ptr cfloat; b: ptr Complex32; ldb: ptr cint; y: ptr Complex32;
#                        ldy: ptr cint; berrOut: ptr cfloat; nNorms: ptr cint;
#                        errsN: ptr cfloat; errsC: ptr cfloat; res: ptr Complex32;
#                        ayb: ptr cfloat; dy: ptr Complex32; yTail: ptr Complex32;
#                        rcond: ptr cfloat; ithresh: ptr cint; rthresh: ptr cfloat;
#                        dzUb: ptr cfloat; ignoreCwise: ptr cint; info: ptr cint;
#                        uploLen: int16): cint {.stdcall, discardable,
#     importc: "cla_herfsx_extended__", dynlib: lapackName.}
# proc laHerpvgrw*(uplo: cstring; n: ptr cint; info: ptr cint; a: ptr Complex32;
#                  lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
#                  work: ptr cfloat; uploLen: int16): cdouble {.stdcall, discardable,
#     importc: "cla_herpvgrw__", dynlib: lapackName.}
#
# proc laLinBerr*(n: ptr cint; nz: ptr cint; nrhs: ptr cint; res: ptr Complex32;
#                 ayb: ptr cfloat; berr: ptr cfloat): cint {.stdcall, discardable,
#     importc: "cla_lin_berr__", dynlib: lapackName.}
# proc laPorcondC*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
#                  af: ptr Complex32; ldaf: ptr cint; c: ptr cfloat; capply: ptr cint;
#                  info: ptr cint; work: ptr Complex32; rwork: ptr cfloat; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "cla_porcond_c__", dynlib: lapackName.}
# proc laPorcondX*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
#                  af: ptr Complex32; ldaf: ptr cint; x: ptr Complex32; info: ptr cint;
#                  work: ptr Complex32; rwork: ptr cfloat; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "cla_porcond_x__", dynlib: lapackName.}
#
# proc laPorfsxExtended*(precType: ptr cint; uplo: cstring; n: ptr cint; nrhs: ptr cint;
#                        a: ptr Complex32; lda: ptr cint; af: ptr Complex32;
#                        ldaf: ptr cint; colequ: ptr cint; c: ptr cfloat;
#                        b: ptr Complex32; ldb: ptr cint; y: ptr Complex32; ldy: ptr cint;
#                        berrOut: ptr cfloat; nNorms: ptr cint; errsN: ptr cfloat;
#                        errsC: ptr cfloat; res: ptr Complex32; ayb: ptr cfloat;
#                        dy: ptr Complex32; yTail: ptr Complex32; rcond: ptr cfloat;
#                        ithresh: ptr cint; rthresh: ptr cfloat; dzUb: ptr cfloat;
#                        ignoreCwise: ptr cint; info: ptr cint; uploLen: int16): cint {.
#     stdcall, discardable, importc: "cla_porfsx_extended__", dynlib: lapackName.}
# proc laPorpvgrw*(uplo: cstring; ncols: ptr cint; a: ptr Complex32; lda: ptr cint;
#                  af: ptr Complex32; ldaf: ptr cint; work: ptr cfloat; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "cla_porpvgrw__", dynlib: lapackName.}
# proc laRpvgrw*(n: ptr cint; ncols: ptr cint; a: ptr Complex32; lda: ptr cint;
#                af: ptr Complex32; ldaf: ptr cint): cdouble {.stdcall, discardable,
#     importc: "cla_rpvgrw__", dynlib: lapackName.}
#
# proc laSyamv*(uplo: ptr cint; n: ptr cint; alpha: ptr cfloat; a: ptr Complex32;
#               lda: ptr cint; x: ptr Complex32; incx: ptr cint; beta: ptr cfloat;
#               y: ptr cfloat; incy: ptr cint): cint {.stdcall, discardable, importc: "cla_syamv__",
#     dynlib: lapackName.}
# proc laSyrcondC*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
#                  af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint; c: ptr cfloat;
#                  capply: ptr cint; info: ptr cint; work: ptr Complex32;
#                  rwork: ptr cfloat; uploLen: int16): cdouble {.stdcall, discardable,
#     importc: "cla_syrcond_c__", dynlib: lapackName.}
# proc laSyrcondX*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
#                  af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint; x: ptr Complex32;
#                  info: ptr cint; work: ptr Complex32; rwork: ptr cfloat; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "cla_syrcond_x__", dynlib: lapackName.}
#
# proc laSyrfsxExtended*(precType: ptr cint; uplo: cstring; n: ptr cint; nrhs: ptr cint;
#                        a: ptr Complex32; lda: ptr cint; af: ptr Complex32;
#                        ldaf: ptr cint; ipiv: ptr cint; colequ: ptr cint;
#                        c: ptr cfloat; b: ptr Complex32; ldb: ptr cint; y: ptr Complex32;
#                        ldy: ptr cint; berrOut: ptr cfloat; nNorms: ptr cint;
#                        errsN: ptr cfloat; errsC: ptr cfloat; res: ptr Complex32;
#                        ayb: ptr cfloat; dy: ptr Complex32; yTail: ptr Complex32;
#                        rcond: ptr cfloat; ithresh: ptr cint; rthresh: ptr cfloat;
#                        dzUb: ptr cfloat; ignoreCwise: ptr cint; info: ptr cint;
#                        uploLen: int16): cint {.stdcall, discardable,
#     importc: "cla_syrfsx_extended__", dynlib: lapackName.}
# proc laSyrpvgrw*(uplo: cstring; n: ptr cint; info: ptr cint; a: ptr Complex32;
#                  lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
#                  work: ptr cfloat; uploLen: int16): cdouble {.stdcall, discardable,
#     importc: "cla_syrpvgrw__", dynlib: lapackName.}
#
# proc laWwaddw*(n: ptr cint; x: ptr Complex32; y: ptr Complex32; w: ptr Complex32): cint {.
#     stdcall, discardable, importc: "cla_wwaddw__", dynlib: lapackName.}

proc labrd*(m: ptr cint; n: ptr cint; nb: ptr cint; a: ptr Complex32; lda: ptr cint;
            d: ptr cfloat; e: ptr cfloat; tauq: ptr Complex32; taup: ptr Complex32;
            x: ptr Complex32; ldx: ptr cint; y: ptr Complex32; ldy: ptr cint): cint {.
    stdcall, discardable, importc: "clabrd_", dynlib: lapackName.}

proc lacgv*(n: ptr cint; x: ptr Complex32; incx: ptr cint): cint {.stdcall, discardable,
    importc: "clacgv_", dynlib: lapackName.}

proc lacn2*(n: ptr cint; v: ptr Complex32; x: ptr Complex32; est: ptr cfloat;
            kase: ptr cint; isave: ptr cint): cint {.stdcall, discardable, importc: "clacn2_",
    dynlib: lapackName.}

proc lacon*(n: ptr cint; v: ptr Complex32; x: ptr Complex32; est: ptr cfloat; kase: ptr cint): cint {.
    stdcall, discardable, importc: "clacon_", dynlib: lapackName.}

proc lacp2*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint): cint {.stdcall, discardable, importc: "clacp2_",
    dynlib: lapackName.}

proc lacpy*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint): cint {.stdcall, discardable, importc: "clacpy_",
    dynlib: lapackName.}

proc lacrm*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; c: ptr Complex32; ldc: ptr cint; rwork: ptr cfloat): cint {.
    stdcall, discardable, importc: "clacrm_", dynlib: lapackName.}

proc lacrt*(n: ptr cint; cx: ptr Complex32; incx: ptr cint; cy: ptr Complex32;
            incy: ptr cint; c: ptr Complex32; s: ptr Complex32): cint {.stdcall, discardable,
    importc: "clacrt_", dynlib: lapackName.}

proc ladiv*(retVal: ptr Complex32; x: ptr Complex32; y: ptr Complex32) {.stdcall, discardable,
    importc: "cladiv_", dynlib: lapackName.}

proc laed0*(qsiz: ptr cint; n: ptr cint; d: ptr cfloat; e: ptr cfloat; q: ptr Complex32;
            ldq: ptr cint; qstore: ptr Complex32; ldqs: ptr cint; rwork: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "claed0_",
    dynlib: lapackName.}

proc laed7*(n: ptr cint; cutpnt: ptr cint; qsiz: ptr cint; tlvls: ptr cint;
            curlvl: ptr cint; curpbm: ptr cint; d: ptr cfloat; q: ptr Complex32;
            ldq: ptr cint; rho: ptr cfloat; indxq: ptr cint; qstore: ptr cfloat;
            qptr: ptr cint; prmptr: ptr cint; perm: ptr cint; givptr: ptr cint;
            givcol: ptr cint; givnum: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "claed7_",
    dynlib: lapackName.}

proc laed8*(k: ptr cint; n: ptr cint; qsiz: ptr cint; q: ptr Complex32; ldq: ptr cint;
            d: ptr cfloat; rho: ptr cfloat; cutpnt: ptr cint; z: ptr cfloat;
            dlamda: ptr cfloat; q2: ptr Complex32; ldq2: ptr cint; w: ptr cfloat;
            indxp: ptr cint; indx: ptr cint; indxq: ptr cint; perm: ptr cint;
            givptr: ptr cint; givcol: ptr cint; givnum: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "claed8_", dynlib: lapackName.}

proc laein*(rightv: ptr cint; noinit: ptr cint; n: ptr cint; h: ptr Complex32;
            ldh: ptr cint; w: ptr Complex32; v: ptr Complex32; b: ptr Complex32;
            ldb: ptr cint; rwork: ptr cfloat; eps3: ptr cfloat; smlnum: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "claein_", dynlib: lapackName.}

proc laesy*(a: ptr Complex32; b: ptr Complex32; c: ptr Complex32; rt1: ptr Complex32;
            rt2: ptr Complex32; evscal: ptr Complex32; cs1: ptr Complex32;
            sn1: ptr Complex32): cint {.stdcall, discardable, importc: "claesy_", dynlib: lapackName.}

proc laev2*(a: ptr Complex32; b: ptr Complex32; c: ptr Complex32; rt1: ptr cfloat;
            rt2: ptr cfloat; cs1: ptr cfloat; sn1: ptr Complex32): cint {.stdcall, discardable,
    importc: "claev2_", dynlib: lapackName.}

proc lag2z*(m: ptr cint; n: ptr cint; sa: ptr Complex32; ldsa: ptr cint; a: ptr Complex64;
            lda: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "clag2z_",
    dynlib: lapackName.}

proc lags2*(upper: ptr cint; a1: ptr cfloat; a2: ptr Complex32; a3: ptr cfloat;
            b1: ptr cfloat; b2: ptr Complex32; b3: ptr cfloat; csu: ptr cfloat;
            snu: ptr Complex32; csv: ptr cfloat; snv: ptr Complex32; csq: ptr cfloat;
            snq: ptr Complex32): cint {.stdcall, discardable, importc: "clags2_", dynlib: lapackName.}

proc lagtm*(trans: cstring; n: ptr cint; nrhs: ptr cint; alpha: ptr cfloat;
            dl: ptr Complex32; d: ptr Complex32; du: ptr Complex32; x: ptr Complex32;
            ldx: ptr cint; beta: ptr cfloat; b: ptr Complex32; ldb: ptr cint): cint {.
    stdcall, discardable, importc: "clagtm_", dynlib: lapackName.}

proc lahef*(uplo: cstring; n: ptr cint; nb: ptr cint; kb: ptr cint; a: ptr Complex32;
            lda: ptr cint; ipiv: ptr cint; w: ptr Complex32; ldw: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "clahef_", dynlib: lapackName.}

proc lahqr*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr Complex32; ldh: ptr cint; w: ptr Complex32;
            iloz: ptr cint; ihiz: ptr cint; z: ptr Complex32; ldz: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "clahqr_", dynlib: lapackName.}

proc lahr2*(n: ptr cint; k: ptr cint; nb: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; t: ptr Complex32; ldt: ptr cint; y: ptr Complex32;
            ldy: ptr cint): cint {.stdcall, discardable, importc: "clahr2_", dynlib: lapackName.}

proc lahrd*(n: ptr cint; k: ptr cint; nb: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; t: ptr Complex32; ldt: ptr cint; y: ptr Complex32;
            ldy: ptr cint): cint {.stdcall, discardable, importc: "clahrd_", dynlib: lapackName.}

proc laic1*(job: ptr cint; j: ptr cint; x: ptr Complex32; sest: ptr cfloat;
            w: ptr Complex32; gamma: ptr Complex32; sestpr: ptr cfloat; s: ptr Complex32;
            c: ptr Complex32): cint {.stdcall, discardable, importc: "claic1_", dynlib: lapackName.}

proc lals0*(icompq: ptr cint; nl: ptr cint; nr: ptr cint; sqre: ptr cint; nrhs: ptr cint;
            b: ptr Complex32; ldb: ptr cint; bx: ptr Complex32; ldbx: ptr cint;
            perm: ptr cint; givptr: ptr cint; givcol: ptr cint; ldgcol: ptr cint;
            givnum: ptr cfloat; ldgnum: ptr cint; poles: ptr cfloat; difl: ptr cfloat;
            difr: ptr cfloat; z: ptr cfloat; k: ptr cint; c: ptr cfloat; s: ptr cfloat;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "clals0_",
    dynlib: lapackName.}

proc lalsa*(icompq: ptr cint; smlsiz: ptr cint; n: ptr cint; nrhs: ptr cint;
            b: ptr Complex32; ldb: ptr cint; bx: ptr Complex32; ldbx: ptr cint;
            u: ptr cfloat; ldu: ptr cint; vt: ptr cfloat; k: ptr cint; difl: ptr cfloat;
            difr: ptr cfloat; z: ptr cfloat; poles: ptr cfloat; givptr: ptr cint;
            givcol: ptr cint; ldgcol: ptr cint; perm: ptr cint; givnum: ptr cfloat;
            c: ptr cfloat; s: ptr cfloat; rwork: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "clalsa_", dynlib: lapackName.}

proc lalsd*(uplo: cstring; smlsiz: ptr cint; n: ptr cint; nrhs: ptr cint; d: ptr cfloat;
            e: ptr cfloat; b: ptr Complex32; ldb: ptr cint; rcond: ptr cfloat;
            rank: ptr cint; work: ptr Complex32; rwork: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "clalsd_", dynlib: lapackName.}
proc langb*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; work: ptr cfloat): cdouble {.stdcall, discardable, importc: "clangb_",
    dynlib: lapackName.}
proc lange*(norm: cstring; m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            work: ptr cfloat): cdouble {.stdcall, discardable, importc: "clange_", dynlib: lapackName.}
proc langt*(norm: cstring; n: ptr cint; dl: ptr Complex32; d: ptr Complex32;
            du: ptr Complex32): cdouble {.stdcall, discardable, importc: "clangt_",
                                      dynlib: lapackName.}
proc lanhb*(norm: cstring; uplo: cstring; n: ptr cint; k: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; work: ptr cfloat): cdouble {.stdcall, discardable, importc: "clanhb_",
    dynlib: lapackName.}
proc lanhe*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            work: ptr cfloat): cdouble {.stdcall, discardable, importc: "clanhe_", dynlib: lapackName.}
proc lanhf*(norm: cstring; transr: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32;
            work: ptr cfloat): cdouble {.stdcall, discardable, importc: "clanhf_", dynlib: lapackName.}
proc lanhp*(norm: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex32; work: ptr cfloat): cdouble {.
    stdcall, discardable, importc: "clanhp_", dynlib: lapackName.}
proc lanhs*(norm: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; work: ptr cfloat): cdouble {.
    stdcall, discardable, importc: "clanhs_", dynlib: lapackName.}
proc lanht*(norm: cstring; n: ptr cint; d: ptr cfloat; e: ptr Complex32): cdouble {.stdcall, discardable,
    importc: "clanht_", dynlib: lapackName.}
proc lansb*(norm: cstring; uplo: cstring; n: ptr cint; k: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; work: ptr cfloat): cdouble {.stdcall, discardable, importc: "clansb_",
    dynlib: lapackName.}
proc lansp*(norm: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex32; work: ptr cfloat): cdouble {.
    stdcall, discardable, importc: "clansp_", dynlib: lapackName.}
proc lansy*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            work: ptr cfloat): cdouble {.stdcall, discardable, importc: "clansy_", dynlib: lapackName.}
proc lantb*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; k: ptr cint;
            ab: ptr Complex32; ldab: ptr cint; work: ptr cfloat): cdouble {.stdcall, discardable,
    importc: "clantb_", dynlib: lapackName.}
proc lantp*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; ap: ptr Complex32;
            work: ptr cfloat): cdouble {.stdcall, discardable, importc: "clantp_", dynlib: lapackName.}
proc lantr*(norm: cstring; uplo: cstring; diag: cstring; m: ptr cint; n: ptr cint;
            a: ptr Complex32; lda: ptr cint; work: ptr cfloat): cdouble {.stdcall, discardable,
    importc: "clantr_", dynlib: lapackName.}

proc lapll*(n: ptr cint; x: ptr Complex32; incx: ptr cint; y: ptr Complex32; incy: ptr cint;
            ssmin: ptr cfloat): cint {.stdcall, discardable, importc: "clapll_", dynlib: lapackName.}

proc lapmt*(forwrd: ptr cint; m: ptr cint; n: ptr cint; x: ptr Complex32; ldx: ptr cint;
            k: ptr cint): cint {.stdcall, discardable, importc: "clapmt_", dynlib: lapackName.}

proc laqgb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; r: ptr cfloat; c: ptr cfloat; rowcnd: ptr cfloat;
            colcnd: ptr cfloat; amax: ptr cfloat; equed: cstring): cint {.stdcall, discardable,
    importc: "claqgb_", dynlib: lapackName.}

proc laqge*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; r: ptr cfloat;
            c: ptr cfloat; rowcnd: ptr cfloat; colcnd: ptr cfloat; amax: ptr cfloat;
            equed: cstring): cint {.stdcall, discardable, importc: "claqge_", dynlib: lapackName.}

proc laqhb*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex32; ldab: ptr cint;
            s: ptr cfloat; scond: ptr cfloat; amax: ptr cfloat; equed: cstring): cint {.
    stdcall, discardable, importc: "claqhb_", dynlib: lapackName.}

proc laqhe*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; s: ptr cfloat;
            scond: ptr cfloat; amax: ptr cfloat; equed: cstring): cint {.stdcall, discardable,
    importc: "claqhe_", dynlib: lapackName.}

proc laqhp*(uplo: cstring; n: ptr cint; ap: ptr Complex32; s: ptr cfloat;
            scond: ptr cfloat; amax: ptr cfloat; equed: cstring): cint {.stdcall, discardable,
    importc: "claqhp_", dynlib: lapackName.}

proc laqp2*(m: ptr cint; n: ptr cint; offset: ptr cint; a: ptr Complex32; lda: ptr cint;
            jpvt: ptr cint; tau: ptr Complex32; vn1: ptr cfloat; vn2: ptr cfloat;
            work: ptr Complex32): cint {.stdcall, discardable, importc: "claqp2_", dynlib: lapackName.}

proc laqps*(m: ptr cint; n: ptr cint; offset: ptr cint; nb: ptr cint; kb: ptr cint;
            a: ptr Complex32; lda: ptr cint; jpvt: ptr cint; tau: ptr Complex32;
            vn1: ptr cfloat; vn2: ptr cfloat; auxv: ptr Complex32; f: ptr Complex32;
            ldf: ptr cint): cint {.stdcall, discardable, importc: "claqps_", dynlib: lapackName.}

proc laqr0*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr Complex32; ldh: ptr cint; w: ptr Complex32;
            iloz: ptr cint; ihiz: ptr cint; z: ptr Complex32; ldz: ptr cint;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "claqr0_", dynlib: lapackName.}

proc laqr1*(n: ptr cint; h: ptr Complex32; ldh: ptr cint; s1: ptr Complex32;
            s2: ptr Complex32; v: ptr Complex32): cint {.stdcall, discardable, importc: "claqr1_",
    dynlib: lapackName.}

proc laqr2*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ktop: ptr cint;
            kbot: ptr cint; nw: ptr cint; h: ptr Complex32; ldh: ptr cint; iloz: ptr cint;
            ihiz: ptr cint; z: ptr Complex32; ldz: ptr cint; ns: ptr cint; nd: ptr cint;
            sh: ptr Complex32; v: ptr Complex32; ldv: ptr cint; nh: ptr cint;
            t: ptr Complex32; ldt: ptr cint; nv: ptr cint; wv: ptr Complex32;
            ldwv: ptr cint; work: ptr Complex32; lwork: ptr cint): cint {.stdcall, discardable,
    importc: "claqr2_", dynlib: lapackName.}

proc laqr3*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ktop: ptr cint;
            kbot: ptr cint; nw: ptr cint; h: ptr Complex32; ldh: ptr cint; iloz: ptr cint;
            ihiz: ptr cint; z: ptr Complex32; ldz: ptr cint; ns: ptr cint; nd: ptr cint;
            sh: ptr Complex32; v: ptr Complex32; ldv: ptr cint; nh: ptr cint;
            t: ptr Complex32; ldt: ptr cint; nv: ptr cint; wv: ptr Complex32;
            ldwv: ptr cint; work: ptr Complex32; lwork: ptr cint): cint {.stdcall, discardable,
    importc: "claqr3_", dynlib: lapackName.}

proc laqr4*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr Complex32; ldh: ptr cint; w: ptr Complex32;
            iloz: ptr cint; ihiz: ptr cint; z: ptr Complex32; ldz: ptr cint;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "claqr4_", dynlib: lapackName.}

proc laqr5*(wantt: ptr cint; wantz: ptr cint; kacc22: ptr cint; n: ptr cint;
            ktop: ptr cint; kbot: ptr cint; nshfts: ptr cint; s: ptr Complex32;
            h: ptr Complex32; ldh: ptr cint; iloz: ptr cint; ihiz: ptr cint;
            z: ptr Complex32; ldz: ptr cint; v: ptr Complex32; ldv: ptr cint;
            u: ptr Complex32; ldu: ptr cint; nv: ptr cint; wv: ptr Complex32;
            ldwv: ptr cint; nh: ptr cint; wh: ptr Complex32; ldwh: ptr cint): cint {.stdcall, discardable,
    importc: "claqr5_", dynlib: lapackName.}

proc laqsb*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex32; ldab: ptr cint;
            s: ptr cfloat; scond: ptr cfloat; amax: ptr cfloat; equed: cstring): cint {.
    stdcall, discardable, importc: "claqsb_", dynlib: lapackName.}

proc laqsp*(uplo: cstring; n: ptr cint; ap: ptr Complex32; s: ptr cfloat;
            scond: ptr cfloat; amax: ptr cfloat; equed: cstring): cint {.stdcall, discardable,
    importc: "claqsp_", dynlib: lapackName.}

proc laqsy*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; s: ptr cfloat;
            scond: ptr cfloat; amax: ptr cfloat; equed: cstring): cint {.stdcall, discardable,
    importc: "claqsy_", dynlib: lapackName.}

proc lar1v*(n: ptr cint; b1: ptr cint; bn: ptr cint; lambda: ptr cfloat; d: ptr cfloat;
            l: ptr cfloat; ld: ptr cfloat; lld: ptr cfloat; pivmin: ptr cfloat;
            gaptol: ptr cfloat; z: ptr Complex32; wantnc: ptr cint; negcnt: ptr cint;
            ztz: ptr cfloat; mingma: ptr cfloat; r: ptr cint; isuppz: ptr cint;
            nrminv: ptr cfloat; resid: ptr cfloat; rqcorr: ptr cfloat; work: ptr cfloat): cint {.
    stdcall, discardable, importc: "clar1v_", dynlib: lapackName.}

proc lar2v*(n: ptr cint; x: ptr Complex32; y: ptr Complex32; z: ptr Complex32;
            incx: ptr cint; c: ptr cfloat; s: ptr Complex32; incc: ptr cint): cint {.stdcall, discardable,
    importc: "clar2v_", dynlib: lapackName.}

proc larcm*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr Complex32;
            ldb: ptr cint; c: ptr Complex32; ldc: ptr cint; rwork: ptr cfloat): cint {.
    stdcall, discardable, importc: "clarcm_", dynlib: lapackName.}

proc larf*(side: cstring; m: ptr cint; n: ptr cint; v: ptr Complex32; incv: ptr cint;
           tau: ptr Complex32; c: ptr Complex32; ldc: ptr cint; work: ptr Complex32): cint {.
    stdcall, discardable, importc: "clarf_", dynlib: lapackName.}

proc larfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; v: ptr Complex32; ldv: ptr cint;
            t: ptr Complex32; ldt: ptr cint; c: ptr Complex32; ldc: ptr cint;
            work: ptr Complex32; ldwork: ptr cint): cint {.stdcall, discardable, importc: "clarfb_",
    dynlib: lapackName.}

proc larfg*(n: ptr cint; alpha: ptr Complex32; x: ptr Complex32; incx: ptr cint;
            tau: ptr Complex32): cint {.stdcall, discardable, importc: "clarfg_", dynlib: lapackName.}

# proc larfp*(n: ptr cint; alpha: ptr Complex32; x: ptr Complex32; incx: ptr cint;
#             tau: ptr Complex32): cint {.stdcall, discardable, importc: "clarfp_", dynlib: lapackName.}

proc larft*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint; v: ptr Complex32;
            ldv: ptr cint; tau: ptr Complex32; t: ptr Complex32; ldt: ptr cint): cint {.
    stdcall, discardable, importc: "clarft_", dynlib: lapackName.}

proc larfx*(side: cstring; m: ptr cint; n: ptr cint; v: ptr Complex32; tau: ptr Complex32;
            c: ptr Complex32; ldc: ptr cint; work: ptr Complex32): cint {.stdcall, discardable,
    importc: "clarfx_", dynlib: lapackName.}

proc largv*(n: ptr cint; x: ptr Complex32; incx: ptr cint; y: ptr Complex32; incy: ptr cint;
            c: ptr cfloat; incc: ptr cint): cint {.stdcall, discardable, importc: "clargv_",
    dynlib: lapackName.}

proc larnv*(idist: ptr cint; iseed: ptr cint; n: ptr cint; x: ptr Complex32): cint {.stdcall, discardable,
    importc: "clarnv_", dynlib: lapackName.}

proc larrv*(n: ptr cint; vl: ptr cfloat; vu: ptr cfloat; d: ptr cfloat; l: ptr cfloat;
            pivmin: ptr cfloat; isplit: ptr cint; m: ptr cint; dol: ptr cint; dou: ptr cint;
            minrgp: ptr cfloat; rtol1: ptr cfloat; rtol2: ptr cfloat; w: ptr cfloat;
            werr: ptr cfloat; wgap: ptr cfloat; iblock: ptr cint; indexw: ptr cint;
            gers: ptr cfloat; z: ptr Complex32; ldz: ptr cint; isuppz: ptr cint;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "clarrv_", dynlib: lapackName.}

# proc larscl2*(m: ptr cint; n: ptr cint; d: ptr cfloat; x: ptr Complex32; ldx: ptr cint): cint {.
#     stdcall, discardable, importc: "clarscl2_", dynlib: lapackName.}

proc lartg*(f: ptr Complex32; g: ptr Complex32; cs: ptr cfloat; sn: ptr Complex32;
            r: ptr Complex32): cint {.stdcall, discardable, importc: "clartg_", dynlib: lapackName.}

proc lartv*(n: ptr cint; x: ptr Complex32; incx: ptr cint; y: ptr Complex32; incy: ptr cint;
            c: ptr cfloat; s: ptr Complex32; incc: ptr cint): cint {.stdcall, discardable,
    importc: "clartv_", dynlib: lapackName.}

proc larz*(side: cstring; m: ptr cint; n: ptr cint; l: ptr cint; v: ptr Complex32;
           incv: ptr cint; tau: ptr Complex32; c: ptr Complex32; ldc: ptr cint;
           work: ptr Complex32): cint {.stdcall, discardable, importc: "clarz_", dynlib: lapackName.}

proc larzb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; l: ptr cint; v: ptr Complex32;
            ldv: ptr cint; t: ptr Complex32; ldt: ptr cint; c: ptr Complex32; ldc: ptr cint;
            work: ptr Complex32; ldwork: ptr cint): cint {.stdcall, discardable, importc: "clarzb_",
    dynlib: lapackName.}

proc larzt*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint; v: ptr Complex32;
            ldv: ptr cint; tau: ptr Complex32; t: ptr Complex32; ldt: ptr cint): cint {.
    stdcall, discardable, importc: "clarzt_", dynlib: lapackName.}

proc lascl*(`type`: cstring; kl: ptr cint; ku: ptr cint; cfrom: ptr cfloat;
            cto: ptr cfloat; m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "clascl_", dynlib: lapackName.}

# proc lascl2*(m: ptr cint; n: ptr cint; d: ptr cfloat; x: ptr Complex32; ldx: ptr cint): cint {.
#     stdcall, discardable, importc: "clascl2_", dynlib: lapackName.}

proc laset*(uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr Complex32;
            beta: ptr Complex32; a: ptr Complex32; lda: ptr cint): cint {.stdcall, discardable,
    importc: "claset_", dynlib: lapackName.}

proc lasr*(side: cstring; pivot: cstring; direct: cstring; m: ptr cint; n: ptr cint;
           c: ptr cfloat; s: ptr cfloat; a: ptr Complex32; lda: ptr cint): cint {.stdcall, discardable,
    importc: "clasr_", dynlib: lapackName.}

proc lassq*(n: ptr cint; x: ptr Complex32; incx: ptr cint; scale: ptr cfloat;
            sumsq: ptr cfloat): cint {.stdcall, discardable, importc: "classq_", dynlib: lapackName.}

proc laswp*(n: ptr cint; a: ptr Complex32; lda: ptr cint; k1: ptr cint; k2: ptr cint;
            ipiv: ptr cint; incx: ptr cint): cint {.stdcall, discardable, importc: "claswp_",
    dynlib: lapackName.}

proc lasyf*(uplo: cstring; n: ptr cint; nb: ptr cint; kb: ptr cint; a: ptr Complex32;
            lda: ptr cint; ipiv: ptr cint; w: ptr Complex32; ldw: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "clasyf_", dynlib: lapackName.}

proc latbs*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            kd: ptr cint; ab: ptr Complex32; ldab: ptr cint; x: ptr Complex32;
            scale: ptr cfloat; cnorm: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "clatbs_", dynlib: lapackName.}

proc latdf*(ijob: ptr cint; n: ptr cint; z: ptr Complex32; ldz: ptr cint;
            rhs: ptr Complex32; rdsum: ptr cfloat; rdscal: ptr cfloat; ipiv: ptr cint;
            jpiv: ptr cint): cint {.stdcall, discardable, importc: "clatdf_", dynlib: lapackName.}

proc latps*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            ap: ptr Complex32; x: ptr Complex32; scale: ptr cfloat; cnorm: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "clatps_", dynlib: lapackName.}

proc latrd*(uplo: cstring; n: ptr cint; nb: ptr cint; a: ptr Complex32; lda: ptr cint;
            e: ptr cfloat; tau: ptr Complex32; w: ptr Complex32; ldw: ptr cint): cint {.
    stdcall, discardable, importc: "clatrd_", dynlib: lapackName.}

proc latrs*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            a: ptr Complex32; lda: ptr cint; x: ptr Complex32; scale: ptr cfloat;
            cnorm: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "clatrs_",
    dynlib: lapackName.}

proc latrz*(m: ptr cint; n: ptr cint; l: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32): cint {.stdcall, discardable,
    importc: "clatrz_", dynlib: lapackName.}

proc latzm*(side: cstring; m: ptr cint; n: ptr cint; v: ptr Complex32; incv: ptr cint;
            tau: ptr Complex32; c1: ptr Complex32; c2: ptr Complex32; ldc: ptr cint;
            work: ptr Complex32): cint {.stdcall, discardable, importc: "clatzm_", dynlib: lapackName.}

proc lauu2*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "clauu2_", dynlib: lapackName.}

proc lauum*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "clauum_", dynlib: lapackName.}

proc pbcon*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex32; ldab: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "cpbcon_", dynlib: lapackName.}

proc pbequ*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex32; ldab: ptr cint;
            s: ptr cfloat; scond: ptr cfloat; amax: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpbequ_", dynlib: lapackName.}

proc pbrfs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; afb: ptr Complex32; ldafb: ptr cint; b: ptr Complex32;
            ldb: ptr cint; x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpbrfs_", dynlib: lapackName.}

proc pbstf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex32; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cpbstf_", dynlib: lapackName.}

proc pbsv*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr Complex32;
           ldab: ptr cint; b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cpbsv_", dynlib: lapackName.}

proc pbsvx*(fact: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr Complex32; ldab: ptr cint; afb: ptr Complex32; ldafb: ptr cint;
            equed: cstring; s: ptr cfloat; b: ptr Complex32; ldb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpbsvx_", dynlib: lapackName.}

proc pbtf2*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex32; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cpbtf2_", dynlib: lapackName.}

proc pbtrf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex32; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cpbtrf_", dynlib: lapackName.}

proc pbtrs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr Complex32;
            ldab: ptr cint; b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cpbtrs_", dynlib: lapackName.}

proc pftrf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpftrf_", dynlib: lapackName.}

proc pftri*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpftri_", dynlib: lapackName.}

proc pftrs*(transr: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
            b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cpftrs_", dynlib: lapackName.}

proc pocon*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpocon_", dynlib: lapackName.}

proc poequ*(n: ptr cint; a: ptr Complex32; lda: ptr cint; s: ptr cfloat; scond: ptr cfloat;
            amax: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cpoequ_",
    dynlib: lapackName.}

proc poequb*(n: ptr cint; a: ptr Complex32; lda: ptr cint; s: ptr cfloat; scond: ptr cfloat;
             amax: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cpoequb_",
    dynlib: lapackName.}

proc porfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            af: ptr Complex32; ldaf: ptr cint; b: ptr Complex32; ldb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "cporfs_", dynlib: lapackName.}

# proc porfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
#              lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; s: ptr cfloat;
#              b: ptr Complex32; ldb: ptr cint; x: ptr Complex32; ldx: ptr cint;
#              rcond: ptr cfloat; berr: ptr cfloat; nErrBnds: ptr cint;
#              errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat; nparams: ptr cint;
#              params: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
#     stdcall, discardable, importc: "cporfsx_", dynlib: lapackName.}

proc posv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
           b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cposv_", dynlib: lapackName.}

proc posvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
            lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; equed: cstring;
            s: ptr cfloat; b: ptr Complex32; ldb: ptr cint; x: ptr Complex32; ldx: ptr cint;
            rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat; work: ptr Complex32;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cposvx_",
    dynlib: lapackName.}

# proc posvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
#              lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; equed: cstring;
#              s: ptr cfloat; b: ptr Complex32; ldb: ptr cint; x: ptr Complex32;
#              ldx: ptr cint; rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat;
#              nErrBnds: ptr cint; errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat;
#              nparams: ptr cint; params: ptr cfloat; work: ptr Complex32;
#              rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cposvxx_",
#     dynlib: lapackName.}

proc potf2*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpotf2_", dynlib: lapackName.}

proc potrf*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpotrf_", dynlib: lapackName.}

proc potri*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpotri_", dynlib: lapackName.}

proc potrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cpotrs_", dynlib: lapackName.}

proc ppcon*(uplo: cstring; n: ptr cint; ap: ptr Complex32; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cppcon_", dynlib: lapackName.}

proc ppequ*(uplo: cstring; n: ptr cint; ap: ptr Complex32; s: ptr cfloat;
            scond: ptr cfloat; amax: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "cppequ_", dynlib: lapackName.}

proc pprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32;
            afp: ptr Complex32; b: ptr Complex32; ldb: ptr cint; x: ptr Complex32;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat; work: ptr Complex32;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "cpprfs_",
    dynlib: lapackName.}

proc ppsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32; b: ptr Complex32;
           ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cppsv_",
    dynlib: lapackName.}

proc ppsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32;
            afp: ptr Complex32; equed: cstring; s: ptr cfloat; b: ptr Complex32;
            ldb: ptr cint; x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "cppsvx_", dynlib: lapackName.}

proc pptrf*(uplo: cstring; n: ptr cint; ap: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cpptrf_", dynlib: lapackName.}

proc pptri*(uplo: cstring; n: ptr cint; ap: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cpptri_", dynlib: lapackName.}

proc pptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32;
            b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cpptrs_", dynlib: lapackName.}

proc pstf2*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; piv: ptr cint;
            rank: ptr cint; tol: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpstf2_", dynlib: lapackName.}

proc pstrf*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; piv: ptr cint;
            rank: ptr cint; tol: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cpstrf_", dynlib: lapackName.}

proc ptcon*(n: ptr cint; d: ptr cfloat; e: ptr Complex32; anorm: ptr cfloat;
            rcond: ptr cfloat; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "cptcon_", dynlib: lapackName.}

proc pteqr*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr Complex32;
            ldz: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "cpteqr_", dynlib: lapackName.}

proc ptrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr Complex32;
            df: ptr cfloat; ef: ptr Complex32; b: ptr Complex32; ldb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "cptrfs_", dynlib: lapackName.}

proc ptsv*(n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr Complex32; b: ptr Complex32;
           ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cptsv_",
    dynlib: lapackName.}

proc ptsvx*(fact: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr Complex32;
            df: ptr cfloat; ef: ptr Complex32; b: ptr Complex32; ldb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cptsvx_", dynlib: lapackName.}

proc pttrf*(n: ptr cint; d: ptr cfloat; e: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cpttrf_", dynlib: lapackName.}

proc pttrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr Complex32;
            b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cpttrs_", dynlib: lapackName.}

proc ptts2*(iuplo: ptr cint; n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr Complex32;
            b: ptr Complex32; ldb: ptr cint): cint {.stdcall, discardable, importc: "cptts2_",
    dynlib: lapackName.}

proc rot*(n: ptr cint; cx: ptr Complex32; incx: ptr cint; cy: ptr Complex32; incy: ptr cint;
          c: ptr cfloat; s: ptr Complex32): cint {.stdcall, discardable, importc: "crot_",
    dynlib: lapackName.}

proc pcon*(uplo: cstring; n: ptr cint; ap: ptr Complex32; ipiv: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "cspcon_", dynlib: lapackName.}

proc pmv*(uplo: cstring; n: ptr cint; alpha: ptr Complex32; ap: ptr Complex32;
           x: ptr Complex32; incx: ptr cint; beta: ptr Complex32; y: ptr Complex32;
           incy: ptr cint): cint {.stdcall, discardable, importc: "cspmv_", dynlib: lapackName.}

proc pr*(uplo: cstring; n: ptr cint; alpha: ptr Complex32; x: ptr Complex32;
          incx: ptr cint; ap: ptr Complex32): cint {.stdcall, discardable, importc: "cspr_",
    dynlib: lapackName.}

proc prfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32;
            afp: ptr Complex32; ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "csprfs_", dynlib: lapackName.}

proc psv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32; ipiv: ptr cint;
           b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "cspsv_", dynlib: lapackName.}

proc psvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32;
            afp: ptr Complex32; ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "cspsvx_", dynlib: lapackName.}

proc ptrf*(uplo: cstring; n: ptr cint; ap: ptr Complex32; ipiv: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "csptrf_", dynlib: lapackName.}

proc ptri*(uplo: cstring; n: ptr cint; ap: ptr Complex32; ipiv: ptr cint;
            work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "csptri_",
    dynlib: lapackName.}

proc ptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex32; ipiv: ptr cint;
            b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "csptrs_", dynlib: lapackName.}

proc rscl*(n: ptr cint; sa: ptr cfloat; sx: ptr Complex32; incx: ptr cint): cint {.stdcall, discardable,
    importc: "csrscl_", dynlib: lapackName.}

proc tedc*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr Complex32;
            ldz: ptr cint; work: ptr Complex32; lwork: ptr cint; rwork: ptr cfloat;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cstedc_", dynlib: lapackName.}

proc tegr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr Complex32; ldz: ptr cint; isuppz: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cstegr_", dynlib: lapackName.}

proc tein*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; m: ptr cint; w: ptr cfloat;
            iblock: ptr cint; isplit: ptr cint; z: ptr Complex32; ldz: ptr cint;
            work: ptr cfloat; iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cstein_", dynlib: lapackName.}

proc temr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; m: ptr cint;
            w: ptr cfloat; z: ptr Complex32; ldz: ptr cint; nzc: ptr cint; isuppz: ptr cint;
            tryrac: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "cstemr_",
    dynlib: lapackName.}

proc teqr*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr Complex32;
            ldz: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "csteqr_", dynlib: lapackName.}

proc ycon*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "csycon_", dynlib: lapackName.}

proc yequb*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; s: ptr cfloat;
             scond: ptr cfloat; amax: ptr cfloat; work: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "csyequb_", dynlib: lapackName.}

proc ymv*(uplo: cstring; n: ptr cint; alpha: ptr Complex32; a: ptr Complex32;
           lda: ptr cint; x: ptr Complex32; incx: ptr cint; beta: ptr Complex32;
           y: ptr Complex32; incy: ptr cint): cint {.stdcall, discardable, importc: "csymv_",
    dynlib: lapackName.}

proc yr*(uplo: cstring; n: ptr cint; alpha: ptr Complex32; x: ptr Complex32;
          incx: ptr cint; a: ptr Complex32; lda: ptr cint): cint {.stdcall, discardable,
    importc: "csyr_", dynlib: lapackName.}

proc yrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint; b: ptr Complex32;
            ldb: ptr cint; x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "csyrfs_", dynlib: lapackName.}

# proc yrfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
#              lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
#              s: ptr cfloat; b: ptr Complex32; ldb: ptr cint; x: ptr Complex32;
#              ldx: ptr cint; rcond: ptr cfloat; berr: ptr cfloat; nErrBnds: ptr cint;
#              errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat; nparams: ptr cint;
#              params: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
#     stdcall, discardable, importc: "csyrfsx_", dynlib: lapackName.}

proc ysv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
           ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint; work: ptr Complex32;
           lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "csysv_",
    dynlib: lapackName.}

proc ysvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
            lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr Complex32; ldb: ptr cint; x: ptr Complex32; ldx: ptr cint;
            rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat; work: ptr Complex32;
            lwork: ptr cint; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "csysvx_", dynlib: lapackName.}

# proc ysvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32;
#              lda: ptr cint; af: ptr Complex32; ldaf: ptr cint; ipiv: ptr cint;
#              equed: cstring; s: ptr cfloat; b: ptr Complex32; ldb: ptr cint;
#              x: ptr Complex32; ldx: ptr cint; rcond: ptr cfloat; rpvgrw: ptr cfloat;
#              berr: ptr cfloat; nErrBnds: ptr cint; errBndsNorm: ptr cfloat;
#              errBndsComp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
#              work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
#     importc: "csysvxx_", dynlib: lapackName.}

proc ytf2*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "csytf2_", dynlib: lapackName.}

proc ytrf*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "csytrf_", dynlib: lapackName.}

proc ytri*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; ipiv: ptr cint;
            work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "csytri_",
    dynlib: lapackName.}

proc ytrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex32; lda: ptr cint;
            ipiv: ptr cint; b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "csytrs_", dynlib: lapackName.}

proc tbcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr Complex32; ldab: ptr cint; rcond: ptr cfloat; work: ptr Complex32;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "ctbcon_",
    dynlib: lapackName.}

proc tbrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr Complex32; ldab: ptr cint; b: ptr Complex32;
            ldb: ptr cint; x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "ctbrfs_", dynlib: lapackName.}

proc tbtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr Complex32; ldab: ptr cint; b: ptr Complex32;
            ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "ctbtrs_",
    dynlib: lapackName.}

proc tfsm*(transr: cstring; side: cstring; uplo: cstring; trans: cstring; diag: cstring;
           m: ptr cint; n: ptr cint; alpha: ptr Complex32; a: ptr Complex32;
           b: ptr Complex32; ldb: ptr cint): cint {.stdcall, discardable, importc: "ctfsm_",
    dynlib: lapackName.}

proc tftri*(transr: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr Complex32;
            info: ptr cint): cint {.stdcall, discardable, importc: "ctftri_", dynlib: lapackName.}

proc tfttp*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr Complex32;
            ap: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "ctfttp_",
    dynlib: lapackName.}

proc tfttr*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr Complex32;
            a: ptr Complex32; lda: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ctfttr_", dynlib: lapackName.}

proc tgevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            s: ptr Complex32; lds: ptr cint; p: ptr Complex32; ldp: ptr cint;
            vl: ptr Complex32; ldvl: ptr cint; vr: ptr Complex32; ldvr: ptr cint;
            mm: ptr cint; m: ptr cint; work: ptr Complex32; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "ctgevc_", dynlib: lapackName.}

proc tgex2*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr Complex32;
            lda: ptr cint; b: ptr Complex32; ldb: ptr cint; q: ptr Complex32; ldq: ptr cint;
            z: ptr Complex32; ldz: ptr cint; j1: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ctgex2_", dynlib: lapackName.}

proc tgexc*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr Complex32;
            lda: ptr cint; b: ptr Complex32; ldb: ptr cint; q: ptr Complex32; ldq: ptr cint;
            z: ptr Complex32; ldz: ptr cint; ifst: ptr cint; ilst: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ctgexc_", dynlib: lapackName.}

proc tgsen*(ijob: ptr cint; wantq: ptr cint; wantz: ptr cint; select: ptr cint;
            n: ptr cint; a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
            alpha: ptr Complex32; beta: ptr Complex32; q: ptr Complex32; ldq: ptr cint;
            z: ptr Complex32; ldz: ptr cint; m: ptr cint; pl: ptr cfloat; pr: ptr cfloat;
            dif: ptr cfloat; work: ptr Complex32; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "ctgsen_",
    dynlib: lapackName.}

proc tgsja*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; k: ptr cint; l: ptr cint; a: ptr Complex32; lda: ptr cint;
            b: ptr Complex32; ldb: ptr cint; tola: ptr cfloat; tolb: ptr cfloat;
            alpha: ptr cfloat; beta: ptr cfloat; u: ptr Complex32; ldu: ptr cint;
            v: ptr Complex32; ldv: ptr cint; q: ptr Complex32; ldq: ptr cint;
            work: ptr Complex32; ncycle: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ctgsja_", dynlib: lapackName.}

proc tgsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
            vl: ptr Complex32; ldvl: ptr cint; vr: ptr Complex32; ldvr: ptr cint;
            s: ptr cfloat; dif: ptr cfloat; mm: ptr cint; m: ptr cint; work: ptr Complex32;
            lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ctgsna_", dynlib: lapackName.}

proc tgsy2*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint; a: ptr Complex32;
            lda: ptr cint; b: ptr Complex32; ldb: ptr cint; c: ptr Complex32; ldc: ptr cint;
            d: ptr Complex32; ldd: ptr cint; e: ptr Complex32; lde: ptr cint;
            f: ptr Complex32; ldf: ptr cint; scale: ptr cfloat; rdsum: ptr cfloat;
            rdscal: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "ctgsy2_",
    dynlib: lapackName.}

proc tgsyl*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint; a: ptr Complex32;
            lda: ptr cint; b: ptr Complex32; ldb: ptr cint; c: ptr Complex32; ldc: ptr cint;
            d: ptr Complex32; ldd: ptr cint; e: ptr Complex32; lde: ptr cint;
            f: ptr Complex32; ldf: ptr cint; scale: ptr cfloat; dif: ptr cfloat;
            work: ptr Complex32; lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ctgsyl_", dynlib: lapackName.}

proc tpcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; ap: ptr Complex32;
            rcond: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "ctpcon_", dynlib: lapackName.}

proc tprfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr Complex32; b: ptr Complex32; ldb: ptr cint; x: ptr Complex32;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat; work: ptr Complex32;
            rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "ctprfs_",
    dynlib: lapackName.}

proc tptri*(uplo: cstring; diag: cstring; n: ptr cint; ap: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "ctptri_", dynlib: lapackName.}

proc tptrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr Complex32; b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ctptrs_", dynlib: lapackName.}

proc tpttf*(transr: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex32;
            arf: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "ctpttf_",
    dynlib: lapackName.}

proc tpttr*(uplo: cstring; n: ptr cint; ap: ptr Complex32; a: ptr Complex32; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ctpttr_", dynlib: lapackName.}

proc trcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr Complex32;
            lda: ptr cint; rcond: ptr cfloat; work: ptr Complex32; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "ctrcon_", dynlib: lapackName.}

proc trevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr Complex32; ldt: ptr cint; vl: ptr Complex32; ldvl: ptr cint;
            vr: ptr Complex32; ldvr: ptr cint; mm: ptr cint; m: ptr cint;
            work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "ctrevc_", dynlib: lapackName.}

proc trexc*(compq: cstring; n: ptr cint; t: ptr Complex32; ldt: ptr cint; q: ptr Complex32;
            ldq: ptr cint; ifst: ptr cint; ilst: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ctrexc_", dynlib: lapackName.}

proc trrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
            x: ptr Complex32; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr Complex32; rwork: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "ctrrfs_", dynlib: lapackName.}

proc trsen*(job: cstring; compq: cstring; select: ptr cint; n: ptr cint;
            t: ptr Complex32; ldt: ptr cint; q: ptr Complex32; ldq: ptr cint;
            w: ptr Complex32; m: ptr cint; s: ptr cfloat; sep: ptr cfloat;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ctrsen_", dynlib: lapackName.}

proc trsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr Complex32; ldt: ptr cint; vl: ptr Complex32; ldvl: ptr cint;
            vr: ptr Complex32; ldvr: ptr cint; s: ptr cfloat; sep: ptr cfloat; mm: ptr cint;
            m: ptr cint; work: ptr Complex32; ldwork: ptr cint; rwork: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "ctrsna_", dynlib: lapackName.}

proc trsyl*(trana: cstring; tranb: cstring; isgn: ptr cint; m: ptr cint; n: ptr cint;
            a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint;
            c: ptr Complex32; ldc: ptr cint; scale: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "ctrsyl_", dynlib: lapackName.}

proc trti2*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ctrti2_", dynlib: lapackName.}

proc trtri*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ctrtri_", dynlib: lapackName.}

proc trtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr Complex32; lda: ptr cint; b: ptr Complex32; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ctrtrs_", dynlib: lapackName.}

proc trttf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            arf: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "ctrttf_",
    dynlib: lapackName.}

proc trttp*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint; ap: ptr Complex32;
            info: ptr cint): cint {.stdcall, discardable, importc: "ctrttp_", dynlib: lapackName.}

proc tzrqf*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            info: ptr cint): cint {.stdcall, discardable, importc: "ctzrqf_", dynlib: lapackName.}

proc tzrzf*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ctzrzf_", dynlib: lapackName.}

proc ung2l*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cung2l_", dynlib: lapackName.}

proc ung2r*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cung2r_", dynlib: lapackName.}

proc ungbr*(vect: cstring; m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex32;
            lda: ptr cint; tau: ptr Complex32; work: ptr Complex32; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cungbr_", dynlib: lapackName.}

proc unghr*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cunghr_", dynlib: lapackName.}

proc ungl2*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cungl2_", dynlib: lapackName.}

proc unglq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cunglq_", dynlib: lapackName.}

proc ungql*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cungql_", dynlib: lapackName.}

proc ungqr*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cungqr_", dynlib: lapackName.}

proc ungr2*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cungr2_", dynlib: lapackName.}

proc ungrq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cungrq_", dynlib: lapackName.}

proc ungtr*(uplo: cstring; n: ptr cint; a: ptr Complex32; lda: ptr cint;
            tau: ptr Complex32; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cungtr_", dynlib: lapackName.}

proc unm2l*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex32; lda: ptr cint; tau: ptr Complex32; c: ptr Complex32;
            ldc: ptr cint; work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cunm2l_", dynlib: lapackName.}

proc unm2r*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex32; lda: ptr cint; tau: ptr Complex32; c: ptr Complex32;
            ldc: ptr cint; work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cunm2r_", dynlib: lapackName.}

proc unmbr*(vect: cstring; side: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            k: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            c: ptr Complex32; ldc: ptr cint; work: ptr Complex32; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cunmbr_", dynlib: lapackName.}

proc unmhr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            c: ptr Complex32; ldc: ptr cint; work: ptr Complex32; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cunmhr_", dynlib: lapackName.}

proc unml2*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex32; lda: ptr cint; tau: ptr Complex32; c: ptr Complex32;
            ldc: ptr cint; work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cunml2_", dynlib: lapackName.}

proc unmlq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex32; lda: ptr cint; tau: ptr Complex32; c: ptr Complex32;
            ldc: ptr cint; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cunmlq_", dynlib: lapackName.}

proc unmql*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex32; lda: ptr cint; tau: ptr Complex32; c: ptr Complex32;
            ldc: ptr cint; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cunmql_", dynlib: lapackName.}

proc unmqr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex32; lda: ptr cint; tau: ptr Complex32; c: ptr Complex32;
            ldc: ptr cint; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cunmqr_", dynlib: lapackName.}

proc unmr2*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex32; lda: ptr cint; tau: ptr Complex32; c: ptr Complex32;
            ldc: ptr cint; work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable,
    importc: "cunmr2_", dynlib: lapackName.}

proc unmr3*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            c: ptr Complex32; ldc: ptr cint; work: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "cunmr3_", dynlib: lapackName.}

proc unmrq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex32; lda: ptr cint; tau: ptr Complex32; c: ptr Complex32;
            ldc: ptr cint; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cunmrq_", dynlib: lapackName.}

proc unmrz*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr Complex32; lda: ptr cint; tau: ptr Complex32;
            c: ptr Complex32; ldc: ptr cint; work: ptr Complex32; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "cunmrz_", dynlib: lapackName.}

proc unmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            a: ptr Complex32; lda: ptr cint; tau: ptr Complex32; c: ptr Complex32;
            ldc: ptr cint; work: ptr Complex32; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "cunmtr_", dynlib: lapackName.}

proc upgtr*(uplo: cstring; n: ptr cint; ap: ptr Complex32; tau: ptr Complex32;
            q: ptr Complex32; ldq: ptr cint; work: ptr Complex32; info: ptr cint): cint {.
    stdcall, discardable, importc: "cupgtr_", dynlib: lapackName.}

proc upmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            ap: ptr Complex32; tau: ptr Complex32; c: ptr Complex32; ldc: ptr cint;
            work: ptr Complex32; info: ptr cint): cint {.stdcall, discardable, importc: "cupmtr_",
    dynlib: lapackName.}

proc bdsdc*(uplo: cstring; compq: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            u: ptr cdouble; ldu: ptr cint; vt: ptr cdouble; ldvt: ptr cint; q: ptr cdouble;
            iq: ptr cint; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dbdsdc_", dynlib: lapackName.}

proc bdsqr*(uplo: cstring; n: ptr cint; ncvt: ptr cint; nru: ptr cint; ncc: ptr cint;
            d: ptr cdouble; e: ptr cdouble; vt: ptr cdouble; ldvt: ptr cint; u: ptr cdouble;
            ldu: ptr cint; c: ptr cdouble; ldc: ptr cint; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dbdsqr_", dynlib: lapackName.}

proc disna*(job: cstring; m: ptr cint; n: ptr cint; d: ptr cdouble; sep: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "ddisna_", dynlib: lapackName.}

proc gbbrd*(vect: cstring; m: ptr cint; n: ptr cint; ncc: ptr cint; kl: ptr cint;
            ku: ptr cint; ab: ptr cdouble; ldab: ptr cint; d: ptr cdouble; e: ptr cdouble;
            q: ptr cdouble; ldq: ptr cint; pt: ptr cdouble; ldpt: ptr cint; c: ptr cdouble;
            ldc: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgbbrd_", dynlib: lapackName.}

proc gbcon*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; ipiv: ptr cint; anorm: ptr cdouble; rcond: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgbcon_", dynlib: lapackName.}

proc gbequ*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; r: ptr cdouble; c: ptr cdouble; rowcnd: ptr cdouble;
            colcnd: ptr cdouble; amax: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgbequ_", dynlib: lapackName.}

proc gbequb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
             ldab: ptr cint; r: ptr cdouble; c: ptr cdouble; rowcnd: ptr cdouble;
             colcnd: ptr cdouble; amax: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgbequb_", dynlib: lapackName.}

proc gbrfs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; afb: ptr cdouble; ldafb: ptr cint;
            ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dgbrfs_", dynlib: lapackName.}

# proc gbrfsx*(trans: cstring; equed: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#              nrhs: ptr cint; ab: ptr cdouble; ldab: ptr cint; afb: ptr cdouble;
#              ldafb: ptr cint; ipiv: ptr cint; r: ptr cdouble; c: ptr cdouble;
#              b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
#              rcond: ptr cdouble; berr: ptr cdouble; nErrBnds: ptr cint;
#              errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble; nparams: ptr cint;
#              params: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
#     stdcall, discardable, importc: "dgbrfsx_", dynlib: lapackName.}

proc gbsv*(n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr cdouble;
           ldab: ptr cint; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgbsv_", dynlib: lapackName.}

proc gbsvx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
            nrhs: ptr cint; ab: ptr cdouble; ldab: ptr cint; afb: ptr cdouble;
            ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cdouble;
            c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dgbsvx_",
    dynlib: lapackName.}

# proc gbsvxx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#              nrhs: ptr cint; ab: ptr cdouble; ldab: ptr cint; afb: ptr cdouble;
#              ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cdouble;
#              c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
#              rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
#              nErrBnds: ptr cint; errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble;
#              nparams: ptr cint; params: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
#              info: ptr cint): cint {.stdcall, discardable, importc: "dgbsvxx_", dynlib: lapackName.}

proc gbtf2*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgbtf2_", dynlib: lapackName.}

proc gbtrf*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgbtrf_", dynlib: lapackName.}

proc gbtrs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dgbtrs_", dynlib: lapackName.}

proc gebak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            scale: ptr cdouble; m: ptr cint; v: ptr cdouble; ldv: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgebak_", dynlib: lapackName.}

proc gebal*(job: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgebal_", dynlib: lapackName.}

proc gebd2*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; d: ptr cdouble;
            e: ptr cdouble; tauq: ptr cdouble; taup: ptr cdouble; work: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dgebd2_", dynlib: lapackName.}

proc gebrd*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; d: ptr cdouble;
            e: ptr cdouble; tauq: ptr cdouble; taup: ptr cdouble; work: ptr cdouble;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dgebrd_",
    dynlib: lapackName.}

proc gecon*(norm: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgecon_", dynlib: lapackName.}

proc geequ*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; r: ptr cdouble;
            c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble; amax: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dgeequ_", dynlib: lapackName.}

proc geequb*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; r: ptr cdouble;
             c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble; amax: ptr cdouble;
             info: ptr cint): cint {.stdcall, discardable, importc: "dgeequb_", dynlib: lapackName.}

proc gees*(jobvs: cstring; sort: cstring; select: proc(ar, ai: ptr cdouble): cint; n: ptr cint; a: ptr cdouble;
           lda: ptr cint; sdim: ptr cint; wr: ptr cdouble; wi: ptr cdouble; vs: ptr cdouble;
           ldvs: ptr cint; work: ptr cdouble; lwork: ptr cint; bwork: ptr cint;
           info: ptr cint): cint {.stdcall, discardable, importc: "dgees_", dynlib: lapackName.}

proc geesx*(jobvs: cstring; sort: cstring; select: proc(ar, ai: ptr cdouble): cint; sense: cstring; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; sdim: ptr cint; wr: ptr cdouble; wi: ptr cdouble;
            vs: ptr cdouble; ldvs: ptr cint; rconde: ptr cdouble; rcondv: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            bwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dgeesx_",
    dynlib: lapackName.}

proc geev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
           wr: ptr cdouble; wi: ptr cdouble; vl: ptr cdouble; ldvl: ptr cint;
           vr: ptr cdouble; ldvr: ptr cint; work: ptr cdouble; lwork: ptr cint;
           info: ptr cint): cint {.stdcall, discardable, importc: "dgeev_", dynlib: lapackName.}

proc geevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr cdouble; lda: ptr cint; wr: ptr cdouble; wi: ptr cdouble;
            vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble; ldvr: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cdouble; abnrm: ptr cdouble; rconde: ptr cdouble;
            rcondv: ptr cdouble; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dgeevx_", dynlib: lapackName.}

proc gegs*(jobvsl: cstring; jobvsr: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
           b: ptr cdouble; ldb: ptr cint; alphar: ptr cdouble; alphai: ptr cdouble;
           beta: ptr cdouble; vsl: ptr cdouble; ldvsl: ptr cint; vsr: ptr cdouble;
           ldvsr: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgegs_", dynlib: lapackName.}

proc gegv*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
           b: ptr cdouble; ldb: ptr cint; alphar: ptr cdouble; alphai: ptr cdouble;
           beta: ptr cdouble; vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble;
           ldvr: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgegv_", dynlib: lapackName.}

proc gehd2*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgehd2_", dynlib: lapackName.}

proc gehrd*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgehrd_", dynlib: lapackName.}

proc gejsv*(joba: cstring; jobu: cstring; jobv: cstring; jobr: cstring; jobt: cstring;
            jobp: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            sva: ptr cdouble; u: ptr cdouble; ldu: ptr cint; v: ptr cdouble; ldv: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgejsv_", dynlib: lapackName.}

proc gelq2*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dgelq2_",
    dynlib: lapackName.}

proc gelqf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgelqf_", dynlib: lapackName.}

proc gels*(trans: cstring; m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
           lda: ptr cint; b: ptr cdouble; ldb: ptr cint; work: ptr cdouble; lwork: ptr cint;
           info: ptr cint): cint {.stdcall, discardable, importc: "dgels_", dynlib: lapackName.}

proc gelsd*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; s: ptr cdouble; rcond: ptr cdouble;
            rank: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dgelsd_", dynlib: lapackName.}

proc gelss*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; s: ptr cdouble; rcond: ptr cdouble;
            rank: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgelss_", dynlib: lapackName.}

proc gelsx*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; jpvt: ptr cint; rcond: ptr cdouble;
            rank: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgelsx_", dynlib: lapackName.}

proc gelsy*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; jpvt: ptr cint; rcond: ptr cdouble;
            rank: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgelsy_", dynlib: lapackName.}

proc geql2*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dgeql2_",
    dynlib: lapackName.}

proc geqlf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgeqlf_", dynlib: lapackName.}

proc geqp3*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; jpvt: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgeqp3_", dynlib: lapackName.}

proc geqpf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; jpvt: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgeqpf_", dynlib: lapackName.}

proc geqr2*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dgeqr2_",
    dynlib: lapackName.}

proc geqrf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgeqrf_", dynlib: lapackName.}

proc gerfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint;
            x: ptr cdouble; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgerfs_", dynlib: lapackName.}

# proc gerfsx*(trans: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
#              lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; r: ptr cdouble;
#              c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
#              rcond: ptr cdouble; berr: ptr cdouble; nErrBnds: ptr cint;
#              errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble; nparams: ptr cint;
#              params: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
#     stdcall, discardable, importc: "dgerfsx_", dynlib: lapackName.}

proc gerq2*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dgerq2_",
    dynlib: lapackName.}

proc gerqf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgerqf_", dynlib: lapackName.}

proc gesc2*(n: ptr cint; a: ptr cdouble; lda: ptr cint; rhs: ptr cdouble; ipiv: ptr cint;
            jpiv: ptr cint; scale: ptr cdouble): cint {.stdcall, discardable, importc: "dgesc2_",
    dynlib: lapackName.}

proc gesdd*(jobz: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            s: ptr cdouble; u: ptr cdouble; ldu: ptr cint; vt: ptr cdouble; ldvt: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgesdd_", dynlib: lapackName.}

proc gesv*(n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
           b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgesv_", dynlib: lapackName.}

proc gesvd*(jobu: cstring; jobvt: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; s: ptr cdouble; u: ptr cdouble; ldu: ptr cint; vt: ptr cdouble;
            ldvt: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgesvd_", dynlib: lapackName.}

proc gesvj*(joba: cstring; jobu: cstring; jobv: cstring; m: ptr cint; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; sva: ptr cdouble; mv: ptr cint; v: ptr cdouble;
            ldv: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgesvj_", dynlib: lapackName.}

proc gesvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
            lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
            r: ptr cdouble; c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgesvx_", dynlib: lapackName.}

# proc gesvxx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
#              lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
#              r: ptr cdouble; c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
#              ldx: ptr cint; rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
#              nErrBnds: ptr cint; errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble;
#              nparams: ptr cint; params: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
#              info: ptr cint): cint {.stdcall, discardable, importc: "dgesvxx_", dynlib: lapackName.}

proc getc2*(n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint; jpiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dgetc2_", dynlib: lapackName.}

proc getf2*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dgetf2_", dynlib: lapackName.}

proc getrf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dgetrf_", dynlib: lapackName.}

proc getri*(n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint; work: ptr cdouble;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dgetri_",
    dynlib: lapackName.}

proc getrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgetrs_", dynlib: lapackName.}

proc ggbak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cdouble; rscale: ptr cdouble; m: ptr cint; v: ptr cdouble;
            ldv: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dggbak_",
    dynlib: lapackName.}

proc ggbal*(job: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble;
            ldb: ptr cint; ilo: ptr cint; ihi: ptr cint; lscale: ptr cdouble;
            rscale: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dggbal_", dynlib: lapackName.}

proc gges*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: proc(ar, ai: ptr cdouble): cint; n: ptr cint;
           a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; sdim: ptr cint;
           alphar: ptr cdouble; alphai: ptr cdouble; beta: ptr cdouble; vsl: ptr cdouble;
           ldvsl: ptr cint; vsr: ptr cdouble; ldvsr: ptr cint; work: ptr cdouble;
           lwork: ptr cint; bwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgges_", dynlib: lapackName.}

proc ggesx*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: proc(ar, ai: ptr cdouble): cint;
            sense: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble;
            ldb: ptr cint; sdim: ptr cint; alphar: ptr cdouble; alphai: ptr cdouble;
            beta: ptr cdouble; vsl: ptr cdouble; ldvsl: ptr cint; vsr: ptr cdouble;
            ldvsr: ptr cint; rconde: ptr cdouble; rcondv: ptr cdouble; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; bwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dggesx_", dynlib: lapackName.}

proc ggev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
           b: ptr cdouble; ldb: ptr cint; alphar: ptr cdouble; alphai: ptr cdouble;
           beta: ptr cdouble; vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble;
           ldvr: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dggev_", dynlib: lapackName.}

proc ggevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
            alphar: ptr cdouble; alphai: ptr cdouble; beta: ptr cdouble; vl: ptr cdouble;
            ldvl: ptr cint; vr: ptr cdouble; ldvr: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cdouble; rscale: ptr cdouble; abnrm: ptr cdouble;
            bbnrm: ptr cdouble; rconde: ptr cdouble; rcondv: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; bwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dggevx_", dynlib: lapackName.}

proc ggglm*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; d: ptr cdouble; x: ptr cdouble; y: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dggglm_", dynlib: lapackName.}

proc gghrd*(compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; q: ptr cdouble;
            ldq: ptr cint; z: ptr cdouble; ldz: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgghrd_", dynlib: lapackName.}

proc gglse*(m: ptr cint; n: ptr cint; p: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; c: ptr cdouble; d: ptr cdouble; x: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgglse_", dynlib: lapackName.}

proc ggqrf*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr cdouble; lda: ptr cint;
            taua: ptr cdouble; b: ptr cdouble; ldb: ptr cint; taub: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dggqrf_", dynlib: lapackName.}

proc ggrqf*(m: ptr cint; p: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            taua: ptr cdouble; b: ptr cdouble; ldb: ptr cint; taub: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dggrqf_", dynlib: lapackName.}

proc ggsvd*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; n: ptr cint;
            p: ptr cint; k: ptr cint; l: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; alpha: ptr cdouble; beta: ptr cdouble;
            u: ptr cdouble; ldu: ptr cint; v: ptr cdouble; ldv: ptr cint; q: ptr cdouble;
            ldq: ptr cint; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dggsvd_", dynlib: lapackName.}

proc ggsvp*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
            tola: ptr cdouble; tolb: ptr cdouble; k: ptr cint; l: ptr cint; u: ptr cdouble;
            ldu: ptr cint; v: ptr cdouble; ldv: ptr cint; q: ptr cdouble; ldq: ptr cint;
            iwork: ptr cint; tau: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dggsvp_", dynlib: lapackName.}

proc gsvj0*(jobv: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            d: ptr cdouble; sva: ptr cdouble; mv: ptr cint; v: ptr cdouble; ldv: ptr cint;
            eps: ptr cdouble; sfmin: ptr cdouble; tol: ptr cdouble; nsweep: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgsvj0_", dynlib: lapackName.}

proc gsvj1*(jobv: cstring; m: ptr cint; n: ptr cint; n1: ptr cint; a: ptr cdouble;
            lda: ptr cint; d: ptr cdouble; sva: ptr cdouble; mv: ptr cint; v: ptr cdouble;
            ldv: ptr cint; eps: ptr cdouble; sfmin: ptr cdouble; tol: ptr cdouble;
            nsweep: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dgsvj1_", dynlib: lapackName.}

proc gtcon*(norm: cstring; n: ptr cint; dl: ptr cdouble; d: ptr cdouble; du: ptr cdouble;
            du2: ptr cdouble; ipiv: ptr cint; anorm: ptr cdouble; rcond: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgtcon_", dynlib: lapackName.}

proc gtrfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cdouble; d: ptr cdouble;
            du: ptr cdouble; dlf: ptr cdouble; df: ptr cdouble; duf: ptr cdouble;
            du2: ptr cdouble; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dgtrfs_",
    dynlib: lapackName.}

proc gtsv*(n: ptr cint; nrhs: ptr cint; dl: ptr cdouble; d: ptr cdouble; du: ptr cdouble;
           b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dgtsv_", dynlib: lapackName.}

proc gtsvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cdouble;
            d: ptr cdouble; du: ptr cdouble; dlf: ptr cdouble; df: ptr cdouble;
            duf: ptr cdouble; du2: ptr cdouble; ipiv: ptr cint; b: ptr cdouble;
            ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dgtsvx_", dynlib: lapackName.}

proc gttrf*(n: ptr cint; dl: ptr cdouble; d: ptr cdouble; du: ptr cdouble; du2: ptr cdouble;
            ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dgttrf_",
    dynlib: lapackName.}

proc gttrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cdouble; d: ptr cdouble;
            du: ptr cdouble; du2: ptr cdouble; ipiv: ptr cint; b: ptr cdouble;
            ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dgttrs_",
    dynlib: lapackName.}

proc gtts2*(itrans: ptr cint; n: ptr cint; nrhs: ptr cint; dl: ptr cdouble; d: ptr cdouble;
            du: ptr cdouble; du2: ptr cdouble; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint): cint {.
    stdcall, discardable, importc: "dgtts2_", dynlib: lapackName.}

proc hgeqz*(job: cstring; compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr cdouble; ldh: ptr cint; t: ptr cdouble; ldt: ptr cint;
            alphar: ptr cdouble; alphai: ptr cdouble; beta: ptr cdouble; q: ptr cdouble;
            ldq: ptr cint; z: ptr cdouble; ldz: ptr cint; work: ptr cdouble;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dhgeqz_",
    dynlib: lapackName.}

proc hsein*(side: cstring; eigsrc: cstring; initv: cstring; select: ptr cint;
            n: ptr cint; h: ptr cdouble; ldh: ptr cint; wr: ptr cdouble; wi: ptr cdouble;
            vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble; ldvr: ptr cint; mm: ptr cint;
            m: ptr cint; work: ptr cdouble; ifaill: ptr cint; ifailr: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dhsein_", dynlib: lapackName.}

proc hseqr*(job: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            h: ptr cdouble; ldh: ptr cint; wr: ptr cdouble; wi: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dhseqr_", dynlib: lapackName.}
proc isnan*(din: ptr cdouble): cint {.stdcall, discardable, importc: "disnan_", dynlib: lapackName.}

# proc laGbamv*(trans: ptr cint; m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
#               alpha: ptr cdouble; ab: ptr cdouble; ldab: ptr cint; x: ptr cdouble;
#               incx: ptr cint; beta: ptr cdouble; y: ptr cdouble; incy: ptr cint): cint {.
#     stdcall, discardable, importc: "dla_gbamv__", dynlib: lapackName.}
# proc laGbrcond*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
#                 ldab: ptr cint; afb: ptr cdouble; ldafb: ptr cint; ipiv: ptr cint;
#                 cmode: ptr cint; c: ptr cdouble; info: ptr cint; work: ptr cdouble;
#                 iwork: ptr cint; transLen: int16): cdouble {.stdcall, discardable,
#     importc: "dla_gbrcond__", dynlib: lapackName.}
#
# proc laGbrfsxExtended*(precType: ptr cint; transType: ptr cint; n: ptr cint;
#                        kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr cdouble;
#                        ldab: ptr cint; afb: ptr cdouble; ldafb: ptr cint; ipiv: ptr cint;
#                        colequ: ptr cint; c: ptr cdouble; b: ptr cdouble;
#                        ldb: ptr cint; y: ptr cdouble; ldy: ptr cint;
#                        berrOut: ptr cdouble; nNorms: ptr cint; errsN: ptr cdouble;
#                        errsC: ptr cdouble; res: ptr cdouble; ayb: ptr cdouble;
#                        dy: ptr cdouble; yTail: ptr cdouble; rcond: ptr cdouble;
#                        ithresh: ptr cint; rthresh: ptr cdouble; dzUb: ptr cdouble;
#                        ignoreCwise: ptr cint; info: ptr cint): cint {.stdcall, discardable,
#     importc: "dla_gbrfsx_extended__", dynlib: lapackName.}
# proc laGbrpvgrw*(n: ptr cint; kl: ptr cint; ku: ptr cint; ncols: ptr cint; ab: ptr cdouble;
#                  ldab: ptr cint; afb: ptr cdouble; ldafb: ptr cint): cdouble {.stdcall, discardable,
#     importc: "dla_gbrpvgrw__", dynlib: lapackName.}
#
# proc laGeamv*(trans: ptr cint; m: ptr cint; n: ptr cint; alpha: ptr cdouble; a: ptr cdouble;
#               lda: ptr cint; x: ptr cdouble; incx: ptr cint; beta: ptr cdouble;
#               y: ptr cdouble; incy: ptr cint): cint {.stdcall, discardable, importc: "dla_geamv__",
#     dynlib: lapackName.}
# proc laGercond*(trans: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
#                 af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; cmode: ptr cint;
#                 c: ptr cdouble; info: ptr cint; work: ptr cdouble; iwork: ptr cint;
#                 transLen: int16): cdouble {.stdcall, discardable, importc: "dla_gercond__",
#     dynlib: lapackName.}
#
# proc laGerfsxExtended*(precType: ptr cint; transType: ptr cint; n: ptr cint;
#                        nrhs: ptr cint; a: ptr cdouble; lda: ptr cint; af: ptr cdouble;
#                        ldaf: ptr cint; ipiv: ptr cint; colequ: ptr cint;
#                        c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; y: ptr cdouble;
#                        ldy: ptr cint; berrOut: ptr cdouble; nNorms: ptr cint;
#                        errsN: ptr cdouble; errsC: ptr cdouble; res: ptr cdouble;
#                        ayb: ptr cdouble; dy: ptr cdouble; yTail: ptr cdouble;
#                        rcond: ptr cdouble; ithresh: ptr cint; rthresh: ptr cdouble;
#                        dzUb: ptr cdouble; ignoreCwise: ptr cint; info: ptr cint): cint {.
#     stdcall, discardable, importc: "dla_gerfsx_extended__", dynlib: lapackName.}
#
# proc laLinBerr*(n: ptr cint; nz: ptr cint; nrhs: ptr cint; res: ptr cdouble;
#                 ayb: ptr cdouble; berr: ptr cdouble): cint {.stdcall, discardable,
#     importc: "dla_lin_berr__", dynlib: lapackName.}
# proc laPorcond*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; af: ptr cdouble;
#                 ldaf: ptr cint; cmode: ptr cint; c: ptr cdouble; info: ptr cint;
#                 work: ptr cdouble; iwork: ptr cint; uploLen: int16): cdouble {.stdcall, discardable,
#     importc: "dla_porcond__", dynlib: lapackName.}
#
# proc laPorfsxExtended*(precType: ptr cint; uplo: cstring; n: ptr cint; nrhs: ptr cint;
#                        a: ptr cdouble; lda: ptr cint; af: ptr cdouble; ldaf: ptr cint;
#                        colequ: ptr cint; c: ptr cdouble; b: ptr cdouble;
#                        ldb: ptr cint; y: ptr cdouble; ldy: ptr cint;
#                        berrOut: ptr cdouble; nNorms: ptr cint; errsN: ptr cdouble;
#                        errsC: ptr cdouble; res: ptr cdouble; ayb: ptr cdouble;
#                        dy: ptr cdouble; yTail: ptr cdouble; rcond: ptr cdouble;
#                        ithresh: ptr cint; rthresh: ptr cdouble; dzUb: ptr cdouble;
#                        ignoreCwise: ptr cint; info: ptr cint; uploLen: int16): cint {.
#     stdcall, discardable, importc: "dla_porfsx_extended__", dynlib: lapackName.}
# proc laPorpvgrw*(uplo: cstring; ncols: ptr cint; a: ptr cdouble; lda: ptr cint;
#                  af: ptr cdouble; ldaf: ptr cint; work: ptr cdouble; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "dla_porpvgrw__", dynlib: lapackName.}
# proc laRpvgrw*(n: ptr cint; ncols: ptr cint; a: ptr cdouble; lda: ptr cint; af: ptr cdouble;
#                ldaf: ptr cint): cdouble {.stdcall, discardable, importc: "dla_rpvgrw__",
#                                       dynlib: lapackName.}
#
# proc laSyamv*(uplo: ptr cint; n: ptr cint; alpha: ptr cdouble; a: ptr cdouble;
#               lda: ptr cint; x: ptr cdouble; incx: ptr cint; beta: ptr cdouble;
#               y: ptr cdouble; incy: ptr cint): cint {.stdcall, discardable, importc: "dla_syamv__",
#     dynlib: lapackName.}
# proc laSyrcond*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; af: ptr cdouble;
#                 ldaf: ptr cint; ipiv: ptr cint; cmode: ptr cint; c: ptr cdouble;
#                 info: ptr cint; work: ptr cdouble; iwork: ptr cint; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "dla_syrcond__", dynlib: lapackName.}
#
# proc laSyrfsxExtended*(precType: ptr cint; uplo: cstring; n: ptr cint; nrhs: ptr cint;
#                        a: ptr cdouble; lda: ptr cint; af: ptr cdouble; ldaf: ptr cint;
#                        ipiv: ptr cint; colequ: ptr cint; c: ptr cdouble;
#                        b: ptr cdouble; ldb: ptr cint; y: ptr cdouble; ldy: ptr cint;
#                        berrOut: ptr cdouble; nNorms: ptr cint; errsN: ptr cdouble;
#                        errsC: ptr cdouble; res: ptr cdouble; ayb: ptr cdouble;
#                        dy: ptr cdouble; yTail: ptr cdouble; rcond: ptr cdouble;
#                        ithresh: ptr cint; rthresh: ptr cdouble; dzUb: ptr cdouble;
#                        ignoreCwise: ptr cint; info: ptr cint; uploLen: int16): cint {.
#     stdcall, discardable, importc: "dla_syrfsx_extended__", dynlib: lapackName.}
# proc laSyrpvgrw*(uplo: cstring; n: ptr cint; info: ptr cint; a: ptr cdouble; lda: ptr cint;
#                  af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; work: ptr cdouble;
#                  uploLen: int16): cdouble {.stdcall, discardable, importc: "dla_syrpvgrw__",
#     dynlib: lapackName.}
#
# proc laWwaddw*(n: ptr cint; x: ptr cdouble; y: ptr cdouble; w: ptr cdouble): cint {.stdcall, discardable,
#     importc: "dla_wwaddw__", dynlib: lapackName.}

proc labad*(small: ptr cdouble; large: ptr cdouble): cint {.stdcall, discardable, importc: "dlabad_",
    dynlib: lapackName.}

proc labrd*(m: ptr cint; n: ptr cint; nb: ptr cint; a: ptr cdouble; lda: ptr cint;
            d: ptr cdouble; e: ptr cdouble; tauq: ptr cdouble; taup: ptr cdouble;
            x: ptr cdouble; ldx: ptr cint; y: ptr cdouble; ldy: ptr cint): cint {.stdcall, discardable,
    importc: "dlabrd_", dynlib: lapackName.}

proc lacn2*(n: ptr cint; v: ptr cdouble; x: ptr cdouble; isgn: ptr cint; est: ptr cdouble;
            kase: ptr cint; isave: ptr cint): cint {.stdcall, discardable, importc: "dlacn2_",
    dynlib: lapackName.}

proc lacon*(n: ptr cint; v: ptr cdouble; x: ptr cdouble; isgn: ptr cint; est: ptr cdouble;
            kase: ptr cint): cint {.stdcall, discardable, importc: "dlacon_", dynlib: lapackName.}

proc lacpy*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint): cint {.stdcall, discardable, importc: "dlacpy_",
    dynlib: lapackName.}

proc ladiv*(a: ptr cdouble; b: ptr cdouble; c: ptr cdouble; d: ptr cdouble; p: ptr cdouble;
            q: ptr cdouble): cint {.stdcall, discardable, importc: "dladiv_", dynlib: lapackName.}

proc lae2*(a: ptr cdouble; b: ptr cdouble; c: ptr cdouble; rt1: ptr cdouble;
           rt2: ptr cdouble): cint {.stdcall, discardable, importc: "dlae2_", dynlib: lapackName.}

proc laebz*(ijob: ptr cint; nitmax: ptr cint; n: ptr cint; mmax: ptr cint; minp: ptr cint;
            nbmin: ptr cint; abstol: ptr cdouble; reltol: ptr cdouble;
            pivmin: ptr cdouble; d: ptr cdouble; e: ptr cdouble; e2: ptr cdouble;
            nval: ptr cint; ab: ptr cdouble; c: ptr cdouble; mout: ptr cint; nab: ptr cint;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlaebz_", dynlib: lapackName.}

proc laed0*(icompq: ptr cint; qsiz: ptr cint; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            q: ptr cdouble; ldq: ptr cint; qstore: ptr cdouble; ldqs: ptr cint;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlaed0_", dynlib: lapackName.}

proc laed1*(n: ptr cint; d: ptr cdouble; q: ptr cdouble; ldq: ptr cint; indxq: ptr cint;
            rho: ptr cdouble; cutpnt: ptr cint; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlaed1_", dynlib: lapackName.}

proc laed2*(k: ptr cint; n: ptr cint; n1: ptr cint; d: ptr cdouble; q: ptr cdouble;
            ldq: ptr cint; indxq: ptr cint; rho: ptr cdouble; z: ptr cdouble;
            dlamda: ptr cdouble; w: ptr cdouble; q2: ptr cdouble; indx: ptr cint;
            indxc: ptr cint; indxp: ptr cint; coltyp: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlaed2_", dynlib: lapackName.}

proc laed3*(k: ptr cint; n: ptr cint; n1: ptr cint; d: ptr cdouble; q: ptr cdouble;
            ldq: ptr cint; rho: ptr cdouble; dlamda: ptr cdouble; q2: ptr cdouble;
            indx: ptr cint; ctot: ptr cint; w: ptr cdouble; s: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlaed3_", dynlib: lapackName.}

proc laed4*(n: ptr cint; i: ptr cint; d: ptr cdouble; z: ptr cdouble; delta: ptr cdouble;
            rho: ptr cdouble; dlam: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlaed4_", dynlib: lapackName.}

proc laed5*(i: ptr cint; d: ptr cdouble; z: ptr cdouble; delta: ptr cdouble;
            rho: ptr cdouble; dlam: ptr cdouble): cint {.stdcall, discardable, importc: "dlaed5_",
    dynlib: lapackName.}

proc laed6*(kniter: ptr cint; orgati: ptr cint; rho: ptr cdouble; d: ptr cdouble;
            z: ptr cdouble; finit: ptr cdouble; tau: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlaed6_", dynlib: lapackName.}

proc laed7*(icompq: ptr cint; n: ptr cint; qsiz: ptr cint; tlvls: ptr cint;
            curlvl: ptr cint; curpbm: ptr cint; d: ptr cdouble; q: ptr cdouble;
            ldq: ptr cint; indxq: ptr cint; rho: ptr cdouble; cutpnt: ptr cint;
            qstore: ptr cdouble; qptr: ptr cint; prmptr: ptr cint; perm: ptr cint;
            givptr: ptr cint; givcol: ptr cint; givnum: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dlaed7_",
    dynlib: lapackName.}

proc laed8*(icompq: ptr cint; k: ptr cint; n: ptr cint; qsiz: ptr cint; d: ptr cdouble;
            q: ptr cdouble; ldq: ptr cint; indxq: ptr cint; rho: ptr cdouble;
            cutpnt: ptr cint; z: ptr cdouble; dlamda: ptr cdouble; q2: ptr cdouble;
            ldq2: ptr cint; w: ptr cdouble; perm: ptr cint; givptr: ptr cint;
            givcol: ptr cint; givnum: ptr cdouble; indxp: ptr cint; indx: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlaed8_", dynlib: lapackName.}

proc laed9*(k: ptr cint; kstart: ptr cint; kstop: ptr cint; n: ptr cint; d: ptr cdouble;
            q: ptr cdouble; ldq: ptr cint; rho: ptr cdouble; dlamda: ptr cdouble;
            w: ptr cdouble; s: ptr cdouble; lds: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlaed9_", dynlib: lapackName.}

proc laeda*(n: ptr cint; tlvls: ptr cint; curlvl: ptr cint; curpbm: ptr cint;
            prmptr: ptr cint; perm: ptr cint; givptr: ptr cint; givcol: ptr cint;
            givnum: ptr cdouble; q: ptr cdouble; qptr: ptr cint; z: ptr cdouble;
            ztemp: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dlaeda_",
    dynlib: lapackName.}

proc laein*(rightv: ptr cint; noinit: ptr cint; n: ptr cint; h: ptr cdouble;
            ldh: ptr cint; wr: ptr cdouble; wi: ptr cdouble; vr: ptr cdouble;
            vi: ptr cdouble; b: ptr cdouble; ldb: ptr cint; work: ptr cdouble;
            eps3: ptr cdouble; smlnum: ptr cdouble; bignum: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlaein_", dynlib: lapackName.}

proc laev2*(a: ptr cdouble; b: ptr cdouble; c: ptr cdouble; rt1: ptr cdouble;
            rt2: ptr cdouble; cs1: ptr cdouble; sn1: ptr cdouble): cint {.stdcall, discardable,
    importc: "dlaev2_", dynlib: lapackName.}

proc laexc*(wantq: ptr cint; n: ptr cint; t: ptr cdouble; ldt: ptr cint; q: ptr cdouble;
            ldq: ptr cint; j1: ptr cint; n1: ptr cint; n2: ptr cint; work: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlaexc_", dynlib: lapackName.}

proc lag2*(a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
           safmin: ptr cdouble; scale1: ptr cdouble; scale2: ptr cdouble;
           wr1: ptr cdouble; wr2: ptr cdouble; wi: ptr cdouble): cint {.stdcall, discardable,
    importc: "dlag2_", dynlib: lapackName.}

proc lag2s*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; sa: ptr cfloat;
            ldsa: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dlag2s_",
    dynlib: lapackName.}

proc lags2*(upper: ptr cint; a1: ptr cdouble; a2: ptr cdouble; a3: ptr cdouble;
            b1: ptr cdouble; b2: ptr cdouble; b3: ptr cdouble; csu: ptr cdouble;
            snu: ptr cdouble; csv: ptr cdouble; snv: ptr cdouble; csq: ptr cdouble;
            snq: ptr cdouble): cint {.stdcall, discardable, importc: "dlags2_", dynlib: lapackName.}

proc lagtf*(n: ptr cint; a: ptr cdouble; lambda: ptr cdouble; b: ptr cdouble;
            c: ptr cdouble; tol: ptr cdouble; d: ptr cdouble; `in`: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlagtf_", dynlib: lapackName.}

proc lagtm*(trans: cstring; n: ptr cint; nrhs: ptr cint; alpha: ptr cdouble;
            dl: ptr cdouble; d: ptr cdouble; du: ptr cdouble; x: ptr cdouble; ldx: ptr cint;
            beta: ptr cdouble; b: ptr cdouble; ldb: ptr cint): cint {.stdcall, discardable,
    importc: "dlagtm_", dynlib: lapackName.}

proc lagts*(job: ptr cint; n: ptr cint; a: ptr cdouble; b: ptr cdouble; c: ptr cdouble;
            d: ptr cdouble; `in`: ptr cint; y: ptr cdouble; tol: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlagts_", dynlib: lapackName.}

proc lagv2*(a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
            alphar: ptr cdouble; alphai: ptr cdouble; beta: ptr cdouble;
            csl: ptr cdouble; snl: ptr cdouble; csr: ptr cdouble; snr: ptr cdouble): cint {.
    stdcall, discardable, importc: "dlagv2_", dynlib: lapackName.}

proc lahqr*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr cdouble; ldh: ptr cint; wr: ptr cdouble; wi: ptr cdouble;
            iloz: ptr cint; ihiz: ptr cint; z: ptr cdouble; ldz: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlahqr_", dynlib: lapackName.}

proc lahr2*(n: ptr cint; k: ptr cint; nb: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; t: ptr cdouble; ldt: ptr cint; y: ptr cdouble; ldy: ptr cint): cint {.
    stdcall, discardable, importc: "dlahr2_", dynlib: lapackName.}

proc lahrd*(n: ptr cint; k: ptr cint; nb: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; t: ptr cdouble; ldt: ptr cint; y: ptr cdouble; ldy: ptr cint): cint {.
    stdcall, discardable, importc: "dlahrd_", dynlib: lapackName.}

proc laic1*(job: ptr cint; j: ptr cint; x: ptr cdouble; sest: ptr cdouble; w: ptr cdouble;
            gamma: ptr cdouble; sestpr: ptr cdouble; s: ptr cdouble; c: ptr cdouble): cint {.
    stdcall, discardable, importc: "dlaic1_", dynlib: lapackName.}
proc laisnan*(din1: ptr cdouble; din2: ptr cdouble): cint {.stdcall, discardable,
    importc: "dlaisnan_", dynlib: lapackName.}

proc laln2*(ltrans: ptr cint; na: ptr cint; nw: ptr cint; smin: ptr cdouble;
            ca: ptr cdouble; a: ptr cdouble; lda: ptr cint; d1: ptr cdouble;
            d2: ptr cdouble; b: ptr cdouble; ldb: ptr cint; wr: ptr cdouble;
            wi: ptr cdouble; x: ptr cdouble; ldx: ptr cint; scale: ptr cdouble;
            xnorm: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dlaln2_",
    dynlib: lapackName.}

proc lals0*(icompq: ptr cint; nl: ptr cint; nr: ptr cint; sqre: ptr cint; nrhs: ptr cint;
            b: ptr cdouble; ldb: ptr cint; bx: ptr cdouble; ldbx: ptr cint; perm: ptr cint;
            givptr: ptr cint; givcol: ptr cint; ldgcol: ptr cint; givnum: ptr cdouble;
            ldgnum: ptr cint; poles: ptr cdouble; difl: ptr cdouble; difr: ptr cdouble;
            z: ptr cdouble; k: ptr cint; c: ptr cdouble; s: ptr cdouble; work: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlals0_", dynlib: lapackName.}

proc lalsa*(icompq: ptr cint; smlsiz: ptr cint; n: ptr cint; nrhs: ptr cint; b: ptr cdouble;
            ldb: ptr cint; bx: ptr cdouble; ldbx: ptr cint; u: ptr cdouble; ldu: ptr cint;
            vt: ptr cdouble; k: ptr cint; difl: ptr cdouble; difr: ptr cdouble;
            z: ptr cdouble; poles: ptr cdouble; givptr: ptr cint; givcol: ptr cint;
            ldgcol: ptr cint; perm: ptr cint; givnum: ptr cdouble; c: ptr cdouble;
            s: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlalsa_", dynlib: lapackName.}

proc lalsd*(uplo: cstring; smlsiz: ptr cint; n: ptr cint; nrhs: ptr cint; d: ptr cdouble;
            e: ptr cdouble; b: ptr cdouble; ldb: ptr cint; rcond: ptr cdouble;
            rank: ptr cint; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlalsd_", dynlib: lapackName.}

proc lamrg*(n1: ptr cint; n2: ptr cint; a: ptr cdouble; dtrd1: ptr cint; dtrd2: ptr cint;
            index: ptr cint): cint {.stdcall, discardable, importc: "dlamrg_", dynlib: lapackName.}
proc laneg*(n: ptr cint; d: ptr cdouble; lld: ptr cdouble; sigma: ptr cdouble;
            pivmin: ptr cdouble; r: ptr cint): cint {.stdcall, discardable, importc: "dlaneg_",
    dynlib: lapackName.}
proc langb*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; work: ptr cdouble): cdouble {.stdcall, discardable, importc: "dlangb_",
    dynlib: lapackName.}
proc lange*(norm: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "dlange_",
                                      dynlib: lapackName.}
proc langt*(norm: cstring; n: ptr cint; dl: ptr cdouble; d: ptr cdouble; du: ptr cdouble): cdouble {.
    stdcall, discardable, importc: "dlangt_", dynlib: lapackName.}
proc lanhs*(norm: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; work: ptr cdouble): cdouble {.
    stdcall, discardable, importc: "dlanhs_", dynlib: lapackName.}
proc lansb*(norm: cstring; uplo: cstring; n: ptr cint; k: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; work: ptr cdouble): cdouble {.stdcall, discardable, importc: "dlansb_",
    dynlib: lapackName.}
proc lansf*(norm: cstring; transr: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "dlansf_",
                                      dynlib: lapackName.}
proc lansp*(norm: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble; work: ptr cdouble): cdouble {.
    stdcall, discardable, importc: "dlansp_", dynlib: lapackName.}
proc lanst*(norm: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble): cdouble {.stdcall, discardable,
    importc: "dlanst_", dynlib: lapackName.}
proc lansy*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "dlansy_",
                                      dynlib: lapackName.}
proc lantb*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; k: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; work: ptr cdouble): cdouble {.stdcall, discardable,
    importc: "dlantb_", dynlib: lapackName.}
proc lantp*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; ap: ptr cdouble;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "dlantp_",
                                      dynlib: lapackName.}
proc lantr*(norm: cstring; uplo: cstring; diag: cstring; m: ptr cint; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; work: ptr cdouble): cdouble {.stdcall, discardable,
    importc: "dlantr_", dynlib: lapackName.}

proc lanv2*(a: ptr cdouble; b: ptr cdouble; c: ptr cdouble; d: ptr cdouble;
            rt1r: ptr cdouble; rt1i: ptr cdouble; rt2r: ptr cdouble; rt2i: ptr cdouble;
            cs: ptr cdouble; sn: ptr cdouble): cint {.stdcall, discardable, importc: "dlanv2_",
    dynlib: lapackName.}

proc lapll*(n: ptr cint; x: ptr cdouble; incx: ptr cint; y: ptr cdouble; incy: ptr cint;
            ssmin: ptr cdouble): cint {.stdcall, discardable, importc: "dlapll_", dynlib: lapackName.}

proc lapmt*(forwrd: ptr cint; m: ptr cint; n: ptr cint; x: ptr cdouble; ldx: ptr cint;
            k: ptr cint): cint {.stdcall, discardable, importc: "dlapmt_", dynlib: lapackName.}
proc lapy2*(x: ptr cdouble; y: ptr cdouble): cdouble {.stdcall, discardable, importc: "dlapy2_",
    dynlib: lapackName.}
proc lapy3*(x: ptr cdouble; y: ptr cdouble; z: ptr cdouble): cdouble {.stdcall, discardable,
    importc: "dlapy3_", dynlib: lapackName.}

proc laqgb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; r: ptr cdouble; c: ptr cdouble; rowcnd: ptr cdouble;
            colcnd: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.stdcall, discardable,
    importc: "dlaqgb_", dynlib: lapackName.}

proc laqge*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; r: ptr cdouble;
            c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble; amax: ptr cdouble;
            equed: cstring): cint {.stdcall, discardable, importc: "dlaqge_", dynlib: lapackName.}

proc laqp2*(m: ptr cint; n: ptr cint; offset: ptr cint; a: ptr cdouble; lda: ptr cint;
            jpvt: ptr cint; tau: ptr cdouble; vn1: ptr cdouble; vn2: ptr cdouble;
            work: ptr cdouble): cint {.stdcall, discardable, importc: "dlaqp2_", dynlib: lapackName.}

proc laqps*(m: ptr cint; n: ptr cint; offset: ptr cint; nb: ptr cint; kb: ptr cint;
            a: ptr cdouble; lda: ptr cint; jpvt: ptr cint; tau: ptr cdouble;
            vn1: ptr cdouble; vn2: ptr cdouble; auxv: ptr cdouble; f: ptr cdouble;
            ldf: ptr cint): cint {.stdcall, discardable, importc: "dlaqps_", dynlib: lapackName.}

proc laqr0*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr cdouble; ldh: ptr cint; wr: ptr cdouble; wi: ptr cdouble;
            iloz: ptr cint; ihiz: ptr cint; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlaqr0_", dynlib: lapackName.}

proc laqr1*(n: ptr cint; h: ptr cdouble; ldh: ptr cint; sr1: ptr cdouble; si1: ptr cdouble;
            sr2: ptr cdouble; si2: ptr cdouble; v: ptr cdouble): cint {.stdcall, discardable,
    importc: "dlaqr1_", dynlib: lapackName.}

proc laqr2*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ktop: ptr cint;
            kbot: ptr cint; nw: ptr cint; h: ptr cdouble; ldh: ptr cint; iloz: ptr cint;
            ihiz: ptr cint; z: ptr cdouble; ldz: ptr cint; ns: ptr cint; nd: ptr cint;
            sr: ptr cdouble; si: ptr cdouble; v: ptr cdouble; ldv: ptr cint; nh: ptr cint;
            t: ptr cdouble; ldt: ptr cint; nv: ptr cint; wv: ptr cdouble; ldwv: ptr cint;
            work: ptr cdouble; lwork: ptr cint): cint {.stdcall, discardable, importc: "dlaqr2_",
    dynlib: lapackName.}

proc laqr3*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ktop: ptr cint;
            kbot: ptr cint; nw: ptr cint; h: ptr cdouble; ldh: ptr cint; iloz: ptr cint;
            ihiz: ptr cint; z: ptr cdouble; ldz: ptr cint; ns: ptr cint; nd: ptr cint;
            sr: ptr cdouble; si: ptr cdouble; v: ptr cdouble; ldv: ptr cint; nh: ptr cint;
            t: ptr cdouble; ldt: ptr cint; nv: ptr cint; wv: ptr cdouble; ldwv: ptr cint;
            work: ptr cdouble; lwork: ptr cint): cint {.stdcall, discardable, importc: "dlaqr3_",
    dynlib: lapackName.}

proc laqr4*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr cdouble; ldh: ptr cint; wr: ptr cdouble; wi: ptr cdouble;
            iloz: ptr cint; ihiz: ptr cint; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlaqr4_", dynlib: lapackName.}

proc laqr5*(wantt: ptr cint; wantz: ptr cint; kacc22: ptr cint; n: ptr cint;
            ktop: ptr cint; kbot: ptr cint; nshfts: ptr cint; sr: ptr cdouble;
            si: ptr cdouble; h: ptr cdouble; ldh: ptr cint; iloz: ptr cint; ihiz: ptr cint;
            z: ptr cdouble; ldz: ptr cint; v: ptr cdouble; ldv: ptr cint; u: ptr cdouble;
            ldu: ptr cint; nv: ptr cint; wv: ptr cdouble; ldwv: ptr cint; nh: ptr cint;
            wh: ptr cdouble; ldwh: ptr cint): cint {.stdcall, discardable, importc: "dlaqr5_",
    dynlib: lapackName.}

proc laqsb*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble; ldab: ptr cint;
            s: ptr cdouble; scond: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.
    stdcall, discardable, importc: "dlaqsb_", dynlib: lapackName.}

proc laqsp*(uplo: cstring; n: ptr cint; ap: ptr cdouble; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.stdcall, discardable,
    importc: "dlaqsp_", dynlib: lapackName.}

proc laqsy*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.stdcall, discardable,
    importc: "dlaqsy_", dynlib: lapackName.}

proc laqtr*(ltran: ptr cint; lreal: ptr cint; n: ptr cint; t: ptr cdouble;
            ldt: ptr cint; b: ptr cdouble; w: ptr cdouble; scale: ptr cdouble;
            x: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlaqtr_", dynlib: lapackName.}

proc lar1v*(n: ptr cint; b1: ptr cint; bn: ptr cint; lambda: ptr cdouble; d: ptr cdouble;
            l: ptr cdouble; ld: ptr cdouble; lld: ptr cdouble; pivmin: ptr cdouble;
            gaptol: ptr cdouble; z: ptr cdouble; wantnc: ptr cint; negcnt: ptr cint;
            ztz: ptr cdouble; mingma: ptr cdouble; r: ptr cint; isuppz: ptr cint;
            nrminv: ptr cdouble; resid: ptr cdouble; rqcorr: ptr cdouble;
            work: ptr cdouble): cint {.stdcall, discardable, importc: "dlar1v_", dynlib: lapackName.}

proc lar2v*(n: ptr cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble; incx: ptr cint;
            c: ptr cdouble; s: ptr cdouble; incc: ptr cint): cint {.stdcall, discardable,
    importc: "dlar2v_", dynlib: lapackName.}

proc larf*(side: cstring; m: ptr cint; n: ptr cint; v: ptr cdouble; incv: ptr cint;
           tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint; work: ptr cdouble): cint {.
    stdcall, discardable, importc: "dlarf_", dynlib: lapackName.}

proc larfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; v: ptr cdouble; ldv: ptr cint;
            t: ptr cdouble; ldt: ptr cint; c: ptr cdouble; ldc: ptr cint; work: ptr cdouble;
            ldwork: ptr cint): cint {.stdcall, discardable, importc: "dlarfb_", dynlib: lapackName.}

proc larfg*(n: ptr cint; alpha: ptr cdouble; x: ptr cdouble; incx: ptr cint;
            tau: ptr cdouble): cint {.stdcall, discardable, importc: "dlarfg_", dynlib: lapackName.}

# proc larfp*(n: ptr cint; alpha: ptr cdouble; x: ptr cdouble; incx: ptr cint;
#             tau: ptr cdouble): cint {.stdcall, discardable, importc: "dlarfp_", dynlib: lapackName.}

proc larft*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint; v: ptr cdouble;
            ldv: ptr cint; tau: ptr cdouble; t: ptr cdouble; ldt: ptr cint): cint {.stdcall, discardable,
    importc: "dlarft_", dynlib: lapackName.}

proc larfx*(side: cstring; m: ptr cint; n: ptr cint; v: ptr cdouble; tau: ptr cdouble;
            c: ptr cdouble; ldc: ptr cint; work: ptr cdouble): cint {.stdcall, discardable,
    importc: "dlarfx_", dynlib: lapackName.}

proc largv*(n: ptr cint; x: ptr cdouble; incx: ptr cint; y: ptr cdouble; incy: ptr cint;
            c: ptr cdouble; incc: ptr cint): cint {.stdcall, discardable, importc: "dlargv_",
    dynlib: lapackName.}

proc larnv*(idist: ptr cint; iseed: ptr cint; n: ptr cint; x: ptr cdouble): cint {.stdcall, discardable,
    importc: "dlarnv_", dynlib: lapackName.}

proc larra*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; e2: ptr cdouble;
            spltol: ptr cdouble; tnrm: ptr cdouble; nsplit: ptr cint; isplit: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlarra_", dynlib: lapackName.}

proc larrb*(n: ptr cint; d: ptr cdouble; lld: ptr cdouble; ifirst: ptr cint;
            ilast: ptr cint; rtol1: ptr cdouble; rtol2: ptr cdouble; offset: ptr cint;
            w: ptr cdouble; wgap: ptr cdouble; werr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; pivmin: ptr cdouble; spdiam: ptr cdouble; twist: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlarrb_", dynlib: lapackName.}

proc larrc*(jobt: cstring; n: ptr cint; vl: ptr cdouble; vu: ptr cdouble; d: ptr cdouble;
            e: ptr cdouble; pivmin: ptr cdouble; eigcnt: ptr cint; lcnt: ptr cint;
            rcnt: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dlarrc_",
    dynlib: lapackName.}

proc larrd*(range: cstring; order: cstring; n: ptr cint; vl: ptr cdouble; vu: ptr cdouble;
            il: ptr cint; iu: ptr cint; gers: ptr cdouble; reltol: ptr cdouble;
            d: ptr cdouble; e: ptr cdouble; e2: ptr cdouble; pivmin: ptr cdouble;
            nsplit: ptr cint; isplit: ptr cint; m: ptr cint; w: ptr cdouble;
            werr: ptr cdouble; wl: ptr cdouble; wu: ptr cdouble; iblock: ptr cint;
            indexw: ptr cint; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlarrd_", dynlib: lapackName.}

proc larre*(range: cstring; n: ptr cint; vl: ptr cdouble; vu: ptr cdouble; il: ptr cint;
            iu: ptr cint; d: ptr cdouble; e: ptr cdouble; e2: ptr cdouble;
            rtol1: ptr cdouble; rtol2: ptr cdouble; spltol: ptr cdouble;
            nsplit: ptr cint; isplit: ptr cint; m: ptr cint; w: ptr cdouble;
            werr: ptr cdouble; wgap: ptr cdouble; iblock: ptr cint; indexw: ptr cint;
            gers: ptr cdouble; pivmin: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlarre_", dynlib: lapackName.}

proc larrf*(n: ptr cint; d: ptr cdouble; l: ptr cdouble; ld: ptr cdouble; clstrt: ptr cint;
            clend: ptr cint; w: ptr cdouble; wgap: ptr cdouble; werr: ptr cdouble;
            spdiam: ptr cdouble; clgapl: ptr cdouble; clgapr: ptr cdouble;
            pivmin: ptr cdouble; sigma: ptr cdouble; dplus: ptr cdouble;
            lplus: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlarrf_", dynlib: lapackName.}

proc larrj*(n: ptr cint; d: ptr cdouble; e2: ptr cdouble; ifirst: ptr cint; ilast: ptr cint;
            rtol: ptr cdouble; offset: ptr cint; w: ptr cdouble; werr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; pivmin: ptr cdouble; spdiam: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlarrj_", dynlib: lapackName.}

proc larrk*(n: ptr cint; iw: ptr cint; gl: ptr cdouble; gu: ptr cdouble; d: ptr cdouble;
            e2: ptr cdouble; pivmin: ptr cdouble; reltol: ptr cdouble; w: ptr cdouble;
            werr: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dlarrk_",
    dynlib: lapackName.}

proc larrr*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlarrr_", dynlib: lapackName.}

proc larrv*(n: ptr cint; vl: ptr cdouble; vu: ptr cdouble; d: ptr cdouble; l: ptr cdouble;
            pivmin: ptr cdouble; isplit: ptr cint; m: ptr cint; dol: ptr cint;
            dou: ptr cint; minrgp: ptr cdouble; rtol1: ptr cdouble; rtol2: ptr cdouble;
            w: ptr cdouble; werr: ptr cdouble; wgap: ptr cdouble; iblock: ptr cint;
            indexw: ptr cint; gers: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlarrv_", dynlib: lapackName.}

# proc larscl2*(m: ptr cint; n: ptr cint; d: ptr cdouble; x: ptr cdouble; ldx: ptr cint): cint {.
#     stdcall, discardable, importc: "dlarscl2_", dynlib: lapackName.}

proc lartg*(f: ptr cdouble; g: ptr cdouble; cs: ptr cdouble; sn: ptr cdouble; r: ptr cdouble): cint {.
    stdcall, discardable, importc: "dlartg_", dynlib: lapackName.}

proc lartv*(n: ptr cint; x: ptr cdouble; incx: ptr cint; y: ptr cdouble; incy: ptr cint;
            c: ptr cdouble; s: ptr cdouble; incc: ptr cint): cint {.stdcall, discardable,
    importc: "dlartv_", dynlib: lapackName.}

proc laruv*(iseed: ptr cint; n: ptr cint; x: ptr cdouble): cint {.stdcall, discardable,
    importc: "dlaruv_", dynlib: lapackName.}

proc larz*(side: cstring; m: ptr cint; n: ptr cint; l: ptr cint; v: ptr cdouble;
           incv: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
           work: ptr cdouble): cint {.stdcall, discardable, importc: "dlarz_", dynlib: lapackName.}

proc larzb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; l: ptr cint; v: ptr cdouble; ldv: ptr cint;
            t: ptr cdouble; ldt: ptr cint; c: ptr cdouble; ldc: ptr cint; work: ptr cdouble;
            ldwork: ptr cint): cint {.stdcall, discardable, importc: "dlarzb_", dynlib: lapackName.}

proc larzt*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint; v: ptr cdouble;
            ldv: ptr cint; tau: ptr cdouble; t: ptr cdouble; ldt: ptr cint): cint {.stdcall, discardable,
    importc: "dlarzt_", dynlib: lapackName.}

proc las2*(f: ptr cdouble; g: ptr cdouble; h: ptr cdouble; ssmin: ptr cdouble;
           ssmax: ptr cdouble): cint {.stdcall, discardable, importc: "dlas2_", dynlib: lapackName.}

proc lascl*(`type`: cstring; kl: ptr cint; ku: ptr cint; cfrom: ptr cdouble;
            cto: ptr cdouble; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlascl_", dynlib: lapackName.}

# proc lascl2*(m: ptr cint; n: ptr cint; d: ptr cdouble; x: ptr cdouble; ldx: ptr cint): cint {.
#     stdcall, discardable, importc: "dlascl2_", dynlib: lapackName.}

proc lasd0*(n: ptr cint; sqre: ptr cint; d: ptr cdouble; e: ptr cdouble; u: ptr cdouble;
            ldu: ptr cint; vt: ptr cdouble; ldvt: ptr cint; smlsiz: ptr cint;
            iwork: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlasd0_", dynlib: lapackName.}

proc lasd1*(nl: ptr cint; nr: ptr cint; sqre: ptr cint; d: ptr cdouble; alpha: ptr cdouble;
            beta: ptr cdouble; u: ptr cdouble; ldu: ptr cint; vt: ptr cdouble;
            ldvt: ptr cint; idxq: ptr cint; iwork: ptr cint; work: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlasd1_", dynlib: lapackName.}

proc lasd2*(nl: ptr cint; nr: ptr cint; sqre: ptr cint; k: ptr cint; d: ptr cdouble;
            z: ptr cdouble; alpha: ptr cdouble; beta: ptr cdouble; u: ptr cdouble;
            ldu: ptr cint; vt: ptr cdouble; ldvt: ptr cint; dsigma: ptr cdouble;
            u2: ptr cdouble; ldu2: ptr cint; vt2: ptr cdouble; ldvt2: ptr cint;
            idxp: ptr cint; idx: ptr cint; idxc: ptr cint; idxq: ptr cint; coltyp: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlasd2_", dynlib: lapackName.}

proc lasd3*(nl: ptr cint; nr: ptr cint; sqre: ptr cint; k: ptr cint; d: ptr cdouble;
            q: ptr cdouble; ldq: ptr cint; dsigma: ptr cdouble; u: ptr cdouble;
            ldu: ptr cint; u2: ptr cdouble; ldu2: ptr cint; vt: ptr cdouble; ldvt: ptr cint;
            vt2: ptr cdouble; ldvt2: ptr cint; idxc: ptr cint; ctot: ptr cint;
            z: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dlasd3_",
    dynlib: lapackName.}

proc lasd4*(n: ptr cint; i: ptr cint; d: ptr cdouble; z: ptr cdouble; delta: ptr cdouble;
            rho: ptr cdouble; sigma: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlasd4_", dynlib: lapackName.}

proc lasd5*(i: ptr cint; d: ptr cdouble; z: ptr cdouble; delta: ptr cdouble;
            rho: ptr cdouble; dsigma: ptr cdouble; work: ptr cdouble): cint {.stdcall, discardable,
    importc: "dlasd5_", dynlib: lapackName.}

proc lasd6*(icompq: ptr cint; nl: ptr cint; nr: ptr cint; sqre: ptr cint; d: ptr cdouble;
            vf: ptr cdouble; vl: ptr cdouble; alpha: ptr cdouble; beta: ptr cdouble;
            idxq: ptr cint; perm: ptr cint; givptr: ptr cint; givcol: ptr cint;
            ldgcol: ptr cint; givnum: ptr cdouble; ldgnum: ptr cint; poles: ptr cdouble;
            difl: ptr cdouble; difr: ptr cdouble; z: ptr cdouble; k: ptr cint;
            c: ptr cdouble; s: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlasd6_", dynlib: lapackName.}

proc lasd7*(icompq: ptr cint; nl: ptr cint; nr: ptr cint; sqre: ptr cint; k: ptr cint;
            d: ptr cdouble; z: ptr cdouble; zw: ptr cdouble; vf: ptr cdouble;
            vfw: ptr cdouble; vl: ptr cdouble; vlw: ptr cdouble; alpha: ptr cdouble;
            beta: ptr cdouble; dsigma: ptr cdouble; idx: ptr cint; idxp: ptr cint;
            idxq: ptr cint; perm: ptr cint; givptr: ptr cint; givcol: ptr cint;
            ldgcol: ptr cint; givnum: ptr cdouble; ldgnum: ptr cint; c: ptr cdouble;
            s: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dlasd7_",
    dynlib: lapackName.}

proc lasd8*(icompq: ptr cint; k: ptr cint; d: ptr cdouble; z: ptr cdouble; vf: ptr cdouble;
            vl: ptr cdouble; difl: ptr cdouble; difr: ptr cdouble; lddifr: ptr cint;
            dsigma: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlasd8_", dynlib: lapackName.}

proc lasda*(icompq: ptr cint; smlsiz: ptr cint; n: ptr cint; sqre: ptr cint; d: ptr cdouble;
            e: ptr cdouble; u: ptr cdouble; ldu: ptr cint; vt: ptr cdouble; k: ptr cint;
            difl: ptr cdouble; difr: ptr cdouble; z: ptr cdouble; poles: ptr cdouble;
            givptr: ptr cint; givcol: ptr cint; ldgcol: ptr cint; perm: ptr cint;
            givnum: ptr cdouble; c: ptr cdouble; s: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dlasda_",
    dynlib: lapackName.}

proc lasdq*(uplo: cstring; sqre: ptr cint; n: ptr cint; ncvt: ptr cint; nru: ptr cint;
            ncc: ptr cint; d: ptr cdouble; e: ptr cdouble; vt: ptr cdouble; ldvt: ptr cint;
            u: ptr cdouble; ldu: ptr cint; c: ptr cdouble; ldc: ptr cint; work: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlasdq_", dynlib: lapackName.}

proc lasdt*(n: ptr cint; lvl: ptr cint; nd: ptr cint; inode: ptr cint; ndiml: ptr cint;
            ndimr: ptr cint; msub: ptr cint): cint {.stdcall, discardable, importc: "dlasdt_",
    dynlib: lapackName.}

proc laset*(uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr cdouble; beta: ptr cdouble;
            a: ptr cdouble; lda: ptr cint): cint {.stdcall, discardable, importc: "dlaset_",
    dynlib: lapackName.}

proc lasq1*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlasq1_", dynlib: lapackName.}

proc lasq2*(n: ptr cint; z: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlasq2_", dynlib: lapackName.}

proc lasq3*(i0: ptr cint; n0: ptr cint; z: ptr cdouble; pp: ptr cint; dmin: ptr cdouble;
            sigma: ptr cdouble; desig: ptr cdouble; qmax: ptr cdouble; nfail: ptr cint;
            iter: ptr cint; ndiv: ptr cint; ieee: ptr cint; ttype: ptr cint;
            dmin1: ptr cdouble; dmin2: ptr cdouble; dn: ptr cdouble; dn1: ptr cdouble;
            dn2: ptr cdouble; g: ptr cdouble; tau: ptr cdouble): cint {.stdcall, discardable,
    importc: "dlasq3_", dynlib: lapackName.}

proc lasq4*(i0: ptr cint; n0: ptr cint; z: ptr cdouble; pp: ptr cint; n0in: ptr cint;
            dmin: ptr cdouble; dmin1: ptr cdouble; dmin2: ptr cdouble; dn: ptr cdouble;
            dn1: ptr cdouble; dn2: ptr cdouble; tau: ptr cdouble; ttype: ptr cint;
            g: ptr cdouble): cint {.stdcall, discardable, importc: "dlasq4_", dynlib: lapackName.}

proc lasq5*(i0: ptr cint; n0: ptr cint; z: ptr cdouble; pp: ptr cint; tau: ptr cdouble;
            dmin: ptr cdouble; dmin1: ptr cdouble; dmin2: ptr cdouble; dn: ptr cdouble;
            dnm1: ptr cdouble; dnm2: ptr cdouble; ieee: ptr cint): cint {.stdcall, discardable,
    importc: "dlasq5_", dynlib: lapackName.}

proc lasq6*(i0: ptr cint; n0: ptr cint; z: ptr cdouble; pp: ptr cint; dmin: ptr cdouble;
            dmin1: ptr cdouble; dmin2: ptr cdouble; dn: ptr cdouble; dnm1: ptr cdouble;
            dnm2: ptr cdouble): cint {.stdcall, discardable, importc: "dlasq6_", dynlib: lapackName.}

proc lasr*(side: cstring; pivot: cstring; direct: cstring; m: ptr cint; n: ptr cint;
           c: ptr cdouble; s: ptr cdouble; a: ptr cdouble; lda: ptr cint): cint {.stdcall, discardable,
    importc: "dlasr_", dynlib: lapackName.}

proc lasrt*(id: cstring; n: ptr cint; d: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlasrt_", dynlib: lapackName.}

proc lassq*(n: ptr cint; x: ptr cdouble; incx: ptr cint; scale: ptr cdouble;
            sumsq: ptr cdouble): cint {.stdcall, discardable, importc: "dlassq_", dynlib: lapackName.}

proc lasv2*(f: ptr cdouble; g: ptr cdouble; h: ptr cdouble; ssmin: ptr cdouble;
            ssmax: ptr cdouble; snr: ptr cdouble; csr: ptr cdouble; snl: ptr cdouble;
            csl: ptr cdouble): cint {.stdcall, discardable, importc: "dlasv2_", dynlib: lapackName.}

proc laswp*(n: ptr cint; a: ptr cdouble; lda: ptr cint; k1: ptr cint; k2: ptr cint;
            ipiv: ptr cint; incx: ptr cint): cint {.stdcall, discardable, importc: "dlaswp_",
    dynlib: lapackName.}

proc lasy2*(ltranl: ptr cint; ltranr: ptr cint; isgn: ptr cint; n1: ptr cint;
            n2: ptr cint; tl: ptr cdouble; ldtl: ptr cint; tr: ptr cdouble; ldtr: ptr cint;
            b: ptr cdouble; ldb: ptr cint; scale: ptr cdouble; x: ptr cdouble;
            ldx: ptr cint; xnorm: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlasy2_", dynlib: lapackName.}

proc lasyf*(uplo: cstring; n: ptr cint; nb: ptr cint; kb: ptr cint; a: ptr cdouble;
            lda: ptr cint; ipiv: ptr cint; w: ptr cdouble; ldw: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlasyf_", dynlib: lapackName.}

proc lat2s*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; sa: ptr cfloat;
            ldsa: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dlat2s_",
    dynlib: lapackName.}

proc latbs*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            kd: ptr cint; ab: ptr cdouble; ldab: ptr cint; x: ptr cdouble;
            scale: ptr cdouble; cnorm: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dlatbs_", dynlib: lapackName.}

proc latdf*(ijob: ptr cint; n: ptr cint; z: ptr cdouble; ldz: ptr cint; rhs: ptr cdouble;
            rdsum: ptr cdouble; rdscal: ptr cdouble; ipiv: ptr cint; jpiv: ptr cint): cint {.
    stdcall, discardable, importc: "dlatdf_", dynlib: lapackName.}

proc latps*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            ap: ptr cdouble; x: ptr cdouble; scale: ptr cdouble; cnorm: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dlatps_", dynlib: lapackName.}

proc latrd*(uplo: cstring; n: ptr cint; nb: ptr cint; a: ptr cdouble; lda: ptr cint;
            e: ptr cdouble; tau: ptr cdouble; w: ptr cdouble; ldw: ptr cint): cint {.stdcall, discardable,
    importc: "dlatrd_", dynlib: lapackName.}

proc latrs*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; x: ptr cdouble; scale: ptr cdouble;
            cnorm: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dlatrs_",
    dynlib: lapackName.}

proc latrz*(m: ptr cint; n: ptr cint; l: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble): cint {.stdcall, discardable, importc: "dlatrz_",
    dynlib: lapackName.}

proc latzm*(side: cstring; m: ptr cint; n: ptr cint; v: ptr cdouble; incv: ptr cint;
            tau: ptr cdouble; c1: ptr cdouble; c2: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble): cint {.stdcall, discardable, importc: "dlatzm_", dynlib: lapackName.}

proc lauu2*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlauu2_", dynlib: lapackName.}

proc lauum*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dlauum_", dynlib: lapackName.}

proc opgtr*(uplo: cstring; n: ptr cint; ap: ptr cdouble; tau: ptr cdouble; q: ptr cdouble;
            ldq: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dopgtr_", dynlib: lapackName.}

proc opmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            ap: ptr cdouble; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dopmtr_",
    dynlib: lapackName.}

proc org2l*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dorg2l_", dynlib: lapackName.}

proc org2r*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dorg2r_", dynlib: lapackName.}

proc orgbr*(vect: cstring; m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble;
            lda: ptr cint; tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dorgbr_", dynlib: lapackName.}

proc orghr*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dorghr_", dynlib: lapackName.}

proc orgl2*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dorgl2_", dynlib: lapackName.}

proc orglq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dorglq_", dynlib: lapackName.}

proc orgql*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dorgql_", dynlib: lapackName.}

proc orgqr*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dorgqr_", dynlib: lapackName.}

proc orgr2*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dorgr2_", dynlib: lapackName.}

proc orgrq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dorgrq_", dynlib: lapackName.}

proc orgtr*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dorgtr_", dynlib: lapackName.}

proc orm2l*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dorm2l_",
    dynlib: lapackName.}

proc orm2r*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dorm2r_",
    dynlib: lapackName.}

proc ormbr*(vect: cstring; side: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            k: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble;
            ldc: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dormbr_", dynlib: lapackName.}

proc ormhr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble;
            ldc: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dormhr_", dynlib: lapackName.}

proc orml2*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dorml2_",
    dynlib: lapackName.}

proc ormlq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dormlq_", dynlib: lapackName.}

proc ormql*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dormql_", dynlib: lapackName.}

proc ormqr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dormqr_", dynlib: lapackName.}

proc ormr2*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dormr2_",
    dynlib: lapackName.}

proc ormr3*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble;
            ldc: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dormr3_", dynlib: lapackName.}

proc ormrq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dormrq_", dynlib: lapackName.}

proc ormrz*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble;
            ldc: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dormrz_", dynlib: lapackName.}

proc ormtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dormtr_", dynlib: lapackName.}

proc pbcon*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble; ldab: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dpbcon_", dynlib: lapackName.}

proc pbequ*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble; ldab: ptr cint;
            s: ptr cdouble; scond: ptr cdouble; amax: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpbequ_", dynlib: lapackName.}

proc pbrfs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; afb: ptr cdouble; ldafb: ptr cint; b: ptr cdouble;
            ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpbrfs_", dynlib: lapackName.}

proc pbstf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dpbstf_", dynlib: lapackName.}

proc pbsv*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cdouble;
           ldab: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dpbsv_", dynlib: lapackName.}

proc pbsvx*(fact: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; afb: ptr cdouble; ldafb: ptr cint;
            equed: cstring; s: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dpbsvx_", dynlib: lapackName.}

proc pbtf2*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dpbtf2_", dynlib: lapackName.}

proc pbtrf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dpbtrf_", dynlib: lapackName.}

proc pbtrs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dpbtrs_", dynlib: lapackName.}

proc pftrf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpftrf_", dynlib: lapackName.}

proc pftri*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpftri_", dynlib: lapackName.}

proc pftrs*(transr: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
            b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dpftrs_", dynlib: lapackName.}

proc pocon*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpocon_", dynlib: lapackName.}

proc poequ*(n: ptr cint; a: ptr cdouble; lda: ptr cint; s: ptr cdouble; scond: ptr cdouble;
            amax: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dpoequ_",
    dynlib: lapackName.}

proc poequb*(n: ptr cint; a: ptr cdouble; lda: ptr cint; s: ptr cdouble; scond: ptr cdouble;
             amax: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dpoequb_",
    dynlib: lapackName.}

proc porfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            af: ptr cdouble; ldaf: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dporfs_",
    dynlib: lapackName.}

# proc porfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
#              lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; s: ptr cdouble; b: ptr cdouble;
#              ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; rcond: ptr cdouble;
#              berr: ptr cdouble; nErrBnds: ptr cint; errBndsNorm: ptr cdouble;
#              errBndsComp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
#              work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
#     importc: "dporfsx_", dynlib: lapackName.}

proc posv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
           b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dposv_", dynlib: lapackName.}

proc posvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
            lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; equed: cstring; s: ptr cdouble;
            b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dposvx_",
    dynlib: lapackName.}

# proc posvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
#              lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; equed: cstring;
#              s: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
#              rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
#              nErrBnds: ptr cint; errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble;
#              nparams: ptr cint; params: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
#              info: ptr cint): cint {.stdcall, discardable, importc: "dposvxx_", dynlib: lapackName.}

proc potf2*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpotf2_", dynlib: lapackName.}

proc potrf*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpotrf_", dynlib: lapackName.}

proc potri*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpotri_", dynlib: lapackName.}

proc potrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dpotrs_", dynlib: lapackName.}

proc ppcon*(uplo: cstring; n: ptr cint; ap: ptr cdouble; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dppcon_", dynlib: lapackName.}

proc ppequ*(uplo: cstring; n: ptr cint; ap: ptr cdouble; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dppequ_", dynlib: lapackName.}

proc pprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; afp: ptr cdouble;
            b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpprfs_", dynlib: lapackName.}

proc ppsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; b: ptr cdouble;
           ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dppsv_",
    dynlib: lapackName.}

proc ppsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble;
            afp: ptr cdouble; equed: cstring; s: ptr cdouble; b: ptr cdouble;
            ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dppsvx_", dynlib: lapackName.}

proc pptrf*(uplo: cstring; n: ptr cint; ap: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dpptrf_", dynlib: lapackName.}

proc pptri*(uplo: cstring; n: ptr cint; ap: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dpptri_", dynlib: lapackName.}

proc pptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; b: ptr cdouble;
            ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dpptrs_",
    dynlib: lapackName.}

proc pstf2*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; piv: ptr cint;
            rank: ptr cint; tol: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpstf2_", dynlib: lapackName.}

proc pstrf*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; piv: ptr cint;
            rank: ptr cint; tol: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dpstrf_", dynlib: lapackName.}

proc ptcon*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dptcon_", dynlib: lapackName.}

proc pteqr*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dpteqr_", dynlib: lapackName.}

proc ptrfs*(n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr cdouble; df: ptr cdouble;
            ef: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dptrfs_", dynlib: lapackName.}

proc ptsv*(n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr cdouble; b: ptr cdouble;
           ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dptsv_",
    dynlib: lapackName.}

proc ptsvx*(fact: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr cdouble;
            df: ptr cdouble; ef: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dptsvx_",
    dynlib: lapackName.}

proc pttrf*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dpttrf_", dynlib: lapackName.}

proc pttrs*(n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr cdouble; b: ptr cdouble;
            ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dpttrs_",
    dynlib: lapackName.}

proc ptts2*(n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr cdouble; b: ptr cdouble;
            ldb: ptr cint): cint {.stdcall, discardable, importc: "dptts2_", dynlib: lapackName.}

proc rscl*(n: ptr cint; sa: ptr cdouble; sx: ptr cdouble; incx: ptr cint): cint {.stdcall, discardable,
    importc: "drscl_", dynlib: lapackName.}

proc bev*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble;
           ldab: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint; work: ptr cdouble;
           info: ptr cint): cint {.stdcall, discardable, importc: "dsbev_", dynlib: lapackName.}

proc bevd*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dsbevd_", dynlib: lapackName.}

proc bevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; q: ptr cdouble; ldq: ptr cint; vl: ptr cdouble;
            vu: ptr cdouble; il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint;
            w: ptr cdouble; z: ptr cdouble; ldz: ptr cint; work: ptr cdouble;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsbevx_", dynlib: lapackName.}

proc bgst*(vect: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; bb: ptr cdouble; ldbb: ptr cint;
            x: ptr cdouble; ldx: ptr cint; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dsbgst_", dynlib: lapackName.}

proc bgv*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
           ab: ptr cdouble; ldab: ptr cint; bb: ptr cdouble; ldbb: ptr cint; w: ptr cdouble;
           z: ptr cdouble; ldz: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsbgv_", dynlib: lapackName.}

proc bgvd*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; bb: ptr cdouble; ldbb: ptr cint;
            w: ptr cdouble; z: ptr cdouble; ldz: ptr cint; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dsbgvd_", dynlib: lapackName.}

proc bgvx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ka: ptr cint;
            kb: ptr cint; ab: ptr cdouble; ldab: ptr cint; bb: ptr cdouble; ldbb: ptr cint;
            q: ptr cdouble; ldq: ptr cint; vl: ptr cdouble; vu: ptr cdouble; il: ptr cint;
            iu: ptr cint; abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dsbgvx_", dynlib: lapackName.}

proc btrd*(vect: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; d: ptr cdouble; e: ptr cdouble; q: ptr cdouble; ldq: ptr cint;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dsbtrd_",
    dynlib: lapackName.}

proc frk*(transr: cstring; uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint;
           alpha: ptr cdouble; a: ptr cdouble; lda: ptr cint; beta: ptr cdouble;
           c: ptr cdouble): cint {.stdcall, discardable, importc: "dsfrk_", dynlib: lapackName.}

proc gesv*(n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; work: ptr cdouble;
            swork: ptr cfloat; iter: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsgesv_", dynlib: lapackName.}

proc pcon*(uplo: cstring; n: ptr cint; ap: ptr cdouble; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dspcon_", dynlib: lapackName.}

proc pev*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble; w: ptr cdouble;
           z: ptr cdouble; ldz: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dspev_", dynlib: lapackName.}

proc pevd*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble; w: ptr cdouble;
            z: ptr cdouble; ldz: ptr cint; work: ptr cdouble; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dspevd_", dynlib: lapackName.}

proc pevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dspevx_", dynlib: lapackName.}

proc pgst*(itype: ptr cint; uplo: cstring; n: ptr cint; ap: ptr cdouble; bp: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dspgst_", dynlib: lapackName.}

proc pgv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble;
           bp: ptr cdouble; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
           work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dspgv_",
    dynlib: lapackName.}

proc pgvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble;
            bp: ptr cdouble; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dspgvd_", dynlib: lapackName.}

proc pgvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            ap: ptr cdouble; bp: ptr cdouble; vl: ptr cdouble; vu: ptr cdouble;
            il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint; w: ptr cdouble;
            z: ptr cdouble; ldz: ptr cint; work: ptr cdouble; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dspgvx_",
    dynlib: lapackName.}

proc posv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; work: ptr cdouble;
            swork: ptr cfloat; iter: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsposv_", dynlib: lapackName.}

proc prfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; afp: ptr cdouble;
            ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dsprfs_", dynlib: lapackName.}

proc psv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; ipiv: ptr cint;
           b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dspsv_", dynlib: lapackName.}

proc psvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble;
            afp: ptr cdouble; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dspsvx_", dynlib: lapackName.}

proc ptrd*(uplo: cstring; n: ptr cint; ap: ptr cdouble; d: ptr cdouble; e: ptr cdouble;
            tau: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dsptrd_",
    dynlib: lapackName.}

proc ptrf*(uplo: cstring; n: ptr cint; ap: ptr cdouble; ipiv: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dsptrf_", dynlib: lapackName.}

proc ptri*(uplo: cstring; n: ptr cint; ap: ptr cdouble; ipiv: ptr cint; work: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dsptri_", dynlib: lapackName.}

proc ptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; ipiv: ptr cint;
            b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsptrs_", dynlib: lapackName.}

proc tebz*(range: cstring; order: cstring; n: ptr cint; vl: ptr cdouble; vu: ptr cdouble;
            il: ptr cint; iu: ptr cint; abstol: ptr cdouble; d: ptr cdouble; e: ptr cdouble;
            m: ptr cint; nsplit: ptr cint; w: ptr cdouble; iblock: ptr cint;
            isplit: ptr cint; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dstebz_", dynlib: lapackName.}

proc tedc*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dstedc_",
    dynlib: lapackName.}

proc tegr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dstegr_",
    dynlib: lapackName.}

proc tein*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; m: ptr cint; w: ptr cdouble;
            iblock: ptr cint; isplit: ptr cint; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dstein_", dynlib: lapackName.}

proc temr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint; m: ptr cint;
            w: ptr cdouble; z: ptr cdouble; ldz: ptr cint; nzc: ptr cint; isuppz: ptr cint;
            tryrac: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dstemr_",
    dynlib: lapackName.}

proc teqr*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsteqr_", dynlib: lapackName.}

proc terf*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsterf_", dynlib: lapackName.}

proc tev*(jobz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr cdouble;
           ldz: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dstev_", dynlib: lapackName.}

proc tevd*(jobz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dstevd_",
    dynlib: lapackName.}

proc tevr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dstevr_",
    dynlib: lapackName.}

proc tevx*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dstevx_", dynlib: lapackName.}

proc ycon*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dsycon_", dynlib: lapackName.}

proc yequb*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; s: ptr cdouble;
             scond: ptr cdouble; amax: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dsyequb_", dynlib: lapackName.}

proc yev*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
           w: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dsyev_", dynlib: lapackName.}

proc yevd*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            w: ptr cdouble; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dsyevd_",
    dynlib: lapackName.}

proc yevr*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dsyevr_",
    dynlib: lapackName.}

proc yevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dsyevx_", dynlib: lapackName.}

proc ygs2*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsygs2_", dynlib: lapackName.}

proc ygst*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsygst_", dynlib: lapackName.}

proc ygv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble;
           lda: ptr cint; b: ptr cdouble; ldb: ptr cint; w: ptr cdouble; work: ptr cdouble;
           lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dsygv_",
    dynlib: lapackName.}

proc ygvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; b: ptr cdouble; ldb: ptr cint; w: ptr cdouble; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dsygvd_", dynlib: lapackName.}

proc ygvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; vl: ptr cdouble;
            vu: ptr cdouble; il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint;
            w: ptr cdouble; z: ptr cdouble; ldz: ptr cint; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dsygvx_", dynlib: lapackName.}

proc yrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint;
            x: ptr cdouble; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsyrfs_", dynlib: lapackName.}

# proc yrfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
#              lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; s: ptr cdouble;
#              b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
#              rcond: ptr cdouble; berr: ptr cdouble; nErrBnds: ptr cint;
#              errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble; nparams: ptr cint;
#              params: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
#     stdcall, discardable, importc: "dsyrfsx_", dynlib: lapackName.}

proc ysv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
           ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; work: ptr cdouble;
           lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dsysv_",
    dynlib: lapackName.}

proc ysvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
            lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; b: ptr cdouble;
            ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; lwork: ptr cint;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dsysvx_",
    dynlib: lapackName.}

# proc ysvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
#              lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
#              s: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
#              rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
#              nErrBnds: ptr cint; errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble;
#              nparams: ptr cint; params: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
#              info: ptr cint): cint {.stdcall, discardable, importc: "dsysvxx_", dynlib: lapackName.}

proc ytd2*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; d: ptr cdouble;
            e: ptr cdouble; tau: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsytd2_", dynlib: lapackName.}

proc ytf2*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dsytf2_", dynlib: lapackName.}

proc ytrd*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; d: ptr cdouble;
            e: ptr cdouble; tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dsytrd_", dynlib: lapackName.}

proc ytrf*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsytrf_", dynlib: lapackName.}

proc ytri*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dsytri_",
    dynlib: lapackName.}

proc ytrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dsytrs_", dynlib: lapackName.}

proc tbcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; rcond: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dtbcon_",
    dynlib: lapackName.}

proc tbrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr cdouble; ldab: ptr cint; b: ptr cdouble; ldb: ptr cint;
            x: ptr cdouble; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dtbrfs_", dynlib: lapackName.}

proc tbtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr cdouble; ldab: ptr cint; b: ptr cdouble; ldb: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dtbtrs_", dynlib: lapackName.}

proc tfsm*(transr: cstring; side: cstring; uplo: cstring; trans: cstring; diag: cstring;
           m: ptr cint; n: ptr cint; alpha: ptr cdouble; a: ptr cdouble; b: ptr cdouble;
           ldb: ptr cint): cint {.stdcall, discardable, importc: "dtfsm_", dynlib: lapackName.}

proc tftri*(transr: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dtftri_", dynlib: lapackName.}

proc tfttp*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr cdouble;
            ap: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dtfttp_",
    dynlib: lapackName.}

proc tfttr*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr cdouble; a: ptr cdouble;
            lda: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dtfttr_",
    dynlib: lapackName.}

proc tgevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            s: ptr cdouble; lds: ptr cint; p: ptr cdouble; ldp: ptr cint; vl: ptr cdouble;
            ldvl: ptr cint; vr: ptr cdouble; ldvr: ptr cint; mm: ptr cint; m: ptr cint;
            work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dtgevc_",
    dynlib: lapackName.}

proc tgex2*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; b: ptr cdouble; ldb: ptr cint; q: ptr cdouble; ldq: ptr cint;
            z: ptr cdouble; ldz: ptr cint; j1: ptr cint; n1: ptr cint; n2: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dtgex2_", dynlib: lapackName.}

proc tgexc*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; b: ptr cdouble; ldb: ptr cint; q: ptr cdouble; ldq: ptr cint;
            z: ptr cdouble; ldz: ptr cint; ifst: ptr cint; ilst: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dtgexc_", dynlib: lapackName.}

proc tgsen*(ijob: ptr cint; wantq: ptr cint; wantz: ptr cint; select: ptr cint;
            n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
            alphar: ptr cdouble; alphai: ptr cdouble; beta: ptr cdouble; q: ptr cdouble;
            ldq: ptr cint; z: ptr cdouble; ldz: ptr cint; m: ptr cint; pl: ptr cdouble;
            pr: ptr cdouble; dif: ptr cdouble; work: ptr cdouble; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dtgsen_", dynlib: lapackName.}

proc tgsja*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; k: ptr cint; l: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; tola: ptr cdouble; tolb: ptr cdouble;
            alpha: ptr cdouble; beta: ptr cdouble; u: ptr cdouble; ldu: ptr cint;
            v: ptr cdouble; ldv: ptr cint; q: ptr cdouble; ldq: ptr cint; work: ptr cdouble;
            ncycle: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dtgsja_",
    dynlib: lapackName.}

proc tgsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; vl: ptr cdouble;
            ldvl: ptr cint; vr: ptr cdouble; ldvr: ptr cint; s: ptr cdouble;
            dif: ptr cdouble; mm: ptr cint; m: ptr cint; work: ptr cdouble; lwork: ptr cint;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dtgsna_",
    dynlib: lapackName.}

proc tgsy2*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; b: ptr cdouble; ldb: ptr cint; c: ptr cdouble; ldc: ptr cint;
            d: ptr cdouble; ldd: ptr cint; e: ptr cdouble; lde: ptr cint; f: ptr cdouble;
            ldf: ptr cint; scale: ptr cdouble; rdsum: ptr cdouble; rdscal: ptr cdouble;
            iwork: ptr cint; pq: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dtgsy2_", dynlib: lapackName.}

proc tgsyl*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; b: ptr cdouble; ldb: ptr cint; c: ptr cdouble; ldc: ptr cint;
            d: ptr cdouble; ldd: ptr cint; e: ptr cdouble; lde: ptr cint; f: ptr cdouble;
            ldf: ptr cint; scale: ptr cdouble; dif: ptr cdouble; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dtgsyl_", dynlib: lapackName.}

proc tpcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; ap: ptr cdouble;
            rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dtpcon_", dynlib: lapackName.}

proc tprfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dtprfs_", dynlib: lapackName.}

proc tptri*(uplo: cstring; diag: cstring; n: ptr cint; ap: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dtptri_", dynlib: lapackName.}

proc tptrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr cdouble; b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dtptrs_", dynlib: lapackName.}

proc tpttf*(transr: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble;
            arf: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dtpttf_",
    dynlib: lapackName.}

proc tpttr*(uplo: cstring; n: ptr cint; ap: ptr cdouble; a: ptr cdouble; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dtpttr_", dynlib: lapackName.}

proc trcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dtrcon_", dynlib: lapackName.}

proc trevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr cdouble; ldt: ptr cint; vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble;
            ldvr: ptr cint; mm: ptr cint; m: ptr cint; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dtrevc_", dynlib: lapackName.}

proc trexc*(compq: cstring; n: ptr cint; t: ptr cdouble; ldt: ptr cint; q: ptr cdouble;
            ldq: ptr cint; ifst: ptr cint; ilst: ptr cint; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "dtrexc_", dynlib: lapackName.}

proc trrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "dtrrfs_",
    dynlib: lapackName.}

proc trsen*(job: cstring; compq: cstring; select: ptr cint; n: ptr cint;
            t: ptr cdouble; ldt: ptr cint; q: ptr cdouble; ldq: ptr cint; wr: ptr cdouble;
            wi: ptr cdouble; m: ptr cint; s: ptr cdouble; sep: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dtrsen_", dynlib: lapackName.}

proc trsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr cdouble; ldt: ptr cint; vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble;
            ldvr: ptr cint; s: ptr cdouble; sep: ptr cdouble; mm: ptr cint; m: ptr cint;
            work: ptr cdouble; ldwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dtrsna_", dynlib: lapackName.}

proc trsyl*(trana: cstring; tranb: cstring; isgn: ptr cint; m: ptr cint; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; c: ptr cdouble;
            ldc: ptr cint; scale: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "dtrsyl_", dynlib: lapackName.}

proc trti2*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dtrti2_", dynlib: lapackName.}

proc trtri*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "dtrtri_", dynlib: lapackName.}

proc trtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "dtrtrs_", dynlib: lapackName.}

proc trttf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            arf: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "dtrttf_",
    dynlib: lapackName.}

proc trttp*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ap: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dtrttp_", dynlib: lapackName.}

proc tzrqf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "dtzrqf_", dynlib: lapackName.}

proc tzrzf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "dtzrzf_", dynlib: lapackName.}
proc sum1*(n: ptr cint; cx: ptr Complex64; incx: ptr cint): cdouble {.stdcall, discardable,
    importc: "dzsum1_", dynlib: lapackName.}
proc icmax1*(n: ptr cint; cx: ptr Complex32; incx: ptr cint): cint {.stdcall, discardable,
    importc: "icmax1_", dynlib: lapackName.}
proc ieeeck*(ispec: ptr cint; zero: ptr cfloat; one: ptr cfloat): cint {.stdcall, discardable,
    importc: "ieeeck_", dynlib: lapackName.}
proc ilaclc*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint): cint {.stdcall, discardable,
    importc: "ilaclc_", dynlib: lapackName.}
proc ilaclr*(m: ptr cint; n: ptr cint; a: ptr Complex32; lda: ptr cint): cint {.stdcall, discardable,
    importc: "ilaclr_", dynlib: lapackName.}
proc iladiag*(diag: cstring): cint {.stdcall, discardable, importc: "iladiag_", dynlib: lapackName.}
proc iladlc*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint): cint {.stdcall, discardable,
    importc: "iladlc_", dynlib: lapackName.}
proc iladlr*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint): cint {.stdcall, discardable,
    importc: "iladlr_", dynlib: lapackName.}
proc ilaenv*(ispec: ptr cint; name: cstring; opts: cstring; n1: ptr cint; n2: ptr cint;
            n3: ptr cint; n4: ptr cint): cint {.stdcall, discardable, importc: "ilaenv_",
    dynlib: lapackName.}
proc ilaprec*(prec: cstring): cint {.stdcall, discardable, importc: "ilaprec_", dynlib: lapackName.}
proc ilaslc*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint): cint {.stdcall, discardable,
    importc: "ilaslc_", dynlib: lapackName.}
proc ilaslr*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint): cint {.stdcall, discardable,
    importc: "ilaslr_", dynlib: lapackName.}
proc ilatrans*(trans: cstring): cint {.stdcall, discardable, importc: "ilatrans_", dynlib: lapackName.}
proc ilauplo*(uplo: cstring): cint {.stdcall, discardable, importc: "ilauplo_", dynlib: lapackName.}

proc ilaver*(versMajor: ptr cint; versMinor: ptr cint; versPatch: ptr cint): cint {.
    stdcall, discardable, importc: "ilaver_", dynlib: lapackName.}
proc ilazlc*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint): cint {.stdcall, discardable,
    importc: "ilazlc_", dynlib: lapackName.}
proc ilazlr*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint): cint {.stdcall, discardable,
    importc: "ilazlr_", dynlib: lapackName.}
proc iparmq*(ispec: ptr cint; name: cstring; opts: cstring; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; lwork: ptr cint): cint {.stdcall, discardable, importc: "iparmq_",
    dynlib: lapackName.}
proc izmax1*(n: ptr cint; cx: ptr Complex64; incx: ptr cint): cint {.stdcall, discardable,
    importc: "izmax1_", dynlib: lapackName.}
proc lsamen*(n: ptr cint; ca: cstring; cb: cstring): cint {.stdcall, discardable,
    importc: "lsamen_", dynlib: lapackName.}
# proc maxloc*(a: ptr cfloat; dimm: ptr cint): cint {.stdcall, discardable, importc: "smaxloc_",
#     dynlib: lapackName.}

proc bdsdc*(uplo: cstring; compq: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            u: ptr cfloat; ldu: ptr cint; vt: ptr cfloat; ldvt: ptr cint; q: ptr cfloat;
            iq: ptr cint; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sbdsdc_", dynlib: lapackName.}

proc bdsqr*(uplo: cstring; n: ptr cint; ncvt: ptr cint; nru: ptr cint; ncc: ptr cint;
            d: ptr cfloat; e: ptr cfloat; vt: ptr cfloat; ldvt: ptr cint; u: ptr cfloat;
            ldu: ptr cint; c: ptr cfloat; ldc: ptr cint; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "sbdsqr_", dynlib: lapackName.}
proc csum1*(n: ptr cint; cx: ptr Complex32; incx: ptr cint): cdouble {.stdcall, discardable,
    importc: "scsum1_", dynlib: lapackName.}

proc disna*(job: cstring; m: ptr cint; n: ptr cint; d: ptr cfloat; sep: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "sdisna_", dynlib: lapackName.}

proc gbbrd*(vect: cstring; m: ptr cint; n: ptr cint; ncc: ptr cint; kl: ptr cint;
            ku: ptr cint; ab: ptr cfloat; ldab: ptr cint; d: ptr cfloat; e: ptr cfloat;
            q: ptr cfloat; ldq: ptr cint; pt: ptr cfloat; ldpt: ptr cint; c: ptr cfloat;
            ldc: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgbbrd_", dynlib: lapackName.}

proc gbcon*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; ipiv: ptr cint; anorm: ptr cfloat; rcond: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgbcon_", dynlib: lapackName.}

proc gbequ*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; r: ptr cfloat; c: ptr cfloat; rowcnd: ptr cfloat;
            colcnd: ptr cfloat; amax: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgbequ_", dynlib: lapackName.}

proc gbequb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
             ldab: ptr cint; r: ptr cfloat; c: ptr cfloat; rowcnd: ptr cfloat;
             colcnd: ptr cfloat; amax: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgbequb_", dynlib: lapackName.}

proc gbrfs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; afb: ptr cfloat; ldafb: ptr cint;
            ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sgbrfs_", dynlib: lapackName.}

# proc gbrfsx*(trans: cstring; equed: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#              nrhs: ptr cint; ab: ptr cfloat; ldab: ptr cint; afb: ptr cfloat;
#              ldafb: ptr cint; ipiv: ptr cint; r: ptr cfloat; c: ptr cfloat; b: ptr cfloat;
#              ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
#              berr: ptr cfloat; nErrBnds: ptr cint; errBndsNorm: ptr cfloat;
#              errBndsComp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
#              work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
#     importc: "sgbrfsx_", dynlib: lapackName.}

proc gbsv*(n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr cfloat;
           ldab: ptr cint; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgbsv_", dynlib: lapackName.}

proc gbsvx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
            nrhs: ptr cint; ab: ptr cfloat; ldab: ptr cint; afb: ptr cfloat;
            ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cfloat; c: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sgbsvx_", dynlib: lapackName.}

# proc gbsvxx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#              nrhs: ptr cint; ab: ptr cfloat; ldab: ptr cint; afb: ptr cfloat;
#              ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cfloat; c: ptr cfloat;
#              b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
#              rpvgrw: ptr cfloat; berr: ptr cfloat; nErrBnds: ptr cint;
#              errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat; nparams: ptr cint;
#              params: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
#     stdcall, discardable, importc: "sgbsvxx_", dynlib: lapackName.}

proc gbtf2*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgbtf2_", dynlib: lapackName.}

proc gbtrf*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgbtrf_", dynlib: lapackName.}

proc gbtrs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sgbtrs_", dynlib: lapackName.}

proc gebak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            scale: ptr cfloat; m: ptr cint; v: ptr cfloat; ldv: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgebak_", dynlib: lapackName.}

proc gebal*(job: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgebal_", dynlib: lapackName.}

proc gebd2*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; d: ptr cfloat;
            e: ptr cfloat; tauq: ptr cfloat; taup: ptr cfloat; work: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "sgebd2_", dynlib: lapackName.}

proc gebrd*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; d: ptr cfloat;
            e: ptr cfloat; tauq: ptr cfloat; taup: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sgebrd_",
    dynlib: lapackName.}

proc gecon*(norm: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgecon_", dynlib: lapackName.}

proc geequ*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; r: ptr cfloat;
            c: ptr cfloat; rowcnd: ptr cfloat; colcnd: ptr cfloat; amax: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "sgeequ_", dynlib: lapackName.}

proc geequb*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; r: ptr cfloat;
             c: ptr cfloat; rowcnd: ptr cfloat; colcnd: ptr cfloat; amax: ptr cfloat;
             info: ptr cint): cint {.stdcall, discardable, importc: "sgeequb_", dynlib: lapackName.}

proc gees*(jobvs: cstring; sort: cstring; select: proc(ar, ai: ptr cdouble): cint; n: ptr cint; a: ptr cfloat;
           lda: ptr cint; sdim: ptr cint; wr: ptr cfloat; wi: ptr cfloat; vs: ptr cfloat;
           ldvs: ptr cint; work: ptr cfloat; lwork: ptr cint; bwork: ptr cint;
           info: ptr cint): cint {.stdcall, discardable, importc: "sgees_", dynlib: lapackName.}

proc geesx*(jobvs: cstring; sort: cstring; select: proc(ar, ai: ptr cdouble): cint; sense: cstring; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; sdim: ptr cint; wr: ptr cfloat; wi: ptr cfloat;
            vs: ptr cfloat; ldvs: ptr cint; rconde: ptr cfloat; rcondv: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            bwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sgeesx_",
    dynlib: lapackName.}

proc geev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
           wr: ptr cfloat; wi: ptr cfloat; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat;
           ldvr: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgeev_", dynlib: lapackName.}

proc geevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr cfloat; lda: ptr cint; wr: ptr cfloat; wi: ptr cfloat;
            vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cfloat; abnrm: ptr cfloat; rconde: ptr cfloat;
            rcondv: ptr cfloat; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sgeevx_", dynlib: lapackName.}

proc gegs*(jobvsl: cstring; jobvsr: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
           b: ptr cfloat; ldb: ptr cint; alphar: ptr cfloat; alphai: ptr cfloat;
           beta: ptr cfloat; vsl: ptr cfloat; ldvsl: ptr cint; vsr: ptr cfloat;
           ldvsr: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgegs_", dynlib: lapackName.}

proc gegv*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
           b: ptr cfloat; ldb: ptr cint; alphar: ptr cfloat; alphai: ptr cfloat;
           beta: ptr cfloat; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint;
           work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgegv_", dynlib: lapackName.}

proc gehd2*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgehd2_", dynlib: lapackName.}

proc gehrd*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgehrd_", dynlib: lapackName.}

proc gejsv*(joba: cstring; jobu: cstring; jobv: cstring; jobr: cstring; jobt: cstring;
            jobp: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            sva: ptr cfloat; u: ptr cfloat; ldu: ptr cint; v: ptr cfloat; ldv: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgejsv_", dynlib: lapackName.}

proc gelq2*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sgelq2_",
    dynlib: lapackName.}

proc gelqf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgelqf_", dynlib: lapackName.}

proc gels*(trans: cstring; m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
           lda: ptr cint; b: ptr cfloat; ldb: ptr cint; work: ptr cfloat; lwork: ptr cint;
           info: ptr cint): cint {.stdcall, discardable, importc: "sgels_", dynlib: lapackName.}

proc gelsd*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; s: ptr cfloat; rcond: ptr cfloat; rank: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgelsd_", dynlib: lapackName.}

proc gelss*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; s: ptr cfloat; rcond: ptr cfloat; rank: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgelss_", dynlib: lapackName.}

proc gelsx*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; jpvt: ptr cint; rcond: ptr cfloat; rank: ptr cint;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sgelsx_",
    dynlib: lapackName.}

proc gelsy*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; jpvt: ptr cint; rcond: ptr cfloat; rank: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgelsy_", dynlib: lapackName.}

proc geql2*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sgeql2_",
    dynlib: lapackName.}

proc geqlf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgeqlf_", dynlib: lapackName.}

proc geqp3*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; jpvt: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgeqp3_", dynlib: lapackName.}

proc geqpf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; jpvt: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgeqpf_", dynlib: lapackName.}

proc geqr2*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sgeqr2_",
    dynlib: lapackName.}

proc geqrf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgeqrf_", dynlib: lapackName.}

proc gerfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint;
            x: ptr cfloat; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgerfs_", dynlib: lapackName.}

# proc gerfsx*(trans: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
#              lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; r: ptr cfloat;
#              c: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
#              rcond: ptr cfloat; berr: ptr cfloat; nErrBnds: ptr cint;
#              errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat; nparams: ptr cint;
#              params: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
#     stdcall, discardable, importc: "sgerfsx_", dynlib: lapackName.}

proc gerq2*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sgerq2_",
    dynlib: lapackName.}

proc gerqf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgerqf_", dynlib: lapackName.}

proc gesc2*(n: ptr cint; a: ptr cfloat; lda: ptr cint; rhs: ptr cfloat; ipiv: ptr cint;
            jpiv: ptr cint; scale: ptr cfloat): cint {.stdcall, discardable, importc: "sgesc2_",
    dynlib: lapackName.}

proc gesdd*(jobz: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            s: ptr cfloat; u: ptr cfloat; ldu: ptr cint; vt: ptr cfloat; ldvt: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgesdd_", dynlib: lapackName.}

proc gesv*(n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
           b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgesv_", dynlib: lapackName.}

proc gesvd*(jobu: cstring; jobvt: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; s: ptr cfloat; u: ptr cfloat; ldu: ptr cint; vt: ptr cfloat;
            ldvt: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgesvd_", dynlib: lapackName.}

proc gesvj*(joba: cstring; jobu: cstring; jobv: cstring; m: ptr cint; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; sva: ptr cfloat; mv: ptr cint; v: ptr cfloat;
            ldv: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgesvj_", dynlib: lapackName.}

proc gesvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
            lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
            r: ptr cfloat; c: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgesvx_", dynlib: lapackName.}

# proc gesvxx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
#              lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
#              r: ptr cfloat; c: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
#              ldx: ptr cint; rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat;
#              nErrBnds: ptr cint; errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat;
#              nparams: ptr cint; params: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
#              info: ptr cint): cint {.stdcall, discardable, importc: "sgesvxx_", dynlib: lapackName.}

proc getc2*(n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint; jpiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sgetc2_", dynlib: lapackName.}

proc getf2*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sgetf2_", dynlib: lapackName.}

proc getrf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sgetrf_", dynlib: lapackName.}

proc getri*(n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sgetri_",
    dynlib: lapackName.}

proc getrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgetrs_", dynlib: lapackName.}

proc ggbak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cfloat; rscale: ptr cfloat; m: ptr cint; v: ptr cfloat;
            ldv: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sggbak_",
    dynlib: lapackName.}

proc ggbal*(job: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; ilo: ptr cint; ihi: ptr cint; lscale: ptr cfloat;
            rscale: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sggbal_", dynlib: lapackName.}

proc gges*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: proc(ar, ai: ptr cdouble): cint; n: ptr cint;
           a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; sdim: ptr cint;
           alphar: ptr cfloat; alphai: ptr cfloat; beta: ptr cfloat; vsl: ptr cfloat;
           ldvsl: ptr cint; vsr: ptr cfloat; ldvsr: ptr cint; work: ptr cfloat;
           lwork: ptr cint; bwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgges_", dynlib: lapackName.}

proc ggesx*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: proc(ar, ai: ptr cdouble): cint;
            sense: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; sdim: ptr cint; alphar: ptr cfloat; alphai: ptr cfloat;
            beta: ptr cfloat; vsl: ptr cfloat; ldvsl: ptr cint; vsr: ptr cfloat;
            ldvsr: ptr cint; rconde: ptr cfloat; rcondv: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; bwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sggesx_", dynlib: lapackName.}

proc ggev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
           b: ptr cfloat; ldb: ptr cint; alphar: ptr cfloat; alphai: ptr cfloat;
           beta: ptr cfloat; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint;
           work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sggev_", dynlib: lapackName.}

proc ggevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint;
            alphar: ptr cfloat; alphai: ptr cfloat; beta: ptr cfloat; vl: ptr cfloat;
            ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cfloat; rscale: ptr cfloat; abnrm: ptr cfloat; bbnrm: ptr cfloat;
            rconde: ptr cfloat; rcondv: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; bwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sggevx_", dynlib: lapackName.}

proc ggglm*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; d: ptr cfloat; x: ptr cfloat; y: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sggglm_",
    dynlib: lapackName.}

proc gghrd*(compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; q: ptr cfloat;
            ldq: ptr cint; z: ptr cfloat; ldz: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgghrd_", dynlib: lapackName.}

proc gglse*(m: ptr cint; n: ptr cint; p: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; c: ptr cfloat; d: ptr cfloat; x: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sgglse_",
    dynlib: lapackName.}

proc ggqrf*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr cfloat; lda: ptr cint;
            taua: ptr cfloat; b: ptr cfloat; ldb: ptr cint; taub: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sggqrf_", dynlib: lapackName.}

proc ggrqf*(m: ptr cint; p: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            taua: ptr cfloat; b: ptr cfloat; ldb: ptr cint; taub: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sggrqf_", dynlib: lapackName.}

proc ggsvd*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; n: ptr cint;
            p: ptr cint; k: ptr cint; l: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; alpha: ptr cfloat; beta: ptr cfloat; u: ptr cfloat;
            ldu: ptr cint; v: ptr cfloat; ldv: ptr cint; q: ptr cfloat; ldq: ptr cint;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sggsvd_", dynlib: lapackName.}

proc ggsvp*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint;
            tola: ptr cfloat; tolb: ptr cfloat; k: ptr cint; l: ptr cint; u: ptr cfloat;
            ldu: ptr cint; v: ptr cfloat; ldv: ptr cint; q: ptr cfloat; ldq: ptr cint;
            iwork: ptr cint; tau: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "sggsvp_", dynlib: lapackName.}

proc gsvj0*(jobv: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            d: ptr cfloat; sva: ptr cfloat; mv: ptr cint; v: ptr cfloat; ldv: ptr cint;
            eps: ptr cfloat; sfmin: ptr cfloat; tol: ptr cfloat; nsweep: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgsvj0_", dynlib: lapackName.}

proc gsvj1*(jobv: cstring; m: ptr cint; n: ptr cint; n1: ptr cint; a: ptr cfloat;
            lda: ptr cint; d: ptr cfloat; sva: ptr cfloat; mv: ptr cint; v: ptr cfloat;
            ldv: ptr cint; eps: ptr cfloat; sfmin: ptr cfloat; tol: ptr cfloat;
            nsweep: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sgsvj1_", dynlib: lapackName.}

proc gtcon*(norm: cstring; n: ptr cint; dl: ptr cfloat; d: ptr cfloat; du: ptr cfloat;
            du2: ptr cfloat; ipiv: ptr cint; anorm: ptr cfloat; rcond: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgtcon_", dynlib: lapackName.}

proc gtrfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cfloat; d: ptr cfloat;
            du: ptr cfloat; dlf: ptr cfloat; df: ptr cfloat; duf: ptr cfloat;
            du2: ptr cfloat; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sgtrfs_",
    dynlib: lapackName.}

proc gtsv*(n: ptr cint; nrhs: ptr cint; dl: ptr cfloat; d: ptr cfloat; du: ptr cfloat;
           b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgtsv_", dynlib: lapackName.}

proc gtsvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cfloat;
            d: ptr cfloat; du: ptr cfloat; dlf: ptr cfloat; df: ptr cfloat; duf: ptr cfloat;
            du2: ptr cfloat; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sgtsvx_", dynlib: lapackName.}

proc gttrf*(n: ptr cint; dl: ptr cfloat; d: ptr cfloat; du: ptr cfloat; du2: ptr cfloat;
            ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sgttrf_",
    dynlib: lapackName.}

proc gttrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cfloat; d: ptr cfloat;
            du: ptr cfloat; du2: ptr cfloat; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sgttrs_", dynlib: lapackName.}

proc gtts2*(itrans: ptr cint; n: ptr cint; nrhs: ptr cint; dl: ptr cfloat; d: ptr cfloat;
            du: ptr cfloat; du2: ptr cfloat; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint): cint {.
    stdcall, discardable, importc: "sgtts2_", dynlib: lapackName.}

proc hgeqz*(job: cstring; compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr cfloat; ldh: ptr cint; t: ptr cfloat; ldt: ptr cint;
            alphar: ptr cfloat; alphai: ptr cfloat; beta: ptr cfloat; q: ptr cfloat;
            ldq: ptr cint; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "shgeqz_", dynlib: lapackName.}

proc hsein*(side: cstring; eigsrc: cstring; initv: cstring; select: ptr cint;
            n: ptr cint; h: ptr cfloat; ldh: ptr cint; wr: ptr cfloat; wi: ptr cfloat;
            vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint; mm: ptr cint;
            m: ptr cint; work: ptr cfloat; ifaill: ptr cint; ifailr: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "shsein_", dynlib: lapackName.}

proc hseqr*(job: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            h: ptr cfloat; ldh: ptr cint; wr: ptr cfloat; wi: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "shseqr_", dynlib: lapackName.}
proc isnan*(sin: ptr cfloat): cint {.stdcall, discardable, importc: "sisnan_", dynlib: lapackName.}

# proc laGbamv*(trans: ptr cint; m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
#               alpha: ptr cfloat; ab: ptr cfloat; ldab: ptr cint; x: ptr cfloat;
#               incx: ptr cint; beta: ptr cfloat; y: ptr cfloat; incy: ptr cint): cint {.
#     stdcall, discardable, importc: "sla_gbamv__", dynlib: lapackName.}
# proc laGbrcond*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
#                 ldab: ptr cint; afb: ptr cfloat; ldafb: ptr cint; ipiv: ptr cint;
#                 cmode: ptr cint; c: ptr cfloat; info: ptr cint; work: ptr cfloat;
#                 iwork: ptr cint; transLen: int16): cdouble {.stdcall, discardable,
#     importc: "sla_gbrcond__", dynlib: lapackName.}
#
# proc laGbrfsxExtended*(precType: ptr cint; transType: ptr cint; n: ptr cint;
#                        kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr cfloat;
#                        ldab: ptr cint; afb: ptr cfloat; ldafb: ptr cint; ipiv: ptr cint;
#                        colequ: ptr cint; c: ptr cfloat; b: ptr cfloat; ldb: ptr cint;
#                        y: ptr cfloat; ldy: ptr cint; berrOut: ptr cfloat;
#                        nNorms: ptr cint; errsN: ptr cfloat; errsC: ptr cfloat;
#                        res: ptr cfloat; ayb: ptr cfloat; dy: ptr cfloat;
#                        yTail: ptr cfloat; rcond: ptr cfloat; ithresh: ptr cint;
#                        rthresh: ptr cfloat; dzUb: ptr cfloat;
#                        ignoreCwise: ptr cint; info: ptr cint): cint {.stdcall, discardable,
#     importc: "sla_gbrfsx_extended__", dynlib: lapackName.}
# proc laGbrpvgrw*(n: ptr cint; kl: ptr cint; ku: ptr cint; ncols: ptr cint; ab: ptr cfloat;
#                  ldab: ptr cint; afb: ptr cfloat; ldafb: ptr cint): cdouble {.stdcall, discardable,
#     importc: "sla_gbrpvgrw__", dynlib: lapackName.}
#
# proc laGeamv*(trans: ptr cint; m: ptr cint; n: ptr cint; alpha: ptr cfloat; a: ptr cfloat;
#               lda: ptr cint; x: ptr cfloat; incx: ptr cint; beta: ptr cfloat; y: ptr cfloat;
#               incy: ptr cint): cint {.stdcall, discardable, importc: "sla_geamv__",
#                                   dynlib: lapackName.}
# proc laGercond*(trans: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; af: ptr cfloat;
#                 ldaf: ptr cint; ipiv: ptr cint; cmode: ptr cint; c: ptr cfloat;
#                 info: ptr cint; work: ptr cfloat; iwork: ptr cint; transLen: int16): cdouble {.
#     stdcall, discardable, importc: "sla_gercond__", dynlib: lapackName.}
#
# proc laGerfsxExtended*(precType: ptr cint; transType: ptr cint; n: ptr cint;
#                        nrhs: ptr cint; a: ptr cfloat; lda: ptr cint; af: ptr cfloat;
#                        ldaf: ptr cint; ipiv: ptr cint; colequ: ptr cint;
#                        c: ptr cfloat; b: ptr cfloat; ldb: ptr cint; y: ptr cfloat;
#                        ldy: ptr cint; berrOut: ptr cfloat; nNorms: ptr cint;
#                        errsN: ptr cfloat; errsC: ptr cfloat; res: ptr cfloat;
#                        ayb: ptr cfloat; dy: ptr cfloat; yTail: ptr cfloat;
#                        rcond: ptr cfloat; ithresh: ptr cint; rthresh: ptr cfloat;
#                        dzUb: ptr cfloat; ignoreCwise: ptr cint; info: ptr cint): cint {.
#     stdcall, discardable, importc: "sla_gerfsx_extended__", dynlib: lapackName.}
#
# proc laLinBerr*(n: ptr cint; nz: ptr cint; nrhs: ptr cint; res: ptr cfloat; ayb: ptr cfloat;
#                 berr: ptr cfloat): cint {.stdcall, discardable, importc: "sla_lin_berr__",
#                                       dynlib: lapackName.}
# proc laPorcond*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; af: ptr cfloat;
#                 ldaf: ptr cint; cmode: ptr cint; c: ptr cfloat; info: ptr cint;
#                 work: ptr cfloat; iwork: ptr cint; uploLen: int16): cdouble {.stdcall, discardable,
#     importc: "sla_porcond__", dynlib: lapackName.}
#
# proc laPorfsxExtended*(precType: ptr cint; uplo: cstring; n: ptr cint; nrhs: ptr cint;
#                        a: ptr cfloat; lda: ptr cint; af: ptr cfloat; ldaf: ptr cint;
#                        colequ: ptr cint; c: ptr cfloat; b: ptr cfloat; ldb: ptr cint;
#                        y: ptr cfloat; ldy: ptr cint; berrOut: ptr cfloat;
#                        nNorms: ptr cint; errsN: ptr cfloat; errsC: ptr cfloat;
#                        res: ptr cfloat; ayb: ptr cfloat; dy: ptr cfloat;
#                        yTail: ptr cfloat; rcond: ptr cfloat; ithresh: ptr cint;
#                        rthresh: ptr cfloat; dzUb: ptr cfloat;
#                        ignoreCwise: ptr cint; info: ptr cint; uploLen: int16): cint {.
#     stdcall, discardable, importc: "sla_porfsx_extended__", dynlib: lapackName.}
# proc laPorpvgrw*(uplo: cstring; ncols: ptr cint; a: ptr cfloat; lda: ptr cint;
#                  af: ptr cfloat; ldaf: ptr cint; work: ptr cfloat; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "sla_porpvgrw__", dynlib: lapackName.}
# proc laRpvgrw*(n: ptr cint; ncols: ptr cint; a: ptr cfloat; lda: ptr cint; af: ptr cfloat;
#                ldaf: ptr cint): cdouble {.stdcall, discardable, importc: "sla_rpvgrw__",
#                                       dynlib: lapackName.}
#
# proc laSyamv*(uplo: ptr cint; n: ptr cint; alpha: ptr cfloat; a: ptr cfloat; lda: ptr cint;
#               x: ptr cfloat; incx: ptr cint; beta: ptr cfloat; y: ptr cfloat; incy: ptr cint): cint {.
#     stdcall, discardable, importc: "sla_syamv__", dynlib: lapackName.}
# proc laSyrcond*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; af: ptr cfloat;
#                 ldaf: ptr cint; ipiv: ptr cint; cmode: ptr cint; c: ptr cfloat;
#                 info: ptr cint; work: ptr cfloat; iwork: ptr cint; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "sla_syrcond__", dynlib: lapackName.}
#
# proc laSyrfsxExtended*(precType: ptr cint; uplo: cstring; n: ptr cint; nrhs: ptr cint;
#                        a: ptr cfloat; lda: ptr cint; af: ptr cfloat; ldaf: ptr cint;
#                        ipiv: ptr cint; colequ: ptr cint; c: ptr cfloat; b: ptr cfloat;
#                        ldb: ptr cint; y: ptr cfloat; ldy: ptr cint; berrOut: ptr cfloat;
#                        nNorms: ptr cint; errsN: ptr cfloat; errsC: ptr cfloat;
#                        res: ptr cfloat; ayb: ptr cfloat; dy: ptr cfloat;
#                        yTail: ptr cfloat; rcond: ptr cfloat; ithresh: ptr cint;
#                        rthresh: ptr cfloat; dzUb: ptr cfloat;
#                        ignoreCwise: ptr cint; info: ptr cint; uploLen: int16): cint {.
#     stdcall, discardable, importc: "sla_syrfsx_extended__", dynlib: lapackName.}
# proc laSyrpvgrw*(uplo: cstring; n: ptr cint; info: ptr cint; a: ptr cfloat; lda: ptr cint;
#                  af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; work: ptr cfloat;
#                  uploLen: int16): cdouble {.stdcall, discardable, importc: "sla_syrpvgrw__",
#     dynlib: lapackName.}
#
# proc laWwaddw*(n: ptr cint; x: ptr cfloat; y: ptr cfloat; w: ptr cfloat): cint {.stdcall, discardable,
#     importc: "sla_wwaddw__", dynlib: lapackName.}

proc labad*(small: ptr cfloat; large: ptr cfloat): cint {.stdcall, discardable, importc: "slabad_",
    dynlib: lapackName.}

proc labrd*(m: ptr cint; n: ptr cint; nb: ptr cint; a: ptr cfloat; lda: ptr cint;
            d: ptr cfloat; e: ptr cfloat; tauq: ptr cfloat; taup: ptr cfloat; x: ptr cfloat;
            ldx: ptr cint; y: ptr cfloat; ldy: ptr cint): cint {.stdcall, discardable,
    importc: "slabrd_", dynlib: lapackName.}

proc lacn2*(n: ptr cint; v: ptr cfloat; x: ptr cfloat; isgn: ptr cint; est: ptr cfloat;
            kase: ptr cint; isave: ptr cint): cint {.stdcall, discardable, importc: "slacn2_",
    dynlib: lapackName.}

proc lacon*(n: ptr cint; v: ptr cfloat; x: ptr cfloat; isgn: ptr cint; est: ptr cfloat;
            kase: ptr cint): cint {.stdcall, discardable, importc: "slacon_", dynlib: lapackName.}

proc lacpy*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint): cint {.stdcall, discardable, importc: "slacpy_",
    dynlib: lapackName.}

proc ladiv*(a: ptr cfloat; b: ptr cfloat; c: ptr cfloat; d: ptr cfloat; p: ptr cfloat;
            q: ptr cfloat): cint {.stdcall, discardable, importc: "sladiv_", dynlib: lapackName.}

proc lae2*(a: ptr cfloat; b: ptr cfloat; c: ptr cfloat; rt1: ptr cfloat; rt2: ptr cfloat): cint {.
    stdcall, discardable, importc: "slae2_", dynlib: lapackName.}

proc laebz*(ijob: ptr cint; nitmax: ptr cint; n: ptr cint; mmax: ptr cint; minp: ptr cint;
            nbmin: ptr cint; abstol: ptr cfloat; reltol: ptr cfloat; pivmin: ptr cfloat;
            d: ptr cfloat; e: ptr cfloat; e2: ptr cfloat; nval: ptr cint; ab: ptr cfloat;
            c: ptr cfloat; mout: ptr cint; nab: ptr cint; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "slaebz_", dynlib: lapackName.}

proc laed0*(icompq: ptr cint; qsiz: ptr cint; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            q: ptr cfloat; ldq: ptr cint; qstore: ptr cfloat; ldqs: ptr cint;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "slaed0_", dynlib: lapackName.}

proc laed1*(n: ptr cint; d: ptr cfloat; q: ptr cfloat; ldq: ptr cint; indxq: ptr cint;
            rho: ptr cfloat; cutpnt: ptr cint; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "slaed1_", dynlib: lapackName.}

proc laed2*(k: ptr cint; n: ptr cint; n1: ptr cint; d: ptr cfloat; q: ptr cfloat;
            ldq: ptr cint; indxq: ptr cint; rho: ptr cfloat; z: ptr cfloat;
            dlamda: ptr cfloat; w: ptr cfloat; q2: ptr cfloat; indx: ptr cint;
            indxc: ptr cint; indxp: ptr cint; coltyp: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "slaed2_", dynlib: lapackName.}

proc laed3*(k: ptr cint; n: ptr cint; n1: ptr cint; d: ptr cfloat; q: ptr cfloat;
            ldq: ptr cint; rho: ptr cfloat; dlamda: ptr cfloat; q2: ptr cfloat;
            indx: ptr cint; ctot: ptr cint; w: ptr cfloat; s: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "slaed3_", dynlib: lapackName.}

proc laed4*(n: ptr cint; i: ptr cint; d: ptr cfloat; z: ptr cfloat; delta: ptr cfloat;
            rho: ptr cfloat; dlam: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "slaed4_", dynlib: lapackName.}

proc laed5*(i: ptr cint; d: ptr cfloat; z: ptr cfloat; delta: ptr cfloat; rho: ptr cfloat;
            dlam: ptr cfloat): cint {.stdcall, discardable, importc: "slaed5_", dynlib: lapackName.}

proc laed6*(kniter: ptr cint; orgati: ptr cint; rho: ptr cfloat; d: ptr cfloat;
            z: ptr cfloat; finit: ptr cfloat; tau: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "slaed6_", dynlib: lapackName.}

proc laed7*(icompq: ptr cint; n: ptr cint; qsiz: ptr cint; tlvls: ptr cint;
            curlvl: ptr cint; curpbm: ptr cint; d: ptr cfloat; q: ptr cfloat; ldq: ptr cint;
            indxq: ptr cint; rho: ptr cfloat; cutpnt: ptr cint; qstore: ptr cfloat;
            qptr: ptr cint; prmptr: ptr cint; perm: ptr cint; givptr: ptr cint;
            givcol: ptr cint; givnum: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "slaed7_", dynlib: lapackName.}

proc laed8*(icompq: ptr cint; k: ptr cint; n: ptr cint; qsiz: ptr cint; d: ptr cfloat;
            q: ptr cfloat; ldq: ptr cint; indxq: ptr cint; rho: ptr cfloat;
            cutpnt: ptr cint; z: ptr cfloat; dlamda: ptr cfloat; q2: ptr cfloat;
            ldq2: ptr cint; w: ptr cfloat; perm: ptr cint; givptr: ptr cint;
            givcol: ptr cint; givnum: ptr cfloat; indxp: ptr cint; indx: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "slaed8_", dynlib: lapackName.}

proc laed9*(k: ptr cint; kstart: ptr cint; kstop: ptr cint; n: ptr cint; d: ptr cfloat;
            q: ptr cfloat; ldq: ptr cint; rho: ptr cfloat; dlamda: ptr cfloat;
            w: ptr cfloat; s: ptr cfloat; lds: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "slaed9_", dynlib: lapackName.}

proc laeda*(n: ptr cint; tlvls: ptr cint; curlvl: ptr cint; curpbm: ptr cint;
            prmptr: ptr cint; perm: ptr cint; givptr: ptr cint; givcol: ptr cint;
            givnum: ptr cfloat; q: ptr cfloat; qptr: ptr cint; z: ptr cfloat;
            ztemp: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "slaeda_",
    dynlib: lapackName.}

proc laein*(rightv: ptr cint; noinit: ptr cint; n: ptr cint; h: ptr cfloat;
            ldh: ptr cint; wr: ptr cfloat; wi: ptr cfloat; vr: ptr cfloat; vi: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint; work: ptr cfloat; eps3: ptr cfloat;
            smlnum: ptr cfloat; bignum: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "slaein_", dynlib: lapackName.}

proc laev2*(a: ptr cfloat; b: ptr cfloat; c: ptr cfloat; rt1: ptr cfloat; rt2: ptr cfloat;
            cs1: ptr cfloat; sn1: ptr cfloat): cint {.stdcall, discardable, importc: "slaev2_",
    dynlib: lapackName.}

proc laexc*(wantq: ptr cint; n: ptr cint; t: ptr cfloat; ldt: ptr cint; q: ptr cfloat;
            ldq: ptr cint; j1: ptr cint; n1: ptr cint; n2: ptr cint; work: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "slaexc_", dynlib: lapackName.}

proc lag2*(a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; safmin: ptr cfloat;
           scale1: ptr cfloat; scale2: ptr cfloat; wr1: ptr cfloat; wr2: ptr cfloat;
           wi: ptr cfloat): cint {.stdcall, discardable, importc: "slag2_", dynlib: lapackName.}

proc lag2d*(m: ptr cint; n: ptr cint; sa: ptr cfloat; ldsa: ptr cint; a: ptr cdouble;
            lda: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "slag2d_",
    dynlib: lapackName.}

proc lags2*(upper: ptr cint; a1: ptr cfloat; a2: ptr cfloat; a3: ptr cfloat;
            b1: ptr cfloat; b2: ptr cfloat; b3: ptr cfloat; csu: ptr cfloat;
            snu: ptr cfloat; csv: ptr cfloat; snv: ptr cfloat; csq: ptr cfloat;
            snq: ptr cfloat): cint {.stdcall, discardable, importc: "slags2_", dynlib: lapackName.}

proc lagtf*(n: ptr cint; a: ptr cfloat; lambda: ptr cfloat; b: ptr cfloat; c: ptr cfloat;
            tol: ptr cfloat; d: ptr cfloat; `in`: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "slagtf_", dynlib: lapackName.}

proc lagtm*(trans: cstring; n: ptr cint; nrhs: ptr cint; alpha: ptr cfloat; dl: ptr cfloat;
            d: ptr cfloat; du: ptr cfloat; x: ptr cfloat; ldx: ptr cint; beta: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint): cint {.stdcall, discardable, importc: "slagtm_",
    dynlib: lapackName.}

proc lagts*(job: ptr cint; n: ptr cint; a: ptr cfloat; b: ptr cfloat; c: ptr cfloat;
            d: ptr cfloat; `in`: ptr cint; y: ptr cfloat; tol: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "slagts_", dynlib: lapackName.}

proc lagv2*(a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; alphar: ptr cfloat;
            alphai: ptr cfloat; beta: ptr cfloat; csl: ptr cfloat; snl: ptr cfloat;
            csr: ptr cfloat; snr: ptr cfloat): cint {.stdcall, discardable, importc: "slagv2_",
    dynlib: lapackName.}

proc lahqr*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr cfloat; ldh: ptr cint; wr: ptr cfloat; wi: ptr cfloat;
            iloz: ptr cint; ihiz: ptr cint; z: ptr cfloat; ldz: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "slahqr_", dynlib: lapackName.}

proc lahr2*(n: ptr cint; k: ptr cint; nb: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; t: ptr cfloat; ldt: ptr cint; y: ptr cfloat; ldy: ptr cint): cint {.
    stdcall, discardable, importc: "slahr2_", dynlib: lapackName.}

proc lahrd*(n: ptr cint; k: ptr cint; nb: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; t: ptr cfloat; ldt: ptr cint; y: ptr cfloat; ldy: ptr cint): cint {.
    stdcall, discardable, importc: "slahrd_", dynlib: lapackName.}

proc laic1*(job: ptr cint; j: ptr cint; x: ptr cfloat; sest: ptr cfloat; w: ptr cfloat;
            gamma: ptr cfloat; sestpr: ptr cfloat; s: ptr cfloat; c: ptr cfloat): cint {.
    stdcall, discardable, importc: "slaic1_", dynlib: lapackName.}
proc laisnan*(sin1: ptr cfloat; sin2: ptr cfloat): cint {.stdcall, discardable,
    importc: "slaisnan_", dynlib: lapackName.}

proc laln2*(ltrans: ptr cint; na: ptr cint; nw: ptr cint; smin: ptr cfloat;
            ca: ptr cfloat; a: ptr cfloat; lda: ptr cint; d1: ptr cfloat; d2: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint; wr: ptr cfloat; wi: ptr cfloat; x: ptr cfloat;
            ldx: ptr cint; scale: ptr cfloat; xnorm: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "slaln2_", dynlib: lapackName.}

proc lals0*(icompq: ptr cint; nl: ptr cint; nr: ptr cint; sqre: ptr cint; nrhs: ptr cint;
            b: ptr cfloat; ldb: ptr cint; bx: ptr cfloat; ldbx: ptr cint; perm: ptr cint;
            givptr: ptr cint; givcol: ptr cint; ldgcol: ptr cint; givnum: ptr cfloat;
            ldgnum: ptr cint; poles: ptr cfloat; difl: ptr cfloat; difr: ptr cfloat;
            z: ptr cfloat; k: ptr cint; c: ptr cfloat; s: ptr cfloat; work: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "slals0_", dynlib: lapackName.}

proc lalsa*(icompq: ptr cint; smlsiz: ptr cint; n: ptr cint; nrhs: ptr cint; b: ptr cfloat;
            ldb: ptr cint; bx: ptr cfloat; ldbx: ptr cint; u: ptr cfloat; ldu: ptr cint;
            vt: ptr cfloat; k: ptr cint; difl: ptr cfloat; difr: ptr cfloat; z: ptr cfloat;
            poles: ptr cfloat; givptr: ptr cint; givcol: ptr cint; ldgcol: ptr cint;
            perm: ptr cint; givnum: ptr cfloat; c: ptr cfloat; s: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "slalsa_", dynlib: lapackName.}

proc lalsd*(uplo: cstring; smlsiz: ptr cint; n: ptr cint; nrhs: ptr cint; d: ptr cfloat;
            e: ptr cfloat; b: ptr cfloat; ldb: ptr cint; rcond: ptr cfloat; rank: ptr cint;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "slalsd_", dynlib: lapackName.}

proc lamrg*(n1: ptr cint; n2: ptr cint; a: ptr cfloat; strd1: ptr cint; strd2: ptr cint;
            index: ptr cint): cint {.stdcall, discardable, importc: "slamrg_", dynlib: lapackName.}
proc laneg*(n: ptr cint; d: ptr cfloat; lld: ptr cfloat; sigma: ptr cfloat;
            pivmin: ptr cfloat; r: ptr cint): cint {.stdcall, discardable, importc: "slaneg_",
    dynlib: lapackName.}
proc langb*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; work: ptr cfloat): cdouble {.stdcall, discardable, importc: "slangb_",
    dynlib: lapackName.}
proc lange*(norm: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            work: ptr cfloat): cdouble {.stdcall, discardable, importc: "slange_", dynlib: lapackName.}
proc langt*(norm: cstring; n: ptr cint; dl: ptr cfloat; d: ptr cfloat; du: ptr cfloat): cdouble {.
    stdcall, discardable, importc: "slangt_", dynlib: lapackName.}
proc lanhs*(norm: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; work: ptr cfloat): cdouble {.
    stdcall, discardable, importc: "slanhs_", dynlib: lapackName.}
proc lansb*(norm: cstring; uplo: cstring; n: ptr cint; k: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; work: ptr cfloat): cdouble {.stdcall, discardable, importc: "slansb_",
    dynlib: lapackName.}
proc lansf*(norm: cstring; transr: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat;
            work: ptr cfloat): cdouble {.stdcall, discardable, importc: "slansf_", dynlib: lapackName.}
proc lansp*(norm: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat; work: ptr cfloat): cdouble {.
    stdcall, discardable, importc: "slansp_", dynlib: lapackName.}
proc lanst*(norm: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat): cdouble {.stdcall, discardable,
    importc: "slanst_", dynlib: lapackName.}
proc lansy*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            work: ptr cfloat): cdouble {.stdcall, discardable, importc: "slansy_", dynlib: lapackName.}
proc lantb*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; k: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; work: ptr cfloat): cdouble {.stdcall, discardable,
    importc: "slantb_", dynlib: lapackName.}
proc lantp*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; ap: ptr cfloat;
            work: ptr cfloat): cdouble {.stdcall, discardable, importc: "slantp_", dynlib: lapackName.}
proc lantr*(norm: cstring; uplo: cstring; diag: cstring; m: ptr cint; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; work: ptr cfloat): cdouble {.stdcall, discardable,
    importc: "slantr_", dynlib: lapackName.}

proc lanv2*(a: ptr cfloat; b: ptr cfloat; c: ptr cfloat; d: ptr cfloat; rt1r: ptr cfloat;
            rt1i: ptr cfloat; rt2r: ptr cfloat; rt2i: ptr cfloat; cs: ptr cfloat;
            sn: ptr cfloat): cint {.stdcall, discardable, importc: "slanv2_", dynlib: lapackName.}

proc lapll*(n: ptr cint; x: ptr cfloat; incx: ptr cint; y: ptr cfloat; incy: ptr cint;
            ssmin: ptr cfloat): cint {.stdcall, discardable, importc: "slapll_", dynlib: lapackName.}

proc lapmt*(forwrd: ptr cint; m: ptr cint; n: ptr cint; x: ptr cfloat; ldx: ptr cint;
            k: ptr cint): cint {.stdcall, discardable, importc: "slapmt_", dynlib: lapackName.}
proc lapy2*(x: ptr cfloat; y: ptr cfloat): cdouble {.stdcall, discardable, importc: "slapy2_",
    dynlib: lapackName.}
proc lapy3*(x: ptr cfloat; y: ptr cfloat; z: ptr cfloat): cdouble {.stdcall, discardable,
    importc: "slapy3_", dynlib: lapackName.}

proc laqgb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; r: ptr cfloat; c: ptr cfloat; rowcnd: ptr cfloat;
            colcnd: ptr cfloat; amax: ptr cfloat; equed: cstring): cint {.stdcall, discardable,
    importc: "slaqgb_", dynlib: lapackName.}

proc laqge*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; r: ptr cfloat;
            c: ptr cfloat; rowcnd: ptr cfloat; colcnd: ptr cfloat; amax: ptr cfloat;
            equed: cstring): cint {.stdcall, discardable, importc: "slaqge_", dynlib: lapackName.}

proc laqp2*(m: ptr cint; n: ptr cint; offset: ptr cint; a: ptr cfloat; lda: ptr cint;
            jpvt: ptr cint; tau: ptr cfloat; vn1: ptr cfloat; vn2: ptr cfloat;
            work: ptr cfloat): cint {.stdcall, discardable, importc: "slaqp2_", dynlib: lapackName.}

proc laqps*(m: ptr cint; n: ptr cint; offset: ptr cint; nb: ptr cint; kb: ptr cint;
            a: ptr cfloat; lda: ptr cint; jpvt: ptr cint; tau: ptr cfloat; vn1: ptr cfloat;
            vn2: ptr cfloat; auxv: ptr cfloat; f: ptr cfloat; ldf: ptr cint): cint {.stdcall, discardable,
    importc: "slaqps_", dynlib: lapackName.}

proc laqr0*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr cfloat; ldh: ptr cint; wr: ptr cfloat; wi: ptr cfloat;
            iloz: ptr cint; ihiz: ptr cint; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "slaqr0_",
    dynlib: lapackName.}

proc laqr1*(n: ptr cint; h: ptr cfloat; ldh: ptr cint; sr1: ptr cfloat; si1: ptr cfloat;
            sr2: ptr cfloat; si2: ptr cfloat; v: ptr cfloat): cint {.stdcall, discardable,
    importc: "slaqr1_", dynlib: lapackName.}

proc laqr2*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ktop: ptr cint;
            kbot: ptr cint; nw: ptr cint; h: ptr cfloat; ldh: ptr cint; iloz: ptr cint;
            ihiz: ptr cint; z: ptr cfloat; ldz: ptr cint; ns: ptr cint; nd: ptr cint;
            sr: ptr cfloat; si: ptr cfloat; v: ptr cfloat; ldv: ptr cint; nh: ptr cint;
            t: ptr cfloat; ldt: ptr cint; nv: ptr cint; wv: ptr cfloat; ldwv: ptr cint;
            work: ptr cfloat; lwork: ptr cint): cint {.stdcall, discardable, importc: "slaqr2_",
    dynlib: lapackName.}

proc laqr3*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ktop: ptr cint;
            kbot: ptr cint; nw: ptr cint; h: ptr cfloat; ldh: ptr cint; iloz: ptr cint;
            ihiz: ptr cint; z: ptr cfloat; ldz: ptr cint; ns: ptr cint; nd: ptr cint;
            sr: ptr cfloat; si: ptr cfloat; v: ptr cfloat; ldv: ptr cint; nh: ptr cint;
            t: ptr cfloat; ldt: ptr cint; nv: ptr cint; wv: ptr cfloat; ldwv: ptr cint;
            work: ptr cfloat; lwork: ptr cint): cint {.stdcall, discardable, importc: "slaqr3_",
    dynlib: lapackName.}

proc laqr4*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr cfloat; ldh: ptr cint; wr: ptr cfloat; wi: ptr cfloat;
            iloz: ptr cint; ihiz: ptr cint; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "slaqr4_",
    dynlib: lapackName.}

proc laqr5*(wantt: ptr cint; wantz: ptr cint; kacc22: ptr cint; n: ptr cint;
            ktop: ptr cint; kbot: ptr cint; nshfts: ptr cint; sr: ptr cfloat;
            si: ptr cfloat; h: ptr cfloat; ldh: ptr cint; iloz: ptr cint; ihiz: ptr cint;
            z: ptr cfloat; ldz: ptr cint; v: ptr cfloat; ldv: ptr cint; u: ptr cfloat;
            ldu: ptr cint; nv: ptr cint; wv: ptr cfloat; ldwv: ptr cint; nh: ptr cint;
            wh: ptr cfloat; ldwh: ptr cint): cint {.stdcall, discardable, importc: "slaqr5_",
    dynlib: lapackName.}

proc laqsb*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat; ldab: ptr cint;
            s: ptr cfloat; scond: ptr cfloat; amax: ptr cfloat; equed: cstring): cint {.
    stdcall, discardable, importc: "slaqsb_", dynlib: lapackName.}

proc laqsp*(uplo: cstring; n: ptr cint; ap: ptr cfloat; s: ptr cfloat; scond: ptr cfloat;
            amax: ptr cfloat; equed: cstring): cint {.stdcall, discardable, importc: "slaqsp_",
    dynlib: lapackName.}

proc laqsy*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; s: ptr cfloat;
            scond: ptr cfloat; amax: ptr cfloat; equed: cstring): cint {.stdcall, discardable,
    importc: "slaqsy_", dynlib: lapackName.}

proc laqtr*(ltran: ptr cint; lreal: ptr cint; n: ptr cint; t: ptr cfloat;
            ldt: ptr cint; b: ptr cfloat; w: ptr cfloat; scale: ptr cfloat; x: ptr cfloat;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "slaqtr_",
    dynlib: lapackName.}

proc lar1v*(n: ptr cint; b1: ptr cint; bn: ptr cint; lambda: ptr cfloat; d: ptr cfloat;
            l: ptr cfloat; ld: ptr cfloat; lld: ptr cfloat; pivmin: ptr cfloat;
            gaptol: ptr cfloat; z: ptr cfloat; wantnc: ptr cint; negcnt: ptr cint;
            ztz: ptr cfloat; mingma: ptr cfloat; r: ptr cint; isuppz: ptr cint;
            nrminv: ptr cfloat; resid: ptr cfloat; rqcorr: ptr cfloat; work: ptr cfloat): cint {.
    stdcall, discardable, importc: "slar1v_", dynlib: lapackName.}

proc lar2v*(n: ptr cint; x: ptr cfloat; y: ptr cfloat; z: ptr cfloat; incx: ptr cint;
            c: ptr cfloat; s: ptr cfloat; incc: ptr cint): cint {.stdcall, discardable,
    importc: "slar2v_", dynlib: lapackName.}

proc larf*(side: cstring; m: ptr cint; n: ptr cint; v: ptr cfloat; incv: ptr cint;
           tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint; work: ptr cfloat): cint {.stdcall, discardable,
    importc: "slarf_", dynlib: lapackName.}

proc larfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; v: ptr cfloat; ldv: ptr cint; t: ptr cfloat;
            ldt: ptr cint; c: ptr cfloat; ldc: ptr cint; work: ptr cfloat; ldwork: ptr cint): cint {.
    stdcall, discardable, importc: "slarfb_", dynlib: lapackName.}

proc larfg*(n: ptr cint; alpha: ptr cfloat; x: ptr cfloat; incx: ptr cint; tau: ptr cfloat): cint {.
    stdcall, discardable, importc: "slarfg_", dynlib: lapackName.}

# proc larfp*(n: ptr cint; alpha: ptr cfloat; x: ptr cfloat; incx: ptr cint; tau: ptr cfloat): cint {.
#     stdcall, discardable, importc: "slarfp_", dynlib: lapackName.}

proc larft*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint; v: ptr cfloat;
            ldv: ptr cint; tau: ptr cfloat; t: ptr cfloat; ldt: ptr cint): cint {.stdcall, discardable,
    importc: "slarft_", dynlib: lapackName.}

proc larfx*(side: cstring; m: ptr cint; n: ptr cint; v: ptr cfloat; tau: ptr cfloat;
            c: ptr cfloat; ldc: ptr cint; work: ptr cfloat): cint {.stdcall, discardable,
    importc: "slarfx_", dynlib: lapackName.}

proc largv*(n: ptr cint; x: ptr cfloat; incx: ptr cint; y: ptr cfloat; incy: ptr cint;
            c: ptr cfloat; incc: ptr cint): cint {.stdcall, discardable, importc: "slargv_",
    dynlib: lapackName.}

proc larnv*(idist: ptr cint; iseed: ptr cint; n: ptr cint; x: ptr cfloat): cint {.stdcall, discardable,
    importc: "slarnv_", dynlib: lapackName.}

proc larra*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; e2: ptr cfloat; spltol: ptr cfloat;
            tnrm: ptr cfloat; nsplit: ptr cint; isplit: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "slarra_", dynlib: lapackName.}

proc larrb*(n: ptr cint; d: ptr cfloat; lld: ptr cfloat; ifirst: ptr cint; ilast: ptr cint;
            rtol1: ptr cfloat; rtol2: ptr cfloat; offset: ptr cint; w: ptr cfloat;
            wgap: ptr cfloat; werr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            pivmin: ptr cfloat; spdiam: ptr cfloat; twist: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "slarrb_", dynlib: lapackName.}

proc larrc*(jobt: cstring; n: ptr cint; vl: ptr cfloat; vu: ptr cfloat; d: ptr cfloat;
            e: ptr cfloat; pivmin: ptr cfloat; eigcnt: ptr cint; lcnt: ptr cint;
            rcnt: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "slarrc_",
    dynlib: lapackName.}

proc larrd*(range: cstring; order: cstring; n: ptr cint; vl: ptr cfloat; vu: ptr cfloat;
            il: ptr cint; iu: ptr cint; gers: ptr cfloat; reltol: ptr cfloat; d: ptr cfloat;
            e: ptr cfloat; e2: ptr cfloat; pivmin: ptr cfloat; nsplit: ptr cint;
            isplit: ptr cint; m: ptr cint; w: ptr cfloat; werr: ptr cfloat; wl: ptr cfloat;
            wu: ptr cfloat; iblock: ptr cint; indexw: ptr cint; work: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "slarrd_",
    dynlib: lapackName.}

proc larre*(range: cstring; n: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint;
            iu: ptr cint; d: ptr cfloat; e: ptr cfloat; e2: ptr cfloat; rtol1: ptr cfloat;
            rtol2: ptr cfloat; spltol: ptr cfloat; nsplit: ptr cint; isplit: ptr cint;
            m: ptr cint; w: ptr cfloat; werr: ptr cfloat; wgap: ptr cfloat;
            iblock: ptr cint; indexw: ptr cint; gers: ptr cfloat; pivmin: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "slarre_", dynlib: lapackName.}

proc larrf*(n: ptr cint; d: ptr cfloat; l: ptr cfloat; ld: ptr cfloat; clstrt: ptr cint;
            clend: ptr cint; w: ptr cfloat; wgap: ptr cfloat; werr: ptr cfloat;
            spdiam: ptr cfloat; clgapl: ptr cfloat; clgapr: ptr cfloat;
            pivmin: ptr cfloat; sigma: ptr cfloat; dplus: ptr cfloat; lplus: ptr cfloat;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "slarrf_",
    dynlib: lapackName.}

proc larrj*(n: ptr cint; d: ptr cfloat; e2: ptr cfloat; ifirst: ptr cint; ilast: ptr cint;
            rtol: ptr cfloat; offset: ptr cint; w: ptr cfloat; werr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; pivmin: ptr cfloat; spdiam: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "slarrj_", dynlib: lapackName.}

proc larrk*(n: ptr cint; iw: ptr cint; gl: ptr cfloat; gu: ptr cfloat; d: ptr cfloat;
            e2: ptr cfloat; pivmin: ptr cfloat; reltol: ptr cfloat; w: ptr cfloat;
            werr: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "slarrk_",
    dynlib: lapackName.}

proc larrr*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "slarrr_", dynlib: lapackName.}

proc larrv*(n: ptr cint; vl: ptr cfloat; vu: ptr cfloat; d: ptr cfloat; l: ptr cfloat;
            pivmin: ptr cfloat; isplit: ptr cint; m: ptr cint; dol: ptr cint; dou: ptr cint;
            minrgp: ptr cfloat; rtol1: ptr cfloat; rtol2: ptr cfloat; w: ptr cfloat;
            werr: ptr cfloat; wgap: ptr cfloat; iblock: ptr cint; indexw: ptr cint;
            gers: ptr cfloat; z: ptr cfloat; ldz: ptr cint; isuppz: ptr cint;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "slarrv_", dynlib: lapackName.}

# proc larscl2*(m: ptr cint; n: ptr cint; d: ptr cfloat; x: ptr cfloat; ldx: ptr cint): cint {.
#     stdcall, discardable, importc: "slarscl2_", dynlib: lapackName.}

proc lartg*(f: ptr cfloat; g: ptr cfloat; cs: ptr cfloat; sn: ptr cfloat; r: ptr cfloat): cint {.
    stdcall, discardable, importc: "slartg_", dynlib: lapackName.}

proc lartv*(n: ptr cint; x: ptr cfloat; incx: ptr cint; y: ptr cfloat; incy: ptr cint;
            c: ptr cfloat; s: ptr cfloat; incc: ptr cint): cint {.stdcall, discardable,
    importc: "slartv_", dynlib: lapackName.}

proc laruv*(iseed: ptr cint; n: ptr cint; x: ptr cfloat): cint {.stdcall, discardable,
    importc: "slaruv_", dynlib: lapackName.}

proc larz*(side: cstring; m: ptr cint; n: ptr cint; l: ptr cint; v: ptr cfloat;
           incv: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint; work: ptr cfloat): cint {.
    stdcall, discardable, importc: "slarz_", dynlib: lapackName.}

proc larzb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; l: ptr cint; v: ptr cfloat; ldv: ptr cint;
            t: ptr cfloat; ldt: ptr cint; c: ptr cfloat; ldc: ptr cint; work: ptr cfloat;
            ldwork: ptr cint): cint {.stdcall, discardable, importc: "slarzb_", dynlib: lapackName.}

proc larzt*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint; v: ptr cfloat;
            ldv: ptr cint; tau: ptr cfloat; t: ptr cfloat; ldt: ptr cint): cint {.stdcall, discardable,
    importc: "slarzt_", dynlib: lapackName.}

proc las2*(f: ptr cfloat; g: ptr cfloat; h: ptr cfloat; ssmin: ptr cfloat; ssmax: ptr cfloat): cint {.
    stdcall, discardable, importc: "slas2_", dynlib: lapackName.}

proc lascl*(`type`: cstring; kl: ptr cint; ku: ptr cint; cfrom: ptr cfloat;
            cto: ptr cfloat; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "slascl_", dynlib: lapackName.}

# proc lascl2*(m: ptr cint; n: ptr cint; d: ptr cfloat; x: ptr cfloat; ldx: ptr cint): cint {.
#     stdcall, discardable, importc: "slascl2_", dynlib: lapackName.}

proc lasd0*(n: ptr cint; sqre: ptr cint; d: ptr cfloat; e: ptr cfloat; u: ptr cfloat;
            ldu: ptr cint; vt: ptr cfloat; ldvt: ptr cint; smlsiz: ptr cint;
            iwork: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "slasd0_", dynlib: lapackName.}

proc lasd1*(nl: ptr cint; nr: ptr cint; sqre: ptr cint; d: ptr cfloat; alpha: ptr cfloat;
            beta: ptr cfloat; u: ptr cfloat; ldu: ptr cint; vt: ptr cfloat; ldvt: ptr cint;
            idxq: ptr cint; iwork: ptr cint; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "slasd1_", dynlib: lapackName.}

proc lasd2*(nl: ptr cint; nr: ptr cint; sqre: ptr cint; k: ptr cint; d: ptr cfloat;
            z: ptr cfloat; alpha: ptr cfloat; beta: ptr cfloat; u: ptr cfloat;
            ldu: ptr cint; vt: ptr cfloat; ldvt: ptr cint; dsigma: ptr cfloat;
            u2: ptr cfloat; ldu2: ptr cint; vt2: ptr cfloat; ldvt2: ptr cint;
            idxp: ptr cint; idx: ptr cint; idxc: ptr cint; idxq: ptr cint; coltyp: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "slasd2_", dynlib: lapackName.}

proc lasd3*(nl: ptr cint; nr: ptr cint; sqre: ptr cint; k: ptr cint; d: ptr cfloat;
            q: ptr cfloat; ldq: ptr cint; dsigma: ptr cfloat; u: ptr cfloat; ldu: ptr cint;
            u2: ptr cfloat; ldu2: ptr cint; vt: ptr cfloat; ldvt: ptr cint; vt2: ptr cfloat;
            ldvt2: ptr cint; idxc: ptr cint; ctot: ptr cint; z: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "slasd3_", dynlib: lapackName.}

proc lasd4*(n: ptr cint; i: ptr cint; d: ptr cfloat; z: ptr cfloat; delta: ptr cfloat;
            rho: ptr cfloat; sigma: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "slasd4_", dynlib: lapackName.}

proc lasd5*(i: ptr cint; d: ptr cfloat; z: ptr cfloat; delta: ptr cfloat; rho: ptr cfloat;
            dsigma: ptr cfloat; work: ptr cfloat): cint {.stdcall, discardable, importc: "slasd5_",
    dynlib: lapackName.}

proc lasd6*(icompq: ptr cint; nl: ptr cint; nr: ptr cint; sqre: ptr cint; d: ptr cfloat;
            vf: ptr cfloat; vl: ptr cfloat; alpha: ptr cfloat; beta: ptr cfloat;
            idxq: ptr cint; perm: ptr cint; givptr: ptr cint; givcol: ptr cint;
            ldgcol: ptr cint; givnum: ptr cfloat; ldgnum: ptr cint; poles: ptr cfloat;
            difl: ptr cfloat; difr: ptr cfloat; z: ptr cfloat; k: ptr cint; c: ptr cfloat;
            s: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "slasd6_", dynlib: lapackName.}

proc lasd7*(icompq: ptr cint; nl: ptr cint; nr: ptr cint; sqre: ptr cint; k: ptr cint;
            d: ptr cfloat; z: ptr cfloat; zw: ptr cfloat; vf: ptr cfloat; vfw: ptr cfloat;
            vl: ptr cfloat; vlw: ptr cfloat; alpha: ptr cfloat; beta: ptr cfloat;
            dsigma: ptr cfloat; idx: ptr cint; idxp: ptr cint; idxq: ptr cint;
            perm: ptr cint; givptr: ptr cint; givcol: ptr cint; ldgcol: ptr cint;
            givnum: ptr cfloat; ldgnum: ptr cint; c: ptr cfloat; s: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "slasd7_", dynlib: lapackName.}

proc lasd8*(icompq: ptr cint; k: ptr cint; d: ptr cfloat; z: ptr cfloat; vf: ptr cfloat;
            vl: ptr cfloat; difl: ptr cfloat; difr: ptr cfloat; lddifr: ptr cint;
            dsigma: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "slasd8_", dynlib: lapackName.}

proc lasda*(icompq: ptr cint; smlsiz: ptr cint; n: ptr cint; sqre: ptr cint; d: ptr cfloat;
            e: ptr cfloat; u: ptr cfloat; ldu: ptr cint; vt: ptr cfloat; k: ptr cint;
            difl: ptr cfloat; difr: ptr cfloat; z: ptr cfloat; poles: ptr cfloat;
            givptr: ptr cint; givcol: ptr cint; ldgcol: ptr cint; perm: ptr cint;
            givnum: ptr cfloat; c: ptr cfloat; s: ptr cfloat; work: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "slasda_",
    dynlib: lapackName.}

proc lasdq*(uplo: cstring; sqre: ptr cint; n: ptr cint; ncvt: ptr cint; nru: ptr cint;
            ncc: ptr cint; d: ptr cfloat; e: ptr cfloat; vt: ptr cfloat; ldvt: ptr cint;
            u: ptr cfloat; ldu: ptr cint; c: ptr cfloat; ldc: ptr cint; work: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "slasdq_", dynlib: lapackName.}

proc slasdt*(n: ptr cint; lvl: ptr cint; nd: ptr cint; inode: ptr cint; ndiml: ptr cint;
            ndimr: ptr cint; msub: ptr cint): cint {.stdcall, discardable, importc: "slasdt_",
    dynlib: lapackName.}

proc laset*(uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr cfloat; beta: ptr cfloat;
            a: ptr cfloat; lda: ptr cint): cint {.stdcall, discardable, importc: "slaset_",
    dynlib: lapackName.}

proc lasq1*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "slasq1_", dynlib: lapackName.}

proc lasq2*(n: ptr cint; z: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "slasq2_", dynlib: lapackName.}

proc lasq3*(i0: ptr cint; n0: ptr cint; z: ptr cfloat; pp: ptr cint; dmin: ptr cfloat;
            sigma: ptr cfloat; desig: ptr cfloat; qmax: ptr cfloat; nfail: ptr cint;
            iter: ptr cint; ndiv: ptr cint; ieee: ptr cint; ttype: ptr cint;
            dmin1: ptr cfloat; dmin2: ptr cfloat; dn: ptr cfloat; dn1: ptr cfloat;
            dn2: ptr cfloat; g: ptr cfloat; tau: ptr cfloat): cint {.stdcall, discardable,
    importc: "slasq3_", dynlib: lapackName.}

proc lasq4*(i0: ptr cint; n0: ptr cint; z: ptr cfloat; pp: ptr cint; n0in: ptr cint;
            dmin: ptr cfloat; dmin1: ptr cfloat; dmin2: ptr cfloat; dn: ptr cfloat;
            dn1: ptr cfloat; dn2: ptr cfloat; tau: ptr cfloat; ttype: ptr cint;
            g: ptr cfloat): cint {.stdcall, discardable, importc: "slasq4_", dynlib: lapackName.}

proc lasq5*(i0: ptr cint; n0: ptr cint; z: ptr cfloat; pp: ptr cint; tau: ptr cfloat;
            dmin: ptr cfloat; dmin1: ptr cfloat; dmin2: ptr cfloat; dn: ptr cfloat;
            dnm1: ptr cfloat; dnm2: ptr cfloat; ieee: ptr cint): cint {.stdcall, discardable,
    importc: "slasq5_", dynlib: lapackName.}

proc lasq6*(i0: ptr cint; n0: ptr cint; z: ptr cfloat; pp: ptr cint; dmin: ptr cfloat;
            dmin1: ptr cfloat; dmin2: ptr cfloat; dn: ptr cfloat; dnm1: ptr cfloat;
            dnm2: ptr cfloat): cint {.stdcall, discardable, importc: "slasq6_", dynlib: lapackName.}

proc lasr*(side: cstring; pivot: cstring; direct: cstring; m: ptr cint; n: ptr cint;
           c: ptr cfloat; s: ptr cfloat; a: ptr cfloat; lda: ptr cint): cint {.stdcall, discardable,
    importc: "slasr_", dynlib: lapackName.}

proc lasrt*(id: cstring; n: ptr cint; d: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "slasrt_", dynlib: lapackName.}

proc lassq*(n: ptr cint; x: ptr cfloat; incx: ptr cint; scale: ptr cfloat; sumsq: ptr cfloat): cint {.
    stdcall, discardable, importc: "slassq_", dynlib: lapackName.}

proc lasv2*(f: ptr cfloat; g: ptr cfloat; h: ptr cfloat; ssmin: ptr cfloat;
            ssmax: ptr cfloat; snr: ptr cfloat; csr: ptr cfloat; snl: ptr cfloat;
            csl: ptr cfloat): cint {.stdcall, discardable, importc: "slasv2_", dynlib: lapackName.}

proc laswp*(n: ptr cint; a: ptr cfloat; lda: ptr cint; k1: ptr cint; k2: ptr cint;
            ipiv: ptr cint; incx: ptr cint): cint {.stdcall, discardable, importc: "slaswp_",
    dynlib: lapackName.}

proc lasy2*(ltranl: ptr cint; ltranr: ptr cint; isgn: ptr cint; n1: ptr cint;
            n2: ptr cint; tl: ptr cfloat; ldtl: ptr cint; tr: ptr cfloat; ldtr: ptr cint;
            b: ptr cfloat; ldb: ptr cint; scale: ptr cfloat; x: ptr cfloat; ldx: ptr cint;
            xnorm: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "slasy2_",
    dynlib: lapackName.}

proc lasyf*(uplo: cstring; n: ptr cint; nb: ptr cint; kb: ptr cint; a: ptr cfloat;
            lda: ptr cint; ipiv: ptr cint; w: ptr cfloat; ldw: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "slasyf_", dynlib: lapackName.}

proc latbs*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            kd: ptr cint; ab: ptr cfloat; ldab: ptr cint; x: ptr cfloat; scale: ptr cfloat;
            cnorm: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "slatbs_",
    dynlib: lapackName.}

proc latdf*(ijob: ptr cint; n: ptr cint; z: ptr cfloat; ldz: ptr cint; rhs: ptr cfloat;
            rdsum: ptr cfloat; rdscal: ptr cfloat; ipiv: ptr cint; jpiv: ptr cint): cint {.
    stdcall, discardable, importc: "slatdf_", dynlib: lapackName.}

proc latps*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            ap: ptr cfloat; x: ptr cfloat; scale: ptr cfloat; cnorm: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "slatps_", dynlib: lapackName.}

proc latrd*(uplo: cstring; n: ptr cint; nb: ptr cint; a: ptr cfloat; lda: ptr cint;
            e: ptr cfloat; tau: ptr cfloat; w: ptr cfloat; ldw: ptr cint): cint {.stdcall, discardable,
    importc: "slatrd_", dynlib: lapackName.}

proc latrs*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; x: ptr cfloat; scale: ptr cfloat;
            cnorm: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "slatrs_",
    dynlib: lapackName.}

proc latrz*(m: ptr cint; n: ptr cint; l: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat): cint {.stdcall, discardable, importc: "slatrz_",
    dynlib: lapackName.}

proc latzm*(side: cstring; m: ptr cint; n: ptr cint; v: ptr cfloat; incv: ptr cint;
            tau: ptr cfloat; c1: ptr cfloat; c2: ptr cfloat; ldc: ptr cint; work: ptr cfloat): cint {.
    stdcall, discardable, importc: "slatzm_", dynlib: lapackName.}

proc lauu2*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "slauu2_", dynlib: lapackName.}

proc lauum*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "slauum_", dynlib: lapackName.}

proc opgtr*(uplo: cstring; n: ptr cint; ap: ptr cfloat; tau: ptr cfloat; q: ptr cfloat;
            ldq: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sopgtr_", dynlib: lapackName.}

proc opmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            ap: ptr cfloat; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint; work: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "sopmtr_", dynlib: lapackName.}

proc org2l*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sorg2l_", dynlib: lapackName.}

proc org2r*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sorg2r_", dynlib: lapackName.}

proc orgbr*(vect: cstring; m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat;
            lda: ptr cint; tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sorgbr_", dynlib: lapackName.}

proc orghr*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sorghr_", dynlib: lapackName.}

proc orgl2*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sorgl2_", dynlib: lapackName.}

proc orglq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sorglq_", dynlib: lapackName.}

proc orgql*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sorgql_", dynlib: lapackName.}

proc orgqr*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sorgqr_", dynlib: lapackName.}

proc orgr2*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sorgr2_", dynlib: lapackName.}

proc orgrq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sorgrq_", dynlib: lapackName.}

proc orgtr*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sorgtr_", dynlib: lapackName.}

proc orm2l*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sorm2l_",
    dynlib: lapackName.}

proc orm2r*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sorm2r_",
    dynlib: lapackName.}

proc ormbr*(vect: cstring; side: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            k: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat;
            ldc: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sormbr_", dynlib: lapackName.}

proc ormhr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat;
            ldc: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sormhr_", dynlib: lapackName.}

proc orml2*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sorml2_",
    dynlib: lapackName.}

proc ormlq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sormlq_", dynlib: lapackName.}

proc ormql*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sormql_", dynlib: lapackName.}

proc ormqr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sormqr_", dynlib: lapackName.}

proc ormr2*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sormr2_",
    dynlib: lapackName.}

proc ormr3*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat;
            ldc: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sormr3_", dynlib: lapackName.}

proc ormrq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sormrq_", dynlib: lapackName.}

proc ormrz*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat;
            ldc: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sormrz_", dynlib: lapackName.}

proc ormtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sormtr_", dynlib: lapackName.}

proc pbcon*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat; ldab: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "spbcon_", dynlib: lapackName.}

proc pbequ*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat; ldab: ptr cint;
            s: ptr cfloat; scond: ptr cfloat; amax: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "spbequ_", dynlib: lapackName.}

proc pbrfs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; afb: ptr cfloat; ldafb: ptr cint; b: ptr cfloat; ldb: ptr cint;
            x: ptr cfloat; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "spbrfs_", dynlib: lapackName.}

proc pbstf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "spbstf_", dynlib: lapackName.}

proc pbsv*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cfloat;
           ldab: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "spbsv_", dynlib: lapackName.}

proc pbsvx*(fact: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; afb: ptr cfloat; ldafb: ptr cint;
            equed: cstring; s: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "spbsvx_", dynlib: lapackName.}

proc pbtf2*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "spbtf2_", dynlib: lapackName.}

proc pbtrf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "spbtrf_", dynlib: lapackName.}

proc pbtrs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "spbtrs_", dynlib: lapackName.}

proc pftrf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "spftrf_", dynlib: lapackName.}

proc pftri*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "spftri_", dynlib: lapackName.}

proc pftrs*(transr: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "spftrs_", dynlib: lapackName.}

proc pocon*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "spocon_", dynlib: lapackName.}

proc poequ*(n: ptr cint; a: ptr cfloat; lda: ptr cint; s: ptr cfloat; scond: ptr cfloat;
            amax: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "spoequ_",
    dynlib: lapackName.}

proc poequb*(n: ptr cint; a: ptr cfloat; lda: ptr cint; s: ptr cfloat; scond: ptr cfloat;
             amax: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "spoequb_",
    dynlib: lapackName.}

proc porfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            af: ptr cfloat; ldaf: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sporfs_",
    dynlib: lapackName.}

# proc porfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
#              lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; s: ptr cfloat; b: ptr cfloat;
#              ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
#              berr: ptr cfloat; nErrBnds: ptr cint; errBndsNorm: ptr cfloat;
#              errBndsComp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
#              work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
#     importc: "sporfsx_", dynlib: lapackName.}

proc posv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
           b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sposv_", dynlib: lapackName.}

proc posvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
            lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; equed: cstring; s: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sposvx_", dynlib: lapackName.}

# proc posvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
#              lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; equed: cstring; s: ptr cfloat;
#              b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
#              rpvgrw: ptr cfloat; berr: ptr cfloat; nErrBnds: ptr cint;
#              errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat; nparams: ptr cint;
#              params: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
#     stdcall, discardable, importc: "sposvxx_", dynlib: lapackName.}

proc potf2*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "spotf2_", dynlib: lapackName.}

proc potrf*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "spotrf_", dynlib: lapackName.}

proc potri*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "spotri_", dynlib: lapackName.}

proc potrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "spotrs_", dynlib: lapackName.}

proc ppcon*(uplo: cstring; n: ptr cint; ap: ptr cfloat; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sppcon_", dynlib: lapackName.}

proc ppequ*(uplo: cstring; n: ptr cint; ap: ptr cfloat; s: ptr cfloat; scond: ptr cfloat;
            amax: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sppequ_",
    dynlib: lapackName.}

proc pprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; afp: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "spprfs_", dynlib: lapackName.}

proc ppsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; b: ptr cfloat;
           ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sppsv_",
    dynlib: lapackName.}

proc ppsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat;
            afp: ptr cfloat; equed: cstring; s: ptr cfloat; b: ptr cfloat; ldb: ptr cint;
            x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sppsvx_", dynlib: lapackName.}

proc pptrf*(uplo: cstring; n: ptr cint; ap: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "spptrf_", dynlib: lapackName.}

proc pptri*(uplo: cstring; n: ptr cint; ap: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "spptri_", dynlib: lapackName.}

proc pptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; b: ptr cfloat;
            ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "spptrs_",
    dynlib: lapackName.}

proc pstf2*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; piv: ptr cint;
            rank: ptr cint; tol: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "spstf2_", dynlib: lapackName.}

proc pstrf*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; piv: ptr cint;
            rank: ptr cint; tol: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "spstrf_", dynlib: lapackName.}

proc ptcon*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; anorm: ptr cfloat; rcond: ptr cfloat;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sptcon_",
    dynlib: lapackName.}

proc pteqr*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "spteqr_", dynlib: lapackName.}

proc ptrfs*(n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr cfloat; df: ptr cfloat;
            ef: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "sptrfs_", dynlib: lapackName.}

proc ptsv*(n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr cfloat; b: ptr cfloat;
           ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sptsv_",
    dynlib: lapackName.}

proc ptsvx*(fact: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr cfloat;
            df: ptr cfloat; ef: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "sptsvx_",
    dynlib: lapackName.}

proc pttrf*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "spttrf_", dynlib: lapackName.}

proc pttrs*(n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr cfloat; b: ptr cfloat;
            ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "spttrs_",
    dynlib: lapackName.}

proc ptts2*(n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr cfloat; b: ptr cfloat;
            ldb: ptr cint): cint {.stdcall, discardable, importc: "sptts2_", dynlib: lapackName.}

proc rscl*(n: ptr cint; sa: ptr cfloat; sx: ptr cfloat; incx: ptr cint): cint {.stdcall, discardable,
    importc: "srscl_", dynlib: lapackName.}

proc sbev*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat;
           ldab: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
           info: ptr cint): cint {.stdcall, discardable, importc: "ssbev_", dynlib: lapackName.}

proc sbevd*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ssbevd_", dynlib: lapackName.}

proc sbevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; q: ptr cfloat; ldq: ptr cint; vl: ptr cfloat;
            vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat; m: ptr cint;
            w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "ssbevx_",
    dynlib: lapackName.}

proc sbgst*(vect: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; bb: ptr cfloat; ldbb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssbgst_", dynlib: lapackName.}

proc sbgv*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
           ab: ptr cfloat; ldab: ptr cint; bb: ptr cfloat; ldbb: ptr cint; w: ptr cfloat;
           z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssbgv_", dynlib: lapackName.}

proc sbgvd*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; bb: ptr cfloat; ldbb: ptr cint; w: ptr cfloat;
            z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssbgvd_", dynlib: lapackName.}

proc sbgvx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ka: ptr cint;
            kb: ptr cint; ab: ptr cfloat; ldab: ptr cint; bb: ptr cfloat; ldbb: ptr cint;
            q: ptr cfloat; ldq: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint;
            iu: ptr cint; abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ssbgvx_", dynlib: lapackName.}

proc sbtrd*(vect: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; d: ptr cfloat; e: ptr cfloat; q: ptr cfloat; ldq: ptr cint;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "ssbtrd_",
    dynlib: lapackName.}

proc sfrk*(transr: cstring; uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint;
           alpha: ptr cfloat; a: ptr cfloat; lda: ptr cint; beta: ptr cfloat; c: ptr cfloat): cint {.
    stdcall, discardable, importc: "ssfrk_", dynlib: lapackName.}

proc spcon*(uplo: cstring; n: ptr cint; ap: ptr cfloat; ipiv: ptr cint; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sspcon_", dynlib: lapackName.}

proc spev*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat; w: ptr cfloat;
           z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sspev_", dynlib: lapackName.}

proc spevd*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat; w: ptr cfloat;
            z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sspevd_", dynlib: lapackName.}

proc spevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sspevx_", dynlib: lapackName.}

proc spgst*(itype: ptr cint; uplo: cstring; n: ptr cint; ap: ptr cfloat; bp: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "sspgst_", dynlib: lapackName.}

proc spgv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat;
           bp: ptr cfloat; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
           info: ptr cint): cint {.stdcall, discardable, importc: "sspgv_", dynlib: lapackName.}

proc spgvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat;
            bp: ptr cfloat; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sspgvd_", dynlib: lapackName.}

proc spgvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            ap: ptr cfloat; bp: ptr cfloat; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint;
            iu: ptr cint; abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sspgvx_", dynlib: lapackName.}

proc sprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; afp: ptr cfloat;
            ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ssprfs_", dynlib: lapackName.}

proc spsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; ipiv: ptr cint;
           b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sspsv_", dynlib: lapackName.}

proc spsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat;
            afp: ptr cfloat; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sspsvx_", dynlib: lapackName.}

proc sptrd*(uplo: cstring; n: ptr cint; ap: ptr cfloat; d: ptr cfloat; e: ptr cfloat;
            tau: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "ssptrd_",
    dynlib: lapackName.}

proc sptrf*(uplo: cstring; n: ptr cint; ap: ptr cfloat; ipiv: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ssptrf_", dynlib: lapackName.}

proc sptri*(uplo: cstring; n: ptr cint; ap: ptr cfloat; ipiv: ptr cint; work: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "ssptri_", dynlib: lapackName.}

proc sptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; ipiv: ptr cint;
            b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssptrs_", dynlib: lapackName.}

proc stebz*(range: cstring; order: cstring; n: ptr cint; vl: ptr cfloat; vu: ptr cfloat;
            il: ptr cint; iu: ptr cint; abstol: ptr cfloat; d: ptr cfloat; e: ptr cfloat;
            m: ptr cint; nsplit: ptr cint; w: ptr cfloat; iblock: ptr cint;
            isplit: ptr cint; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sstebz_", dynlib: lapackName.}

proc stedc*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sstedc_",
    dynlib: lapackName.}

proc stegr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; isuppz: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sstegr_", dynlib: lapackName.}

proc stein*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; m: ptr cint; w: ptr cfloat;
            iblock: ptr cint; isplit: ptr cint; z: ptr cfloat; ldz: ptr cint;
            work: ptr cfloat; iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "sstein_", dynlib: lapackName.}

proc stemr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; m: ptr cint;
            w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; nzc: ptr cint; isuppz: ptr cint;
            tryrac: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sstemr_",
    dynlib: lapackName.}

proc steqr*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssteqr_", dynlib: lapackName.}

proc sterf*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssterf_", dynlib: lapackName.}

proc stev*(jobz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr cfloat;
           ldz: ptr cint; work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "sstev_", dynlib: lapackName.}

proc stevd*(jobz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "sstevd_",
    dynlib: lapackName.}

proc stevr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; isuppz: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "sstevr_", dynlib: lapackName.}

proc stevx*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "sstevx_", dynlib: lapackName.}

proc sycon*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ssycon_", dynlib: lapackName.}

proc syequb*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; s: ptr cfloat;
             scond: ptr cfloat; amax: ptr cfloat; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "ssyequb_", dynlib: lapackName.}

proc syev*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
           w: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssyev_", dynlib: lapackName.}

proc syevd*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            w: ptr cfloat; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "ssyevd_",
    dynlib: lapackName.}

proc syevr*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint;
            abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "ssyevr_",
    dynlib: lapackName.}

proc syevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint;
            abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ssyevx_", dynlib: lapackName.}

proc sygs2*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssygs2_", dynlib: lapackName.}

proc sygst*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssygst_", dynlib: lapackName.}

proc sygv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat;
           lda: ptr cint; b: ptr cfloat; ldb: ptr cint; w: ptr cfloat; work: ptr cfloat;
           lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "ssygv_",
    dynlib: lapackName.}

proc sygvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; b: ptr cfloat; ldb: ptr cint; w: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ssygvd_", dynlib: lapackName.}

proc sygvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; vl: ptr cfloat;
            vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat; m: ptr cint;
            w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssygvx_", dynlib: lapackName.}

proc syrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint;
            x: ptr cfloat; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssyrfs_", dynlib: lapackName.}

# proc syrfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
#              lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; s: ptr cfloat;
#              b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
#              berr: ptr cfloat; nErrBnds: ptr cint; errBndsNorm: ptr cfloat;
#              errBndsComp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
#              work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
#     importc: "ssyrfsx_", dynlib: lapackName.}

proc sysv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
           ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; work: ptr cfloat; lwork: ptr cint;
           info: ptr cint): cint {.stdcall, discardable, importc: "ssysv_", dynlib: lapackName.}

proc sysvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
            lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; b: ptr cfloat;
            ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "ssysvx_",
    dynlib: lapackName.}

# proc sysvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
#              lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
#              s: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
#              rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat; nErrBnds: ptr cint;
#              errBndsNorm: ptr cfloat; errBndsComp: ptr cfloat; nparams: ptr cint;
#              params: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
#     stdcall, discardable, importc: "ssysvxx_", dynlib: lapackName.}

proc sytd2*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; d: ptr cfloat;
            e: ptr cfloat; tau: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssytd2_", dynlib: lapackName.}

proc sytf2*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ssytf2_", dynlib: lapackName.}

proc sytrd*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; d: ptr cfloat;
            e: ptr cfloat; tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ssytrd_", dynlib: lapackName.}

proc sytrf*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssytrf_", dynlib: lapackName.}

proc sytri*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "ssytri_",
    dynlib: lapackName.}

proc sytrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ssytrs_", dynlib: lapackName.}

proc tbcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; rcond: ptr cfloat; work: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "stbcon_",
    dynlib: lapackName.}

proc tbrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr cfloat; ldab: ptr cint; b: ptr cfloat; ldb: ptr cint;
            x: ptr cfloat; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "stbrfs_", dynlib: lapackName.}

proc tbtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr cfloat; ldab: ptr cint; b: ptr cfloat; ldb: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "stbtrs_", dynlib: lapackName.}

proc tfsm*(transr: cstring; side: cstring; uplo: cstring; trans: cstring; diag: cstring;
           m: ptr cint; n: ptr cint; alpha: ptr cfloat; a: ptr cfloat; b: ptr cfloat;
           ldb: ptr cint): cint {.stdcall, discardable, importc: "stfsm_", dynlib: lapackName.}

proc tftri*(transr: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "stftri_", dynlib: lapackName.}

proc tfttp*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr cfloat; ap: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "stfttp_", dynlib: lapackName.}

proc tfttr*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr cfloat; a: ptr cfloat;
            lda: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "stfttr_",
    dynlib: lapackName.}

proc tgevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            s: ptr cfloat; lds: ptr cint; p: ptr cfloat; ldp: ptr cint; vl: ptr cfloat;
            ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint; mm: ptr cint; m: ptr cint;
            work: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "stgevc_",
    dynlib: lapackName.}

proc tgex2*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; b: ptr cfloat; ldb: ptr cint; q: ptr cfloat; ldq: ptr cint;
            z: ptr cfloat; ldz: ptr cint; j1: ptr cint; n1: ptr cint; n2: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "stgex2_", dynlib: lapackName.}

proc tgexc*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; b: ptr cfloat; ldb: ptr cint; q: ptr cfloat; ldq: ptr cint;
            z: ptr cfloat; ldz: ptr cint; ifst: ptr cint; ilst: ptr cint; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "stgexc_",
    dynlib: lapackName.}

proc tgsen*(ijob: ptr cint; wantq: ptr cint; wantz: ptr cint; select: ptr cint;
            n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint;
            alphar: ptr cfloat; alphai: ptr cfloat; beta: ptr cfloat; q: ptr cfloat;
            ldq: ptr cint; z: ptr cfloat; ldz: ptr cint; m: ptr cint; pl: ptr cfloat;
            pr: ptr cfloat; dif: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "stgsen_", dynlib: lapackName.}

proc tgsja*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; k: ptr cint; l: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; tola: ptr cfloat; tolb: ptr cfloat; alpha: ptr cfloat;
            beta: ptr cfloat; u: ptr cfloat; ldu: ptr cint; v: ptr cfloat; ldv: ptr cint;
            q: ptr cfloat; ldq: ptr cint; work: ptr cfloat; ncycle: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "stgsja_", dynlib: lapackName.}

proc tgsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; vl: ptr cfloat;
            ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint; s: ptr cfloat; dif: ptr cfloat;
            mm: ptr cint; m: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "stgsna_", dynlib: lapackName.}

proc tgsy2*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; b: ptr cfloat; ldb: ptr cint; c: ptr cfloat; ldc: ptr cint;
            d: ptr cfloat; ldd: ptr cint; e: ptr cfloat; lde: ptr cint; f: ptr cfloat;
            ldf: ptr cint; scale: ptr cfloat; rdsum: ptr cfloat; rdscal: ptr cfloat;
            iwork: ptr cint; pq: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "stgsy2_", dynlib: lapackName.}

proc tgsyl*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; b: ptr cfloat; ldb: ptr cint; c: ptr cfloat; ldc: ptr cint;
            d: ptr cfloat; ldd: ptr cint; e: ptr cfloat; lde: ptr cint; f: ptr cfloat;
            ldf: ptr cint; scale: ptr cfloat; dif: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "stgsyl_", dynlib: lapackName.}

proc tpcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; ap: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "stpcon_", dynlib: lapackName.}

proc tprfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "stprfs_", dynlib: lapackName.}

proc tptri*(uplo: cstring; diag: cstring; n: ptr cint; ap: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "stptri_", dynlib: lapackName.}

proc tptrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr cfloat; b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "stptrs_", dynlib: lapackName.}

proc tpttf*(transr: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat; arf: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "stpttf_", dynlib: lapackName.}

proc tpttr*(uplo: cstring; n: ptr cint; ap: ptr cfloat; a: ptr cfloat; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "stpttr_", dynlib: lapackName.}

proc trcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "strcon_", dynlib: lapackName.}

proc trevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr cfloat; ldt: ptr cint; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat;
            ldvr: ptr cint; mm: ptr cint; m: ptr cint; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "strevc_", dynlib: lapackName.}

proc trexc*(compq: cstring; n: ptr cint; t: ptr cfloat; ldt: ptr cint; q: ptr cfloat;
            ldq: ptr cint; ifst: ptr cint; ilst: ptr cint; work: ptr cfloat; info: ptr cint): cint {.
    stdcall, discardable, importc: "strexc_", dynlib: lapackName.}

proc trrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "strrfs_",
    dynlib: lapackName.}

proc trsen*(job: cstring; compq: cstring; select: ptr cint; n: ptr cint; t: ptr cfloat;
            ldt: ptr cint; q: ptr cfloat; ldq: ptr cint; wr: ptr cfloat; wi: ptr cfloat;
            m: ptr cint; s: ptr cfloat; sep: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "strsen_", dynlib: lapackName.}

proc trsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr cfloat; ldt: ptr cint; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat;
            ldvr: ptr cint; s: ptr cfloat; sep: ptr cfloat; mm: ptr cint; m: ptr cint;
            work: ptr cfloat; ldwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "strsna_", dynlib: lapackName.}

proc trsyl*(trana: cstring; tranb: cstring; isgn: ptr cint; m: ptr cint; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; c: ptr cfloat;
            ldc: ptr cint; scale: ptr cfloat; info: ptr cint): cint {.stdcall, discardable,
    importc: "strsyl_", dynlib: lapackName.}

proc trti2*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "strti2_", dynlib: lapackName.}

proc trtri*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "strtri_", dynlib: lapackName.}

proc trtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "strtrs_", dynlib: lapackName.}

proc trttf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            arf: ptr cfloat; info: ptr cint): cint {.stdcall, discardable, importc: "strttf_",
    dynlib: lapackName.}

proc trttp*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ap: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "strttp_", dynlib: lapackName.}

proc tzrqf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            info: ptr cint): cint {.stdcall, discardable, importc: "stzrqf_", dynlib: lapackName.}

proc tzrzf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "stzrzf_", dynlib: lapackName.}

#proc xerbla*(srname: cstring; info: ptr cint): cint {.stdcall, discardable, importc: "xerbla_",
#    dynlib: lapackName.}

#proc xerblaArray*(srnameArray: cstring; srnameLen: ptr cint; info: ptr cint;
#                 srnameArrayLen: int16): cint {.stdcall, discardable, importc: "xerbla_array__",
#    dynlib: lapackName.}

proc bdsqr*(uplo: cstring; n: ptr cint; ncvt: ptr cint; nru: ptr cint; ncc: ptr cint;
            d: ptr cdouble; e: ptr cdouble; vt: ptr Complex64; ldvt: ptr cint;
            u: ptr Complex64; ldu: ptr cint; c: ptr Complex64; ldc: ptr cint;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zbdsqr_",
    dynlib: lapackName.}

proc cgesv*(n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            b: ptr Complex64; ldb: ptr cint; x: ptr Complex64; ldx: ptr cint;
            work: ptr Complex64; swork: ptr Complex32; rwork: ptr cdouble;
            iter: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zcgesv_",
    dynlib: lapackName.}

proc cposv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; x: ptr Complex64; ldx: ptr cint;
            work: ptr Complex64; swork: ptr Complex32; rwork: ptr cdouble;
            iter: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zcposv_",
    dynlib: lapackName.}

proc drscl*(n: ptr cint; sa: ptr cdouble; sx: ptr Complex64; incx: ptr cint): cint {.stdcall, discardable,
    importc: "zdrscl_", dynlib: lapackName.}

proc gbbrd*(vect: cstring; m: ptr cint; n: ptr cint; ncc: ptr cint; kl: ptr cint;
            ku: ptr cint; ab: ptr Complex64; ldab: ptr cint; d: ptr cdouble; e: ptr cdouble;
            q: ptr Complex64; ldq: ptr cint; pt: ptr Complex64; ldpt: ptr cint;
            c: ptr Complex64; ldc: ptr cint; work: ptr Complex64; rwork: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "zgbbrd_", dynlib: lapackName.}

proc gbcon*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; ipiv: ptr cint; anorm: ptr cdouble; rcond: ptr cdouble;
            work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgbcon_", dynlib: lapackName.}

proc gbequ*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; r: ptr cdouble; c: ptr cdouble; rowcnd: ptr cdouble;
            colcnd: ptr cdouble; amax: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgbequ_", dynlib: lapackName.}

proc gbequb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex64;
             ldab: ptr cint; r: ptr cdouble; c: ptr cdouble; rowcnd: ptr cdouble;
             colcnd: ptr cdouble; amax: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgbequb_", dynlib: lapackName.}

proc gbrfs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr Complex64; ldab: ptr cint; afb: ptr Complex64; ldafb: ptr cint;
            ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint; x: ptr Complex64;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zgbrfs_",
    dynlib: lapackName.}

# proc gbrfsx*(trans: cstring; equed: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#              nrhs: ptr cint; ab: ptr Complex64; ldab: ptr cint; afb: ptr Complex64;
#              ldafb: ptr cint; ipiv: ptr cint; r: ptr cdouble; c: ptr cdouble;
#              b: ptr Complex64; ldb: ptr cint; x: ptr Complex64; ldx: ptr cint;
#              rcond: ptr cdouble; berr: ptr cdouble; nErrBnds: ptr cint;
#              errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble; nparams: ptr cint;
#              params: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
#     stdcall, discardable, importc: "zgbrfsx_", dynlib: lapackName.}

proc gbsv*(n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr Complex64;
           ldab: ptr cint; ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgbsv_", dynlib: lapackName.}

proc gbsvx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
            nrhs: ptr cint; ab: ptr Complex64; ldab: ptr cint; afb: ptr Complex64;
            ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cdouble;
            c: ptr cdouble; b: ptr Complex64; ldb: ptr cint; x: ptr Complex64;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgbsvx_", dynlib: lapackName.}

# proc gbsvxx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#              nrhs: ptr cint; ab: ptr Complex64; ldab: ptr cint; afb: ptr Complex64;
#              ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cdouble;
#              c: ptr cdouble; b: ptr Complex64; ldb: ptr cint; x: ptr Complex64;
#              ldx: ptr cint; rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
#              nErrBnds: ptr cint; errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble;
#              nparams: ptr cint; params: ptr cdouble; work: ptr Complex64;
#              rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zgbsvxx_",
#     dynlib: lapackName.}

proc gbtf2*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgbtf2_", dynlib: lapackName.}

proc gbtrf*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgbtrf_", dynlib: lapackName.}

proc gbtrs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr Complex64; ldab: ptr cint; ipiv: ptr cint; b: ptr Complex64;
            ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zgbtrs_",
    dynlib: lapackName.}

proc gebak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            scale: ptr cdouble; m: ptr cint; v: ptr Complex64; ldv: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgebak_", dynlib: lapackName.}

proc gebal*(job: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgebal_", dynlib: lapackName.}

proc gebd2*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; d: ptr cdouble;
            e: ptr cdouble; tauq: ptr Complex64; taup: ptr Complex64;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zgebd2_",
    dynlib: lapackName.}

proc gebrd*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; d: ptr cdouble;
            e: ptr cdouble; tauq: ptr Complex64; taup: ptr Complex64;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgebrd_", dynlib: lapackName.}

proc gecon*(norm: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zgecon_",
    dynlib: lapackName.}

proc geequ*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; r: ptr cdouble;
            c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble; amax: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "zgeequ_", dynlib: lapackName.}

proc geequb*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; r: ptr cdouble;
             c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble; amax: ptr cdouble;
             info: ptr cint): cint {.stdcall, discardable, importc: "zgeequb_", dynlib: lapackName.}

proc gees*(jobvs: cstring; sort: cstring; select: proc(ar, ai: ptr cdouble): cint; n: ptr cint; a: ptr Complex64;
           lda: ptr cint; sdim: ptr cint; w: ptr Complex64; vs: ptr Complex64;
           ldvs: ptr cint; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
           bwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zgees_",
    dynlib: lapackName.}

proc geesx*(jobvs: cstring; sort: cstring; select: proc(ar, ai: ptr cdouble): cint; sense: cstring; n: ptr cint;
            a: ptr Complex64; lda: ptr cint; sdim: ptr cint; w: ptr Complex64;
            vs: ptr Complex64; ldvs: ptr cint; rconde: ptr cdouble; rcondv: ptr cdouble;
            work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; bwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zgeesx_", dynlib: lapackName.}

proc geev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
           w: ptr Complex64; vl: ptr Complex64; ldvl: ptr cint; vr: ptr Complex64;
           ldvr: ptr cint; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
           info: ptr cint): cint {.stdcall, discardable, importc: "zgeev_", dynlib: lapackName.}

proc geevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr Complex64; lda: ptr cint; w: ptr Complex64;
            vl: ptr Complex64; ldvl: ptr cint; vr: ptr Complex64; ldvr: ptr cint;
            ilo: ptr cint; ihi: ptr cint; scale: ptr cdouble; abnrm: ptr cdouble;
            rconde: ptr cdouble; rcondv: ptr cdouble; work: ptr Complex64;
            lwork: ptr cint; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgeevx_", dynlib: lapackName.}

proc gegs*(jobvsl: cstring; jobvsr: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
           b: ptr Complex64; ldb: ptr cint; alpha: ptr Complex64; beta: ptr Complex64;
           vsl: ptr Complex64; ldvsl: ptr cint; vsr: ptr Complex64; ldvsr: ptr cint;
           work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgegs_", dynlib: lapackName.}

proc gegv*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
           b: ptr Complex64; ldb: ptr cint; alpha: ptr Complex64; beta: ptr Complex64;
           vl: ptr Complex64; ldvl: ptr cint; vr: ptr Complex64; ldvr: ptr cint;
           work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgegv_", dynlib: lapackName.}

proc gehd2*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgehd2_", dynlib: lapackName.}

proc gehrd*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgehrd_", dynlib: lapackName.}

proc gelq2*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zgelq2_",
    dynlib: lapackName.}

proc gelqf*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgelqf_", dynlib: lapackName.}

proc gels*(trans: cstring; m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
           lda: ptr cint; b: ptr Complex64; ldb: ptr cint; work: ptr Complex64;
           lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zgels_",
    dynlib: lapackName.}

proc gelsd*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; s: ptr cdouble; rcond: ptr cdouble;
            rank: ptr cint; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zgelsd_",
    dynlib: lapackName.}

proc gelss*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; s: ptr cdouble; rcond: ptr cdouble;
            rank: ptr cint; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "zgelss_", dynlib: lapackName.}

proc gelsx*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; jpvt: ptr cint; rcond: ptr cdouble;
            rank: ptr cint; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgelsx_", dynlib: lapackName.}

proc gelsy*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; jpvt: ptr cint; rcond: ptr cdouble;
            rank: ptr cint; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "zgelsy_", dynlib: lapackName.}

proc geql2*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zgeql2_",
    dynlib: lapackName.}

proc geqlf*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgeqlf_", dynlib: lapackName.}

proc geqp3*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; jpvt: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "zgeqp3_", dynlib: lapackName.}

proc geqpf*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; jpvt: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgeqpf_", dynlib: lapackName.}

proc geqr2*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zgeqr2_",
    dynlib: lapackName.}

proc geqrf*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgeqrf_", dynlib: lapackName.}

proc gerfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint; b: ptr Complex64;
            ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgerfs_", dynlib: lapackName.}

# proc gerfsx*(trans: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint;
#              a: ptr Complex64; lda: ptr cint; af: ptr Complex64; ldaf: ptr cint;
#              ipiv: ptr cint; r: ptr cdouble; c: ptr cdouble; b: ptr Complex64;
#              ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble;
#              berr: ptr cdouble; nErrBnds: ptr cint; errBndsNorm: ptr cdouble;
#              errBndsComp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
#              work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
#     importc: "zgerfsx_", dynlib: lapackName.}

proc gerq2*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zgerq2_",
    dynlib: lapackName.}

proc gerqf*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgerqf_", dynlib: lapackName.}

proc gesc2*(n: ptr cint; a: ptr Complex64; lda: ptr cint; rhs: ptr Complex64;
            ipiv: ptr cint; jpiv: ptr cint; scale: ptr cdouble): cint {.stdcall, discardable,
    importc: "zgesc2_", dynlib: lapackName.}

proc gesdd*(jobz: cstring; m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            s: ptr cdouble; u: ptr Complex64; ldu: ptr cint; vt: ptr Complex64;
            ldvt: ptr cint; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zgesdd_",
    dynlib: lapackName.}

proc gesv*(n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
           b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgesv_", dynlib: lapackName.}

proc gesvd*(jobu: cstring; jobvt: cstring; m: ptr cint; n: ptr cint; a: ptr Complex64;
            lda: ptr cint; s: ptr cdouble; u: ptr Complex64; ldu: ptr cint;
            vt: ptr Complex64; ldvt: ptr cint; work: ptr Complex64; lwork: ptr cint;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zgesvd_",
    dynlib: lapackName.}

proc gesvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
            lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
            equed: cstring; r: ptr cdouble; c: ptr cdouble; b: ptr Complex64;
            ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zgesvx_",
    dynlib: lapackName.}

# proc gesvxx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
#              lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
#              equed: cstring; r: ptr cdouble; c: ptr cdouble; b: ptr Complex64;
#              ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble;
#              rpvgrw: ptr cdouble; berr: ptr cdouble; nErrBnds: ptr cint;
#              errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble; nparams: ptr cint;
#              params: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
#     stdcall, discardable, importc: "zgesvxx_", dynlib: lapackName.}

proc getc2*(n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint; jpiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zgetc2_", dynlib: lapackName.}

proc getf2*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zgetf2_", dynlib: lapackName.}

proc getrf*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zgetrf_", dynlib: lapackName.}

proc getri*(n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgetri_", dynlib: lapackName.}

proc getrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgetrs_", dynlib: lapackName.}

proc ggbak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cdouble; rscale: ptr cdouble; m: ptr cint; v: ptr Complex64;
            ldv: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zggbak_",
    dynlib: lapackName.}

proc ggbal*(job: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; b: ptr Complex64;
            ldb: ptr cint; ilo: ptr cint; ihi: ptr cint; lscale: ptr cdouble;
            rscale: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zggbal_", dynlib: lapackName.}

proc gges*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: proc(ar, ai: ptr cdouble): cint; n: ptr cint;
           a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint; sdim: ptr cint;
           alpha: ptr Complex64; beta: ptr Complex64; vsl: ptr Complex64;
           ldvsl: ptr cint; vsr: ptr Complex64; ldvsr: ptr cint; work: ptr Complex64;
           lwork: ptr cint; rwork: ptr cdouble; bwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgges_", dynlib: lapackName.}

proc ggesx*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: proc(ar, ai: ptr cdouble): cint;
            sense: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; b: ptr Complex64;
            ldb: ptr cint; sdim: ptr cint; alpha: ptr Complex64; beta: ptr Complex64;
            vsl: ptr Complex64; ldvsl: ptr cint; vsr: ptr Complex64; ldvsr: ptr cint;
            rconde: ptr cdouble; rcondv: ptr cdouble; work: ptr Complex64;
            lwork: ptr cint; rwork: ptr cdouble; iwork: ptr cint; liwork: ptr cint;
            bwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zggesx_",
    dynlib: lapackName.}

proc ggev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
           b: ptr Complex64; ldb: ptr cint; alpha: ptr Complex64; beta: ptr Complex64;
           vl: ptr Complex64; ldvl: ptr cint; vr: ptr Complex64; ldvr: ptr cint;
           work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zggev_", dynlib: lapackName.}

proc ggevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
            alpha: ptr Complex64; beta: ptr Complex64; vl: ptr Complex64; ldvl: ptr cint;
            vr: ptr Complex64; ldvr: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cdouble; rscale: ptr cdouble; abnrm: ptr cdouble;
            bbnrm: ptr cdouble; rconde: ptr cdouble; rcondv: ptr cdouble;
            work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; iwork: ptr cint;
            bwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zggevx_",
    dynlib: lapackName.}

proc ggglm*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; d: ptr Complex64; x: ptr Complex64;
            y: ptr Complex64; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zggglm_", dynlib: lapackName.}

proc gghrd*(compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
            q: ptr Complex64; ldq: ptr cint; z: ptr Complex64; ldz: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgghrd_", dynlib: lapackName.}

proc gglse*(m: ptr cint; n: ptr cint; p: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; c: ptr Complex64; d: ptr Complex64;
            x: ptr Complex64; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgglse_", dynlib: lapackName.}

proc ggqrf*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr Complex64; lda: ptr cint;
            taua: ptr Complex64; b: ptr Complex64; ldb: ptr cint; taub: ptr Complex64;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zggqrf_", dynlib: lapackName.}

proc ggrqf*(m: ptr cint; p: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            taua: ptr Complex64; b: ptr Complex64; ldb: ptr cint; taub: ptr Complex64;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zggrqf_", dynlib: lapackName.}

proc ggsvd*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; n: ptr cint;
            p: ptr cint; k: ptr cint; l: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; alpha: ptr cdouble; beta: ptr cdouble;
            u: ptr Complex64; ldu: ptr cint; v: ptr Complex64; ldv: ptr cint;
            q: ptr Complex64; ldq: ptr cint; work: ptr Complex64; rwork: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zggsvd_",
    dynlib: lapackName.}

proc ggsvp*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
            tola: ptr cdouble; tolb: ptr cdouble; k: ptr cint; l: ptr cint;
            u: ptr Complex64; ldu: ptr cint; v: ptr Complex64; ldv: ptr cint;
            q: ptr Complex64; ldq: ptr cint; iwork: ptr cint; rwork: ptr cdouble;
            tau: ptr Complex64; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zggsvp_", dynlib: lapackName.}

proc gtcon*(norm: cstring; n: ptr cint; dl: ptr Complex64; d: ptr Complex64;
            du: ptr Complex64; du2: ptr Complex64; ipiv: ptr cint; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgtcon_", dynlib: lapackName.}

proc gtrfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr Complex64;
            d: ptr Complex64; du: ptr Complex64; dlf: ptr Complex64; df: ptr Complex64;
            duf: ptr Complex64; du2: ptr Complex64; ipiv: ptr cint; b: ptr Complex64;
            ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgtrfs_", dynlib: lapackName.}

proc gtsv*(n: ptr cint; nrhs: ptr cint; dl: ptr Complex64; d: ptr Complex64;
           du: ptr Complex64; b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zgtsv_", dynlib: lapackName.}

proc gtsvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr Complex64;
            d: ptr Complex64; du: ptr Complex64; dlf: ptr Complex64; df: ptr Complex64;
            duf: ptr Complex64; du2: ptr Complex64; ipiv: ptr cint; b: ptr Complex64;
            ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zgtsvx_",
    dynlib: lapackName.}

proc gttrf*(n: ptr cint; dl: ptr Complex64; d: ptr Complex64; du: ptr Complex64;
            du2: ptr Complex64; ipiv: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgttrf_", dynlib: lapackName.}

proc gttrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr Complex64;
            d: ptr Complex64; du: ptr Complex64; du2: ptr Complex64; ipiv: ptr cint;
            b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zgttrs_", dynlib: lapackName.}

proc gtts2*(itrans: ptr cint; n: ptr cint; nrhs: ptr cint; dl: ptr Complex64;
            d: ptr Complex64; du: ptr Complex64; du2: ptr Complex64; ipiv: ptr cint;
            b: ptr Complex64; ldb: ptr cint): cint {.stdcall, discardable, importc: "zgtts2_",
    dynlib: lapackName.}

proc hbev*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex64;
           ldab: ptr cint; w: ptr cdouble; z: ptr Complex64; ldz: ptr cint;
           work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhbev_", dynlib: lapackName.}

proc hbevd*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; w: ptr cdouble; z: ptr Complex64; ldz: ptr cint;
            work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; lrwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhbevd_", dynlib: lapackName.}

proc hbevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr Complex64; ldab: ptr cint; q: ptr Complex64; ldq: ptr cint;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr Complex64;
            ldz: ptr cint; work: ptr Complex64; rwork: ptr cdouble; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zhbevx_",
    dynlib: lapackName.}

proc hbgst*(vect: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr Complex64; ldab: ptr cint; bb: ptr Complex64; ldbb: ptr cint;
            x: ptr Complex64; ldx: ptr cint; work: ptr Complex64; rwork: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "zhbgst_", dynlib: lapackName.}

proc hbgv*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
           ab: ptr Complex64; ldab: ptr cint; bb: ptr Complex64; ldbb: ptr cint;
           w: ptr cdouble; z: ptr Complex64; ldz: ptr cint; work: ptr Complex64;
           rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zhbgv_",
    dynlib: lapackName.}

proc hbgvd*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr Complex64; ldab: ptr cint; bb: ptr Complex64; ldbb: ptr cint;
            w: ptr cdouble; z: ptr Complex64; ldz: ptr cint; work: ptr Complex64;
            lwork: ptr cint; rwork: ptr cdouble; lrwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zhbgvd_",
    dynlib: lapackName.}

proc hbgvx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ka: ptr cint;
            kb: ptr cint; ab: ptr Complex64; ldab: ptr cint; bb: ptr Complex64;
            ldbb: ptr cint; q: ptr Complex64; ldq: ptr cint; vl: ptr cdouble;
            vu: ptr cdouble; il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint;
            w: ptr cdouble; z: ptr Complex64; ldz: ptr cint; work: ptr Complex64;
            rwork: ptr cdouble; iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zhbgvx_", dynlib: lapackName.}

proc hbtrd*(vect: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; d: ptr cdouble; e: ptr cdouble; q: ptr Complex64; ldq: ptr cint;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zhbtrd_",
    dynlib: lapackName.}

proc hecon*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "zhecon_", dynlib: lapackName.}

proc heequb*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; s: ptr cdouble;
             scond: ptr cdouble; amax: ptr cdouble; work: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "zheequb_", dynlib: lapackName.}

proc heev*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
           w: ptr cdouble; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
           info: ptr cint): cint {.stdcall, discardable, importc: "zheev_", dynlib: lapackName.}

proc heevd*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            w: ptr cdouble; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zheevd_", dynlib: lapackName.}

proc heevr*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64;
            lda: ptr cint; vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr Complex64;
            ldz: ptr cint; isuppz: ptr cint; work: ptr Complex64; lwork: ptr cint;
            rwork: ptr cdouble; lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zheevr_", dynlib: lapackName.}

proc heevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64;
            lda: ptr cint; vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr Complex64;
            ldz: ptr cint; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zheevx_", dynlib: lapackName.}

proc hegs2*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhegs2_", dynlib: lapackName.}

proc hegst*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhegst_", dynlib: lapackName.}

proc hegv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64;
           lda: ptr cint; b: ptr Complex64; ldb: ptr cint; w: ptr cdouble;
           work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zhegv_", dynlib: lapackName.}

proc hegvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64;
            lda: ptr cint; b: ptr Complex64; ldb: ptr cint; w: ptr cdouble;
            work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; lrwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhegvd_", dynlib: lapackName.}

proc hegvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr Complex64;
            ldz: ptr cint; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhegvx_", dynlib: lapackName.}

proc herfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint; b: ptr Complex64;
            ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zherfs_", dynlib: lapackName.}

# proc herfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
#              lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
#              s: ptr cdouble; b: ptr Complex64; ldb: ptr cint; x: ptr Complex64;
#              ldx: ptr cint; rcond: ptr cdouble; berr: ptr cdouble; nErrBnds: ptr cint;
#              errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble; nparams: ptr cint;
#              params: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
#     stdcall, discardable, importc: "zherfsx_", dynlib: lapackName.}

proc hesv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
           ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint; work: ptr Complex64;
           lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zhesv_",
    dynlib: lapackName.}

proc hesvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
            lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr Complex64; ldb: ptr cint; x: ptr Complex64; ldx: ptr cint;
            rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zhesvx_", dynlib: lapackName.}

# proc hesvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
#              lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
#              equed: cstring; s: ptr cdouble; b: ptr Complex64; ldb: ptr cint;
#              x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble; rpvgrw: ptr cdouble;
#              berr: ptr cdouble; nErrBnds: ptr cint; errBndsNorm: ptr cdouble;
#              errBndsComp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
#              work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
#     importc: "zhesvxx_", dynlib: lapackName.}

proc hetd2*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; d: ptr cdouble;
            e: ptr cdouble; tau: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhetd2_", dynlib: lapackName.}

proc hetf2*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zhetf2_", dynlib: lapackName.}

proc hetrd*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; d: ptr cdouble;
            e: ptr cdouble; tau: ptr Complex64; work: ptr Complex64; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zhetrd_", dynlib: lapackName.}

proc hetrf*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhetrf_", dynlib: lapackName.}

proc hetri*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zhetri_",
    dynlib: lapackName.}

proc hetrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhetrs_", dynlib: lapackName.}

proc hfrk*(transr: cstring; uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint;
           alpha: ptr cdouble; a: ptr Complex64; lda: ptr cint; beta: ptr cdouble;
           c: ptr Complex64): cint {.stdcall, discardable, importc: "zhfrk_", dynlib: lapackName.}

proc hgeqz*(job: cstring; compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr Complex64; ldh: ptr cint; t: ptr Complex64; ldt: ptr cint;
            alpha: ptr Complex64; beta: ptr Complex64; q: ptr Complex64; ldq: ptr cint;
            z: ptr Complex64; ldz: ptr cint; work: ptr Complex64; lwork: ptr cint;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zhgeqz_",
    dynlib: lapackName.}

proc hpcon*(uplo: cstring; n: ptr cint; ap: ptr Complex64; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "zhpcon_", dynlib: lapackName.}

proc hpev*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex64; w: ptr cdouble;
           z: ptr Complex64; ldz: ptr cint; work: ptr Complex64; rwork: ptr cdouble;
           info: ptr cint): cint {.stdcall, discardable, importc: "zhpev_", dynlib: lapackName.}

proc hpevd*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex64; w: ptr cdouble;
            z: ptr Complex64; ldz: ptr cint; work: ptr Complex64; lwork: ptr cint;
            rwork: ptr cdouble; lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zhpevd_", dynlib: lapackName.}

proc hpevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex64;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr Complex64;
            ldz: ptr cint; work: ptr Complex64; rwork: ptr cdouble; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zhpevx_",
    dynlib: lapackName.}

proc hpgst*(itype: ptr cint; uplo: cstring; n: ptr cint; ap: ptr Complex64;
            bp: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zhpgst_",
    dynlib: lapackName.}

proc hpgv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex64;
           bp: ptr Complex64; w: ptr cdouble; z: ptr Complex64; ldz: ptr cint;
           work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhpgv_", dynlib: lapackName.}

proc hpgvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex64;
            bp: ptr Complex64; w: ptr cdouble; z: ptr Complex64; ldz: ptr cint;
            work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; lrwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhpgvd_", dynlib: lapackName.}

proc hpgvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            ap: ptr Complex64; bp: ptr Complex64; vl: ptr cdouble; vu: ptr cdouble;
            il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint; w: ptr cdouble;
            z: ptr Complex64; ldz: ptr cint; work: ptr Complex64; rwork: ptr cdouble;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhpgvx_", dynlib: lapackName.}

proc hprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64;
            afp: ptr Complex64; ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint;
            x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhprfs_", dynlib: lapackName.}

proc hpsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64; ipiv: ptr cint;
           b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhpsv_", dynlib: lapackName.}

proc hpsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64;
            afp: ptr Complex64; ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint;
            x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zhpsvx_", dynlib: lapackName.}

proc hptrd*(uplo: cstring; n: ptr cint; ap: ptr Complex64; d: ptr cdouble; e: ptr cdouble;
            tau: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zhptrd_",
    dynlib: lapackName.}

proc hptrf*(uplo: cstring; n: ptr cint; ap: ptr Complex64; ipiv: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zhptrf_", dynlib: lapackName.}

proc hptri*(uplo: cstring; n: ptr cint; ap: ptr Complex64; ipiv: ptr cint;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zhptri_",
    dynlib: lapackName.}

proc hptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64; ipiv: ptr cint;
            b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhptrs_", dynlib: lapackName.}

proc hsein*(side: cstring; eigsrc: cstring; initv: cstring; select: ptr cint;
            n: ptr cint; h: ptr Complex64; ldh: ptr cint; w: ptr Complex64;
            vl: ptr Complex64; ldvl: ptr cint; vr: ptr Complex64; ldvr: ptr cint;
            mm: ptr cint; m: ptr cint; work: ptr Complex64; rwork: ptr cdouble;
            ifaill: ptr cint; ifailr: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zhsein_", dynlib: lapackName.}

proc hseqr*(job: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            h: ptr Complex64; ldh: ptr cint; w: ptr Complex64; z: ptr Complex64;
            ldz: ptr cint; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zhseqr_", dynlib: lapackName.}

# proc laGbamv*(trans: ptr cint; m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
#               alpha: ptr cdouble; ab: ptr Complex64; ldab: ptr cint; x: ptr Complex64;
#               incx: ptr cint; beta: ptr cdouble; y: ptr cdouble; incy: ptr cint): cint {.
#     stdcall, discardable, importc: "zla_gbamv__", dynlib: lapackName.}
# proc laGbrcondC*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#                  ab: ptr Complex64; ldab: ptr cint; afb: ptr Complex64; ldafb: ptr cint;
#                  ipiv: ptr cint; c: ptr cdouble; capply: ptr cint; info: ptr cint;
#                  work: ptr Complex64; rwork: ptr cdouble; transLen: int16): cdouble {.
#     stdcall, discardable, importc: "zla_gbrcond_c__", dynlib: lapackName.}
# proc laGbrcondX*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
#                  ab: ptr Complex64; ldab: ptr cint; afb: ptr Complex64; ldafb: ptr cint;
#                  ipiv: ptr cint; x: ptr Complex64; info: ptr cint; work: ptr Complex64;
#                  rwork: ptr cdouble; transLen: int16): cdouble {.stdcall, discardable,
#     importc: "zla_gbrcond_x__", dynlib: lapackName.}
#
# proc laGbrfsxExtended*(precType: ptr cint; transType: ptr cint; n: ptr cint;
#                        kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr Complex64;
#                        ldab: ptr cint; afb: ptr Complex64; ldafb: ptr cint;
#                        ipiv: ptr cint; colequ: ptr cint; c: ptr cdouble;
#                        b: ptr Complex64; ldb: ptr cint; y: ptr Complex64; ldy: ptr cint;
#                        berrOut: ptr cdouble; nNorms: ptr cint; errsN: ptr cdouble;
#                        errsC: ptr cdouble; res: ptr Complex64; ayb: ptr cdouble;
#                        dy: ptr Complex64; yTail: ptr Complex64; rcond: ptr cdouble;
#                        ithresh: ptr cint; rthresh: ptr cdouble; dzUb: ptr cdouble;
#                        ignoreCwise: ptr cint; info: ptr cint): cint {.stdcall, discardable,
#     importc: "zla_gbrfsx_extended__", dynlib: lapackName.}
# proc laGbrpvgrw*(n: ptr cint; kl: ptr cint; ku: ptr cint; ncols: ptr cint;
#                  ab: ptr Complex64; ldab: ptr cint; afb: ptr Complex64; ldafb: ptr cint): cdouble {.
#     stdcall, discardable, importc: "zla_gbrpvgrw__", dynlib: lapackName.}
#
# proc laGeamv*(trans: ptr cint; m: ptr cint; n: ptr cint; alpha: ptr cdouble;
#               a: ptr Complex64; lda: ptr cint; x: ptr Complex64; incx: ptr cint;
#               beta: ptr cdouble; y: ptr cdouble; incy: ptr cint): cint {.stdcall, discardable,
#     importc: "zla_geamv__", dynlib: lapackName.}
# proc laGercondC*(trans: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
#                  af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint; c: ptr cdouble;
#                  capply: ptr cint; info: ptr cint; work: ptr Complex64;
#                  rwork: ptr cdouble; transLen: int16): cdouble {.stdcall, discardable,
#     importc: "zla_gercond_c__", dynlib: lapackName.}
# proc laGercondX*(trans: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
#                  af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint; x: ptr Complex64;
#                  info: ptr cint; work: ptr Complex64; rwork: ptr cdouble; transLen: int16): cdouble {.
#     stdcall, discardable, importc: "zla_gercond_x__", dynlib: lapackName.}
#
# proc laGerfsxExtended*(precType: ptr cint; transType: ptr cint; n: ptr cint;
#                        nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
#                        af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
#                        colequ: ptr cint; c: ptr cdouble; b: ptr Complex64;
#                        ldb: ptr cint; y: ptr Complex64; ldy: ptr cint;
#                        berrOut: ptr cdouble; nNorms: ptr cint; errsN: ptr cdouble;
#                        errsC: ptr cdouble; res: ptr Complex64; ayb: ptr cdouble;
#                        dy: ptr Complex64; yTail: ptr Complex64; rcond: ptr cdouble;
#                        ithresh: ptr cint; rthresh: ptr cdouble; dzUb: ptr cdouble;
#                        ignoreCwise: ptr cint; info: ptr cint): cint {.stdcall, discardable,
#     importc: "zla_gerfsx_extended__", dynlib: lapackName.}
#
# proc laHeamv*(uplo: ptr cint; n: ptr cint; alpha: ptr cdouble; a: ptr Complex64;
#               lda: ptr cint; x: ptr Complex64; incx: ptr cint; beta: ptr cdouble;
#               y: ptr cdouble; incy: ptr cint): cint {.stdcall, discardable, importc: "zla_heamv__",
#     dynlib: lapackName.}
# proc laHercondC*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
#                  af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint; c: ptr cdouble;
#                  capply: ptr cint; info: ptr cint; work: ptr Complex64;
#                  rwork: ptr cdouble; uploLen: int16): cdouble {.stdcall, discardable,
#     importc: "zla_hercond_c__", dynlib: lapackName.}
# proc laHercondX*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
#                  af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint; x: ptr Complex64;
#                  info: ptr cint; work: ptr Complex64; rwork: ptr cdouble; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "zla_hercond_x__", dynlib: lapackName.}
#
# proc laHerfsxExtended*(precType: ptr cint; uplo: cstring; n: ptr cint; nrhs: ptr cint;
#                        a: ptr Complex64; lda: ptr cint; af: ptr Complex64;
#                        ldaf: ptr cint; ipiv: ptr cint; colequ: ptr cint;
#                        c: ptr cdouble; b: ptr Complex64; ldb: ptr cint; y: ptr Complex64;
#                        ldy: ptr cint; berrOut: ptr cdouble; nNorms: ptr cint;
#                        errsN: ptr cdouble; errsC: ptr cdouble; res: ptr Complex64;
#                        ayb: ptr cdouble; dy: ptr Complex64; yTail: ptr Complex64;
#                        rcond: ptr cdouble; ithresh: ptr cint; rthresh: ptr cdouble;
#                        dzUb: ptr cdouble; ignoreCwise: ptr cint; info: ptr cint;
#                        uploLen: int16): cint {.stdcall, discardable,
#     importc: "zla_herfsx_extended__", dynlib: lapackName.}
# proc laHerpvgrw*(uplo: cstring; n: ptr cint; info: ptr cint; a: ptr Complex64;
#                  lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
#                  work: ptr cdouble; uploLen: int16): cdouble {.stdcall, discardable,
#     importc: "zla_herpvgrw__", dynlib: lapackName.}
#
# proc laLinBerr*(n: ptr cint; nz: ptr cint; nrhs: ptr cint; res: ptr Complex64;
#                 ayb: ptr cdouble; berr: ptr cdouble): cint {.stdcall, discardable,
#     importc: "zla_lin_berr__", dynlib: lapackName.}
# proc laPorcondC*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
#                  af: ptr Complex64; ldaf: ptr cint; c: ptr cdouble; capply: ptr cint;
#                  info: ptr cint; work: ptr Complex64; rwork: ptr cdouble; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "zla_porcond_c__", dynlib: lapackName.}
# proc laPorcondX*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
#                  af: ptr Complex64; ldaf: ptr cint; x: ptr Complex64; info: ptr cint;
#                  work: ptr Complex64; rwork: ptr cdouble; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "zla_porcond_x__", dynlib: lapackName.}
#
# proc laPorfsxExtended*(precType: ptr cint; uplo: cstring; n: ptr cint; nrhs: ptr cint;
#                        a: ptr Complex64; lda: ptr cint; af: ptr Complex64;
#                        ldaf: ptr cint; colequ: ptr cint; c: ptr cdouble;
#                        b: ptr Complex64; ldb: ptr cint; y: ptr Complex64; ldy: ptr cint;
#                        berrOut: ptr cdouble; nNorms: ptr cint; errsN: ptr cdouble;
#                        errsC: ptr cdouble; res: ptr Complex64; ayb: ptr cdouble;
#                        dy: ptr Complex64; yTail: ptr Complex64; rcond: ptr cdouble;
#                        ithresh: ptr cint; rthresh: ptr cdouble; dzUb: ptr cdouble;
#                        ignoreCwise: ptr cint; info: ptr cint; uploLen: int16): cint {.
#     stdcall, discardable, importc: "zla_porfsx_extended__", dynlib: lapackName.}
# proc laPorpvgrw*(uplo: cstring; ncols: ptr cint; a: ptr Complex64; lda: ptr cint;
#                  af: ptr Complex64; ldaf: ptr cint; work: ptr cdouble; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "zla_porpvgrw__", dynlib: lapackName.}
# proc laRpvgrw*(n: ptr cint; ncols: ptr cint; a: ptr Complex64; lda: ptr cint;
#                af: ptr Complex64; ldaf: ptr cint): cdouble {.stdcall, discardable,
#     importc: "zla_rpvgrw__", dynlib: lapackName.}
#
# proc laSyamv*(uplo: ptr cint; n: ptr cint; alpha: ptr cdouble; a: ptr Complex64;
#               lda: ptr cint; x: ptr Complex64; incx: ptr cint; beta: ptr cdouble;
#               y: ptr cdouble; incy: ptr cint): cint {.stdcall, discardable, importc: "zla_syamv__",
#     dynlib: lapackName.}
# proc laSyrcondC*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
#                  af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint; c: ptr cdouble;
#                  capply: ptr cint; info: ptr cint; work: ptr Complex64;
#                  rwork: ptr cdouble; uploLen: int16): cdouble {.stdcall, discardable,
#     importc: "zla_syrcond_c__", dynlib: lapackName.}
# proc laSyrcondX*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
#                  af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint; x: ptr Complex64;
#                  info: ptr cint; work: ptr Complex64; rwork: ptr cdouble; uploLen: int16): cdouble {.
#     stdcall, discardable, importc: "zla_syrcond_x__", dynlib: lapackName.}
#
# proc laSyrfsxExtended*(precType: ptr cint; uplo: cstring; n: ptr cint; nrhs: ptr cint;
#                        a: ptr Complex64; lda: ptr cint; af: ptr Complex64;
#                        ldaf: ptr cint; ipiv: ptr cint; colequ: ptr cint;
#                        c: ptr cdouble; b: ptr Complex64; ldb: ptr cint; y: ptr Complex64;
#                        ldy: ptr cint; berrOut: ptr cdouble; nNorms: ptr cint;
#                        errsN: ptr cdouble; errsC: ptr cdouble; res: ptr Complex64;
#                        ayb: ptr cdouble; dy: ptr Complex64; yTail: ptr Complex64;
#                        rcond: ptr cdouble; ithresh: ptr cint; rthresh: ptr cdouble;
#                        dzUb: ptr cdouble; ignoreCwise: ptr cint; info: ptr cint;
#                        uploLen: int16): cint {.stdcall, discardable,
#     importc: "zla_syrfsx_extended__", dynlib: lapackName.}
# proc laSyrpvgrw*(uplo: cstring; n: ptr cint; info: ptr cint; a: ptr Complex64;
#                  lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
#                  work: ptr cdouble; uploLen: int16): cdouble {.stdcall, discardable,
#     importc: "zla_syrpvgrw__", dynlib: lapackName.}
#
# proc laWwaddw*(n: ptr cint; x: ptr Complex64; y: ptr Complex64; w: ptr Complex64): cint {.
#     stdcall, discardable, importc: "zla_wwaddw__", dynlib: lapackName.}

proc labrd*(m: ptr cint; n: ptr cint; nb: ptr cint; a: ptr Complex64; lda: ptr cint;
            d: ptr cdouble; e: ptr cdouble; tauq: ptr Complex64; taup: ptr Complex64;
            x: ptr Complex64; ldx: ptr cint; y: ptr Complex64; ldy: ptr cint): cint {.
    stdcall, discardable, importc: "zlabrd_", dynlib: lapackName.}

proc lacgv*(n: ptr cint; x: ptr Complex64; incx: ptr cint): cint {.stdcall, discardable,
    importc: "zlacgv_", dynlib: lapackName.}

proc lacn2*(n: ptr cint; v: ptr Complex64; x: ptr Complex64; est: ptr cdouble;
            kase: ptr cint; isave: ptr cint): cint {.stdcall, discardable, importc: "zlacn2_",
    dynlib: lapackName.}

proc lacon*(n: ptr cint; v: ptr Complex64; x: ptr Complex64; est: ptr cdouble;
            kase: ptr cint): cint {.stdcall, discardable, importc: "zlacon_", dynlib: lapackName.}

proc lacp2*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint): cint {.stdcall, discardable, importc: "zlacp2_",
    dynlib: lapackName.}

proc lacpy*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint): cint {.stdcall, discardable, importc: "zlacpy_",
    dynlib: lapackName.}

proc lacrm*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; b: ptr cdouble;
            ldb: ptr cint; c: ptr Complex64; ldc: ptr cint; rwork: ptr cdouble): cint {.
    stdcall, discardable, importc: "zlacrm_", dynlib: lapackName.}

proc lacrt*(n: ptr cint; cx: ptr Complex64; incx: ptr cint; cy: ptr Complex64;
            incy: ptr cint; c: ptr Complex64; s: ptr Complex64): cint {.stdcall, discardable,
    importc: "zlacrt_", dynlib: lapackName.}

proc ladiv*(retVal: ptr Complex64; x: ptr Complex64; y: ptr Complex64) {.stdcall, discardable,
    importc: "zladiv_", dynlib: lapackName.}

proc laed0*(qsiz: ptr cint; n: ptr cint; d: ptr cdouble; e: ptr cdouble; q: ptr Complex64;
            ldq: ptr cint; qstore: ptr Complex64; ldqs: ptr cint; rwork: ptr cdouble;
            iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zlaed0_",
    dynlib: lapackName.}

proc laed7*(n: ptr cint; cutpnt: ptr cint; qsiz: ptr cint; tlvls: ptr cint;
            curlvl: ptr cint; curpbm: ptr cint; d: ptr cdouble; q: ptr Complex64;
            ldq: ptr cint; rho: ptr cdouble; indxq: ptr cint; qstore: ptr cdouble;
            qptr: ptr cint; prmptr: ptr cint; perm: ptr cint; givptr: ptr cint;
            givcol: ptr cint; givnum: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zlaed7_", dynlib: lapackName.}

proc laed8*(k: ptr cint; n: ptr cint; qsiz: ptr cint; q: ptr Complex64; ldq: ptr cint;
            d: ptr cdouble; rho: ptr cdouble; cutpnt: ptr cint; z: ptr cdouble;
            dlamda: ptr cdouble; q2: ptr Complex64; ldq2: ptr cint; w: ptr cdouble;
            indxp: ptr cint; indx: ptr cint; indxq: ptr cint; perm: ptr cint;
            givptr: ptr cint; givcol: ptr cint; givnum: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zlaed8_", dynlib: lapackName.}

proc laein*(rightv: ptr cint; noinit: ptr cint; n: ptr cint; h: ptr Complex64;
            ldh: ptr cint; w: ptr Complex64; v: ptr Complex64; b: ptr Complex64;
            ldb: ptr cint; rwork: ptr cdouble; eps3: ptr cdouble; smlnum: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "zlaein_", dynlib: lapackName.}

proc laesy*(a: ptr Complex64; b: ptr Complex64; c: ptr Complex64; rt1: ptr Complex64;
            rt2: ptr Complex64; evscal: ptr Complex64; cs1: ptr Complex64;
            sn1: ptr Complex64): cint {.stdcall, discardable, importc: "zlaesy_", dynlib: lapackName.}

proc laev2*(a: ptr Complex64; b: ptr Complex64; c: ptr Complex64; rt1: ptr cdouble;
            rt2: ptr cdouble; cs1: ptr cdouble; sn1: ptr Complex64): cint {.stdcall, discardable,
    importc: "zlaev2_", dynlib: lapackName.}

proc lag2c*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; sa: ptr Complex32;
            ldsa: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zlag2c_",
    dynlib: lapackName.}

proc lags2*(upper: ptr cint; a1: ptr cdouble; a2: ptr Complex64; a3: ptr cdouble;
            b1: ptr cdouble; b2: ptr Complex64; b3: ptr cdouble; csu: ptr cdouble;
            snu: ptr Complex64; csv: ptr cdouble; snv: ptr Complex64; csq: ptr cdouble;
            snq: ptr Complex64): cint {.stdcall, discardable, importc: "zlags2_", dynlib: lapackName.}

proc lagtm*(trans: cstring; n: ptr cint; nrhs: ptr cint; alpha: ptr cdouble;
            dl: ptr Complex64; d: ptr Complex64; du: ptr Complex64; x: ptr Complex64;
            ldx: ptr cint; beta: ptr cdouble; b: ptr Complex64; ldb: ptr cint): cint {.
    stdcall, discardable, importc: "zlagtm_", dynlib: lapackName.}

proc lahef*(uplo: cstring; n: ptr cint; nb: ptr cint; kb: ptr cint; a: ptr Complex64;
            lda: ptr cint; ipiv: ptr cint; w: ptr Complex64; ldw: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zlahef_", dynlib: lapackName.}

proc lahqr*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr Complex64; ldh: ptr cint; w: ptr Complex64;
            iloz: ptr cint; ihiz: ptr cint; z: ptr Complex64; ldz: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zlahqr_", dynlib: lapackName.}

proc lahr2*(n: ptr cint; k: ptr cint; nb: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; t: ptr Complex64; ldt: ptr cint; y: ptr Complex64;
            ldy: ptr cint): cint {.stdcall, discardable, importc: "zlahr2_", dynlib: lapackName.}

proc lahrd*(n: ptr cint; k: ptr cint; nb: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; t: ptr Complex64; ldt: ptr cint; y: ptr Complex64;
            ldy: ptr cint): cint {.stdcall, discardable, importc: "zlahrd_", dynlib: lapackName.}

proc laic1*(job: ptr cint; j: ptr cint; x: ptr Complex64; sest: ptr cdouble;
            w: ptr Complex64; gamma: ptr Complex64; sestpr: ptr cdouble;
            s: ptr Complex64; c: ptr Complex64): cint {.stdcall, discardable, importc: "zlaic1_",
    dynlib: lapackName.}

proc lals0*(icompq: ptr cint; nl: ptr cint; nr: ptr cint; sqre: ptr cint; nrhs: ptr cint;
            b: ptr Complex64; ldb: ptr cint; bx: ptr Complex64; ldbx: ptr cint;
            perm: ptr cint; givptr: ptr cint; givcol: ptr cint; ldgcol: ptr cint;
            givnum: ptr cdouble; ldgnum: ptr cint; poles: ptr cdouble; difl: ptr cdouble;
            difr: ptr cdouble; z: ptr cdouble; k: ptr cint; c: ptr cdouble; s: ptr cdouble;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zlals0_",
    dynlib: lapackName.}

proc lalsa*(icompq: ptr cint; smlsiz: ptr cint; n: ptr cint; nrhs: ptr cint;
            b: ptr Complex64; ldb: ptr cint; bx: ptr Complex64; ldbx: ptr cint;
            u: ptr cdouble; ldu: ptr cint; vt: ptr cdouble; k: ptr cint; difl: ptr cdouble;
            difr: ptr cdouble; z: ptr cdouble; poles: ptr cdouble; givptr: ptr cint;
            givcol: ptr cint; ldgcol: ptr cint; perm: ptr cint; givnum: ptr cdouble;
            c: ptr cdouble; s: ptr cdouble; rwork: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zlalsa_", dynlib: lapackName.}

proc lalsd*(uplo: cstring; smlsiz: ptr cint; n: ptr cint; nrhs: ptr cint; d: ptr cdouble;
            e: ptr cdouble; b: ptr Complex64; ldb: ptr cint; rcond: ptr cdouble;
            rank: ptr cint; work: ptr Complex64; rwork: ptr cdouble; iwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zlalsd_", dynlib: lapackName.}
proc langb*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; work: ptr cdouble): cdouble {.stdcall, discardable, importc: "zlangb_",
    dynlib: lapackName.}
proc lange*(norm: cstring; m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "zlange_",
                                      dynlib: lapackName.}
proc langt*(norm: cstring; n: ptr cint; dl: ptr Complex64; d: ptr Complex64;
            du: ptr Complex64): cdouble {.stdcall, discardable, importc: "zlangt_",
                                      dynlib: lapackName.}
proc lanhb*(norm: cstring; uplo: cstring; n: ptr cint; k: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; work: ptr cdouble): cdouble {.stdcall, discardable, importc: "zlanhb_",
    dynlib: lapackName.}
proc lanhe*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "zlanhe_",
                                      dynlib: lapackName.}
proc lanhf*(norm: cstring; transr: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "zlanhf_",
                                      dynlib: lapackName.}
proc lanhp*(norm: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex64;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "zlanhp_",
                                      dynlib: lapackName.}
proc lanhs*(norm: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; work: ptr cdouble): cdouble {.
    stdcall, discardable, importc: "zlanhs_", dynlib: lapackName.}
proc lanht*(norm: cstring; n: ptr cint; d: ptr cdouble; e: ptr Complex64): cdouble {.
    stdcall, discardable, importc: "zlanht_", dynlib: lapackName.}
proc lansb*(norm: cstring; uplo: cstring; n: ptr cint; k: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; work: ptr cdouble): cdouble {.stdcall, discardable, importc: "zlansb_",
    dynlib: lapackName.}
proc lansp*(norm: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex64;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "zlansp_",
                                      dynlib: lapackName.}
proc lansy*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "zlansy_",
                                      dynlib: lapackName.}
proc lantb*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; k: ptr cint;
            ab: ptr Complex64; ldab: ptr cint; work: ptr cdouble): cdouble {.stdcall, discardable,
    importc: "zlantb_", dynlib: lapackName.}
proc lantp*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; ap: ptr Complex64;
            work: ptr cdouble): cdouble {.stdcall, discardable, importc: "zlantp_",
                                      dynlib: lapackName.}
proc lantr*(norm: cstring; uplo: cstring; diag: cstring; m: ptr cint; n: ptr cint;
            a: ptr Complex64; lda: ptr cint; work: ptr cdouble): cdouble {.stdcall, discardable,
    importc: "zlantr_", dynlib: lapackName.}

proc lapll*(n: ptr cint; x: ptr Complex64; incx: ptr cint; y: ptr Complex64; incy: ptr cint;
            ssmin: ptr cdouble): cint {.stdcall, discardable, importc: "zlapll_", dynlib: lapackName.}

proc lapmt*(forwrd: ptr cint; m: ptr cint; n: ptr cint; x: ptr Complex64; ldx: ptr cint;
            k: ptr cint): cint {.stdcall, discardable, importc: "zlapmt_", dynlib: lapackName.}

proc laqgb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; r: ptr cdouble; c: ptr cdouble; rowcnd: ptr cdouble;
            colcnd: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.stdcall, discardable,
    importc: "zlaqgb_", dynlib: lapackName.}

proc laqge*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; r: ptr cdouble;
            c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble; amax: ptr cdouble;
            equed: cstring): cint {.stdcall, discardable, importc: "zlaqge_", dynlib: lapackName.}

proc laqhb*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex64; ldab: ptr cint;
            s: ptr cdouble; scond: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.
    stdcall, discardable, importc: "zlaqhb_", dynlib: lapackName.}

proc laqhe*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.stdcall, discardable,
    importc: "zlaqhe_", dynlib: lapackName.}

proc laqhp*(uplo: cstring; n: ptr cint; ap: ptr Complex64; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.stdcall, discardable,
    importc: "zlaqhp_", dynlib: lapackName.}

proc laqp2*(m: ptr cint; n: ptr cint; offset: ptr cint; a: ptr Complex64; lda: ptr cint;
            jpvt: ptr cint; tau: ptr Complex64; vn1: ptr cdouble; vn2: ptr cdouble;
            work: ptr Complex64): cint {.stdcall, discardable, importc: "zlaqp2_", dynlib: lapackName.}

proc laqps*(m: ptr cint; n: ptr cint; offset: ptr cint; nb: ptr cint; kb: ptr cint;
            a: ptr Complex64; lda: ptr cint; jpvt: ptr cint; tau: ptr Complex64;
            vn1: ptr cdouble; vn2: ptr cdouble; auxv: ptr Complex64; f: ptr Complex64;
            ldf: ptr cint): cint {.stdcall, discardable, importc: "zlaqps_", dynlib: lapackName.}

proc laqr0*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr Complex64; ldh: ptr cint; w: ptr Complex64;
            iloz: ptr cint; ihiz: ptr cint; z: ptr Complex64; ldz: ptr cint;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zlaqr0_", dynlib: lapackName.}

proc laqr1*(n: ptr cint; h: ptr Complex64; ldh: ptr cint; s1: ptr Complex64;
            s2: ptr Complex64; v: ptr Complex64): cint {.stdcall, discardable, importc: "zlaqr1_",
    dynlib: lapackName.}

proc laqr2*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ktop: ptr cint;
            kbot: ptr cint; nw: ptr cint; h: ptr Complex64; ldh: ptr cint; iloz: ptr cint;
            ihiz: ptr cint; z: ptr Complex64; ldz: ptr cint; ns: ptr cint; nd: ptr cint;
            sh: ptr Complex64; v: ptr Complex64; ldv: ptr cint; nh: ptr cint;
            t: ptr Complex64; ldt: ptr cint; nv: ptr cint; wv: ptr Complex64;
            ldwv: ptr cint; work: ptr Complex64; lwork: ptr cint): cint {.stdcall, discardable,
    importc: "zlaqr2_", dynlib: lapackName.}

proc laqr3*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ktop: ptr cint;
            kbot: ptr cint; nw: ptr cint; h: ptr Complex64; ldh: ptr cint; iloz: ptr cint;
            ihiz: ptr cint; z: ptr Complex64; ldz: ptr cint; ns: ptr cint; nd: ptr cint;
            sh: ptr Complex64; v: ptr Complex64; ldv: ptr cint; nh: ptr cint;
            t: ptr Complex64; ldt: ptr cint; nv: ptr cint; wv: ptr Complex64;
            ldwv: ptr cint; work: ptr Complex64; lwork: ptr cint): cint {.stdcall, discardable,
    importc: "zlaqr3_", dynlib: lapackName.}

proc laqr4*(wantt: ptr cint; wantz: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr Complex64; ldh: ptr cint; w: ptr Complex64;
            iloz: ptr cint; ihiz: ptr cint; z: ptr Complex64; ldz: ptr cint;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zlaqr4_", dynlib: lapackName.}

proc laqr5*(wantt: ptr cint; wantz: ptr cint; kacc22: ptr cint; n: ptr cint;
            ktop: ptr cint; kbot: ptr cint; nshfts: ptr cint; s: ptr Complex64;
            h: ptr Complex64; ldh: ptr cint; iloz: ptr cint; ihiz: ptr cint;
            z: ptr Complex64; ldz: ptr cint; v: ptr Complex64; ldv: ptr cint;
            u: ptr Complex64; ldu: ptr cint; nv: ptr cint; wv: ptr Complex64;
            ldwv: ptr cint; nh: ptr cint; wh: ptr Complex64; ldwh: ptr cint): cint {.stdcall, discardable,
    importc: "zlaqr5_", dynlib: lapackName.}

proc laqsb*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex64; ldab: ptr cint;
            s: ptr cdouble; scond: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.
    stdcall, discardable, importc: "zlaqsb_", dynlib: lapackName.}

proc laqsp*(uplo: cstring; n: ptr cint; ap: ptr Complex64; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.stdcall, discardable,
    importc: "zlaqsp_", dynlib: lapackName.}

proc laqsy*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; equed: cstring): cint {.stdcall, discardable,
    importc: "zlaqsy_", dynlib: lapackName.}

proc lar1v*(n: ptr cint; b1: ptr cint; bn: ptr cint; lambda: ptr cdouble; d: ptr cdouble;
            l: ptr cdouble; ld: ptr cdouble; lld: ptr cdouble; pivmin: ptr cdouble;
            gaptol: ptr cdouble; z: ptr Complex64; wantnc: ptr cint; negcnt: ptr cint;
            ztz: ptr cdouble; mingma: ptr cdouble; r: ptr cint; isuppz: ptr cint;
            nrminv: ptr cdouble; resid: ptr cdouble; rqcorr: ptr cdouble;
            work: ptr cdouble): cint {.stdcall, discardable, importc: "zlar1v_", dynlib: lapackName.}

proc lar2v*(n: ptr cint; x: ptr Complex64; y: ptr Complex64; z: ptr Complex64;
            incx: ptr cint; c: ptr cdouble; s: ptr Complex64; incc: ptr cint): cint {.
    stdcall, discardable, importc: "zlar2v_", dynlib: lapackName.}

proc larcm*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr Complex64;
            ldb: ptr cint; c: ptr Complex64; ldc: ptr cint; rwork: ptr cdouble): cint {.
    stdcall, discardable, importc: "zlarcm_", dynlib: lapackName.}

proc larf*(side: cstring; m: ptr cint; n: ptr cint; v: ptr Complex64; incv: ptr cint;
           tau: ptr Complex64; c: ptr Complex64; ldc: ptr cint; work: ptr Complex64): cint {.
    stdcall, discardable, importc: "zlarf_", dynlib: lapackName.}

proc larfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; v: ptr Complex64; ldv: ptr cint;
            t: ptr Complex64; ldt: ptr cint; c: ptr Complex64; ldc: ptr cint;
            work: ptr Complex64; ldwork: ptr cint): cint {.stdcall, discardable, importc: "zlarfb_",
    dynlib: lapackName.}

proc larfg*(n: ptr cint; alpha: ptr Complex64; x: ptr Complex64; incx: ptr cint;
            tau: ptr Complex64): cint {.stdcall, discardable, importc: "zlarfg_", dynlib: lapackName.}

# proc larfp*(n: ptr cint; alpha: ptr Complex64; x: ptr Complex64; incx: ptr cint;
#             tau: ptr Complex64): cint {.stdcall, discardable, importc: "zlarfp_", dynlib: lapackName.}

proc larft*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint; v: ptr Complex64;
            ldv: ptr cint; tau: ptr Complex64; t: ptr Complex64; ldt: ptr cint): cint {.
    stdcall, discardable, importc: "zlarft_", dynlib: lapackName.}

proc larfx*(side: cstring; m: ptr cint; n: ptr cint; v: ptr Complex64; tau: ptr Complex64;
            c: ptr Complex64; ldc: ptr cint; work: ptr Complex64): cint {.stdcall, discardable,
    importc: "zlarfx_", dynlib: lapackName.}

proc largv*(n: ptr cint; x: ptr Complex64; incx: ptr cint; y: ptr Complex64; incy: ptr cint;
            c: ptr cdouble; incc: ptr cint): cint {.stdcall, discardable, importc: "zlargv_",
    dynlib: lapackName.}

proc larnv*(idist: ptr cint; iseed: ptr cint; n: ptr cint; x: ptr Complex64): cint {.stdcall, discardable,
    importc: "zlarnv_", dynlib: lapackName.}

proc larrv*(n: ptr cint; vl: ptr cdouble; vu: ptr cdouble; d: ptr cdouble; l: ptr cdouble;
            pivmin: ptr cdouble; isplit: ptr cint; m: ptr cint; dol: ptr cint;
            dou: ptr cint; minrgp: ptr cdouble; rtol1: ptr cdouble; rtol2: ptr cdouble;
            w: ptr cdouble; werr: ptr cdouble; wgap: ptr cdouble; iblock: ptr cint;
            indexw: ptr cint; gers: ptr cdouble; z: ptr Complex64; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cdouble; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zlarrv_", dynlib: lapackName.}

# proc larscl2*(m: ptr cint; n: ptr cint; d: ptr cdouble; x: ptr Complex64; ldx: ptr cint): cint {.
#     stdcall, discardable, importc: "zlarscl2_", dynlib: lapackName.}

proc lartg*(f: ptr Complex64; g: ptr Complex64; cs: ptr cdouble; sn: ptr Complex64;
            r: ptr Complex64): cint {.stdcall, discardable, importc: "zlartg_", dynlib: lapackName.}

proc lartv*(n: ptr cint; x: ptr Complex64; incx: ptr cint; y: ptr Complex64; incy: ptr cint;
            c: ptr cdouble; s: ptr Complex64; incc: ptr cint): cint {.stdcall, discardable,
    importc: "zlartv_", dynlib: lapackName.}

proc larz*(side: cstring; m: ptr cint; n: ptr cint; l: ptr cint; v: ptr Complex64;
           incv: ptr cint; tau: ptr Complex64; c: ptr Complex64; ldc: ptr cint;
           work: ptr Complex64): cint {.stdcall, discardable, importc: "zlarz_", dynlib: lapackName.}

proc larzb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; l: ptr cint; v: ptr Complex64;
            ldv: ptr cint; t: ptr Complex64; ldt: ptr cint; c: ptr Complex64; ldc: ptr cint;
            work: ptr Complex64; ldwork: ptr cint): cint {.stdcall, discardable, importc: "zlarzb_",
    dynlib: lapackName.}

proc larzt*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint; v: ptr Complex64;
            ldv: ptr cint; tau: ptr Complex64; t: ptr Complex64; ldt: ptr cint): cint {.
    stdcall, discardable, importc: "zlarzt_", dynlib: lapackName.}

proc lascl*(`type`: cstring; kl: ptr cint; ku: ptr cint; cfrom: ptr cdouble;
            cto: ptr cdouble; m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zlascl_", dynlib: lapackName.}

# proc lascl2*(m: ptr cint; n: ptr cint; d: ptr cdouble; x: ptr Complex64; ldx: ptr cint): cint {.
#     stdcall, discardable, importc: "zlascl2_", dynlib: lapackName.}

proc laset*(uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr Complex64;
            beta: ptr Complex64; a: ptr Complex64; lda: ptr cint): cint {.stdcall, discardable,
    importc: "zlaset_", dynlib: lapackName.}

proc lasr*(side: cstring; pivot: cstring; direct: cstring; m: ptr cint; n: ptr cint;
           c: ptr cdouble; s: ptr cdouble; a: ptr Complex64; lda: ptr cint): cint {.stdcall, discardable,
    importc: "zlasr_", dynlib: lapackName.}

proc lassq*(n: ptr cint; x: ptr Complex64; incx: ptr cint; scale: ptr cdouble;
            sumsq: ptr cdouble): cint {.stdcall, discardable, importc: "zlassq_", dynlib: lapackName.}

proc laswp*(n: ptr cint; a: ptr Complex64; lda: ptr cint; k1: ptr cint; k2: ptr cint;
            ipiv: ptr cint; incx: ptr cint): cint {.stdcall, discardable, importc: "zlaswp_",
    dynlib: lapackName.}

proc lasyf*(uplo: cstring; n: ptr cint; nb: ptr cint; kb: ptr cint; a: ptr Complex64;
            lda: ptr cint; ipiv: ptr cint; w: ptr Complex64; ldw: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zlasyf_", dynlib: lapackName.}

proc lat2c*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; sa: ptr Complex32;
            ldsa: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zlat2c_",
    dynlib: lapackName.}

proc latbs*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            kd: ptr cint; ab: ptr Complex64; ldab: ptr cint; x: ptr Complex64;
            scale: ptr cdouble; cnorm: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zlatbs_", dynlib: lapackName.}

proc latdf*(ijob: ptr cint; n: ptr cint; z: ptr Complex64; ldz: ptr cint;
            rhs: ptr Complex64; rdsum: ptr cdouble; rdscal: ptr cdouble; ipiv: ptr cint;
            jpiv: ptr cint): cint {.stdcall, discardable, importc: "zlatdf_", dynlib: lapackName.}

proc latps*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            ap: ptr Complex64; x: ptr Complex64; scale: ptr cdouble; cnorm: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "zlatps_", dynlib: lapackName.}

proc latrd*(uplo: cstring; n: ptr cint; nb: ptr cint; a: ptr Complex64; lda: ptr cint;
            e: ptr cdouble; tau: ptr Complex64; w: ptr Complex64; ldw: ptr cint): cint {.
    stdcall, discardable, importc: "zlatrd_", dynlib: lapackName.}

proc latrs*(uplo: cstring; trans: cstring; diag: cstring; normin: cstring; n: ptr cint;
            a: ptr Complex64; lda: ptr cint; x: ptr Complex64; scale: ptr cdouble;
            cnorm: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zlatrs_",
    dynlib: lapackName.}

proc latrz*(m: ptr cint; n: ptr cint; l: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64): cint {.stdcall, discardable,
    importc: "zlatrz_", dynlib: lapackName.}

proc latzm*(side: cstring; m: ptr cint; n: ptr cint; v: ptr Complex64; incv: ptr cint;
            tau: ptr Complex64; c1: ptr Complex64; c2: ptr Complex64; ldc: ptr cint;
            work: ptr Complex64): cint {.stdcall, discardable, importc: "zlatzm_", dynlib: lapackName.}

proc lauu2*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zlauu2_", dynlib: lapackName.}

proc lauum*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zlauum_", dynlib: lapackName.}

proc pbcon*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex64; ldab: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zpbcon_",
    dynlib: lapackName.}

proc pbequ*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex64; ldab: ptr cint;
            s: ptr cdouble; scond: ptr cdouble; amax: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zpbequ_", dynlib: lapackName.}

proc pbrfs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; afb: ptr Complex64; ldafb: ptr cint; b: ptr Complex64;
            ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zpbrfs_", dynlib: lapackName.}

proc pbstf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex64; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zpbstf_", dynlib: lapackName.}

proc pbsv*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr Complex64;
           ldab: ptr cint; b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpbsv_", dynlib: lapackName.}

proc pbsvx*(fact: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr Complex64; ldab: ptr cint; afb: ptr Complex64; ldafb: ptr cint;
            equed: cstring; s: ptr cdouble; b: ptr Complex64; ldb: ptr cint;
            x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zpbsvx_", dynlib: lapackName.}

proc pbtf2*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex64; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zpbtf2_", dynlib: lapackName.}

proc pbtrf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr Complex64; ldab: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zpbtrf_", dynlib: lapackName.}

proc pbtrs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr Complex64;
            ldab: ptr cint; b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpbtrs_", dynlib: lapackName.}

proc pftrf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "zpftrf_", dynlib: lapackName.}

proc pftri*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "zpftri_", dynlib: lapackName.}

proc pftrs*(transr: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
            b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpftrs_", dynlib: lapackName.}

proc pocon*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zpocon_",
    dynlib: lapackName.}

proc poequ*(n: ptr cint; a: ptr Complex64; lda: ptr cint; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpoequ_", dynlib: lapackName.}

proc poequb*(n: ptr cint; a: ptr Complex64; lda: ptr cint; s: ptr cdouble;
             scond: ptr cdouble; amax: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpoequb_", dynlib: lapackName.}

proc porfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            af: ptr Complex64; ldaf: ptr cint; b: ptr Complex64; ldb: ptr cint;
            x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zporfs_", dynlib: lapackName.}

# proc porfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
#              lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; s: ptr cdouble;
#              b: ptr Complex64; ldb: ptr cint; x: ptr Complex64; ldx: ptr cint;
#              rcond: ptr cdouble; berr: ptr cdouble; nErrBnds: ptr cint;
#              errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble; nparams: ptr cint;
#              params: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
#     stdcall, discardable, importc: "zporfsx_", dynlib: lapackName.}

proc posv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
           b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zposv_", dynlib: lapackName.}

proc posvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
            lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; equed: cstring;
            s: ptr cdouble; b: ptr Complex64; ldb: ptr cint; x: ptr Complex64;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zposvx_", dynlib: lapackName.}

# proc posvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
#              lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; equed: cstring;
#              s: ptr cdouble; b: ptr Complex64; ldb: ptr cint; x: ptr Complex64;
#              ldx: ptr cint; rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
#              nErrBnds: ptr cint; errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble;
#              nparams: ptr cint; params: ptr cdouble; work: ptr Complex64;
#              rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zposvxx_",
#     dynlib: lapackName.}

proc potf2*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zpotf2_", dynlib: lapackName.}

proc potrf*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zpotrf_", dynlib: lapackName.}

proc potri*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zpotri_", dynlib: lapackName.}

proc potrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpotrs_", dynlib: lapackName.}

proc ppcon*(uplo: cstring; n: ptr cint; ap: ptr Complex64; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zppcon_", dynlib: lapackName.}

proc ppequ*(uplo: cstring; n: ptr cint; ap: ptr Complex64; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zppequ_", dynlib: lapackName.}

proc pprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64;
            afp: ptr Complex64; b: ptr Complex64; ldb: ptr cint; x: ptr Complex64;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zpprfs_",
    dynlib: lapackName.}

proc ppsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64; b: ptr Complex64;
           ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zppsv_",
    dynlib: lapackName.}

proc ppsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64;
            afp: ptr Complex64; equed: cstring; s: ptr cdouble; b: ptr Complex64;
            ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "zppsvx_",
    dynlib: lapackName.}

proc pptrf*(uplo: cstring; n: ptr cint; ap: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpptrf_", dynlib: lapackName.}

proc pptri*(uplo: cstring; n: ptr cint; ap: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpptri_", dynlib: lapackName.}

proc pptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64;
            b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpptrs_", dynlib: lapackName.}

proc pstf2*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; piv: ptr cint;
            rank: ptr cint; tol: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zpstf2_", dynlib: lapackName.}

proc pstrf*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; piv: ptr cint;
            rank: ptr cint; tol: ptr cdouble; work: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zpstrf_", dynlib: lapackName.}

proc ptcon*(n: ptr cint; d: ptr cdouble; e: ptr Complex64; anorm: ptr cdouble;
            rcond: ptr cdouble; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zptcon_", dynlib: lapackName.}

proc pteqr*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr Complex64;
            ldz: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpteqr_", dynlib: lapackName.}

proc ptrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr Complex64;
            df: ptr cdouble; ef: ptr Complex64; b: ptr Complex64; ldb: ptr cint;
            x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zptrfs_", dynlib: lapackName.}

proc ptsv*(n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr Complex64; b: ptr Complex64;
           ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zptsv_",
    dynlib: lapackName.}

proc ptsvx*(fact: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr Complex64;
            df: ptr cdouble; ef: ptr Complex64; b: ptr Complex64; ldb: ptr cint;
            x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zptsvx_", dynlib: lapackName.}

proc pttrf*(n: ptr cint; d: ptr cdouble; e: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpttrf_", dynlib: lapackName.}

proc pttrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr Complex64;
            b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zpttrs_", dynlib: lapackName.}

proc ptts2*(iuplo: ptr cint; n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr Complex64;
            b: ptr Complex64; ldb: ptr cint): cint {.stdcall, discardable, importc: "zptts2_",
    dynlib: lapackName.}

proc rot*(n: ptr cint; cx: ptr Complex64; incx: ptr cint; cy: ptr Complex64; incy: ptr cint;
          c: ptr cdouble; s: ptr Complex64): cint {.stdcall, discardable, importc: "zrot_",
    dynlib: lapackName.}

proc spcon*(uplo: cstring; n: ptr cint; ap: ptr Complex64; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "zspcon_", dynlib: lapackName.}

proc spmv*(uplo: cstring; n: ptr cint; alpha: ptr Complex64; ap: ptr Complex64;
           x: ptr Complex64; incx: ptr cint; beta: ptr Complex64; y: ptr Complex64;
           incy: ptr cint): cint {.stdcall, discardable, importc: "zspmv_", dynlib: lapackName.}

proc spr*(uplo: cstring; n: ptr cint; alpha: ptr Complex64; x: ptr Complex64;
          incx: ptr cint; ap: ptr Complex64): cint {.stdcall, discardable, importc: "zspr_",
    dynlib: lapackName.}

proc sprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64;
            afp: ptr Complex64; ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint;
            x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zsprfs_", dynlib: lapackName.}

proc spsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64; ipiv: ptr cint;
           b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zspsv_", dynlib: lapackName.}

proc spsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64;
            afp: ptr Complex64; ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint;
            x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zspsvx_", dynlib: lapackName.}

proc sptrf*(uplo: cstring; n: ptr cint; ap: ptr Complex64; ipiv: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zsptrf_", dynlib: lapackName.}

proc sptri*(uplo: cstring; n: ptr cint; ap: ptr Complex64; ipiv: ptr cint;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zsptri_",
    dynlib: lapackName.}

proc sptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr Complex64; ipiv: ptr cint;
            b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zsptrs_", dynlib: lapackName.}

proc stedc*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr Complex64;
            ldz: ptr cint; work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zstedc_", dynlib: lapackName.}

proc stegr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr Complex64;
            ldz: ptr cint; isuppz: ptr cint; work: ptr cdouble; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zstegr_", dynlib: lapackName.}

proc stein*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; m: ptr cint; w: ptr cdouble;
            iblock: ptr cint; isplit: ptr cint; z: ptr Complex64; ldz: ptr cint;
            work: ptr cdouble; iwork: ptr cint; ifail: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zstein_", dynlib: lapackName.}

proc stemr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint; m: ptr cint;
            w: ptr cdouble; z: ptr Complex64; ldz: ptr cint; nzc: ptr cint;
            isuppz: ptr cint; tryrac: ptr cint; work: ptr cdouble; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zstemr_", dynlib: lapackName.}

proc steqr*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr Complex64;
            ldz: ptr cint; work: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "zsteqr_", dynlib: lapackName.}

proc sycon*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "zsycon_", dynlib: lapackName.}

proc syequb*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; s: ptr cdouble;
             scond: ptr cdouble; amax: ptr cdouble; work: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "zsyequb_", dynlib: lapackName.}

proc symv*(uplo: cstring; n: ptr cint; alpha: ptr Complex64; a: ptr Complex64;
           lda: ptr cint; x: ptr Complex64; incx: ptr cint; beta: ptr Complex64;
           y: ptr Complex64; incy: ptr cint): cint {.stdcall, discardable, importc: "zsymv_",
    dynlib: lapackName.}

proc syr*(uplo: cstring; n: ptr cint; alpha: ptr Complex64; x: ptr Complex64;
          incx: ptr cint; a: ptr Complex64; lda: ptr cint): cint {.stdcall, discardable,
    importc: "zsyr_", dynlib: lapackName.}

proc syrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint; b: ptr Complex64;
            ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zsyrfs_", dynlib: lapackName.}

# proc syrfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
#              lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
#              s: ptr cdouble; b: ptr Complex64; ldb: ptr cint; x: ptr Complex64;
#              ldx: ptr cint; rcond: ptr cdouble; berr: ptr cdouble; nErrBnds: ptr cint;
#              errBndsNorm: ptr cdouble; errBndsComp: ptr cdouble; nparams: ptr cint;
#              params: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
#     stdcall, discardable, importc: "zsyrfsx_", dynlib: lapackName.}

proc sysv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
           ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint; work: ptr Complex64;
           lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "zsysv_",
    dynlib: lapackName.}

proc sysvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
            lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr Complex64; ldb: ptr cint; x: ptr Complex64; ldx: ptr cint;
            rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr Complex64; lwork: ptr cint; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "zsysvx_", dynlib: lapackName.}

# proc sysvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64;
#              lda: ptr cint; af: ptr Complex64; ldaf: ptr cint; ipiv: ptr cint;
#              equed: cstring; s: ptr cdouble; b: ptr Complex64; ldb: ptr cint;
#              x: ptr Complex64; ldx: ptr cint; rcond: ptr cdouble; rpvgrw: ptr cdouble;
#              berr: ptr cdouble; nErrBnds: ptr cint; errBndsNorm: ptr cdouble;
#              errBndsComp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
#              work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
#     importc: "zsysvxx_", dynlib: lapackName.}

proc sytf2*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zsytf2_", dynlib: lapackName.}

proc sytrf*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zsytrf_", dynlib: lapackName.}

proc sytri*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; ipiv: ptr cint;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zsytri_",
    dynlib: lapackName.}

proc sytrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr Complex64; lda: ptr cint;
            ipiv: ptr cint; b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "zsytrs_", dynlib: lapackName.}

proc tbcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr Complex64; ldab: ptr cint; rcond: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "ztbcon_",
    dynlib: lapackName.}

proc tbrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr Complex64; ldab: ptr cint; b: ptr Complex64;
            ldb: ptr cint; x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "ztbrfs_", dynlib: lapackName.}

proc tbtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr Complex64; ldab: ptr cint; b: ptr Complex64;
            ldb: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "ztbtrs_",
    dynlib: lapackName.}

proc tfsm*(transr: cstring; side: cstring; uplo: cstring; trans: cstring; diag: cstring;
           m: ptr cint; n: ptr cint; alpha: ptr Complex64; a: ptr Complex64;
           b: ptr Complex64; ldb: ptr cint): cint {.stdcall, discardable, importc: "ztfsm_",
    dynlib: lapackName.}

proc tftri*(transr: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr Complex64;
            info: ptr cint): cint {.stdcall, discardable, importc: "ztftri_", dynlib: lapackName.}

proc tfttp*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr Complex64;
            ap: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "ztfttp_",
    dynlib: lapackName.}

proc tfttr*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr Complex64;
            a: ptr Complex64; lda: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ztfttr_", dynlib: lapackName.}

proc tgevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            s: ptr Complex64; lds: ptr cint; p: ptr Complex64; ldp: ptr cint;
            vl: ptr Complex64; ldvl: ptr cint; vr: ptr Complex64; ldvr: ptr cint;
            mm: ptr cint; m: ptr cint; work: ptr Complex64; rwork: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "ztgevc_", dynlib: lapackName.}

proc tgex2*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr Complex64;
            lda: ptr cint; b: ptr Complex64; ldb: ptr cint; q: ptr Complex64; ldq: ptr cint;
            z: ptr Complex64; ldz: ptr cint; j1: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ztgex2_", dynlib: lapackName.}

proc tgexc*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr Complex64;
            lda: ptr cint; b: ptr Complex64; ldb: ptr cint; q: ptr Complex64; ldq: ptr cint;
            z: ptr Complex64; ldz: ptr cint; ifst: ptr cint; ilst: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ztgexc_", dynlib: lapackName.}

proc tgsen*(ijob: ptr cint; wantq: ptr cint; wantz: ptr cint; select: ptr cint;
            n: ptr cint; a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
            alpha: ptr Complex64; beta: ptr Complex64; q: ptr Complex64; ldq: ptr cint;
            z: ptr Complex64; ldz: ptr cint; m: ptr cint; pl: ptr cdouble; pr: ptr cdouble;
            dif: ptr cdouble; work: ptr Complex64; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint): cint {.stdcall, discardable, importc: "ztgsen_",
    dynlib: lapackName.}

proc tgsja*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; k: ptr cint; l: ptr cint; a: ptr Complex64; lda: ptr cint;
            b: ptr Complex64; ldb: ptr cint; tola: ptr cdouble; tolb: ptr cdouble;
            alpha: ptr cdouble; beta: ptr cdouble; u: ptr Complex64; ldu: ptr cint;
            v: ptr Complex64; ldv: ptr cint; q: ptr Complex64; ldq: ptr cint;
            work: ptr Complex64; ncycle: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ztgsja_", dynlib: lapackName.}

proc tgsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
            vl: ptr Complex64; ldvl: ptr cint; vr: ptr Complex64; ldvr: ptr cint;
            s: ptr cdouble; dif: ptr cdouble; mm: ptr cint; m: ptr cint;
            work: ptr Complex64; lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ztgsna_", dynlib: lapackName.}

proc tgsy2*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint; a: ptr Complex64;
            lda: ptr cint; b: ptr Complex64; ldb: ptr cint; c: ptr Complex64; ldc: ptr cint;
            d: ptr Complex64; ldd: ptr cint; e: ptr Complex64; lde: ptr cint;
            f: ptr Complex64; ldf: ptr cint; scale: ptr cdouble; rdsum: ptr cdouble;
            rdscal: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "ztgsy2_",
    dynlib: lapackName.}

proc tgsyl*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint; a: ptr Complex64;
            lda: ptr cint; b: ptr Complex64; ldb: ptr cint; c: ptr Complex64; ldc: ptr cint;
            d: ptr Complex64; ldd: ptr cint; e: ptr Complex64; lde: ptr cint;
            f: ptr Complex64; ldf: ptr cint; scale: ptr cdouble; dif: ptr cdouble;
            work: ptr Complex64; lwork: ptr cint; iwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ztgsyl_", dynlib: lapackName.}

proc tpcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; ap: ptr Complex64;
            rcond: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "ztpcon_", dynlib: lapackName.}

proc tprfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr Complex64; b: ptr Complex64; ldb: ptr cint; x: ptr Complex64;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble; work: ptr Complex64;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "ztprfs_",
    dynlib: lapackName.}

proc tptri*(uplo: cstring; diag: cstring; n: ptr cint; ap: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "ztptri_", dynlib: lapackName.}

proc tptrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr Complex64; b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ztptrs_", dynlib: lapackName.}

proc tpttf*(transr: cstring; uplo: cstring; n: ptr cint; ap: ptr Complex64;
            arf: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "ztpttf_",
    dynlib: lapackName.}

proc tpttr*(uplo: cstring; n: ptr cint; ap: ptr Complex64; a: ptr Complex64; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ztpttr_", dynlib: lapackName.}

proc trcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr Complex64;
            lda: ptr cint; rcond: ptr cdouble; work: ptr Complex64; rwork: ptr cdouble;
            info: ptr cint): cint {.stdcall, discardable, importc: "ztrcon_", dynlib: lapackName.}

proc trevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr Complex64; ldt: ptr cint; vl: ptr Complex64; ldvl: ptr cint;
            vr: ptr Complex64; ldvr: ptr cint; mm: ptr cint; m: ptr cint;
            work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "ztrevc_", dynlib: lapackName.}

proc trexc*(compq: cstring; n: ptr cint; t: ptr Complex64; ldt: ptr cint; q: ptr Complex64;
            ldq: ptr cint; ifst: ptr cint; ilst: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ztrexc_", dynlib: lapackName.}

proc trrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
            x: ptr Complex64; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr Complex64; rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable,
    importc: "ztrrfs_", dynlib: lapackName.}

proc trsen*(job: cstring; compq: cstring; select: ptr cint; n: ptr cint;
            t: ptr Complex64; ldt: ptr cint; q: ptr Complex64; ldq: ptr cint;
            w: ptr Complex64; m: ptr cint; s: ptr cdouble; sep: ptr cdouble;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ztrsen_", dynlib: lapackName.}

proc trsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr Complex64; ldt: ptr cint; vl: ptr Complex64; ldvl: ptr cint;
            vr: ptr Complex64; ldvr: ptr cint; s: ptr cdouble; sep: ptr cdouble;
            mm: ptr cint; m: ptr cint; work: ptr Complex64; ldwork: ptr cint;
            rwork: ptr cdouble; info: ptr cint): cint {.stdcall, discardable, importc: "ztrsna_",
    dynlib: lapackName.}

proc trsyl*(trana: cstring; tranb: cstring; isgn: ptr cint; m: ptr cint; n: ptr cint;
            a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint;
            c: ptr Complex64; ldc: ptr cint; scale: ptr cdouble; info: ptr cint): cint {.
    stdcall, discardable, importc: "ztrsyl_", dynlib: lapackName.}

proc trti2*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ztrti2_", dynlib: lapackName.}

proc trtri*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "ztrtri_", dynlib: lapackName.}

proc trtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr Complex64; lda: ptr cint; b: ptr Complex64; ldb: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "ztrtrs_", dynlib: lapackName.}

proc trttf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            arf: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "ztrttf_",
    dynlib: lapackName.}

proc trttp*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint; ap: ptr Complex64;
            info: ptr cint): cint {.stdcall, discardable, importc: "ztrttp_", dynlib: lapackName.}

proc tzrqf*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            info: ptr cint): cint {.stdcall, discardable, importc: "ztzrqf_", dynlib: lapackName.}

proc tzrzf*(m: ptr cint; n: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.stdcall, discardable,
    importc: "ztzrzf_", dynlib: lapackName.}

proc ung2l*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zung2l_", dynlib: lapackName.}

proc ung2r*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zung2r_", dynlib: lapackName.}

proc ungbr*(vect: cstring; m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex64;
            lda: ptr cint; tau: ptr Complex64; work: ptr Complex64; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zungbr_", dynlib: lapackName.}

proc unghr*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zunghr_", dynlib: lapackName.}

proc ungl2*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zungl2_", dynlib: lapackName.}

proc unglq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zunglq_", dynlib: lapackName.}

proc ungql*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zungql_", dynlib: lapackName.}

proc ungqr*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zungqr_", dynlib: lapackName.}

proc ungr2*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zungr2_", dynlib: lapackName.}

proc ungrq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zungrq_", dynlib: lapackName.}

proc ungtr*(uplo: cstring; n: ptr cint; a: ptr Complex64; lda: ptr cint;
            tau: ptr Complex64; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zungtr_", dynlib: lapackName.}

proc unm2l*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex64; lda: ptr cint; tau: ptr Complex64; c: ptr Complex64;
            ldc: ptr cint; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zunm2l_", dynlib: lapackName.}

proc unm2r*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex64; lda: ptr cint; tau: ptr Complex64; c: ptr Complex64;
            ldc: ptr cint; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zunm2r_", dynlib: lapackName.}

proc unmbr*(vect: cstring; side: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            k: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            c: ptr Complex64; ldc: ptr cint; work: ptr Complex64; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zunmbr_", dynlib: lapackName.}

proc unmhr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            c: ptr Complex64; ldc: ptr cint; work: ptr Complex64; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zunmhr_", dynlib: lapackName.}

proc unml2*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex64; lda: ptr cint; tau: ptr Complex64; c: ptr Complex64;
            ldc: ptr cint; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zunml2_", dynlib: lapackName.}

proc unmlq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex64; lda: ptr cint; tau: ptr Complex64; c: ptr Complex64;
            ldc: ptr cint; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zunmlq_", dynlib: lapackName.}

proc unmql*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex64; lda: ptr cint; tau: ptr Complex64; c: ptr Complex64;
            ldc: ptr cint; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zunmql_", dynlib: lapackName.}

proc unmqr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex64; lda: ptr cint; tau: ptr Complex64; c: ptr Complex64;
            ldc: ptr cint; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zunmqr_", dynlib: lapackName.}

proc unmr2*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex64; lda: ptr cint; tau: ptr Complex64; c: ptr Complex64;
            ldc: ptr cint; work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable,
    importc: "zunmr2_", dynlib: lapackName.}

proc unmr3*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            c: ptr Complex64; ldc: ptr cint; work: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "zunmr3_", dynlib: lapackName.}

proc unmrq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr Complex64; lda: ptr cint; tau: ptr Complex64; c: ptr Complex64;
            ldc: ptr cint; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zunmrq_", dynlib: lapackName.}

proc unmrz*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr Complex64; lda: ptr cint; tau: ptr Complex64;
            c: ptr Complex64; ldc: ptr cint; work: ptr Complex64; lwork: ptr cint;
            info: ptr cint): cint {.stdcall, discardable, importc: "zunmrz_", dynlib: lapackName.}

proc unmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            a: ptr Complex64; lda: ptr cint; tau: ptr Complex64; c: ptr Complex64;
            ldc: ptr cint; work: ptr Complex64; lwork: ptr cint; info: ptr cint): cint {.
    stdcall, discardable, importc: "zunmtr_", dynlib: lapackName.}

proc upgtr*(uplo: cstring; n: ptr cint; ap: ptr Complex64; tau: ptr Complex64;
            q: ptr Complex64; ldq: ptr cint; work: ptr Complex64; info: ptr cint): cint {.
    stdcall, discardable, importc: "zupgtr_", dynlib: lapackName.}

proc upmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            ap: ptr Complex64; tau: ptr Complex64; c: ptr Complex64; ldc: ptr cint;
            work: ptr Complex64; info: ptr cint): cint {.stdcall, discardable, importc: "zupmtr_",
    dynlib: lapackName.}

# proc dlamc1*(beta: ptr cint; t: ptr cint; rnd: ptr cint; ieee1: ptr cint): cint {.
#     stdcall, discardable, importc: "dlamc1_", dynlib: lapackName.}
proc ecnd*(): cdouble {.stdcall, discardable, importc: "dsecnd_", dynlib: lapackName.}

#proc ilaver*(versMajor: ptr cint; versMinor: ptr cint; versPatch: ptr cint): cint {.
#    stdcall, discardable, importc: "ilaver_", dynlib: lapackName.}
#proc lsame*(ca: cstring; cb: cstring): cint {.stdcall, discardable, importc: "lsame_",
#    dynlib: lapackName.}
proc econd*(): cdouble {.stdcall, discardable, importc: "second_", dynlib: lapackName.}
proc slamch*(cmach: cstring): cdouble {.stdcall, discardable, importc: "slamch_", dynlib: lapackName.}

# proc slamc1*(beta: ptr cint; t: ptr cint; rnd: ptr cint; ieee1: ptr cint): cint {.
#     stdcall, discardable, importc: "slamc1_", dynlib: lapackName.}

# proc lamc2*(beta: ptr cint; t: ptr cint; rnd: ptr cint; eps: ptr cfloat; emin: ptr cint;
#             rmin: ptr cfloat; emax: ptr cint; rmax: ptr cfloat): cint {.stdcall, discardable,
#     importc: "slamc2_", dynlib: lapackName.}
# proc lamc3*(a: ptr cfloat; b: ptr cfloat): cdouble {.stdcall, discardable, importc: "slamc3_",
#     dynlib: lapackName.}
#
# proc lamc4*(emin: ptr cint; start: ptr cfloat; base: ptr cint): cint {.stdcall, discardable,
#     importc: "slamc4_", dynlib: lapackName.}
#
# proc lamc5*(beta: ptr cint; p: ptr cint; emin: ptr cint; ieee: ptr cint; emax: ptr cint;
#             rmax: ptr cfloat): cint {.stdcall, discardable, importc: "slamc5_", dynlib: lapackName.}
proc dlamch*(cmach: cstring): cdouble {.stdcall, discardable, importc: "dlamch_", dynlib: lapackName.}

# proc lamc1*(beta: ptr cint; t: ptr cint; rnd: ptr cint; ieee1: ptr cint): cint {.
#     stdcall, discardable, importc: "dlamc1_", dynlib: lapackName.}

# proc lamc2*(beta: ptr cint; t: ptr cint; rnd: ptr cint; eps: ptr cdouble; emin: ptr cint;
#             rmin: ptr cdouble; emax: ptr cint; rmax: ptr cdouble): cint {.stdcall, discardable,
#     importc: "dlamc2_", dynlib: lapackName.}
# proc lamc3*(a: ptr cdouble; b: ptr cdouble): cdouble {.stdcall, discardable, importc: "dlamc3_",
#     dynlib: lapackName.}
#
# proc lamc4*(emin: ptr cint; start: ptr cdouble; base: ptr cint): cint {.stdcall, discardable,
#     importc: "dlamc4_", dynlib: lapackName.}
#
# proc lamc5*(beta: ptr cint; p: ptr cint; emin: ptr cint; ieee: ptr cint; emax: ptr cint;
#             rmax: ptr cdouble): cint {.stdcall, discardable, importc: "dlamc5_", dynlib: lapackName.}
#proc ilaenv*(ispec: ptr cint; name: cstring; opts: cstring; n1: ptr cint; n2: ptr cint;
#            n3: ptr cint; n4: ptr cint): cint {.stdcall, discardable, importc: "ilaenv_",
#    dynlib: lapackName.}
