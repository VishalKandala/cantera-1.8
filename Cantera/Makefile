#/bin/sh
###############################################################
#  $Author: hkmoffa $
#  $Date: 2007/05/06 17:16:43 $
#  $Revision: 1.8 $
#
#  Copyright 2001 California Institute of Technology
#  See file License.txt for licensing information
#
###############################################################

build_f90=0
build_python=2
build_matlab = 0

all:
	cd src; make
	cd cxx; make
	cd clib/src; make
ifeq ($(build_f90),1)
	cd fortran/src; make
endif
	cd user; make

clean:
	cd src;                            make clean
	cd cxx;                            make clean
	cd clib/src;      $(RM) .depends ; make clean
	cd python;                         make clean
ifeq ($(build_f90),1)
	cd fortran/src;   $(RM) .depends ; make clean
endif
	cd user;          $(RM) .depends ; make clean

depends:
	cd src;         make depends
	cd cxx/src;     make depends
	cd clib/src;    make depends
ifeq ($(build_f90),1)
	cd fortran/src; make depends
endif
ifeq ($(build_matlab),1)
	cd matlab;      make depends
endif
	cd user;        make depends

install:
	cd src; make install
	cd cxx/src; make install
	cd clib/src; make install
ifeq ($(build_f90),1)
	cd fortran/src; make install
endif
	cd user; make install

# end of file

