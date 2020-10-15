#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2008/12/30 21:49:41 $
#  $Revision: 1.17 $
#
#  Copyright 2001 California Institute of Technology
#
###############################################################


.SUFFIXES :
.SUFFIXES : .cpp .d .o .h

PIC_FLAG=-fPIC
CXX_FLAGS = -O3 -Wall   $(CXX_OPT) $(PIC_FLAG)

OBJS =  importPhase.o

DEPENDS = $(OBJS:.o=.d)

PURIFY=

PIC_FLAG=-fPIC
CXX_FLAGS = -O3 -Wall   $(CXX_OPT) $(PIC_FLAG)


# the directory where Cantera include files may be found.
CXX_INCLUDES = -I../../src/base -I../../src/thermo 

# how to compile C++ source files to object files
.cpp.o:
	$(PURIFY) g++ -c $< $(CXX_INCLUDES) $(CXX_FLAGS)

%.d: Makefile %.o
	g++ -MM $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

LIB_NAME=libctcxx
CXXLIB=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/$(LIB_NAME).a

all: .depends $(CXXLIB)

$(CXXLIB): $(OBJS)
	ar ruv $(CXXLIB) $(OBJS) 

clean:
	$(RM) $(OBJS) *.d $(CXXLIB)
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )

install:
	/usr/bin/install -c $(CXXLIB) /usr/local/cantera/lib/cantera

depends: 
	make .depends

.depends: $(DEPENDS)
	cat $(DEPENDS) > .depends

$(OBJS): Makefile

ifeq ($(wildcard .depends), .depends)
include .depends
endif
