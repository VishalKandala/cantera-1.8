#!/bin/sh

INST_DIR=/usr/local/cantera/demos/python/flames/flame2

PYTHON_CMD = /usr/bin/python2.6

run:
	$(PYTHON_CMD) flame2.py

test:
	./runtest

install:
	/usr/bin/install -c -d  $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r Makefile $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r flame2.py $(INST_DIR)
	/usr/bin/install -c -c   runtest $(INST_DIR)
	/usr/bin/install -c -c   cleanup $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r output_blessed_0.txt    $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r flame2_blessed_0.csv $(INST_DIR)


clean:
	rm -f *.log *.csv *.xml
	./cleanup

# end of file

