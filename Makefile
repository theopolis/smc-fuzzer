CXX = clang++
CXXFLAGS = -Wall -g -std=c++11 -stdlib=libc++
LFLAGS = -framework IOKit -framework CoreFoundation

all: smc 

smc: smc.o
	$(CXX) $(CXXFLAGS) $(LFLAGS) -o smc smc.o

smc.o: smc.h smc.cpp OSTypes.h
	$(CXX) $(CXXFLAGS) -c smc.cpp

clean:
	-rm -f smc smc.o
