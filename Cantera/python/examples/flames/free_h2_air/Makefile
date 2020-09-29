#!/bin/sh

INST_DIR=/usr/local/cantera/demos/python/flames/free_h2_air

PYTHON_CMD = /usr/bin/python2.6

run:
	$(PYTHON_CMD) free_h2_air.py 

test:
	./runtest

install:
	/usr/bin/install -c -d  $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r Makefile $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r free_h2_air.py $(INST_DIR)
	/usr/bin/install -c -c   runtest $(INST_DIR)
	/usr/bin/install -c -c   cleanup $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r output_blessed_0.txt    $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r freeflame1_blessed_0.csv $(INST_DIR)

clean:
	rm -f *.log output_0.txt freeflame1.csv  freeflame1.xml 
	./cleanup

# end of file

