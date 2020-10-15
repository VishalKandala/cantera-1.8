#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2009/04/04 03:23:32 $
#  $Revision: 1.21 $
#
#  Copyright 2001 California Institute of Technology
#
###############################################################

.SUFFIXES :
.SUFFIXES :  .cpp .d .o .f90 .mod

CXX_FLAGS = -O3 -Wall   $(CXX_OPT)
FORT_FLAGS =  -O3

PURIFY=

CXX_OBJS = fct.o fctxml.o

BUILDINCDIR = ../../../build/include/cantera

INTERFACE_MODULE_OBJS = fct_interface.o fctxml_interface.o 

USER_MODULE_OBJS = cantera_xml.o cantera_thermo.o cantera_kinetics.o \
                   cantera_transport.o cantera_iface.o cantera_funcs.o cantera.o

MODULES = $(INTERFACE_MODULE_OBJS:_interface.o=.mod) $(USER_MODULE_OBJS)
OBJS = $(CXX_OBJS) $(USER_MODULE_OBJS)

DEPENDS = $(CXX_OBJS:.o=.d)
MODFILES = $(MODULES:.o=.mod)

# Fortran libraries
FORT_LIBS = 

# the C++ compiler
CXX = g++

# the Fortran 90/95 compiler
F90 = gfortran

# external libraries
EXT_LIBS =  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c 

# the directory where the Cantera libraries are located
CANTERA_LIBDIR=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu

LIB_DEPS = $(CANTERA_LIBDIR)/libctbase.a \
           $(CANTERA_LIBDIR)/libequil.a \
           $(CANTERA_LIBDIR)/libtransport.a \
           $(CANTERA_LIBDIR)/libthermo.a \
           $(CANTERA_LIBDIR)/libctnumerics.a \
           $(CANTERA_LIBDIR)/libzeroD.a \
           $(CANTERA_LIBDIR)/liboneD.a 

# the directory where module .mod files should be put
MODULE_DIR = /Cantera1.8-Radcal/build/include/cantera

CXX_INCLUDES = -I../../src/base -I../../src/thermo -I../../src/kinetics -I../../src/transport -I../../src/numerics -I../../src/oneD -I../../src/zeroD -I../../src/equil -I../../src/converters 

# flags passed to the C++ compiler/linker for the linking step
LCXX_FLAGS = -L$(CANTERA_LIBDIR) -O3 -Wall  

# how to compile C++ source files to object files
%.o : %.cpp
	$(PURIFY) $(CXX) -c $< $(CXX_INCLUDES) $(CXX_FLAGS)

%.o : %.f90
	$(PURIFY) $(F90) -c $< $(FORT_FLAGS)

%.mod : %_interface.f90
	$(PURIFY) $(F90) -c $< $(FORT_FLAGS)

%.mod : %.f90
	$(PURIFY) $(F90) -c $< $(FORT_FLAGS)

LIB_NAME=libfct.a

FTLIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/$(LIB_NAME)

all: $(FTLIB)

$(FTLIB): $(MODFILES) $(USER_MODULE_OBJS) $(CXX_OBJS) $(LIB_DEPS)
	$(RM)     $(FTLIB)
	ar ruv $(FTLIB) $(OBJS)

clean:
	$(RM) $(OBJS) $(FTLIB) $(MODFILES) *~
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )
	@(for lh in $(MODFILES); do \
            th=$(BUILDINCDIR)/"$${lh}" ; \
            if test -f "$${th}" ; then \
              $(RM) "$${th}"  ; \
              echo "$(RM) $${th}" ; \
            fi \
          done)


install:
	/usr/bin/install -c -m ug+rw,o+r $(FTLIB) /usr/local/cantera/lib
	/usr/bin/install -c -m ug+rw,o+r $(MODFILES) /usr/local/cantera/include/cantera

win-install:
	/usr/bin/install -c -m ug+rw,o+r  ../../../lib/fct.lib /usr/local/cantera/lib

%.d: %.cpp
	g++ -MM $(CXX_INCLUDES) $*.cpp > $*.d

depends: 
	$(MAKE) .depends

.depends: $(DEPENDS)
	cat *.d > .depends

cantera_thermo.o: fct.mod cantera_xml.mod cantera_thermo.f90
fct.mod: fct_interface.f90
fctxml.mod: fctxml_interface.f90

ifeq ($(wildcard .depends), .depends)
include .depends
endif
