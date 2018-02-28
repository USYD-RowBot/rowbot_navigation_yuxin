#cc -DDISPLAY_STRING GPS.c
#CFLAGS = -g -Wall -std=c99 -Iinclude
#LIBS = -llcm

GPS: GPS.c
	gcc -o GPS GPS.c GPS_GPS_t.c -llcm

#objects =  sonar_command_t.o


#all: LCMc

#LCMc: $(objects) lcmReceive.o
#	$(CC) $(objects) lcmReceive.o -o LCMc

#sonar_command_t.o : sonar_command_t.h sonar_command_t.c
#		$(CC) $(CFLAGS) -c sonar_command_t.c -o sonar_command_t.o

clean :
	$(RM) GPS $(objects) GPS.o GPS_GPS_t.o
