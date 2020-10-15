#!/bin/sh

.SUFFIXES :
.SUFFIXES : .cpp .d .o  .h .f


# the object files to be linked together. 
OBJS = demo_ftnlib.o isentropic.o  ctlib.o

# additional flags to be passed to the linker. If your program
# requires other external libraries, put them here
LINK_OPTIONS = 


# the Fortran compiler
FORT = g77

# Fortran compile flags  
FORT_FLAGS = -O3   -fno-second-underscore 

# Fortran libraries
FORT_LIBS =  -lctf2c -lm  

# the C++ compiler
CXX = g++

# C++ compile flags
CXX_FLAGS = -O3 -Wall  

# external libraries
EXT_LIBS =  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c -lctcxx

# the directory where the Cantera libraries are located
CANTERA_LIBDIR=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu

# the directory where Cantera include files may be found.
CANTERA_INCDIR=/Cantera1.8-Radcal/build/include

# flags passed to the C++ compiler/linker for the linking step
LCXX_FLAGS = -L$(CANTERA_LIBDIR)  -L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu -L/usr/local/bin//lib -O3 -Wall  

# how to compile C++ source files to object files
.cpp.o:
	$(CXX) -c $< -I$(CANTERA_INCDIR) $(CXX_FLAGS)

# how to create a dependency file
.cpp.d:
	g++ -MM -I$(CANTERA_INCDIR) $(CXX_FLAGS) $(LOCAL_DEFNS) $*.cpp > $*.d


# how to compile Fortran source files to object files
.f.o: 
	$(FORT) -c $< $(FORT_FLAGS)

.f.d:
	@echo "$*.o: $*.f" | cat > $*.d 


PROGRAM = $(PROG_NAME)$(EXE_EXT)

DEPENDS = $(OBJS:.o=.d)

all: isentropic ctlib 

demo_ftnlib.o: /Cantera1.8-Radcal/tools/templates/f77/demo_ftnlib.cpp
	$(CXX) -c $< -I$(CANTERA_INCDIR) $(CXX_FLAGS)

demo_ftnlib.d: /Cantera1.8-Radcal/tools/templates/f77/demo_ftnlib.cpp
	g++ -MM -I$(CANTERA_INCDIR) $(CXX_FLAGS) $< > $*.d

isentropic: isentropic.o demo_ftnlib.o
	$(CXX) -o isentropic isentropic.o demo_ftnlib.o $(LCXX_FLAGS) $(CANTERA_LIBS) \
                $(LINK_OPTIONS) $(EXT_LIBS)  $(FORT_LIBS)

ctlib: ctlib.o demo_ftnlib.o
	$(CXX) -o ctlib ctlib.o demo_ftnlib.o $(LCXX_FLAGS) $(CANTERA_LIBS) \
               $(LINK_OPTIONS) $(EXT_LIBS)  $(FORT_LIBS)

test:
	make 
	./runtest

INSTALL_DIR=/usr/local/cantera/demos/f77

install:
	/usr/bin/install -c -d     $(INSTALL_DIR)
	/usr/bin/install -c       -c -m ug+rw,o+r f77demos.mak $(INSTALL_DIR)/Makefile
	/usr/bin/install -c       -c -m ug+rw,o+r  /Cantera1.8-Radcal/tools/templates/f77/demo_ftnlib.cpp $(INSTALL_DIR)
	@(for ihhh in *.f  *blessed* README.txt ; do  \
             /usr/bin/install -c        $${ihhh} -m ug+rw,o+r $(INSTALL_DIR) ; \
             echo "/usr/bin/install -c  $${ihhh} -m ug+rw,o+r $(INSTALL_DIR)" ; \
         done )
	/usr/bin/install -c        runtest  $(INSTALL_DIR) ;




clean:
	$(RM) $(OBJS) isentropic  ctlib *.d .depends \
	       diff* output_0.txt output_1.txt gri30.xml ct2ctml.log \
	       isentropic.dsp

depends: 
	$(MAKE) .depends


.depends: $(DEPENDS)
	cat *.d > .depends

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

