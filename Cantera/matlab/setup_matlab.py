
import sys

######################################################################
#  System Notes:
#
# HKM solaris 64:
#   On this system matlab is built with gcc. Therefore, you will have to
#   strip the "-lCrun -lCstd -lfsu" library commands from libs. They
#   will cause a link error. because they are only applicable to
#   sun's native CC compiler.
#
######################################################################

bindir = '/usr/local/cantera/bin'
libdir = '-L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu  -L/Cantera1.8-Radcal/build/lib/x86_64-unknown-linux-gnu -L/usr/local/bin//lib'
incdir = '/Cantera1.8-Radcal/build/include'
libs   = '-lclib  -luser -loneD -lzeroD -lequil -lkinetics -ltransport -lthermo -lctnumerics -lctmath -ltpx -lctspectra -lconverters -lctbase -lsundials_cvodes -lsundials_nvecserial -lctlapack -lctblas -lctf2c   -lctf2c -lm'

f = open('setup.m','w')
f.write('cd cantera\nbuildux\nexit\n')
f.close()

fb = open('cantera/buildux.m','w')
fb.write("""
disp('building Cantera..');
mex -cxx -v private/ctmethods.cpp private/ctfunctions.cpp ...
    private/xmlmethods.cpp private/phasemethods.cpp  ...
    private/thermomethods.cpp private/kineticsmethods.cpp ...
    private/mixturemethods.cpp ...
    private/transportmethods.cpp private/reactormethods.cpp ...
    private/reactornetmethods.cpp ...
    private/wallmethods.cpp private/flowdevicemethods.cpp ...
    private/funcmethods.cpp ...
    private/onedimmethods.cpp private/surfmethods.cpp ...
"""+'-I'+incdir+'     '+libdir+' '+libs+'\n'+"""disp('done.');
""")
fb.close()

fp = open('cantera/ctbin.m','w')
fp.write("""function path = ctbin
path = '"""+bindir+"""';
""")
fp.close()

