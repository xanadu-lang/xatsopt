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
// For functional lin-streams
//
(* ****** ****** *)
#sexpdef
strm_vt = stream_vt
#sexpdef
strq_vt = streaq_vt
#sexpdef
strx_vt = streax_vt
(* ****** ****** *)
//
fun
<a:t0>
stream_vt2t
(xs: stream_vt(a)): stream(a)
//
(* ****** ****** *)
//
fun<>
strmcon_vt_nil_
{a:vt}
((*void*)): strmcon_vt(a)
fun
<a:vt>
strmcon_vt_cons_
( x0: (a)
, xs
: stream_vt(a)): strmcon_vt(a)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strmcon_vt_uncons_cfr
( xs: strmcon_vt( x0 )
, f0: ((*void*)) -<cfr> r0
, f1: (x0, stream_vt(x0)) -<cfr> r0): r0
fun
<x0:vt>
<r0:vt>
strxcon_vt_uncons_cfr
( xs: strxcon_vt( x0 )
, f1: (x0, streax_vt(x0)) -<cfr> r0): r0
//
(* ****** ****** *)

fun
<a:vt>
stream_vt_nil
((*void*)): stream_vt( a )
fun
<a:vt>
stream_vt_cons
( x0: (a)
, xs
: stream_vt(a)): stream_vt( a )

(* ****** ****** *)

fun
<a:vt>
stream_vt_sing(a): stream_vt(a)
fun
<a:vt>
strmcon_vt_sing(a): strmcon_vt(a)

(* ****** ****** *)

fun
<a:vt>
stream_vt_pair
  (fst: a, snd: a): stream_vt(a)
fun
<a:vt>
strmcon_vt_pair
  (fst: a, snd: a): strmcon_vt(a)

(* ****** ****** *)

fun
<a:vt>
stream_vt_free(stream_vt(a)): void

(* ****** ****** *)
//
fun
<a:vt>
stream_vt_print
  (xs: stream_vt(a)): void
fun
<a:vt>
streax_vt_print
  (xs: streax_vt(a)): void
//
fun
<a:vt>
stream_vt_print0
  (xs: stream_vt(a)): void
//
fun<>
stream_vt_print$len(): sint
fun<>
streax_vt_print$len(): sint
//
fun<>
stream_vt_print$beg(): void
fun<>
stream_vt_print$end(): void
fun<>
stream_vt_print$sep(): void
fun<>
stream_vt_print$rst(): void
//
fun
<a:vt>
stream_vt_print_all
  (xs: stream_vt(a)): void
fun
<a:vt>
stream_vt_print_len
(xs: stream_vt(a), len: nint): void
//
(* ****** ****** *)

fun
<a:vt>
stream_vt_length(xs: stream_vt(a)): nint

(* ****** ****** *)

fun
<a:vt>
stream_vt_drop
(xs: stream_vt(a), n0: sint): stream_vt(a)
fun
<a:vt>
stream_vt_take
(xs: stream_vt(a), n0: sint): stream_vt(a)

(* ****** ****** *)
//
fun
<a:vt>
stream_vt_listize
(xs: stream_vt(a)): list_vt(a)
fun
<a:vt>
stream_vt_rlistize
(xs: stream_vt(a)): list_vt(a)
//
fun
<a:vt>
stream_vt_streamize
(xs: stream_vt(a)): stream_vt(a)
//
fun
<a:vt>
streax_vt_streamize
(xs: streax_vt(a)): stream_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
stream_vt_extend
(xs: stream_vt(a), x0: a): stream_vt(a)
fun
<a:vt>
stream_vt_append
(stream_vt(a), stream_vt(a)): stream_vt(a)
fun
<a:vt>
stream_vt_concat
(xss: stream_vt(stream_vt(a))): stream_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
stream_vt_prefixq // xs1 prefix-ofs xs2
( xs1
: stream_vt(a), xs2: stream_vt(a) ): bool 
//
(* ****** ****** *)
fun
<x0:vt>
stream_vt_fset_at
( xs: stream_vt(x0)
, i0: nint, x0: x0): stream_vt(x0)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
stream_vt_gappend
  (xs1: xs, xs2: xs): stream_vt(x0)
fun
<xs:vt>
<x0:vt>
stream_vt_gconcat
  (xss: stream_vt(xs)): stream_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
stream_vt_sortedq(stream_vt(x0)): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
stream_vt_foldl0
(xs: stream_vt(x0), r0: r0): r0
//
fun
<x0:vt>
stream_vt_forall0(stream_vt(x0)): bool
fun
<x0:vt>
stream_vt_foreach0(stream_vt(x0)): void
//
(* ****** ****** *)
//
(*
stream_vt_map0: map0$fopr
*)
//
fun
<x0:vt>
<y0:vt>
stream_vt_map0
  (xs: stream_vt(x0)): stream_vt(y0)
fun
<x0:vt>
<y0:vt>
streax_vt_map0
  (xs: streax_vt(x0)): streax_vt(y0)
//
(* ****** ****** *)
//
(*
stream_vt_filter: filter0$test
*)
//
fun
<x0:vt>
stream_vt_filter0
  (xs: stream_vt(x0)): stream_vt(x0)
fun
<x0:vt>
streax_vt_filter0
  (xs: streax_vt(x0)): streax_vt(x0)
//
(* ****** ****** *)
//
(*
stream_vt_mapopt: filter+map
*)
fun
<x0:vt>
<y0:vt>
stream_vt_mapopt0
  (xs: stream_vt(x0)): stream_vt(y0)
fun
<x0:vt>
<y0:vt>
streax_vt_mapopt0
  (xs: streax_vt(x0)): streax_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
stream_vt_mapoptn0
  (xs: stream_vt(x0)): stream_vt(y0)
fun
<x0:vt>
<y0:vt>
streax_vt_mapoptn0
  (xs: streax_vt(x0)): streax_vt(y0)
//
fun
<x0:vt>
<y0:vt>
stream_vt_maplist0
  (xs: stream_vt(x0)): stream_vt(y0)
fun
<x0:vt>
<y0:vt>
streax_vt_maplist0
  (xs: streax_vt(x0)): streax_vt(y0)
//
fun
<x0:vt>
<y0:vt>
stream_vt_mapstrm0
  (xs: stream_vt(x0)): stream_vt(y0)
fun
<x0:vt>
<y0:vt>
streax_vt_mapstrm0
  (xs: streax_vt(x0)): streax_vt(y0)
//
(* ****** ****** *)
fun
<x0:vt>
stream_vt_group_list
( xs
: stream_vt(x0))
: stream_vt(list_vt(x0))
(* ****** ****** *)
fun
<x0:vt>
stream_vt_sieve
  (xs: stream_vt(x0)): stream_vt(x0)
(* ****** ****** *)
//
// For glseq-i-operations
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
stream_vt_imap0
  (xs: stream_vt(x0)): stream_vt(y0)
fun
<x0:vt>
<y0:vt>
streax_vt_imap0
  (xs: streax_vt(x0)): streax_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt>
stream_vt_ifilter0
  (xs: stream_vt(x0)): stream_vt(x0)
fun
<x0:vt>
streax_vt_ifilter0
  (xs: streax_vt(x0)): streax_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
stream_vt_imapopt0
  (xs: stream_vt(x0)): stream_vt(y0)
fun
<x0:vt>
<y0:vt>
streax_vt_imapopt0
  (xs: streax_vt(x0)): streax_vt(y0)
//
(* ****** ****** *)
fun
<a:vt>
stream_vt_istreamize
( xs
: stream_vt(a)): stream_vt(@(nint, a))
fun
<a:vt>
streax_vt_istreamize
( xs
: streax_vt(a)): stream_vt(@(nint, a))
(* ****** ****** *)
//
// For z2-glseq-operations
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
stream_vt_z2forall0
  ( xs: stream_vt(x0)
  , ys: stream_vt(y0)): bool
fun
<x0:vt
,y0:vt>
stream_vt_z2forcmp0
  ( xs: stream_vt(x0)
  , ys: stream_vt(y0)): sint
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
stream_vt_z2streamize
( xs: stream_vt(x0)
, ys: stream_vt(y0)): stream_vt(@(x0, y0))
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for stream_vt
//
(* ****** ****** *)
//
#symload
nil_vt with strmcon_vt_nil
#symload
cons_vt with strmcon_vt_cons
//
(* ****** ****** *)
//
#symload print with stream_vt_print of 1000
#symload print0 with stream_vt_print of 1000

(* ****** ****** *)
//
#symload length with stream_vt_length of 1000
#symload length0 with stream_vt_length of 1000
//
(* ****** ****** *)
//
#symload extend with stream_vt_extend of 1000
(*
#symload extend00 with stream_vt_extend of 1000
*)
#symload append with stream_vt_append of 1000
(*
#symload append00 with stream_vt_append of 1000
*)
//
(* ****** ****** *)

#symload prefixq with stream_vt_prefixq of 1000

(* ****** ****** *)

#symload concat with stream_vt_concat of 1000
#symload gconcat with stream_vt_gconcat of 1000

(* ****** ****** *)
//
#symload listize with stream_vt_listize of 1000
#symload listize0 with stream_vt_listize of 1000
#symload rlistize with stream_vt_rlistize of 1000
#symload rlistize0 with stream_vt_rlistize of 1000
//
(* ****** ****** *)

(* end of [prelude_stream0_vt.sats] *)
