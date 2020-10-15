#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2008/12/30 21:49:41 $
#  $Revision: 1.19 $
#
#  Copyright 2002 California Institute of Technology
#
###############################################################

.SUFFIXES :
.SUFFIXES : .cpp .d .o .h

INCDIR = ../../../build/include/cantera/kernel/converters
INSTALL_TSC = ../../../bin/install_tsc
do_ranlib = 1

PURIFY=

PIC_FLAG=-fPIC

CXX_FLAGS = -O3 -Wall   $(CXX_OPT) $(PIC_FLAG)

OBJS = atomicWeightDB.o CKParser.o CKReader.o Reaction.o ckr_utils.o \
       thermoFunctions.o writelog.o ck2ct.o Species.o NASA9Parser.o
# ck2ctml.o
CONV_H = CKReader.h      thermoFunctions.h \
         Element.h    Reaction.h      CKParser.h    \
         ckr_utils.h  RxnSpecies.h    writelog.h \
         ck2ct.h      ckr_defs.h      Constituent.h   \
         Species.h

CXX_INCLUDES = -I. -I../base -I../numerics
CONV_LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libconverters.a

DEPENDS = $(OBJS:.o=.d)

all: .depends $(CONV_LIB)
	@(/usr/bin/install -c -d $(INCDIR))
	@(for lh in $(CONV_H) ; do \
          $(INSTALL_TSC) "$${lh}" $(INCDIR) ; \
        done)

%.d: Makefile %.o
	g++ -MM $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

.cpp.o:
	$(PURIFY) g++ -c $< $(CXX_FLAGS) $(CXX_INCLUDES)

$(CONV_LIB): $(OBJS)
	ar ruv $(CONV_LIB) $(OBJS) 
ifeq ($(do_ranlib),1)
	ranlib $(CONV_LIB)
endif

clean:
	@(for lh in $(CONV_H) ; do \
            th=$(INCDIR)/"$${lh}" ; \
            if test -f "$${th}" ; then \
              $(RM) "$${th}"  ; \
              echo "$(RM) $${th}" ; \
            fi \
          done)
	$(RM) *.o *~ $(CONV_LIB) .depends
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )

CKParser.o: CKParser.cpp
	g++ -c CKParser.cpp $(CXX_FLAGS) $(CXX_INCLUDES) -O0

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

