/* Truncate argument to nearest integral value not larger than
   the argument, sparc32 v9 vis3 version.

   Copyright (C) 2013-2015 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Contributed by David S. Miller <davem@davemloft.net>, 2013.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */

#include <sysdep.h>

	/* We pop constants into the FPU registers using the incoming
	   argument stack slots, since this avoid having to use any PIC
	   references.  We also thus avoid having to allocate a register
	   window.

	   VIS instructions are used to facilitate the formation of
	   easier constants, and the propagation of the sign bit.  */

#define TWO_TWENTYTHREE	0x4b000000		/* 2**23 */

#define ZERO		%f10			/* 0.0 */
#define SIGN_BIT	%f12			/* -0.0 */

ENTRY (__truncf_vis3)
	movwtos	%o0, %f1
	sethi	%hi(TWO_TWENTYTHREE), %o2
	fzeros	ZERO
	fnegs	ZERO, SIGN_BIT
	movwtos	%o2, %f16
	fabss	%f1, %f14
	fcmps	%fcc3, %f14, %f16
	fmovsuge %fcc3, ZERO, %f14
	fands	%f1, SIGN_BIT, SIGN_BIT
	fstoi	%f14, %f14
	fitos	%f14, %f14
	fadds	%f1, ZERO, %f18
	fmovsuge %fcc3, %f18, %f14
	retl
	 fors	%f14, SIGN_BIT, %f0
END (__truncf_vis3)
