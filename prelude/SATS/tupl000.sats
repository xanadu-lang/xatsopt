(* ****** ****** *)
(*
** for tuples
*)
(* ****** ****** *)
//
(*
#vwtpdef
t0up1(a0:vt) = @(a0)
*)
#vwtpdef
t1up1(a0:vt) = $(a0)
//
(* ****** ****** *)
#vwtpdef
t0up2
(a0:vt,a1:vt) = @(a0, a1)
#vwtpdef
t1up2
(a0:vt,a1:vt) = $(a0, a1)
(* ****** ****** *)
#vwtpdef
t0up3
(a0:vt
,a1:vt,a2:vt) = @(a0, a1, a2)
#vwtpdef
t1up3
(a0:vt
,a1:vt,a2:vt) = $(a0, a1, a2)
(* ****** ****** *)
#vwtpdef
t0up4
(a0:vt,a1:vt
,a2:vt,a3:vt) = @(a0, a1, a2, a3)
#vwtpdef
t1up4
(a0:vt,a1:vt
,a2:vt,a3:vt) = $(a0, a1, a2, a3)
(* ****** ****** *)
fun<>
t0up_print$beg(): void // print("@(")
fun<>
t0up_print$end(): void // print (")" )
fun<>
t0up_print$sep(): void // print( "," )
(* ****** ****** *)
fun<>
t1up_print$beg(): void // print("$(")
fun<>
t1up_print$end(): void // print( ")" )
fun<>
t1up_print$sep(): void // print( "," )
(* ****** ****** *)
#vwtpdef
t0up5
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt) = @(a0, a1, a2, a3, a4)
#vwtpdef
t1up4
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt) = $(a0, a1, a2, a3, a4)
(* ****** ****** *)
#vwtpdef
t0up6
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt) = @(a0, a1, a2, a3, a4, a5)
#vwtpdef
t1up4
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt) = $(a0, a1, a2, a3, a4, a5)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_tupl000.sats] *)
