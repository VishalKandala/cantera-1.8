#/bin/sh

LIBDIR = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu
INCDIR = -I/Cantera1.8-Radcal/Cantera/src/
BINDIR = /Cantera1.8-Radcal/build/bin/x86_64-unknown-linux-gnu
build_ck = 1

PURIFY=

LCXX_FLAGS = -L$(LIBDIR)   -L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu -L/usr/local/bin//lib -O3 -Wall  
LOCAL_LIBS =  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c  

LL_DEPS= /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libuser.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/liboneD.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libzeroD.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libequil.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libkinetics.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libtransport.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libthermo.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctnumerics.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctmath.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libtpx.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctspectra.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libconverters.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctbase.a /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctf2c.a

LCXX_END_LIBS = -lctf2c -lm 

OBJS = ck2cti.o cti2ctml.o fixtext.o

DEPENDS = $(OBJS:.o=.d)

CONVLIB_DEP = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libconverters.a


progs = $(BINDIR)/cti2ctml $(BINDIR)/fixtext
ifeq ($(build_ck),1) 
exes =  $(progs) $(BINDIR)/ck2cti
else
exes = $(progs)
endif

.cpp.o:
	$(PURIFY) g++ -c $< -DHAVE_CONFIG_H  $(INCDIR)base $(INCDIR)converters  -O3 -Wall   $(CXX_FLAGS) 

all: $(exes)

ck: $(BINDIR)/ck2cti

$(BINDIR)/ck2cti: ck2cti.o $(CONVLIB_DEP) $(LL_DEPS)
	$(RM) $(BINDIR)/ck2cti
	$(PURIFY) g++ -o $(BINDIR)/ck2cti ck2cti.o $(LCXX_FLAGS) \
               -lconverters -lctbase -ltpx -lctcxx $(LOCAL_LIBS) $(LCXX_END_LIBS)

$(BINDIR)/cti2ctml: cti2ctml.o $(LL_DEPS)
	$(RM) $(BINDIR)/cti2ctml
	$(PURIFY) g++ -o $(BINDIR)/cti2ctml cti2ctml.o $(LCXX_FLAGS) $(LOCAL_LIBS) \
               $(LCXX_END_LIBS)

$(BINDIR)/fixtext: fixtext.o $(LL_DEPS)
	$(RM) $(BINDIR)/fixtext
	$(PURIFY) g++ -o $(BINDIR)/fixtext fixtext.o $(LCXX_FLAGS) \
               $(LOCAL_LIBS) $(LCXX_END_LIBS)

$(CONVLIB_DEP):
	cd ../../Cantera/src/converters; make

clean:
	$(RM) *.o *.*~ $(BINDIR)/cti2ctml $(BINDIR)/ck2cti $(BINDIR)/fixtext
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
        fi )

%.d:
	g++ -MM $(INCDIR)base $(INCDIR)converters -O3 -Wall   $(CXX_FLAGS) $*.cpp > $*.d

depends: $(DEPENDS)
	cat *.d &> .depends
	$(RM) $(DEPENDS)

ifeq ((test -e .depends),0)
include .depends
endif
