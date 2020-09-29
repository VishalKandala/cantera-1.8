#
# $Revision: 1.36 $
# $Author: hkmoffa $
# $Date: 2009/03/25 01:03:05 $
#
#
test_python=2
test_ck=1
test_cathermo=1
test_pure_fluids=1
test_vcs_nonideal=0

all:
	cd cxx_ex;       make all
	cd surfkin;      make all
	cd fracCoeff;    make all
	cd silane_equil; make all
	cd VPsilane_test; make all
	cd negATest;     make all
	cd diamondSurf;  make all
	cd diamondSurf_dupl;  make all
	cd surfSolverTest;  make all
	cd ChemEquil_gri_matrix; make all
	cd ChemEquil_gri_pairs; make all
	cd ChemEquil_ionizedGas; make all
	cd ChemEquil_red1; make all
	cd CpJump; make all
	cd mixGasTransport; make all
	cd multiGasTransport; make all
	cd printUtilUnitTest; make all
ifeq ($(test_pure_fluids),1)
	cd pureFluidTest;     make all
	cd rankine_democxx;     make all
endif
ifeq ($(test_python),1)
	cd min_python;   make all
endif
ifeq ($(test_python),2)
	cd min_python;   make all
endif
ifeq ($(test_ck),1)
	cd ck2cti_test;  make all
	cd nasa9_reader; make all
endif
ifeq ($(test_cathermo),1)
	cd cathermo;     make all
endif
ifeq ($(test_vcs_nonideal),1)
	cd VCSnonideal;     make all
endif

test:
	@ cd cxx_ex;               make -s test
	@ cd surfkin;              make -s test
	@ cd fracCoeff;            make -s test
	@ cd silane_equil;         make -s test
	@ cd VPsilane_test;        make -s test
	@ cd negATest;             make -s test
	@ cd diamondSurf;          make -s test
	@ cd diamondSurf_dupl;     make -s test
	@ cd surfSolverTest;       make -s test
	@ cd NASA9poly_test;       make -s test
	@ cd ChemEquil_gri_matrix; make -s test
	@ cd ChemEquil_gri_pairs;  make -s test
	@ cd ChemEquil_ionizedGas; make -s test
	@ cd ChemEquil_red1;       make -s test
	@ cd CpJump;               make -s test
	@ cd mixGasTransport;      make -s test
	@ cd multiGasTransport;    make -s test
	@ cd printUtilUnitTest;    make -s test
ifeq ($(test_pure_fluids),1)
	@ cd pureFluidTest;        make  -s test
	@ cd rankine_democxx;      make  -s test
endif
ifeq ($(test_ck),1)
	@ cd ck2cti_test;  make -s test
	@ cd nasa9_reader;  make -s test
endif
ifeq ($(test_python),1)
	cd min_python;   make -s test
endif
ifeq ($(test_python),2)
	cd min_python;   make -s test
	cd python;       make -s test
endif
ifeq ($(test_cathermo),1)
	cd cathermo;     make -s test
endif
ifeq ($(test_vcs_nonideal),1)
	cd VCSnonideal;     make -s test
endif

clean:
	$(RM) *.*~ 
	cd cxx_ex;                $(RM) .depends ; make clean
	cd surfkin;               $(RM) .depends ; make clean
	cd fracCoeff;             $(RM) .depends ; make clean
	cd silane_equil;          $(RM) .depends ; make clean
	cd VPsilane_test;         $(RM) .depends ; make clean
	cd negATest;              $(RM) .depends ; make clean
	cd diamondSurf;           $(RM) .depends ; make clean
	cd diamondSurf_dupl;      $(RM) .depends ; make clean
	cd surfSolverTest;        $(RM) .depends ; make clean
	cd NASA9poly_test;        $(RM) .depends ; make clean
	cd ChemEquil_gri_matrix;  $(RM) .depends ; make clean
	cd ChemEquil_gri_pairs;   $(RM) .depends ; make clean
	cd ChemEquil_ionizedGas;  $(RM) .depends ; make clean
	cd ChemEquil_red1;        $(RM) .depends ; make clean
	cd CpJump;                $(RM) .depends ; make clean
	cd mixGasTransport;       $(RM) .depends ; make clean
	cd multiGasTransport;     $(RM) .depends ; make clean
	cd printUtilUnitTest;     $(RM) .depends ; make clean
	cd pureFluidTest;         $(RM) .depends ; make clean
	cd rankine_democxx;       $(RM) .depends ; make clean
	cd ck2cti_test;           $(RM) .depends ; make clean
	cd nasa9_reader;          $(RM) .depends ; make clean
	cd min_python;                             make clean
	cd python;                                 make clean
	cd cathermo;                               make clean
	cd VCSnonideal;	                           make clean

depends:
	cd cxx_ex;               make depends
	cd surfkin;              make depends
	cd fracCoeff;            make depends
	cd silane_equil;         make depends
	cd VPsilane_test;        make depends
	cd negATest;             make depends
	cd diamondSurf;          make depends
	cd diamondSurf_dupl;     make depends
	cd surfSolverTest;       make depends
	cd NASA9poly_test;       make depends
	cd ChemEquil_gri_matrix; make depends
	cd ChemEquil_gri_pairs;  make depends
	cd ChemEquil_ionizedGas; make depends
	cd ChemEquil_red1;       make depends
	cd CpJump;               make depends
	cd mixGasTransport;      make depends
	cd multiGasTransport;    make depends
	cd printUtilUnitTest;    make depends
ifeq ($(test_cathermo),1)
	cd pureFluidTest;        make depends
	cd rankine_democxx;      make depends
endif
ifeq ($(test_ck),1)
	cd ck2cti_test;          make depends
	cd nasa9_reader;         make depends
endif
ifeq ($(test_python),1)
	cd min_python;           make depends
endif
ifeq ($(test_python),2)
	cd min_python;           make depends
	cd python;               make depends
endif
ifeq ($(test_cathermo),1)
	cd cathermo;             make depends
endif
ifeq ($(test_vcs_nonideal),1)
	cd VCSnonideal;    	 make depends
endif
