(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
// For some sugary syntax
//
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: June 5th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
fun
<a0:vt>
optn_vt_a00
(      ): optn_vt(a0,ff)
fun
<a0:vt>
optn_vt_a01
(x1: a0): optn_vt(a0,tt)
//
(* ****** ****** *)
//
#symload
optn_vt with optn_vt_a00
#symload
optn_vt with optn_vt_a01
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 20:35:51 EDT 2022
*)
//
fun
<a0:vt>
list_vt_a00
(      ): list_vt(a0, 0)
fun
<a0:vt>
list_vt_a01
(x1: a0): list_vt(a0, 1)
fun
<a0:vt>
list_vt_a02
(x1: a0
,x2: a0): list_vt(a0, 2)
fun
<a0:vt>
list_vt_a03
(x1: a0
,x2: a0
,x3: a0): list_vt(a0, 3)
fun
<a0:vt>
list_vt_a04
(x1: a0
,x2: a0
,x3: a0
,x4: a0): list_vt(a0, 4)
fun
<a0:vt>
list_vt_a05
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0): list_vt(a0, 5)
fun
<a0:vt>
list_vt_a06
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0): list_vt(a0, 6)
fun
<a0:vt>
list_vt_a07
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0
,x7: a0): list_vt(a0, 7)
fun
<a0:vt>
list_vt_a08
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0
,x7: a0
,x8: a0): list_vt(a0, 8)
fun
<a0:vt>
list_vt_a09
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0
,x7: a0
,x8: a0
,x9: a0): list_vt(a0, 9)
fun
<a0:vt>
list_vt_a10
(x01: a0
,x02: a0
,x03: a0
,x04: a0
,x05: a0
,x06: a0
,x07: a0
,x08: a0
,x09: a0
,x10: a0): list_vt(a0, 10)
//
(* ****** ****** *)
//
#symload list_vt with list_vt_a00
#symload list_vt with list_vt_a01
#symload list_vt with list_vt_a02
#symload list_vt with list_vt_a03
#symload list_vt with list_vt_a04
#symload list_vt with list_vt_a05
#symload list_vt with list_vt_a06
#symload list_vt with list_vt_a07
#symload list_vt with list_vt_a08
#symload list_vt with list_vt_a09
#symload list_vt with list_vt_a10
//
(* ****** ****** *)
//HX:
//implementing fproc0/1
(* ****** ****** *)
//
fun
<a0:vt>
gl_fproc0(x0: ~a0): void
fun
<a0:vt>
gl_fproc1(x0: !a0): void
//
(* ****** ****** *)
//
(*
fun<>
glfproc0_a00
((*void*)) : void
*)
fun
<a1:vt>
glfproc0_a01
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
glfproc0_a02
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
glfproc0_a03
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
glfproc0_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
glfproc0_a05
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
glfproc0_a06
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
glfproc0_a07
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
glfproc0_a08
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
glfproc0_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
glfproc0_a10
( x01: ~a01, x02: ~a02
, x03: ~a03, x04: ~a04
, x05: ~a05, x06: ~a06
, x07: ~a07, x08: ~a08
, x09: ~a09, x10: ~a10 ) : void
(* ****** ****** *)
//
#symload glfproc0 with glfproc0_a01
#symload glfproc0 with glfproc0_a02
#symload glfproc0 with glfproc0_a03
#symload glfproc0 with glfproc0_a04
#symload glfproc0 with glfproc0_a05
#symload glfproc0 with glfproc0_a06
#symload glfproc0 with glfproc0_a07
#symload glfproc0 with glfproc0_a08
#symload glfproc0 with glfproc0_a09
#symload glfproc0 with glfproc0_a10
//
(* ****** ****** *)
//
(*
fun<>
glfproc1_a00
((*void*)) : void
*)
fun
<a1:vt>
glfproc1_a01
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
glfproc1_a02
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
glfproc1_a03
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
glfproc1_a04
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
glfproc1_a05
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
glfproc1_a06
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
glfproc1_a07
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
glfproc1_a08
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
glfproc1_a09
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
glfproc1_a10
( x01: !a01, x02: !a02
, x03: !a03, x04: !a04
, x05: !a05, x06: !a06
, x07: !a07, x08: !a08
, x09: !a09, x10: !a10 ) : void
(* ****** ****** *)
//
#symload glfproc1 with glfproc1_a01
#symload glfproc1 with glfproc1_a02
#symload glfproc1 with glfproc1_a03
#symload glfproc1 with glfproc1_a04
#symload glfproc1 with glfproc1_a05
#symload glfproc1 with glfproc1_a06
#symload glfproc1 with glfproc1_a07
#symload glfproc1 with glfproc1_a08
#symload glfproc1 with glfproc1_a09
#symload glfproc1 with glfproc1_a10
//
(* ****** ****** *)
//
//HX:
//implementing fred2
//
(* ****** ****** *)
//
fun
<a0:vt>
gl_fred20(~a0, ~a0): a0
fun
<a0:vt>
gl_fred21(!a0, !a0): a0
//
(* ****** ****** *)
fun
<a0:vt>
glfred2l0_a02
(x1: ~a0, x2: ~a0): a0
fun
<a0:vt>
glfred2l0_a03
( x1: ~a0
, x2: ~a0, x3: ~a0): a0
fun
<a0:vt>
glfred2l0_a04
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0): a0
fun
<a0:vt>
glfred2l0_a05
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0): a0
fun
<a0:vt>
glfred2l0_a06
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0
, x5: ~a0, x6: ~a0): a0
fun
<a0:vt>
glfred2l0_a07
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0
, x6: ~a0, x7: ~a0): a0
fun
<a0:vt>
glfred2l0_a08
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0
, x5: ~a0, x6: ~a0
, x7: ~a0, x8: ~a0): a0
fun
<a0:vt>
glfred2l0_a09
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0
, x6: ~a0, x7: ~a0
, x8: ~a0, x9: ~a0): a0
//
fun
<a0:vt>
glfred2l0_a10
( x01: ~a0, x02: ~a0
, x03: ~a0, x04: ~a0
, x05: ~a0, x06: ~a0
, x07: ~a0, x08: ~a0
, x09: ~a0, x10: ~a0): a0
//
(* ****** ****** *)
fun
<a0:vt>
glfred2l1_a02
(x1: !a0, x2: !a0): a0
fun
<a0:vt>
glfred2l1_a03
( x1: !a0
, x2: !a0, x3: !a0): a0
fun
<a0:vt>
glfred2l1_a04
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0): a0
fun
<a0:vt>
glfred2l1_a05
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0): a0
fun
<a0:vt>
glfred2l1_a06
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0
, x5: !a0, x6: !a0): a0
fun
<a0:vt>
glfred2l1_a07
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0
, x6: !a0, x7: !a0): a0
fun
<a0:vt>
glfred2l1_a08
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0
, x5: !a0, x6: !a0
, x7: !a0, x8: !a0): a0
fun
<a0:vt>
glfred2l1_a09
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0
, x6: !a0, x7: !a0
, x8: !a0, x9: !a0): a0
//
fun
<a0:vt>
glfred2l1_a10
( x01: !a0, x02: !a0
, x03: !a0, x04: !a0
, x05: !a0, x06: !a0
, x07: !a0, x08: !a0
, x09: !a0, x10: !a0): a0
//
(* ****** ****** *)
fun
<a0:vt>
glfred2r0_a02
(x1: ~a0, x2: ~a0): a0
fun
<a0:vt>
glfred2r0_a03
( x1: ~a0
, x2: ~a0, x3: ~a0): a0
fun
<a0:vt>
glfred2r0_a04
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0): a0
fun
<a0:vt>
glfred2r0_a05
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0): a0
fun
<a0:vt>
glfred2r0_a06
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0
, x5: ~a0, x6: ~a0): a0
fun
<a0:vt>
glfred2r0_a07
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0
, x6: ~a0, x7: ~a0): a0
fun
<a0:vt>
glfred2r0_a08
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0
, x5: ~a0, x6: ~a0
, x7: ~a0, x8: ~a0): a0
fun
<a0:vt>
glfred2r0_a09
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0
, x6: ~a0, x7: ~a0
, x8: ~a0, x9: ~a0): a0
//
fun
<a0:vt>
glfred2r0_a10
( x01: ~a0, x02: ~a0
, x03: ~a0, x04: ~a0
, x05: ~a0, x06: ~a0
, x07: ~a0, x08: ~a0
, x09: ~a0, x10: ~a0): a0
//
(* ****** ****** *)
fun
<a0:vt>
glfred2r1_a02
(x1: !a0, x2: !a0): a0
fun
<a0:vt>
glfred2r1_a03
( x1: !a0
, x2: !a0, x3: !a0): a0
fun
<a0:vt>
glfred2r1_a04
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0): a0
fun
<a0:vt>
glfred2r1_a05
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0): a0
fun
<a0:vt>
glfred2r1_a06
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0
, x5: !a0, x6: !a0): a0
fun
<a0:vt>
glfred2r1_a07
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0
, x6: !a0, x7: !a0): a0
fun
<a0:vt>
glfred2r1_a08
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0
, x5: !a0, x6: !a0
, x7: !a0, x8: !a0): a0
fun
<a0:vt>
glfred2r1_a09
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0
, x6: !a0, x7: !a0
, x8: !a0, x9: !a0): a0
//
fun
<a0:vt>
glfred2r1_a10
( x01: !a0, x02: !a0
, x03: !a0, x04: !a0
, x05: !a0, x06: !a0
, x07: !a0, x08: !a0
, x09: !a0, x10: !a0): a0
//
(* ****** ****** *)
//
(*
HX:
for overloading
print0 and println0
*)
//
(* ****** ****** *)
//
(*
fun<>
print0_a00
((*void*)) : void
*)
fun
<a1:vt>
print0_a01
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
print0_a02
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
print0_a03
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
print0_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
print0_a05
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
print0_a06
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
print0_a07
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
print0_a08
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
print0_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
(* ****** ****** *)
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
print0_a10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
(* ****** ****** *)
//
#symload print0 with print0_a01
#symload print0 with print0_a02
#symload print0 with print0_a03
#symload print0 with print0_a04
#symload print0 with print0_a05
#symload print0 with print0_a06
#symload print0 with print0_a07
#symload print0 with print0_a08
#symload print0 with print0_a09
#symload print0 with print0_a10
//
(* ****** ****** *)
//
fun<>
println0_a00
((*void*)) : void
fun
<a1:vt>
println0_a01
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
println0_a02
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
println0_a03
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
println0_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
println0_a05
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
println0_a06
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
println0_a07
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
println0_a08
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
println0_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
(* ****** ****** *)
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
println0_a10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
(* ****** ****** *)
//
#symload println0 with println0_a00
#symload println0 with println0_a01
#symload println0 with println0_a02
#symload println0 with println0_a03
#symload println0 with println0_a04
#symload println0 with println0_a05
#symload println0 with println0_a06
#symload println0 with println0_a07
#symload println0 with println0_a08
#symload println0 with println0_a09
#symload println0 with println0_a10
//
(* ****** ****** *)
//
(*
HX:
for overloading
print1 and println1
*)
//
(* ****** ****** *)
//
(*
fun<>
print1_a00
((*void*)) : void
*)
fun
<a1:vt>
print1_a01
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
print1_a02
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
print1_a03
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
print1_a04
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
print1_a05
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
print1_a06
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
print1_a07
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
print1_a08
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
print1_a09
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
print1_a10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
(* ****** ****** *)
//
#symload print1 with print1_a01
#symload print1 with print1_a02
#symload print1 with print1_a03
#symload print1 with print1_a04
#symload print1 with print1_a05
#symload print1 with print1_a06
#symload print1 with print1_a07
#symload print1 with print1_a08
#symload print1 with print1_a09
#symload print1 with print1_a10
//
(* ****** ****** *)
//
fun<>
println1_a00
((*void*)) : void
fun
<a1:vt>
println1_a01
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
println1_a02
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
println1_a03
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
println1_a04
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
println1_a05
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
println1_a06
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
println1_a07
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
println1_a08
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
println1_a09
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
println1_a10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
(* ****** ****** *)
//
#symload println1 with println1_a00
#symload println1 with println1_a01
#symload println1 with println1_a02
#symload println1 with println1_a03
#symload println1 with println1_a04
#symload println1 with println1_a05
#symload println1 with println1_a06
#symload println1 with println1_a07
#symload println1 with println1_a08
#symload println1 with println1_a09
#symload println1 with println1_a10
//
(* ****** ****** *)
(*
HX-2022-06-22:
printing for special sequences
*)
(* ****** ****** *)
//HX:optn(vt)-printing
(* ****** ****** *)
//
fun<>
optn_vt_print$beg
  ( (*void*) ): void
fun<>
optn_vt_print$end
  ( (*void*) ): void
//
fun
<a0:vt>
optn_vt_print1
(xs: optn_vt(a0)): void
fun
<a0:vt>
optn_vt_print1_begend
( xs: optn_vt(a0)
, xbeg: strn, xend: strn): void
//
(* ****** ****** *)
//HX:list(vt)-printing
(* ****** ****** *)
//
fun<>
list_vt_print$beg(): void
fun<>
list_vt_print$end(): void
fun<>
list_vt_print$sep(): void
//
fun
<a0:vt>
list_vt_print1(xs: list_vt(a0)): void
fun
<a0:vt>
list_vt_print1_begendsep
( xs: list_vt(a0)
, xbeg: strn, xend: strn, xsep: strn): void
//
(* ****** ****** *)
//HX:strm(vt)-printing
(* ****** ****** *)
//
fun<>
strm_vt_print$len(): sint
//
fun<>
strm_vt_print$beg(): void
fun<>
strm_vt_print$end(): void
fun<>
strm_vt_print$sep(): void
fun<>
strm_vt_print$rst(): void
//
fun
<a0:vt>
strm_vt_print0
  (xs: ~strm_vt(a0)): void
//
fun
<a0:vt>
strm_vt_print0_all
  (xs: ~strm_vt(a0)): void
fun
<a0:vt>
strm_vt_print0_len
(xs: ~strm_vt(a0), len: nint): void
//
fun
<a0:vt>
strm_vt_print0_begendseprst
( xs: strm_vt(a0)
, xbeg: strn, xend: strn, xsep: strn, xrst: strn): void
//
(* ****** ****** *)
//HX:strx(vt)-printing
(* ****** ****** *)
//
fun<>
strx_vt_print$len(): sint
//
fun<>
strx_vt_print$beg(): void
fun<>
strx_vt_print$end(): void
fun<>
strx_vt_print$sep(): void
fun<>
strx_vt_print$rst(): void
//
fun
<a0:vt>
strx_vt_print0
  (xs: ~strx_vt(a0)): void
//
fun
<a0:vt>
strx_vt_print0_len
  (xs: ~strx_vt(a0), ln: nint): void
//
fun
<a0:vt>
strx_vt_print0_begendseprst
( xs: ~strx_vt(a0)
, xbeg: strn, xend: strn, xsep: strn, xrst: strn): void
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 15:08:37 EDT 2022
*)
//
fun<>
strn_vt_glappend0_a02
( ~strn_vt
, ~strn_vt ): strn_vt
fun<>
strn_vt_glappend0_a03
( ~strn_vt
, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_glappend0_a04
( ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_glappend0_a05
( ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_glappend0_a06
( ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_glappend0_a07
( ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_glappend0_a08
( ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_glappend0_a09
( ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_glappend0_a10
( ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
//
(* ****** ****** *)
//
#symload glappend0 with strn_vt_glappend0_a02
#symload glappend0 with strn_vt_glappend0_a03
#symload glappend0 with strn_vt_glappend0_a04
#symload glappend0 with strn_vt_glappend0_a05
#symload glappend0 with strn_vt_glappend0_a06
#symload glappend0 with strn_vt_glappend0_a07
#symload glappend0 with strn_vt_glappend0_a08
#symload glappend0 with strn_vt_glappend0_a09
#symload glappend0 with strn_vt_glappend0_a10
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 18:29:59 EDT 2022
*)
//
fun<>
strn_vt_glappend1_a02
( !strn_vt
, !strn_vt ): strn_vt
fun<>
strn_vt_glappend1_a03
( !strn_vt
, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_glappend1_a04
( !strn_vt, !strn_vt
, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_glappend1_a05
( !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_glappend1_a06
( !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_glappend1_a07
( !strn_vt
, !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_glappend1_a08
( !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_glappend1_a09
( !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_glappend1_a10
( !strn_vt
, !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
//
(* ****** ****** *)
//
#symload glappend1 with strn_vt_glappend1_a02
#symload glappend1 with strn_vt_glappend1_a03
#symload glappend1 with strn_vt_glappend1_a04
#symload glappend1 with strn_vt_glappend1_a05
#symload glappend1 with strn_vt_glappend1_a06
#symload glappend1 with strn_vt_glappend1_a07
#symload glappend1 with strn_vt_glappend1_a08
#symload glappend1 with strn_vt_glappend1_a09
#symload glappend1 with strn_vt_glappend1_a10
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 19:09:52 EDT 2022
*)
//
fun
<a0:vt>
list_vt_glappend0_a02
( ~list_vt(a0)
, ~list_vt(a0) ): list_vt(a0)
fun
<a0:vt>
list_vt_glappend0_a03
( ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend0_a04
( ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend0_a05
( ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend0_a06
( ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend0_a07
( ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend0_a08
( ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend0_a09
( ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend0_a10
( ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
//
(* ****** ****** *)
//
#symload glappend0 with list_vt_glappend0_a02
#symload glappend0 with list_vt_glappend0_a03
#symload glappend0 with list_vt_glappend0_a04
#symload glappend0 with list_vt_glappend0_a05
#symload glappend0 with list_vt_glappend0_a06
#symload glappend0 with list_vt_glappend0_a07
#symload glappend0 with list_vt_glappend0_a08
#symload glappend0 with list_vt_glappend0_a09
#symload glappend0 with list_vt_glappend0_a10
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 20:25:07 EDT 2022
*)
//
fun
<a0:vt>
list_vt_glappend1_a02
( !list_vt(a0)
, !list_vt(a0) ): list_vt(a0)
fun
<a0:vt>
list_vt_glappend1_a03
( !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend1_a04
( !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend1_a05
( !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend1_a06
( !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend1_a07
( !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend1_a08
( !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend1_a09
( !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_glappend1_a10
( !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
//
(* ****** ****** *)
//
#symload glappend1 with list_vt_glappend1_a02
#symload glappend1 with list_vt_glappend1_a03
#symload glappend1 with list_vt_glappend1_a04
#symload glappend1 with list_vt_glappend1_a05
#symload glappend1 with list_vt_glappend1_a06
#symload glappend1 with list_vt_glappend1_a07
#symload glappend1 with list_vt_glappend1_a08
#symload glappend1 with list_vt_glappend1_a09
#symload glappend1 with list_vt_glappend1_a10
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_synoug0_vt.sats] *)
