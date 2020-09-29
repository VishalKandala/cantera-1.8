#
# $Revision: 1.1 $
# $Author: hkmoffa $
# $Date: 2007/12/20 23:47:41 $
#
#
test_vcs_nonideal=0


all:
ifeq ($(test_vcs_nonideal),1)
	cd NaCl_equil;  make all
endif

test:
ifeq ($(test_vcs_nonideal),1)
	cd NaCl_equil;  make -s test
endif

#
# Have to remove .depends before calling make, because
# the rule for updating .depends is invoked, before the clean rule,
# if .depends exists in the directory.
#
clean:
	$(RM) *.*~ 
	cd NaCl_equil;        $(RM) .depends ; make clean


depends:
ifeq ($(test_vcs_nonideal),1)
	cd NaCl_equil;  make depends
endif
