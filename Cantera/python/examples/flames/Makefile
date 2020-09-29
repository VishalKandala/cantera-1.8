#!/bin/sh

INST_DIR=/usr/local/cantera/demos/python/flames

PY_DEMOS = flame1 flame2 stflame1 npflame1 free_h2_air \
	   adiabatic_flame flame_fixed_T
PYTHON_CMD = /usr/bin/python2.6

all:
	@(for py in $(PY_DEMOS) ; do \
	    echo "running $${py}..."; \
	    (cd $${py} ; make ) \
	done)

run:
	@(for py in $(PY_DEMOS) ; do \
	    echo "running $${py}..."; \
	    (cd $${py} ; make run ) \
	done)

test:
	@(for py in $(PY_DEMOS) ; do \
	    echo "running $${py}..."; \
	    (cd $${py} ; make test ) \
	done)

install:
	/usr/bin/install -c -d  $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r Makefile $(INST_DIR)
	@(for py in $(PY_DEMOS) ; do \
	    echo "running $${py}..."; \
	    (cd $${py} ; make install ) \
	done)


clean:
	@(for py in $(PY_DEMOS) ; do \
	    echo "running $${py}..."; \
	    (cd $${py} ; make clean ) \
	done)


# end of file

