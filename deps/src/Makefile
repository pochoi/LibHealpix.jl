CXX = g++
CXXFLAGS = $(pkg-config --cflags --libs healpix_cxx)

HEALPIX = ../downloads/Healpix_3.20
INCLUDES = -I$(HEALPIX)/src/cxx/Healpix_cxx -I$(HEALPIX)/src/cxx/cxxsupport
LIBRARIES = -L$(HEALPIX)/lib -lhealpix_cxx -lcxxsupport -lsharp -lc_utils -lfftpack

all: libhealpixwrapper.so

map.o: map.cpp
	$(CXX) $(CXXFLAGS) map.cpp $(INCLUDES)

alm.o: alm.cpp
	$(CXX) $(CXXFLAGS) alm.cpp $(INCLUDES)

transforms.o: transforms.cpp
	$(CXX) $(CXXFLAGS) transforms.cpp $(INCLUDES)

libhealpixwrapper.so: map.o alm.o transforms.o
	$(CXX) -shared -o libhealpixwrapper.so map.o alm.o transforms.o $(LIBRARIES)

clean:
	-rm *.o
	-rm *.so

install:
	cp libhealpixwrapper.so ..

