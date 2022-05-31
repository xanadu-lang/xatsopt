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
// For functional streams
//
(* ****** ****** *)
#typedef
strm(a:type) = stream(a)
#typedef
strx(a:type) = streax(a)
(* ****** ****** *)
//
fun<>
strmcon_nil_
{a:t0}
((*void*)): strmcon(a)
fun
<a:t0>
strmcon_cons_
(a, stream(a)): strmcon(a)
//
fun
<a:t0>
strxcon_cons_
(a, streax(a)): strxcon(a)
//
fun
<x0:t0>
<r0:vt>
strmcon_uncons_cfr
( xs: strmcon( x0 )
, f0: ((*void*)) -<cfr> r0
, f1: (x0, stream(x0)) -<cfr> r0): r0
//
fun
<x0:t0>
<r0:vt>
strxcon_uncons_cfr
( xs: strxcon(x0)
, f1: (x0, streax(x0)) -<cfr> r0): r0
//
(* ****** ****** *)

fun
<a:t0>
stream_nil(): stream(a)
fun
<a:t0>
stream_cons
(x0: a, xs: stream(a)): stream(a)

(* ****** ****** *)

fun
<a:t0>
stream_sing(a): stream(a)
fun
<a:t0>
stream_pair(a, a): stream(a)

(* ****** ****** *)
//
fun
<a:t0>
stream_print
  (xs: stream(a)): void
//
fun<>
stream_print$len(): sint
//
fun<>
stream_print$beg(): void
fun<>
stream_print$end(): void
fun<>
stream_print$sep(): void
fun<>
stream_print$rst(): void
//
fun
<a:t0>
stream_print_all
  (xs: stream(a)): void
fun
<a:t0>
stream_print_len
(xs: stream(a), len: nint): void
//
(* ****** ****** *)

fun
<a:t0>
stream_length
(xs: stream(a)): nint

(* ****** ****** *)
//
fun
<a:t0>
stream_extend
(xs: stream(a), x0: a): stream(a)
fun
<a:t0>
stream_append
(stream(a), stream(a)): stream(a)
//
(* ****** ****** *)
//
fun
<a:t0>
stream_concat
(xss: stream(stream(a))): stream(a)
//
(* ****** ****** *)
//
fun
<a:t0>
stream_forall(xs: stream(a)): bool
(*
fun
<x0:t0>
stream_foreach(xs: stream(x0)): void
*)
//
(* ****** ****** *)
//
(*
fun
<x0:t0>
stream_listize
( xs: stream(x0) ) : list_vt(x0)
*)
//
fun
<x0:t0>
stream_streamize
( xs: stream(x0) ) : stream_vt(x0)
//
(* ****** ****** *)
//
(*
stream_map: map$fopr
stream_map_vt: map$fopr
*)
//
fun
<x0:t0>
<y0:t0>
stream_map(stream(x0)): stream(y0)
fun
<x0:t0>
<y0:t0>
streax_map(streax(x0)): streax(y0)
//
fun
<x0:t0>
<y0:vt>
stream_map_vt(stream(x0)): stream_vt(y0)
fun
<x0:t0>
<y0:vt>
streax_map_vt(streax(x0)): streax_vt(y0)
//
(* ****** ****** *)
//
(*
stream_filter: filter$test
stream_filter_vt: filter$test
*)
//
fun
<x0:t0>
stream_filter(stream(x0)): stream(x0)
fun
<x0:t0>
streax_filter(streax(x0)): streax(x0)
//
fun
<x0:t0>
stream_filter_vt(stream(x0)): stream_vt(x0)
fun
<x0:t0>
streax_filter_vt(streax(x0)): streax_vt(x0)
//
(* ****** ****** *)
//
(*
stream_mapopt:
filter$fopr, map$fopr
stream_mapopt_vt:
filter$fopr, map$fopr
*)
fun
<x0:t0>
<y0:t0>
stream_mapopt(stream(x0)): stream(y0)
fun
<x0:t0>
<y0:vt>
stream_mapopt_vt(stream(x0)): stream_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
stream_mapoptn(stream(x0)): stream(y0)
fun
<x0:t0>
<y0:vt>
stream_mapoptn_vt(stream(x0)): stream_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
stream_merge
(stream(x0), stream(x0)): stream(x0)
//
(* ****** ****** *)
//
fun
<x0:t0>
stream_sieve(stream(x0)): stream(x0)
fun
<x0:t0>
streax_sieve(stream(x0)): streax(x0)
//
fun
<x0:t0>
stream_sieve_vt(stream(x0)): stream_vt(x0)
fun
<x0:t0>
streax_sieve_vt(stream(x0)): streax_vt(x0)
//
(* ****** ****** *)

fun
<x0:t0>
<y0:t0>
stream_imap(stream(x0)): stream( y0 )
fun
<x0:t0>
<y0:vt>
stream_imap_vt(stream(x0)): stream_vt( y0 )

(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for stream
//
(* ****** ****** *)
//
#symload nil with strmcon_nil
#symload cons with strmcon_cons
//
(* ****** ****** *)

#symload
length with stream_length of 1000

(* ****** ****** *)

#symload
extend with stream_extend of 1000
#symload
append with stream_append of 1000
#symload
concat with stream_concat of 1000

(* ****** ****** *)
//
#symload
forall with stream_forall of 1000
(*
#symload
foreach with stream_foreach of 1000
*)
//
(* ****** ****** *)
(*
#symload
listize with stream_listize of 1000
*)
#symload
streamize with stream_streamize of 1000
(* ****** ****** *)
//
#symload map with stream_map of 1000
#symload map with streax_map of 1000
#symload map_vt with stream_map_vt of 1000
#symload map_vt with streax_map_vt of 1000
//
(* ****** ****** *)
//
#symload sieve with stream_sieve of 1000
#symload sieve with streax_sieve of 1000
#symload sieve_vt with stream_sieve_vt of 1000
#symload sieve_vt with streax_sieve_vt of 1000
//
(* ****** ****** *)
//
#symload filter with stream_filter of 1000
#symload filter with streax_filter of 1000
#symload filter_vt with stream_filter_vt of 1000
#symload filter_vt with streax_filter_vt of 1000
//
(* ****** ****** *)
//
#symload imap with stream_imap of 1000
#symload imap_vt with stream_imap_vt of 1000
//
(* ****** ****** *)
//
#symload mapopt with stream_mapopt of 1000
#symload mapopt_vt with stream_mapopt_vt of 1000
//
(* ****** ****** *)

(* end of [prelude_stream.sats] *)
