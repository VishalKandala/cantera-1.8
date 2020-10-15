# cantera-1.8-build-docker
## Pre-setup
FROM i386/ubuntu:xenial
### Calling ubuntu 16.04 Docker Image for extension. 
MAINTAINER "Vishal Indivar Kandala (VIKing)"
RUN mkdir /pkg/
ENV PATH="/pkg/:${PATH}"
#WORKDIR /pkg/
RUN cd /pkg/
## Setup: Dependency resolution
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update   
### updating aptitude repository for xenial
RUN DEBIAN_FRONTEND=noninteractive apt-get -y  install software-properties-common
### Adding "add-apt-repository" command 
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:deadsnakes/ppa
### Adding repository "Deadsnakes" to pull python 2.6.9 from.
RUN apt-get update
### Pulling necessary files for python installation from "Deadsnakes".
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y  python2.6 python2.6-dev
### Installing python 2.6.9 on the container
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssl gcc g++ wget git make
### Installing openssl for comms; gcc and g++ which are gnu c and c++ compilers.
RUN DEBIAN_FRONTEND=noninteractive ln -s /usr/bin/python2.6 /usr/bin/python
### Hard linking the python2.6 path to the 'python' command.
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget
### Installing wget
RUN DEBIAN_FRONTEND=noninteractive wget https://bootstrap.pypa.io/2.6/get-pip.py
### Downloading get-pip for py26
RUN DEBIAN_FRONTEND=noninteractive wget  https://bootstrap.pypa.io/ez_setup.py
### Downloading setuptools setup
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive python ez_setup.py setuptools==2.0
RUN DEBIAN_FRONTEND=noninteractive python get-pip.py pip==1.4.1
### Installing pip
RUN apt-get update
### updating apt
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git
### Installing git
RUN pip install numpy==1.7.0
### Installing Numpy 1.7 
RUN pip install Cython==0.12
### Installing Cython 0.12  
#RUN pip install scipy==0.7.0
### Installing Scipy 0.7.0
RUN git clone https://github.com/VishalKandala/Cantera1.8-Radcal
### Downloading Cantera-1.8
RUN mkdir /pkg/dep/
RUN cd /pkg/dep/
RUN DEBIAN_FRONTEND=noninteractive wget https://computing.llnl.gov/projects/sundials/download/sundials-2.3.0.tar.gz
RUN DEBIAN_FRONTEND=noninteractive tar -xf sundials-2.3.0.tar.gz
RUN cd sundials-2.3.0
WORKDIR /sundials-2.3.0/
RUN DEBIAN_FRONTEND=noninteractive ./configure --with-cflags=-fPIC
RUN DEBIAN_FRONTEND=noninteractive make
RUN DEBIAN_FRONTEND=noninteractive make install
RUN DEBIAN_FRONTEND=noninteractive apt-get update
WORKDIR /Cantera1.8-Radcal
RUN chmod +x preconfig
RUN ./preconfig
### Run preconfig
RUN make
### Generate make files
RUN make install
### Install from make files
RUN DEBIAN_FRONTEND=noninteractive cp -f "/root/setup_cantera" "/usr/local/cantera/bin"
RUN DEBIAN_FRONTEND=noninteractive chmod +x /usr/local/cantera/bin/setup_cantera
RUN DEBIAN_FRONTEND=noninteractive chmod +x /usr/local/cantera/bin/ctnew
RUN DEBIAN_FRONTEND=noninteractive chmod +x /usr/local/cantera/bin/mixmaster
### Setting up Cantera source.
#RUN source ~/setup_cantera
