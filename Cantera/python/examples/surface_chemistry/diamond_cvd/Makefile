#!/bin/sh

INST_DIR=/usr/local/cantera/demos/python/surface_chemistry/diamond_cvd


PYTHON_CMD = /usr/bin/python2.6

all:

run:
	$(PYTHON_CMD) diamond.py

test:
	./runtest

install:
	/usr/bin/install -c -d  $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r Makefile    $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r diamond.py   $(INST_DIR)
	/usr/bin/install -c -c   runtest $(INST_DIR)
	/usr/bin/install -c -c   cleanup $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r output_blessed_0.txt    $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r diamond_blessed_0.csv $(INST_DIR)

clean:
	./cleanup

