#!/bin/sh

############################################################################
#
#  Makefile to compile and link a C++ application to 
#  Cantera.
#
#############################################################################

# addition to suffixes
.SUFFIXES : .d

# the name of the executable program to be created
PROG_NAME = nacl_equil

# the object files to be linked together. List those generated from Fortran
# and from C/C++ separately
OBJS = nacl_equil.o

# additional flags to be passed to the linker. If your program
# requires other external libraries, put them here
LINK_OPTIONS = 

#############################################################################

on_DEBUG_MODE=1

# Check to see whether we are in the msvc++ environment
os_is_win = 0

# Fortran libraries
ifeq (1, 0)
FORT_LIBS = 
else
FORT_LIBS =
endif

# the C++ compiler
CXX = g++
#
# The directory where Cantera include files may be found.
#
CANTERA_INCDIR=/Cantera1.8-Radcal/build/include/cantera

INCLUDE_DIRS = -I$(CANTERA_INCDIR) 

# C++ compile flags
CXX_FLAGS = -O3 -Wall   $(INCLUDE_DIRS)

# Ending C++ linking libraries
LCXX_END_LIBS = -lctf2c -lm

# the directory where the Cantera libraries are located
CANTERA_LIBDIR=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu
#
# Setup The Cantera Interface
#
CANTERA_LIBS=  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c -lctcxx

CANTERA_LIBDEP = \
     $(CANTERA_LIBDIR)/libequil.a \
     $(CANTERA_LIBDIR)/libVCSnonideal.a \
     $(CANTERA_LIBDIR)/libkinetics.a \
     $(CANTERA_LIBDIR)/libtransport.a \
     $(CANTERA_LIBDIR)/libthermo.a \
     $(CANTERA_LIBDIR)/libctnumerics.a \
     $(CANTERA_LIBDIR)/libctmath.a \
     $(CANTERA_LIBDIR)/libtpx.a \
     $(CANTERA_LIBDIR)/libconverters.a \
     $(CANTERA_LIBDIR)/libctbase.a \
     $(CANTERA_LIBDIR)/libctlapack.a \
     $(CANTERA_LIBDIR)/libctblas.a \
     $(CANTERA_LIBDIR)/libctcxx.a 


# flags passed to the C++ compiler/linker for the linking step
LCXX_FLAGS = -O3 -Wall    -L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu -L/usr/local/bin//lib 

# How to compile C++ source files to object files
.cpp.o:
	g++ $(CXX_FLAGS) -c $< 

# How to compile the dependency file
.cpp.d:
	g++ -MM  $(CXX_FLAGS) $*.cpp > $*.d

# List of dependency files to be created
DEPENDS=$(OBJS:.o=.d)

# Program Name
PROGRAM = $(PROG_NAME)$(EXE_EXT)

all: .depends $(PROGRAM)

$(PROGRAM): $(OBJS) $(CANTERA_LIBDEP)
	$(CXX) -o $(PROGRAM) $(OBJS) $(LCXX_FLAGS) $(LINK_OPTIONS) \
                  $(CANTERA_LIBS)  $(FORT_LIBS)  $(LCXX_END_LIBS)

# depends target -> forces recalculation of dependencies
depends:
	$(RM) *.d .depends
	make .depends

.depends: $(DEPENDS)
	cat *.d > .depends

# Do the test -> For the windows vc++ environment, we have to skip checking on
#                whether the program is uptodate, because we don't utilize make
#                in that environment to build programs.
test:
ifeq ($(os_is_win), 1)
else
	make $(PROGRAM)
endif
	./runtest

clean:
	$(RM) $(OBJS) $(PROGRAM) $(DEPENDS) .depends diff.out out.txt \
               diff_csv.txt diff_out.txt err_out.txt vcs_equilibrate_res.csv
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )

ifeq ($(wildcard .depends), .depends)
include .depends
endif


