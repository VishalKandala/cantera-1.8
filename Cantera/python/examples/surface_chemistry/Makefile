#!/bin/sh

INST_DIR=/usr/local/cantera/demos/python/surface_chemistry

all:
	cd catcomb_stagflow; make 
	cd diamond_cvd;      make 

run:
	cd catcomb_stagflow; make run
	cd diamond_cvd;      make run

test:
	cd catcomb_stagflow; make test
	cd diamond_cvd;      make test

install:
	/usr/bin/install -c -d  $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r Makefile   $(INST_DIR)
	cd catcomb_stagflow; make install
	cd diamond_cvd;      make install

clean:
	cd catcomb_stagflow; make clean
	cd diamond_cvd;      make clean

# end of file

