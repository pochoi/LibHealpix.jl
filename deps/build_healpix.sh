#!/bin/bash

HEALPIXDIR=downloads/Healpix_3.20

cp config.osx_homebrew_gcc $HEALPIXDIR/src/cxx/config
cd $HEALPIXDIR
mkdir -p include
mkdir -p lib

# patch the configure script to search the correct directory on Travis
patch hpxconfig_functions.sh ../../hpxconfig_functions.patch

bash ./configure -L << EOF
2
gcc-5
-O2 -Wall
ar -rsv
Y
libcfitsio.a
/usr/local/lib
/usr/local/include
y
y
5
/usr/local/lib
/usr/local/include
4
EOF

# patch the C Makefile to link libcfitsio into libchealpix
patch src/C/subs/Makefile ../../src_C_subs_Makefile.patch

make c-all
make cpp-all
make test
