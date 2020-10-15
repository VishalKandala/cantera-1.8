#/bin/sh
# $License$
#
# $Id: Makefile.in,v 1.8 2008/12/30 21:49:41 hkmoffa Exp $
#
do_ranlib = 1                                                                                                                     
BLASLIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctblas.a

SUFFIXES=
SUFFIXES= .f .o

PURIFY=

PIC_FLAG=-fPIC

F_FLAGS = -O3   -fno-second-underscore $(PIC_FLAG)

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
idamax.o \
lsame.o \
xerbla.o 

# dznrm2.o \


#SRCS = $(OBJS:.o=.cpp)


$(BLASLIB):  $(OBJS)
	ar ruv $(BLASLIB) $(OBJS) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(ZEROD_LIB)
endif

%.o : %.f
	$(PURIFY) g77 -c $< $(F_FLAGS) 

clean:
	$(RM) $(OBJS) $(BLASLIB)

depends:

