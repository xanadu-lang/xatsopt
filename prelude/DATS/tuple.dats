(* ****** ****** *)
(*
** for tuples
*)
(* ****** ****** *)
vwtpdef
t0up2
(a0:vt,a1:vt) = @(a0, a1)
vwtpdef
t1up2
(a0:vt,a1:vt) = $(a0, a1)
(* ****** ****** *)
vwtpdef
t0up3
(a0:vt
,a1:vt,a2:vt) = @(a0, a1, a2)
vwtpdef
t1up3
(a0:vt
,a1:vt,a2:vt) = $(a0, a1, a2)
(* ****** ****** *)
#extern
fun<>
t0up_print$beg(): void
#extern
fun<>
t1up_print$beg(): void
impltmp<>
t0up_print$beg()=string_print("@(")
impltmp<>
t1up_print$beg()=string_print("$(")
(* ****** ****** *)
#extern
fun<>
t0up_print$end(): void
#extern
fun<>
t1up_print$end(): void
impltmp<>
t0up_print$end() = string_print(")")
impltmp<>
t1up_print$end() = string_print(")")
(* ****** ****** *)
#extern
fun<>
t0up_print$sep(): void
#extern
fun<>
t1up_print$sep(): void
impltmp<>
t0up_print$sep() = string_print(",")
impltmp<>
t1up_print$sep() = string_print(",")
(* ****** ****** *)
//
impltmp
{a0:t0
,a1:t0}
g_print
<(a0,a1)> =
gl_print1<t0up2(a0,a1)>
//
impltmp
{a0:vt
,a1:vt}
gl_print1
<
t0up2
(a0,a1)>(t2) =
let
val () = t0up_print$beg()
val () = gl_print1<a0>(t2.0)
val () = t0up_print$sep()
val () = gl_print1<a1>(t2.1)
val () = t0up_print$end()
end // end of [gl_print1<t0up2>]
//
(* ****** ****** *)

impltmp
{a0:vt
,a1:vt}
gl_print1
<
t1up2
(a0,a1)>(t2) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(t2.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(t2.1)
val () = t1up_print$end()
end // end of [gl_print1<t1up2>]

(* ****** ****** *)
//
impltmp
{a0:t0
,a1:t0
,a2:t0}
g_print
<(a0,a1,a2)> =
gl_print1<t0up3(a0,a1,a2)>
//
impltmp
{a0:vt
,a1:vt
,a2:vt}
gl_print1
<
t0up3
(a0,a1,a2)>(t3) =
let
val () = t0up_print$beg()
val () = gl_print1<a0>(t3.0)
val () = t0up_print$sep()
val () = gl_print1<a1>(t3.1)
val () = t0up_print$end()
end // end of [gl_print1<t0up3>]
//
(* ****** ****** *)

impltmp
{a0:vt
,a1:vt
,a2:vt}
gl_print1
<
t1up3
(a0,a1,a2)>(t3) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(t3.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(t3.1)
val () = t1up_print$end()
end // end of [gl_print1<t1up3>]

(* ****** ****** *)

(* end of [tuple.dats] *)
