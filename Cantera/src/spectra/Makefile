#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2009/04/04 03:08:28 $
#  $Revision: 1.7 $
#
#  Copyright 2007 California Institute of Technology
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

#SPECTRA_OBJ = rotor.o LineBroadener.o spectralUtilities.o
SPECTRA_OBJ = rotor.o LineBroadener.o 

#SPECTRA_H   = rotor.h LineBroadener.h Nuclei.h spectralUtilities.h
SPECTRA_H   = rotor.h LineBroadener.h  Nuclei.h spectralUtilities.h

CXX_INCLUDES = -I.  -I../base
LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctspectra.a

DEPENDS = $(SPECTRA_OBJ:.o=.d)

all: $(LIB) .depends
	@(/usr/bin/install -c -d $(INCDIR))
	@(for lh in $(SPECTRA_H) ; do \
	  $(INSTALL_TSC) "$${lh}" $(INCDIR) ; \
	done)
%.d:
	g++ -MM $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

.cpp.o:
	$(PURIFY) g++ -c $< $(CXX_FLAGS) $(CXX_INCLUDES)

$(LIB): $(SPECTRA_OBJ) $(SPECTRA_H)
	ar ruv $(LIB) $(SPECTRA_OBJ) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(LIB)
endif

clean:
	@(for lh in dummy.h $(SPECTRA_H) ; do \
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

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

