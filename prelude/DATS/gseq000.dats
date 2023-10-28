(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)
//
(*
#staload
"./../SATS/gseq.sats"
*)
//
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
(*
//HX: For 1-gseq-operations
*)
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_nilq(xs) =
(
gseq_forall<xs><x0>(xs)
) where
{
#impltmp
forall$test
<x0>( (*void*) ) = false
}(*where*)//end(gseq_nilq)
//
#impltmp
<xs><x0>
gseq_consq(xs) =
(
bool_neg<>
(gseq_nilq<xs><x0>( xs ))
)(*end-of[gseq_consq(xs)]*)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_head_exn(xs) =
if
gseq_consq<xs><x0>(xs)
then
gseq_head_raw<xs><x0>(xs)
else $raise SubscriptExn()
endif//end-of(gseq_head_exn)
#impltmp
<xs><x0>
gseq_tail_exn(xs) =
if
gseq_consq<xs><x0>(xs)
then
gseq_tail_raw<xs><x0>(xs)
else $raise SubscriptExn()
endif//end-of(gseq_tail_exn)
//
#impltmp
<xs><x0>
gseq_head_opt(xs) =
if
gseq_consq<xs><x0>(xs)
then
optn_vt_cons
(
gseq_head_raw<xs><x0>(xs)
) else optn_vt_nil((*void*))
#impltmp
<xs><x0>
gseq_tail_opt(xs) =
if
gseq_consq<xs><x0>(xs)
then
optn_vt_cons
(
gseq_tail_raw<xs><x0>(xs)
) else optn_vt_nil((*void*))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_last_raw(xs) =
let
var xs = xs
val x0 =
gseq_uncons_raw<xs><x0>(xs)
in
gseq_last_ini<xs><x0>(xs, x0)
end(*let*)//end(gseq_last_raw)
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_last_opt(xs) =
let
//
var xs = xs
//
val opt =
gseq_uncons_opt<xs><x0>(xs)
in
case+ opt of
| ~
optn_vt_nil() =>
optn_vt_nil()
| ~
optn_vt_cons(x0) =>
optn_vt_cons
(gseq_last_ini<xs><x0>(xs, x0))
end(*let*)//end-of(gseq_last_opt)

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_last_ini
(xs, x0) = let
//
#typedef r0 = x0
//
#impltmp
foldl$fopr
<x0><r0>(r0, x0) = x0
//
in//let
gseq_foldl<xs><x0><r0>(xs, x0)
end(*let*)//(gseq_last_ini/foldl)

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_uncons_raw(xs) =
(
let
  val () = xs := tl in hd
end
) where
{
val hd =
  gseq_head_raw<xs><x0>(xs)
val tl =
  gseq_tail_raw<xs><x0>(xs)
}
//
(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
gseq_uncons_exn
  (xs) =
let
val opt =
gseq_uncons_opt<xs><x0>(xs)
in
//
case+ opt of
| optn_vt_nil() =>
  $raise SubscriptExn()
| optn_vt_cons(x0) => x0
//
end // end of [gseq_uncons_exn]
*)
//
#impltmp
<xs><x0>
gseq_uncons_exn
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then $raise SubscriptExn()
else gseq_uncons_raw<xs><x0>(xs)
)
#impltmp
<xs><x0>
gseq_uncons_opt
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then
  optn_vt_nil((*void*))
else
  optn_vt_cons
  (gseq_uncons_raw<xs><x0>(xs))
endif (* end of [if] *)
)
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_cmp
(xs1, xs2) =
(
gseq_z2forcmp
<xs,xs><x0,x0>(xs1, xs2)
) where
{
#impltmp
z2forcmp$fcmp<x0,x0> = g_cmp<x0>
}(*where*)//end-of-[gseq_cmp/z2forcmp]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_print(xs) =
let
//
val () =
gseq_print$beg<xs><x0>()
//
val () =
(
  gseq_iforeach<xs><x0>(xs)
) where
{
//
#impltmp
iforeach$work<x0>
  (i0, x0) =
(
  g_print<x0>(x0)
) where
{
val () =
if
(i0 > 0)
then gseq_print$sep<xs><x0>()
} (* where *)
//
} (* where *)
//
val () =
gseq_print$end<xs><x0>((*void*))
//
end(*let*)//end-of(gseq_print(xs))

(* ****** ****** *)
#impltmp
<xs><x0>
gseq_print$beg() = strn_print("(")
#impltmp
<xs><x0>
gseq_print$end() = strn_print(")")
#impltmp
<xs><x0>
gseq_print$sep() = strn_print(";")
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_length(xs) =
(
gseq_foldl
<xs><x0><r0>(xs, 0)
) where
{
//
#typedef r0 = nint
//
#impltmp
foldl$fopr<x0><r0>(r0, _) = succ(r0)
//
}(*where*)//end-of(gseq_length/foldl)

(* ****** ****** *)
//
#impltmp
<xs>
<x0><r0>
gseq_foldl
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_foreach<xs><x0>(xs)
) where
{
#impltmp
foreach$work<x0>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in//let
//
$UN.p2tr_set<r0>
  (p0, foldl$fopr<x0><r0>(r0, x0))
//
end // end of [foreach$work]
}
//
}(*where*)//end-of-[gseq_foldl/foreach]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_exists
  (xs) = let
//
  #impltmp
  forall$test<x0>(x0) =
  not(exists$test<x0>(x0))
//
in
  if
  gseq_forall
  <xs><x0>(xs)
  then false else true endif
end(*let*)//end-of-[gseq_exists/forall]
//
(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
gseq_forall
  (xs) =
( loop(xs) ) where
{
fun
loop(xs: xs): bool =
if
gseq_nilq
<xs><x0>(xs)
then true else
let
var xs = xs
val x0 =
gseq_uncons_raw<xs><x0>(xs)
in
if
forall$test<x0>(x0)
  then loop(xs) else false
// end of [if]
end // end of [else]
} (* end of [gseq_forall/uncons] *)
*)
//
#impltmp
<xs><x0>
gseq_forall
  (xs) =
strm_vt_forall0<x0>
(gseq_strmize<xs><x0>(xs)) where
{
  #impltmp
  forall0$test<x0> = forall$test<x0>
}(*where*)//end-of[gseq_forall/strmize]
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_foreach(xs) =
let
val
test =
gseq_forall<xs><x0>(xs) where
{
#impltmp
forall$test<x0>(x0) =
let
val () =
foreach$work<x0>(x0) in true end
} (*where*) // end of [ val(test) ]
in//let
  // nothing
end // end-of-[gseq_foreach/forall(xs)]

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_memberq
  (xs, x0) =
(
gseq_exists<xs><x0>(xs)) where
{
//
#impltmp
exists$test<x0>(x1) = g_equal<x0>(x0, x1)
//
}(*where*)//end-of-[gseq_memberq(xs,x0)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_search
  (xs) =
(
case+ opt of
| ~
optn_vt_nil() =>
gseq_search$exn
<xs><x0>(  xs  )//cont
| ~
optn_vt_cons(x0) => x0) where
{
val
opt = gseq_search_opt<xs><x0>(xs)
}(*where*)//end-of-[ gseq_search(xs) ]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rsearch
  (xs) =
(
case+ opt of
| ~
optn_vt_nil() =>
gseq_rsearch$exn
<xs><x0>(  xs  )//cont
| ~
optn_vt_cons(x0) => x0) where
{
val
opt = gseq_rsearch_opt<xs><x0>(xs)
}(*where*)//end-of-[gseq_rsearch(xs) ]
//
#impltmp
<xs><x0>
gseq_search$exn
  ( xs ) = $raise NotFoundExn((*0*))
#impltmp
<xs><x0>
gseq_rsearch$exn
  ( xs ) = $raise NotFoundExn((*0*))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_search_opt
  ( xs ) =
let
//
val p0 = $addr(r0)
//
val
btf =
gseq_forall<xs><x0>(xs)
where
{
#impltmp
forall$test<x0>(x0) =
(
if
search$test<x0>(x0)
then
let
val () =
$UN.p2tr_set<res>
( p0
, optn_vt_cons(x0))
in false end else (true) ) }
//(*where*)//end of [val(btf)]
//
in
let
val res =
$UN.p2tr_get<res>(p0) in res end
end where // end-of-[let]
{
//
#vwtpdef res = optn_vt(x0)
//
 var r0: res = optn_vt_nil((*void*))
//
}(*where*)//end-of-[gseq_search_opt(xs)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rsearch_opt
  ( xs ) =
let
//
val p0 = $addr(r0)
//
val
btf =
gseq_rforall<xs><x0>(xs)
where
{
#impltmp
rforall$test<x0>(x0) =
(
if
rsearch$test<x0>(x0)
then
let
val () =
$UN.p2tr_set<res>
( p0
, optn_vt_cons(x0))
in false end else (true) )
}(*where*)//end of [val(btf)]
//
in
let
val res =
$UN.p2tr_get<res>(p0) in res end
end where // end-of-[let]
{
//
#vwtpdef res = optn_vt(x0)
//
var r0: res = optn_vt_nil((*void*))
//
}(*where*)//end-of-[gseq_rsearch_opt]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_get_at
  (xs, i0) =
(
case+ opt of
| ~
optn_vt_nil() =>
gseq_get_at$exn
<xs><x0>(xs, i0)//cont
| ~
optn_vt_cons(x0) => x0) where
{
val
opt = gseq_get_at_opt<xs><x0>(xs, i0)
}(*where*)//end-of-[gseq_get_at(xs,i0)]
//
#impltmp
<xs><x0>
gseq_get_at$exn
  (xs, i0) = $raise SubscriptExn((*0*))
//
(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
gseq_fset_at
  (xs, i0, x0) =
let
  val xs =
  gseq_strmize<xs><x0>(xs)
in
  gseq_make0_lstrm
  (strm_vt_fset0_at<x0>(xs, i0, x0))
end(*let*)//end(gseq_fset_at(xs,i0,x0))
*)
//
#impltmp
<xs><x0>
gseq_fset_at
  (xs, i0, x0) =
(
case+ opt of
| ~
optn_vt_nil() =>
gseq_fset_at$exn
<xs><x0>(xs, i0, x0)
| ~
optn_vt_cons(xs) => xs) where
{
val opt =
gseq_fset_at_opt<xs><x0>(xs, i0, x0)
} (*where*)//end of [gseq_fset_at(...)]
//
#impltmp
<xs><x0>
gseq_fset_at$exn
  (xs, i0, x0) = $raise SubscriptExn()
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_get_at_opt
  (xs, i0) =
let
//
val p0 = $addr(r0)
//
val
btf =
gseq_iforall<xs><x0>(xs)
where
{
#impltmp
iforall$test<x0>(i1, x0) =
if
(i1 < i0)
then true else
let
val () =
$UN.p2tr_set<res>
( p0
, optn_vt_cons(x0)) in false
end
}(*where*)//end-of-[val(btf)]
//
in
let
  val
  res =
  $UN.p2tr_get<res>(p0) in res
end
end where // end-of-[let]
{
//
#vwtpdef res = optn_vt(x0)//result
//
 var r0: res = optn_vt_nil((*void*))
//
} (*where*) // end of [gseq_get_at_opt]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_listize
  (xs) =
(
gseq_map_llist<xs><x0><x0>(xs)
) where
{
  #impltmp map$fopr<x0><x0>(x0) = x0
}
(* ****** ****** *)
//
(*
HX-2020-11-23:
This is not very useful!
HX-2022-06-15:
This seems to be working!
*)
//
#impltmp
<xs><x0>
gseq_strmize
  (xs) =
( auxseq(xs) ) where
{
fun
auxseq
(xs: xs): strm_vt(x0) =
  $llazy
(
if
gseq_nilq
<xs><x0>(xs)
then strmcon_vt_nil()
else let
val x0 =
gseq_head_raw<xs><x0>(xs)
val xs =
gseq_tail_raw<xs><x0>(xs)
in//let
strmcon_vt_cons(x0, auxseq(xs))
endlet // end of [else]
)(*llazy*)//end-of-[auxseq]
}(*where*)//end-of(gseq_strmize(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rlistize(xs) =
(
gseq_map_rllist<xs><x0><x0>(xs)
) where
{
#impltmp map$fopr<x0><x0>(x0) = x0
}(*where*)//end-of(gseq_rlistize(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rstrmize(xs) =
(
list_vt_strmize0<x0>
(gseq_rlistize<xs><x0>(xs)))
(*end-of(gseq_rstrmize(xs))*)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_range_lt
(  s1, f2  ) =
gseq_make0_lstrm<xs><x0>
(strm_vt_range_lt<x0>(s1, f2))
//
#impltmp
<xs><x0>
gseq_range_lte
(  s1, f2  ) =
gseq_make0_lstrm<xs><x0>
(strm_vt_range_lte<x0>(s1, f2))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_make_list
  ( xx ) = let
//
val xx =
list_rcopy_vt<x0>(xx)
//
in
gseq_rmake0_llist<xs><x0>(xx)
end // end of [gseq_make_list(xx)]
//
#impltmp
<xs><x0>
gseq_make0_llist(xx) =
let
//
val xx =
list_vt_reverse0<x0>(xx)
//
in
  gseq_rmake0_llist<xs><x0>(xx)
end // end of [gseq_make0_llist(xx)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rmake_list(xx) =
let
  val xx =
  list_copy_vt<x0>(xx)
in
gseq_rmake0_llist<xs><x0>(xx)
end // end of [gseq_rmake_list(xx)]
//
#impltmp
<xs><x0>
gseq_rmake0_llist
  ( xx ) = let
//
fun
loop
( xx
: list_vt(x0), xs: xs): xs =
(
case+ xx of
| ~
list_vt_nil() => xs
| ~
list_vt_cons(x0, xx) =>
loop
(xx, gseq_cons<xs><x0>(x0, xs))
)
in
(
  loop(xx, gseq_nil<xs><x0>()) )
endlet//end-of-[gseq_rmake0_llist(xs)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_make_strm
  ( xx ) =
(
  gseq_make0_lstrm<xs><x0>(xs)
) where
{
  val xs = strm_strmize<x0>(xx)
}(*where*)//end-of-(gseq_make_strm(xx))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_make0_lstrm
  (xx) =
let
  val xs =
  strm_vt_rlistize0<x0>(xx)
in//let
  gseq_rmake0_llist<xs><x0>(xs)
end(*let*)//end-(gseq_make0_lstrm(xx))
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0>(*tmp*)
<n0>(*tmp*)
gseq_tabulate
  ( n0 ) =
(
 gseq_make0_lstrm<xs><x0>
 (strm_vt_tabulate<x0><n0>( n0 ))
) // end-of-[gseq_vt_tabulate(n0)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
<ys><y0>
gseq_map(xs) =
glseq_make0_lstrm
<  ys  ><  y0  >
(gseq_map_lstrm<xs><x0><y0>( xs ))
//
#impltmp
{xs:t0}
{x0:t0}
{y0:t0}
gseq_map
<xs><x0>
<list(y0)><y0> = gseq_map_list<xs><x0><y0>
//
#impltmp
{xs:t0}
{x0:t0}
{y0:vt}
gseq_map
<xs><x0>
<list_vt(y0)><y0> = gseq_map_llist<xs><x0><y0>
#impltmp
{xs:t0}
{x0:t0}
{y0:vt}
gseq_map
<xs><x0>
<strm_vt(y0)><y0> = gseq_map_lstrm<xs><x0><y0>
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_scale(xs, x0) =
(
gseq_map
<xs><x0><xs><x0>(xs)) where
{
  #impltmp
  map$fopr
  <x0><x0>(x1) = g_mul<x0>(x0, x1) }
//(*where*)//end-of-[gseq_scale(...)]
//
#impltmp
<xs><x0>
gseq_shift(xs, x0) =
(
gseq_map
<xs><x0><xs><x0>(xs)) where
{
  #impltmp
  map$fopr
  <x0><x0>(x1) = g_add<x0>(x1, x0) }
//(*where*)//end-of-[gseq_shift(...)]
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
gseq_map_list
  (xs) =
list_vt2t
(gseq_map_llist<xs><x0><y0>(xs))
#impltmp
<xs>
<x0><y0>
gseq_map_rlist
  (xs) =
list_vt2t
(gseq_map_rllist<xs><x0><y0>(xs))
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
gseq_map_llist
  (xs) = let
//
#vwtpdef
yy = list_vt(y0)
//
#typedef r0 = p2tr(yy)
//
#impltmp
foldl$fopr
<x0><r0>(p0, x0) =
let
//
val y0 =
map$fopr<x0><y0>(x0)
val r1 = 
list_vt_cons(y0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<yy>
( p0
, $UN.castlin01(r1)); (p1)
end // foldl$fopr
//
var r0: yy
val pz =
gseq_foldl
<xs><x0><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<yy>
( pz
, list_vt_nil()); $UN.castlin01(r0)
end//end of [gseq_map_llist/foldl(...)]
//
(* ****** ****** *)

#impltmp
<xs><x0><y0>
gseq_map_lstrm(xs) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in(*in-of-let*)
(
strm_vt_map0<x0><y0>(xs)
) where
{
#impltmp
map0$fopr
<x0><y0> = map$fopr<x0><y0>}//where
end//end-of(gseq_map_lstrm/strmize(...))

(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
gseq_map_rllist
  (xs) = let
//
#vwtpdef
r0 = list_vt(y0)
//
in//let
//
gseq_foldl
<xs><x0><r0>
(xs, list_vt_nil()) where
{
#impltmp
foldl$fopr
< x0><r0 >
( r0, x0 ) =
list_vt_cons
(map$fopr<x0><y0>(x0), r0)}//where
//
end // end-of(gseq_map_rllist/foldl(...)
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
gseq_mapopt_list
  (xs) =
list_vt2t
(gseq_mapopt_llist<xs><x0><y0>(xs))
#impltmp
<xs>
<x0><y0>
gseq_mapopt_rlist
  (xs) =
list_vt2t
(gseq_mapopt_rllist<xs><x0><y0>(xs))
//
#impltmp
<xs>
<x0><y0>
gseq_mapopt_llist(xs) =
strm_vt_listize0
(gseq_mapopt_lstrm<xs><x0><y0>(xs))
//
#impltmp
<xs><x0><y0>
gseq_mapopt_lstrm(xs) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in(*in-of-let*)
(
strm_vt_mapopt0<x0><y0>(xs)
) where
{
#impltmp
map0$fopr
<x0><y0> = map$fopr<x0><y0>
#impltmp
filter0$test<x0> = filter$test<x0> }
end // end-of(impltmp)
//end-(gseq_mapopt_lstrm/strmize(...))
//
#impltmp
<xs><x0><y0>
gseq_mapopt_rllist(xs) =
strm_vt_rlistize0
(
  gseq_mapopt_lstrm<xs><x0><y0>(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_copy_list
  (xs) =
list_vt2t
(
gseq_copy_llist<xs><x0>(xs))
//
#impltmp
<xs><x0>
gseq_copy_llist(xs) =
(
  gseq_map_llist
  <xs><x0><x0>(xs)) where
{
  #impltmp
  map$fopr<x0><x0>( x0 ) = x0 }
//
#impltmp
<xs><x0>
gseq_copy_rllist(xs) =
(
  gseq_map_rllist
  <xs><x0><x0>(xs)) where
{
  #impltmp
  map$fopr<x0><x0>( x0 ) = x0 }
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_filter
(   xs   ) =
glseq_make0_lstrm
<  xs  ><  x0  >
(gseq_filter_lstrm<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_filter_llist
  (xs) = let
//
#vwtpdef
xx = list_vt(x0)
//
#typedef r0 = p2tr(xx)
//
#impltmp
foldl$fopr
<x0><r0>
(p0, x0) =
if
filter$test<x0>(x0)
then let
//
val r1 = 
list_vt_cons(x0, _ )
val p1 = $addr(r1.1)
//
in//let
$UN.p2tr_set<xx>
(p0, $UN.castlin01(r1)); (p1)
endlet // then
else (p0) // end of [foldl$fopr]
//
var r0: xx
val pz =
gseq_foldl<xs><x0><r0>(xs, $addr(r0))
//
in//let
$UN.p2tr_set<xx>
(pz, list_vt_nil()); $UN.castlin01(r0)
endlet//end-of-[gseq_filter_llist/foldl]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_filter_lstrm
  (xs) =
(
strm_vt_filter0
(gseq_strmize<xs><x0>(xs))
) where
{
#impltmp
filter0$test<x0> = filter$test<x0>
}(*where*)//end-of[gseq_filter_lstrm(xs)]

(* ****** ****** *)
#impltmp
<xs><x0>
gseq_filter_rllist
  (xs) = let
//
#vwtpdef
r0 = list_vt(x0)
//
in//let
//
gseq_foldl
<xs><x0><r0>
(xs, list_vt_nil()) where
{
#impltmp
foldl$fopr
< x0><r0 >
( r0, x0 ) =
if
filter$test<x0>(x0)
then
list_vt_cons(x0, r0) else (r0)
}
//
end//end-of(gseq_filter_rllist/foldl(xs))

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_drop
  (xs, n0) =
(
gseq_idropif
< xs >< x0 >(xs)) where
{
#impltmp
idropif$test<x0>(i0, x0) = (i0 < n0)
} (*where*)//end-of(gseq_drop/idropif(...))
//
#impltmp
<xs><x0>
gseq_dropif
  ( xs ) =
(
gseq_idropif
< xs >< x0 >(xs)) where
{
#impltmp
idropif$test<x0>(i0,x0) = dropif$test(x0)
}(*where*)//end-of(gseq_dropif/idropif(...))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_take
  (xs, n0) =
(
gseq_itakeif
< xs >< x0 >(xs)) where
{
#impltmp
itakeif$test<x0>(i0, x0) = (i0 < n0)
}(*where*)//end-of(gseq_take(xs,n0)/itakeif)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_takeif
  ( xs ) =
(
gseq_itakeif
< xs >< x0 >(xs)) where
{
#impltmp
itakeif$test<x0>(_, x0) = takeif$test(x0)
}(*where*)//end-of(gseq_takeif/itakeif(...))
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_takeif_llist
  ( xs ) =
(
gseq_itakeif_llist
< xs >< x0 >(  xs  )) where
{
#impltmp
itakeif$test<x0>(_, x0) = takeif$test(x0)
} (*where*)//end-of(gseq_takeif_llist/itakeif)
#impltmp
<xs><x0>
gseq_takeif_lstrm
  ( xs ) =
(
gseq_itakeif_lstrm
< xs >< x0 >(  xs  )) where
{
#impltmp
itakeif$test<x0>(_, x0) = takeif$test(x0)
} (*where*)//end-of(gseq_takeif_lstrm/itakeif)
#impltmp
<xs><x0>
gseq_takeif_rllist
  ( xs ) =
(
gseq_itakeif_rllist
< xs >< x0 >(  xs  )) where
{
#impltmp
itakeif$test<x0>(_, x0) = takeif$test<x0>(x0)
} (*where*)//end-of(gseq_takeif_rllist/itakeif)
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_add(xs) =
(
gseq_map_add
<xs><x0><x0>(xs)
) where
{
#impltmp map$fopr<x0><x0>(x0) = x0
}
//
#impltmp
<xs><x0>
gseq_mul(xs) =
(
gseq_map_mul
<xs><x0><x0>(xs)
) where
{
#impltmp map$fopr<x0><x0>(x0) = x0
}
//
(* ****** ****** *)
//
#impltmp
<xs>(*tmp*)
gseq_conj(xs) =
(
gseq_map_conj<xs><x0>(xs)
) where
{
#typedef x0 = bool
#impltmp map$fopr<x0><x0>(x0) = x0
}
//
#impltmp
<xs>(*tmp*)
gseq_disj(xs) =
(
gseq_map_disj<xs><x0>(xs)
) where
{
#typedef x0 = bool
#impltmp map$fopr<x0><x0>(x0) = x0
}
//
(* ****** ****** *)
#impltmp
<x0>
gseq_add$nil = g_0<x0> // add-unit
#impltmp
<x0>
gseq_mul$nil = g_1<x0> // mul-unit
(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
gseq_map_add(xs) =
let
//
#impltmp
foldl$fopr
<x0><y0>
(r0, x0) =
g_add<y0>
(r0, map$fopr<x0><y0>(x0))
//
in//let
gseq_foldl
<xs><x0><y0>(xs, gseq_add$nil<y0>())
endlet//end-of-[gseq_map_add(xs)/foldl]
//
(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
gseq_map_mul(xs) =
let
//
#impltmp
foldl$fopr
<x0><y0>
(r0, x0) =
g_mul<y0>
(r0, map$fopr<x0><y0>(x0))
//
in//let
gseq_foldl
<xs><x0><y0>(xs, gseq_mul$nil<y0>())
endlet//end-of-[gseq_map_mul(xs)/foldl]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_map_conj(xs) =
let
//
#typedef y0 = bool
//
in//let
gseq_forall
< xs >< x0 >(xs) where
{
#impltmp
forall$test
< x0 >< y0 > = map$fopr<x0><y0>
//
} (*where*) // [gseq_forall(xs)]
endlet//end-of-[gseq_map_conj/forall]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_map_disj(xs) =
let
//
#typedef y0 = bool
//
in//let
gseq_exists
< xs >< x0 >(xs) where
{
#impltmp
exists$test
< x0 >< y0 > = map$fopr<x0><y0>
//
} (*where*) // [gseq_exists(xs)]
endlet//end-of-[gseq_map_disj/forall]
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_max(xs) =
gseq_max_ini
< xs >< x0 >
( xs
, gseq_max$nil<x0>((*ini*)))
#impltmp
<xs><x0>
gseq_min(xs) =
gseq_min_ini
< xs >< x0 >
( xs
, gseq_min$nil<x0>((*ini*)))
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_max_exn
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then
$raise SubscriptExn()
else
gseq_max_ini
( gseq_tail_raw<xs><x0>(xs)
, gseq_head_raw<xs><x0>(xs))
endif // end-of-( if )
) (*if*) // end of [gseq_max_exn(xs)]
//
#impltmp
<xs><x0>
gseq_min_exn
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then
$raise SubscriptExn()
else
gseq_min_ini
( gseq_tail_raw<xs><x0>(xs)
, gseq_head_raw<xs><x0>(xs))
endif // end-of-( if )
) (*if*) // end of [gseq_min_exn(xs)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_max_opt
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then
optn_vt_nil((*void*))
else
optn_vt_cons
(
gseq_max_ini
( gseq_tail_raw<xs><x0>(xs)
, gseq_head_raw<xs><x0>(xs)))
) (*if*) // end of [gseq_max_opt(xs)]
//
#impltmp
<xs><x0>
gseq_min_opt
  (xs) =
(
if
gseq_nilq<xs><x0>(xs)
then
optn_vt_nil((*void*))
else
optn_vt_cons
(
gseq_min_ini
( gseq_tail_raw<xs><x0>(xs)
, gseq_head_raw<xs><x0>(xs))
)
endif // end-of-( if )
) (*if*) // end of [gseq_min_opt(xs)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_max_ini
(xs, x0) = let
//
#typedef r0 = x0
//
#impltmp
foldl$fopr
<x0><r0>
(r0, x0) = g_max<x0>(r0, x0)
//
in
  gseq_foldl<xs><x0><r0>(xs, x0)
end//end-of-[gseq_max_ini/foldl(...)]
//
#impltmp
<xs><x0>
gseq_min_ini
(xs, x0) = let
//
#typedef r0 = x0
//
#impltmp
foldl$fopr
<x0><r0>
(r0, x0) = g_min<x0>(r0, x0)
//
in
(
 gseq_foldl<xs><x0><r0>(xs, x0))
end//end-of-[gseq_min_ini/foldl(...)]
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_sortedq(xs) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in//let
(
  strm_vt_sortedq0<x0>(  xs  )  )
end(*let*) // end-[gseq_sortedq(...)]

(* ****** ****** *)

#impltmp
<xs>
<x0><r0>
gseq_foldr
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_rforeach<xs><x0>(xs)
) where
{
#impltmp
rforeach$work<x0>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
  (p0, foldr$fopr<x0><r0>(x0, r0))
//
end // end of [rforeach$work]
}
//
}(*where*)//end(gseq_foldr/rforeach)

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rexists
  (xs) = let
//
  #impltmp
  rforall$test<x0>(x0) =
  not(rexists$test<x0>(x0))
//
in
(
if
gseq_rforall
<xs><x0>(xs) then false else true)
endlet // end-of-(let)
// end of [gseq_rexists(xs)/rforall]
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_rforall(xs) =
let
val xs =
gseq_rlistize<xs><x0>(xs)
in//let
(
  list_vt_forall0<x0>(xs)
) where
{
#impltmp
forall0$test<x0>
(  x0  ) = rforall$test<x0>(x0)
}
endlet// end of
// [gseq_rforall(xs)/list_vt_forall]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_rforeach(xs) =
let
val
test =
gseq_rforall<xs><x0>(xs) where
{
#impltmp
rforall$test<x0>(x0) =
let
val () =
rforeach$work<x0>(x0) in true end
}
in//let
  // nothing
endlet//end(gseq_rforeach/rforall)

(* ****** ****** *)
//
(*
(*
HX-2022-06-15:
Using [gseq_cons] should
be avoided as it enforces
the list-like sequentiality!
*)
#impltmp
<xs><x0>
gseq_append
(xs1, xs2) =
(
gseq_foldr
<xs><x0><r0>(xs1, xs2)
) where
{
//
#typedef r0 = xs
//
#impltmp
foldr$fopr
<x0><r0>(x0, r0) =
gseq_cons<xs><x0>(x0, r0)
}(*whr*)//end(gseq_append/foldr)
*)
//
#impltmp
<xs><x0>
gseq_append
(xs1, xs2) = 
gseq_make0_lstrm<xs><x0>
(
gseq_append_lstrm<xs><x0>(xs1,xs2))
//
(* ****** ****** *)
//
#impltmp
<xz><xs><x0>
gseq_concat(xss) =
gseq_make0_lstrm<xs><x0>
(
gseq_concat_lstrm<xz><xs><x0>(xss))
//
(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
gseq_reverse(xs) =
gseq_rappend<xs><x0>
(xs, gseq_nil<xs><x0>())
*)
//
#impltmp
<xs><x0>
gseq_reverse(xs) =
gseq_make0_lstrm<xs><x0>
(gseq_rstrmize<xs><x0>(xs))
(*end-of-(gseq_reverse(xs)*)
//
(* ****** ****** *)
//
(*
(*
HX-2022-06-15:
Using [gseq_cons] should
be avoided as it enforces
the list-like sequentiality!
*)
#impltmp
<xs><x0>
gseq_rappend(xs1, xs2) =
(
gseq_foldl<xs><x0><r0>(xs1, xs2)
) where
{
//
#typedef r0 = xs
//
#impltmp
foldl$fopr
<x0><xs>(r0, x0) =
let
val r0 =
gseq_cons<xs><x0>(x0, r0) in r0
end(*let*)//end-of-(foldl$fopr)
}(*where*)//end-of-(gseq_rappend)
*)
//
#impltmp
<xs><x0>
gseq_rappend
  (xs1, xs2) =
gseq_make0_lstrm<xs><x0>
(
gseq_rappend_lstrm<xs><x0>(xs1,xs2))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_append_lstrm
  (xs1, xs2) = let
//
val
xs1 =
gseq_strmize<xs><x0>(xs1)
val
xs2 =
gseq_strmize<xs><x0>(xs2)
//
in
(
  strm_vt_append0<x0>(xs1, xs2))
end // end-of [gseq_append_lstrm(...)]
//
(* ****** ****** *)
//
#impltmp
<cz>(*tmp*)
gseq_concat_lstrn
  (css) = let
//
#typedef c0 = cgtz
#typedef cs = strn
//
val css =
gseq_strmize<cz><cs>(css)
//
in//let
strn_vt_make0_lstrm<>
(strm_vt_gconcat0<cs><c0>(css))
end // end of [gseq_concat_lstrn(...)]
//
(* ****** ****** *)
//
#impltmp
<xz><xs><x0>
gseq_concat_lstrm
  (xss) = let
//
#vwtpdef
ys = strm_vt(x0)
//
val
xss =
let
#impltmp
map$fopr<xs><ys> =
gseq_strmize<xs><x0>
in//let
gseq_map_lstrm<xz><xs>(xss)
end(*let*)
//
in
(
  strm_vt_concat0<x0>(xss)  )
end // end of [gseq_concat_lstrm(...)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_rappend_lstrm
  (xs1, xs2) = let
//
val
xs2 =
gseq_strmize<xs><x0>(xs2)
val
xs1 =
gseq_rstrmize<xs><x0>(xs1)
//
in//let
  strm_vt_append0<x0>(xs1, xs2)
end // end-of-[gseq_rappend_lstrm(...)]
//
(* ****** ****** *)
//
(*
//HX-2022-06-13:
//[xs1] is a prefix of [xs2]
*)
#impltmp
<xs><x0>
gseq_prefixq
( xs1, xs2 ) =
(
strm_vt_prefixq0(xs1, xs2)
) where
{
val
xs1 = gseq_strmize<xs><x0>(xs1)
and
xs2 = gseq_strmize<xs><x0>(xs2) }
//(*where*) // end of [gseq_prefixq]
//
(* ****** ****** *)
//
(*
//HX-2022-06-13:
//[xs1] is a suffix of [xs2]
*)
#impltmp
<xs><x0>
gseq_suffixq
( xs1, xs2 ) =
(
list_vt_suffixq0(xs1, xs2)
) where
{
val
xs1 = gseq_listize<xs><x0>(xs1)
and
xs2 = gseq_listize<xs><x0>(xs2)
} (*where*) // end of [gseq_suffixq]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_group_lstrm
  (  xs  ) =
(
(
strm_vt_map0<r0>(xz)
) where
{
#impltmp
map0$fopr<r0><xs> =
gseq_make0_llist<xs><x0>
}
) where
{
//
#vwtpdef
r0 = list_vt(x0)
//
val xz =
gseq_group_lstrm_llist<xs><x0>(xs)
}(*where*)// end of [gseq_group_lstrm]
//
#impltmp
<xs><x0>
gseq_group_lstrm_llist
  (  xs  ) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in//let
(
strm_vt_group0_llist<x0>(xs)
) where
{ #impltmp
  group0$test<x0> = group$test<x0> }
end(*let*)//end-of-[gseq_group_lstrm_llist]
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_idropif
  ( xs ) =
(
loop(xs, 0)) where
{
//
fnx
loop
( xs: xs
, i0: nint): xs =
if
gseq_nilq<xs><x0>(xs)
then
(
  gseq_nil<xs><x0>()
)
else
let
val x0 =
gseq_head_raw<xs><x0>(xs)
in//let
if
idropif$test<x0>(i0, x0)
then
(
  loop(xs, succ(i0))) where
{
  val xs =
  gseq_tail_raw<xs><x0>(xs) }
else (xs) // else // end-of-if
endlet (* end of [loop(xs,i0)] *)
//
} (*where*)//end-of-[gseq_idropif(xs)]
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_itakeif
  ( xs ) =
(
gseq_make0_llist<xs><x0>
(gseq_itakeif_llist<xs><x0>(xs))
) (* end of [ gseq_itakeif(xs) ] *)

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_itakeif_llist
  ( xs ) =
(
list_vt_reverse0<x0>
(gseq_itakeif_rllist<xs><x0>(xs))
) (* end of [gseq_itakeif_llist(xs)] *)

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_itakeif_lstrm
  ( xs ) =
(
  strm_vt_itakeif0<x0>
  (gseq_strmize<xs><x0>(xs))
) where
{
#impltmp
itakeif0$test<x0> = itakeif$test<x0>
} (* end of [gseq_itakeif_lstrm(xs)] *)

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_itakeif_rllist
  ( xs ) =
(
loop
(xs, i0, r0)) where
{
//
#vwtpdef
xlst = list_vt(x0)
//
val i0 = 0(*start*)
val r0 = list_vt_nil()
//
fnx
loop
( xs: xs
, i0: nint
, r0: xlst): xlst =
if
gseq_nilq
<xs><x0>(xs)
then (r0) else
let
val x0 =
gseq_head_raw<xs><x0>(xs)
in//let
if
itakeif$test<x0>(i0, x0)
then
(
  loop(xs, i0, r0) ) where
{
  val i0 = succ(i0)
  val xs =
  gseq_tail_raw<xs><x0>(xs)
  val r0 = list_vt_cons(x0, r0) }
else (r0) // else // end-of-(if)
endlet (* end of [loop(xs,i0,r0)] *)
//
} (*where*)//end-of-[gseq_itakeif_rllist]

(* ****** ****** *)

#impltmp
<xs><x0><r0>
gseq_ifoldl
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_iforeach<xs><x0>(xs)
) where
{
#impltmp
iforeach$work<x0>(i0, x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in//let
//
$UN.p2tr_set<r0>
(p0, ifoldl$fopr<x0><r0>(r0, i0, x0))
//
endlet//end-of-[iforeach$work(i0,x0)]
}
//
}(*where*)//end-of-[gseq_ifoldl/iforeach]

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_iexists
  (xs) = let
//
#impltmp
iforall$test<x0>(i0, x0) =
not(iexists$test<x0>(i0, x0))
//
in//let
if
gseq_iforall
<xs><x0>(xs) then false else true
endlet // end-of-( let )
// end of [gseq_rexists/rforall]
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_iforall(xs) =
let
//
var i0: nint = 0
val p0 = $addr(i0)
//
in
//
let
#impltmp
forall$test<x0>(x0) =
(
iforall$test<x0>(i0, x0)
) where
{
val i0 =
$UN.p2tr_get<nint>(p0)
val () =
$UN.p2tr_set<nint>(p0, succ(i0))
}
in
  gseq_forall<xs><x0>(xs)
end (* end of [gseq_forall] *)
//
endlet // end of [gseq_iforall/forall]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_iforeach(xs) =
let
val
test =
gseq_iforall<xs><x0>(xs) where
{
#impltmp
iforall$test<x0>(i0, x0) =
let
val () =
iforeach$work<x0>(i0, x0) in true end
}
in//let
  // nothing
endlet // end of [gseq_iforeach/iforall]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_indexof
  (xs, x0) = let
//
var i0: sint = -1
val p0 = $addr(i0)
//
#impltmp
iforall$test<x0>
  (i1, x1) =
if
g_equal<x0>(x0, x1)
then
let
val () =
$UN.p2tr_set<sint>(p0, i1)
in//let
  false // HX: found
end // then
else true // else // end-of-if
//
in
let
val yn =
gseq_iforall<xs><x0>(xs) in i0
end
end // end of [gseq_indexof/iforall]

(* ****** ****** *)

#impltmp
<xs><x0>
gseq_rindexof
  (xs, x0) = let
//
var i0: sint = -1
val p0 = $addr(i0)
//
#impltmp
iforeach$work<x0>
  (i1, x1) =
if
g_equal<x0>(x0, x1)
then
let
val () =
$UN.p2tr_set<sint>(p0, i1)
end // then // end of [if]
//
in
let
val () =
gseq_iforeach<xs><x0>(xs) in i0
end
end // end of [gseq_rindexof/iforeach]

(* ****** ****** *)
//
#impltmp
<xs><x0>
<ys><y0>
gseq_imap(xs) =
glseq_make0_lstrm
<  ys  ><  y0  >
(gseq_imap_lstrm<xs><x0><y0>( xs ))
//
#impltmp
{xs:t0}
{x0:t0}
{y0:vt}
gseq_imap
<xs><x0>
<list_vt(y0)><y0> = gseq_imap_llist<xs><x0><y0>
#impltmp
{xs:t0}
{x0:t0}
{y0:vt}
gseq_imap
<xs><x0>
<strm_vt(y0)><y0> = gseq_imap_lstrm<xs><x0><y0>
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
gseq_imap_list
  (xs) =
list_vt2t(gseq_imap_llist<xs><x0><y0>(xs))
//
#impltmp
<xs>
<x0><y0>
gseq_imap_rlist
  (xs) =
list_vt2t(gseq_imap_rllist<xs><x0><y0>(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
gseq_imap_llist
  (xs) = let
//
#vwtpdef
yy = list_vt(y0)
//
#typedef r0 = p2tr(yy)
//
#impltmp
ifoldl$fopr
<x0><r0>
(p0, i0, x0) =
let
//
val y0 =
imap$fopr
<x0><y0>(i0, x0)
val r1 = 
list_vt_cons(y0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<yy>
(p0, $UN.castlin01(r1)); (p1)
end // foldl$fopr
//
var r0: yy
val pz =
gseq_ifoldl<xs><x0><r0>(xs, $addr(r0))
//
in//let
$UN.p2tr_set<yy>
(pz, list_vt_nil()); $UN.castlin01(r0)
end // end of [gseq_imap_llist/ifoldl(...)]
//
(* ****** ****** *)

#impltmp
<xs><x0><y0>
gseq_imap_lstrm(xs) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in(*in-of-let*)
(
strm_vt_imap0<x0><y0>(xs)
) where
{
#impltmp
imap0$fopr
< x0><y0 > = imap$fopr<x0><y0>
}
end//end-of-[gseq_imap_lstrm/strmize(xs)]

(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
gseq_imap_rllist
  (xs) = let
//
#vwtpdef
r0 = list_vt(y0)
//
in//let
//
gseq_ifoldl
<xs><x0><r0>
(xs, list_vt_nil()) where
{
#impltmp
ifoldl$fopr
< x0 >< r0 >
( r0, i0, x0 ) =
list_vt_cons
( imap$fopr<x0><y0>(i0, x0), r0 )
// list_vt_cons
}
//
end//end-of-(gseq_imap_rllist/ifoldl(xs))

(* ****** ****** *)

#impltmp
<xs><x0><y0>
gseq_imapopt_lstrm(xs) =
let
val xs =
gseq_strmize<xs><x0>(xs)
in(*in-of-let*)
(
strm_vt_imapopt0<x0><y0>(xs)
) where
{
#impltmp
imap0$fopr
<x0><y0> = imap$fopr<x0><y0>
#impltmp
ifilter0$test<x0> = ifilter$test<x0>
}
end//end-of-(gseq_imap_lstrm/strmize(xs))

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_istrmize
  ( xs ) =
(
  strm_vt_istrmize0
  (gseq_strmize<xs><x0>(xs)) )
// (*app*) // end of [gseq_istrmize(xs)]
//
(* ****** ****** *)
//
(*
HX:
Miscellaneous gseq-operations
*)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_mergesort
  ( xs ) =
(
gseq_make0_llist<xs><x0>(xx)
) where
{
val xx =
gseq_mergesort_llist<xs><x0>(xs) }
//(* end of [ gseq_mergesort(xs) ] *)
//
#impltmp
<xs><x0>
gseq_mergesort_llist
  (xs) =
(
  list_vt_mergesort0<x0>(xx)
) where
{
val xx = gseq_listize<xs><x0>(xs) }
(* end of [gseq_mergesort_llist(xs)] *)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_permutize_lstrm
  (xs) = let
//
#vwtpdef
y0 = list_vt(x0)
//
val y0 =
gseq_listize<xs><x0>(xs)
val ys =
list_vt_permutize0<x0>(y0)
//
in//let
(
  strm_vt_map0<y0><xs>(ys)
) where
{
  #impltmp
  map0$fopr
  <y0><xs> = gseq_make0_llist<xs><x0> }
end(*let*)//end-of-[gseq_permutize_lstrm(xs)]
//
(* ****** ****** *)
//
// For z2-gseq-operations
//
(* ****** ****** *)
//
#impltmp
<xs
,ys><x0>
gseq_z2cmp
  (xs, ys) =
(
gseq_z2forcmp
<xs,ys><x0,x0>(xs, ys)
) where
{
#impltmp
z2forcmp$fcmp<x0,x0> = g_cmp<x0> }
//(*where*)//end-of-[gseq_z2cmp/z2forcmp(...)]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2listize
  (xs, ys) =
let
val
xys =
gseq_z2strmize
<xs,ys><x0,y0>(xs, ys)
in//let
(
  strm_vt_listize0<(x0,y0)>(xys)  )
endlet(*let*)//end-of-[gseq_z2listize(...)]
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2strmize
  (xs, ys) =
let
val xs =
gseq_strmize<xs><x0>(xs)
val ys =
gseq_strmize<ys><y0>(ys)
in//let
strm_vt_z2strmize0<x0,y0>(xs, ys)
endlet(*let*)//end-of-[gseq_z2strmize(...)]
//
(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0><r0>
gseq_z2foldl
(xs, ys, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_z2foreach
  <xs,ys><x0,y0>(xs, ys)
) where
{
#impltmp
z2foreach$work<x0,y0>
  (x0, y0) =
let
//
val r0 = $UN.p2tr_get<r0>(p0)
//
in//let
//
$UN.p2tr_set<r0>
( p0
, z2foldl$fopr<x0,y0><r0>(r0,x0,y0))
//
end // end of [z2foreach$work(x0,y0)]
} (*where*)
//
} (*where*)//end of [gseq_z2foldl/z2foreach]

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_z2forall
  (xs, ys) =
(
strm_vt_z2forall0<x0,y0>
(
  gseq_strmize<xs><x0>(xs)
,
  gseq_strmize<ys><y0>(ys))
) where
{
#impltmp
z2forall0$test
<x0,y0>(*x0,y0*) = z2forall$test<x0,y0>
} (*where*) // end of [gseq_z2forall(...)]

(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2forcmp
  (xs, ys) =
(
strm_vt_z2forcmp0<x0,y0>
(
  gseq_strmize<xs><x0>(xs)
,
  gseq_strmize<ys><y0>(ys))
) where
{
#impltmp
z2forcmp0$fcmp
<x0,y0>(*x0,y0*) = z2forcmp$fcmp<x0,y0>
} (*where*) // end of [gseq_z2forcmp(...)]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2foreach
  (xs, ys) =
let
val
test =
gseq_z2forall<xs,ys><x0,y0>
  (xs, ys) where
{
#impltmp
z2forall$test<x0,y0>(x0, y0) =
let
val () =
z2foreach$work<x0,y0>(x0, y0) in true
end
}
in//let
  // nothing
end // end-of-[gseq_z2foreach/z2forall]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
<zs><z0>
gseq_z2map
  (xs, ys) =
glseq_make0_lstrm
<  zs  ><  z0  >
(
gseq_z2map_lstrm<xs,ys><x0,y0><z0>(xs,ys)
)
//
#impltmp
{xs:t0}
{ys:t0}
{x0:t0}
{y0:t0}
{z0:vt}
gseq_z2map
<xs,ys><x0,y0>
<list_vt(z0)><z0> =
gseq_z2map_llist<xs,ys><x0,y0><z0>(*void*)
//
#impltmp
{xs:t0}
{ys:t0}
{x0:t0}
{y0:t0}
{z0:vt}
gseq_z2map
<xs,ys><x0,y0>
<strm_vt(z0)><z0> =
gseq_z2map_lstrm<xs,ys><x0,y0><z0>(*void*)
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_z2map_llist
  (xs, ys) = let
//
#vwtpdef
zz =
list_vt(z0)
//
#typedef
r0 = p2tr(zz)
//
#impltmp
z2foldl$fopr
<x0,y0><r0>
(p0, x0, y0) =
let
//
val z0 =
z2map$fopr
<x0,y0><z0>(x0, y0)
val r1 = 
list_vt_cons(z0, _ )
val p1 = $addr(r1.1)
//
in//let
$UN.p2tr_set<zz>
(p0, $UN.castlin01(r1)); (p1)
end // z2foldl$fopr
//
var r0: zz
val pz =
gseq_z2foldl
<xs,ys><x0,y0><r0>(xs, ys, $addr(r0))
//
in//let
$UN.p2tr_set<zz>
(pz, list_vt_nil()); $UN.castlin01(r0)
end//end of [gseq_z2map_llist/z2foldl(...)]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_z2map_lstrm
  (xs, ys) =
let
//
val xs =
gseq_strmize<xs><x0>(xs)
val ys =
gseq_strmize<ys><y0>(ys)
//
in//let
let
#impltmp
z2map0$fopr
<x0,y0><z0>(*x0,y0*) =
z2map$fopr<x0,y0><z0>(*x0,y0*)
in//let
strm_vt_z2map0<x0,y0><z0>(xs, ys) end
end(*let*) // end-[gseq_z2map_lstrm(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2iforall
  (xs, ys) =
let
//
val xs =
gseq_strmize<xs><x0>(xs)
val ys =
gseq_strmize<ys><y0>(ys)
//
in//let
(
strm_vt_z2iforall0<x0,y0>(xs, ys)
) where
{
#impltmp
z2iforall0$test
<x0,y0>(*x0,y0*) = z2iforall$test<x0,y0>
} endlet // end-of-[gseq_z2iforall(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2iforcmp
  (xs, ys) =
let
//
val xs =
gseq_strmize<xs><x0>(xs)
val ys =
gseq_strmize<ys><y0>(ys)
//
in//let
(
strm_vt_z2iforcmp0<x0,y0>(xs, ys)
) where
{
#impltmp
z2iforcmp0$fcmp
<x0,y0>(*x0,y0*) = z2iforcmp$fcmp<x0,y0>
} endlet // end-of-[gseq_z2iforcmp(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2iforeach
  (xs, ys) =
let
//
val xs =
gseq_strmize<xs><x0>(xs)
val ys =
gseq_strmize<ys><y0>(ys)
//
in//let
(
strm_vt_z2iforeach0<x0,y0>(xs, ys)
) where
{
#impltmp
z2iforeach0$work
<x0,y0>(*x0,y0*)= z2iforeach$work<x0,y0>
} endlet // end-of-[gseq_z2iforeach(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
<zs><z0>
gseq_z2imap
  (xs, ys) =
glseq_make0_lstrm<zs><z0>
(gseq_z2imap_lstrm<xs,ys><x0,y0><z0>(xs,ys))
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_z2imap_llist
  (xs, ys) =
strm_vt_listize0<z0>
(gseq_z2imap_lstrm<xs,ys><x0,y0><z0>(xs,ys))
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_z2imap_lstrm
  (xs, ys) = let
//
val xs =
gseq_strmize<xs><x0>(xs)
val ys =
gseq_strmize<ys><y0>(ys)
//
in//let
(
strm_vt_z2imap0<x0,y0>(xs, ys)
) where
{
#impltmp
z2imap0$fopr
< x0, y0 >< z0 > = z2imap$fopr<x0,y0><z0> }
end(*let*)//end-[gseq_gseq_z2imap_lstrm(xs,ys)]
//
(* ****** ****** *)
//
// For x2-gseq-operations
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
<zs><z0>
gseq_x2map
  (xs, ys) =
glseq_make0_lstrm
<  zs  ><  z0  >
(
gseq_x2map_lstrm<xs,ys><x0,y0><z0>(xs,ys))
//
#impltmp
{xs:t0}
{ys:t0}
{x0:t0}
{y0:t0}
{z0:vt}
gseq_x2map
<xs,ys><x0,y0>
<list_vt(z0)><z0> =
gseq_x2map_llist<xs,ys><x0,y0><z0>(*void*)
//
#impltmp
{xs:t0}
{ys:t0}
{x0:t0}
{y0:t0}
{z0:vt}
gseq_x2map
<xs,ys><x0,y0>
<strm_vt(z0)><z0> =
gseq_x2map_lstrm<xs,ys><x0,y0><z0>(*void*)
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2map_llist
  (xs, ys) =
(
  strm_vt_listize0<z0>(zs)) where
{
val zs =
gseq_x2map_lstrm<xs,ys><x0,y0><z0>(xs,ys) }
//(*where*)//end-of(gseq_x2map_llist(xs, ys))
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2map_lstrm
  (xs, ys) = let
//
#vwtpdef zs = strm_vt(z0)
//
#impltmp
map$fopr<x0><zs>(x0) =
gseq_map_lstrm<ys><y0><z0>(ys) where
{
//
fun
map$fopr_y0__z0_
 ( y0 : y0 ) : z0 =
 (x2map$fopr<x0,y0>(x0, y0))
//
#impltmp
map$fopr<y0><z0> = map$fopr_y0__z0_ }
//
in//let
(
  strm_vt_concat0<z0>
  (gseq_map_lstrm< xs >< x0 >< zs >(xs)) )
end (*let*)//end-of-[gseq_x2map_lstrm(xs,ys)]

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2mapopt_lstrm
  (xs, ys) = let
//
#vwtpdef zs = strm_vt(z0)
//
#impltmp
map$fopr<x0><zs>(x0) =
(
gseq_mapopt_lstrm<ys><y0><z0>(ys)
) where
{
fun
map$fopr_y0__z0_
 ( y0 : y0 ) : z0 =
 x2map$fopr<x0,y0>(x0, y0)
//
#impltmp
map$fopr<y0><z0> = map$fopr_y0__z0_
#impltmp
filter$test
< y0 >( y0 )=x2filter$test<x0,y0>(x0,y0)
}
//
in//let
(
  strm_vt_concat0<z0>
  (gseq_map_lstrm< xs >< x0 >< zs >(xs)) )
endlet // end-of-[gseq_x2mapopt_lstrm(xs,ys)]

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_x2strmize
  (xs, ys) =
let
#impltmp
x2map$fopr<x0,y0>(x0, y0) = (x0, y0)
in//let
(
  gseq_x2map_lstrm<xs,ys><x0,y0>(xs, ys) )
end(*let*) // end-of-[gseq_x2strmize(xs,ys)]

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_x2foreach
  (xs, ys) =
let
//
fun
foreach$work_x0_
  (x0: x0): void =
(
gseq_foreach<ys><y0>(ys)
) where
{
#impltmp
foreach$work<y0>(y0) =
x2foreach$work<x0,y0>(x0, y0)
}
//
in
(
gseq_foreach<xs><x0>(xs)) where
{
#impltmp
foreach$work<x0> = foreach$work_x0_
} end(*let*)//end-of-[gseq_x2foreach(xs,ys)]

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_x2foreach_row
  (xs, ys) =
let
//
fun
foreach$work_x0_
  (x0: x0): void =
let
//
val () =
x2foreach_row$beg<>()
//
val () =
(
gseq_foreach<ys><y0>(ys)
) where
{
#impltmp
foreach$work<y0>(y0) =
x2foreach_row$work<x0,y0>(x0, y0)
}
//
val () = x2foreach_row$end<>()
//
endlet // end-of-[foreach$work_x0_]
//
in//let
gseq_foreach<xs><x0>(xs) where
{
#impltmp
foreach$work<x0> = foreach$work_x0_
} endlet // end-of-[gseq_x2foreach_row(xs,ys)]

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_x2foreach_col
  (xs, ys) =
let
//
#impltmp
x2foreach_row$beg<>() =
x2foreach_col$beg<>()
//
#impltmp
x2foreach_row$end<>() =
x2foreach_col$end<>()
//
#impltmp
x2foreach_row$work<y0,x0>(y0, x0) =
x2foreach_col$work<x0,y0>(x0, y0)
//
in//let
  gseq_x2foreach_row<ys,xs><y0,x0>(ys, xs)
end(*let*)//end-of-[gseq_x2foreach_col(xs,ys)]

(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
<zs><z0>
gseq_x2imap
  (xs, ys) =
glseq_make0_lstrm<zs><z0>
(gseq_x2imap_lstrm<xs,ys><x0,y0><z0>(xs,ys))
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2imap_llist
  (xs, ys) =
strm_vt_listize0<z0>
(gseq_x2imap_lstrm<xs,ys><x0,y0><z0>(xs,ys))
//
(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2imap_lstrm
  (xs, ys) =
(
strm_vt_concat0<z0>(zss)
) where
{
//
#vwtpdef zs = strm_vt(z0)
//
val
zss =
let
//
#impltmp
imap$fopr<x0><zs>(i, x0) =
let
#impltmp
imap$fopr
<y0><z0>(j, y0) =
x2imap$fopr<x0,y0>(i,x0,j,y0)
in//let
gseq_imap_lstrm<ys><y0><z0>(ys)
endlet//end-of-[imap$fopr(j,y0)]
//
in
  gseq_imap_lstrm<xs><x0><zs>( xs )
end//let
//
}(*where*) // end-of-[gseq_x2imap_lstrm(xs,ys)]

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2imapopt_lstrm
  (xs, ys) =
(
strm_vt_concat0<z0>(zss)
) where
{
//
#vwtpdef zs = strm_vt(z0)
//
val
zss =
let
//
#impltmp
imap$fopr<x0><zs>(ix, x0) =
let
#impltmp
imap$fopr
<y0><z0>(jy, y0) =
x2imap$fopr<x0,y0>(ix,x0,jy,y0)
#impltmp
ifilter$test<y0>(jy, y0) =
x2ifilter$test<x0,y0>(ix,x0,jy,y0)
in//let
 gseq_imapopt_lstrm<ys><y0><z0>(ys)
endlet // end-of-[imap$fopr(ix,x0)]
//
in//let
(
  gseq_imap_lstrm<xs><x0><zs>(xs) ) end
//
}(*where*)//end-[gseq_x2imapopt_lstrm(xs,ys)]

(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_x2iforeach
  (xs, ys) =
let
//
fun
iforeach$work_x0_
  (ix: nint, x0: x0): void =
let
//
val () =
(
gseq_iforeach<ys><y0>(ys)
) where
{
#impltmp
iforeach$work<y0>(jy, y0) =
x2iforeach$work<x0,y0>(ix,x0,jy,y0)
}
//
endlet // end-of-[iforeach$work_x0_]
//
in//let
//
gseq_iforeach<xs><x0>(xs) where
{
#impltmp
iforeach$work<x0> = iforeach$work_x0_ }
//
end(*let*)//end-of-[gseq_x2iforeach(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_x2iforeach_row
  ( xs, ys ) =
let
//
fun
iforeach$work_x0_
(ix: nint, x0: x0): void =
let
//
val () =
x2iforeach_row$beg<>(ix)
//
val () =
(
gseq_iforeach<ys><y0>(ys)
) where
{
#impltmp
iforeach$work<y0>(jy, y0) =
x2iforeach_row$work<x0,y0>(ix,x0,jy,y0)
}
//
val () = x2iforeach_row$end<>(ix)//closing
//
end // end of [let]
//
in
gseq_iforeach<xs><x0>(xs) where
{
  #impltmp
  iforeach$work<x0> = iforeach$work_x0_ }
//
end(*let*)//end-[gseq_x2iforeach_row(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_x2iforeach_col
  ( xs, ys ) =
let
//
#impltmp
x2iforeach_row$beg<>(i) =
x2iforeach_col$beg<>(i)
//
#impltmp
x2iforeach_row$end<>(i) =
x2iforeach_col$end<>(i)
//
#impltmp
x2iforeach_row$work<y0,x0>(j, y0, i, x0) =
x2iforeach_col$work<x0,y0>(i, x0, j, y0)
//
in//let
gseq_x2iforeach_row<ys,xs><y0,x0>(ys, xs)
end(*let*)//end-[gseq_x2iforeach_col(xs,ys)]
//
(* ****** ****** *)
//
(*
HX-2022-07-01:
Higher-order gseq-functions
*)
//
(* ****** ****** *)
//
// HX: gseq_foldl
//
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_foldl_c2fr
( xs, r0, f0 ) =
(
gseq_foldl
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldl$fopr
<x0><r0>(r0, x0) = f0(r0, x0)
}(*where*)//end-of[gseq_foldl_c2fr(xs,r0,f0)]
(* ****** ****** *)
#impltmp
<xs><x0><r0>
gseq_foldl_f2np
( xs, r0, f0 ) =
(
gseq_foldl
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldl$fopr
<x0><r0>(r0, x0) = f0(r0, x0)
}(*where*)//end-of[gseq_foldl_f2np(xs,r0,f0)]
(* ****** ****** *)
//
// HX: gseq_foldr
//
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_foldr_c2fr
( xs, r0, f0 ) =
(
gseq_foldr
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldr$fopr<x0><r0>(x0,r0) = f0(x0,r0)
}(*where*)//end-of[gseq_foldr_c2fr(xs,r0,f0)]
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_foldr_f2np
( xs, r0, f0 ) =
(
gseq_foldr
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldr$fopr<x0><r0>(x0,r0) = f0(x0,r0)
}(*where*)//end-of[gseq_foldr_f2np(xs,r0,f0)]
(* ****** ****** *)
//
// HX: gseq_exists
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_exists_c1fr
(    xs, f0    ) =
(
gseq_exists<xs><x0>(xs)) where
{
#impltmp exists$test<x0>(x0) = f0(x0)
}(*where*)//end-of[gseq_exists_c1fr(xs,f0)]
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_exists_f1np
(    xs, f0    ) =
(
gseq_exists<xs><x0>(xs)) where
{
#impltmp exists$test<x0>(x0) = f0(x0)
}(*where*)//end-of-[gseq_exists_f1np(xs,f0)]
(* ****** ****** *)
//
// HX: gseq_forall
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_forall_c1fr
(    xs, f0    ) =
(
gseq_forall<xs><x0>(xs)) where
{
#impltmp forall$test<x0>(x0) = f0(x0)
}(*where*)//end-of-[gseq_forall_c1fr(xs,f0)]
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_forall_f1np
(    xs, f0    ) =
(
gseq_forall<xs><x0>(xs)) where
{
#impltmp forall$test<x0>(x0) = f0(x0)}
//(*where*)//end-[gseq_forall_f1np(xs,f0)]
(* ****** ****** *)
//
// HX: gseq_foreach
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_foreach_c1fr
(    xs, f0    ) =
(
gseq_foreach<xs><x0>(xs)) where
{
#impltmp foreach$work<x0>(x0) = f0(x0)}
//(*where*)//end-[gseq_foreach_c1fr(xs,f0)]
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_foreach_f1np
(    xs, f0    ) =
(
gseq_foreach<xs><x0>(xs)) where
{
#impltmp foreach$work<x0>(x0) = f0(x0) }
//(*where*)//end-[gseq_foreach_f1np(xs,f0)]
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_tabulate_c1fr
{n0:i0}
(    n0, f0    ) =
(
gseq_tabulate<xs><x0><n0>(n0)
) where
{
#impltmp
tabulate$fopr<x0><n0>( i0 ) = f0( i0 ) }
//(*where*)//end-[gseq_tabulate_c1fr(n0,f0)]
//
#impltmp
<xs><x0>
gseq_tabulate_f1np
{n0:i0}
(    n0, f0    ) =
(
gseq_tabulate<xs><x0><n0>(n0)) where
{
#impltmp
tabulate$fopr<x0><n0>( i0 ) = f0( i0 ) }
//(*where*)//end-[gseq_tabulate_f1np(n0,f0)]
//
(* ****** ****** *)
//
// HX: gseq_map(seq)
//
(* ****** ****** *)
#impltmp
<xs><x0>
<ys><y0>
gseq_map_c1fr
(    xs, f0    ) =
(
gseq_map
<xs><x0><ys><y0>(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
} (*where*)//end-of-[gseq_map_c1fr(xs,f0)]
(* ****** ****** *)
#impltmp
<xs><x0>
<ys><y0>
gseq_map_f1np
(    xs, f0    ) =
(
gseq_map
<xs><x0><ys><y0>(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
} (*where*)//end-of-[gseq_map_f1np(xs,f0)]
(* ****** ****** *)
//
// HX: gseq_map_list
// HX: gseq_map_llist
//
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_map_c1fr_list
(    xs, f0    ) =
(
gseq_map_list
< xs><x0><y0 >(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
}(*where*)//end[gseq_map_c1fr_list(xs,f0)]
#impltmp
<xs>
<x0><y0>
gseq_map_c1fr_llist
(    xs, f0    ) =
(
gseq_map_llist
< xs><x0><y0 >(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
}(*where*)//end[gseq_map_c1fr_llist(xs,f0)]
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_map_f1np_list
(    xs, f0    ) =
(
gseq_map_list
< xs><x0><y0 >(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
}(*where*)//end[gseq_map_f1np_list(xs,f0)]
#impltmp
<xs>
<x0><y0>
gseq_map_f1np_llist
(    xs, f0    ) =
(
gseq_map_llist
< xs><x0><y0 >(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
}(*where*)//end[gseq_map_f1np_llist(xs,f0)]
(* ****** ****** *)
//
// HX: gseq_map_lstrm
//
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_map_c1fr_lstrm
(    xs, f0    ) =
(
gseq_map_lstrm
< xs><x0><y0 >(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0) }
//(*where*)//end[gseq_map_c1fr_lstrm(xs,f0)]
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_map_f1np_lstrm
(    xs, f0    ) =
(
gseq_map_lstrm
< xs><x0><y0 >(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0) }
//(*where*)//end[gseq_map_f1np_lstrm(xs,f0)]
(* ****** ****** *)
//
// HX: gseq_filter(seq)
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_filter_c1fr
(    xs, f0    ) =
(
gseq_filter<xs><x0>(xs)) where
{
#impltmp filter$test<x0>( x0 ) = f0(x0) }
//(*where*)//end-of[gseq_filter_c1fr(xs,f0)]
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_filter_f1np
(    xs, f0    ) =
(
gseq_filter<xs><x0>(xs)) where
{
#impltmp filter$test<x0>( x0 ) = f0(x0) }
//(*where*)//end-of[gseq_filter_f1np(xs,f0)]
(* ****** ****** *)
//
// HX: gseq_filter_llist
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_filter_c1fr_llist
(    xs, f0    ) =
(
gseq_filter_llist<xs><x0>(xs)) where
{
#impltmp filter$test<x0>( x0 ) = f0(x0) }
//(*where*)//end-[gseq_filter_c1fr_llist(xs,f0)]
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_filter_f1np_llist
(    xs, f0    ) =
(
gseq_filter_llist<xs><x0>(xs)) where
{
#impltmp filter$test<x0>( x0 ) = f0(x0) }
//(*where*)//end-[gseq_filter_f1np_llist(xs,f0)]
(* ****** ****** *)
//
// HX: gseq_filter_lstrm
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_filter_c1fr_lstrm
(    xs, f0    ) =
(
gseq_filter_lstrm<xs><x0>(xs)) where
{
#impltmp filter$test<x0>( x0 ) = f0(x0) }
//(*where*)//end-[gseq_filter_c1fr_lstrm(xs,f0)]
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_filter_f1np_lstrm
(    xs, f0    ) =
(
gseq_filter_lstrm<xs><x0>(xs)) where
{
#impltmp filter$test<x0>( x0 ) = f0(x0) }
//(*where*)//end-[gseq_filter_f1np_lstrm(xs,f0)]
(* ****** ****** *)
//
// HX: gseq_ifoldl
//
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_ifoldl_c3fr
(  xs, r0, f0  ) =
(
gseq_ifoldl<xs><x0><r0>(xs, r0)) where
{
#impltmp
ifoldl$fopr
< x0><r0 >(r0, i0, x0) = f0(r0, i0, x0) }
//(*where*)//end-[gseq_ifoldl_c3fr(xs,r0,f0)]
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_ifoldl_f3np
(  xs, r0, f0  ) =
(
gseq_ifoldl<xs><x0><r0>(xs, r0)) where
{
#impltmp
ifoldl$fopr
< x0><r0 >(r0, i0, x0) = f0(r0, i0, x0) }
//(*where*)//end[gseq_ifoldl_f3np(xs,r0,f0)]
(* ****** ****** *)
//
// HX: gseq_ifoldr
//
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_ifoldr_c3fr
(  xs, r0, f0  ) =
(
gseq_ifoldr<xs><x0><r0>(xs, r0)) where
{
#impltmp
ifoldr$fopr
< x0><r0 >(i0, x0, r0) = f0(i0, x0, r0)
}(*where*)//end[gseq_ifoldr_c3fr(xs,r0,f0)]
(* ****** ****** *)
#impltmp
<xs>
<x0><r0>
gseq_ifoldr_f3np
(  xs, r0, f0  ) =
(
gseq_ifoldr<xs><x0><r0>(xs, r0)) where
{
#impltmp
ifoldr$fopr
< x0><r0 >(i0, x0, r0) = f0(i0, x0, r0)
}(*where*)//end[gseq_ifoldr_f3np(xs,r0,f0)]
(* ****** ****** *)
//
// HX: gseq_iexists
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iexists_c2fr
(    xs, f0    ) =
(
gseq_iexists<xs><x0>(xs)) where
{
#impltmp
iexists$test<x0>(i0, x0) = f0(i0, x0) }
//(*where*)//end[gseq_iexists_c2fr(xs,f0)]
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iexists_f2np
(    xs, f0    ) =
(
gseq_iexists<xs><x0>(xs)) where
{
#impltmp
iexists$test<x0>(i0, x0) = f0(i0, x0) }
//(*where*)//end[gseq_iexists_f2np(xs,f0)]
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iforall_c2fr
(    xs, f0    ) =
(
gseq_iforall<xs><x0>(xs)) where
{
#impltmp
iforall$test<x0>(i0, x0) = f0(i0, x0) }
//(*where*)//end(gseq_iforall_c2fr(xs,f0))
(* ****** ****** *)
//
// HX: gseq_iforall
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iforall_f2np
(    xs, f0    ) =
(
gseq_iforall<xs><x0>(xs)) where
{
#impltmp
iforall$test<x0>(i0, x0) = f0(i0, x0) }
//(*where*)//end(gseq_iforall_f2np(xs,f0))
(* ****** ****** *)
//
// HX: gseq_iforeach
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iforeach_c2fr
(    xs, f0    ) =
(
gseq_iforeach<xs><x0>(xs)) where
{
#impltmp
iforeach$work<x0>(i0, x0) = f0(i0, x0) }
(*where*)//end(gseq_iforeach_c2fr(xs, f0))
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_iforeach_f2np
(    xs, f0    ) =
(
gseq_iforeach<xs><x0>(xs)) where
{
#impltmp
iforeach$work<x0>(i0, x0) = f0(i0, x0) }
(*where*)//end(gseq_iforeach_f2np(xs, f0))
(* ****** ****** *)
//
// HX: gseq_imap(seq)
//
(* ****** ****** *)
#impltmp
<xs><x0>
<ys><y0>
gseq_imap_c2fr
(    xs, f0    ) =
(
gseq_imap
<xs><x0><ys><y0>(xs)) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = f0(i0, x0)
} (*where*)//end-[gseq_imap_c2fr(xs,f0)]
(* ****** ****** *)
#impltmp
<xs><x0>
<ys><y0>
gseq_imap_f2np
(    xs, f0    ) =
(
gseq_imap
<xs><x0><ys><y0>(xs)) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = f0(i0, x0)
} (*where*)//end-[gseq_imap_f2np(xs,f0)]
(* ****** ****** *)
//
// HX: gseq_imap_llist
//
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_imap_c2fr_llist
(    xs, f0    ) =
(
gseq_imap_llist
<xs>< x0 >< y0 >(xs)) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = f0(i0, x0)
}(*where*)//(gseq_imap_c2fr_llist(xs,f0))
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_imap_f2np_llist
(    xs, f0    ) =
(
gseq_imap_llist
<xs>< x0 >< y0 >(xs)) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_imap_f2np_llist(xs,f0)
(* ****** ****** *)
//
// HX: gseq_imap_lstrm
//
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_imap_c2fr_lstrm
(    xs, f0    ) =
(
gseq_imap_lstrm
<xs>< x0 >< y0 >(xs)) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_imap_c2fr_lstrm(xs,f0)
(* ****** ****** *)
#impltmp
<xs>
<x0><y0>
gseq_imap_f2np_lstrm
(    xs, f0    ) =
(
gseq_imap_lstrm
<xs>< x0 >< y0 >(xs)) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = f0(i0, x0)
} (*where*)//gseq_imap_f2np_lstrm(xs,f0)
(* ****** ****** *)
//
// HX: gseq_z2forall
//
(* ****** ****** *)
#impltmp
<xs,yz>
<x0,y0>
gseq_z2forall_c2fr
(  xs, ys, f0  ) =
(
gseq_z2forall
<xs,yz><x0,y0>(xs,ys)) where
{
#impltmp
z2forall$test<x0,y0>(x0,y0) = f0(x0,y0)
} (*where*)//gseq_z2forall_c2fr(xs,ys,f0)
(* ****** ****** *)
#impltmp
<xs,yz>
<x0,y0>
gseq_z2forall_f2np
(  xs, ys, f0  ) =
(
gseq_z2forall
<xs,yz><x0,y0>(xs,ys)) where
{
#impltmp
z2forall$test<x0,y0>(x0,y0) = f0(x0,y0)
} (*where*)//gseq_z2forall_f2np(xs,ys,f0)
(* ****** ****** *)
//
// HX: gseq_z2forcmp
//
(* ****** ****** *)
#impltmp
<xs,yz>
<x0,y0>
gseq_z2forcmp_c2fr
(  xs, ys, f0  ) =
(
gseq_z2forcmp
<xs,yz><x0,y0>(xs,ys)) where
{
#impltmp
z2forcmp$fcmp<x0,y0>(x0,y0) = f0(x0,y0)
} (*where*)//gseq_z2forcmp_c2fr(xs,ys,f0)
(* ****** ****** *)
#impltmp
<xs,yz>
<x0,y0>
gseq_z2forcmp_f2np
(  xs, ys, f0  ) =
(
gseq_z2forcmp
<xs,yz><x0,y0>(xs,ys)) where
{
#impltmp
z2forcmp$fcmp<x0,y0>(x0,y0) = f0(x0,y0)
} (*where*)//gseq_z2forcmp_f2np(xs,ys,f0)
(* ****** ****** *)
//
// HX: gseq_z2foreach
//
(* ****** ****** *)
#impltmp
<xs,yz>
<x0,y0>
gseq_z2foreach_c2fr
(  xs, ys, f0  ) =
(
gseq_z2foreach
<xs,yz><x0,y0>(xs,ys)) where
{
#impltmp
z2foreach$work<x0,y0>(x0,y0) = f0(x0,y0)
} (*where*)//gseq_z2foreach_c2fr(xs,ys,f0)
(* ****** ****** *)
#impltmp
<xs,yz>
<x0,y0>
gseq_z2foreach_f2np
(  xs, ys, f0  ) =
(
gseq_z2foreach
<xs,yz><x0,y0>(xs,ys)) where
{
#impltmp
z2foreach$work<x0,y0>(x0,y0) = f0(x0,y0)
} (*where*)//gseq_z2foreach_f2np(xs,ys,f0)
(* ****** ****** *)
//
// HX: gseq_z2map(seq)
//
(* ****** ****** *)
#impltmp
<xs, ys>
<x0, y0>
<zs><z0>
gseq_z2map_c2fr
(  xs, ys, f0  ) =
(
gseq_z2map
<xs,ys>
<x0,y0><zs><z0>(xs,ys)) where
{
#impltmp
z2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)
} (*where*)//end-[gseq_z2map_c2fr(xs,ys,f0)]
(* ****** ****** *)
#impltmp
<xs, ys>
<x0, y0>
<zs><z0>
gseq_z2map_f2np
(  xs, ys, f0  ) =
(
gseq_z2map
<xs,ys>
<x0,y0><zs><z0>(xs,ys)) where
{
#impltmp
z2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)
} (*where*)//end-[gseq_z2map_f2np(xs,ys,f0)]
(* ****** ****** *)
//
// HX: gseq_z2map_llist
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_z2map_c2fr_llist
(  xs, ys, f0  ) =
(
gseq_z2map_llist
<xs,ys><x0,y0><z0>(xs,ys)) where
{
#impltmp
z2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)}
(*where*)//end(gseq_z2map_c2fr_llist(xs,ys,f0))
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_z2map_f2np_llist
(  xs, ys, f0  ) =
(
gseq_z2map_llist
<xs,ys><x0,y0><z0>(xs,ys)) where
{
#impltmp
z2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)}
(*where*)//end(gseq_z2map_f2np_llist(xs,ys,f0))
(* ****** ****** *)
//
// HX: gseq_z2map_lstrm
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_z2map_c2fr_lstrm
(  xs, ys, f0  ) =
(
gseq_z2map_lstrm
<xs,ys><x0,y0><z0>(xs,ys)) where
{
#impltmp
z2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)
}(*where*)//end(gseq_z2map_c2fr_lstrm(xs,ys,f0))
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_z2map_f2np_lstrm
(  xs, ys, f0  ) =
(
gseq_z2map_lstrm
<xs,ys><x0,y0><z0>(xs,ys)) where
{
#impltmp
z2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)
}(*where*)//end(gseq_z2map_f2np_lstrm(xs,ys,f0))
(* ****** ****** *)
//
// HX: gseq_z2iforall
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0>
gseq_z2iforall_c3fr
  (xs, ys, f0) =
(
gseq_z2iforall
<xs,ys><x0,y0>(xs,ys)) where
{
#impltmp
z2iforall$test
<    x0,y0    >(i0, x0, y0) = f0(i0, x0, y0)
}(*where*)//end(gseq_z2iforall_c3fr(xs,ys,f0))
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0>
gseq_z2iforall_f3np
  (xs, ys, f0) =
(
gseq_z2iforall
<xs,ys><x0,y0>(xs,ys)) where
{
#impltmp
z2iforall$test
<    x0,y0    >(i0, x0, y0) = f0(i0, x0, y0)
}(*where*)//end(gseq_z2iforall_f3np(xs,ys,f0))
(* ****** ****** *)
//
// HX: gseq_z2iforcmp
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0>
gseq_z2iforcmp_c3fr
  (xs, ys, f0) =
(
gseq_z2iforcmp
<xs,ys><x0,y0>(xs,ys)) where
{
#impltmp
z2iforcmp$fcmp
<    x0,y0    >(i0, x0, y0) = f0(i0, x0, y0)
}(*where*)//end(gseq_z2iforcmp_c3fr(xs,ys,f0))
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0>
gseq_z2iforcmp_f3np
  (xs, ys, f0) =
(
gseq_z2iforcmp
<xs,ys><x0,y0>(xs,ys)) where
{
#impltmp
z2iforcmp$fcmp
<    x0,y0    >(i0, x0, y0) = f0(i0, x0, y0)
}(*where*)//end(gseq_z2iforcmp_f3np(xs,ys,f0))
(* ****** ****** *)
//
// HX: gseq_z2iforeach
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0>
gseq_z2iforeach_c3fr
  (xs, ys, f0) =
(
gseq_z2iforeach
<xs,ys><x0,y0>(xs,ys)) where
{
#impltmp
z2iforeach$work
<    x0,y0    >(i0,x0,y0) = f0(i0,x0,y0) }
//(*where*)//(gseq_z2iforeach_c3fr(xs,ys,f0))
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0>
gseq_z2iforeach_f3np
  (xs, ys, f0) =
(
gseq_z2iforeach
<xs,ys><x0,y0>(xs,ys)) where
{
#impltmp
z2iforeach$work
<    x0,y0    >(i0,x0,y0) = f0(i0,x0,y0) }
//(*where*)//(gseq_z2iforeach_f3np(xs,ys,f0))
(* ****** ****** *)
//
// HX: gseq_z2imap(seq)
//
(* ****** ****** *)
#impltmp
<xs, ys>
<x0, y0>
<zs><z0>
gseq_z2imap_c3fr
(  xs, ys, f0  ) =
(
gseq_z2imap
<xs,ys>
<x0,y0><zs><z0>(xs, ys)) where
{
#impltmp
z2imap$fopr
<x0,y0><z0>(i0, x0 ,y0) = f0(i0, x0 ,y0) }
//(*where*)//end-[gseq_z2imap_c3fr(xs,ys,f0)]
(* ****** ****** *)
#impltmp
<xs, ys>
<x0, y0>
<zs><z0>
gseq_z2imap_f3np
(  xs, ys, f0  ) =
(
gseq_z2imap
<xs,ys>
<x0,y0><zs><z0>(xs, ys)) where
{
#impltmp
z2imap$fopr
<x0,y0><z0>(i0, x0 ,y0) = f0(i0, x0 ,y0) }
//(*where*)//end-[gseq_z2imap_f3np(xs,ys,f0)]
(* ****** ****** *)
//
// HX: gseq_x2foreach
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0>
gseq_x2foreach_c2fr
  (xs, ys, f0) =
(
gseq_x2foreach
<xs,ys><x0,y0>(xs,ys)) where
{
#impltmp
x2foreach$work<x0,y0>(x0, y0) = f0(x0, y0)
}(*where*)//end(gseq_x2foreach_c2fr(xs,ys,f0))
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0>
gseq_x2foreach_f2np
  (xs, ys, f0) =
(
gseq_x2foreach
<xs,ys><x0,y0>(xs,ys)) where
{
#impltmp
x2foreach$work<x0,y0>(x0, y0) = f0(x0, y0)
}(*where*)//end(gseq_x2foreach_f2np(xs,ys,f0))
(* ****** ****** *)
//
// HX: gseq_x2map(seq)
//
(* ****** ****** *)
#impltmp
<xs, ys>
<x0, y0>
<zs><z0>
gseq_x2map_c2fr
(  xs, ys, f0  ) =
(
gseq_x2map
<xs,ys>
<x0,y0><zs><z0>(xs,ys)) where
{
#impltmp
x2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)
}(*where*)//end-(gseq_x2map_c2fr(xs,ys,f0))
(* ****** ****** *)
#impltmp
<xs, ys>
<x0, y0>
<zs><z0>
gseq_x2map_f2np
(  xs, ys, f0  ) =
(
gseq_x2map
<xs,ys>
<x0,y0><zs><z0>(xs,ys)) where
{
#impltmp
x2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)
}(*where*)//end-(gseq_x2map_f2np(xs,ys,f0))
(* ****** ****** *)
//
// HX: gseq_x2map_llist
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2map_c2fr_llist
(  xs, ys, f0  ) =
(
gseq_x2map_llist
<xs,ys><x0,y0><z0>(xs,ys)) where
{
#impltmp
x2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)
}(*where*)//end(gseq_x2map_c2fr_llist(xs,ys,f0))
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2map_f2np_llist
(  xs, ys, f0  ) =
(
gseq_x2map_llist
<xs,ys><x0,y0><z0>(xs,ys)) where
{
#impltmp
x2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)
}(*where*)//end(gseq_x2map_f2np_llist(xs,ys,f0))
(* ****** ****** *)
//
// HX: gseq_x2map_lstrm
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2map_c2fr_lstrm
(  xs, ys, f0  ) =
(
gseq_x2map_lstrm
<xs,ys><x0,y0><z0>(xs,ys)) where
{
#impltmp
x2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)
}(*where*)//end(gseq_x2map_c2fr_lstrm(xs,ys,f0))
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2map_f2np_lstrm
(  xs, ys, f0  ) =
(
gseq_x2map_lstrm
<xs,ys><x0,y0><z0>(xs,ys)) where
{
#impltmp
x2map$fopr<x0,y0><z0>(x0, y0) = f0(x0, y0)
}(*where*)//end(gseq_x2map_f2np_lstrm(xs,ys,f0))
(* ****** ****** *)
//
// HX: gseq_x2iforeach
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0>
gseq_x2iforeach_c4fr
  (xs, ys, f0) =
(
gseq_x2iforeach
<xs,ys><x0,y0>(xs,ys)) where
{
#impltmp
x2iforeach$work
<  x0,y0  >(ix,x0,jy,y0) = f0(ix,x0,jy,y0)
}(*where*)//end(gseq_x2iforeach_c4fr(xs,ys,f0))
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0>
gseq_x2iforeach_f4np
  (xs, ys, f0) =
(
gseq_x2iforeach
<xs,ys><x0,y0>(xs,ys)) where
{
#impltmp
x2iforeach$work
<  x0,y0  >(ix,x0,jy,y0) = f0(ix,x0,jy,y0)
}(*where*)//end(gseq_x2iforeach_f4np(xs,ys,f0))
(* ****** ****** *)
//
// HX: gseq_x2imap(seq)
//
(* ****** ****** *)
#impltmp
<xs, ys>
<x0, y0>
<zs><z0>
gseq_x2imap_c4fr
(  xs, ys, f0  ) =
(
gseq_x2imap
<xs,ys>
<x0,y0><zs><z0>(xs, ys)) where
{
#impltmp
x2imap$fopr
<x0,y0><z0>(ix,x0,jy,y0) = f0(ix,x0,jy,y0)
} (*where*)//end-of-[gseq_x2imap_c4fr(xs,ys,f0)]
(* ****** ****** *)
#impltmp
<xs, ys>
<x0, y0>
<zs><z0>
gseq_x2imap_f4np
(  xs, ys, f0  ) =
(
gseq_x2imap
<xs,ys>
<x0,y0><zs><z0>(xs, ys)) where
{
#impltmp
x2imap$fopr
<x0,y0><z0>(ix,x0,jy,y0) = f0(ix,x0,jy,y0)
} (*where*)//end-of-[gseq_x2imap_f4np(xs,ys,f0)]
(* ****** ****** *)
//
// HX: gseq_x2imap_llist
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2imap_c4fr_llist
(  xs, ys, f0  ) =
(
gseq_x2imap_llist
<xs,ys>
<x0,y0><z0>(xs, ys)) where
{
#impltmp
x2imap$fopr
<x0,y0><z0>(ix,x0,jy,y0) = f0(ix,x0,jy,y0)
} (*where*)//end-of-[gseq_x2imap_c4fr_llist(...)]
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2imap_f4np_llist
(  xs, ys, f0  ) =
(
gseq_x2imap_llist
<xs,ys>
<x0,y0><z0>(xs, ys)) where
{
#impltmp
x2imap$fopr
<x0,y0><z0>(ix,x0,jy,y0) = f0(ix,x0,jy,y0)
} (*where*)//end-of-[gseq_x2imap_f4np_llist(...)]
(* ****** ****** *)
//
// HX: gseq_x2imap_lstrm
//
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2imap_c4fr_lstrm
(  xs, ys, f0  ) =
(
gseq_x2imap_lstrm
<xs,ys>
<x0,y0><z0>(xs, ys)) where
{
#impltmp
x2imap$fopr
<x0,y0><z0>(ix,x0,jy,y0) = f0(ix,x0,jy,y0)
} (*where*)//end-of-[gseq_x2imap_c4fr_lstrm(...)]
(* ****** ****** *)
#impltmp
<xs,ys>
<x0,y0><z0>
gseq_x2imap_f4np_lstrm
(  xs, ys, f0  ) =
(
gseq_x2imap_lstrm
<xs,ys>
<x0,y0><z0>(xs, ys)) where
{
#impltmp
x2imap$fopr
<x0,y0><z0>(ix,x0,jy,y0) = f0(ix,x0,jy,y0)
} (*where*)//end-of-[gseq_x2imap_f4np_lstrm(...)]
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gseq000.dats] *)
