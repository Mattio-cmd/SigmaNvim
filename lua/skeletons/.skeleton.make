CC=cc
CFLAGS= -g -Wall
BINDIR=bin
BIN = $(BINDIR)/main
SRC=src
OBJ=obj
SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))
SUBMITNAME=name.zip

all:$(BIN)

release: CC=clang
release: CFLAGS=-Wall -O2 -DNDEBUG
release: clean
release: $(BIN)

libmycode.o: $(SRC)/funcs.c $(SRC)/funcs.h
	$(CC) -o $(OBJ)/libmycode.o -c $(SRC)/funcs.c

libmycode.so: $(SRC)/funcs.c $(SRC)/funcs.h
	$(CC) -fPIC -shared -o $(OBJ)/$@ -c $(SRC)/funcs.c -lc

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) -r $(BINDIR)/* $(OBJ)/*

submit:
	$(RM) $(SUBMITNAME)
	zip $(SUBMITNAME) $(BIN)
	tar -zcvf $(SUBMITNAME).tar.gz $(BIN)

