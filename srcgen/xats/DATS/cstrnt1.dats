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
// Start Time: May 22nd, 2021
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
//
#staload "./../SATS/cstrnt1.sats"
//
(* ****** ****** *)

local

absimpl
c1hyp_tbox = $rec
{ c1hyp_loc= loc_t
, c1hyp_node= c1hyp_node
} (* $rec *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
c1hyp_get_loc
  (c1s) = c1s.c1hyp_loc
implement
c1hyp_get_node
  (c1s) = c1s.c1hyp_node
//
(* ****** ****** *)

implement
c1hyp_make_node
(loc0, node) =
$rec{
  c1hyp_loc=loc0
, c1hyp_node= node
} (* $rec *) // c1hyp_make_node

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
c1str_tbox = $rec
{ c1str_loc= loc_t
, c1str_kind= c1knd
, c1str_node= c1str_node
} (* $rec *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
c1str_get_loc
  (c1s) = c1s.c1str_loc
implement
c1str_get_node
  (c1s) = c1s.c1str_node
//
(* ****** ****** *)
//
implement
c1str_make_node1
(loc0, node) =
c1str_make_node2
( loc0
, C1Knone(), node)
implement
c1str_make_node2
(loc0, c1k0, node) =
$rec{
  c1str_loc=loc0
, c1str_kind= c1k0
, c1str_node= node
} (* $rec *) // c1str_make_node2
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_cstrnt1.dats] *)
