#!/bin/sh

# This Makefile builds a Fortran 90 application that uses Cantera.  By
# default, the main program file is 'demo.f90,' which prints out some
# properties of a reacting gas mixture. 

# To build program 'demo', simply type 'make', or 'make -f <this
# file>' if this file is named something other than 'Makefile.'  

# Once you have verified that the demo runs, edit this file to replace
# object file 'demo.o' with your own object file or files. 


#------------------------  edit this block ---------------------------------

# the name of the executable program to be created
PROG_NAME = demo

# the object files to be linked together. 
OBJS = demo.o 

# additional flags to be passed to the linker. If your program
# requires other external libraries, put them here
LINK_OPTIONS =   -L/usr/local/lib 

#---------------------------------------------------------------------------
# You probably don't need to edit anything below.

# the C++ compiler
CXX = g++

# C++ compile flags
CXX_FLAGS = -O3 -Wall  

# external libraries
EXT_LIBS = -lfct -lclib  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c -lctcxx -lstdc++ 

# the Fortran 90/95 compiler
F90 = gfortran

# Fortran libraries used to link fortran main programs
# using the CXX linker
FLIBS= 

# Fortran compile flags
FORT_FLAGS =  -O3

# the directory where the Cantera libraries are located
CANTERA_LIBDIR=/usr/local/cantera/lib

# the directory where Cantera include files may be found.
CANTERA_INCDIR=/usr/local/cantera/include

# the directory where Cantera Fortran 90 modules may be found.
CANTERA_MODULE_DIR=/usr/local/cantera/include/cantera

# flags passed to the C++ compiler/linker for the linking step
LCXXFLAGS = -L$(CANTERA_LIBDIR)  -L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu -L/usr/local/bin//lib

# how to compile C++ source files to object files
%.o : %.cpp
	$(CXX) -c $< -I$(CANTERA_INCDIR) $(CXX_FLAGS)

# how to compile Fortran 90/95 source files to object files
%.o : %.f90
	$(F90) -c $< -I$(CANTERA_MODULE_DIR) $(FORT_FLAGS)

PROGRAM = $(PROG_NAME)$(EXE_EXT)

DEPENDS = $(OBJS:.o=.d)

all: $(PROGRAM)

$(PROGRAM): $(OBJS)
	$(CXX) -o $(PROGRAM) $(OBJS) $(LCXXFLAGS) $(CANTERA_LIBS) $(LINK_OPTIONS) \
                    $(EXT_LIBS) $(FLIBS)  

%.d : %.cpp
	g++ -MM -I$(CANTERA_INCDIR) $*.cpp > $*.d

clean:
	$(RM) $(OBJS) $(PROGRAM)

depends: $(DEPENDS)
	cat *.d > .depends
	$(RM) $(DEPENDS) 

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif






