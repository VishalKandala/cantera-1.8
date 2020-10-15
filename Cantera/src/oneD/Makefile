#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2008/12/30 21:49:41 $
#  $Revision: 1.16 $
#
#  Copyright 2002 California Institute of Technology
#
###############################################################

.SUFFIXES :
.SUFFIXES : .cpp .d .o

INCDIR = ../../../build/include/cantera/kernel
INSTALL_TSC = ../../../bin/install_tsc                      
do_ranlib = 1

PURIFY=

PIC_FLAG=-fPIC

CXX_FLAGS = -O3 -Wall   $(CXX_OPT) $(PIC_FLAG)
CXX_INCLUDES = -I../base -I../thermo -I../kinetics -I../transport -I../numerics 


OBJS    = MultiJac.o MultiNewton.o newton_utils.o OneDim.o\
          StFlow.o boundaries1D.o refine.o Sim1D.o Domain1D.o 
ONED_H  = Inlet1D.h   MultiJac.h  Sim1D.h         StFlow.h \
          Surf1D.h    Domain1D.h  MultiNewton.h   OneDim.h \
          Resid1D.h   Solid1D.h   refine.h

ONED_LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/liboneD.a

DEPENDS = $(OBJS:.o=.d)

%.d: Makefile %.o
	g++ -MM -DHAVE_CONFIG_H $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

.cpp.o:
	$(PURIFY) g++ -c $< -DHAVE_CONFIG_H $(CXX_FLAGS) $(CXX_INCLUDES)

all: $(ONED_LIB) .depends
	@(/usr/bin/install -c -d $(INCDIR))
	@(for lh in $(ONED_H) ; do \
          $(INSTALL_TSC) "$${lh}" $(INCDIR) ; \
        done)

$(ONED_LIB): $(OBJS)
	ar ruv $(ONED_LIB) $(OBJS) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(ONED_LIB)
endif

clean:        
	@(for lh in $(ONED_H) ; do \
            th=$(INCDIR)/"$${lh}" ; \
            if test -f "$${th}" ; then \
              $(RM) "$${th}"  ; \
              echo "$(RM) $${th}" ; \
            fi \
          done)
	$(RM) *.o *.d *~ $(ONED_LIB) .depends
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )

depends: 
	make .depends

.depends: $(DEPENDS)
	cat *.d > .depends

$(OBJS): Makefile

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

