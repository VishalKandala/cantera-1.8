        
                             C A N T E R A-Radcal

                              release 1.8R

Original Release:                  08/2009
Latest Update:			   10/2020

***************************************************************
***                                                         
***                                                         
***************************************************************

License information
===================

See the file "License.txt" for information on the terms & conditions
for usage, and a DISCLAIMER OF ALL WARRANTIES.

All trademarks referenced herein are property of their respective
holders.

******************************************************************
This is a Docker VM Implementation of Cantera 1.8 with Radiation Correction.
******************************************************************
Architecture:
VM:
Docker 19.03.13

OS:
Ubuntu 16.04:x_86

Python:
Python 2.6.9

pip:
setuptools 2.0
https://bootstrap.pypa.io/ez_setup.py

pip 1.4.1
https://bootstrap.pypa.io/2.6/get-pip.py
*****************************************************************
Dependencies:
Numpy 1.7.0

Cython 0.12

Sundials 2.3.0
https://computing.llnl.gov/projects/sundials/download/sundials-2.3.0.tar.gz
========================================================
Instructions

1. Download and Install docker:
   1.1 	Install Docker Engine and containerd.
	$ sudo apt-get update
 	$ sudo apt-get install docker-ce docker-ce-cli containerd.io
   1.2  Check whether docker is up and running.
	$ docker run hello-world
2. Build and run the Docker Container:
   2.1 Build the Image:
       $ docker build --force-rm --tag <Image Name> .
   2.2 Build the Container:
       $ docker run -itd --name <container name> <Image Name>

This ensures that the VM is built with Cantera 1.8-radcal compiled and installed in it.
To use the container, we must start and attach the container each time.

3. $ docker start <container name>
   $ docker attach <container name>
========================================================
Web sites
==========

1. The Cantera User's Group. 
    http://groups.google.com/group/cantera-users
   This site has a message board, and some miscellaneous files and utilities. 

2. The Cantera googleCode site.  Distribution of the Cantera source code is
   done using googleCode. The site is http://code.google.com/p/cantera/.

3. The Cantera developers site .
   http://groups.google.com/group/cantera-dev
   Limited access site where developers can discuss development ideas.

=============================================================

*  Old Cantera source code site. Distribution of the Cantera source code was 
   done using SourceForge. The old site is located at
   http://sourceforge.net/projects/cantera.
   It still contains the project cvs history.


