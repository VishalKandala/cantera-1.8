#
# $Revision: 1.13 $
# $Author: hkmoffa $
# $Date: 2008/09/08 23:56:40 $
#
build_ck=1

all: apps

install: templates-install apps-install man-install

apps:
	cd src; make
	cd testtools; make

apps-install:
	/usr/bin/install -c -d /usr/local/cantera/bin
ifeq ($(build_ck),1)
	/usr/bin/install -c -c /Cantera1.8-Radcal/build/bin/x86_64-unknown-linux-gnu/ck2cti /usr/local/cantera/bin
endif
	/usr/bin/install -c -c /Cantera1.8-Radcal/build/bin/x86_64-unknown-linux-gnu/cti2ctml /usr/local/cantera/bin
	/usr/bin/install -c -c /Cantera1.8-Radcal/build/bin/x86_64-unknown-linux-gnu/csvdiff /usr/local/cantera/bin

man-install:
	/usr/bin/install -c -d /usr/local/cantera/man1
	/usr/bin/install -c -c man/ck2cti.1 /usr/local/cantera/man1
	/usr/bin/install -c -c man/mixmaster.1 /usr/local/cantera/man1

uninstall:
	rm -r -f /usr/local/cantera/man1/ck2cti.1
	rm -f /usr/local/cantera/bin/ck2cti

clean:
	$(RM) *.*~ 
	cd src; make clean
	cd testtools; make clean

docs:
	cd doc; doxygen Cantera.cfg

depends:
	cd src; make depends
	cd testtools; make depends

templates-install:
	/usr/bin/install -c -d /usr/local/cantera/templates
	/usr/bin/install -c -d /usr/local/cantera/templates/f77
	@(for ihhh in templates/f77/*.mak templates/f77/*.f  ; do  \
                  /usr/bin/install -c -c $${ihhh} /usr/local/cantera/templates/f77 ; \
                  echo "/usr/bin/install -c -c $${ihhh} /usr/local/cantera/templates/f77" ; \
         done ) 
	/usr/bin/install -c  -d /usr/local/cantera/templates/f90
	@(for ihhh in templates/f90/*.mak templates/f90/*.f90 templates/f90/*.cpp ; do  \
                  /usr/bin/install -c -c $${ihhh} /usr/local/cantera/templates/f90 ; \
                  echo "/usr/bin/install -c -c $${ihhh} /usr/local/cantera/templates/f90" ; \
         done ) 
	/usr/bin/install -c -d /usr/local/cantera/templates/cxx
	@(for ihhh in templates/cxx/*.mak templates/cxx/*.cpp; do  \
                  /usr/bin/install -c -c $${ihhh} /usr/local/cantera/templates/cxx ; \
                  echo "/usr/bin/install -c -c $${ihhh} /usr/local/cantera/templates/cxx" ; \
         done ) 
	chown -R root /usr/local/cantera/templates

