#/bin/sh
#/bin/sh
#
# $Revision: 1.10 $
# $Date: 2009/01/12 19:34:14 $
#

.SUFFIXES :
.SUFFIXES : .c .d .o

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

# C compile flags
CFLAGS =   $(CXX_OPT) $(PIC_FLAG)

# Local include files
CXX_INCLUDES=-I../f2c_libs

# How to compile the dependency file
.c.d:
	g++ -MM  $(CFLAGS) $(CXX_INCLUDES) $*.c > $*.d

# How to compile a C file
.c.o:
	$(PURIFY) gcc -c $< -DHAVE_CONFIG_H $(CFLAGS) $(CXX_INCLUDES)


# -----------------------------------------------

BLASLIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctblas.a

all: $(BLASLIB)

OBJS = \
dasum.o \
daxpy.o \
dcabs1.o \
dcopy.o \
ddot.o \
dgbmv.o \
dgemm.o \
dgemv.o \
dger.o \
dnrm2.o \
drot.o \
drotg.o \
drotm.o \
drotmg.o \
dsbmv.o \
dscal.o \
dsdot.o \
dspmv.o \
dspr.o \
dspr2.o \
dswap.o \
dsymm.o \
dsymv.o \
dsyr.o \
dsyr2.o \
dsyr2k.o \
dsyrk.o \
dtbmv.o \
dtbsv.o \
dtpmv.o \
dtpsv.o \
dtrmm.o \
dtrmv.o \
dtrsm.o \
dtrsv.o \
dzasum.o \
dznrm2.o \
idamax.o \
lsame.o \
xerbla.o 

SRCS = $(OBJS:.o=.cpp)

# List of dependency files to be created
DEPENDS=$(OBJS:.o=.d)

# rule to make library
$(BLASLIB):  $(OBJS)
	ar ruv $(BLASLIB) $(OBJS) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(BLASLIB)
endif


# ------------------------------------------------
# Utility Targets

clean:
	$(RM) $(OBJS) $(BLASLIB) *.d .depends

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

