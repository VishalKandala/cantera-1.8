# $License$
#
# $Id: Makefile.in,v 1.8 2008/12/30 21:49:42 hkmoffa Exp $
#
#/bin/sh
.SUFFIXES :
.SUFFIXES : .f .d .o

LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/librecipes.a

do_ranlib = 1

PURIFY=

PIC_FLAG=-fPIC
F_FLAGS = -O3   -fno-second-underscore $(PIC_FLAG)

OBJS = simp1.o simp2.o simp3.o simplx.o 
SRCS = $(OBJS:.o=.cpp)


all:  $(LIB)

$(LIB): $(OBJS)
	ar ruv $(LIB) $(OBJS) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(LIB)
endif

%.o : %.f
	$(PURIFY) g77 -c $< $(F_FLAGS)

clean:
	$(RM) $(OBJS) $(LIB)

depends: 



