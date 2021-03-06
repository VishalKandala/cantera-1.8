import sys
import string
from distutils.core import setup, Extension

#
# HKM
# note having a % in a string may cause the distutils module to error exit 
# This occurs on solaris, as some CC parameters have % in their names.
    
libs = []
platform = sys.platform

flibs = []
if 1 <> 1:
    flibstr = ''
    f1 = flibstr.replace('-l', ' ')
    flibs = f1.split()

linkargs = '  -L/usr/local/lib'

numarray_incl = ""
numpy_incl = "/usr/local/lib/python2.6/dist-packages/numpy/core/include"

num_collect = []
if (type(numarray_incl).__name__=='str') :
    if numarray_incl <> '':
        numarray_list =  numarray_incl.split(":")
        num_collect = num_collect + numarray_list

if (type(numpy_incl).__name__=='str') :
    if numpy_incl <> '':
        numpy_list =  numpy_incl.split(":")
        num_collect = num_collect + numpy_list

incdirs=["../../build/include", "src", "../clib/src"]

if num_collect <> '':
    for x in num_collect :
       if x <> '' :
          incdirs.append(x)

bllibstr = "-lctlapack -lctblas"
bllibs = bllibstr.replace('-l',' ')
bllist = bllibs.split()

cvlibstr = "-lsundials_cvodes -lsundials_nvecserial"
cvlibs = cvlibstr.replace('-l',' ')
cvlist = cvlibs.split()

thermolib = []
need_cathermo = 1
if need_cathermo == 1:
    thermolib = ["thermo"]
    
extra_link = linkargs + " " + ""
linkargs = extra_link.split()    

bldirstr = " -L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu -L/usr/local/bin//lib"
bldirs = bldirstr.replace('-L',' ')
dirlist = bldirs.split()
libdir = ['/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu']
for d in dirlist:
    libdir.append(d)

endlibstr1 = "-lctf2c -lm"
endlib1 = endlibstr1.replace('-l', ' ')
endlib = endlib1.split()

locallibstr = " -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c"
local1 = locallibstr.replace('-l', ' ')
locallibs = local1.split()

if platform == "win32":
    libs = ["clib", "zeroD","oneD","kinetics", "transport",
            "cantera"] + bllist + cvlist + ["ctbase", "ctmath", "tpx"]
else:
    libs = ["clib"] + locallibs
    #if flibs:
    #    libs = libs 
    #libs = ["clib", "zeroD","oneD", "kinetics", "transport",
    #        "equil", "ctnumerics", "converters"] + thermolib + bllist + cvlist + ["ctbase", "ctmath", "tpx", "boost_thread-mt-1_34"]
                                          
    if 1 == 1:
        libs.append("ctf2c")
    else:
        libs = libs + flibs
        
    for d in endlib:
        libs.append(d) 


# values:
#  0   do nothing
#  1   install only ctml_writer.py
#  2   install full package
buildPython = 2
if buildPython >= 2:

#    try:
        setup(name="Cantera",
              version="1.8.0",
              description="The Cantera Python Interface",
              long_description="""
              """,
              author="Prof. D. G. Goodwin, Caltech",
              author_email="dgoodwin@caltech.edu",
              url="http://code.google.com/p/cantera",
              package_dir = {'MixMaster':'../../apps/MixMaster'},
              packages = ["","Cantera","Cantera.OneD",
                          "MixMaster","MixMaster.Units"],
              ext_modules=[ Extension("Cantera._cantera",
                                      ["src/pycantera.cpp"],
                                      include_dirs=incdirs,
                                      library_dirs = libdir,
                                      libraries = libs,
                                      extra_link_args = linkargs
                                      )
                            ],
              )
#    except:
#        if buildPython == 3:
#          buildPython = 1
#        else:
#          raise 'Error encountered while building or installing the Cantera python modules!'
    
        
if buildPython == 1:
#    try:
        setup(name="Cantera CTI File Processor",
              version="1.8.0",
              description="Converts .cti files to CTML",
              long_description="""
              """,
              author="Prof. D. G. Goodwin, Caltech",
              author_email="dgoodwin@caltech.edu",
              url="http://www.cantera.org",
              py_modules = ["ctml_writer"],
              )
#    except:
#        raise 'Error encountered while building or installing the Cantera CTI file preprocessor!'
