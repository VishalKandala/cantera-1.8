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
PROG_NAME = basopt_red1

# the object files to be linked together. List those generated from Fortran
# and from C/C++ separately
OBJS = basopt_red1.o

# additional flags to be passed to the linker. If your program
# requires other external libraries, put them here
LINK_OPTIONS = 

# This variable determines whether we are making this example in the
# build tree environment or in the install tree environment.
in_CanteraBuildTree = 1

#############################################################################

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

# the directory where Cantera include files may be found.
ifeq ($(in_CanteraBuildTree),1)
CANTERA_INCROOTDIR=/Cantera1.8-Radcal/build/include
else
CANTERA_INCROOTDIR=/usr/local/cantera/include
endif
CANTERA_INCLUDES=-I$(CANTERA_INCROOTDIR) -I$(CANTERA_INCROOTDIR)/cantera

# LOCAL_DEFS = -DDEBUG_CHEMEQUIL
# LOCAL_DEFS = -DEBUG_BASISOPTIMIZE
#
# C++ compile flags
CXX_FLAGS = -O3 -Wall   $(CANTERA_INCLUDES) $(LOCAL_DEFS)

# Ending C++ linking libraries
LCXX_END_LIBS = -lctf2c -lm

# the directory where the Cantera libraries are located
ifeq ($(in_CanteraBuildTree),1)
CANTERA_LIBDIR=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu
else
CANTERA_LIBDIR=/usr/local/cantera/lib
endif

# required Cantera libraries
CANTERA_LIBS =   -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c -lctcxx

ifeq ($(in_CanteraBuildTree),1)
CANTERA_LIBS_DEP =  /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libuser.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/liboneD.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libzeroD.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libequil.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libkinetics.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libtransport.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libthermo.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctnumerics.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctmath.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libtpx.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctspectra.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libconverters.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctbase.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctf2c.a $(CANTERA_LIBDIR)/libctcxx.a
else
CANTERA_LIBS_DEP =  /usr/local/cantera/lib/libequil.a /usr/local/cantera/lib/libkinetics.a /usr/local/cantera/lib/libtransport.a /usr/local/cantera/lib/libthermo.a /usr/local/cantera/lib/libctnumerics.a /usr/local/cantera/lib/libctmath.a /usr/local/cantera/lib/libtpx.a /usr/local/cantera/lib/libctspectra.a /usr/local/cantera/lib/libconverters.a /usr/local/cantera/lib/libctbase.a /usr/local/cantera/lib/libctf2c.a $(CANTERA_LIBDIR)/libctcxx.a
endif
#
# Alternate form of dependencies: (uses a gnu make extensions)
ALT_LIBS_DEP := $(addprefix $(CANTER_LIBDIR),  libuser.a liboneD.a libzeroD.a libequil.a libkinetics.a libtransport.a libthermo.a libctnumerics.a libctmath.a libtpx.a libctspectra.a libconverters.a libctbase.a libctf2c.a libctcxx.a)

# flags passed to the C++ compiler/linker for the linking step
LCXX_FLAGS = -O3 -Wall     -L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu -L/usr/local/bin//lib 

# How to compile C++ source files to object files
.cpp.o:
	$(CXX) -c $< $(CXX_FLAGS)

# How to compile the dependency file
.cpp.d:
	g++ -MM $(CXX_FLAGS) $*.cpp > $*.d

# List of dependency files to be created
DEPENDS=$(OBJS:.o=.d)

# Program Name
PROGRAM = $(PROG_NAME)$(EXE_EXT)

all: $(PROGRAM)

$(PROGRAM): $(OBJS) $(CANTERA_LIBS_DEP)
	$(CXX) -o $(PROGRAM) $(OBJS) $(LCXX_FLAGS) $(LINK_OPTIONS) \
                  $(CANTERA_LIBS)  $(FORT_LIBS) \
                  $(LCXX_END_LIBS)

# Add an additional target for stability:
$(OBJS):  $(CANTERA_LIBDIR)/libctbase.a $(CANTERA_LIBDIR)/libthermo.a

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
	@ make -s $(PROGRAM)
endif
	@ ./runtest

clean:
	$(RM) $(OBJS) $(PROGRAM) $(DEPENDS) .depends
	../../bin/rm_cvsignore
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )

ifeq ($(wildcard .depends), .depends)
include .depends
endif

