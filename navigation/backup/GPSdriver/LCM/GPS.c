// Note: set /dev/ttyACM0 a permission 777 first


#include <errno.h>
#include <fcntl.h> 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <termios.h>
#include <unistd.h>
#include <time.h>
#include <stdbool.h>
#include <lcm/lcm.h>
#include "timestamp.h"
#include "GPS_GPS_t.h"
#include "GPS.h"

int set_interface_attribs(int fd, int speed)
{
    struct termios tty;

    if (tcgetattr(fd, &tty) < 0) {
        printf("Error from tcgetattr: %s\n", strerror(errno));
        return -1;
    }

    cfsetospeed(&tty, (speed_t)speed);
    cfsetispeed(&tty, (speed_t)speed);

    tty.c_cflag |= (CLOCAL | CREAD);    /* ignore modem controls */
    tty.c_cflag &= ~CSIZE;
    tty.c_cflag |= CS8;         /* 8-bit characters */
    tty.c_cflag &= ~PARENB;     /* no parity bit */
    tty.c_cflag &= ~CSTOPB;     /* only need 1 stop bit */
    tty.c_cflag &= ~CRTSCTS;    /* no hardware flowcontrol */

    /* setup for non-canonical mode */
    tty.c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP | INLCR | IGNCR | ICRNL | IXON);
    tty.c_lflag &= ~(ECHO | ECHONL | ICANON | ISIG | IEXTEN);
    tty.c_oflag &= ~OPOST;

    /* fetch bytes as they become available */
    tty.c_cc[VMIN] = 1;
    tty.c_cc[VTIME] = 1;

    if (tcsetattr(fd, TCSANOW, &tty) != 0) {
        printf("Error from tcsetattr: %s\n", strerror(errno));
        return -1;
    }
    return 0;
}

void set_mincount(int fd, int mcount)
{
    struct termios tty;

    if (tcgetattr(fd, &tty) < 0) {
        printf("Error tcgetattr: %s\n", strerror(errno));
        return;
    }

    tty.c_cc[VMIN] = mcount ? 1 : 0;
    tty.c_cc[VTIME] = 5;        /* half second timer */

    if (tcsetattr(fd, TCSANOW, &tty) < 0)
        printf("Error tcsetattr: %s\n", strerror(errno));
}


int main()
{
    char *portname = "/dev/ttyACM0";
    int fd;
    int wlen;
    int64_t timeStamp;

    fd = open(portname, O_RDWR | O_NOCTTY | O_SYNC);
    if (fd < 0) {
        printf("Error opening %s: %s\n", portname, strerror(errno));
        return -1;
    }
    /*baudrate 9600, 8 bits, no parity, 1 stop bit */
    set_interface_attribs(fd, B9600);
    //set_mincount(fd, 0);                /* set to pure timed read */

    /* simple output */
    wlen = write(fd, "Hello!\n", 7);
    if (wlen != 7) {
        printf("Error from write: %d, %d\n", wlen, errno);
    }
    tcdrain(fd);    /* delay for output */




    // Setup LCM
    lcm_t * lcm = lcm_create(NULL);
    if(!lcm) {
	printf("Error: Cannot create LCM instance.");
        return 1;
    }

    /* simple noncanonical input */
    do {
        char buf[80];
        int rdlen;
    
        timeStamp=timestamp_now();
        rdlen = read(fd, buf, sizeof(buf) - 1);
        if (rdlen > 0) {

            char *east=",E,";
            char *south=",S,";
            char *west=",W,";
            char *north=",N,";
            char splitChar=',';
            int indicator=0;
            char *result=strstr(buf,"$GPRMC");
    

            
            if (!result) { // if not found
                continue;
            }

            printf("Time: %" PRId64 "\n", timeStamp);

            buf[rdlen] = 0;
            //printf("Read %d: \"%s\"\n", rdlen, buf);

            char sub[20];

            char *result2=strstr(buf,south);

            if (!result2) { // if not found
                indicator=1;
                char *result2=strstr(buf,north);
                if (!result2)
                    continue;
            }   

            int position = result2-buf;  // index of the match substring
            int i=-3;      
            while (buf[position+i]!=splitChar) // look for space as terminator
                i--;

            i++;
            int j=i;
            while (j<0){ // copy string
                
                sub[j-i]=buf[j+position];
                j++;

            }

            double latitude=atof(sub)/100;







            char sub2[20];
            int indicator2 =0;
            char *result3=strstr(buf,east);
            if (!result3) { // if not found
                indicator2=1;
                char *result3=strstr(buf,west);
                if (!result3)
                    continue;
            }   

            position = result3-buf;  // index of the match substring
            i=-3;      

            while (buf[position+i]!=splitChar) // look for space as terminator
                i--;
               
            i++;
            j=i;
            while (j<0){ // copy string
                
                sub2[j-i]=buf[j+position];
                j++;

            }

            double longitude=atof(sub2)/100;







            if (indicator != 0)
                printf("Latitude: %f North\n",latitude);
            else
                printf("Latitude: %f South\n",latitude);

            if (indicator2 != 0)
                printf("Longitude: %f West\n\n",longitude);
            else
                printf("Longitude: %f East\n\n",longitude);


	    int8_t eastI,westI,northI,southI;
	    if (indicator2 ==0){
	    	eastI=1;
		westI=0;
            }
	    if (indicator ==0){
	    	northI=0;
		southI=1;
            }

            GPS_GPS_t my_data = {
            
                .utime=timeStamp,
                .latitude=latitude,
                .longitude=longitude,
                .south=southI,
                .north=northI,
                .east=eastI,
                .west=westI,
            };
            

            GPS_GPS_t_publish(lcm,CHANNEL_NAME,&my_data);  



        } else if (rdlen < 0) {
            printf("Error from read: %d: %s\n", rdlen, strerror(errno));
        }





        /* repeat read to get full message */
    } while (1);
}

/****  get timestamp ****/
int64_t timestamp_now (void)  // obtain timestamp
{
    struct timeval tv;
    gettimeofday (&tv, NULL);
    return (int64_t) tv.tv_sec * 1000000 + tv.tv_usec;
}
