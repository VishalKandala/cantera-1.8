#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2008/12/30 21:49:41 $
#  $Revision: 1.17 $
#
#  Copyright 2002 California Institute of Technology
#
###############################################################

.SUFFIXES :
.SUFFIXES : .cpp .d .o .h

INCDIR = ../../../build/include/cantera/kernel
INSTALL_TSC = ../../../bin/install_tsc
do_ranlib = 1

PURIFY=

PIC_FLAG=-fPIC

CXX_FLAGS = -O3 -Wall   $(CXX_OPT) $(PIC_FLAG)

# stirred reactors
OBJS    = Reactor.o ReactorBase.o FlowDevice.o Wall.o ReactorNet.o \
          FlowReactor.o ConstPressureReactor.o ReactorFactory.o
ZEROD_H = Reactor.h ReactorBase.h FlowDevice.h Wall.h ReactorNet.h \
          flowControllers.h PID_Controller.h Reservoir.h FlowReactor.h \
          ConstPressureReactor.h ReactorFactory.h

CXX_INCLUDES = -I../base -I../thermo -I../kinetics -I../numerics 
ZEROD_LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libzeroD.a

DEPENDS = $(OBJS:.o=.d)

all: $(ZEROD_LIB) .depends
	@(/usr/bin/install -c -d $(INCDIR))
	@(for lh in $(ZEROD_H) ; do \
          $(INSTALL_TSC) "$${lh}" $(INCDIR) ; \
	done)

%.d: Makefile %.o
	g++ -MM  -DHAVE_CONFIG_H $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

.cpp.o:
	$(PURIFY) g++ -c $< -DHAVE_CONFIG_H $(CXX_FLAGS) $(CXX_INCLUDES)

$(ZEROD_LIB): $(OBJS) $(ZEROD_H)
	ar ruv $(ZEROD_LIB) $(OBJS) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(ZEROD_LIB)
endif

clean:
	@(for lh in $(ZEROD_H) ; do \
            th=$(INCDIR)/"$${lh}" ; \
            if test -f "$${th}" ; then \
              $(RM) "$${th}"  ; \
              echo "$(RM) $${th}" ; \
            fi \
          done)
	@(if test -f $(ZEROD_LIB) ; then \
            $(RM) $(ZEROD_LIB) ; \
            echo "$(RM) $(ZEROD_LIB)" ; \
          fi)
	$(RM) *.o *~ .depends *.d
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

