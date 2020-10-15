#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2009/07/17 15:32:51 $
#  $Revision: 1.13 $
#
#  Copyright 2002 California Institute of Technology
#
###############################################################

.SUFFIXES :
.SUFFIXES : .cpp .d .o .h

INCDIR = ../../../build/include/cantera/kernel
INSTALL_TSC = ../../../bin/install_tsc
do_ranlib = 1

debug_mode = 1
ifeq ($(debug_mode), 1)
   DEBUG_FLAG=-DDEBUG_MODE
else
   DEBUG_FLAG=
endif

use_sundials=1

SUNDIALS_INC=-I/usr/local/bin//include

PURIFY= 

PIC_FLAG=-fPIC

CXX_FLAGS = -O3 -Wall   $(LOCAL_DEFS) $(CXX_OPT) $(PIC_FLAG) $(DEBUG_FLAG)

NUMERICS_OBJ   = DenseMatrix.o funcs.o Func1.o \
                 ODE_integrators.o  BandMatrix.o DAE_solvers.o \
                 funcs.o sort.o SquareMatrix.o ResidJacEval.o NonlinearSolver.o

NUMERICS_H     = ArrayViewer.h   DenseMatrix.h \
                 funcs.h ctlapack.h Func1.h FuncEval.h \
                 polyfit.h\
                 BandMatrix.h Integrator.h DAE_Solver.h ResidEval.h sort.h \
                 SquareMatrix.h ResidJacEval.h NonlinearSolver.h

ifeq ($(use_sundials), 1)
  ODEPACKAGE_H        = CVodesIntegrator.h 
  ODEPACKAGE_OBJ      = CVodesIntegrator.o
else
  ODEPACKAGE_H        = CVodeInt.h
  ODEPACKAGE_OBJ      = CVodeInt.o
endif

TOTAL_H   = $(NUMERICS_H)   $(ODEPACKAGE_H)
TOTAL_OBJ = $(NUMERICS_OBJ) $(ODEPACKAGE_OBJ)

TTOTAL_H  = $(NUMERICS_H) CVode.h CVodesIntegrator.h

CXX_INCLUDES = -I../base  $(SUNDIALS_INC)
LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libctnumerics.a

DEPENDS = $(TOTAL_OBJ:.o=.d)

all: .depends $(LIB) 
	@(/usr/bin/install -c -d $(INCDIR))
	@(for lh in $(TOTAL_H) ; do \
	  $(INSTALL_TSC) "$${lh}" $(INCDIR) ; \
	done)
%.d: Makefile %.o
	g++ -MM $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

.cpp.o: 
	$(PURIFY) g++ -c $< $(CXX_FLAGS) $(CXX_INCLUDES)

$(LIB): $(TOTAL_OBJ) $(TOTAL_H)
	ar ruv $(LIB) $(TOTAL_OBJ) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(LIB)
endif

ODE_integrators.o: Makefile
	$(PURIFY) g++ -c ODE_integrators.cpp $(CXX_INCLUDES) $(SUNDIALS_INC) \
            $(CXX_FLAGS) 

ODE_integrators.d: ODE_integrators.cpp Makefile
	g++ -MM $(CXX_FLAGS) ODE_integrators.cpp $(CXX_INCLUDES) $(SUNDIALS_INC) \
             > ODE_integrators.d 

DAE_solvers.o: DAE_solvers.cpp Makefile
	$(PURIFY) g++ -c DAE_solvers.cpp $(CXX_INCLUDES) $(SUNDIALS_INC) $(CXX_FLAGS)

DAE_solvers.d: DAE_solvers.cpp Makefile
	g++ -MM $(CXX_FLAGS) DAE_solvers.cpp $(CXX_INCLUDES) $(SUNDIALS_INC) \
             > DAE_solvers.d  

clean:
	@(for lh in dummy.h $(TTOTAL_H) ; do \
            th=$(INCDIR)/"$${lh}" ; \
	    if test -f "$${th}" ; then \
	      $(RM) "$${th}"  ; \
              echo "$(RM) $${th}" ; \
            fi \
	  done)
	@(if test -f $(LIB) ; then \
	    $(RM) $(LIB) ; \
            echo "$(RM) $(LIB)" ; \
          fi)
	$(RM) *.o *~  .depends *.d *.a
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )

depends:
	make .depends

.depends: $(DEPENDS)
	cat $(DEPENDS) > .depends

$(NUMERICS_OBJ): Makefile

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

