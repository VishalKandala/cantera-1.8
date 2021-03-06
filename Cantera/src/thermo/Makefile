#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2009/03/03 21:08:31 $
#  $Revision: 1.30 $
#
#  Copyright 2002 California Institute of Technology
#
###############################################################

.SUFFIXES :
.SUFFIXES : .cpp .d .o .h

INCDIR = ../../../build/include/cantera/kernel
INSTALL_TSC = ../../../bin/install_tsc
do_ranlib = 1
do_electro = 1
do_issp    = 1

debug_mode = 1
ifeq ($(debug_mode), 1)
   DEBUG_FLAG=-DDEBUG_MODE
else
   DEBUG_FLAG=
endif

# Purify command - usually this is blank
PURIFY=

#LOCAL_DEFS=-DDEBUG_MODE
PIC_FLAG=-fPIC

CXX_FLAGS = -O3 -Wall   $(LOCAL_DEFS) $(CXX_OPT) $(PIC_FLAG) $(DEBUG_FLAG)

# Basic Cantera Thermodynamics Object Files
THERMO_OBJ = State.o Elements.o Constituents.o Phase.o \
             ThermoPhase.o IdealGasPhase.o ConstDensityThermo.o \
             SpeciesThermoFactory.o ConstCpPoly.o Nasa9Poly1.o Nasa9PolyMultiTempRegion.o \
             Mu0Poly.o GeneralSpeciesThermo.o SurfPhase.o \
             ThermoFactory.o phasereport.o SpeciesThermoInterpType.o \
             VPSSMgr.o  VPSSMgrFactory.o  VPSSMgr_General.o IdealSolnGasVPSS.o \
             VPSSMgr_IdealGas.o VPSSMgr_ConstVol.o PDSS_ConstVol.o PDSS_IdealGas.o \
              SemiconductorPhase.o StoichSubstance.o PureFluidPhase.o LatticeSolidPhase.o LatticePhase.o

THERMO_H   = State.h Elements.h Constituents.h Phase.h mix_defs.h \
             ThermoPhase.h IdealGasPhase.h ConstDensityThermo.h \
             SpeciesThermoFactory.h ThermoFactory.h \
             NasaPoly1.h NasaPoly2.h NasaThermo.h Nasa9Poly1.h Nasa9PolyMultiTempRegion.h \
             ShomateThermo.h ShomatePoly.h ConstCpPoly.h \
             SimpleThermo.h SpeciesThermoMgr.h \
             SpeciesThermoInterpType.h \
             GeneralSpeciesThermo.h Mu0Poly.h \
             speciesThermoTypes.h SpeciesThermo.h SurfPhase.h \
             EdgePhase.h  \
             VPSSMgr.h  VPSSMgrFactory.h  VPSSMgr_General.h IdealSolnGasVPSS.h \
             VPSSMgr_IdealGas.h VPSSMgr_ConstVol.h PDSS_ConstVol.h PDSS_IdealGas.h \
              MetalPhase.h SemiconductorPhase.h AdsorbateThermo.h StoichSubstance.h PureFluidPhase.h LatticeSolidPhase.h LatticePhase.h


# Extended Cantera Thermodynamics Object Files

ifeq ($(do_electro),1)
do_issp = 1
ELECTRO_OBJ = MolalityVPSSTP.o  VPStandardStateTP.o \
              IdealMolalSoln.o \
              WaterPropsIAPWSphi.o WaterPropsIAPWS.o WaterProps.o \
              PDSS.o PDSS_Water.o PDSS_HKFT.o  \
	      HMWSoln.o HMWSoln_input.o DebyeHuckel.o \
              WaterSSTP.o \
              VPSSMgr_Water_ConstVol.o VPSSMgr_Water_HKFT.o

ELECTRO_H   = MolalityVPSSTP.h  VPStandardStateTP.h \
              IdealMolalSoln.h \
              WaterPropsIAPWSphi.h WaterPropsIAPWS.h WaterProps.h \
              PDSS.h PDSS_Water.h PDSS_HKFT.h \
              HMWSoln.h electrolytes.h  \
	      DebyeHuckel.h WaterSSTP.h VPSSMgr_Water_HKFT.h \
              VPSSMgr_Water_ConstVol.h
endif
ifeq ($(do_issp),1)
ISSP_OBJ = IdealSolidSolnPhase.o  StoichSubstanceSSTP.o SingleSpeciesTP.o MineralEQ3.o \
           GibbsExcessVPSSTP.o PseudoBinaryVPSSTP.o MargulesVPSSTP.o
ISSP_H   = IdealSolidSolnPhase.h  StoichSubstanceSSTP.h SingleSpeciesTP.h MineralEQ3.h \
           GibbsExcessVPSSTP.h PseudoBinaryVPSSTP.h MargulesVPSSTP.h
endif

CATHERMO_OBJ = $(THERMO_OBJ) $(ELECTRO_OBJ) $(ISSP_OBJ) 

CATHERMO_H   = $(THERMO_H) $(ELECTRO_H) $(ISSP_H) 


CXX_INCLUDES = -I../base 
LIB = /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/libthermo.a

DEPENDS = $(CATHERMO_OBJ:.o=.d)

all: $(LIB) .depends
	@(/usr/bin/install -c -d $(INCDIR))
	@(for lh in $(CATHERMO_H) ; do \
	  $(INSTALL_TSC) "$${lh}" $(INCDIR) ; \
	done)
%.d: Makefile %.o
	g++ -MM $(CXX_FLAGS) $(CXX_INCLUDES) $*.cpp > $*.d

.cpp.o:
	$(PURIFY) g++ -c $< $(CXX_FLAGS) $(CXX_INCLUDES)

$(LIB): $(CATHERMO_OBJ) $(CATHERMO_H)
	ar ruv $(LIB) $(CATHERMO_OBJ) > /dev/null
ifeq ($(do_ranlib),1)
	ranlib $(LIB)
endif

clean:
	@(for lh in dummy.h $(CATHERMO_H) ; do \
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

#
# Dependency rules
#
depends:
	make .depends

.depends: $(DEPENDS)
	cat $(DEPENDS) > .depends

$(CATHERMO_OBJ): Makefile

#
# Make sure that if the Makefile changes, all object files
# must get recompiled
$(CATHERMO_OBJ): Makefile

TAGS: 
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

