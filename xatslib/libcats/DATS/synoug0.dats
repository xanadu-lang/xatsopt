(* ****** ****** *)
//
(*
HX-2022-06-03
Syntactic candies :)
*)
//
(* ****** ****** *)
#staload
"./../SATS/libcats.sats"
#staload
"./../SATS/synoug0.sats"
(* ****** ****** *)
//
(*
HX:
Implementing prout/proutln
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
prout1_a01 =
fproc1_a01
<  a1  > where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1><a2>
prout1_a02 =
fproc1_a02
<a1><a2> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
prout1_a03 =
fproc1_a03
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
prout1_a04 =
fproc1_a04
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
prout1_a05 =
fproc1_a05
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
prout1_a06 =
fproc1_a06
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
prout1_a07 =
fproc1_a07
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
prout1_a08 =
fproc1_a08
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
prout1_a09 =
fproc1_a09
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
(* ****** ****** *)
//
#impltmp
proutln1_a00
<>(*tmp*)
((*_*)) = prout_ref( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
proutln1_a01
( x1 ) =
(
prout1_a01
(   x1   ) ; proutln1_a00<>()
) (* end of [proutln1_a01] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
proutln1_a02
( x1
, x2 ) =
(
prout1_a02
( x1, x2 ) ; proutln1_a00<>()
) (* end of [proutln1_a02] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
proutln1_a03
( x1
, x2
, x3 ) =
(
prout1_a03
( x1
, x2, x3 ) ; proutln1_a00<>()
) (* end of [proutln1_a03] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
proutln1_a04
( x1
, x2
, x3
, x4 ) =
(
prout1_a04
( x1, x2
, x3, x4 ) ; proutln1_a00<>()
) (* end of [proutln1_a04] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
proutln1_a05
( x1
, x2
, x3
, x4
, x5 ) =
(
prout1_a05
( x1
, x2, x3
, x4, x5 ) ; proutln1_a00<>()
) (* end of [proutln1_a05] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
proutln1_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
prout1_a06
( x1, x2
, x3, x4
, x5, x6 ) ; proutln1_a00<>()
) (* end of [proutln1_a06] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
proutln1_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
prout1_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; proutln1_a00<>()
) (* end of [proutln1_a07] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
proutln1_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
prout1_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; proutln1_a00<>()
) (* end of [proutln1_a08] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
proutln1_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
prout1_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; proutln1_a00<>()
) (* end of [proutln1_a09] *)
//
(* ****** ****** *)
//
(*
HX:
Implementing prerr/prerrln
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
prerr1_a01 =
fproc1_a01
<  a1  > where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1><a2>
prerr1_a02 =
fproc1_a02
<a1><a2> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
prerr1_a03 =
fproc1_a03
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
prerr1_a04 =
fproc1_a04
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
prerr1_a05 =
fproc1_a05
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
prerr1_a06 =
fproc1_a06
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
prerr1_a07 =
fproc1_a07
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
prerr1_a08 =
fproc1_a08
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
prerr1_a09 =
fproc1_a09
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
(* ****** ****** *)
//
#impltmp
prerrln1_a00
<>(*tmp*)
((*_*)) = prerr_ref( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
prerrln1_a01
( x1 ) =
(
prerr1_a01
(   x1   ) ; prerrln1_a00<>()
) (* end of [prerrln1_a01] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
prerrln1_a02
( x1
, x2 ) =
(
prerr1_a02
( x1, x2 ) ; prerrln1_a00<>()
) (* end of [prerrln1_a02] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
prerrln1_a03
( x1
, x2
, x3 ) =
(
prerr1_a03
( x1
, x2, x3 ) ; prerrln1_a00<>()
) (* end of [prerrln1_a03] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
prerrln1_a04
( x1
, x2
, x3
, x4 ) =
(
prerr1_a04
( x1, x2
, x3, x4 ) ; prerrln1_a00<>()
) (* end of [prerrln1_a04] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
prerrln1_a05
( x1
, x2
, x3
, x4
, x5 ) =
(
prerr1_a05
( x1
, x2, x3
, x4, x5 ) ; prerrln1_a00<>()
) (* end of [prerrln1_a05] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
prerrln1_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
prerr1_a06
( x1, x2
, x3, x4
, x5, x6 ) ; prerrln1_a00<>()
) (* end of [prerrln1_a06] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
prerrln1_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
prerr1_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; prerrln1_a00<>()
) (* end of [prerrln1_a07] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
prerrln1_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
prerr1_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; prerrln1_a00<>()
) (* end of [prerrln1_a08] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
prerrln1_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
prerr1_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; prerrln1_a00<>()
) (* end of [prerrln1_a09] *)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_synoug0.dats] *)
