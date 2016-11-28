#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include "../include/time-conversion.h"

#define MYPORT 4950


/* the port users connect to */


int main(void) {
    int sockfd;
    struct sntpPacket sendPacket, recPacket;
    struct ntp_time_t ntp = {0};
    struct timeval tv = {0};
    struct sockaddr_in my_addr;
    /* info for my addr i.e. server */
    struct sockaddr_in their_addr;
    /* client's address info */
    int addr_len, quit, update, error;
    long tempSeconds, tempFractions;


    quit = 1;
    update = 1;
    error = 0;

    memset(&sendPacket, 0, sizeof(struct sntpPacket));
    memset(&recPacket, 0, sizeof(struct sntpPacket));

    if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) == -1) {
        perror("Socket error");
        exit(1);
    }
    memset(&my_addr, 0, sizeof(my_addr));
    /* zero struct */
    my_addr.sin_family = AF_INET;
    /* host byte order ... */
    my_addr.sin_port = htons(MYPORT);
    /* ... short, network byte order */
    my_addr.sin_addr.s_addr = INADDR_ANY;
    /* any of server IPs */


    if (bind(sockfd, (struct sockaddr *) &my_addr,
             sizeof(struct sockaddr)) == -1) {
        perror("Socket bind error");
        exit(1);
    }
    addr_len = sizeof(struct sockaddr);

    sendPacket.LI = 3;
    sendPacket.VN = 4;
    sendPacket.MODE = 4;
    sendPacket.stratum = 1;

    memcpy(&sendPacket.ref_ID, "LOCL", 4);


    printf("%u\n", sendPacket.ref_ID);

    if(memcmp(&sendPacket.ref_ID, "LOCL", 4) == 0){
        printf("Ref ID: LOCL\n");
    }


    printf("Online...\n");

    do {

//listen for request

        //update ref time

        if (update == 1) {
            get_reference_time(&sendPacket);
            update = 0;
            printf("Listening...\n");
        }

        if ((recvfrom(sockfd, &recPacket, sizeof(recPacket), 0,
                      (struct sockaddr *) &their_addr, (socklen_t *) &addr_len)) == -1) {
            perror("Bad request");
            error = 1;
            goto ERROR;
        }
        get_ntp_time(&tv, &ntp);

        printf("Got request from %s\n", inet_ntoa(their_addr.sin_addr));

        //check that the client did not supply a poll time

        if (recPacket.poll == 0) {
            sendPacket.poll = (uint8_t) Log2(20);
        } else {
            sendPacket.poll = recPacket.poll;
        }

//set response origin time to transmit time of request
        sendPacket.origin_ts_sec = recPacket.trans_ts_sec;
        sendPacket.origin_ts_frac = recPacket.trans_ts_frac;

//host to network byte swap
        tempSeconds = htonl(ntp.second);
        tempFractions = htonl(ntp.fraction);

        sendPacket.recv_ts_sec = (uint32_t) tempSeconds;
        sendPacket.recv_ts_frac = (uint32_t) tempFractions;

        memset(&tv, 0, sizeof(struct timeval));
        memset(&ntp, 0, sizeof(struct ntp_time_t));
//get system time
        get_ntp_time(&tv, &ntp);

        tempSeconds = htonl(ntp.second);
        tempFractions = htonl(ntp.fraction);
//set transmitted time of response
        sendPacket.trans_ts_sec = (uint32_t) tempSeconds;
        sendPacket.trans_ts_frac = (uint32_t) tempFractions;

        if ((sendto(sockfd, &sendPacket, sizeof(sendPacket), 0,
                    (struct sockaddr *) &their_addr, sizeof(struct sockaddr))) == -1) {
            perror("Could not send response");
            error = 1;
            goto ERROR;

        }
//check the reference time, if 60 seconds out of date since last response update
        if (ntohl(sendPacket.trans_ts_sec) > (ntohl(sendPacket.ref_ts_sec) + 60)) {
            update = 1;
        }

        memset(&tv, 0, sizeof(struct timeval));
        memset(&ntp, 0, sizeof(struct ntp_time_t));

        printf("Response sent to %s\n", inet_ntoa(their_addr.sin_addr));

//label to skip method if errors encountered
        ERROR:
        if (error == 1) {
            printf("Response not formed\n");
            error = 0;
        }


    } while (quit != 0);

    //should never get here

    printf("Exiting...\n");
    close(sockfd);
    exit(0);
}
