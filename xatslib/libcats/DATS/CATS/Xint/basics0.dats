(* ****** ****** *)
(*
Basics for Xinterp
*)
(* ****** ****** *)
#staload
"xatslib\
/libcats/SATS/libcats.sats"
(* ****** ****** *)
//
#staload "./../../g00iout.dats"
#staload "./../../rand000.dats"
#staload "./../../stdiout.dats"
//
(* ****** ****** *)
//
#extern
fun
XINTERP_g_stdin
((*void*)): FILEref
#extern
fun
XINTERP_g_stdout
((*void*)): FILEref
#extern
fun
XINTERP_g_stderr
((*void*)): FILEref
//
#impltmp
g_stdin<> = XINTERP_g_stdin
#impltmp
g_stdout<> = XINTERP_g_stdout
#impltmp
g_stderr<> = XINTERP_g_stderr
//
(* ****** ****** *)
//
#extern
fun
XINTERP_bool_fprint
(FILEref, bool): void
#impltmp
bool_fprint<> = XINTERP_bool_fprint
#extern
fun
XINTERP_char_fprint
(FILEref, char): void
#impltmp
char_fprint<> = XINTERP_char_fprint
//
#extern
fun
XINTERP_gint_fprint_sint
(FILEref, sint): void
#impltmp
gint_fprint_sint<> = XINTERP_gint_fprint_sint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_fgetc_ref
(fi: FILEref): int
#impltmp fgetc_ref<> = XINTERP_fgetc_ref
//
(* ****** ****** *)
//
#extern
fun
XINTERP_fputc_ref
( c0: int
, fo: FILEref): int
#impltmp fputc_ref<> = XINTERP_fputc_ref
//
(* ****** ****** *)
//
#extern
fun
XINTERP_nint_rand_limit
{n:pos}(limit: int(n)): nintlt(n)
//
#impltmp
nint_rand_limit<> = XINTERP_nint_rand_limit
//
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_DATS_CATS_Xint_basics0.dats] *)
