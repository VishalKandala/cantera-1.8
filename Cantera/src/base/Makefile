#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2009/02/11 19:55:56 $
#  $Revision: 1.8 $
#
#  Copyright 2002 California Institute of Technology
#
###############################################################

.SUFFIXES :
.SUFFIXES : .cpp .d .o .h

INCDIR = ../../../build/include/cantera/kernel
INSTALL_TSC = ../../../bin/install_tsc
do_ranlib = 1

debug_mode = 1
ifeq ($(debug_mode), 1)
   DEBUG_FLAG=-DDEBUG_MODE
else
   DEBUG_FLAG=
endif

PURIFY=

PIC_FLAG=-fPIC

CXX_FLAGS = -O3 -Wall   $(LOCAL_DEFS) $(CXX_OPT) $(PIC_FLAG) $(DEBUG_FLAG)

BASE_OBJ = ct2ctml.o ctml.o misc.o plots.o stringUtils.o xml.o clockWC.o\
           PrintCtrl.o LogPrintCtrl.o mdp_allo.o

BASE_H   = ct_defs.h ctexceptions.h logger.h XML_Writer.h \
           ctml.h plots.h stringUtils.h xml.h config.h utilities.h \
           Array.h vec_functions.h global.h FactoryBase.h clockWC.h \
           PrintCtrl.h LogPrintCtrl.h  mdp_allo.h

CXX_INCLUDES = -I. 
LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctbase.a

DEPENDS = $(BASE_OBJ:.o=.d)

all: $(LIB) .depends
	@(/usr/bin/install -c -d $(INCDIR))
	@(for lh in $(BASE_H) ; do \
	  $(INSTALL_TSC) "$${lh}" $(INCDIR) ; \
	done)

%.d: Makefile %.o
	g++ -MM $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

.cpp.o:
	$(PURIFY) g++ -c $< $(CXX_FLAGS) $(CXX_INCLUDES)

$(LIB): $(BASE_OBJ) $(BASE_H)
	ar ruv $(LIB) $(BASE_OBJ) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(LIB)
endif

clean:
	@(for lh in dummy.h $(BASE_H) ; do \
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

$(BASE_OBJ): Makefile

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

