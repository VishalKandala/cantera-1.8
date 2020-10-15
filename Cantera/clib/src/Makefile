#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2008/12/30 21:49:41 $
#  $Revision: 1.19 $
#
#  Copyright 2001 California Institute of Technology
#
###############################################################


.SUFFIXES :
.SUFFIXES : .cpp .d .o

INSTALL_TSC = ../../../bin/install_tsc
do_ranlib = 1

PURIFY=

PIC_FLAG=-fPIC

CXX_FLAGS = -O3 -Wall   $(CXX_OPT) $(PIC_FLAG)

OBJS = ct.o Storage.o ctsurf.o ctrpath.o \
       ctreactor.o ctfunc.o ctxml.o ctonedim.o ctmultiphase.o
CLIB_H= Cabinet.h    ctreactor.h  clib_defs.h  ctfunc.h \
        ctnum.h ctsurf.h  ct.h   ctrpath.h      Storage.h \
        ctbdry.h    ctonedim.h    ctxml.h   ctmultiphase.h  ctstagn.h   

DEPENDS = $(OBJS:.o=.d)

# Fortran libraries
FORT_LIBS = 

shared_ctlib = 0

# the C++ compiler
CXX = g++

# external libraries
EXT_LIBS = -lzeroD -loneD  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c 

# the directory where the Cantera libraries are located
CANTERA_LIBDIR=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu
# ../../../lib
LIB_DEPS = $(CANTERA_LIBDIR)/libctbase.a \
           $(CANTERA_LIBDIR)/libequil.a \
           $(CANTERA_LIBDIR)/libtransport.a \
           $(CANTERA_LIBDIR)/libthermo.a \
           $(CANTERA_LIBDIR)/libctnumerics.a \
           $(CANTERA_LIBDIR)/libzeroD.a \
           $(CANTERA_LIBDIR)/liboneD.a 

# the directory where Cantera include files may be found.
CXX_INCLUDES = -I../../src/base -I../../src/thermo -I../../src/kinetics -I../../src/transport -I../../src/numerics -I../../src/oneD -I../../src/zeroD -I../../src/equil -I../../src/converters 

# flags passed to the C++ compiler/linker for the linking step
LCXX_FLAGS = -L$(CANTERA_LIBDIR) -O3 -Wall  

# how to compile C++ source files to object files
.cpp.o:
	$(PURIFY) $(CXX) -c $< $(CXX_INCLUDES) $(CXX_FLAGS)

%.d: Makefile %.o
	g++ -MM $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

LIB_NAME=libclib

ifeq ($(shared_ctlib),1)
CTLIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/$(LIB_NAME).so
else
CTLIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/$(LIB_NAME).a
endif

all: $(CTLIB) .depends
 
$(CTLIB): $(OBJS) $(LIB_DEPS)
	$(RM)     $(CTLIB)
ifeq ($(shared_ctlib),1)
	$(PURIFY) $(CXX) -o $(CTLIB) $(OBJS) $(LCXX_FLAGS)\
                -dynamic $(LINK_OPTIONS) \
                $(EXT_LIBS)  $(FORT_LIBS)
else
	ar ruv $(CTLIB) $(OBJS)
ifeq ($(do_ranlib),1)
	ranlib $(CTLIB)
endif
endif

clean:
	$(RM) $(OBJS) *.d $(CTLIB) .depends
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )


install:
	/usr/bin/install -c -d /usr/local/cantera/lib
	/usr/bin/install -c -c -m 644 $(CTLIB) /usr/local/cantera/lib
ifeq ($(do_ranlib),1)
ifeq ($(shared_ctlib),0)
	ranlib /usr/local/cantera/lib/$(LIB_NAME).a
endif
endif


win-install:
	/usr/bin/install -c -c ../../../lib/clib.lib /usr/local/cantera/lib/cantera

depends:
	make .depends

.depends: $(DEPENDS)
	cat *.d > .depends

$(OBJS): Makefile

ifeq ($(wildcard .depends), .depends)
include .depends
endif
