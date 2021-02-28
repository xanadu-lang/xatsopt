(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: December, 2018
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

#staload
SYM = "./../SATS/xsymbol.sats"

(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
//
(* ****** ****** *)
//
// HX-2020-05-10:
// It is yet to be implemented!!!
//
implement
s2exp_whnfize(s2e0) = s2e0
//
(* ****** ****** *)

implement
{}(*tmp*)
s2exp_subst(s2e0) =
(
let
  var flag: int = 0
in
  auxs2e0(s2e0, flag)
end
) where
{
//
fun
auxs2e0
( s2e0
: s2exp
, flag
: &int >> int
) : s2exp = let
//
val fini = flag
val s2t0 = s2e0.sort()
//
in
case+
s2e0.node() of
//
| S2Eint _ => s2e0
| S2Ebtf _ => s2e0
| S2Echr _ => s2e0
| S2Estr _ => s2e0
//
|
S2Evar(s2v1) =>
s2exp_subst$var<>(s2e0, flag)
//
| S2Extv(xtv1) =>
  let
    val
    s2e1 = xtv1.sexp()
  in
    case+
    s2e1.node() of
    | S2Enone0() =>
      (
        s2e0 // unsolved
      )
    | _ (*solved*) =>
      (
        auxs2e0(s2e1, flag)
      ) where
      {
        val () = (flag := flag+1)
      }
  end // end of [S2Extv]
//
|
S2Eapp
(s2e1, s2es) => let
val
s2e1 = auxs2e0(s2e1, flag)
val
s2es = auxs2es(s2es, flag)
in
if
flag=fini
then s2e0
else
s2exp_make_node(s2t0, S2Eapp(s2e1, s2es))
end
|
S2Elam(s2vs, s2e1) => let
val
s2e1 = auxs2e0(s2e1, flag)
in
  if
  flag=fini
  then s2e0
  else
  s2exp_make_node(s2t0, S2Elam(s2vs, s2e1))
end
//
|
S2Efun
(fc2, npf, s2es, s2e1) =>
let
  val
  s2e1 = auxs2e0(s2e1, flag)
  val
  s2es = auxs2es(s2es, flag)
in
  if
  flag=fini
  then s2e0
  else
  s2exp_make_node
  ( s2t0, S2Efun( fc2, npf, s2es, s2e1 ) )
end
//
|
S2Eexi
(s2vs, s2ps, s2e1) => let
val
s2ps = auxs2es(s2ps, flag)
val
s2e1 = auxs2e0(s2e1, flag)
in
if
flag=fini
then s2e0
else
s2exp_make_node(s2t0, S2Eexi(s2vs, s2ps, s2e1))
end
|
S2Euni
(s2vs, s2ps, s2e1) => let
val
s2ps = auxs2es(s2ps, flag)
val
s2e1 = auxs2e0(s2e1, flag)
in
if
flag=fini
then s2e0
else
s2exp_make_node(s2t0, S2Euni(s2vs, s2ps, s2e1))
end
//
|
S2Etyext(name, s2es) =>
let
  val
  s2es = auxs2es(s2es, flag)
in
  if
  flag=fini
  then s2e0
  else
  s2exp_make_node(s2t0, S2Etyext(name, s2es))
end // end of [S2Etyext]
//
|
S2Etyrec(knd, npf, lses) =>
let
  val
  lses = auxls2es(lses, flag)
(*
  val
  s2t0 =
  (
  ( case+ knd of
    | TYRECflt0() => auxlst(lses)
    | _(*non-TYRECflt0*) => s2t0): sort2
  ) where
  {
  fun
  auxlst
  ( lses
  : labs2explst): sort2 =
  ( case+ lses of
    | list_nil() =>
      the_sort2_type
    | list_cons(ltp1, lses) =>
      let
      val+
      SLABELED(lab, s2e) = ltp1
      in
        if
        sort2_islin( s2e.sort() )
        then the_sort2_vwtp else auxlst(lses)
      end
  ) (* end of [auxlst] *)
  } (* where *) // end of [val s2t0]
*)
in
  if
  flag=fini
  then s2e0
  else
  s2exp_make_node(s2t0, S2Etyrec(knd, npf, lses))
end // end of [S2Etyrec]
//
| _ (* rest-of-s2exp *) => s2e0 // S2Efc2,S2Enone0/1
//
end // end of [auxs2e0]
//
and
auxs2es
( s2es
: s2explst
, flag
: &int >> int
) : s2explst =
(
case+ s2es of
| list_nil() =>
  list_nil()
| list_cons
  (s2e1, s2es1) => let
    val fini = flag
    val
    s2e1 = auxs2e0(s2e1, flag)
    val
    s2es1 = auxs2es(s2es1, flag)
  in
    if
    flag = fini
    then s2es else list_cons(s2e1, s2es1)
  end
)
//
and
auxls2es
( lses
: labs2explst
, flag
: &int >> int
) : labs2explst =
(
case+ lses of
| list_nil() =>
  list_nil()
| list_cons
  (ls2e1, lses2) =>
  let
//
    val fini = flag
//
    val+
    SLABELED(l1, x1) = ls2e1
    val x1 = auxs2e0(x1, flag)
    val ls2e1 =
    (
    if
    flag = fini
    then ls2e1 else SLABELED(l1, x1)
    ) : labs2exp // end of [val]
//
    val lses2 = auxls2es(lses2, flag)
//
  in
    if
    flag = fini
    then lses else list_cons(ls2e1, lses2)
  end
)
//
} (* end of [s2exp_subst] *)

(* ****** ****** *)
//
implement
s2exp_subst_svar
(s2e0, s2v1, tsub) =
(
s2exp_subst<>(s2e0)
) where
{
//
implement
s2exp_subst$var<>
  (s2e0, flag) =
let
val-
S2Evar
(s2v0) = s2e0.node()
in
  if
  s2v0=s2v1
  then s2e0
  else (flag := flag+1; tsub)
end // [s2exp_subst$var]
//
} (* end of [s2exp_subst_svar] *)
//
(* ****** ****** *)
//
implement
s2exp_subst_svarlst
(s2e0, s2vs, tsub) =
(
s2exp_subst<>(s2e0)
) where
{
//
implement
s2exp_subst$var<>
  (s2e0, flag) =
let
//
val-
S2Evar
(s2v0) = s2e0.node()
//
fun
auxlst
( s2vs
: s2varlst
, s2es
: s2explst
, flag
: &int >> int
): s2exp =
(
case+ s2vs of
| list_nil() => s2e0
| list_cons
  (s2v1, s2vs) =>
  let
    val-
    list_cons
    (s2e1, s2es) = s2es
  in
    if
    s2v0 = s2v1
    then (flag := flag+1; s2e1)
    else auxlst(s2vs, s2es, flag)
  end
)
//
in
  auxlst(s2vs, tsub, flag)
end
//
} (* end of [s2exp_subst_svarlst] *)
//
(* ****** ****** *)
//
implement
s2explst_subst_svarlst
  (s2es, s2vs, tsub) =
list_vt2t
(
list_map<s2exp><s2exp>(s2es)
) where
{
//
implement
list_map$fopr<s2exp><s2exp>
  (s2e) =
  s2exp_subst_svarlst(s2e, s2vs, tsub)
//
} (* end of [s2explst_subst_svarlst] *)
//
(* ****** ****** *)

(* end of [xats_staexp2_util2.dats] *)
