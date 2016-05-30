### src/Makefile.  Generated from Makefile.in by configure.

# Copyright (C) 1985, 1987-1988, 1993-1995, 1999-2014 Free Software
# Foundation, Inc.

# This file is part of GNU Emacs.

# GNU Emacs is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# GNU Emacs is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.


# Note that this file is edited by msdos/sed1v2.inp for MSDOS.  That
# script may need modifying in sync with changes made here.  Try to
# avoid shell-ism because the DOS build has to use the DOS shell.

SHELL = /bin/bash

# Here are the things that we expect ../configure to edit.
# We use $(srcdir) explicitly in dependencies so as not to depend on VPATH.
srcdir = .
# MinGW CPPFLAGS may use this.
abs_top_srcdir=/home/marcos/emacs-24.4
ntsource = $(srcdir)/../nt

CC = gcc -std=gnu99
WINDRES = 
CFLAGS = -g3 -O2
CPPFLAGS =   
LDFLAGS =  
EXEEXT = 
version = 24.4
# Substitute an assignment for the MAKE variable, because
# BSD doesn't have it as a default.

MKDIR_P = /bin/mkdir -p
# Don't use LIBS.  configure puts stuff in it that either shouldn't be
# linked with Emacs or is duplicated by the other stuff below.
# LIBS = -llockfile -lm -lxml2  -lSM -lICE -lXrender -lXft  -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0  -lMagickWand-6.Q16 -lMagickCore-6.Q16  -lrsvg-2 -lm -lgio-2.0 -lgdk_pixbuf-2.0 -lgobject-2.0 -lglib-2.0 -lcairo  -lX11 -lpthread   -ldbus-1 
LIBOBJS = 

lispsource = $(srcdir)/../lisp
lib = ../lib
libsrc = ../lib-src
etc = ../etc
leimdir = ${lispsource}/leim
oldXMenudir = ../oldXMenu
lwlibdir = ../lwlib

# Configuration files for .o files to depend on.
config_h = config.h $(srcdir)/conf_post.h

bootstrap_exe = ../src/bootstrap-emacs$(EXEEXT)

## ns-app if HAVE_NS, else empty.
OTHER_FILES = 

## Flags to pass for profiling builds
PROFILING_CFLAGS = 

## Flags to pass to the compiler to enable build warnings
WARN_CFLAGS = 
WERROR_CFLAGS = 

## Machine-specific CFLAGS.
C_SWITCH_MACHINE=
## System-specific CFLAGS.
C_SWITCH_SYSTEM=

GNUSTEP_CFLAGS=

## Define C_SWITCH_X_SITE to contain any special flags your compiler
## may need to deal with X Windows.  For instance, if you've defined
## HAVE_X_WINDOWS and your X include files aren't in a place that your
## compiler can find on its own, you might want to add "-I/..." or
## something similar.  This is normally set by configure.
C_SWITCH_X_SITE= -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/mirclient -I/usr/include/mircommon -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng12 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include  -I/usr/include/freetype2 

## Define LD_SWITCH_X_SITE to contain any special flags your loader
## may need to deal with X Windows.  For instance, if your X libraries
## aren't in a place that your loader can find on its own, you might
## want to add "-L/..." or something similar.  Only used if
## HAVE_X_WINDOWS.
## FIXME? configure sets a value for this, but it has never been
## substituted in this or any other Makefile. Cf C_SWITCH_X_SITE.
LD_SWITCH_X_SITE=

## This must come before LD_SWITCH_SYSTEM.
## If needed, a -rpath option that says where to find X windows at run time.
LD_SWITCH_X_SITE_RPATH=

## System-specific LDFLAGS.
LD_SWITCH_SYSTEM=

## This holds any special options for linking temacs only (i.e., not
## used by configure).
LD_SWITCH_SYSTEM_TEMACS=-Wl,-znocombreloc $(LD_SWITCH_X_SITE_RPATH)

## Flags to pass to ld only for temacs.
TEMACS_LDFLAGS = $(LD_SWITCH_SYSTEM) $(LD_SWITCH_SYSTEM_TEMACS)

## If available, the names of the paxctl and setfattr programs.
## On grsecurity/PaX systems, unexec will fail due to a gap between
## the bss section and the heap.  Older versions need paxctl to work
## around this, newer ones setfattr.  See Bug#11398 and Bug#16343.
PAXCTL = 
SETFATTR = 

## Some systems define this to request special libraries.
LIBS_SYSTEM=

## -lm, or empty.
LIB_MATH=-lm

## -lpthreads, or empty.
LIB_PTHREAD=-lpthread

LIBIMAGE=-ltiff -ljpeg -lpng12 -lz -lm -lgif -lXpm

XFT_LIBS=-lXrender -lXft 
LIBX_EXTRA=-lX11 $(XFT_LIBS)

FONTCONFIG_CFLAGS = -I/usr/include/freetype2 
FONTCONFIG_LIBS = -lfontconfig -lfreetype 
FREETYPE_CFLAGS = -I/usr/include/freetype2 
FREETYPE_LIBS = -lfreetype 
LIBOTF_CFLAGS = -I/usr/include/freetype2 
LIBOTF_LIBS = -lfreetype -lz -lpng12 -lotf -lfreetype 
M17N_FLT_CFLAGS = 
M17N_FLT_LIBS = -lm17n-core -lm17n-flt -lm17n-core 

LIB_ACL=-lacl
LIB_CLOCK_GETTIME=
LIB_EACCESS=
LIB_FDATASYNC=
LIB_TIMER_TIME=-lrt 

DBUS_CFLAGS = -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include 
DBUS_LIBS = -ldbus-1 
## dbusbind.o if HAVE_DBUS, else empty.
DBUS_OBJ = dbusbind.o

LIB_EXECINFO=

SETTINGS_CFLAGS = -pthread -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include  -pthread -I/usr/include/gconf/2 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include  -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include 
SETTINGS_LIBS = -lgio-2.0 -lgobject-2.0 -lglib-2.0  -lgconf-2 -lglib-2.0  -lgobject-2.0 -lglib-2.0 

## gtkutil.o if USE_GTK, else empty.
GTK_OBJ=gtkutil.o emacsgtkfixed.o

## gfilenotify.o if HAVE_GFILENOTIFY.
## inotify.o if HAVE_INOTIFY.
## w32notify.o if HAVE_W32NOTIFY.
NOTIFY_OBJ = gfilenotify.o
GFILENOTIFY_CFLAGS = -pthread -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include 
GFILENOTIFY_LIBS = -lgio-2.0 -lgobject-2.0 -lglib-2.0 

## -ltermcap, or -lncurses, or -lcurses, or "".
LIBS_TERMCAP=-ltinfo
## terminfo.o if TERMINFO, else tparam.o.
TERMCAP_OBJ=terminfo.o

LIBXMU=-lXmu

LIBXSM=-lSM -lICE

LIBXTR6=

## $(LIBXMU) -lXt $(LIBXTR6) -lXext if USE_X_TOOLKIT, else $(LIBXSM).
## Only used if HAVE_X_WINDOWS.
LIBXT_OTHER=$(LIBXSM)

## If !HAVE_X11 || USE_GTK, empty.
## Else if USE_X_TOOLKIT, $(lwlibdir)/liblw.a.
## Else $(oldXMenudir)/libXMenu11.a.
LIBXMENU=

## xmenu.o if HAVE_X_WINDOWS, else empty.
XMENU_OBJ=xmenu.o
## xterm.o xfns.o xselect.o xrdb.o xsmfns.o xsettings.o if
## HAVE_X_WINDOWS, else empty.
XOBJ=xterm.o xfns.o xselect.o xrdb.o xsmfns.o xsettings.o

# xgselect.o if linking with GLib, else empty
XGSELOBJ=xgselect.o

TOOLKIT_LIBW=-lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 

## Only used if HAVE_X11, in LIBX_OTHER.
LIBXT=$(TOOLKIT_LIBW) $(LIBXT_OTHER)

## If HAVE_X11, $(LIBXT) $(LIBX_EXTRA), else empty.
LIBX_OTHER=$(LIBXT) $(LIBX_EXTRA)

## LIBXMENU is empty if !HAVE_X_WINDOWS.
## LD_SWITCH_X_SITE should not be used if not using X, but nothing
## sets it at present, and if something ever does, it should be
## configure, which should set it to nil in non-X builds.
LIBX_BASE=$(LIBXMENU) $(LD_SWITCH_X_SITE)

## Only used for GNUstep
LIBS_GNUSTEP=

LIBSOUND=  -lasound 
CFLAGS_SOUND=  -I/usr/include/alsa 

RSVG_LIBS= -lrsvg-2 -lm -lgio-2.0 -lgdk_pixbuf-2.0 -lgobject-2.0 -lglib-2.0 -lcairo 
RSVG_CFLAGS= -pthread -I/usr/include/librsvg-2.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng12 -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 

IMAGEMAGICK_LIBS= -lMagickWand-6.Q16 -lMagickCore-6.Q16 
IMAGEMAGICK_CFLAGS= -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/x86_64-linux-gnu/ImageMagick-6 -I/usr/include/ImageMagick-6 -I/usr/include/x86_64-linux-gnu/ImageMagick-6 -I/usr/include/ImageMagick-6 

LIBXML2_LIBS = -lxml2 
LIBXML2_CFLAGS = -I/usr/include/libxml2 

LIBZ = -lz

XRANDR_LIBS = -lXrandr 
XRANDR_CFLAGS = 

XINERAMA_LIBS = -lXinerama 
XINERAMA_CFLAGS = 

## widget.o if USE_X_TOOLKIT, otherwise empty.
WIDGET_OBJ=

## sheap.o if CYGWIN, otherwise empty.
CYGWIN_OBJ=

## fontset.o fringe.o image.o if we have any window system
WINDOW_SYSTEM_OBJ=fontset.o fringe.o image.o

## dosfns.o msdos.o w16select.o if MSDOS.
MSDOS_OBJ =
## w16select.o termcap.o if MSDOS && HAVE_X_WINDOWS.
MSDOS_X_OBJ =

NS_OBJ=
## nsterm.o nsfns.o nsmenu.o nsselect.o nsimage.o nsfont.o macfont.o if HAVE_NS.
NS_OBJC_OBJ=
## Only set if NS_IMPL_GNUSTEP.
GNU_OBJC_CFLAGS=
## w32fns.o w32menu.c w32reg.o fringe.o fontset.o w32font.o w32term.o
## w32xfns.o w32select.o image.o w32uniscribe.o if HAVE_W32, else
## empty.
W32_OBJ=
## -lkernel32 -luser32 -lgdi32 -lole32 -lcomdlg32 lusp10 -lcomctl32
## --lwinspool if HAVE_W32, else empty.
W32_LIBS=

## emacs.res if HAVE_W32
EMACSRES = 
## emacs-*.manifest if HAVE_W32
EMACS_MANIFEST = 
## If HAVE_W32, compiler arguments for including
## the resource file in the binary.
## Cygwin: -Wl,emacs.res
## MinGW: emacs.res
W32_RES_LINK=

## Empty if !HAVE_X_WINDOWS
## xfont.o ftfont.o xftfont.o ftxfont.o if HAVE_XFT
## xfont.o ftfont.o ftxfont.o if HAVE_FREETYPE
## else xfont.o
FONT_OBJ=xfont.o ftfont.o xftfont.o ftxfont.o

## Empty for MinGW, cm.o for the rest.
CM_OBJ=cm.o

LIBGPM = -lgpm

## -lresolv, or empty.
LIBRESOLV = 

LIBSELINUX_LIBS = -lselinux

LIBGNUTLS_LIBS = -lgnutls 
LIBGNUTLS_CFLAGS = -I/usr/include/p11-kit-1 

LIB_PTHREAD_SIGMASK = 

INTERVALS_H = dispextern.h intervals.h composite.h

GETLOADAVG_LIBS = 

RUN_TEMACS = ./temacs

## Invoke ../nt/addsection for MinGW, ":" elsewhere.
TEMACS_POST_LINK = :
ADDSECTION = 
EMACS_HEAPSIZE = 
MINGW_TEMACS_POST_LINK = \
 mv temacs$(EXEEXT) temacs.tmp; \
 ../nt/addsection temacs.tmp temacs$(EXEEXT) EMHEAP $(EMACS_HEAPSIZE)

UNEXEC_OBJ = unexelf.o

CANNOT_DUMP=no

DEPDIR=deps
## -MMD -MF $(DEPDIR)/$*.d if AUTO_DEPEND; else empty.
DEPFLAGS=-MMD -MF ${DEPDIR}/$*.d -MP
## ${MKDIR_P} ${DEPDIR} (if AUTO_DEPEND); else ':'.
MKDEPDIR=${MKDIR_P} ${DEPDIR}

## DO NOT use -R.  There is a special hack described in lastfile.c
## which is used instead.  Some initialized data areas are modified
## at initial startup, then labeled as part of the text area when
## Emacs is dumped for the first time, and never changed again.
##
## -Demacs is needed to make some files produce the correct version
## for use in Emacs.
##
## FIXME? MYCPPFLAGS only referenced in etc/DEBUG.
ALL_CFLAGS=-Demacs $(MYCPPFLAGS) -I. -I$(srcdir) \
  -I$(lib) -I$(srcdir)/../lib \
  $(C_SWITCH_MACHINE) $(C_SWITCH_SYSTEM) $(C_SWITCH_X_SITE) \
  $(GNUSTEP_CFLAGS) $(CFLAGS_SOUND) $(RSVG_CFLAGS) $(IMAGEMAGICK_CFLAGS) \
  $(LIBXML2_CFLAGS) $(DBUS_CFLAGS) $(XRANDR_CFLAGS) $(XINERAMA_CFLAGS) \
  $(SETTINGS_CFLAGS) $(FREETYPE_CFLAGS) $(FONTCONFIG_CFLAGS) \
  $(LIBOTF_CFLAGS) $(M17N_FLT_CFLAGS) $(DEPFLAGS) \
  $(LIBGNUTLS_CFLAGS) $(GFILENOTIFY_CFLAGS) \
  $(WARN_CFLAGS) $(WERROR_CFLAGS) $(CFLAGS)
ALL_OBJC_CFLAGS=$(ALL_CFLAGS) $(GNU_OBJC_CFLAGS)

.SUFFIXES: .m
.c.o:
	@$(MKDEPDIR)
	$(CC) -c $(CPPFLAGS) $(ALL_CFLAGS) $(PROFILING_CFLAGS) $<
.m.o:
	@$(MKDEPDIR)
	$(CC) -c $(CPPFLAGS) $(ALL_OBJC_CFLAGS) $(PROFILING_CFLAGS) $<

## lastfile must follow all files whose initialized data areas should
## be dumped as pure by dump-emacs.
base_obj = dispnew.o frame.o scroll.o xdisp.o menu.o $(XMENU_OBJ) window.o \
	charset.o coding.o category.o ccl.o character.o chartab.o bidi.o \
	$(CM_OBJ) term.o terminal.o xfaces.o $(XOBJ) $(GTK_OBJ) $(DBUS_OBJ) \
	emacs.o keyboard.o macros.o keymap.o sysdep.o \
	buffer.o filelock.o insdel.o marker.o \
	minibuf.o fileio.o dired.o \
	cmds.o casetab.o casefiddle.o indent.o search.o regex.o undo.o \
	alloc.o data.o doc.o editfns.o callint.o \
	eval.o floatfns.o fns.o font.o print.o lread.o \
	syntax.o $(UNEXEC_OBJ) bytecode.o \
	process.o gnutls.o callproc.o \
	region-cache.o sound.o atimer.o \
	doprnt.o intervals.o textprop.o composite.o xml.o $(NOTIFY_OBJ) \
	profiler.o decompress.o \
	$(MSDOS_OBJ) $(MSDOS_X_OBJ) $(NS_OBJ) $(CYGWIN_OBJ) $(FONT_OBJ) \
	$(W32_OBJ) $(WINDOW_SYSTEM_OBJ) $(XGSELOBJ)
obj = $(base_obj) $(NS_OBJC_OBJ)

## Object files used on some machine or other.
## These go in the DOC file on all machines in case they are needed.
## Some of them have no DOC entries, but it does no harm to have them
## in the list, in case they ever add any such entries.
SOME_MACHINE_OBJECTS = dosfns.o msdos.o \
  xterm.o xfns.o xmenu.o xselect.o xrdb.o xsmfns.o fringe.o image.o \
  fontset.o dbusbind.o cygw32.o \
  nsterm.o nsfns.o nsmenu.o nsselect.o nsimage.o nsfont.o macfont.o \
  w32.o w32console.o w32fns.o w32heap.o w32inevt.o w32notify.o \
  w32menu.o w32proc.o w32reg.o w32select.o w32term.o w32xfns.o \
  w16select.o widget.o xfont.o ftfont.o xftfont.o ftxfont.o gtkutil.o \
  xsettings.o xgselect.o termcap.o

## gmalloc.o if !SYSTEM_MALLOC && !DOUG_LEA_MALLOC, else empty.
GMALLOC_OBJ=

## vm-limit.o if !SYSTEM_MALLOC, else empty.
VMLIMIT_OBJ=vm-limit.o

## ralloc.o if !SYSTEM_MALLOC && REL_ALLOC, else empty.
RALLOC_OBJ=

## Empty on Cygwin and MinGW, lastfile.o elsewhere.
PRE_ALLOC_OBJ=lastfile.o
## lastfile.o on Cygwin and MinGW, empty elsewhere.
POST_ALLOC_OBJ=

## List of object files that make-docfile should not be told about.
otherobj= $(TERMCAP_OBJ) $(PRE_ALLOC_OBJ) $(GMALLOC_OBJ) $(RALLOC_OBJ) \
  $(POST_ALLOC_OBJ) $(WIDGET_OBJ) $(LIBOBJS)

## All object files linked into temacs.  $(VMLIMIT_OBJ) should be first.
## (On MinGW, firstfile.o should be before vm-limit.o.)
FIRSTFILE_OBJ=
ALLOBJS = $(FIRSTFILE_OBJ) $(VMLIMIT_OBJ) $(obj) $(otherobj)

## Configure inserts the file lisp.mk at this point, defining $lisp.
### lisp.mk --- src/Makefile fragment for GNU Emacs

## Copyright (C) 1985, 1987-1988, 1993-1995, 1999-2014 Free Software
## Foundation, Inc.

## This file is part of GNU Emacs.

## GNU Emacs is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## GNU Emacs is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

### Commentary:

## This is the list of all Lisp files that might be loaded into the
## dumped Emacs.  Some of them are not loaded on all platforms, but
## the DOC file on every platform uses them (because the DOC file is
## supposed to be platform-independent).
## It is arranged like this because it is easier to generate it
## semi-mechanically from loadup.el this way.
## Eg something like:
##   sed -e 's/"[ )].*//' -n -e '/(load "/ s/.*load "//p' loadup.el | \
##   grep -vE 'site-|ldefs-boot'
## minus any duplicates.
## Note that you can generally just add a ".elc" extension to every file
## that does not have an explicit .el extension, but beware of any
## no-byte-compile ones.

## Confusingly, international/cp51932 and international/eucjp-ms are
## unconditionally loaded from language/japanese, instead of being
## loaded directly from loadup.el; FIXME.

## Note that this list should not include lisp files which might not
## be present, like site-load.el and site-init.el; this makefile
## expects them all to be either present or buildable.

## Place loaddefs.el first, so it gets generated first, since it is on
## the critical path (relevant in parallel compilations).

### Code:

## NB: This list is parsed by sed in the main src/Makefile.
## Do not change the formatting.
lisp = \
	$(lispsource)/loaddefs.el \
	$(lispsource)/loadup.el \
	$(lispsource)/emacs-lisp/byte-run.elc \
	$(lispsource)/emacs-lisp/backquote.elc \
	$(lispsource)/subr.elc \
	$(lispsource)/version.elc \
	$(lispsource)/widget.elc \
	$(lispsource)/custom.elc \
	$(lispsource)/emacs-lisp/map-ynp.elc \
	$(lispsource)/cus-start.elc \
	$(lispsource)/international/mule.elc \
	$(lispsource)/international/mule-conf.elc \
	$(lispsource)/env.elc \
	$(lispsource)/format.elc \
	$(lispsource)/bindings.elc \
	$(lispsource)/files.elc \
	$(lispsource)/emacs-lisp/macroexp.elc \
	$(lispsource)/cus-face.elc \
	$(lispsource)/faces.elc \
	$(lispsource)/button.elc \
	$(lispsource)/startup.elc \
	$(lispsource)/emacs-lisp/nadvice.elc \
	$(lispsource)/minibuffer.elc \
	$(lispsource)/abbrev.elc \
	$(lispsource)/simple.elc \
	$(lispsource)/help.elc \
	$(lispsource)/jka-cmpr-hook.elc \
	$(lispsource)/epa-hook.elc \
	$(lispsource)/international/mule-cmds.elc \
	$(lispsource)/case-table.elc \
	$(lispsource)/international/characters.elc \
	$(lispsource)/composite.elc \
	$(lispsource)/international/charprop.el \
	$(lispsource)/language/chinese.elc \
	$(lispsource)/language/cyrillic.elc \
	$(lispsource)/language/indian.elc \
	$(lispsource)/language/sinhala.elc \
	$(lispsource)/language/english.elc \
	$(lispsource)/language/ethiopic.elc \
	$(lispsource)/language/european.elc \
	$(lispsource)/language/czech.elc \
	$(lispsource)/language/slovak.elc \
	$(lispsource)/language/romanian.elc \
	$(lispsource)/language/greek.elc \
	$(lispsource)/language/hebrew.elc \
	$(lispsource)/language/japanese.elc \
	$(lispsource)/international/cp51932.el \
	$(lispsource)/international/eucjp-ms.el \
	$(lispsource)/language/korean.elc \
	$(lispsource)/language/lao.elc \
	$(lispsource)/language/tai-viet.elc \
	$(lispsource)/language/thai.elc \
	$(lispsource)/language/tibetan.elc \
	$(lispsource)/language/vietnamese.elc \
	$(lispsource)/language/misc-lang.elc \
	$(lispsource)/language/utf-8-lang.elc \
	$(lispsource)/language/georgian.elc \
	$(lispsource)/language/khmer.elc \
	$(lispsource)/language/burmese.elc \
	$(lispsource)/language/cham.elc \
	$(lispsource)/indent.elc \
	$(lispsource)/window.elc \
	$(lispsource)/frame.elc \
	$(lispsource)/term/tty-colors.elc \
	$(lispsource)/font-core.elc \
	$(lispsource)/facemenu.elc \
	$(lispsource)/emacs-lisp/syntax.elc \
	$(lispsource)/font-lock.elc \
	$(lispsource)/jit-lock.elc \
	$(lispsource)/mouse.elc \
	$(lispsource)/scroll-bar.elc \
	$(lispsource)/select.elc \
	$(lispsource)/emacs-lisp/timer.elc \
	$(lispsource)/isearch.elc \
	$(lispsource)/rfn-eshadow.elc \
	$(lispsource)/menu-bar.elc \
	$(lispsource)/emacs-lisp/lisp.elc \
	$(lispsource)/textmodes/page.elc \
	$(lispsource)/register.elc \
	$(lispsource)/textmodes/paragraphs.elc \
	$(lispsource)/progmodes/prog-mode.elc \
	$(lispsource)/emacs-lisp/lisp-mode.elc \
	$(lispsource)/textmodes/text-mode.elc \
	$(lispsource)/textmodes/fill.elc \
	$(lispsource)/newcomment.elc \
	$(lispsource)/replace.elc \
	$(lispsource)/emacs-lisp/tabulated-list.elc \
	$(lispsource)/buff-menu.elc \
	$(lispsource)/fringe.elc \
	$(lispsource)/emacs-lisp/regexp-opt.elc \
	$(lispsource)/image.elc \
	$(lispsource)/international/fontset.elc \
	$(lispsource)/dnd.elc \
	$(lispsource)/tool-bar.elc \
	$(lispsource)/dynamic-setting.elc \
	$(lispsource)/x-dnd.elc \
	$(lispsource)/term/common-win.elc \
	$(lispsource)/term/x-win.elc \
	$(lispsource)/w32-vars.elc \
	$(lispsource)/term/w32-win.elc \
	$(lispsource)/ls-lisp.elc \
	$(lispsource)/disp-table.elc \
	$(lispsource)/w32-common-fns.elc \
	$(lispsource)/dos-w32.elc \
	$(lispsource)/w32-fns.elc \
	$(lispsource)/dos-fns.elc \
	$(lispsource)/dos-vars.elc \
	$(lispsource)/term/pc-win.elc \
	$(lispsource)/term/internal.elc \
	$(lispsource)/term/ns-win.elc \
	$(lispsource)/mwheel.elc \
	$(lispsource)/emacs-lisp/float-sup.elc \
	$(lispsource)/vc/vc-hooks.elc \
	$(lispsource)/vc/ediff-hook.elc \
	$(lispsource)/electric.elc \
	$(lispsource)/uniquify.elc \
	$(lispsource)/tooltip.elc


### lisp.mk ends here


## Construct full set of libraries to be linked.
LIBES = $(LIBS) $(W32_LIBS) $(LIBS_GNUSTEP) $(LIBX_BASE) $(LIBIMAGE) \
   $(LIBX_OTHER) $(LIBSOUND) \
   $(RSVG_LIBS) $(IMAGEMAGICK_LIBS) $(LIB_ACL) $(LIB_CLOCK_GETTIME) \
   $(LIB_EACCESS) $(LIB_FDATASYNC) $(LIB_TIMER_TIME) $(DBUS_LIBS) \
   $(LIB_EXECINFO) $(XRANDR_LIBS) $(XINERAMA_LIBS) \
   $(LIBXML2_LIBS) $(LIBGPM) $(LIBRESOLV) $(LIBS_SYSTEM) \
   $(LIBS_TERMCAP) $(GETLOADAVG_LIBS) $(SETTINGS_LIBS) $(LIBSELINUX_LIBS) \
   $(FREETYPE_LIBS) $(FONTCONFIG_LIBS) $(LIBOTF_LIBS) $(M17N_FLT_LIBS) \
   $(LIBGNUTLS_LIBS) $(LIB_PTHREAD) $(LIB_PTHREAD_SIGMASK) \
   $(GFILENOTIFY_LIBS) $(LIB_MATH) $(LIBZ)

all: emacs$(EXEEXT) $(OTHER_FILES)
.PHONY: all

$(leimdir)/leim-list.el: bootstrap-emacs$(EXEEXT)
	cd ../leim && $(MAKE) $(MFLAGS) leim-list.el EMACS="$(bootstrap_exe)"

$(srcdir)/macuvs.h $(lispsource)/international/charprop.el: \
  bootstrap-emacs$(EXEEXT)
	cd ../admin/unidata && $(MAKE) $(MFLAGS) all EMACS="../$(bootstrap_exe)"

## The dumped Emacs is as functional and more efficient than
## bootstrap-emacs, so we replace the latter with the former.
## Strictly speaking, emacs does not depend directly on all of $lisp,
## since not all pieces are used on all platforms.  But DOC depends
## on all of $lisp, and emacs depends on DOC, so it is ok to use $lisp here.
emacs$(EXEEXT): temacs$(EXEEXT) $(ADDSECTION) \
                $(etc)/DOC $(lisp) $(leimdir)/leim-list.el \
                $(lispsource)/international/charprop.el
	if test "$(CANNOT_DUMP)" = "yes"; then \
	  rm -f emacs$(EXEEXT); \
	  ln temacs$(EXEEXT) emacs$(EXEEXT); \
	else \
	  LC_ALL=C $(RUN_TEMACS) -batch -l loadup dump || exit 1; \
	  test "X$(PAXCTL)" = X || $(PAXCTL) -zex emacs$(EXEEXT); \
	  rm -f bootstrap-emacs$(EXEEXT); \
	  ln emacs$(EXEEXT) bootstrap-emacs$(EXEEXT); \
	fi

## We run make-docfile twice because the command line may get too long
## on some systems.  The sed command operating on lisp.mk also reduces
## the length of the command line.  Unfortunately, no-one has any idea
## exactly how long the maximum safe command line length is on all the
## various systems that Emacs supports.  Obviously, the length depends
## on what your value of $srcdir is.  If the length restriction goes
## away, lisp.mk can be merged back into this file.
##
## $(SOME_MACHINE_OBJECTS) comes before $(obj) because some files may
## or may not be included in $(obj), but they are always included in
## $(SOME_MACHINE_OBJECTS).  Since a file is processed when it is mentioned
## for the first time, this prevents any variation between configurations
## in the contents of the DOC file.
##
$(etc)/DOC: $(libsrc)/make-docfile$(EXEEXT) $(obj) $(lisp)
	$(MKDIR_P) $(etc)
	-rm -f $(etc)/DOC
	$(libsrc)/make-docfile -d $(srcdir) $(SOME_MACHINE_OBJECTS) $(obj) > $(etc)/DOC
	$(libsrc)/make-docfile -a $(etc)/DOC -d $(lispsource) `sed -n -e 's| \\\\||' -e 's|^[ 	]*$$(lispsource)/||p' $(srcdir)/lisp.mk`

$(libsrc)/make-docfile$(EXEEXT):
	cd $(libsrc); $(MAKE) $(MFLAGS) make-docfile$(EXEEXT)

buildobj.h: Makefile
	for i in $(ALLOBJS); do \
	  echo "$$i" | sed 's,.*/,,; s/\.obj$$/\.o/; s/^/"/; s/$$/",/' \
	    || exit; \
	done >$@.tmp
	mv $@.tmp $@

globals.h: gl-stamp; @true

GLOBAL_SOURCES = $(base_obj:.o=.c) $(NS_OBJC_OBJ:.o=.m)

gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)
	$(libsrc)/make-docfile -d $(srcdir) -g $(obj) > gl.tmp
	$(srcdir)/../build-aux/move-if-change gl.tmp globals.h
	echo timestamp > $@

$(ALLOBJS): globals.h

$(lib)/libgnu.a: $(config_h)
	cd $(lib) && $(MAKE) libgnu.a

## We have to create $(etc) here because init_cmdargs tests its
## existence when setting Vinstallation_directory (FIXME?).
## This goes on to affect various things, and the emacs binary fails
## to start if Vinstallation_directory has the wrong value.
temacs$(EXEEXT): $(LIBXMENU) $(ALLOBJS) \
	         $(lib)/libgnu.a $(EMACSRES)
	$(CC) $(ALL_CFLAGS) $(TEMACS_LDFLAGS) $(LDFLAGS) \
	  -o temacs $(ALLOBJS) $(lib)/libgnu.a $(W32_RES_LINK) $(LIBES)
	$(MKDIR_P) $(etc)
	$(TEMACS_POST_LINK)
	test "$(CANNOT_DUMP)" = "yes" || \
	  test "X$(PAXCTL)" = X || $(PAXCTL) -r temacs$(EXEEXT)
	test "$(CANNOT_DUMP)" = "yes" || test -z "$(SETFATTR)" || \
	  $(SETFATTR) -n user.pax.flags -v r $@

## The following oldxmenu-related rules are only (possibly) used if
## HAVE_X11 && !USE_GTK, but there is no harm in always defining them.
$(lwlibdir)/liblw.a: $(config_h) globals.h lisp.h FORCE
	cd $(lwlibdir) && \
	  $(MAKE) $(MFLAGS) CC='$(CC)' CFLAGS='$(CFLAGS)' MAKE='$(MAKE)' \
	    liblw.a
$(oldXMenudir)/libXMenu11.a: FORCE
	cd $(oldXMenudir) && \
	  $(MAKE) $(MFLAGS) CC='$(CC)' CFLAGS='$(CFLAGS)' MAKE='$(MAKE)' \
	    libXMenu11.a
FORCE:
.PHONY: FORCE

../config.status: config.in epaths.in
	@echo "The file ${?:.in=.h} needs to be set up from $?."
	@echo "Please run the 'configure' script again."
	exit 1

doc.o: buildobj.h

emacs.res: $(ntsource)/emacs.rc \
	   $(ntsource)/icons/emacs.ico \
	   $(ntsource)/$(EMACS_MANIFEST)
	$(WINDRES) -O COFF --include-dir=$(srcdir)/../nt \
	  -o $@ $(ntsource)/emacs.rc

ns-app: emacs$(EXEEXT)
	cd ../nextstep && $(MAKE) $(MFLAGS) all

.PHONY: mostlyclean clean bootstrap-clean distclean maintainer-clean
.PHONY: versionclean extraclean

mostlyclean:
	rm -f temacs$(EXEEXT) core *.core \#* *.o libXMenu11.a liblw.a
	rm -f ../etc/DOC
	rm -f bootstrap-emacs$(EXEEXT) emacs-$(version)$(EXEEXT)
	rm -f buildobj.h
	rm -f globals.h gl-stamp
	rm -f *.res *.tmp
clean: mostlyclean
	rm -f emacs-*.*.*$(EXEEXT) emacs$(EXEEXT)
	-rm -rf $(DEPDIR)

## bootstrap-clean is used to clean up just before a bootstrap.
## It should remove all files generated during a compilation/bootstrap,
## but not things like config.status or TAGS.
bootstrap-clean: clean
	rm -f epaths.h config.h config.stamp stamp-h1
	if test -f ./.gdbinit; then \
	  mv ./.gdbinit ./.gdbinit.save; \
	  if test -f "$(srcdir)/.gdbinit"; then rm -f ./.gdbinit.save; \
	  else mv ./.gdbinit.save ./.gdbinit; fi; \
	fi

distclean: bootstrap-clean
	rm -f Makefile

maintainer-clean: distclean
	rm -f TAGS
versionclean:
	-rm -f emacs$(EXEEXT) emacs-*.*.*$(EXEEXT) ../etc/DOC*
extraclean: distclean
	-rm -f *~ \#*


ETAGS = ../lib-src/etags

ctagsfiles1 = [xyzXYZ]*.[hc]
ctagsfiles2 = [a-wA-W]*.[hc]
ctagsfiles3 = [a-zA-Z]*.m

## FIXME? In out-of-tree builds, should TAGS be generated in srcdir?

## This does not need to depend on ../lisp and ../lwlib TAGS files,
## because etags "--include" only includes a pointer to the file,
## rather than the file contents.
TAGS: $(srcdir)/$(ctagsfiles1) $(srcdir)/$(ctagsfiles2) $(srcdir)/$(ctagsfiles3)
	"$(ETAGS)" --include=../lisp/TAGS --include=$(lwlibdir)/TAGS \
	  --regex='{c}/[ 	]*DEFVAR_[A-Z_ 	(]+"\([^"]+\)"/' \
	  $(srcdir)/$(ctagsfiles1) $(srcdir)/$(ctagsfiles2) \
	  --regex='{objc}/[ 	]*DEFVAR_[A-Z_ 	(]+"\([^"]+\)"/' \
	  $(srcdir)/$(ctagsfiles3)

## Arrange to make tags tables for ../lisp and ../lwlib,
## which the above TAGS file for the C files includes by reference.
../lisp/TAGS:
	cd ../lisp && $(MAKE) TAGS ETAGS="$(ETAGS)"

$(lwlibdir)/TAGS:
	cd $(lwlibdir) && $(MAKE) TAGS ETAGS="$(ETAGS)"

tags: TAGS ../lisp/TAGS $(lwlibdir)/TAGS
.PHONY: tags


### Bootstrapping.

## Bootstrapping right is difficult because of the circular dependencies.
## Furthermore, we have to deal with the fact that many compilation targets
## such as loaddefs.el or *.elc can typically be produced by any old
## Emacs executable, so we would like to avoid rebuilding them whenever
## we build a new Emacs executable.
## To solve the circularity, we use 2 different Emacs executables,
## "emacs" is the main target and "bootstrap-emacs" is the one used
## to build the *.elc and loaddefs.el files.
## To solve the freshness issue, we used to use a third file "witness-emacs"
## which was used to witness the fact that there is a bootstrap-emacs
## executable, and then have dependencies on witness-emacs rather than
## bootstrap-emacs, but that lead to problems in parallel builds (because
## witness-emacs needed to be free from dependencies (to avoid rebuilding
## it), so it was compiled in parallel, leading typically to having 2
## processes dumping bootstrap-emacs at the same time).
## So instead, we replace the witness-emacs dependencies by conditional
## bootstrap-dependencies (via $(BOOTSTRAPEMACS)).  Of course, since we do
## not want to rely on GNU Make features, we have to rely on an external
## script to do the conditional part of the dependency
## (i.e. see the $(SUBDIR) rule ../Makefile.in).

.SUFFIXES: .elc .el

## These suffix rules do not allow additional dependencies, sadly, so
## instead of adding a $(BOOTSTRAPEMACS) dependency here, we add it
## separately below.
## With GNU Make, we would just say "%.el : %.elc $(BOOTSTRAPEMACS)"
.el.elc:
	@cd ../lisp; $(MAKE) $(MFLAGS) compile-onefile \
	                     THEFILE=$< EMACS="$(bootstrap_exe)"

## Since the .el.elc rule cannot specify an extra dependency, we do it here.
$(lisp): $(BOOTSTRAPEMACS)

## VCSWITNESS points to the file that holds info about the current checkout.
## We use it as a heuristic to decide when to rebuild loaddefs.el.
## If empty it is ignored; the parent makefile can set it to some other value.
VCSWITNESS =

$(lispsource)/loaddefs.el: $(BOOTSTRAPEMACS) $(VCSWITNESS)
	cd ../lisp; $(MAKE) $(MFLAGS) autoloads EMACS="$(bootstrap_exe)"

## Dump an Emacs executable named bootstrap-emacs containing the
## files from loadup.el in source form.
bootstrap-emacs$(EXEEXT): temacs$(EXEEXT)
	cd ../lisp; $(MAKE) $(MFLAGS) update-subdirs
	if test "$(CANNOT_DUMP)" = "yes"; then \
	  rm -f bootstrap-emacs$(EXEEXT); \
	  ln temacs$(EXEEXT) bootstrap-emacs$(EXEEXT); \
	else \
	  $(RUN_TEMACS) --batch --load loadup bootstrap || exit 1; \
	  test "X$(PAXCTL)" = X || $(PAXCTL) -zex emacs$(EXEEXT); \
	  mv -f emacs$(EXEEXT) bootstrap-emacs$(EXEEXT); \
	fi
	@: Compile some files earlier to speed up further compilation.
	cd ../lisp; $(MAKE) $(MFLAGS) compile-first EMACS="$(bootstrap_exe)"

## Insert either autodeps.mk (if AUTO_DEPEND), else deps.mk.
### autodeps.mk --- src/Makefile fragment for GNU Emacs

## This is inserted in src/Makefile if AUTO_DEPEND=yes.

-include $(ALLOBJS:%.o=${DEPDIR}/%.d)


### Makefile.in ends here
