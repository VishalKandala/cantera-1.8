#!/bin/sh
#
# $Id: Makefile.in,v 1.96 2009/03/25 01:11:48 hkmoffa Exp $
#
export_dir = $(HOME)/sfdist
version = 1.8.0
ct = $(export_dir)/cantera-$(version)
build_ck = 1
build_clib = 1
build_python = 2
build_f90 = 0
build_matlab = 0
os_is_win = 0
incl_user_code = 1
do_ranlib = 1
use_dll = 0

cvs_tag = HEAD
branch = -r $(cvs_tag)
RMDIRTREE = /bin/rm -r -f
INSTALL_TSC = bin/install_tsc

prefix=/usr/local/cantera

all:    hdr-collect kernel user cxxlib clib fortran python matlab  \
	utils 

# use this target on a Windows machine to build the Python and
# MATLAB interfaces after building the project in Visual C++
win: hdr-collect python matlab
	@echo 
	@echo Now type \'make win-install\' to install Cantera in /usr/local/cantera.
	@echo

install: hdr-install kernel-install clib-install data-install f90-modules-install \
         python-install matlab-install tools-install demo-install finish-install

win-install: hdr-install win-kernel-install data-install python-install \
             matlab-install demo-install finish-install
	@echo
	@echo Cantera has been successfully installed in /usr/local/cantera.
	@echo

demos: example_codes

# build the Cantera static libraries
kernel:  
	/usr/bin/install -c -d /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu
	/usr/bin/install -c -d /Cantera1.8-Radcal/build/bin/x86_64-unknown-linux-gnu
	cd ext; make
	cd Cantera/src; make

# build the user library
user:
ifeq ($(incl_user_code),1)
	cd Cantera/user; make
endif

clib: 
ifeq ($(build_clib),1)
	cd Cantera/clib/src; make
endif

fortran:
ifeq ($(build_f90),1)
	cd Cantera/fortran/src; make
	/usr/bin/install -c -c Cantera/fortran/src/*.mod build/include/cantera
else
	@echo skipping building the Fortran 90/95 interface
endif

cxxlib: 
	cd Cantera/cxx; make

utils:
	cd tools; make

kernel-install:
	/usr/bin/install -c -d /usr/local/cantera/lib
	-rm -fR /usr/local/cantera/lib/*
	( for ilib in /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/*.a ; do  \
	  /usr/bin/install -c -c -m 644 $${ilib} /usr/local/cantera/lib ; \
          done )
ifeq ($(do_ranlib),1)
	ranlib /usr/local/cantera/lib/*.a
endif

clib-install:
ifeq ($(build_clib),1)
	cd Cantera/clib/src; make install
endif

win-kernel-install:
	/usr/bin/install -c -d /usr/local/cantera/lib
	-$(RMDIRTREE) /usr/local/cantera/lib/*
	( for ilib in /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/*.lib ; do  \
          /usr/bin/install -c -c -m 644 $${ilib} /usr/local/cantera/lib ;  done )
ifeq ($(use_dll),1)
	( for ilib in /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/*.dll ; do  \
          /usr/bin/install -c -c -m 644 $${ilib} /usr/local/cantera/lib ;  done )
	( for ilib in /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/*.exp ; do  \
          /usr/bin/install -c -c -m 644 $${ilib} /usr/local/cantera/lib ;  done )
endif

data-install:
	/usr/bin/install -c -d /usr/local/cantera/data
	( for iddd in data/inputs/*.xml ; do  \
          /usr/bin/install -c -c -m 644 $${iddd} /usr/local/cantera/data ;  done )
	( for iddd in data/inputs/*.cti ; do  \
          /usr/bin/install -c -c -m 644 $${iddd} /usr/local/cantera/data ;  done )

tools-install:
	cd tools; make install

hdr-install:
	/usr/bin/install -c -d /usr/local/cantera/include/cantera
	cp -r -f build/include/cantera /usr/local/cantera/include
	@(if test -f /usr/local/cantera/include/cantera/Cantera_bt.mak ; then rm -f /usr/local/cantera/include/cantera/Cantera_bt.mak ; fi )


f90-modules-install:
ifeq ($(build_f90),1)
	/usr/bin/install -c -c -m 644 build/include/cantera/*.mod /usr/local/cantera/include/cantera
endif

# collect scattered header files and build the include directory
hdr-collect:
	/usr/bin/install -c -d build/include/cantera
	/usr/bin/install -c -d build/include/cantera/kernel
	@(cd Cantera/cxx/include ; for ihhh in *.h *.mak; do  \
          ../../../$(INSTALL_TSC) $${ihhh} ../../../build/include/cantera ; \
          done )
	@$(INSTALL_TSC) config.h build/include/cantera 

python: 
ifeq ($(build_python),2)
ifeq ($(os_is_win),0)
	cd Cantera/python; make
else
	cd Cantera/python; make win
endif
endif
ifeq ($(build_python),1)
	cd Cantera/python; make minbuild
endif

python-install:
ifneq ($(build_python),0)
	cd Cantera/python; make install
ifeq ($(build_python),2)
	/usr/bin/install -c -d /usr/local/cantera/tutorials/python
	@(for ihhh in Cantera/python/tutorial/*.py ; do  \
            /usr/bin/install -c -c $${ihhh} /usr/local/cantera/tutorials/python ; \
            echo "/usr/bin/install -c -c $${ihhh} /usr/local/cantera/tutorials/python" ; \
          done )
	chown -R root /usr/local/cantera/tutorials/python
else
	@echo 'NOT installing Python demos or tutorials'
endif
endif

matlab:
ifeq ($(build_matlab),1)
ifneq ($(build_python),0)
	cd Cantera/matlab; make
endif
else
	@echo 'NOT building the Matlab toolbox'
endif

matlab-install:
ifeq ($(build_matlab),1)
ifneq ($(build_python),0)
	cd Cantera/matlab; make install
endif
endif

demo-install:
	(cd Cantera/cxx/demos; make install)
	/usr/bin/install -c -c -m ug+rw,o+r tools/templates/cxx/demo.mak /usr/local/cantera/demos/cxx
	/usr/bin/install -c -d /usr/local/cantera/demos/f77
	(cd Cantera/fortran/f77demos; make install)
	/usr/bin/install -c -c -m ug+rw,o+r tools/templates/f77/demo_ftnlib.cpp /usr/local/cantera/demos/f77
	( for ihhh in Cantera/fortran/f77demos/*.txt ; do  \
          /usr/bin/install -c -c -m ug+rw,o+r $${ihhh} /usr/local/cantera/demos/f77 ;  done )
	chown -R root /usr/local/cantera/demos/f77
ifeq ($(build_python),2)
	(cd Cantera/python/examples; make install)
	chown -R root /usr/local/cantera/demos/python
endif

finish-install:
	/usr/bin/install -c -d /usr/local/cantera/doc
	/usr/bin/install -c -d /usr/local/cantera/bin
ifeq ($(os_is_win),0)
#          Commands to be executed for non-win systems
	cp -f License.rtf "/usr/local/cantera/bin"
	cp -f License.txt "/usr/local/cantera/bin"
ifneq ($(build_python),0)
	/usr/bin/install -c -c tools/src/finish_install.py tools/bin
	(PYTHONPATH=''; /usr/bin/python2.6 tools/bin/finish_install.py /usr/local/cantera /usr/bin/python2.6)
	cp -f "/root/setup_cantera" "/usr/local/cantera/bin"
	chmod +x /usr/local/cantera/bin/setup_cantera
	chmod +x /usr/local/cantera/bin/ctnew
	chmod +x /usr/local/cantera/bin/mixmaster
endif
else
#          Commands to be executed for win systems
	cd Cantera/fortran/f77demos; sed s'/isentropic/ctlib/g' isentropic.dsp > ctlib.dsp
	( for ihhh in Cantera/fortran/f77demos/*.dsp ; do  \
          /usr/bin/install -c -c $${ihhh} /usr/local/cantera/demos/f77 ;  done )
	( for ihhh in  /Cantera1.8-Radcal/build/bin/x86_64-unknown-linux-gnu/* ; do  \
          /usr/bin/install -c -c $${ihhh} /usr/local/cantera/bin ;  done )
endif

example_codes:
	(cd Cantera/cxx/demos; make clean)
	(cd Cantera/cxx; make)

test: example_codes datafiles
	cd test_problems; make clean
	cd test_problems; make all
	cd test_problems; make test

run-matlab-demo:
	cd Cantera/matlab; make run-demo

test-matlab:
	cd Cantera/matlab; make test-demo

run-python-demo:
	cd Cantera/python; make run-demo

uninstall:
	-$(RMDIRTREE) /usr/local/cantera/include/cantera
	-$(RMDIRTREE) /usr/local/cantera/lib
	-$(RMDIRTREE) /usr/local/cantera/data
	-$(RMDIRTREE) /usr/local/cantera/demos
	-$(RMDIRTREE) /usr/local/cantera/doc
	-$(RMDIRTREE) /usr/local/cantera/tutorials
	-$(RMDIRTREE) /usr/local/cantera/matlab/toolbox/cantera
	cd tools; make uninstall

clean:
	-$(RMDIRTREE) *.*~ /Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu/*.* build/include/cantera/config.h svn*~
	-cd Cantera; make clean
	-cd tools; make clean
	-cd ext; make clean
	-cd test_problems; make clean
	-$(RM) mt.mod

docs:
	cd tools/doxygen/Cantera; doxygen Cantera.cfg

depends:
	cd Cantera; make depends
	cd tools; make depends
	cd ext; make depends
ifeq ($(build_particles),1)
		cd Cantera/cads; make depends
endif

ChangeLog: CVS/Entries 
	tools/bin/cvs2cl.pl --prune

export: ChangeLog
	/usr/bin/install -c -d $(export_dir)
	if (test -d $(export_dir)/cantera); then rm -r -f $(export_dir)/cantera; fi
	if (test -d $(export_dir)/cantera-$(version)); then rm -r -f $(export_dir)/cantera-$(version); fi
	cd $(export_dir); cvs export $(branch) cantera
	cd $(export_dir)/cantera; rm -r -f win32
	cd $(export_dir); mv cantera cantera-$(version)

export-win: ChangeLog
	/usr/bin/install -c -d $(export_dir)
	if (test -d $(export_dir)/cantera); then rm -r -f $(export_dir)/cantera; fi
	cd $(export_dir); cvs export $(branch) cantera
	cd $(export_dir)/cantera; rm -r -f win32
	cd $(export_dir)/cantera; cvs export  $(branch) win32
	cd $(export_dir); mv cantera cantera-$(version)

pack: export
	(cd $(export_dir); \
          rm -f cantera-$(version).tar.gz; \
          tar cvf cantera-$(version).tar cantera-$(version)/*; \
	  gzip cantera-$(version).tar)

cf: 
	/usr/bin/install -c -d $(export_dir)
	if (test -d $(export_dir)/cantera); then rm -r -f $(export_dir)/cantera; fi
	cd $(export_dir); cvs export $(branch) cantera
	cd $(export_dir)/cantera; rm -r -f win32
	(cd $(export_dir); \
          rm -f cantera-cf.tar.gz; \
          tar cvf cantera-cf.tar cantera/*; \
	  gzip cantera-cf.tar; scp cantera-cf.tar.gz dggoodwin@cf-shell.sourceforge.net:cantera.tar.gz)
	sshcf './runall' &


