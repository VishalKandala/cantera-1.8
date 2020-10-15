############################################################################
#
#  Makefile to compile and link a C++ application to 
#  Cantera.
#
#############################################################################
.SUFFIXES :
.SUFFIXES : .cpp .d .o .d .h


# the name of the executable program to be created
PROG_NAME = kinetics1

# the object files to be linked together. List those generated from Fortran
# and from C/C++ separately
OBJS = kinetics1.o

# additional flags to be passed to the linker. If your program
# requires other external libraries, put them here
LINK_OPTIONS = 

#############################################################################
# True if we are in the source directory tree
srcdirtree=1

# Fortran libraries
FORT_LIBS = 

# Purify options
PURIFY=

# the C++ compiler
CXX = g++

# C++ compile flags
CXX_FLAGS = -O3 -Wall   

# external libraries
EXT_LIBS =  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c -ltpx -lctcxx

# Ending C++ linking libraries
LCXX_END_LIBS = -lctf2c -lm

# the directory where the Cantera libraries are located
CANTERA_LIBDIR=/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu

# required Cantera libraries
CANTERA_LIBS =  

# Depends
ifeq ($srcdirtree, 1)
  LOCAL_DEFNS =  -DSRCDIRTREE
else
  LOCAL_DEFNS = 
endif 

# the directory where Cantera include files may be found.
CANTERA_INCDIR=/Cantera1.8-Radcal/build/include

# flags passed to the C++ compiler/linker for the linking step
LCXX_FLAGS = -L$(CANTERA_LIBDIR)  -L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu -L/usr/local/bin//lib -O3 -Wall  

# how to compile C++ source files to object files
.cpp.o:
	$(PURIFY) $(CXX) -c $< -I$(CANTERA_INCDIR) $(CXX_FLAGS) $(LOCAL_DEFNS)

# how to create a dependency file
.cpp.d:
	g++ -MM -I$(CANTERA_INCDIR) $(CXX_FLAGS) $(LOCAL_DEFNS) $*.cpp > $*.d

PROGRAM = $(PROG_NAME)$(EXE_EXT)

DEPENDS = $(OBJS:.o=.d)

all: $(PROGRAM) .depends

$(PROGRAM): $(OBJS) 
	$(PURIFY) $(CXX) -o $(PROGRAM) $(OBJS) $(LCXX_FLAGS) $(CANTERA_LIBS) \
                   $(LINK_OPTIONS) $(EXT_LIBS)  $(FORT_LIBS) \
                  $(LCXX_END_LIBS)

test:
	make $(PROGRAM)
	./runtest

INSTALL_DIR=/usr/local/cantera/demos/cxx/kinetics1

install:
	/usr/bin/install -c -d     $(INSTALL_DIR)
	/usr/bin/install -c       -c -m ug+rw,o+r Makefile.install $(INSTALL_DIR)/Makefile
	@(for ihhh in *.cpp *.h  *blessed* ; do  \
             /usr/bin/install -c        $${ihhh} -m ug+rw,o+r $(INSTALL_DIR) ; \
             echo "/usr/bin/install -c  $${ihhh} -m ug+rw,o+r $(INSTALL_DIR)" ; \
         done )
	 /usr/bin/install -c        runtest  $(INSTALL_DIR) ; 


depends: $(DEPENDS)
	make .depends

.depends: $(DEPENDS)
	cat $(DEPENDS) > .depends

clean:
	$(RM) $(OBJS) $(PROGRAM) .depends *.d
	$(RM) ct2ctml.log diff* output_0.txt transport_log.xml \
              kinetics1.csv
	(if test -d SunWS_cache ; then \
           $(RM) -rf SunWS_cache ; \
         fi )

TAGS:
	etags *.h *.cpp

ifeq ($(wildcard .depends), .depends)
include .depends
endif

