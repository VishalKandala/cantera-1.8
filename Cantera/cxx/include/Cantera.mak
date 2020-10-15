#######################################################################
# Include Snipet for Makefiles
#
#    To create Cantera C++ applications from the install environment
#    include this file into your Makefile environment
#
#  Main Variables:
# 
#      CANTERA_INCLUDES = Variable containing the include path
#
#
#      CANTERA_LIBS = List of libraries to include on the link line
#
#      CANTERA_LIBS_DEP = dependency line for Cantera libs
# 
#
#####################################################################
# $Id: Cantera.mak.in,v 1.5 2009/01/09 23:26:41 hkmoffa Exp $
#
#
# This variable determines whether we are making this example in the
# build tree environment or in the install tree environment.
#
in_CanteraBuildTree = 0

###############################################################################
#        CANTERA CORE 
###############################################################################
#
# The directory where Cantera include files may be found.
#  Include files in application programs should start with:
#     #include "cantera/thermo.h"
#     #include "cantera/kernel/HMWSoln.h"
#
CANTERA_INCROOTDIR= /usr/local/cantera/include

CANTERA_CORE_INCLUDES=-I$(CANTERA_INCROOTDIR)
#
# Library location
#
CANTERA_LIBSDIR= /usr/local/cantera/lib

#
# Required Cantera libraries
#
CANTERA_CORE_LIBS= -L$(CANTERA_LIBSDIR)  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lctcxx

#
# Cantera Core Lib Dependencies
#
CANTERA_CORE_LIBS_DEP=  /usr/local/cantera/lib/libequil.a /usr/local/cantera/lib/libkinetics.a /usr/local/cantera/lib/libtransport.a /usr/local/cantera/lib/libthermo.a /usr/local/cantera/lib/libctnumerics.a /usr/local/cantera/lib/libctmath.a /usr/local/cantera/lib/libtpx.a /usr/local/cantera/lib/libctspectra.a /usr/local/cantera/lib/libconverters.a /usr/local/cantera/lib/libctbase.a $(CANTERA_LIBSDIR)/libctcxx.a

#####################################################################
#            BOOST
####################################################################
#
# Cantera Boost Include
#
CANTERA_BOOST_INCLUDES= 
#
# Location of the boost library that Cantera linked against
#
CANTERA_BOOST_LIB_DIR= 
#
# Linkage extras for linking against boost
#
ifeq ($(CANTERA_BOOST_LIB_DIR),"")
CANTERA_BOOST_LIBS=
else
CANTERA_BOOST_LIBS= -L$(CANTERA_BOOST_LIB_DIR) -l
endif

#####################################################################
#         CVODE/SUNDIALS LINKAGE
####################################################################
#
CANTERA_use_sundials = 1
#
# Includes for Sundials - none for cvode
#
CANTERA_CVODE_INCLUDE=-I/usr/local/bin//include
CANTERA_SUNDIALS_LIB_DIR=/usr/local/bin//lib
#
# Link line for cvode and sundials
#
ifeq ($(CANTERA_use_sundials), 1)
CANTERA_CVODE_LIBS=-L$(CANTERA_SUNDIALS_LIB_DIR) -lsundials_cvodes -lsundials_nvecserial
CANTERA_CVODE_LIBS_DEP=/usr/local/bin//lib/libsundials_cvodes.a /usr/local/bin//lib/libsundials_ida.a /usr/local/bin//lib/libsundials_nvecserial.a
else
CANTERA_CVODE_LIBS= -L$(CANTERA_LIBSDIR) -lcvode
CANTERA_CVODE_LIBS_DEP=$(CANTERA_LIBSDIR)/libcvode.a
endif
#
#######################################################################
#         BLAS LAPACK LINKAGE
#######################################################################
#
CANTERA_build_lapack= 1
CANTERA_build_blas= 1

CANTERA_BLAS_LAPACK_DIR= /usr/local/cantera/lib

CANTERA_BLAS_LAPACK_LIBS = -L$(CANTERA_BLAS_LAPACK_DIR) -lctlapack -lctblas
CANTERA_BLAS_LAPACK_LIBS_DEP=
#
#######################################################################
#        CANTERA's F2C Linkage
#######################################################################
#
CANTERA_build_with_f2c= 1
CANTERA_build_f2c_lib= 1

ifeq ($(CANTERA_build_f2c_lib), 1) 
CANTERA_F2C_LIBS= -L$(CANTERA_LIBSDIR) -lctf2c
else
CANTERA_F2C_LIBS= 
endif
#
#####################################################################
#      COMBINATIONS OF INCLUDES AND LIBS
####################################################################
#
CANTERA_TOTAL_INCLUDES= $(CANTERA_CORE_INCLUDES) $(CANTERA_BOOST_INCLUDES) $(CANTERA_CVODE_INCLUDE)
#
# LIBS and LIBS should be the same ...
#
CANTERA_TOTAL_LIBS2 =  -L$(CANTERA_LIBSDIR)   -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c
#
CANTERA_TOTAL_LIBS= $(CANTERA_CORE_LIBS) $(CANTERA_BOOST_LIBS) \
                    $(CANTERA_CVODE_LIBS) $(CANTERA_BLAS_LAPACK_LIBS) \
                    $(CANTERA_F2C_LIBS)
#
CANTERA_TOTAL_LIBS_DEP= $(CANTERA_CORE_LIBS_DEP) \
                        $(CANTERA_CVODE_LIBS_DEP) \
                        $(CANTERA_BLAS_LAPACK_LIBS_DEP)
#
#
# Dependency Line
#
CANTERA_LIBS_DEP=  /usr/local/cantera/lib/libequil.a /usr/local/cantera/lib/libkinetics.a /usr/local/cantera/lib/libtransport.a /usr/local/cantera/lib/libthermo.a /usr/local/cantera/lib/libctnumerics.a /usr/local/cantera/lib/libctmath.a /usr/local/cantera/lib/libtpx.a /usr/local/cantera/lib/libctspectra.a /usr/local/cantera/lib/libconverters.a /usr/local/cantera/lib/libctbase.a /usr/local/cantera/lib/libctf2c.a $(CANTERA_LIBDIR)/libctcxx.a
#
#####################################################################
#  END
####################################################################
