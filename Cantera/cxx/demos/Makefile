############################################################################
#
#  Makefile to compile and link a C++ application to 
#  Cantera.
#
#############################################################################

all:
	cd combustor;       make 
	cd kinetics1;       make 
	cd flamespeed;      make
	cd NASA_coeffs;     make 

test:
	cd combustor;       make -s test
	cd kinetics1;       make -s test
	cd NASA_coeffs;     make -s test
	cd flamespeed;      make -s test

install:
	/usr/bin/install -c -d       /usr/local/cantera/demos/cxx
	/usr/bin/install -c Makefile -m ug+rw,o+r /usr/local/cantera/demos/cxx
	cd combustor;       make install
	cd flamespeed;      make install
	cd kinetics1;       make install
	cd NASA_coeffs;     make install

depends: 
	cd combustor;       make depends
	cd kinetics1;       make depends
	cd flamespeed;      make depends
	cd NASA_coeffs;     make depends


clean:
	cd combustor;       make clean
	cd kinetics1;       make clean
	cd flamespeed;      make clean
	cd NASA_coeffs;     make clean


