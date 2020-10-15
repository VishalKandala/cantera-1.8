#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2009/02/11 01:50:58 $
#  $Revision: 1.10 $
#
#  Copyright 2002 California Institute of Technology
#
###############################################################

.SUFFIXES :
.SUFFIXES : .cpp .d .o .h

INCDIR = ../../../build/include/cantera/kernel
INSTALL_TSC = ../../../bin/install_tsc
do_ranlib = 1

do_kinetics = 1
do_heterokin    = 1
do_rxnpath = 1

debug_mode = 1
ifeq ($(debug_mode), 1)
   DEBUG_FLAG=-DDEBUG_MODE
else
   DEBUG_FLAG=
endif

PURIFY=

PIC_FLAG=-fPIC
# LOCAL_DEFS = -DDEBUG_SOLVESP
CXX_FLAGS = -O3 -Wall   $(LOCAL_DEFS) $(CXX_OPT) $(PIC_FLAG) $(DEBUG_FLAG)

# homogeneous kinetics

ifeq ($(do_kinetics),1)
KINETICS_OBJ=importKinetics.o GRI_30_Kinetics.o KineticsFactory.o \
             GasKinetics.o AqueousKinetics.o \
             FalloffFactory.o ReactionStoichMgr.o Kinetics.o solveSP.o
KINETICS_H = importKinetics.h GRI_30_Kinetics.h KineticsFactory.h \
             Kinetics.h GasKinetics.h \
             FalloffFactory.h  ReactionStoichMgr.h reaction_defs.h \
             FalloffMgr.h ThirdBodyMgr.h RateCoeffMgr.h ReactionData.h \
             RxnRates.h Enhanced3BConc.h StoichManager.h solveSP.h \
             AqueousKinetics.h
KINETICS   = $(KINETICS_OBJ) $(KINETICS_H)
endif


# heterogeneous kinetics

ifeq ($(do_heterokin),1)
HETEROKIN_OBJ=InterfaceKinetics.o ImplicitSurfChem.o 
HETEROKIN_H  =InterfaceKinetics.h ImplicitSurfChem.h EdgeKinetics.h
HETEROKIN    = $(HETEROKIN_OBJ)
endif

ifeq ($(do_rxnpath),1)
# reaction path analysis
RPATH_OBJ  = Group.o ReactionPath.o
RPATH_H    = Group.h ReactionPath.h
RPATH      = $(RPATH_OBJ)
endif

ALLKINETICS_OBJ = $(KINETICS_OBJ) $(HETEROKIN_OBJ) $(RPATH_OBJ) 

ALLKINETICS_H   = $(KINETICS_H) $(HETEROKIN_H) $(RPATH_H) 


CXX_INCLUDES = -I../base -I../thermo -I../numerics 
LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libkinetics.a

DEPENDS = $(ALLKINETICS_OBJ:.o=.d)

all: $(LIB) .depends
	@(/usr/bin/install -c -d $(INCDIR))
	@(for lh in $(ALLKINETICS_H) ; do \
	  $(INSTALL_TSC) "$${lh}" $(INCDIR) ; \
	done)
%.d: Makefile %.o
	g++ -MM $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

.cpp.o:
	$(PURIFY) g++ -c $< $(CXX_FLAGS) $(CXX_INCLUDES)

$(LIB): $(ALLKINETICS_OBJ) $(ALLKINETICS_H)
	ar ruv $(LIB) $(ALLKINETICS_OBJ) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(LIB)
endif

clean:
	@(for lh in dummy.h $(ALLKINETICS_H) ; do \
            th=$(INCDIR)/"$${lh}" ; \
	    if test -f "$${th}" ; then \
	      $(RM) "$${th}"  ; \
              echo "$(RM) $${th}" ; \
            fi \
	  done)
	@(if test -f $(LIB) ; then \
	    $(RM) $(LIB) ; \
            echo "$(RM) $(LIB)" ; \
          fi)
	$(RM) *.o *~  .depends *.d
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )

depends:
	make .depends

.depends: $(DEPENDS)
	cat $(DEPENDS) > .depends

$(ALLKINETICS_OBJ): Makefile

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

