#!/bin/sh

############################################################################
#
#  Makefile to compile and link a C++ application to 
#  Cantera.
#
#############################################################################

# the name of the executable program to be created
PROG_NAME = cxx_examples

# the object files to be linked together. List those generated from Fortran
# and from C/C++ separately
OBJS = examples.o kinetics_example1.o kinetics_example2.o \
       kinetics_example3.o  equil_example1.o \
       transport_example1.o transport_example2.o \
       rxnpath_example1.o

# additional flags to be passed to the linker. If your program
# requires other external libraries, put them here
LINK_OPTIONS = 


#############################################################################

# the Fortran compiler
FORT = gfortran

PURIFY=

# Fortran compile flags  
FORT_FLAGS = -O3   -fno-second-underscore 

# Fortran libraries
ifeq (1, 0)
FORT_LIBS = 
else
FORT_LIBS =
endif

# the C++ compiler
CXX = g++

# C++ compile flags
CXX_FLAGS = -O3 -Wall   

# external libraries
EXT_LIBS =  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c -lctcxx

# Ending C++ linking libraries
LCXX_END_LIBS = -lctf2c -lm


#------  you probably don't have to change anything below this line -----


# the directory where the Cantera libraries are located
CANTERA_LIBDIR=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu

# required Cantera libraries
CANTERA_LIBS =  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c -lctcxx

CANTERA_LIB_DEPS = $(CANTERA_LIBDIR)/libkinetics.a \
                   $(CANTERA_LIBDIR)/libtransport.a \
                   $(CANTERA_LIBDIR)/libthermo.a \
                   $(CANTERA_LIBDIR)/libctnumerics.a \
                   $(CANTERA_LIBDIR)/libctbase.a \
                   $(CANTERA_LIBDIR)/libctmath.a \
                   $(CANTERA_LIBDIR)/libtpx.a \
                   $(CANTERA_LIBDIR)/libconverters.a

ifeq (1, 1)
CANTERA_LAPACK_DEPS = $(CANTERA_LIBDIR)/libctblas.a \
                      $(CANTERA_LIBDIR)/libctlapack.a
endif

ifeq (1, 0)
CANTERA_CVODE_DEPS = $(CANTERA_LIBDIR)/libcvode.a
endif

LIB_DEPS = $(CANTERA_LIB_DEPS) $(CANTERA_LAPACK_DEPS) $(CANTERA_CVODE_DEPS)

# the directory where Cantera include files may be found.
CANTERA_INC=-I/Cantera1.8-Radcal/build/include

# flags passed to the C++ compiler/linker for the linking step
LCXX_FLAGS = -L$(CANTERA_LIBDIR)  -L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu -L/usr/local/bin//lib -O3 -Wall  

# how to compile C++ source files to object files
.cpp.o:
	$(PURIFY) $(CXX) -c $< $(CANTERA_INC) $(CXX_FLAGS)

# how to compile Fortran source files to object files
.f.o: 
	$(PURIFY) $(FORT) -c $< $(FORT_FLAGS)

PROGRAM = ./$(PROG_NAME)$(EXE_EXT)

all: .depends $(PROGRAM) 

DEPENDS=$(OBJS:.o=.d)

%.d:
	g++ -MM $(CANTERA_INC) $(CXX_FLAGS) $*.cpp > $*.d

$(PROGRAM): $(OBJS) $(LIB_DEPS)
	$(PURIFY) $(CXX) -o $(PROGRAM) $(OBJS) $(LCXX_FLAGS) $(CANTERA_LIBS) \
                   $(LINK_OPTIONS) $(EXT_LIBS)  \
                  $(LCXX_END_LIBS)


clean:
	$(RM) $(OBJS) $(PROGRAM) $(DEPENDS) .depends *~
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )

depends:
	$(MAKE) .depends

.depends: $(DEPENDS)
	cat *.d > .depends

TAGS:
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

