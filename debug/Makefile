# Copyright (C) 1998-2015 Free Software Foundation, Inc.
# This file is part of the GNU C Library.

# The GNU C Library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

# The GNU C Library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public
# License along with the GNU C Library; if not, see
# <http://www.gnu.org/licenses/>.

#
#	Sub-makefile for debug portion of the library.
#
subdir	:= debug

include ../Makeconfig

headers	:= execinfo.h

# Note that ptsname_r_chk and getlogin_r are not here, but in
# login/Makefile instead.  If that subdir is omitted from the
# build, its _FORTIFY_SOURCE support will be too.
routines  = backtrace backtracesyms backtracesymsfd noophooks \
	    memcpy_chk memmove_chk mempcpy_chk memset_chk stpcpy_chk \
	    strcat_chk strcpy_chk strncat_chk strncpy_chk stpncpy_chk \
	    sprintf_chk vsprintf_chk snprintf_chk vsnprintf_chk \
	    printf_chk fprintf_chk vprintf_chk vfprintf_chk \
	    gets_chk chk_fail readonly-area fgets_chk fgets_u_chk \
	    read_chk pread_chk pread64_chk recv_chk recvfrom_chk \
	    readlink_chk readlinkat_chk getwd_chk getcwd_chk \
	    realpath_chk fread_chk fread_u_chk \
	    wctomb_chk wcscpy_chk wmemcpy_chk wmemmove_chk wmempcpy_chk \
	    wcpcpy_chk wcsncpy_chk wcscat_chk wcsncat_chk wmemset_chk \
	    wcpncpy_chk \
	    swprintf_chk vswprintf_chk wprintf_chk fwprintf_chk \
	    vwprintf_chk vfwprintf_chk fgetws_chk fgetws_u_chk \
	    confstr_chk getgroups_chk ttyname_r_chk \
	    gethostname_chk getdomainname_chk wcrtomb_chk mbsnrtowcs_chk \
	    wcsnrtombs_chk mbsrtowcs_chk wcsrtombs_chk mbstowcs_chk \
	    wcstombs_chk asprintf_chk vasprintf_chk dprintf_chk \
	    vdprintf_chk obprintf_chk \
	    longjmp_chk ____longjmp_chk \
	    fdelt_chk poll_chk ppoll_chk \
	    stack_chk_fail fortify_fail \
	    $(static-only-routines)
static-only-routines := warning-nop stack_chk_fail_local

CFLAGS-backtrace.c = -fno-omit-frame-pointer
CFLAGS-sprintf_chk.c = $(libio-mtsafe)
CFLAGS-snprintf_chk.c = $(libio-mtsafe)
CFLAGS-vsprintf_chk.c = $(libio-mtsafe)
CFLAGS-vsnprintf_chk.c = $(libio-mtsafe)
CFLAGS-asprintf_chk.c = $(libio-mtsafe)
CFLAGS-vasprintf_chk.c = $(libio-mtsafe)
CFLAGS-obprintf_chk.c = $(libio-mtsafe)
CFLAGS-dprintf_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-vdprintf_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-printf_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-fprintf_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-vprintf_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-vfprintf_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-gets_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-fgets_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-fgets_u_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-fread_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-fread_u_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-swprintf_chk.c = $(libio-mtsafe)
CFLAGS-vswprintf_chk.c = $(libio-mtsafe)
CFLAGS-wprintf_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-fwprintf_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-vwprintf_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-vfwprintf_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-fgetws_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-fgetws_u_chk.c = $(libio-mtsafe) $(exceptions)
CFLAGS-read_chk.c = -fexceptions -fasynchronous-unwind-tables
CFLAGS-pread_chk.c = -fexceptions -fasynchronous-unwind-tables
CFLAGS-pread64_chk.c = -fexceptions -fasynchronous-unwind-tables
CFLAGS-recv_chk.c = -fexceptions -fasynchronous-unwind-tables
CFLAGS-recvfrom_chk.c = -fexceptions -fasynchronous-unwind-tables

# Need to make sure the settings here override what configure might have
# set up for us, so keep the CFLAGS/CPPFLAGS split logical as the order is:
# <user CFLAGS> <test CFLAGS> <user CPPFLAGS> <test CPPFLAGS>
CFLAGS-tst-longjmp_chk.c = -fexceptions -fasynchronous-unwind-tables
CPPFLAGS-tst-longjmp_chk.c = -D_FORTIFY_SOURCE=1
CFLAGS-tst-longjmp_chk2.c = -fexceptions -fasynchronous-unwind-tables
CPPFLAGS-tst-longjmp_chk2.c = -D_FORTIFY_SOURCE=1
CFLAGS-tst-longjmp_chk3.c = -fexceptions -fasynchronous-unwind-tables
CPPFLAGS-tst-longjmp_chk3.c = -D_FORTIFY_SOURCE=1

# We know these tests have problems with format strings, this is what
# we are testing.  Disable that warning.  They also generate warnings
# from warning attributes, which cannot be disabled via pragmas, so
# require -Wno-error to be used.
CFLAGS-tst-chk1.c = -Wno-format -Wno-error
CFLAGS-tst-chk2.c = -Wno-format -Wno-error
CFLAGS-tst-chk3.c = -Wno-format -Wno-error
CFLAGS-tst-chk4.cc = -Wno-format -Wno-error
CFLAGS-tst-chk5.cc = -Wno-format -Wno-error
CFLAGS-tst-chk6.cc = -Wno-format -Wno-error
CFLAGS-tst-lfschk1.c = -Wno-format -Wno-error
CFLAGS-tst-lfschk2.c = -Wno-format -Wno-error
CFLAGS-tst-lfschk3.c = -Wno-format -Wno-error
CFLAGS-tst-lfschk4.cc = -Wno-format -Wno-error
CFLAGS-tst-lfschk5.cc = -Wno-format -Wno-error
CFLAGS-tst-lfschk6.cc = -Wno-format -Wno-error
LDLIBS-tst-chk4 = -lstdc++
LDLIBS-tst-chk5 = -lstdc++
LDLIBS-tst-chk6 = -lstdc++
LDLIBS-tst-lfschk4 = -lstdc++
LDLIBS-tst-lfschk5 = -lstdc++
LDLIBS-tst-lfschk6 = -lstdc++

# backtrace_symbols only works if we link with -rdynamic.  backtrace
# requires unwind tables on most architectures.
CFLAGS-tst-backtrace2.c += -funwind-tables
CFLAGS-tst-backtrace3.c += -funwind-tables
CFLAGS-tst-backtrace4.c += -funwind-tables
CFLAGS-tst-backtrace5.c += -funwind-tables
CFLAGS-tst-backtrace6.c += -funwind-tables
LDFLAGS-tst-backtrace2 = -rdynamic
LDFLAGS-tst-backtrace3 = -rdynamic
LDFLAGS-tst-backtrace4 = -rdynamic
LDFLAGS-tst-backtrace5 = -rdynamic
LDFLAGS-tst-backtrace6 = -rdynamic

tests = backtrace-tst tst-longjmp_chk tst-chk1 tst-chk2 tst-chk3 \
	tst-lfschk1 tst-lfschk2 tst-lfschk3 test-strcpy_chk test-stpcpy_chk \
	tst-chk4 tst-chk5 tst-chk6 tst-lfschk4 tst-lfschk5 tst-lfschk6 \
	tst-longjmp_chk2 tst-backtrace2 tst-backtrace3 tst-backtrace4 \
	tst-backtrace5 tst-backtrace6

ifeq (,$(CXX))
tests-unsupported = tst-chk4 tst-chk5 tst-chk6 \
		    tst-lfschk4 tst-lfschk5 tst-lfschk6
endif

extra-libs = libSegFault libpcprofile
extra-libs-others = $(extra-libs)

libSegFault-routines = segfault
libSegFault-inhibit-o = $(filter-out .os,$(object-suffixes))

libpcprofile-routines = pcprofile
libpcprofile-inhibit-o = $(filter-out .os,$(object-suffixes))

others = pcprofiledump
install-bin = pcprofiledump
install-bin-script = xtrace

ifeq ($(build-shared),yes)
install-bin-script += catchsegv
endif
generated += catchsegv xtrace

include ../Rules

sLIBdir := $(shell echo $(slibdir) | sed 's,lib\(\|64\)$$,\\\\$$LIB,')

$(objpfx)catchsegv: catchsegv.sh $(common-objpfx)soversions.mk \
		    $(common-objpfx)config.make
	slibpfx=`echo $(slibdir)|sed 's/lib\(64\|\)$$/\\\\\\\\$$LIB/'`; \
	sed -e 's|@VERSION@|$(version)|' -e "s|@SLIB@|$$slibpfx|" \
	    -e 's|@PKGVERSION@|$(PKGVERSION)|' \
	    -e 's|@REPORT_BUGS_TO@|$(REPORT_BUGS_TO)|' $< > $@.new
	chmod 555 $@.new
	mv -f $@.new $@

$(objpfx)pcprofiledump: $(objpfx)pcprofiledump.o

$(objpfx)xtrace: xtrace.sh
	rm -f $@.new
	sed -e 's|@BASH@|$(BASH)|' -e 's|@VERSION@|$(version)|' \
	    -e 's|@SLIBDIR@|$(sLIBdir)|' -e 's|@BINDIR@|$(bindir)|' \
	    -e 's|@PKGVERSION@|$(PKGVERSION)|' \
	    -e 's|@REPORT_BUGS_TO@|$(REPORT_BUGS_TO)|' $^ > $@.new \
	&& rm -f $@ && mv $@.new $@ && chmod +x $@
