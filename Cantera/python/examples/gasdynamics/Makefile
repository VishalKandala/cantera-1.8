#!/bin/sh

INST_DIR=/usr/local/cantera/demos/python/gasdynamics

PY_DEMOS = isentropic soundSpeed


all:
	@(for py in $(PY_DEMOS) ; do \
	   (cd $${py} ; make ) \
	done)

run:
	@(for py in $(PY_DEMOS) ; do \
	    echo "running $${py}..."; \
	   (cd $${py} ; make run ) \
	done)

test:
	@(for py in $(PY_DEMOS) ; do \
	    echo "testing $${py}..."; \
	   (cd $${py} ; make test ) \
	done)

install:
	/usr/bin/install -c -d  $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r Makefile $(INST_DIR)
	@(for py in $(PY_DEMOS) ; do \
	    echo "install $${py}..."; \
	   (cd $${py} ; make install ) \
	done)


clean:
	@(for py in $(PY_DEMOS) ; do \
	    echo "cleaning $${py}..."; \
	   (cd $${py} ; make clean ) \
	done)



# end of file

