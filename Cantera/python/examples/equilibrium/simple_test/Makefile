#!/bin/sh

INST_DIR=/usr/local/cantera/demos/python/equilibrium/simple_test

PYTHON_CMD = /usr/bin/python2.6
all:

run:
	$(PYTHON_CMD) simple.py

test:
	./runtest

install:
	/usr/bin/install -c -d  $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r Makefile $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r simple.py $(INST_DIR)
	/usr/bin/install -c -c   runtest $(INST_DIR)
	/usr/bin/install -c -c   cleanup $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r output_blessed_0.txt    $(INST_DIR)


clean:
	rm -f *.log *.csv *.xml
	./cleanup

# end of file

