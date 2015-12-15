CC = gcc
CFLAGS = -Wall -g -framework IOKit -framework CoreFoundation -arch i386

all: smc 

smc: smc.o
	$(CC) $(CFLAGS) -o smc smc.o

smc.o: smc.h smc.c OSTypes.h
	$(CC) -arch i386 -c smc.c

clean:
	-rm -f smc smc.o
