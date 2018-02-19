#
# 	testfiles/sample.MK	3.5.126	2018-02-18_21:33:53_CST uadmin six-rpi3b.cptx86.com 3.4-23-g1090ede 
# 	   New release, all issues closed and tested, ready for production fix #12 
#
CC=gcc
CFLAGS=-I.
DEPS = hellomake.h
OBJ = hellomake.o hellofunc.o 

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
	gcc -o $@ $^ $(CFLAGS)
