// This is for testing the LCM and control in console, not for actual implementation

#include <lcm/lcm.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <inttypes.h>

#include "GPS_GPS_t.h"

#include "GPS.h"
    
int lcmCommand=2;

static void command_handler(const lcm_recv_buf_t *rbuf, const char * channel,
                            const GPS_GPS_t * msg, void * user) {
    //enum commands cmd = (enum commands)(msg->cmd);
    printf("receivedTime=%" PRId64 "\n",msg -> utime);
   
    printf("latitude=%f longitude=%f east=%d west=%d north=%d south=%d\n",msg -> latitude,msg -> longitude,msg -> east,msg -> west,msg -> north,msg -> south);

    
}

int main(void){
  
    lcm_t * lcm = lcm_create(NULL);   // create lcm instance
    if (!lcm)
        return 1;
    //char channel_name[100]="";
    //printf("LCM Reciever using C.\n");
    //printf("Channel Name: ");
    //scanf("%s",channel_name);
    //printf("\n");
    GPS_GPS_t_subscribe(lcm, CHANNEL_NAME, &command_handler, NULL);

    while (1){
        char message[200];
        lcm_handle_timeout(lcm,5000); // for receive and handle


    }
    
    lcm_destroy(lcm);
    return 0;
}
