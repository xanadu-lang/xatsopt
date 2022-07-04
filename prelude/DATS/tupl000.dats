(* ****** ****** *)
(*
** for tuples
*)
(* ****** ****** *)
#impltmp<>
t0up_print$beg()=strn_print("@(")
#impltmp<>
t1up_print$beg()=strn_print("$(")
(* ****** ****** *)
#impltmp<>
t0up_print$end() = strn_print(")")
#impltmp<>
t1up_print$end() = strn_print(")")
(* ****** ****** *)
#impltmp<>
t0up_print$sep() = strn_print(",")
#impltmp<>
t1up_print$sep() = strn_print(",")
(* ****** ****** *)
//
(*
HX-2022-07-03
g_print for flat-tuples
Sun Jul  3 22:18:42 EDT 2022
*)
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0}
g_print
<
(a0,a1)>(t2) =
let
val () = t0up_print$beg( )
val () = g_print<a0>(t2.0)
val () = t0up_print$sep( )
val () = g_print<a1>(t2.1)
val () = t0up_print$end( )
end // end of [g_print<t0up2>(t2)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0
,a2:t0}
g_print
<
(a0
,a1,a2)>(t3) =
let
val () = t0up_print$beg( )
val () = g_print<a0>(t3.0)
val () = t0up_print$sep( )
val () = g_print<a1>(t3.1)
val () = t0up_print$sep( )
val () = g_print<a1>(t3.2)
val () = t0up_print$end( )
end // end of [g_print<t0up3>(t3)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0}
g_print
<
(a0,a1
,a2,a3)>(t4) =
let
val () = t0up_print$beg( )
val () = g_print<a0>(t4.0)
val () = t0up_print$sep( )
val () = g_print<a1>(t4.1)
val () = t0up_print$sep( )
val () = g_print<a1>(t4.2)
val () = t0up_print$sep( )
val () = g_print<a1>(t4.3)
val () = t0up_print$end( )
end // end of [g_print<t0up>(t4)]
//
(* ****** ****** *)
//
(*
HX-2022-07-03:
Sun Jul  3 22:18:42 EDT 2022
gl_print for flat/boxed tuples
*)
//
(* ****** ****** *)
//
#impltmp
{a0:vt}
gl_print1
<
t1up1
( a0 )>(t1) =
let
val () = t1up_print$beg(   )
val () = gl_print1<a0>(t1.0)
val () = t1up_print$end(   )
end // end of [gl_print1<t1up1>(t1)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt}
gl_print1
<
t0up2
(a0,a1)>(t2) =
let
val () = t0up_print$beg(   )
val () = gl_print1<a0>(t2.0)
val () = t0up_print$sep(   )
val () = gl_print1<a1>(t2.1)
val () = t0up_print$end(   )
end // end of [gl_print1<t0up2>(t2)]
//
#impltmp
{a0:vt
,a1:vt}
gl_print1
<
t1up2
(a0,a1)>(t2) =
let
val () = t1up_print$beg(   )
val () = gl_print1<a0>(t2.0)
val () = t1up_print$sep(   )
val () = gl_print1<a1>(t2.1)
val () = t1up_print$end(   )
end // end of [gl_print1<t1up2>(t2)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt
,a2:vt}
gl_print1
<
t0up3
(a0,a1,a2)>(t3) =
let
val () = t0up_print$beg(   )
val () = gl_print1<a0>(t3.0)
val () = t0up_print$sep(   )
val () = gl_print1<a1>(t3.1)
val () = t0up_print$sep(   )
val () = gl_print1<a2>(t3.2)
val () = t0up_print$end(   )
end // end of [gl_print1<t0up3>(t3)]
//
#impltmp
{a0:vt
,a1:vt
,a2:vt}
gl_print1
<
t1up3
(a0,a1,a2)>(t3) =
let
val () = t1up_print$beg(   )
val () = gl_print1<a0>(t3.0)
val () = t1up_print$sep(   )
val () = gl_print1<a1>(t3.1)
val () = t1up_print$sep(   )
val () = gl_print1<a2>(t3.2)
val () = t1up_print$end(   )
end // end of [gl_print1<t1up3>(t3)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_tupl000.dats] *)
