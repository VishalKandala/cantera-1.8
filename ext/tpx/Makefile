#/bin/sh
#
# $Id: Makefile.in,v 1.17 2009/03/28 19:10:17 hkmoffa Exp $
#
.SUFFIXES :
.SUFFIXES : .cpp .d .o

do_ranlib = 1

PURIFY=

PIC_FLAG=-fPIC
CXX_FLAGS = -O3 -Wall   $(CXX_OPT) $(PIC_FLAG)

COBJS = Methane.o Nitrogen.o Oxygen.o Water.o Hydrogen.o RedlichKwong.o \
        CarbonDioxide.o Heptane.o lk.o Sub.o utils.o HFC134a.o

CXX_LIBS = 
CXX_INCLUDES = -I../include 
TPLIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libtpx.a

DEPENDS = $(COBJS:.o=.d)

all:  $(TPLIB) .depends

%.d: Makefile %.o
	g++ -MM $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

.cpp.o: 
	$(PURIFY) g++ -c $< -DHAVE_CONFIG_H $(CXX_FLAGS) $(CXX_INCLUDES)

.f.o:
	$(PURIFY) g77 -c $< $(F77_FLAGS) 

$(TPLIB): $(COBJS) $(FOBJS)
	ar ruv $(TPLIB) $(COBJS) $(FOBJS) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(TPLIB)
endif

clean:
	$(RM) $(COBJS) $(FOBJS) *~ *.d .depends

depends: 
	make .depends

.depends: $(DEPENDS) 
	cat *.d > .depends

$(COBJS): Makefile

ifeq ($(wildcard .depends), .depends)
include .depends
endif

