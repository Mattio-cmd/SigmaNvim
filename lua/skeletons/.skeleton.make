CC=cc
BIN=.o
CFLAGS= -o -Wall

all: main.c
	$(CC) $^ $(CFLAGS) $(BIN)

clean:
	rm *.o
