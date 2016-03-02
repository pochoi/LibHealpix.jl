#!/bin/bash

HEALPIXDIR=downloads/Healpix_3.20

cd $HEALPIXDIR
mkdir -p include
mkdir -p lib

# patch the configure script to search the correct directory on Travis
patch hpxconfig_functions.sh ../../hpxconfig_functions.patch

# patch the C Makefile to link libcfitsio into libchealpix
patch src/C/subs/Makefile ../../src_C_subs_Makefile.patch

cd src/C/autotools
autoreconf --install
./configure --prefix=$PWD/../../../
make install

cd ../../cxx/autotools
autoreconf --install
./configure --prefix=$PWD/../../../
make install

