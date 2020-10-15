#
# $Revision: 1.18 $
# $Author: hkmoffa $
# $Date: 2008/08/23 01:16:43 $
#
#
test_issp=1
test_electrolytes=1

all:
ifeq ($(test_issp),1)
	cd issp;  make all
	cd stoichSubSSTP; make all
endif
ifeq ($(test_electrolytes),1)
	cd ims; make all
	cd testIAPWS; make all
	cd testIAPWSPres; make all
	cd testIAPWSTripP; make all
	cd testWaterPDSS; make all
	cd testWaterTP; make all
	cd HMW_graph_GvT; make all
	cd HMW_graph_GvI; make all
	cd HMW_graph_HvT; make all
	cd HMW_graph_CpvT; make all
	cd HMW_graph_VvT; make all
	cd HMW_test_1; make all
	cd HMW_test_3; make all
	cd DH_graph_1; make all
	cd DH_graph_acommon; make all
	cd DH_graph_bdotak; make all
	cd DH_graph_NM; make all
	cd DH_graph_Pitzer; make all
	cd HMW_dupl_test; make all
	cd VPissp; make all
endif

test:
ifeq ($(test_issp),1)
	cd issp;  make -s test
	cd stoichSubSSTP; make -s test
	cd VPissp; make -s test
endif
ifeq ($(test_electrolytes),1)
	cd ims; make -s test
	cd testIAPWS; make -s test
	cd testIAPWSPres; make -s test
	cd testIAPWSTripP; make -s test
	cd testWaterPDSS; make -s test
	cd testWaterTP; make -s test
	cd HMW_graph_GvT; make -s test
	cd HMW_graph_GvI; make -s test
	cd HMW_graph_HvT; make -s test
	cd HMW_graph_CpvT; make -s test
	cd HMW_graph_VvT; make -s test
	cd HMW_test_1; make -s test
	cd HMW_test_3; make -s test
	cd DH_graph_1; make -s test
	cd DH_graph_acommon; make  -s test
	cd DH_graph_bdotak; make -s test
	cd DH_graph_NM; make -s test
	cd DH_graph_Pitzer; make -s test
	cd HMW_dupl_test; make -s test
endif
#
# Have to remove .depends before calling make, because
# the rule for updating .depends is invoked, before the clean rule,
# if .depends exists in the directory.
#
clean:
	$(RM) *.*~ 
	cd issp;              $(RM) .depends ; make clean
	cd stoichSubSSTP;     $(RM) .depends ; make clean
	cd ims;	              $(RM) .depends ; make clean 
	cd testIAPWS;         $(RM) .depends ; make clean
	cd testIAPWSPres;     $(RM) .depends ; make clean
	cd testIAPWSTripP;    $(RM) .depends ; make clean 
	cd testWaterPDSS;     $(RM) .depends ; make clean
	cd testWaterTP;       $(RM) .depends ; make clean
	cd HMW_graph_GvT;     $(RM) .depends ; make clean
	cd HMW_graph_GvI;     $(RM) .depends ; make clean
	cd HMW_graph_HvT;     $(RM) .depends ; make clean
	cd HMW_graph_CpvT;    $(RM) .depends ; make clean
	cd HMW_graph_VvT;     $(RM) .depends ; make clean
	cd HMW_test_1;        $(RM) .depends ; make clean
	cd HMW_test_3;        $(RM) .depends ; make clean
	cd DH_graph_1;        $(RM) .depends ; make clean
	cd DH_graph_acommon;  $(RM) .depends ; make clean
	cd DH_graph_bdotak;   $(RM) .depends ; make clean
	cd DH_graph_NM;       $(RM) .depends ; make clean
	cd DH_graph_Pitzer;   $(RM) .depends ; make clean 
	cd HMW_dupl_test;     $(RM) .depends ; make clean
	cd VPissp;            $(RM) .depends ; make clean

depends:
ifeq ($(test_issp),1)
	cd issp; make depends
	cd stoichSubSSTP; make clean
endif
ifeq ($(test_electrolytes),1)
	cd ims; make depends
	cd testIAPWS; make depends
	cd testIAPWSPres; make depends
	cd testIAPWSTripP; make depends
	cd testWaterPDSS; make depends
	cd testWaterTP; make depends
	cd HMW_graph_GvT; make depends
	cd HMW_graph_GvI; make depends
	cd HMW_graph_HvT; make depends
	cd HMW_graph_CpvT; make depends
	cd HMW_graph_VvT; make depends
	cd HMW_test_1; make depends
	cd HMW_test_3; make depends
	cd DH_graph_1; make depends
	cd DH_graph_acommon; make  depends
	cd DH_graph_bdotak;  make depends
	cd DH_graph_NM;      make depends
	cd DH_graph_Pitzer;  make depends
	cd HMW_dupl_test;   make depends
	cd VPissp;          make depends

endif
