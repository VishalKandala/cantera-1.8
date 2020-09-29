#!/bin/sh

INST_DIR=/usr/local/cantera/demos/python/reactors

PY_DEMOS = combustor_sim functors_sim mix1_sim mix2_sim piston_sim reactor1_sim \
	   reactor2_sim sensitivity_sim surf_pfr_sim

all:
	@(for py in $(PY_DEMOS) ; do \
	    echo "running $${py}..."; \
	 (cd "$${py}"; make ) ; \
	done)

run:
	@(for py in $(PY_DEMOS) ; do \
	    echo "running $${py}..."; \
	 (cd "$${py}"; make run ) ; \
	done)

test:
	@(for py in $(PY_DEMOS) ; do \
	    echo "testing $${py}..."; \
	 (cd "$${py}"; make test ) ; \
	done)

install:
	/usr/bin/install -c -d  $(INST_DIR)
	/usr/bin/install -c -c -m ug+rw,o+r Makefile $(INST_DIR)
	@(for py in $(PY_DEMOS) ; do \
	    echo "installing $${py}..."; \
	 (cd "$${py}"; make install ) ; \
	done)




clean:
	@(for py in $(PY_DEMOS) ; do \
	    echo "testing $${py}..."; \
	 (cd "$${py}"; make clean ) ; \
	done)
	rm -f *.log *.csv *.xml

# end of file

