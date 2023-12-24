(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For
// generic floating points
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

fun<>
gflt_si_sflt(sint): sflt
fun<>
gflt_ui_sflt(uint): sflt

(* ****** ****** *)

fun<>
gflt_si_dflt(sint): dflt
fun<>
gflt_ui_dflt(uint): dflt

(* ****** ****** *)
//
fun<>
gflt_print_sflt( sflt ): void
fun<>
gflt_print_dflt( dflt ): void
//
(* ****** ****** *)
//
fun<>
gflt_neg_sflt( f0: sflt ): sflt
fun<>
gflt_neg_dflt( f0: dflt ): dflt
//
(* ****** ****** *)
//
fun<>
gflt_abs_sflt( f0: sflt ): sflt
fun<>
gflt_abs_dflt( f0: dflt ): dflt
//
(* ****** ****** *)
//
fun<>
gflt_succ_sflt( f0: sflt ): sflt
fun<>
gflt_succ_dflt( f0: dflt ): dflt
//
fun<>
gflt_pred_sflt( f0: sflt ): sflt
fun<>
gflt_pred_dflt( f0: dflt ): dflt
//
(* ****** ****** *)
//
fun<>
gflt_lt_sflt_sflt(sflt, sflt): bool
fun<>
gflt_gt_sflt_sflt(sflt, sflt): bool
fun<>
gflt_eq_sflt_sflt(sflt, sflt): bool
//
fun<>
gflt_lte_sflt_sflt(sflt, sflt): bool
fun<>
gflt_gte_sflt_sflt(sflt, sflt): bool
fun<>
gflt_neq_sflt_sflt(sflt, sflt): bool
//
(* ****** ****** *)
//
fun<>
gflt_lt_dflt_dflt(dflt, dflt): bool
fun<>
gflt_gt_dflt_dflt(dflt, dflt): bool
fun<>
gflt_eq_dflt_dflt(dflt, dflt): bool
//
fun<>
gflt_lte_dflt_dflt(dflt, dflt): bool
fun<>
gflt_gte_dflt_dflt(dflt, dflt): bool
fun<>
gflt_neq_dflt_dflt(dflt, dflt): bool
//
(* ****** ****** *)
//
fun<>
gflt_cmp_sflt_sflt(sflt, sflt): sint
//
fun<>
gflt_cmp_dflt_dflt(dflt, dflt): sint
//
(* ****** ****** *)
//
fun<>
gflt_add_sflt_sflt(sflt, sflt): sflt
fun<>
gflt_sub_sflt_sflt(sflt, sflt): sflt
fun<>
gflt_mul_sflt_sflt(sflt, sflt): sflt
fun<>
gflt_div_sflt_sflt(sflt, sflt): sflt
fun<>
gflt_mod_sflt_sflt(sflt, sflt): sflt
//
(* ****** ****** *)
//
fun<>
gflt_add_dflt_dflt(dflt, dflt): dflt
fun<>
gflt_sub_dflt_dflt(dflt, dflt): dflt
fun<>
gflt_mul_dflt_dflt(dflt, dflt): dflt
fun<>
gflt_div_dflt_dflt(dflt, dflt): dflt
fun<>
gflt_mod_dflt_dflt(dflt, dflt): dflt
//
(* ****** ****** *)
//
fun<>
gflt_gt_dflt_sint(dflt, sint): bool
fun<>
gflt_lt_dflt_sint(dflt, sint): bool
fun<>
gflt_eq_dflt_sint(dflt, sint): bool
fun<>
gflt_lte_dflt_sint(dflt, sint): bool
fun<>
gflt_gte_dflt_sint(dflt, sint): bool
fun<>
gflt_neq_dflt_sint(dflt, sint): bool
fun<>
gflt_cmp_dflt_sint(dflt, sint): sint
//
fun<>
gflt_gt_sint_dflt(sint, dflt): bool
fun<>
gflt_lt_sint_dflt(sint, dflt): bool
fun<>
gflt_eq_sint_dflt(sint, dflt): bool
fun<>
gflt_lte_sint_dflt(sint, dflt): bool
fun<>
gflt_gte_sint_dflt(sint, dflt): bool
fun<>
gflt_neq_sint_dflt(sint, dflt): bool
fun<>
gflt_cmp_sint_dflt(sint, dflt): sint
//
(* ****** ****** *)
//
fun<>
gflt_add_sint_dflt(sint, dflt): dflt
fun<>
gflt_sub_sint_dflt(sint, dflt): dflt
fun<>
gflt_mul_sint_dflt(sint, dflt): dflt
fun<>
gflt_div_sint_dflt(sint, dflt): dflt
//
fun<>
gflt_add_dflt_sint(dflt, sint): dflt
fun<>
gflt_sub_dflt_sint(dflt, sint): dflt
fun<>
gflt_mul_dflt_sint(dflt, sint): dflt
fun<>
gflt_div_dflt_sint(dflt, sint): dflt
//
(* ****** ****** *)
(* ****** ****** *)
//
// HX-2020-11-18:
// For symbol overloading
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
cmp with gflt_cmp_sflt_sflt of 1001
//
#symload < with gflt_lt_sflt_sflt of 1001
#symload > with gflt_gt_sflt_sflt of 1001
#symload = with gflt_eq_sflt_sflt of 1001
//
#symload <= with gflt_lte_sflt_sflt of 1001
#symload >= with gflt_gte_sflt_sflt of 1001
#symload != with gflt_neq_sflt_sflt of 1001
//
(* ****** ****** *)
#symload + with gflt_add_sflt_sflt of 1001
#symload - with gflt_sub_sflt_sflt of 1001
#symload * with gflt_mul_sflt_sflt of 1001
#symload / with gflt_div_sflt_sflt of 1001
(* ****** ****** *)
(* ****** ****** *)
//
#symload
cmp with gflt_cmp_dflt_dflt of 1001
//
#symload < with gflt_lt_dflt_dflt of 1001
#symload > with gflt_gt_dflt_dflt of 1001
#symload = with gflt_eq_dflt_dflt of 1001
//
#symload <= with gflt_lte_dflt_dflt of 1001
#symload >= with gflt_gte_dflt_dflt of 1001
#symload != with gflt_neq_dflt_dflt of 1001
//
(* ****** ****** *)
#symload + with gflt_add_dflt_dflt of 1001
#symload - with gflt_sub_dflt_dflt of 1001
#symload * with gflt_mul_dflt_dflt of 1001
#symload / with gflt_div_dflt_dflt of 1001
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2023-11-10:
hybrid variants: sint_dflt/dflt_sint
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
cmp with gflt_cmp_sint_dflt of 1000
//
#symload < with gflt_lt_sint_dflt of 1000
#symload > with gflt_gt_sint_dflt of 1000
#symload = with gflt_eq_sint_dflt of 1000
//
#symload <= with gflt_lte_sint_dflt of 1000
#symload >= with gflt_gte_sint_dflt of 1000
#symload != with gflt_neq_sint_dflt of 1000
//
(* ****** ****** *)
//
#symload
cmp with gflt_cmp_dflt_sint of 1000
//
#symload < with gflt_lt_dflt_sint of 1000
#symload > with gflt_gt_dflt_sint of 1000
#symload = with gflt_eq_dflt_sint of 1000
//
#symload <= with gflt_lte_dflt_sint of 1000
#symload >= with gflt_gte_dflt_sint of 1000
#symload != with gflt_neq_dflt_sint of 1000
//
(* ****** ****** *)
//
#symload + with gflt_add_sint_dflt of 1000
#symload - with gflt_sub_sint_dflt of 1000
#symload * with gflt_mul_sint_dflt of 1000
#symload / with gflt_div_sint_dflt of 1000
//
(* ****** ****** *)
//
#symload + with gflt_add_dflt_sint of 1000
#symload - with gflt_sub_dflt_sint of 1000
#symload * with gflt_mul_dflt_sint of 1000
#symload / with gflt_div_dflt_sint of 1000
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gflt000.sats] *)
