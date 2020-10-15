#/bin/sh
#
# $Source: /cvsroot/cantera/cantera/ext/f2c_lapack/Makefile.in,v $
# $Author: hkmoffa $
# $Revision: 1.9 $
# $Date: 2009/01/12 19:34:14 $
#

.SUFFIXES :
.SUFFIXES : .c .o .d

do_ranlib = 1

PURIFY=

# the directory where the Cantera libraries are located
CANTERA_LIBDIR=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu

# the C++ compiler
CXX = g++

# the C compiler
CC = gcc

# C++ compile flags
PIC_FLAG=-fPIC
CXX_FLAGS = -O3 -Wall   $(PIC_FLAG)

# C compile flags
CFLAGS =   $(PIC_FLAG)

# Local include files
CXX_INCLUDES=-I../f2c_libs

# How to compile the dependency file
.c.d:
	g++ -MM  $(CFLAGS) $(CXX_INCLUDES) $*.c > $*.d

.c.o:
	$(PURIFY) gcc -c $< $(CFLAGS) $(CXX_INCLUDES)

# -----------------------------------------------

LAPACKLIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctlapack.a

all: $(LAPACKLIB)

OBJS = \
dbdsqr.o \
dgbtrf.o \
dgbtf2.o \
dgbtrs.o \
dgbsv.o \
dgebd2.o \
dgebrd.o \
dgelq2.o \
dgelqf.o \
dgelss.o \
dgeqr2.o \
dgeqrf.o \
dgetf2.o \
dgetrf.o \
dgetri.o \
dgetrs.o \
dlabad.o \
dlabrd.o \
dlacpy.o \
dlamch.o \
dlange.o \
dlapy2.o \
dlarf.o \
dlarfb.o \
dlarfg.o \
dlarft.o \
dlartg.o \
dlas2.o \
dlascl.o \
dlaset.o \
dlasq1.o \
dlasq2.o \
dlasq3.o \
dlasq4.o \
dlasq5.o \
dlasq6.o \
dlasr.o \
dlasrt.o \
dlassq.o \
dlasv2.o \
dlaswp.o \
dorg2r.o \
dorgbr.o \
dorgl2.o \
dorglq.o \
dorgqr.o \
dorm2r.o \
dormbr.o \
dorml2.o \
dormlq.o \
dormqr.o \
drscl.o \
dtrtri.o \
dtrti2.o \
ieeeck.o \
ilaenv.o 


# list of source files
SRCS = $(OBJS:.o=.c)

# List of dependency files to be created
DEPENDS=$(OBJS:.o=.d)


$(LAPACKLIB):  $(OBJS)
	ar ruv $(LAPACKLIB) $(OBJS) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(LAPACKLIB)
endif
# ------------------------------------------------
# Utility Targets

clean:
	$(RM) $(OBJS) $(LAPACKLIB) *.d .depends


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





