#/bin/sh
###############################################################
#  $Author: dggoodwin $
#  $Date: 2007/12/15 17:15:50 $
#  $Revision: 1.58 $
#
#  Copyright 2001 California Institute of Technology
#
###############################################################

all:
	cd base; make all
	cd equil; make all
	cd zeroD; make all
	cd oneD;  make all
	cd converters; make all
	cd transport;  make all
	cd thermo;     make all
	cd kinetics;   make all
	cd numerics;   make all
	cd spectra;   make all

clean:
	cd base;       $(RM) .depends ; make clean
	cd equil;      $(RM) .depends ; make clean
	cd zeroD;      $(RM) .depends ; make clean
	cd oneD;       $(RM) .depends ; make clean
	cd converters; $(RM) .depends ; make clean
	cd transport;  $(RM) .depends ; make clean
	cd thermo;     $(RM) .depends ; make clean
	cd kinetics;   $(RM) .depends ; make clean
	cd numerics;   $(RM) .depends ; make clean
	cd spectra;    $(RM) .depends ; make clean

depends: 
	cd base; make depends
	cd equil; make depends
	cd oneD; make depends
	cd zeroD; make depends
	cd converters; make depends
	cd transport; make depends
	cd thermo; make depends
	cd kinetics; make depends
	cd numerics; make depends
	cd spectra; make depends

TAGS: 
	etags *.h *.cpp
