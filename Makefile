CC = gcc
CFLAGS = -Wall -g -framework IOKit -framework CoreFoundation

all: smc 

smc: smc.o
	$(CC) $(CFLAGS) -o smc smc.o

smc.o: smc.h smc.c OSTypes.h
	$(CC) -c smc.c

clean:
	-rm -f smc smc.o
