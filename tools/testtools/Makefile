#/bin/sh

LIBDIR = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu
INCDIR = /Cantera1.8-Radcal/build/include/cantera
BINDIR = /Cantera1.8-Radcal/bin
BBINDIR = /Cantera1.8-Radcal/build/bin/x86_64-unknown-linux-gnu
build_ck = 1

PURIFY=

LCXX_FLAGS = -L$(LIBDIR)   -L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu -L/usr/local/bin//lib -O3 -Wall  
LOCAL_LIBS = -lcantera -lckreader -lcvode -lctmath @LAPACK_LIBRARY@ @BLAS_LIBRARY@ -lctcxx

LCXX_END_LIBS = -lctf2c -lm

OBJS = mdp_allo.o csvdiff.o tok_input_util.o
DEPENDS = $(OBJS:.o=.d)

CXX_FLAGS=-O3 -Wall  
CONFIGDEFS=-DHAVE_CONFIG_H

# Optimization is turned off (-O0) because a strange interal compiler
# error results when using g++ 3.0 on Mac OS X. Optimization should
# not be needed here anyway.

.cpp.o:
	$(PURIFY) g++ -c $< -I$(INCDIR) -O3 -Wall   -O0

all: $(BINDIR)/csvdiff $(BBINDIR)/csvdiff

$(BINDIR)/csvdiff: mdp_allo.o csvdiff.o tok_input_util.o
	$(PURIFY) g++ -o $(BINDIR)/csvdiff  mdp_allo.o csvdiff.o tok_input_util.o \
	 $(LCXX_FLAGS) $(LCXX_END_LIBS) 

$(BBINDIR)/csvdiff: $(BINDIR)/csvdiff
	cp -f $(BINDIR)/csvdiff $(BBINDIR)

clean:
	$(RM) *.o *.*~ csvdiff $(BINDIR)/csvdiff $(BBINDIR)/csvdiff

%.d:
	g++ -MM -MM -I$(INCDIR) $(CXX_FLAGS) $*.cpp > $*.d

depends: $(DEPENDS)
	cat *.d &> .depends
	$(RM) $(DEPENDS)

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif
