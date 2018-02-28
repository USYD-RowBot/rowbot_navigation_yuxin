#cc -DDISPLAY_STRING GPS.c
#CFLAGS = -g -Wall -std=c99 -Iinclude
#LIBS = -llcm

GPS_consoleTest: GPS_consoleTest.c
	gcc -o GPS_consoleTest GPS_consoleTest.c GPS_GPS_t.c -llcm

#objects =  sonar_command_t.o


#all: LCMc

#LCMc: $(objects) lcmReceive.o
#	$(CC) $(objects) lcmReceive.o -o LCMc

#sonar_command_t.o : sonar_command_t.h sonar_command_t.c
#		$(CC) $(CFLAGS) -c sonar_command_t.c -o sonar_command_t.o

clean :
	$(RM) GPS_consoleTest $(objects) GPS_consoleTest.o GPS_GPS_t.o
