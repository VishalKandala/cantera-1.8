#!/bin/sh

SUFFIXES=
SUFFIXES= .inp .log .dat

# list all mechanism files here
MECHS = 

BUILDBIN=/pkg/Cantera/build/bin/x86_64-unknown-linux-gnu

all: gri30.xml

gri30.xml: gri30.cti
	$(BUILDBIN)/cti2ctml gri30.cti

