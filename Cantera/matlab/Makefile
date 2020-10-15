#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2009/07/06 23:52:40 $
#  $Revision: 1.33 $
#
#  Copyright 2001-2004 California Institute of Technology
#  See file License.txt for licensing information
#
###############################################################

LIBS =  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c  
SRCS = cantera/private/ctmethods.cpp \
       cantera/private/ctfunctions.cpp \
       cantera/private/xmlmethods.cpp \
       cantera/private/phasemethods.cpp \
       cantera/private/thermomethods.cpp \
       cantera/private/mixturemethods.cpp \
       cantera/private/kineticsmethods.cpp \
       cantera/private/transportmethods.cpp \
       cantera/private/reactormethods.cpp \
       cantera/private/reactornetmethods.cpp \
       cantera/private/wallmethods.cpp \
       cantera/private/flowdevicemethods.cpp \
       cantera/private/onedimmethods.cpp \
       cantera/private/surfmethods.cpp \
       cantera/private/funcmethods.cpp 


CANTERA_LIBDIR=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu
os_is_win=0

ifeq ($(os_is_win),0)
LIB_DEPS = $(CANTERA_LIBDIR)/libcantera.a $(CANTERA_LIBDIR)/libzeroD.a \
           $(CANTERA_LIBDIR)/liboneD.a \
           $(CANTERA_LIBDIR)/libtransport.a \
           $(CANTERA_LIBDIR)/libclib.a \
           $(CANTERA_LIBDIR)/libconverters.a 
else
LIB_DEPS = $(CANTERA_LIBDIR)/cantera.lib $(CANTERA_LIBDIR)/zeroD.lib \
           $(CANTERA_LIBDIR)/oneD.lib \
           $(CANTERA_LIBDIR)/transport.lib 
endif

DEPENDS = $(SRCS:.cpp=.d)

.cpp.d:
	g++ -MM $(CXX_INCLUDES) $*.cpp > $*.d

all: cantera/ctmethods.mexglx

cantera/ctmethods.mexglx: $(SRCS) $(LIBDEPS) Makefile
ifeq ($(os_is_win),0)
	/usr/bin/python2.6 setup_matlab.py /usr/local/cantera/bin /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu clib '$(LIBS)'
else
	/usr/bin/python2.6 setup_winmatlab.py
endif
	(default -nojvm -nosplash -r setup)
	rm -f setup.m 

install:
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera-demos
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@ThermoPhase/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@Mixture/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@Kinetics/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@Transport/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@Interface/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@Solution
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@XML_Node/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@Reactor/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@ReactorNet/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@Wall/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@FlowDevice/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/@Func/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/1D
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/1D/@Domain1D/private
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera/1D/@Stack/private
	cd cantera; \
            ( for iddd in *.m ctmethods*; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera;  done )
	cd cantera/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/private;  done )
	cd cantera/examples; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera-demos;  done )
	cd cantera/@ThermoPhase; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@ThermoPhase;  done )
	cd cantera/@ThermoPhase/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@ThermoPhase/private;  done )
	cd cantera/@Kinetics; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Kinetics;  done )
	cd cantera/@Kinetics/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Kinetics/private;  done )
	cd cantera/@Solution; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Solution;  done )
	cd cantera/@Transport; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Transport;  done )
	cd cantera/@Transport/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Transport/private;  done )
	cd cantera/@Interface; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Interface;  done )
	cd cantera/@Interface/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Interface/private;  done )
	cd cantera/@Mixture; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Mixture;  done )
	cd cantera/@Mixture/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Mixture/private;  done )
	cd cantera/@XML_Node; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@XML_Node;  done )
	cd cantera/@Reactor; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Reactor;  done )
	cd cantera/@Reactor/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Reactor/private;  done )
	cd cantera/@ReactorNet; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@ReactorNet;  done )
	cd cantera/@ReactorNet/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@ReactorNet/private;  done )
	cd cantera/@Wall; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Wall;  done )
	cd cantera/@Wall/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Wall/private;  done )
	cd cantera/@FlowDevice; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@FlowDevice;  done )
	cd cantera/@FlowDevice/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@FlowDevice/private;  done )
	cd cantera/@Func; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Func;  done )
	cd cantera/@Func/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/@Func/private;  done )
	cd cantera/1D; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/1D;  done )
	cd cantera/1D/@Domain1D; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/1D/@Domain1D;  done )
	cd cantera/1D/@Domain1D/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/1D/@Domain1D/private;  done )
	cd cantera/1D/@Stack; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/1D/@Stack;  done )
	cd cantera/1D/@Stack/private; \
            ( for iddd in *.m ; do  \
              /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera/1D/@Stack/private;  done )
	/usr/bin/install -c -d /usr/local/cantera/matlab/toolbox/cantera/cantera-tutorials 
	( for iddd in cantera/tutorial/*.m ; do  \
          /usr/bin/install -c -c $${iddd} /usr/local/cantera/matlab/toolbox/cantera/cantera-tutorials;  done )
	/usr/bin/install -c -d /usr/local/cantera/demos/matlab
	( for iddd in cantera/examples/*.m ; do  \
        /usr/bin/install -c -c $${iddd} /usr/local/cantera/demos/matlab;  done )
	/usr/bin/install -c -d /usr/local/cantera/tutorials/matlab
	( for iddd in cantera/tutorial/*.m ; do  \
          /usr/bin/install -c -c $${iddd} /usr/local/cantera/tutorials/matlab;  done )
	chown -R root /usr/local/cantera/demos/matlab
	chown -R root /usr/local/cantera/tutorials/matlab

clean:
	rm -f cantera/private/*.o
	rm -f cantera/ctmethods.mexglx

#depends: $(DEPENDS)
#	cat *.d > .depends
#	$(RM) $(DEPENDS) 

depends:
	echo "-"

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

run-demo:
	(cd /usr/local/cantera; matlab -nojvm -nosplash -r cantera_demos)

test-demo:
	(cd /usr/local/cantera/demos/matlab; matlab -nojvm -nosplash -r test_demos)

# end of file



