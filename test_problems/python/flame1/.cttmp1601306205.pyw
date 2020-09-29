from ctml_writer import *
import sys, os, os.path
file = "/usr/local/cantera/data/h2o2.cti"
base = os.path.basename(file)
root, ext = os.path.splitext(base)
dataset(root)
execfile(file)
write()
