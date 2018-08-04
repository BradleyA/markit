#
# 	sample.MK  3.38.179  2018-08-04_13:18:57_CDT  https://github.com/BradleyA/markit  uadmin  three-rpi3b.cptx86.com 3.37  
# 	   New release not backward compatible with markchaeck because of formatting 
#
CC=gcc
CFLAGS=-I.
DEPS = hellomake.h
OBJ = hellomake.o hellofunc.o 

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
	gcc -o $@ $^ $(CFLAGS)
