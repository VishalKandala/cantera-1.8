#!/bin/sh

INST_DIR=/usr/local/cantera/demos/python/equilibrium

PY_DEMOS = simple_test stoich_flame adiabatic_flame multiphase_plasma
MAKE = make

all:
	$(MAKE) run

run:
	@(for py in $(PY_DEMOS) ; do \
	    echo "running $${py}..."; \
	    cd "$${py}"; \
            $(MAKE) run ; \
	    cd .. ; \
	done)

test:
	@(for py in $(PY_DEMOS) ; do \
	    echo "testing $${py} test"; \
	    cd "$${py}"; \
            $(MAKE) test ; \
	    cd .. ; \
	done)

install:
	/usr/bin/install -c -d  $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r Makefile $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r plotting.py $(INST_DIR)
	@(for d in $(PY_DEMOS) ; do \
            echo "entering directory $${d}..."; \
            (cd $${d}; $(MAKE) install) ; \
        done)


clean:
	@(for py in $(PY_DEMOS) ; do \
	    cd "$${py}"; \
            $(MAKE) clean ; \
	    cd .. ; \
	done)

# end of file

