#
# $Revision: 1.4 $
# $Author: hkmoffa $
# $Date: 2009/07/13 16:51:56 $
#
#
test_python=2
test_ck=1
test_cathermo=1

all:
	cd minDiamond;  make all
	cd negATest;  make all

test:
	@(echo "***************************************************")
	@(echo "        Testing the Cantera Minimun Python Interface       ")
	@(echo "         python executable: "  `which "${PYTHON_CMD}" 2>&1` )
	@(echo "         python version: "  `"${PYTHON_CMD}" -V 2>&1` )
	@(echo "***************************************************")
	cd minDiamond;  make -s test
	cd negATest;  make -s test

clean:
	$(RM) *.*~ 
	cd minDiamond;  make clean
	cd negATest;  make clean

depends:
	cd minDiamond;  make depends
	cd negATest;  make depends
