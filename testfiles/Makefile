
#	testfiles/Makefile  3.170.337  2019-02-06T15:29:59.071732-06:00 (CST)  https://github.com/BradleyA/markit  uadmin  six-rpi3b.cptx86.com 3.169-2-ga54656e  
#	   test Makefile 

# Define required macros here
SHELL = /bin/sh

OBJS =  main.o hello.o
CFLAG = -Wall -g
CC = gcc
INCLUDE =
LIBS = -lm

hello:${OBJ}
   ${CC} ${CFLAGS} ${INCLUDES} -o $@ ${OBJS} ${LIBS}

clean:
   -rm -f *.o core *.core a.out

.cpp.o:
   ${CC} ${CFLAGS} ${INCLUDES} -c $<
