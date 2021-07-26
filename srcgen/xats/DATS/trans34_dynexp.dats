(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: January, 2021
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
#staload "./../SATS/xsymbol.sats"

(* ****** ****** *)

#staload "./../SATS/lexing0.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/trans12.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)
#staload "./../SATS/cstrnt0.sats"
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#staload "./../SATS/trans3x.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
implement
fprint_val<s2exp> = fprint_s2exp
implement
fprint_val<t2ype> = fprint_t2ype
(* ****** ****** *)
implement
fprint_val<tq2arg> = fprint_tq2arg
(* ****** ****** *)
implement
fprint_val<d3exp> = fprint_d3exp
(* ****** ****** *)
implement
fprint_val<d3ecl> = fprint_d3ecl
(* ****** ****** *)
implement
fprint_val<dvmrg2> = fprint_dvmrg2
implement
fprint_val<dvmrgs> = fprint_dvmrgs
(* ****** ****** *)
//
implement
fprint_val<f4undecl> = fprint_f4undecl
//
implement
fprint_val<v4aldecl> = fprint_v4aldecl
implement
fprint_val<v4ardecl> = fprint_v4ardecl
//
(* ****** ****** *)

implement
trans34_envless
  (prog) =
  (prog) where
{
//
val
env0 =
tr34env_make_nil()
//
val
prog =
trans34_declist(env0, prog)
//
val () = tr34env_free_top(env0)
//
} (* end of [trans34_envless] *)

(* ****** ****** *)

(*
fun
d4pat_make_opny
( s2vs
: s2varlst
, s2ps
: s2explst
, d4p0: d4pat): d4pat =
(
case+
(s2vs, s2ps) of
|
( list_nil()
, list_nil()) => d4p0
|
( _(*else*)
, _(*else*) ) =>
let
val
loc0 = d4p0.loc()
val
t2p0 = d4p0.type()
val
sopn = d4p0.sexp()
val
s2t0 = sopn.sort()
val
s2e0 =
s2exp_make_node
( s2t0
, S2Eexi(s2vs, s2ps, sopn))
in
d4pat_make_node
( loc0
, s2e0
, t2p0, D4Popny(d4p0, s2vs, s2ps))
end
) (* end of [d4pat_make_opny] *)
*)

(* ****** ****** *)

(*
implement
trans34_d4popn
(env0, d4p0) =
(
  d4p0) where
{
//
val
loc0 = d4p0.loc()
val
s2e0 = d4p0.sexp()
//
val () =
println!
("trans34_d4popn: d4p0 = ",  d4p0)
val () =
println!
("trans34_d4popn: s2e0 = ",  s2e0)
//
} (*where*) // end of [trans34_d4popn]
*)

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxany
( env0:
! tr34env
, d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Pany() = d3p0.node()
//
val
s2e0 =
sexpize_env(env0, t2p0)
//
in
//
d4pat_make_node
( loc0, s2e0, t2p0, D4Pany() )
//
end (*let*) // end of [auxany]

(* ****** ****** *)

fun
auxvar
( env0:
! tr34env
, d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Pvar
(d2v1) = d3p0.node()
//
val s2e1 =
let
val s2e1 = d2v1.sexp()
in
case-
s2e1.node() of
|
S2Enone0() =>
let
val t2p1 = d2v1.type()
in
sexpize_env(env0, t2p1)
end
(*
| _(*non-S2Enone0*) => s2e1
*)
end : s2exp // end of [val]
//
in
//
let
val
d4p0 =
trans34_dpat_dntp
(env0, d3p0, s2e1)
//
in
let
val () =
tr34env_add_dvar(env0, d2v1)
val () =
tr34env_add_dvar_sexp
(env0, d2v1, d4p0.sexp()) in d4p0
end
end // end of [let]
//
end (*let*) // end of [auxvar]

(* ****** ****** *)

fun
auxi00
(d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Pi00(int) = d3p0.node()
//
val
s2i0 = s2exp_int(int)
val
s2e0 = s2exp_type_sint(s2i0)
//
in
d4pat_make_node
(loc0, s2e0, t2p0, D4Pi00(int))
end (*let*) // end of [auxi00]

(* ****** ****** *)

fun
auxb00
(d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Pb00(btf) = d3p0.node()
//
val
s2b0 = s2exp_btf(btf)
val
s2e0 = s2exp_type_bool(s2b0)
//
in
d4pat_make_node
(loc0, s2e0, t2p0, D4Pb00(btf))
end (*let*) // end of [auxb00]

(* ****** ****** *)

fun
auxs00
(d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Ps00(str) = d3p0.node()
//
val
s2i0 =
let
val len =
string_length(str)
in s2exp_int(sz2i(len)) end
//
val
s2e0 = s2exp_type_strlen(s2i0)
//
in
d4pat_make_node
(loc0, s2e0, t2p0, D4Ps00(str))
end (*let*) // end of [auxs00]

(* ****** ****** *)

fun
auxint
(d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Pint(tok) = d3p0.node()
val
s2i0 =
s2exp_int(dint) where
{
val dint = token2dint(tok)
}
//
val
s2e0 = s2exp_type_sint(s2i0)
//
in
d4pat_make_node
(loc0, s2e0, t2p0, D4Pint(tok))
end (*let*) // end of [auxint]

(* ****** ****** *)

fun
auxbtf
(d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Pbtf(tok) = d3p0.node()
val
s2b0 =
s2exp_btf(dbtf) where
{
val dbtf = token2dbtf(tok)
}
//
val
s2e0 = s2exp_type_bool(s2b0)
//
in
d4pat_make_node
(loc0, s2e0, t2p0, D4Pbtf(tok))
end (*let*) // end of [auxbtf]

(* ****** ****** *)

fun
auxchr
(d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Pchr(tok) = d3p0.node()
val
s2b0 =
s2exp_chr(dchr) where
{
val dchr = token2dchr(tok)
}
//
val
s2e0 = s2exp_type_bool(s2b0)
//
in
d4pat_make_node
(loc0, s2e0, t2p0, D4Pchr(tok))
end (*let*) // end of [auxchr]

(* ****** ****** *)

fun
auxcon1
(d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Pcon1
( d2c1 ) = d3p0.node()
(*
val () =
println!
(
"trans34_dpat\
: auxcon1: d2c1 = ", d2c1)
*)
val
tqas = d2con_get_tqas(d2c1)
val
s2e1 = d2con_get_sexp(d2c1)
//
in
let
  val
  s2e1 =
  s2exp_tq2as_elim
  ( loc0, s2e1, tqas )
in
d4pat_make_node
( loc0
, s2e1, t2p0, D4Pcon1(d2c1))
end
end (*let*) // end of [auxcon1]

(* ****** ****** *)

fun
auxsap0
( env0
: !tr34env
, d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Psap0
( d3p1
, sarg) = d3p0.node()
//
val
d4p1 =
trans34_dpat(env0, d3p1)
val
s2e1 = d4p1.sexp((*void*))
//
in
d4pat_make_node
( loc0
, s2e1, t2p0, D4Psap0(d4p1, sarg))
end (*let*) // end of [auxsap0]

(* ****** ****** *)

fun
auxsap1
( env0
: !tr34env
, d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Psap1
( d3p1
, sarg) = d3p0.node()
//
val
d4p1 =
trans34_dpat(env0, d3p1)
val
s2e1 = d4p1.sexp((*void*))
//
in
d4pat_make_node
( loc0
, s2e1, t2p0, D4Psap1(d4p1, sarg))
end (*let*) // end of [auxsap1]

(* ****** ****** *)

fun
auxdapp
( env0
: !tr34env
, d3p0: d3pat): d4pat =
let
//
val
loc0 = d3p0.loc()
val
tres = d3p0.type()
//
val-
D3Pdapp
( d3f0
, npf1
, darg) = d3p0.node()
//
var
sres:
s2exp =
sexpize_env(env0, tres)
//
val
d4f0 =
trans34_dpat(env0, d3f0)
val
d4f0 =
trans34_d4pat_deunis(d4f0)
val
s2f0 = d4f0.sexp((*void*))
//
val
darg =
(
case+
s2f0.node() of
|
S2Efun
( fc21
, npf2
, targ, tres) =>
let
val () =
(sres := tres)
in
  trans34_dpatlst_dnts
  ( env0, darg, targ )
end
|
_ (*non-S2Efun*) =>
trans34_dpatlst(env0, darg)
) : d4patlst // end-of-val-darg
//
in
d4pat_make_node
( loc0
, sres
, tres, D4Pdapp(d4f0, npf1, darg))
end (*let*) // end of [auxdapp]

(* ****** ****** *)

in(*in-of-local*)

implement
trans34_dpat
(env0, d3p0) =
let
//
// (*
val () =
println!
("trans34_dpat: d3p0 = ", d3p0)
// *)
//
in (*in-of-let*)
//
case+
d3p0.node() of
//
(*
|
D3Pnil _ =>
auxnil(d3p0)
*)
//
|
D3Pany _ =>
(
  auxany( env0, d3p0 )
)
|
D3Pvar _ =>
(
  auxvar( env0, d3p0 )
)
//
|
D3Pi00 _ => auxi00(d3p0)
|
D3Pb00 _ => auxb00(d3p0)
|
D3Ps00 _ => auxs00(d3p0)
//
|
D3Pint _ => auxint(d3p0)
|
D3Pbtf _ => auxbtf(d3p0)
|
D3Pchr _ => auxchr(d3p0)
//
|
D3Pcon1 _ => auxcon1(d3p0)
//
|
D3Psap0 _ => auxsap0(env0, d3p0)
|
D3Psap1 _ => auxsap1(env0, d3p0)
//
|
D3Pdapp _ => auxdapp(env0, d3p0)
//
|
D3Panno
( d3p1
, s1e2, s2e2) =>
(
d4pat_make_node
( loc0
, s2e2
, t2p1, D4Panno(d4p1, s1e2, s2e2))
) where
{
//
val loc0 = d3p0.loc()
val t2p1 = d3p1.type()
//
val d4p1 = trans34_dpat(env0, d3p1)
//
} (* end of [D3Panno] *)
//
|
_ (*rest-of-d3pat*) => d4pat_none1(d3p0)
//
end (*let*) // end of [trans34_dpat]

end // end of [local]

(* ****** ****** *)

implement
trans34_dpatlst
( env0, d3ps ) =
(
list_vt2t
(
list_map<d3pat><d4pat>(d3ps)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3pat><d4pat>
  (d3p0) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
d4p0 = trans34_dpat(env0, d3p0)
//
in
let
prval () = $UN.cast2void(env0) in d4p0
end
end // list_map$fopr
} (* end of [trans34_dpatlst] *)

(* ****** ****** *)

local

fun
auxd3p0
( env0
: !tr34env
, d3p0: d3pat
, sopn: s2exp): d4pat =
let
(*
val () =
println!
("auxd3p0: d3p0 = ", d3p0)
*)
in
//
case+
d3p0.node() of
//
|
D3Pvar(d2v1) =>
let
//
val () =
let
val
s2e1 = d2v1.sexp()
in
case-
s2e1.node() of
|
S2Enone0
((*void*)) =>
{
val () =
d2var_set_sexp(d2v1, sopn)
}
(*
| _(*non-S2Enone0*) => ( )
*)
end : void // end of [val]
//
val
loc0 = d3p0.loc()
val
t2p1 = d2v1.type()
//
val
d4p0 =
d4pat_make_node
( loc0
, sopn, t2p1, D4Pvar(d2v1))
//
in
let
val () =
tr34env_add_dvar(env0, d2v1)
val () =
tr34env_add_dvar_sexp
(env0, d2v1, d4p0.sexp()) in d4p0
end // end of [let]
end (*let*) // end of [D3Pvar]
//
|
D3Panno
( d3p1
, s1e2, s2e2) =>
(
d4pat_make_node
( loc0
, s2e2
, t2p1, D4Panno(d4p1, s1e2, s2e2))
) where
{
val loc0 = d3p0.loc()
val t2p1 = d3p1.type()
val d4p1 = auxd3p0(env0, d3p1, sopn)
}
//
|
_ (*rest-of-d3pat*) =>
let
val
d4p0 = 
trans34_dpat
(env0, d3p0) in d4pat_tasmp(d4p0, sopn)
end // end of [rest-of-d3pat]
//
end (*let*) // end of [auxd3p0]

in(*in-of-local*)
//
implement
trans34_dpat_dntp
(env0, d3p0, s2e0) =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val
( s2vs
, s2ps
, sopn) =
s2exp_opny_env(env0, s2e0)
//
in
//
let
  val
  d4p1 =
  auxd3p0(env0, d3p0, sopn)
in
//
case+
(s2vs, s2ps) of
|
( list_nil()
, list_nil()) => d4p1
|
( _(*else*)
, _(*else*) ) =>
d4pat_make_node
( loc0
, s2e0
, t2p0
, D4Popny(d4p1, s2vs, s2ps)) end
//
end // end of [trans34_dpat_dntp]
//
end // end of [local]

(* ****** ****** *)

implement
trans34_dpatlst_dnts
( env0, d3ps, s2es ) =
(
case+ d3ps of
|
list_nil() =>
list_nil()
|
list_cons(d3p1, d3ps) =>
(
case+ s2es of
|
list_nil() =>
(
list_cons(d4p1, d4ps)) where
{
//
val
s2e1 = the_s2exp_none0(*void*)
//
val d4p1 =
trans34_dpat_dntp(env0, d3p1, s2e1)
val d4ps =
trans34_dpatlst_dnts(env0, d3ps, s2es)
//
} (* end of [list_nil] *)
|
list_cons(s2e1, s2es) =>
(
list_cons(d4p1, d4ps)) where
{
//
val d4p1 =
trans34_dpat_dntp(env0, d3p1, s2e1)
val d4ps =
trans34_dpatlst_dnts(env0, d3ps, s2es)
//
} (* end of [list_cons] *)
)
) (* end of [trans34_dpatlst_dnts] *)

(* ****** ****** *)

local

fun
auxi00
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ei00(int) = d3e0.node()
//
val
s2i0 = s2exp_int(int)
val
s2e0 = s2exp_type_sint(s2i0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Ei00(int))
end (*let*) // end of [auxi00]

fun
auxb00
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Eb00(btf) = d3e0.node()
//
val
s2b0 = s2exp_btf(btf)
val
s2e0 = s2exp_type_bool(s2b0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Eb00(btf))
end // end of [auxb00]

fun
auxc00
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ec00(chr) = d3e0.node()
//
val
s2ch = s2exp_chr(chr)
val
s2e0 = s2exp_type_char(s2ch)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Ec00(chr))
end (*let*) // end of [auxc00]

(* ****** ****** *)

fun
auxint
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Eint(tok) = d3e0.node()
//
val
s2i0 =
s2exp_int(dint) where
{
val dint = token2dint(tok)
}
//
val
s2e0 = s2exp_type_sint(s2i0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Eint(tok))
end (*let*) // end of [auxint]

(* ****** ****** *)

fun
auxbtf
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ebtf(tok) = d3e0.node()
//
val
s2b0 =
s2exp_btf(dbtf) where
{
val dbtf = token2dbtf(tok)
}
//
val
s2e0 = s2exp_type_bool(s2b0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Ebtf(tok))
end (*let*) // end of [auxbtf]

(* ****** ****** *)

fun
auxchr
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Echr(tok) = d3e0.node()
//
val
s2b0 =
s2exp_chr(dchr) where
{
val dchr = token2dchr(tok)
}
//
val
s2e0 = s2exp_type_char(s2b0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Echr(tok))
end (*let*) // end of [auxchr]

(* ****** ****** *)

local

fun
auxelt
(s2at: s2exp): s2exp =
(
case+
s2at.node() of
|
S2Eapp
(s2f0, s2es) =>
(
if
s2exp_is_a0ptr(s2f0)
then
let
val-
list_cons
(s2e0, _) = s2es in s2e0
end else the_s2exp_none0(*void*)
)
|
_(*non-S2Eapp*) => the_s2exp_none0
) (* end of [auxelt] *)

and
auxloc
(s2at: s2exp): s2exp =
(
case+
s2at.node() of
|
S2Eapp
(s2f0, s2es) =>
(
if
s2exp_is_a0ptr(s2f0)
then
let
val-
list_cons
(_, s2es) = s2es
val-
list_cons
(s2l1, _) = s2es in s2l1
end else the_s2exp_none0(*void*)
)
|
_(*non-S2Eapp*) => the_s2exp_none0
) (* end of [auxloc] *)

in(*in-of-local*)

fun
auxvar
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val-
D3Evar(d2v0) = d3e0.node()
//
in
//
case+
d2v0.atprf() of
|
None _ => auxvar0(env0, d3e0)
|
Some _ => auxvar1(env0, d3e0)
//
end // end of [auxvar]

and
auxvar0
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Evar
(d2v0) = d3e0.node()
//
val
s2e0 =
tr34env_d2var_get_sexp
( env0, d2v0 )
//
val () =
println!
( "auxvar0: d2v0 = ", d2v0 )
val () =
println!
( "auxvar0: s2e0 = ", s2e0 )
//
val () =
let
val
s2t0=s2e0.sort()
(*
val () =
println!
( "auxvar0: s2t0 = ", s2t0 )
*)
//
in(*in-of-let*)
//
if
sort2_islin(s2t0)
then
tr34env_add_dvar_sexp
(env0, d2v0, s2exp_used(s2e0))
//
end // end of [val]
//
in
d4exp_make_node
(loc0, s2e0, t2p0, D4Evar(d2v0))
end (*let*) // end of [auxvar0]

and
auxvar1
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Evar
(d2v0) = d3e0.node()
val-
Some(d2w1) = d2v0.atprf()
//
val
s2at =
tr34env_d2var_get_sexp
( env0, d2w1 )
//
val () =
println!
( "auxvar1: d2w1 = ", d2w1 )
val () =
println!
( "auxvar1: s2at = ", s2at )
//
val s2e0 = auxelt(s2at)
val () =
println!
( "auxvar1: s2e0 = ", s2e0 )
//
(*
//
// HX-2021-07-03:
// Please check that
// s2l1==d2v1.saddr() holds!
// 
val s2l1 = auxloc(s2at)
val () =
println!
( "auxvar1: s2l1 = ", s2l1 )
//
*)
//
(*
//
(*
HX-2021-07-03:
This update is
handled by [aux_flat]!!!
*)
//
val () =
let
val
s2t0=s2e0.sort()
(*
val () =
println!
( "auxvar1: s2t0 = ", s2t0 )
*)
//
in(*in-of-let*)
//
if
sort2_islin(s2t0)
then
let
val s2e0 = 
s2exp_used(s2e0)
val s2at =
s2exp_at0(s2e0, s2l1)
in
tr34env_add_dvar_sexp
(env0, d2w1, s2at(*atvw*)) end
//
end // end of [val]
*)
//
in
d4exp_make_node
(loc0, s2e0, t2p0, D4Evar(d2v0))
end (*let*) // end of [auxvar1]

end // end of [local]

(* ****** ****** *)

fun
auxkvar
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ekvar
(knd0, d2v0) = d3e0.node()
//
val () =
println!
( "auxkvar: d2v0 = ", d2v0 )
val () =
println!
( "auxkvar: knd0 = ", knd0 )
//
val
s2e0 =
(
ifcase
|
knd0=VFIX => d2v0.sexp()
|
_(*else*) =>
tr34env_d2var_get_sexp(env0, d2v0)
) : s2exp // end of [val]
//
val () =
println!
( "auxkvar: s2e0 = ", s2e0 )
//
in
d4exp_make_node
( loc0
, s2e0, t2p0, D4Ekvar(knd0, d2v0))
end (*let*) // end of [auxkvar]

(* ****** ****** *)

fun
auxfcon
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Efcon(d2c0) = d3e0.node()
//
val
s2e0 = d2con_get_sexp(d2c0)
//
val () =
println!
( "auxfcon: d2c0 = ", d2c0 )
val () =
println!
( "auxfcon: s2e0 = ", s2e0 )
//
in
d4exp_make_node
(loc0, s2e0, t2p0, D4Efcon(d2c0))
end (*let*) // end of [auxfcon]

(* ****** ****** *)

fun
auxfcst
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Efcst(d2c0) = d3e0.node()
//
val
s2e0 = d2cst_get_sexp(d2c0)
//
val () =
println!
( "auxfcst: d2c0 = ", d2c0 )
val () =
println!
( "auxfcst: s2e0 = ", s2e0 )
//
in
d4exp_make_node
(loc0, s2e0, t2p0, D4Efcst(d2c0))
end (*let*) // end of [auxfcst]

(* ****** ****** *)

local

fun
auxti4a
( ti4a
: ti4arg
, ti2s
: ti2arglst): void =
(
case+ ti4a of
|
TI4ARGnone() =>
((*void*))
|
TI4ARGsome(xs) =>
auxlst1(xs, ti2s)
) (* end of [auxti4a] *)
and
auxlst1
( xs
: s2explst
, ys
: ti2arglst): void =
(
case+ ys of
|
list_nil() => ()
|
list_cons(y1, ys) =>
let
  val es =
  y1.s2es() in auxlst2(xs, es, ys)
end
) (*case*) // end of [auxlst1]
and
auxlst2
( xs
: s2explst
, es
: s2explst
, ys
: ti2arglst): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x1, xs) =>
(
case+ es of
| list_nil() =>
  auxlst1(xs, ys)
| list_cons(e1, es) =>
  (
  auxlst2(xs, es, ys)
  ) where
  {
    val-
    S2Extv(v1) = x1.node()
    val ((*void*)) =
    s2xtv_set_sexp(v1, e1)
  }
)
) (*case*) // end of [auxlst2]

in(*in-of-local*)

fun
auxtcon
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Etcon
( d2c0
, ti3a
, ti2s) = d3e0.node()
//
val s2e0 = d2c0.sexp()
val ti4a =
(
case+ ti3a of
| TI3ARGnone() =>
  TI4ARGnone()
| TI3ARGsome(t2ps) =>
  TI4ARGsome(auxlst(t2ps))
) where
{
fun
auxlst
( xs
: t2ypelst): s2explst =
(
case+ xs of
|
list_nil() => list_nil()
|
list_cons(x1, xs) =>
let
  val
  xtv1 =
  s2xtv_new_srt
  (loc0, x1.sort())
  val
  s2e1 = s2exp_xtv(xtv1)
in
  list_cons(s2e1, auxlst(xs))
end
)
} (*where*) // end of [val ti4a]
//
val
ti4a = ti4a: ti4arg
//
val s2e0 =
(
case+ ti4a of
|
TI4ARGnone() => s2e0
|
TI4ARGsome(s2es) =>
let
val s2vs =
d2con_get_s2vs(d2c0)
in
  s2exp_subst_svarlst
  ( s2e0, s2vs, s2es )
end
) (* end of [val s2e0] *)
//
val () = auxti4a(ti4a, ti2s)
//
in
d4exp_make_node
( loc0, s2e0, t2p0
, D4Etcon(d2c0, ti4a, ti3a, ti2s))
end (*let*) // end of [auxtcon]

(* ****** ****** *)

fun
auxtcst
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Etcst
( d2c0
, ti3a
, ti2s) = d3e0.node()
//
val s2e0 = d2c0.sexp()
val ti4a =
(
case+ ti3a of
| TI3ARGnone() =>
  TI4ARGnone()
| TI3ARGsome(t2ps) =>
  TI4ARGsome(auxlst(t2ps))
) where
{
fun
auxlst
( xs
: t2ypelst): s2explst =
(
case+ xs of
|
list_nil() =>
list_nil()
|
list_cons(x1, xs) =>
let
  val
  xtv1 =
  s2xtv_new_srt
  (loc0, x1.sort())
  val
  s2e1 = s2exp_xtv(xtv1)
in
  list_cons(s2e1, auxlst(xs))
end
)
} (*where*) // end of [val ti4a]
//
val
ti4a = ti4a: ti4arg
//
val s2e0 =
(
case+ ti4a of
|
TI4ARGnone() => s2e0
|
TI4ARGsome(s2es) =>
let
val s2vs =
d2cst_get_s2vs(d2c0)
in
  s2exp_subst_svarlst
  ( s2e0, s2vs, s2es )
end
) (* end of [val s2e0] *)
//
val () = auxti4a(ti4a, ti2s)
//
in
d4exp_make_node
( loc0, s2e0, t2p0
, D4Etcst(d2c0, ti4a, ti3a, ti2s))
end (*let*) // end of [auxtcst]

end // end of [local]

(* ****** ****** *)

fun
auxtimp
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val () =
println!
("auxtimp: d3e0 = ", d3e0)
//
val-
D3Etimp
( stmp
, d3e1
, targ
, d3cl
, tsub) = d3e0.node()
//
val
d4e1 = auxtcst(env0, d3e1)
val
s2e1 = d4e1.sexp((*void*))
//
val
d4cl = trans34_decl(env0, d3cl)
//
in
d4exp_make_node
( loc0
, s2e1, t2p0
, D4Etimp
  (stmp, d4e1, targ, d4cl, tsub))
end (*let*) // end of [auxtimp]

(* ****** ****** *)

fun
auxsap0
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val () =
println!
("auxsap0: d3e0 = ", d3e0)
//
val-
D3Esap0
( d3f0
, s2es) = d3e0.node()
//
val d4f0 =
trans34_dexp(env0, d3f0)
val s2f0 =
whnfize_env(env0, d4f0.sexp())
//
in
case+
s2f0.node() of
|
S2Euni _ =>
let
val d4f0 =
trans34_d4exp_deuni1(d4f0)
in
d4exp_make_node
( loc0
, s2f0, t2p0, D4Esap0(d4f0, s2es))
end // end of [S3Euni]
|
_(* non-S2Euni *) =>
d4exp_make_node
( loc0
, s2f0, t2p0, D4Esap0(d4f0, s2es))
end // end of [auxsap0]

(* ****** ****** *)

fun
auxdapp
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
// (*
val () =
println!
("auxdapp: d3e0 = ", d3e0)
// *)
//
val-
D3Edapp
( d3f0
, npf1
, d3es) = d3e0.node()
//
val d4f0 =
trans34_dexp(env0, d3f0)
val d4f0 =
trans34_d4exp_deunis(d4f0)
//
val s2f0 =
s2exp_whnfize(d4f0.sexp())
//
(*
val () =
println!
("auxdapp: s2f0 = ", s2f0)
*)
//
in(*in-of-let*)
//
case+
s2f0.node() of
|
S2Efun
( fc20
, npf1
, s2es, s2r0) =>
let
//
fun
auxargs
( env0:
! tr34env
, d3es
: d3explst
, s2es
: s2explst): d4explst =
(
case+ d3es of
|
list_nil() =>
list_nil()
|
list_cons(d3e1, d3es) =>
(
case+ s2es of
|
list_nil() =>
let
val
s2e1 =
the_s2exp_none0
val
d4e1 =
trans34_dexp_dntp
(env0, d3e1, s2e1)
in
list_cons
( d4e1
, auxargs(env0, d3es, s2es))
end // end of [list_nil]
|
list_cons
(s2e1, s2es) =>
let
//
val
s2e1 =
auxs2e1(s2e1) where
{
fun
auxs2e1
(s2e1: s2exp): s2exp =
(
case+
s2e1.node() of
|
S2Earg
(knd0,s2e1) => s2e1
|
S2Eatx
(s2e1,aft2) => auxs2e1(s2e1)
| _(*rest-of-s2exp*) => s2e1
)
} (*where*) // end of [val]
//
val
d4e1 =
trans34_dexp_dntp
(env0, d3e1, s2e1)
//
in
list_cons
( d4e1
, auxargs(env0, d3es, s2es))
end
)
) (* end of [auxargs] *)
//
val
d4es =
auxargs(env0, d3es, s2es)
//
in
auxdapq
(
env0
,
d4exp_make_node
( loc0
, s2r0
, t2p0
, D4Edapp(d4f0, npf1, d4es)))
end // end of [S2Efun]
|
_(*non-S2Efun*) =>
let
//
val
d4f0 =
d4exp_none2(d4f0)
val
d4es =
trans34_dexplst(env0, d3es)
val
s2r0 = the_s2exp_none0(*void*)
//
in
//
d4exp_make_node
( loc0
, s2r0
, t2p0, D4Edapp(d4f0, npf1, d4es))
end // end of [non-S2Efun]
//
end (*let*) // end of [auxdapp]

(* ****** ****** *)

and
auxdapq
( env0:
! tr34env
, d4e0: d4exp): d4exp =
let
//
val-
D4Edapp
( d4f0
, npf1
, d4es) = d4e0.node()
//
val s2f0 = d4f0.sexp()
//
in(*in-of-let*)
//
case+
s2f0.node() of
|
S2Efun
( fc20
, npf1
, s2es, s2r0) =>
if
isapq(s2es)
then
(
d4exp_dapq
(d4e0, npf1, d4es)
) where
{
val
d4es = auxargs(d4es, s2es)
} else d4e0 // end of [if]
| _ (* non-S2Efun *) => d4e0
//
end where
{
//
fun
isapq
(s2es: s2explst): bool =
(
case+ s2es of
|
list_nil() => false
|
list_cons(s2e1, s2es) =>
(
case+
s2e1.node() of
| S2Earg _ => true
| S2Eatx _ => true
| _ (*else*) => isapq(s2es)
) (* end of [list_cons] *)
)
//
fun
auxknd
(s2e1: s2exp): int =
(
case+
s2e1.node() of
|
S2Earg
(knd0, sarg) => knd0
|
_(* non-S2Earg *) => 0
)
fun
auxarg1
( d4e1: d4exp
, s2e1: s2exp): d4exp =
(
case+
s2e1.node() of
|
S2Earg
(knd0, saft) =>
d4exp_darg
(d4e1, knd0, saft)
|
S2Eatx
(s2e1, saft) =>
d4exp_darg
(d4e1, knd0, saft) where
{
  val knd0 = auxknd(s2e1)
}
//
|
_(*else*) => d4exp_none2(d4e1)
//
) (* end-of-fun[auxarg1] *)
fun
auxargs
( d4es
: d4explst
, s2es
: s2explst): d4explst =
(
case+ d4es of
|
list_nil
((*void*)) => list_nil()
|
list_cons
(d4e1, d4es) =>
(
case+ s2es of
|
list_nil() =>
let
val
d4e1 =
d4exp_none2(d4e1)
in
  list_cons
  (d4e1, auxargs(d4es, s2es))
end
|
list_cons(s2e1, s2es) =>
let
val
d4e1 =
auxarg1(d4e1, s2e1)
in
list_cons
(d4e1, auxargs(d4es, s2es))
end
) (* end of [list_cons] *)
) (* end-of-fun[auxargs] *)
//
} (*where*) // end of [auxdapq]

(* ****** ****** *)

fun
auxplft
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
// (*
val () =
println!
("auxplft: d3e0 = ", d3e0)
// *)
//
val-
D3Eplft
( dtup
, lab1
, ind2) = d3e0.node()
//
val dtup =
trans34_dexp(env0, dtup)
val dtup =
d4exp_opny_env(env0, dtup)
//
val stup = dtup.sexp()
val stup = s2exp_whnfize(stup)
//
in
//
case+
stup.node() of
|
S2Etyrec
(knd, npf, lses) =>
let
val s2r0 =
auxlses(ind2, lses) where
{
fun
auxlses
( i0: int
, lses
: labs2explst): s2exp =
if
(i0 >= 0)
then
(
case+ lses of
|
list_nil() =>
(
  the_s2exp_none0(*void*)
)
|
list_cons(lse1, lses) =>
if
(i0 = 0)
then
let
val+
SLABELED
(_, s2e1) = lse1 in s2e1
end
else auxlses(i0-1, lses)
) else
(
  the_s2exp_none0(*void*)
)
}
in
d4exp_make_node
( loc0
, s2r0
, t2p0
, D4Eplft(dtup, lab1, ind2))
end // end of [S2Etyrec]
//
|
_(*non-S2Etyrec*) =>
let
//
val
s2r0 = the_s2exp_none0(*void*)
//
in
d4exp_make_node
( loc0
, s2r0
, t2p0, D4Eplft(dtup, lab1, ind2))
end
//  
end (*let*) // end of [auxplft]

(* ****** ****** *)
//
fun
aux_let
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Elet
( dcls
, d3e1) = d3e0.node()
//
val () =
tr34env_add_let1(env0)
//
val
dcls =
trans34_declist(env0, dcls)
val
d4e1 = trans34_dexp(env0, d3e1)
//
val
d2vs =
tr34env_dlocs_let1(env0)
val
stmap =
tr34env_stmap_let1(env0)
//
val () =
println!
( "aux_let: dlocs = ", d2vs )
val () =
println!
( "aux_let: stmap(all):\n", stmap )
//
val
stmap =
tr34env_add_denvs
( env0 , d2vs , stmap ) where
{
val () = tr34env_pop_let1(env0)
} (*where*) // end-of-val
//
val () =
println!
( "aux_let: stmap(loc):\n", stmap )
//
in
let
val
s2e1 = d4e1.sexp()
in
d4exp_make_node
( loc0
, s2e1, t2p0, D4Elet(dcls, d4e1))
end
end (*let*) // end of [aux_let]
//
fun
aux_where
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ewhere
( d3e1
, dcls) = d3e0.node()
//
val () =
tr34env_add_let1(env0)
//
val
dcls =
trans34_declist(env0, dcls)
val
d4e1 = trans34_dexp(env0, d3e1)
//
val
d2vs =
tr34env_dlocs_let1(env0)
val
stmap =
tr34env_stmap_let1(env0)
//
val () =
println!
("aux_where: dlocs = ", d2vs)
val () =
println!
("aux_where: stmap(all):\n", stmap)
//
val
stmap =
tr34env_add_denvs
( env0 , d2vs , stmap ) where
{
val () = tr34env_pop_let1(env0)
} (*where*) // end-of-val
//
val () =
println!
("aux_where: stmap(loc):\n", stmap)
//
in
let
val
s2e1 = d4e1.sexp()
in
d4exp_make_node
( loc0
, s2e1, t2p0, D4Ewhere(d4e1, dcls))
end
end (*let*) // end of [aux_where]
//
(* ****** ****** *)

fun
aux_seqn
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Eseqn
( d3es
, d3e2) = d3e0.node()
//
val
d4es =
auxd3es(env0, d3es) where
{
fun
auxd3es
( env0:
! tr34env
, d3es
: d3explst): d4explst =
(
case+ d3es of
|
list_nil() => list_nil()
|
list_cons(d3e1, d3es) =>
let
  val
  s2e1 =
  s2exp_type_void()
  val
  d4e1 =
  trans34_dexp_dntp
  (env0, d3e1, s2e1)
in
list_cons
(d4e1, auxd3es(env0, d3es))
end
) (* end of [auxd3es] *)
}
val
d4e2 = trans34_dexp(env0, d3e2)
//
in
let
val
s2e2 =
d4e2.sexp()
in
d4exp_make_node
( loc0
, s2e2, t2p0, D4Eseqn(d4es, d4e2))
end
end (*let*) // end of [aux_seqn]

(* ****** ****** *)
//
fun
aux_assgn
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Eassgn
( d3e1
, d3e2) = d3e0.node()
//
(*
HX-2021-06-07:
Typecheck [d3e2] first!
*)
val
d4e2 =
trans34_dexp(env0, d3e2)
val
d4e1 =
trans34_dexp(env0, d3e1)
//
val
s2e0 = s2exp_type_void()
//
(*
val
s2e1 = d4e1.sexp((*void*))
val
s2e2 = d4e2.sexp((*void*))
val () =
println!
("aux_assgn: s2e1 = ", s2e1)
val () =
println!
("aux_assgn: s2e2 = ", s2e2)
*)
//
val
err3 =
auxupdt
(env0, d4e1, d4e2.sexp())
//
val
d4e1 = d4exp_leakify(d4e1)
//
in
d4exp_make_node
( loc0
, s2e0
, t2p0, D4Eassgn(d4e1, d4e2, err3))
end where
{
(* ****** ****** *)
//
fun
auxupdt
( env0:
! tr34env
, d4e1: d4exp
, s2e2: s2exp): d4err =
(
case+
d4e1.node() of
|
D4Etalf(_, opt2) =>
(
case+ opt2 of
//
| None() =>
  D4ERRnone(*void*)
//
| Some(xtv2) =>
  D4ERRnone(*void*) where
  {
  val () =
  s2xtv_set_sexp(xtv2, s2e2)
  }
//
) (* end of [D4Etalf] *)
|
_(*rest-of-d4exp*) => D4ERRupdtd0()
) (* end of [auxupdt] *)
//
(* ****** ****** *)
} (*where*) // end of [aux_assgn]
//
(* ****** ****** *)

fun
aux_if0
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Eif0
( d3e1
, d3e2
, opt3) = d3e0.node()
//
val
d4e1 =
trans34_dexp(env0, d3e1)
//
val
xtv0 =
s2xtv_new_srt
(loc0, t2p0.sort())
val
s2e0 = s2exp_xtv(xtv0)
//
local
val () =
tr34env_add_bran(env0)
in(*in-of-local*)
//
val
d4e2 =
let
val
d4e2 =
trans34_dexp_dntp
(env0, d3e2, s2e0)
//
val
stmap =
tr34env_stmap_bran(env0)
//
val
((*void*)) =
println!
("\
trans34_dexp: \
aux_if0: then: stmap=\n", stmap)
//
in
  d4exp_stmap(d4e2, stmap)
end (*let*)//end-of-val[d4e2]
//
val () = tr34env_pop_bran(env0)
//
end // end of [local]
//
val opt3 =
(
case+ opt3 of
|
None() =>
None((*void*))
|
Some(d3e3) =>
(
Some(d4e3)) where
{
val () =
tr34env_add_bran(env0)
//
val
d4e3 =
let
val
d4e3 =
trans34_dexp_dntp
(env0, d3e3, s2e0)
//
val
stmap =
tr34env_stmap_bran(env0)
//
val
((*void*)) =
println!
("\
trans34_dexp: \
aux_if0: else: stmap=\n", stmap)
//
in
  d4exp_stmap(d4e3, stmap)
end (*let*)//end-of-val[d4e3]
//
val () = tr34env_pop_bran(env0)
//
} (*where*) // end of [Some]
) : d4expopt // end-of-val[opt3]
//
val
dvmrg =
let
//
val map1 =
(
case-
d4e2.node() of
|
D4Estmap(_, map1) => map1
) : stmap // end of [val]
//
val map2 =
(
case+ opt3 of
|
None() => stmap_nil()
|
Some(d4e3) =>
(
case-
d4e3.node() of
|
D4Estmap(_, map2) => map2)
) : stmap // end of [val]
//
in
  stmap2_dvmrg(map1, map2)
end (*let*) // end-of-val
//
val () =
println!
("\
trans34_dexp: \
aux_if0: dvmrg=\n", dvmrg)
//
val
stmrg =
trans34_dvmrg2_list(env0, dvmrg)
//
in
d4exp_stmrg
(d4e0, stmrg) where
{
val d4e0 =
d4exp_make_node
( loc0
, s2e0
, t2p0, D4Eif0(d4e1, d4e2, opt3))
}
end where
{
//
val () =
println!
("trans34_dexp: aux_if0: d3e0 = ", d3e0)
//
} (*where*) // end-of-fun[aux_if0]

(* ****** ****** *)

fun
aux_cas0
( env0
: !tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ecas0
( knd0
, dmat
, dcls) = d3e0.node()
//
val
dmat =
trans34_dexp(env0, dmat)
val
tmat = dmat.sexp((*void*))
//
val xtv0 =
s2xtv_new_srt
(loc0, t2p0.sort())
val s2e0 = s2exp_xtv(xtv0)
//
val dcls =
trans34_dclaulst_dntp
( env0, dcls, tmat, s2e0 )
//
in
d4exp_make_node
( loc0
, s2e0
, t2p0, D4Ecas0(knd0, dmat, dcls))
end (*let*) // end of [aux_cas0]

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxvar
( env0:
! tr34env
, d4e1: d4exp)
: Option_vt(s2xtv) =
let
val-
D4Evar
(d2v1) = d4e1.node()
in(*in-of-let*)
case+
d2v1.atprf() of
|
None() => None_vt()
|
Some(d2w1) =>
let
//
val
s2at =
tr34env_d2var_get_sexp
( env0, d2w1 )
//
val () =
println!
("auxupdt: auxvar: d2w1 = ", d2w1)
val () =
println!
("auxupdt: auxvar: s2at = ", s2at)
//
in
case+
s2at.node() of
|
S2Eapp
(s2f0, s2es) =>
if
not
(s2exp_is_a0ptr(s2f0))
then None_vt((*void*))
else let
val-
list_cons
(s2e1, s2es) = s2es
val-
list_cons
(s2l1, s2es) = s2es
val xtv1 =
s2xtv_new_srt
(d4e1.loc(), s2e1.sort())
val ((*void*)) =
s2xtv_set_sexp(xtv1, s2e1)
val selt = s2exp_xtv(xtv1)
val s2at = s2exp_at0(selt, s2l1)
in
//
(*
None_vt((*void*))
*)
let
val () =
tr34env_add_dvar_sexp
(env0,d2w1,s2at) in Some_vt(xtv1)
end
//
end
//
|
_(*rest-of-s2exp*) => None_vt(*void*)
//
end
//
end (*let*) // end of [auxvar]

(* ****** ****** *)

and
auxplft
( env0:
! tr34env
, d4e1: d4exp)
: Option_vt(s2xtv) =
let
//
val-
D4Eplft
( dtup
, lab1
, ind2) = d4e1.node()
//
val
opt0 = auxupdt(env0, dtup)
//
in
//
case+ opt0 of
| ~
None_vt() =>
None_vt((*void*))
| ~
Some_vt(xtv0) =>
let
//
val s2e1 =
s2exp_whnfize
(d4e1.sexp((*void*)))
val stup =
s2exp_whnfize
(dtup.sexp((*void*)))
//
val-
S2Etyrec
( knd
, npf
, lses) = stup.node()
//
val xtv1 =
s2xtv_new_srt
(d4e1.loc(), s2e1.sort())
//
val
lses =
auxlses(ind2, lses) where
{
//
typedef lses = labs2explst
//
fun
auxlses
(ind: int, lxs: lses): lses =
(
case+ lxs of
|
list_nil() =>
list_nil((*void*))
|
list_cons
(lx1, lxs) =>
(
if
(ind > 0)
then
list_cons
(lx1, auxlses(ind-1, lxs))
else // ind = 0
(
list_cons(lx1, lxs)) where
{
  val+
  SLABELED(l1, x1) = lx1
  val lx1 =
  SLABELED(l1, s2exp_xtv(xtv1))
} (*where*) // else // end-of-if
) (* end of [list_cons] *)
) (* case *) // end of [auxlses]
}
//
val
stup =
s2exp_make_node
( stup.sort()
, S2Etyrec(knd, npf, lses))
//
in
//
let
val () =
s2xtv_set_sexp
( xtv0, stup ) in Some_vt(xtv1)
end
//
end // end of [Some_vt]
//
end (*let*) // end of [auxplft]

(* ****** ****** *)

and
auxupdt
( env0:
! tr34env
, d4e1: d4exp)
: Option_vt(s2xtv) =
(
case+
d4e1.node() of
|
D4Evar _ => auxvar(env0, d4e1)
//
|
D4Eplft _ => auxplft(env0, d4e1)
//
|
D4Eopny
( d2e1
, s2vs, s2ps) => auxupdt(env0, d2e1)
//
|
_(*rest-of-d4exp*) => None_vt(*void*)
) where
{
  val () =
  println!("auxupdt: d4e1 = " , d4e1)
} (*where*) // end of [auxupdt]

(* ****** ****** *)

in(*in-of-local*)

fun
aux_flat
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Eflat
( d3e1) = d3e0.node()
//
val
d4e1 =
trans34_dexp(env0, d3e1)
//
val
s2e1 = d4e1.sexp((*void*))
//
val
opt1 = auxupdt(env0, d4e1)
//
val
opt2 =
(
case+ opt1 of
| ~
None_vt
() => None(*void*)
| ~
Some_vt
( xtv1 ) => Some(xtv1)
) : Option(s2xtv)
val () =
(
case+ opt2 of
| None() => ()
| Some(xtv1) =>
  s2xtv_set_sexp
  (xtv1, s2exp_used(s2e1))
) : void // end of [val]
//
in
//
d4exp_make_node
( loc0
, s2e1
, t2p0, D4Eflat(d4e1, opt2))
//
end where
{
//
  val () =
  println!
  ("aux_flat: d3e0 = ", d3e0)
//
} (*where*) // end of [aux_flat]

end // end of [aux_flat]

(* ****** ****** *)

fun
aux_talf
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Etalf
( d3e1) = d3e0.node()
//
val
d4e1 =
trans34_dexp(env0, d3e1)
//
val
s2e1 = d4e1.sexp((*void*))
//
val
opt2 =
(
case+
d4e1.node() of
|
D4Eflat
(_, opt2) => opt2 | _ => None()
) : Option(s2xtv) // end-of-val
//
in
d4exp_make_node
( loc0
, s2e1, t2p0, D4Etalf(d4e1, opt2))
end (*let*) // end of [aux_talf]

(* ****** ****** *)

fun
aux_anno
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
//
val-
D3Eanno
( d3e1
, s1e2
, s2e2) = d3e0.node()
//
val t2p1 = d3e1.type()
//
val d4e1 =
(
  trans34_dexp_dntp
  ( env0, d3e1, s2e2 )
)
//
in
d4exp_make_node
( loc0
, s2e2, t2p1
, D4Eanno(d4e1, s1e2, s2e2))
end (*let*) // end of [aux_anno]

(* ****** ****** *)

in(*in-of-local*)

implement
trans34_dexp
( env0, d3e0) =
let
//
val () =
println!
("trans34_dexp: d3e0 = ", d3e0)
//
in
//
case+
d3e0.node() of
//
| D3Ei00 _ => auxi00(d3e0)
| D3Eb00 _ => auxb00(d3e0)
| D3Ec00 _ => auxc00(d3e0)
//
| D3Eint _ => auxint(d3e0)
| D3Ebtf _ => auxbtf(d3e0)
| D3Echr _ => auxchr(d3e0)
//
| D3Evar _ => auxvar(env0, d3e0)
| D3Ekvar _ => auxkvar(env0, d3e0)
//
| D3Efcon _ => auxfcon(env0, d3e0)
| D3Efcst _ => auxfcst(env0, d3e0)
//
| D3Etcon _ => auxtcon(env0, d3e0)
| D3Etcst _ => auxtcst(env0, d3e0)
//
| D3Etimp _ => auxtimp(env0, d3e0)
//
| D3Esap0 _ => auxsap0(env0, d3e0)
//
| D3Edapp _ => auxdapp(env0, d3e0)
//
| D3Eplft _ => auxplft(env0, d3e0)
//
| D3Elet
  (dcls, d3e1) => aux_let(env0, d3e0)
| D3Ewhere
  (d3e1, dcls) => aux_where(env0, d3e0)
//
| D3Eseqn _ => aux_seqn(env0, d3e0)
//
|
D3Eassgn _ => aux_assgn(env0, d3e0)
//
| D3Eif0
  ( _cond_
  , _then_
  , _else_) => aux_if0(env0, d3e0)
//
| D3Ecas0 _ => aux_cas0(env0, d3e0)
//
| D3Eflat _ => aux_flat(env0, d3e0)
| D3Etalf _ => aux_talf(env0, d3e0)
//
| D3Eanno _ => aux_anno(env0, d3e0)
//
| _ (*rest-of-d3exp*) => d4exp_none1(d3e0)
//
end (*let*) // end of [trans34_dexp]

end // end of [local]

(* ****** ****** *)
//
implement
trans34_dexpopt
( env0, opt0 ) =
(
case+ opt0 of
| None() => None()
| Some(d3e0) =>
  Some(trans34_dexp(env0, d3e0))
)
//
implement
trans34_dexplst
(  env0, d3es  ) =
(
list_vt2t
(
list_map<d3exp><d4exp>(d3es)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3exp><d4exp>
  (d3e0) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
d4e0 = trans34_dexp(env0, d3e0)
//
in
let
prval () = $UN.cast2void(env0) in d4e0
end
end // list_map$fopr
} (* end of [trans34_dexplst] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_if0
( env0:
! tr34env
, d3e0: d3exp
, s2e0: s2exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Eif0
( d3e1
, d3e2
, opt3) = d3e0.node()
//
val
d4e1 =
trans34_dexp(env0, d3e1)
//
local
val () =
tr34env_add_bran(env0)
in(*in-of-local*)
//
val
d4e2 =
let
val
d4e2 =
trans34_dexp_dntp
(env0, d3e2, s2e0)
//
val
stmap =
tr34env_stmap_bran(env0)
//
val
((*void*)) =
println!
("\
trans34_dexp_dntp: \
aux_if0: then: stmap=\n", stmap)
//
in
  d4exp_stmap(d4e2, stmap)
end (*let*)//end-of-val[d4e2]
//
val () = tr34env_pop_bran(env0)
//
end // end of [local]
//
val
opt3 =
(
case+ opt3 of
|
None() => None()
|
Some(d3e3) =>
Some(d4e3) where
{
val () =
tr34env_add_bran(env0)
//
val
d4e3 =
let
val
d4e3 =
trans34_dexp_dntp
(env0, d3e3, s2e0)
//
val
stmap =
tr34env_stmap_bran(env0)
//
val
((*void*)) =
println!
("\
trans34_dexp_dntp: \
aux_if0: else: stmap=\n", stmap)
//
in
  d4exp_stmap(d4e3, stmap)
end (*let*)//end-of-val[d4e3]
//
val () = tr34env_pop_bran(env0)
//
} (*where*) // end of [Some]
) : d4expopt // end-of-val[opt3]
//
val
dvmrg =
let
val map1 =
(
case-
d4e2.node() of
|
D4Estmap(_, map1) => map1
) : stmap // end of [val]
val map2 =
(
case+ opt3 of
|
None() => stmap_nil()
|
Some(d4e3) =>
(
case-
d4e3.node() of
|
D4Estmap(_, map2) => map2)
) : stmap // end of [val]
in
  stmap2_dvmrg(map1, map2)
end (*end*) // end of [val]
//
val () =
println!
("\
trans34_dexp_dntp: \
aux_if0: dvmrg=\n", dvmrg)
//
(*
val () =
fdvmrg(env0, dvmrg) where
{
fun
fdvmrg
( env0:
! tr34env
, xtts: List0(dvmrg2)): void =
(
case+ xtts of
|
list_nil() => ()
|
list_cons
(xtt0, xtts) =>
let
//
val+
DVMRG2
( d2v0
, opt1
, opt2) = xtt0
val
ms2e =
tr34env_d2var_get_msexp
  (env0, d2v0)
//
in
fdvmrg(env0, xtts) where  
{
val () =
println!
("aux_if0: fdvmrg: d2v0 = ", d2v0)
val () =
println!
("aux_if0: fdvmrg: opt1 = ", opt1)
val () =
println!
("aux_if0: fdvmrg: opt2 = ", opt2)
val () =
println!
("aux_if0: fdvmrg: ms2e = ", ms2e)
}
end // end of [list_cons]
) (* end of [fdvmerg] *)
} (*where*) // end-of-val[()]
*)
//
val
stmrg =
trans34_dvmrg2_list(env0, dvmrg)
//
in
d4exp_stmrg
(d4e0, stmrg) where
{
  val
  d4e0 =
  d4exp_make_node
  ( loc0
  , s2e0
  , t2p0, D4Eif0(d4e1, d4e2, opt3))
}
end where
{
//
val () =
println!
("trans34_dexp_dntp: aux_if0: d3e0 = ", d3e0)
//
} (*where*) // end-of-fun[aux_if0]

(* ****** ****** *)

fun
aux_cas0
( env0
: !tr34env
, d3e0: d3exp
, s2e0: s2exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ecas0
( knd0
, dmat
, dcls) = d3e0.node()
//
val
dmat =
trans34_dexp(env0, dmat)
//
val
tmat = dmat.sexp((*void*))
//
val
dcls =
trans34_dclaulst_dntp
( env0, dcls, tmat, s2e0 )
//
val
dvmrg = dclaulst_dvmrg(dcls)
//
val () =
println!
("\
trans34_dexp_dntp: \
aux_cas0: dvmrg=\n", dvmrg)
//
val
stmrg =
trans34_dvmrgs_list(env0, dvmrg)
//
in
d4exp_stmrg
(d4e0, stmrg) where
{
  val
  d4e0 =
  d4exp_make_node
  ( loc0
  , s2e0
  , t2p0, D4Ecas0(knd0, dmat, dcls))
}
end where
{
//
val () =
println!
("trans34_dexp_dntp: aux_cas0: d3e0 = ", d3e0)
//
} (*where*) // end-of-fun[aux_cas0]

(* ****** ****** *)

in(*in-of-local*)

implement
trans34_dexp_dntp
( env0
, d3e0, s2e0) =
(
case+
d3e0.node() of
//
|D3Eif0 _ =>
aux_if0(env0, d3e0, s2e0)
|
D3Ecas0 _ =>
aux_cas0(env0, d3e0, s2e0)
//
|
_ (* else-of-d3exp *) =>
let
val
d4e0 =
trans34_dexp(env0, d3e0)
in
//
let
//
val
d4e0 =
d4exp_opny_env(env0, d4e0)
//
val () =
let
val sopn = d4e0.sexp()
in
s2exp_tsubize_env(env0, sopn, s2e0)
end
//
in
  d4exp_tcast( d4e0, s2e0 )
end
//
end // end of [else-of-d3exp]
//
) where
{
//
val () =
println!
("trans34_dexp_dntp: d3e0 = ", d3e0)
val () =
println!
("trans34_dexp_dntp: s2e0 = ", s2e0)
//
} (*where*) // end of [trans34_dexp_dntp]

end // end of [local]

(* ****** ****** *)

implement
trans34_dexplst_dnts
( env0
, d3es, s2es) =
(
auxlst
(env0, d3es, s2es)) where
{
fun
auxlst
( env0
: !tr34env
, d3es: d3explst
, s2es: s2explst): d4explst =
(
case+ d3es of
|
list_nil() =>
list_nil()
|
list_cons
(d3e0, d3es) =>
(
case+ s2es of
|
list_nil() =>
let
val s2e0 =
the_s2exp_none0
val d4e0 =
trans34_dexp_dntp
(env0, d3e0, s2e0)
in
list_cons
(d4e0, auxlst(env0, d3es, s2es))
end
|
list_cons(s2e0, s2es) =>
let
val d4e0 =
trans34_dexp_dntp
(env0, d3e0, s2e0)
in
list_cons
(d4e0, auxlst(env0, d3es, s2es))
end
)
) (* end of [auxlst] *)
} (* end of [trans34_dexplst_dnts] *)

(* ****** ****** *)

implement
trans34_dgpat_dntp
( env0
, dgpt, tmat ) =
let
//
val
loc0 = dgpt.loc()
//
in
//
case-
dgpt.node() of
|
D3GPATpat(d3p1) =>
let
val d4p1 =
trans34_dpat_dntp
( env0, d3p1, tmat )
in
  d4gpat_make_node
  ( loc0, D4GPATpat(d4p1) )
end
(*
|
D3GPATgua(d3p1, d3gs) =>
*)
//
end (*let*) // trans34_dgpat_dntp

(* ****** ****** *)

implement
trans34_dclau_dntp
( env0
, d3cl, tmat, tres) =
let
//
val
loc0 = d3cl.loc()
//
val () =
tr34env_add_bran(env0)
//
in(*in-of-let*)
//
case+
d3cl.node() of
|
D3CLAUpat(dgpt) =>
let
val
dgpt =
trans34_dgpat_dntp
( env0, dgpt, tmat )
in
d4clau_make_node
(loc0, D4CLAUpat(dgpt))
end
|
D3CLAUexp(dgpt, d3e2) =>
let
//
val
dgpt =
trans34_dgpat_dntp
( env0, dgpt, tmat )
//
val () =
tr34env_add_let1(env0)
//
val
d4e2 =
trans34_dexp_dntp(env0, d3e2, tres)
//
val
stloc =
let
val
d2vs =
d4gpat_get_dlocs(dgpt)
val
stmap =
tr34env_stmap_let1(env0)
//
val
((*void*)) =
println!
("trans34_dclau_dntp: dlocs = ", d2vs)
val
((*void*)) =
println!
("trans34_dclau_dntp: stmap(all)=\n", stmap)
//
in
tr34env_add_denvs
( env0 , d2vs , stmap ) where
{
val () = tr34env_pop_let1(env0)
} (*where*) // end-of-val
end (*let*) // end-of-val[stloc]
//
val
((*void*)) =
println!
("trans34_dclau_dntp: stmap(loc)=\n", stloc)
//
val
stmap =
tr34env_stmap_bran(env0)
//
in
//
d4clau_make_node
( loc0
, D4CLAUexp
  (dgpt, d4e2, stmap)) where
{
//
val () = tr34env_pop_bran(env0)
//
} (*where*) // [d4clau_make_node]
//
end (*let*) // end of [D3CLAUexp]
//
end (*let*) // [trans34_dclau_dntp]

(* ****** ****** *)

implement
trans34_dclaulst_dntp
( env0
, dcls, tmat, tres) =
list_vt2t
(
list_map<d3clau><d4clau>(dcls)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3clau><d4clau>
  (d3cl) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
//
val
d4cl =
trans34_dclau_dntp
( env0,  d3cl,  tmat,  tres )
//
in
let
prval () = $UN.cast2void(env0) in d4cl
end
end
} (* end of [trans34_dclaulst_dntp] *)

(* ****** ****** *)

local

(* ****** ****** *)
fun
auxwth
( d2v
: d2var): d2var =
let
//
val sym = d2v.sym()
val nam = sym.name()
val nam =
strptr2string
(string_append("@", nam))
//
val sym = symbol_make(nam)
//
in
  d2var_new2(d2v.loc(), sym)
end (*let*) // end of [auxwth]
(* ****** ****** *)
fun
auxaft
( d3p0
: d3pat)
: Option_vt(s2exp) =
(
case+
d3p0.node() of
|
D3Panno
( d3p1
, s1e2, s2e2) =>
auxs2e2(s2e2) where
{
fun
auxs2e2
( s2e2
: s2exp)
: Option_vt(s2exp) =
(
case+
s2e2.node() of
//
|
S2Earg
(knd0, sarg) => Some_vt(sarg)
|
S2Eatx
(sbef, saft) => Some_vt(saft)
//
|
_ (*rest-of-s2exp*) => None_vt()
//
)
}
| _ (*non-D4Panno*) => None_vt()
)
(* ****** ****** *)
fun
iscbrf
( d3p0
: d3pat): bool =
(
case+
d3p0.node() of
|
D3Panno
( d3p1
, s1e2, s2e2) =>
(
case+
d3p1.node() of
|
D3Pvar _ =>
auxs2e2(s2e2) where
{
fun
auxs2e2
( s2e2
: s2exp): bool =
(
case+
s2e2.node() of
//
|
//
// HX: CBRF = ~1
S2Earg
(knd, _) => (knd < 0)
//
|
S2Eatx
(s2e2, _) => auxs2e2(s2e2)
//
|
_(*else-of-s2exp*) => false
)
}
| _ (*non-D3Pvar*) => false
)
| _ (*non-D3Panno*) => false
) where
{
//
(*
val () =
println!
( "iscbrf: d3p0 = ", d3p0 )
*)
//
} (*where*) // end of [iscbrf]
(* ****** ****** *)
fun
auxcbrf
( env0:
! tr34env
, d3p0
: d3pat
, s2e1
: s2exp): d4pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val-
D3Pvar
(d2v0) = d3p0.node()
//
val
s2v0 =
s2var_new
(the_sort2_addr)
val
d2w1 = auxwth(d2v0)
//
val
s2l0 = s2exp_var(s2v0)
val () =
d2var_set_saddr(d2v0, s2l0)
val ( ) =
d2var_set_atprf(d2v0, d2w1)
//
val
s2at = s2exp_at0(s2e1, s2l0)
//
in
d4pat_make_node
( loc0
, s2e1, t2p0, D4Pvar(d2v0)) where
{
val () =
tr34env_add_dvar_sexp(env0, d2w1, s2at)
}
end where
{
// (*
val () =
println!("auxcbrf: d3p0 = ", d3p0)
// *)
} (*where*) // end of [auxcbrf]
(* ****** ****** *)

fun
auxarg0
( env0:
! tr34env
, d3p0
: d3pat): d4pat =
let
//
val s2e1 =
(
case+
d3p0.node() of
|
D3Panno
( d3p1
, s1e2, s2e2) =>
auxs2e2(s2e2) where
{
fun
auxs2e2
( s2e2
: s2exp): s2exp =
(
case+
s2e2.node() of
//
|
S2Earg
(knd0, sarg) => sarg
|
S2Eatx
( sbef
, saft) => auxs2e2(sbef)
//
|
_(*else-of-s2exp*) => s2e2
) (* end of [auxs2e2] *)
} (*whr*)// end-of-D3Panno
|
_(* non-D3Panno *) =>
let
val t2p0 = d3p0.type()
in
sexpize_env(env0, t2p0) end
) : s2exp // end of [val]
//
val d3p1 =
(
case+
d3p0.node() of
| D3Panno
  (d3p1, s1e2, s2e2) => d3p1
| _(* non-D3Panno *) => d3p0
) : d3pat // end of [val]
//
in(*in-of-let*)
//
if
iscbrf(d3p0)
then
let
val
d4p1 =
auxcbrf
(env0, d3p1, s2e1)
val
sopt = auxaft(d3p0)
in
//
case+ sopt of
| ~
None_vt() => d4p1
| ~
Some_vt(saft) =>
let
val-
D4Pvar(d2v1) = d4p1.node()
val-Some(d2w1) = d2v1.atprf()
val-Some(s2l1) = d2v1.saddr()
val s2at = s2exp_at0(saft, s2l1)
val () =
d2var_set_msexp(d2w1, s2at) in d4p1
end // [Some_vt]
//
end // end of [then]
else
let
val
d4p1 =
trans34_dpat_dntp
(env0, d3p1, s2e1)
val
sopt = auxaft(d3p0)
in
//
case+ sopt of
| ~
None_vt() => d4p1
| ~
Some_vt(saft) =>
let
val-
D4Pvar(d2v1) = d4p1.node()
val () =
d2var_set_msexp(d2v1, saft) in d4p1
end // [Some_vt]
//
end // end of [else]
//
end (*let*) // end of [auxarg0]
(* ****** ****** *)
fun
auxargs
( env0:
! tr34env
, d3ps
: d3patlst): d4patlst =
(
case+ d3ps of
|
list_nil() =>
list_nil()
|
list_cons
(d3p0, d3ps) =>
(
list_cons(d4p0, d4ps)
) where
{
  val d4p0 = auxarg0( env0, d3p0 )
  val d4ps = auxargs( env0, d3ps )
}
) (*where*) // end of [auxargs]
(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
trans34_farg
( env0, f3a0 ) =
let
val
loc0 = f3a0.loc()
in
case+
f3a0.node() of
//
|
F3ARGsome_dyn
(npf1, d3ps) =>
(
f4arg_make_node
( loc0
, F4ARGsome_dyn(npf1, d4ps))
) where
{
  val
  d4ps = auxargs(env0, d3ps)
} (* F3ARGsome_dyn *)
//
|
F3ARGsome_sta
(s2vs, s2ps) =>
(
f4arg_make_node
( loc0
, F4ARGsome_sta(s2vs, s2ps))
)
//
|
F3ARGsome_met(s2es) =>
(
 f4arg_make_node
 (loc0, F4ARGsome_met(s2es))
)
//
|
_(*non-F3ARGsome_dyn*) =>
(
 f4arg_make_node(loc0, F4ARGnone3(f3a0))
)
end (* end of [trans34_farg] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
trans34_farglst
( env0, f3as ) =
list_vt2t
(
list_map<f3arg><f4arg>(f3as)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<f3arg><f4arg>
  (f3a0) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
//
val
f4a0 = trans34_farg(env0, f3a0)
//
in
let
prval () = $UN.cast2void(env0) in f4a0
end
end
} (* end of [trans34_farglst] *)
//
(* ****** ****** *)
//
implement
trans34_farglst_s2exp
( env0
, f3as, s2f0, sres) =
(
case+ f3as of
|
list_nil() =>
let
val () =
(sres :=
 EFFS2EXPsome(s2f0)) in list_nil()
end // end of [list_nil]
|
list_cons
(f3a1, f3as) =>
(
case+
f3a1.node() of
//
(*
HX-2021-03-15:
Should this be handled?
*)
|
F3ARGsome_sta
(svs1, sps1) =>
(
case+
s2f0.node() of
|
S2Euni
(svs2, sps2, s2f1) =>
let
val
s2vs =
auxs2vs(svs1, svs2)
val
tsub =
auxtsub(svs1, svs2)
(*
HX-2021-03-15:
[sps1] is discarded!
*)
val
s2ps =
s2explst_subst_svarlst
( sps2, svs2, tsub )
val f4a1 = 
f4arg_make_node
(loc1, F4ARGsome_sta(s2vs, s2ps))
val f4as = 
trans34_farglst_s2exp(env0, f3as, s2f1, sres)
in
  list_cons(f4a1, f4as)
end where
{
//
val
loc1 = f3a1.loc()
//
fun
auxs2vs
( svs1
: s2varlst
, svs2
: s2varlst): s2varlst =
(
case+ svs2 of
|
list_nil() =>
list_nil()
|
_(*list_cons*) =>
(
case+ svs1 of
|
list_nil() => svs2
|
list_cons(s2v1, svs1) =>
let
  val-
  list_cons(_, svs2) = svs2
in
  list_cons
  (s2v1, auxs2vs(svs1, svs2))
end
)
) (* end of [auxs2vs] *)
fun
auxtsub
( svs1
: s2varlst
, svs2
: s2varlst): s2explst =
(
case+ svs2 of
|
list_nil() => list_nil()
|
list_cons
(s2v2, svs2) =>
(
case+ svs1 of
|
list_nil() =>
let
val
s2e1 = s2exp_var(s2v2)
in
list_cons
(s2e1, auxtsub(svs1, svs2))
end
|
list_cons
(s2v1, svs1) =>
let
val
s2t1 = s2v1.sort()
val
s2t2 = s2v2.sort()
val
s2e1 = s2exp_var(s2v1)
val
s2e1 =
(
if
s2t1 <= s2t2
then s2e1 else
s2exp_cast
(loc1, s2e1, s2t2)): s2exp
in
list_cons(s2e1, auxtsub(svs1, svs2))
end
)
) (* auxtsub *)
} (* end-of-S2Euni *)
|
_ (* rest-of-s2exp *) =>
let
val
//
loc1 = f3a1.loc()
//
val f4a1 = 
f4arg_make_node(loc1, F4ARGnone3(f3a1))
val f4as = 
trans34_farglst_s2exp(env0, f3as, s2f0, sres)
//
in
  list_cons(f4a1, f4as)
end
) (*where*) // end of [F3ARGsome_sta]
//
|
F3ARGsome_dyn
(npf1, d3ps) =>
(
auxdyn(env0, s2f0, sres)
) where
{
fun
auxdyn
( env0:
! tr34env
, s2f0: s2exp
, sres
: &effs2expopt >> _): f4arglst =
(
case
s2f0.node() of
//
|
S2Euni
(s2vs, s2ps, s2f1) =>
let
val f4a1 = 
f4arg_make_node
( f3a1.loc()
, F4ARGsome_sta(s2vs, s2ps))
in
  list_cons
  (f4a1, auxdyn(env0, s2f1, sres))
end
//
|
S2Efun
( fclo
, npf2, s2es, s2f1) =>
//
(
list_cons(f4a1, f4as)) where
{
//
(*
HX-2021-03-15: check?
val () = assert(npf1 = npf2)
*)
//
val
d4ps =
trans34_dpatlst_dnts
( env0, d3ps, s2es )
val f4a1 = 
f4arg_make_node
( f3a1.loc()
, F4ARGsome_dyn(npf1, d4ps) )
val f4as = 
trans34_farglst_s2exp(env0, f3as, s2f1, sres)
} (* end-of-S2Efun *)
//
|
_ (* rest-of-s2exp *) =>
(
  list_cons(f4a1, f4as)) where
{
val f4a1 = 
f4arg_make_node
(f3a1.loc(), F4ARGnone3(f3a1))
val f4as = 
trans34_farglst_s2exp(env0, f3as, s2f0, sres)
}
)
} (*where*) // end of [F3ARGsome_dyn]
//
| _(* rest-of-f3arg *) =>
(
list_cons(f4a1, f4as)
) where
{
val f4a1 = 
f4arg_make_node
(f3a1.loc(), F4ARGnone3(f3a1))
val f4as = 
trans34_farglst_s2exp(env0, f3as, s2f0, sres)
}
)
) (* end of [trans34_farglst_s2exp] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_valdecl
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cvaldecl
( tok0
, mopt, v3ds) = d3cl.node()
//
val
v4ds =
trans34_valdeclist(env0, v3ds)
//
val () =
println!
("aux_valdecl: v4ds = ", v4ds)
//
in
d4ecl_make_node
(loc0, D4Cvaldecl(tok0, mopt, v4ds))
end (*let*) // end of [aux_valdecl]

(* ****** ****** *)

fun
aux_vardecl
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cvardecl
( tok0
, mopt, v3ds) = d3cl.node()
//
val
v4ds =
trans34_vardeclist(env0, v3ds)
//
val () =
println!
("aux_vardecl: v4ds = ", v4ds)
//
in
d4ecl_make_node
(loc0, D4Cvardecl(tok0, mopt, v4ds))
end (*let*) // end of [aux_vardecl]

(* ****** ****** *)

fun
aux_fundecl
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cfundecl
( tok0
, mopt
, tqas, f3ds) = d3cl.node()
//
(*
val () =
println!
("aux_fundecl: f3ds = ", f3ds)
*)
//
val
f4ds =
trans34_fundeclist(env0, f3ds)
//
// (*
val () =
println!
("aux_fundecl: f4ds = ", f4ds)
// *)
//
in
d4ecl_make_node
( loc0
, D4Cfundecl(tok0, mopt, tqas, f4ds))
end (*let*) // end of [aux_fundecl]

(* ****** ****** *)

in(*in-of-local*)

implement
trans34_decl
( env0, d3cl) =
let
//
val () =
println!
("trans34_decl: d3cl = ", d3cl)
//
in(*in-of-local*)
//
case+
d3cl.node() of
//
|
D3Cvaldecl _ =>
aux_valdecl(env0, d3cl)
|
D3Cvardecl _ =>
aux_vardecl(env0, d3cl)
//
|
D3Cfundecl _ =>
aux_fundecl(env0, d3cl)
//
|
_(*rest-of-d3ecl*) =>
let
  val
  loc0 = d3cl.loc()
in
  d4ecl_make_node(loc0, D4Cnone1(d3cl))
end
//
end // end of [trans34_decl]

end // end of [local]

(* ****** ****** *)
//
implement
trans34_declopt
( env0, opt0 ) =
(
case+ opt0 of
| None() => None()
| Some(d3cl) =>
  Some(trans34_decl(env0, d3cl))
)
//
implement
trans34_declist
(  env0, dcls  ) =
(
list_vt2t
(
list_map<d3ecl><d4ecl>(dcls)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3ecl><d4ecl>
  (d3cl) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
d4cl = trans34_decl(env0, d3cl)
//
in
let
prval () = $UN.cast2void(env0) in d4cl
end
end // list_map$fopr
} (* end of [trans34_declist] *)
//
(* ****** ****** *)
//
(*
HX-2021-01-24:
For auxiliary trans34-functions
*)
//
(* ****** ****** *)

implement
trans34_fundecl
( env0, f3d0 ) =
let
//
val+
F3UNDECL
( rcd ) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val d2c = rcd.d2c
val a2g = rcd.a2g
//
val () =
tr34env_add_fun0(env0)
//
val () =
trans34_f3undecl_set_sexp(env0, f3d0)
//
// HX-2021-05-30:
val () = // for a template fun!
let
val s2f0 = nam.sexp()
in
tr34env_add_dvar_sexp(env0, nam, s2f0)
end // end of [val]
//
(*
val () =
println!
("trans34_fundecl: nam = ", nam)
val () =
println!
("trans34_fundecl: nam.tqas = ", nam.tqas())
val () =
println!
("trans34_fundecl: nam.sexp = ", nam.sexp())
val () =
println!
("trans34_fundecl: nam.type = ", nam.type())
*)
(*
val () =
println!
("trans34_fundecl: d2c = ", d2c)
val () =
println!
("trans34_fundecl: d2c.tqas = ", d2c.tqas())
val () =
println!
("trans34_fundecl: d2c.sexp = ", d2c.sexp())
val () =
println!
("trans34_fundecl: d2c.type = ", d2c.type())
*)
//
var
sres:
effs2expopt = rcd.res
//
val
a4g =
(
case+
rcd.a3g of
|
None() =>
None(*void*)
|
Some(f3as) =>
(
case+
rcd.wtp of
|
None
((*void*)) =>
Some
(
trans34_farglst(env0, f3as))
|
Some(s2f0) =>
Some
(
trans34_farglst_s2exp
(env0 , f3as , s2f0 , sres))
)
) : f4arglstopt // end-of-val
//
val
stmap = tr34env_stmap_fun0(env0)
val
((*void*)) =
println!
("trans34_fundecl: stmap(bef)=\n", stmap)
//
val
def = 
(
case
rcd.def of
|
None() => None()
|
Some(d3e0) =>
(
case+ sres of
|
EFFS2EXPnone() =>
let
val s2e0 =
sexpize_env
(env0, rcd.rtp)
in
Some
(
trans34_dexp_dntp
(env0, d3e0, s2e0))
end
|
EFFS2EXPsome(s2e0) =>
Some
(
trans34_dexp_dntp
(env0, d3e0, s2e0))
)
) : d4expopt
//
val
stmap =
tr34env_stmap_fun0(env0)
//
val
((*void*)) =
println!
("trans34_fundecl: stmap(aft)=\n", stmap)
//
in(*in-of-let*)
//
let
val
((*void*)) = tr34env_pop_fun0(env0)
in
F4UNDECL@{
  loc= loc
//
, nam= nam
, d2c= d2c
//
, a2g= a2g
, a4g= a4g, res= sres
//
, def= def
//
, rtp= rcd.rtp, wtp= rcd.wtp, ctp= rcd.ctp
//
} (* end of [F4UNDECL] *)
end // end of [let]
//
end // end of [trans34_fundecl]

(* ****** ****** *)
//
implement
trans34_fundeclist
(  env0, f3ds  ) =
(
list_vt2t
(
list_map<f3undecl><f4undecl>(f3ds)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<f3undecl><f4undecl>
  (f3d0) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
f4d0 = trans34_fundecl(env0, f3d0)
//
in
let
prval () = $UN.cast2void(env0) in f4d0
end
end // list_map$fopr
//
} (*where*) // end of [trans34_fundeclist]
//
(* ****** ****** *)
//
implement
trans34_valdecl
( env0, v3d0 ) =
let
//
val+
V3ALDECL(rcd) = v3d0
//
val loc = rcd.loc
val d3p = rcd.pat
val def = rcd.def
//
val def =
(
case+ def of
|
None() => None()
|
Some(d3e) =>
Some
(trans34_dexp(env0, d3e))
) : d4expopt // end-of-val
//
val d4p =
(
case+ def of
|
None() =>
trans34_dpat(env0, d3p)
|
Some(d4e) =>
trans34_dpat_dntp
(env0, d3p, d4e.sexp())): d4pat
//
in(*in-of-let*)
//
V4ALDECL@{
  loc= loc
, pat= d4p
, def= def, wtp= rcd.wtp
//
} (* end of [V4ALDECL] *)
//
end // end of [trans34_valdecl]
//
(* ****** ****** *)
//
local

fun
auxwth
( d2v
: d2var
, wth
: d2varopt): d2var =
(
case+ wth of
|
Some(d2w) => d2w
|
None((*void*)) => 
let
//
val sym = d2v.sym()
val nam = sym.name()
val nam =
strptr2string
(string_append("@", nam))
//
val sym = symbol_make(nam)
//
in
  d2var_new2(d2v.loc(), sym)
end
) (* end of [auxwth] *)

in(*in-of-local*)
//
implement
trans34_vardecl
( env0, v3d0 ) =
let
//
val+
V3ARDECL(rcd) = v3d0
//
val loc = rcd.loc
val d2v = rcd.d2v
val wth = rcd.wth
val res = rcd.res
val ini = rcd.ini
//
val s2v =
s2var_new
(the_sort2_addr)
val s2l = s2exp_var(s2v)
val ( ) =
d2var_set_saddr(d2v, s2l)
//
val d2w =
auxwth(d2v, wth)
val ( ) =
d2var_set_atprf(d2v, d2w)
//
val ini =
(
case+ ini of
|
None() => None()
|
Some(d3e) =>
Some
(trans34_dexp(env0, d3e))
) : d4expopt // end-of-val
//
val s2e =
(
case+ res of
|
Some(s2e) => s2e
|
None((*void*)) =>
let
val
t2p = d2v.type()
val-
T2Plft(t2p) = t2p.node()
in
//
t2ype_sexpize_env
( env0, t2ype_eval(t2p) )
//
end): s2exp // end-of-val
//
val () =
(
case+ res of
|
None() => ()
|
Some(s2e) =>
let
val
s2at =
s2exp_at0(s2e, s2l)
in
d2var_set_msexp(d2w, s2at)
end) : void // end-of-val
//
val () =
println!
("trans34_vardecl: d2w = ", d2w)
val () =
println!
("trans34_vardecl: msexp = ", d2w.msexp())
//
in(*in-of-let*)
//
V4ARDECL@{
  loc= loc
, d2v= d2v
, d2w= d2w
, s2e= s2e
, wth= wth
, res= res, ini= ini
//
} where
{
//
val () =
tr34env_add_dvar(env0, d2w)
//
val () =
(
case+ ini of
|
None() =>
let
val
s2e = s2exp_top(s2e)
val
s2at = s2exp_at0(s2e, s2l)
in
tr34env_add_dvar_sexp(env0, d2w, s2at)
end
|
Some(d4e) =>
let
val s2e = d4e.sexp()
val
s2at = s2exp_at0(s2e, s2l)
in
tr34env_add_dvar_sexp(env0, d2w, s2at)
end
) : void // end of [val]
//
} (*where*) // end of [V4ALDECL]
//
end (*let*) // end of [trans34_vardecl]
//
end // end of [local]
//
(* ****** ****** *)
//
implement
trans34_valdeclist
(  env0, v3ds  ) =
(
list_vt2t
(
list_map<v3aldecl><v4aldecl>(v3ds)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<v3aldecl><v4aldecl>
  (v3d0) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
v4d0 = trans34_valdecl(env0, v3d0)
//
in
let
prval () = $UN.cast2void(env0) in v4d0
end
end // list_map$fopr
//
} (*where*)//end of [trans34_valdeclist]
//
(* ****** ****** *)
//
implement
trans34_vardeclist
(  env0, v3ds  ) =
(
list_vt2t
(
list_map<v3ardecl><v4ardecl>(v3ds)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<v3ardecl><v4ardecl>
  (v3d0) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
v4d0 = trans34_vardecl(env0, v3d0)
//
in
let
prval () = $UN.cast2void(env0) in v4d0
end
end // list_map$fopr
//
} (*where*)//end of [trans34_vardeclist]
//
(* ****** ****** *)

implement
trans34_dvmrg2_list
  (env0, xtts) =
(
stmrg_make(res0)) where
{
//
fun
auxmain
( env0
: !tr34env
, xtts
: List0(dvmrg2)
, res0
: List0_vt(dvcast)
)
: List0_vt(dvcast) =
(
case+ xtts of
|
list_nil() =>
list_vt_reverse(res0)
|
list_cons
(xtt0, xtts) =>
let
val+
DVMRG2
( d2v0
, opt1
, opt2) = xtt0
//
val
opt0 = d2v0.msexp()
val
s2e0 =
(
case+ opt0 of
|
Some
(s2e0) => s2e0
|
None
((*void*)) =>
tr34env_d2var_get_sexp
(env0, d2v0)
) : s2exp // end-of[s2e0]
//
val res0 =
(
case+ opt1 of
|
None() =>
(
case+ opt0 of
|
None _ => res0
|
Some _ =>
let
  val
  s2e1 =
  tr34env_d2var_get_sexp
  (env0, d2v0)
in
list_vt_cons
(DVCAST(d2v0, s2e1, s2e0), res0)
end
)
|
Some(s2e1) =>
(
list_vt_cons
(DVCAST(d2v0, s2e1, s2e0), res0)
)
) : List0_vt(dvcast) // end-of-val
//
val res0 =
(
case+ opt2 of
|
None() =>
(
case+ opt0 of
|
None _ => res0
|
Some _ =>
let
  val
  s2e2 =
  tr34env_d2var_get_sexp
  (env0, d2v0)
in
list_vt_cons
(DVCAST(d2v0, s2e2, s2e0), res0)
end
)
|
Some(s2e2) =>
(
list_vt_cons
(DVCAST(d2v0, s2e2, s2e0), res0)
)
) : List0_vt(dvcast) // end-of-val
//
in
  auxmain( env0, xtts, res0 )
end // end of [list_cons]
) (*case*) (* end-of-fun[auxmain] *)
//
val
res0 = list_vt_nil((*void*))
val
res0 =
list_vt2t(auxmain(env0, xtts, res0))
//
} (*where*)//end of [trans34_dvmrg2_list]

(* ****** ****** *)

implement
trans34_dvmrgs_list
  (env0, xtss) =
(
stmrg_make(res0)) where
{
//
fun
auxmain
( env0
: !tr34env
, xtss
: List0(dvmrgs)
, res0
: List0_vt(dvcast)
)
: List0_vt(dvcast) =
(
case+ xtss of
|
list_nil() =>
list_vt_reverse(res0)
|
list_cons
(xts0, xtss) =>
let
//
val+
DVMRGS
(d2v0, opts) = xts0
//
val
opt0 = d2v0.msexp()
val
s2e0 =
(
case+ opt0 of
|
Some
(s2e0) => s2e0
|
None
((*void*)) =>
tr34env_d2var_get_sexp
(env0, d2v0)
) : s2exp // end-of[s2e0]
//
fun
auxlst
( env0
: !tr34env
, opts
: List0(s2expopt)
, res0
: List0_vt(dvcast)
)
: List0_vt(dvcast) =
(
case+ opts of
|
list_nil
((*void*)) => res0
|
list_cons
(opt1, opts) =>
(
auxlst(env0, opts, res0)
) where
{
val res0 =
(
case+ opt1 of
|
None() =>
let
  val
  s2e1 =
  tr34env_d2var_get_sexp
  (env0, d2v0)
in
case+ opt0 of
| None _ => res0
| Some _ =>
  list_vt_cons
  (DVCAST(d2v0, s2e1, s2e0), res0)
end
|
Some(s2e1) =>
(
  list_vt_cons
  (DVCAST(d2v0, s2e1, s2e0), res0)
)
) : List0_vt(dvcast) // end-of[res0]
}
)
//
in
let
val
res0 =
auxlst(env0, opts, res0)
//
in
  auxmain(env0, xtss, res0)
end
end
) (*case*) // end-of-fun[auxmain]
//
val
res0 = list_vt_nil((*void*))
val
res0 =
list_vt2t(auxmain(env0, xtss, res0))
} (*where*)//end of [trans34_dvmrgs_list]

(* ****** ****** *)

(* end of [xats_trans34_dynexp.dats] *)
