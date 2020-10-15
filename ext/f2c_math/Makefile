#/bin/sh
#
# $Source: /cvsroot/cantera/cantera/ext/f2c_math/Makefile.in,v $
# $Author: hkmoffa $
# $Revision: 1.10 $
# $Date: 2008/12/30 21:49:42 $
#

.SUFFIXES :
.SUFFIXES : .c .cpp .d .o

do_ranlib = 1

PURIFY=

# the directory where the Cantera libraries are located
CANTERA_LIBDIR=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu

# the directory where Cantera include files may be found.
CANTERA_INCDIR=/Cantera1.8-Radcal/build/include/cantera

# the C++ compiler
CXX = g++

# the C compiler
CC = gcc

# C++ compile flags
PIC_FLAG=-fPIC
CXX_FLAGS = -O3 -Wall   $(CXX_OPT) $(PIC_FLAG)
CFLAGS =   $(CXX_OPT) $(PIC_FLAG)

# Local include files
CXX_INCLUDES=-I../f2c_libs

# How to compile the dependency file
.c.d:
	g++ -MM  $(CFLAGS) $(CXX_INCLUDES) $*.c > $*.d

.cpp.d:
	g++ -MM  $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

# How to compile a C file
.c.o:
	$(PURIFY) gcc -c $< -DHAVE_CONFIG_H $(CFLAGS) $(CXX_INCLUDES)

# How to compile a Cpp file
.cpp.o:
	$(PURIFY) g++ -c $< -DHAVE_CONFIG_H $(CXX_FLAGS) $(CXX_INCLUDES)


# -----------------------------------------------

LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctmath.a

all: $(LIB)

OBJS = \
mach.o \
ddaspk.o \
dgbefa.o \
dgbsl.o \
dgefa.o \
dgesl.o \
dp1vlu.o \
dpcoef.o \
dpolft.o \
fdump.o \
j4save.o \
pcoef.o \
polfit.o \
pvalue.o \
xercnt.o \
xerhlt.o \
xermsg.o \
xerprn.o \
xersve.o \
xgetua.o \
printstring.o

SRCS = $(OBJS:.o=.cpp)

# List of dependency files to be created
DEPENDS=$(OBJS:.o=.d)

# How to make the static library
$(LIB):  $(OBJS)
	ar ruv $(LIB) $(OBJS)
ifeq ($(do_ranlib),1)
	ranlib $(LIB)
endif

# ------------------------------------------------
# Utility Targets

clean:
	$(RM) $(OBJS) $(LIB) *.d .depends

# depends target
depends:
	$(RM) *.d .depends
	make .depends

.depends: $(DEPENDS)
	cat *.d > .depends

$(OBJS): Makefile

ifeq ($(wildcard .depends), .depends)
include .depends
endif

