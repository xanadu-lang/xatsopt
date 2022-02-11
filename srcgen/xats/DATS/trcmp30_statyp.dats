(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: July, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/xbasics.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

#staload "./../SATS/trcmp30.sats"

(* ****** ****** *)

implement
trcmp30_sort
  (s2t0) = let
//
(*
val () =
println!
("trcmp30_sort: s2t0 = ", s2t0)
*)
//
in
//
case+ s2t0 of
//
| S2Tid0(sym) => HSTid0(sym)
| S2Tint(int) => HSTint(int)
//
| S2Tfun
  (s2ts, s2t1) =>
  let
  val
  hsts =
  trcmp30_sortlst(s2ts)
  in
  HSTfun
  (hsts, hst1) where
  {
    val
    hst1 = trcmp30_sort(s2t1)
  }
  end // end of [S2Tfun]
//
| _(*rest-of-sort2*) =>
  let
  val
  data =
  $UN.cast{ptr}(s2t0) in HSTnone1(data)
  end
//
end // end of [trcmp30_sort]
//
(* ****** ****** *)

implement
trcmp30_scst
  (s2c0) = let
//
val opt =
the_scstmap_search_opt(s2c0)
//
in
case+ opt of
| ~
Some_vt(htv1) => htv1
| ~
None_vt((*void*)) =>
let
val htv1 =
htcst_make_scst(s2c0)
in
the_scstmap_insert_any(s2c0, htv1); htv1
end
end // end of [trcmp30_scst]

(* ****** ****** *)

implement
trcmp30_sortlst(s2ts) =
list_vt2t
(
list_map<
  sort2><h0srt>(s2ts) where
{
implement
list_map$fopr<
  sort2><h0srt>(s2t) = trcmp30_sort(s2t)
}
) (* end of [trcmp30_sortlst] *)

(* ****** ****** *)

implement
trcmp30_scstlst(s2cs) =
list_vt2t
(
list_map<
  s2cst><htcst>(s2cs) where
{
implement
list_map$fopr<
  s2cst><htcst>(s2c) = trcmp30_scst(s2c)
}
) (* end of [trcmp30_scstlst] *)

(* ****** ****** *)

implement
trcmp30_svar
  (s2v0) = let
//
val opt =
the_svarmap_search_opt(s2v0)
//
in
case+ opt of
| ~
Some_vt(htv1) => htv1
| ~
None_vt((*void*)) =>
let
val htv1 =
htvar_make_svar(s2v0)
in
the_svarmap_insert_any(s2v0, htv1); htv1
end
end // end of [trcmp30_svar]

(* ****** ****** *)

implement
trcmp30_svarlst(s2vs) =
list_vt2t
(
list_map<
  s2var><htvar>(s2vs) where
{
implement
list_map$fopr<
  s2var><htvar>(s2v) = trcmp30_svar(s2v)
}
) (* end of [trcmp30_svarlst] *)

(* ****** ****** *)
//
implement
trcmp30_tqa0(tqa0) =
let
//
val loc0 = tqa0.loc()
val s2vs = tqa0.s2vs()
//
in
let
val
htvs =
trcmp30_svarlst(s2vs)
in
htqarg_make(loc0, htvs) end
end // end of [trcmp30_t2q0]
//
implement
trcmp30_tqas(tqas) =
list_vt2t
(
list_map<tq2arg><htqarg>(tqas)
) where
{
implement
list_map$fopr<
  tq2arg><htqarg>(tqa) = trcmp30_tqa0(tqa)
} (* end of [trcmp30_tqas] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
auxcst
(t2p0: t2ype): h0typ =
let
val-
T2Pcst
(s2c1) = t2p0.node()
val s2t0 = t2p0.sort()
val hst0 = trcmp30_sort(s2t0)
val htc1 = trcmp30_scst(s2c1)
in
h0typ_make_node(hst0, H0Tcst(htc1))
end

fun
auxvar
(t2p0: t2ype): h0typ =
let
val-
T2Pvar
(s2v1) = t2p0.node()
val s2t0 = t2p0.sort()
val hst0 = trcmp30_sort(s2t0)
val htv1 = trcmp30_svar(s2v1)
in
h0typ_make_node(hst0, H0Tvar(htv1))
end

(* ****** ****** *)

fun
auxlft
(t2p0: t2ype): h0typ =
let
val-
T2Plft
(t2p1) = t2p0.node()
val s2t0 = t2p0.sort()
val hst0 = trcmp30_sort(s2t0)
val h0t1 = trcmp30_type(t2p1)
in
h0typ_make_node(hst0, H0Tlft(h0t1))
end // end of [auxlft]

(* ****** ****** *)

fun
auxapp
(t2p0: t2ype): h0typ =
let
val-
T2Papp
( t2f0
, t2ps) = t2p0.node()
val s2t0 = t2p0.sort()
val hst0 = trcmp30_sort(s2t0)
val h0f0 = trcmp30_type(t2f0)
val h0ts = trcmp30_typelst(t2ps)
in
h0typ_make_node(hst0, H0Tapp(h0f0, h0ts))
end // end of [auxapp]

(* ****** ****** *)

fun
auxfun
(t2p0: t2ype): h0typ =
let
val-
T2Pfun
( fc2
, npf
, t2ps, t2p1) = t2p0.node()
//
val s2t0 = t2p0.sort()
val hst0 = trcmp30_sort(s2t0)
//
val
h0ts = trcmp30_typelst(t2ps)
//
val h0t1 = trcmp30_type(t2p1)
//
in
h0typ_make_node
(hst0, H0Tfun(npf, h0ts, h0t1))
end

(* ****** ****** *)

fun
aux_tyext
(t2p0: t2ype): h0typ =
let
//
val-
T2Ptyext
( name
, t2ps) = t2p0.node()
//
val s2t0 = t2p0.sort()
val hst0 = trcmp30_sort(s2t0)
//
val
h0ts = trcmp30_typelst(t2ps)
//
in
h0typ_make_node
( hst0, H0Ttyext(name, h0ts) )
end // end of [aux_tyext]

(* ****** ****** *)

fun
aux_tyrec
(t2p0: t2ype): h0typ =
let
//
val-
T2Ptyrec
( knd
, npf, ltps) = t2p0.node()
//
val s2t0 = t2p0.sort()
val hst0 = trcmp30_sort(s2t0)
//
val
lhts = trcmp30_labtypelst(ltps)
//
in
  h0typ_make_node
  (hst0, H0Ttyrec(knd, npf, lhts))
end // end of [aux_tyrec]

(* ****** ****** *)

in(*in-of-local*)

implement
trcmp30_type
  (t2p0) = let
//
(*
//
val
s2t0 = t2p0.sort()
//
val () =
println!
("trcmp30_type: t2p0 = ", t2p0)
val () =
println!
("trcmp30_type: s2t0 = ", s2t0)
*)
//
(*
//
(*
HX-2021-01-16:
The type should have been
normalized at this point! 
*)
val
t2p0 = t2ype_normize(t2p0)
*)
//
in(*in-of-let*)
//
case+
t2p0.node() of
//
|
T2Pcst _ => auxcst(t2p0)
|
T2Pvar _ => auxvar(t2p0)
//
|
T2Plft _ => auxlft(t2p0)
//
|
T2Papp _ => auxapp(t2p0)
//
|
T2Pfun _ => auxfun(t2p0)
//
|
T2Ptyext _ => aux_tyext(t2p0)
//
|
T2Ptyrec _ => aux_tyrec(t2p0)
//
| _(*rest-of-t2ype*) => let
//
val s2t0 = t2p0.sort()
val hst0 = trcmp30_sort(s2t0)
val data = $UN.cast{ptr}(t2p0)
//
(*
val () =
println!
("trcmp30_type: t2p0 = ", t2p0)
val () =
println!
("trcmp30_type: s2t0 = ", s2t0)
val () =
println!
("trcmp30_type: hst0 = ", hst0)
*)
//
in
h0typ_make_node(hst0, H0Tnone1(data))
end // end of [rest]
//
end // end of [trcmp30_type]

end // end of [local]

(* ****** ****** *)

implement
trcmp30_typelst
  (t2ps) =
list_vt2t(h0ts) where
{
val
h0ts =
list_map<t2ype><h0typ>
  (t2ps) where
{
implement
list_map$fopr<
  t2ype><h0typ>(t2p) = trcmp30_type(t2p)
}
} (* end of [trcmp30_typelst] *)

(* ****** ****** *)
//
implement
trcmp30_labtype
  (lt2p) = let
//
val+
SLABELED(l0, t2p1) = lt2p
//
in
SLABELED(l0, trcmp30_type(t2p1))
end // end of [trcmp30_labtype]
//
implement
trcmp30_labtypelst
  (ltps) =
list_vt2t(lhts) where
{
val
lhts =
list_map<labt2ype><labh0typ>
  (ltps) where
{
implement
list_map$fopr<
  labt2ype><labh0typ>(ltp) = trcmp30_labtype(ltp)
}
} (* end of [trcmp30_labtypelst] *)
//
(* ****** ****** *)

(* end of [xats_trcmp30_statyp.dats] *)
