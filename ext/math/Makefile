#
# $Source: /cvsroot/cantera/cantera/ext/math/Makefile.in,v $
# $Author: hkmoffa $
# $Revision: 1.13 $
# $Date: 2008/12/30 21:58:10 $
#

.SUFFIXES :
.SUFFIXES : .f .d .o .cpp

do_ranlib = 1

LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctmath.a

all: $(LIB)

PURIFY=

PIC_FLAG=-fPIC

F_FLAGS = -O3   -fno-second-underscore $(PIC_FLAG)

OBJS = \
mach.o \
ddaspk.o \
dgbfa.o \
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
all = $(LIB)

$(LIB):  $(OBJS)
	ar ruv $(LIB) $(OBJS) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(LIB)
endif

%.o : %.c
	$(PURIFY) g++ -c $< -DHAVE_CONFIG_H  -O3 -Wall   -fPIC -I../.. $(INCLUDES)

%.o : %.cpp
	$(PURIFY) g++ -c $< -DHAVE_CONFIG_H  -O3 -Wall   -fPIC $(INCLUDES)
#
# Right now g77 is not known to PURIFY. Why I don't know.
#
%.o : %.f
	g77 -c $< $(F_FLAGS)

$(OBJS): Makefile

clean:
	$(RM) $(OBJS) $(LIB)

depends:
	echo '...'

 
