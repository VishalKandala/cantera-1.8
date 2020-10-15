#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2008/12/30 21:49:41 $
#  $Revision: 1.16 $
#
#  Copyright 2002 California Institute of Technology
#
###############################################################

.SUFFIXES :
.SUFFIXES : .cpp .c .d .o .h 

INCDIR = ../../../build/include/cantera/kernel
INSTALL_TSC = ../../../bin/install_tsc
do_ranlib = 1

do_VCSnonideal = 0
#
# Purify Options - instrument code for debugging and quantitification
#
PURIFY=
#
# Decide whether ot use the linear programmaing module lookalike
# (from Goodwin's code). Both should produce the same results.
do_AltLinProg = 1

debug_mode = 1
ifeq ($(debug_mode), 1)
   DEBUG_FLAG=-DDEBUG_MODE
else
   DEBUG_FLAG=
endif
#LOCAL_DEFS=-DDEBUG_MODE

#
# Local Define to turn on if you want to debug ChemEquil: or 
# BasisOptimize
#
#LOCAL_DEFS=-DDEBUG_MODE
#

ifeq ($(do_AltLinProg), 1)
DALT_STR=-DALTLINPROG
endif
LOCAL_DEFS=  $(DALT_STR)
#
#
PIC_FLAG=-fPIC

CXX_FLAGS = -O3 -Wall   $(LOCAL_DEFS) $(CXX_OPT) $(PIC_FLAG) $(DEBUG_FLAG)

# Basic Cantera Thermodynamics Object Files
EQUIL_OBJ = BasisOptimize.o ChemEquil.o MultiPhase.o MultiPhaseEquil.o equilibrate.o

EQUIL_H = ChemEquil.h MultiPhase.h MultiPhaseEquil.h equil.h PropertyCalculator.h

# depending on the option, different object files are used
ifeq ($(do_AltLinProg), 1)
DALT_OBJ=vcs_setMolesLinProg.o
else
DALT_OBJ=vcs_linmaxc.o vcs_dbocls.o vcs_dbols.o vcs_dbolsm.o vcs_dmout.o \
         vcs_dvout.o vcs_ivout.o vcs_xerror.o
endif


ifeq ($(do_VCSnonideal), 1)
VCSNONIDEAL_OBJ = vcs_solve_TP.o vcs_VolPhase.o vcs_solve.o vcs_prob.o \
                  vcs_TP.o vcs_report.o vcs_util.o \
                  vcs_IntStarStar.o  vcs_DoubleStarStar.o  vcs_elem.o \
                  vcs_elem_rearrange.o   vcs_MultiPhaseEquil.o \
                    vcs_nondim.o vcs_Exception.o \
                  vcs_inest.o vcs_rearrange.o \
                  vcs_root1d.o vcs_rxnadj.o \
                  vcs_SpeciesProperties.o vcs_equilibrate.o \
                  vcs_prep.o vcs_species_thermo.o vcs_Gibbs.o vcs_phaseStability.o \
                  $(DALT_OBJ)

VCSNONIDEAL_H =   vcs_internal.h vcs_VolPhase.h vcs_solve.h vcs_prob.h \
                  vcs_IntStarStar.h    vcs_DoubleStarStar.h vcs_defs.h \
                  vcs_MultiPhaseEquil.h  vcs_Exception.h  \
                  vcs_SpeciesProperties.h vcs_species_thermo.h
endif

CXX_INCLUDES = -I../base -I../thermo -I../numerics 
LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libequil.a

ifeq ($(do_VCSnonideal), 1)
  VLIB=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libVCSnonideal.a 
endif

DEPENDS = $(EQUIL_OBJ:.o=.d) $(VCSNONIDEAL_OBJ:.o=.d)

all: $(LIB) $(VLIB) .depends
	@(/usr/bin/install -c -d $(INCDIR))
	@(for lh in $(EQUIL_H) $(VCSNONIDEAL_H); do \
	  $(INSTALL_TSC) "$${lh}" $(INCDIR) ; \
	done)

.cpp.d: Makefile %.o
	g++ -MM  $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

.c.d: Makefile %.o
	g++ -MM $(CXX_FLAGS) $(CXX_INCLUDES) -I../../../ext/f2c_libs $*.c > $*.d

.cpp.o:
	$(PURIFY) g++ -c $< $(CXX_FLAGS) $(CXX_INCLUDES)

.c.o:
	$(PURIFY) gcc -c $< $(CXX_FLAGS) $(CXX_INCLUDES) -I../../../ext/f2c_libs

$(LIB): $(EQUIL_OBJ) $(EQUIL_H) $(VCSNONIDEAL_OBJ) $(VCSNONIDEAL_H)
	ar ruv $(LIB) $(EQUIL_OBJ) $(VCSNONIDEAL_OBJ) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(LIB)
endif

$(VLIB): $(VCSNONIDEAL_OBJ) $(VCS_NONIDEAL_H)
	ar ruv $(VLIB) $(VCSNONIDEAL_OBJ) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(VLIB)
endif


clean:
	@(for lh in dummy.h $(EQUIL_H) $(VCSNONIDEAL_H); do \
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
	$(RM) *.o *~  .depends *.d
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )

depends:
	make .depends

.depends: $(DEPENDS)
	cat $(DEPENDS) > .depends

$(EQUIL_OBJ) $(VCSNONIDEAL_OBJ): Makefile

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

