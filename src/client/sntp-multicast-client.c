#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>

#include "../include/time-conversion.h"


uint16_t PORT = 123;
uint16_t POLL = 20;


int main(int argc, char *argv[]) {

    struct sntpPacket sendPacket, recPacket;
    struct ntp_time_t ntp, originntp, transmitntp, receiventp = {0};
    struct timeval tv, timeout, arrival, origintv, transmittv, receivetv = {0};


    memset(&sendPacket, 0, sizeof(struct sntpPacket));
    memset(&recPacket, 0, sizeof(struct sntpPacket));

    int sockfd, activePolling, i, ttl, multicast;

    u_int y = 1;

    ttl = 64;
    multicast = 0;
    socklen_t addr_len;

    struct hostent *he;
    struct sockaddr_in their_addr;


    char hn[256];
    strcpy(hn, "ntp.uwe.ac.uk");

//iterate through command line arguments
    for (i = 1; i < argc; i++) {
        //show help
        if (strcmp(argv[i], "-help") == 0) {
            printf("Usage: \n\n"
                           "-multicast\n"
                           "Enables broadcasting on a multicast group\n\n"
                           "-port\n"
                           "Use requested port\n\n"
                           "-host\n"
                           "Use requested hostname\n\n");
            exit(0);
        }
        //enable multicast
        if (strcmp(argv[i], "-multicast") == 0) {
            printf("Broadcasting on multicast channel %s\n", SNTP_GROUP);
            strcpy(hn, "224.0.1.1");
            multicast = 1;
        }

        //change port
        if (strcmp(argv[i], "-port") == 0) {

            unsigned short int newPort;
            int inputs;

            printf("Enter port number: ");
            inputs = scanf("%hu", &newPort);
            getchar();
            if (inputs == EOF) {
                printf("Bad input, exiting...");
                exit(1);
            } else if (inputs == 0) {
                printf("Using default port: %d\n", PORT);
            } else {
                PORT = newPort;
            }

        }
        //set hostname
        if (strcmp(argv[i], "-host") == 0) {
            if (multicast == 0) {
                printf("Enter hostname: ");
                fgets(hn, 256, stdin);
                hn[strlen(hn) - 1] = '\0';
            } else {
                printf("Cannot specify host in multicast mode\n");
            }
        }

    }

    //resolve hostname
    if ((he = gethostbyname(hn)) == NULL) {
        perror("Error setting hostname");
        exit(1);
    }
    if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) == -1) {
        perror("Error setting socket descriptor");
        exit(1);
    }

    if (multicast == 1) {

        if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &y, sizeof(y)) < 0) {
            perror("Socket reuse error");
            exit(1);
        }

        if (setsockopt(sockfd, IPPROTO_IP, IP_MULTICAST_TTL, &ttl, sizeof(ttl)) < 0) {
            perror("Socket TTL Error");
            exit(1);
        }
    }

    timeout.tv_sec = 5;
    timeout.tv_usec = 0;
//set timeout to 5 seconds
    if (setsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)) < 0) {
        perror("Error setting timeout");
        exit(1);
    }


    memset(&their_addr, 0, sizeof(their_addr));
    /* zero struct */
    their_addr.sin_family = AF_INET;
    /* host byte order .. */
    their_addr.sin_port = htons(PORT);
    /* .. short, netwk byte order */

    if (multicast == 0) {
        their_addr.sin_addr = *((struct in_addr *) he->h_addr);
    }
    if (multicast == 1) {
        their_addr.sin_addr.s_addr = inet_addr(SNTP_GROUP);
    }
    //


    activePolling = 1;


    //set flags

    sendPacket.LI = 0;
    sendPacket.VN = 4;
    sendPacket.MODE = 3;

    while (activePolling == 1) {

        get_ntp_time(&tv, &ntp);

//change byte order

        long tempSeconds = htonl(ntp.second);
        long tempFractions = htonl(ntp.fraction);

        sendPacket.trans_ts_sec = (uint32_t) tempSeconds;
        sendPacket.trans_ts_frac = (uint32_t) tempFractions;

//send packet

        if ((sendto(sockfd, &sendPacket, sizeof(sendPacket), 0,
                    (struct sockaddr *) &their_addr, sizeof(struct sockaddr))) == -1) {
            perror("Error sending packet");
            exit(1);
        }


//set address length
        addr_len = sizeof(struct sockaddr_in);

        memset(&tv, 0, sizeof(struct timeval));

//listen for response

        if ((recvfrom(sockfd, &recPacket, sizeof(recPacket), 0,
                      (struct sockaddr *) &their_addr, &addr_len)) == -1) {
            perror("Response error");
            printf("Retrying in %d seconds\n", POLL);
            sleep(POLL);
        } else {

            get_time(&arrival);

//change byte order

            originntp.second = ntohl(recPacket.origin_ts_sec);
            originntp.fraction = ntohl(recPacket.origin_ts_frac);

            transmitntp.second = ntohl(recPacket.trans_ts_sec);
            transmitntp.fraction = ntohl(recPacket.trans_ts_frac);

            receiventp.second = ntohl(recPacket.recv_ts_sec);
            receiventp.fraction = ntohl(recPacket.recv_ts_frac);


            ntp_time_to_unix_time(&originntp, &origintv);

            ntp_time_to_unix_time(&transmitntp, &transmittv);

            ntp_time_to_unix_time(&receiventp, &receivetv);

//DELAY--------------------------------------------

            double dTotal = calcDelay(&arrival, &origintv, &transmittv, &receivetv);

//------------------------------------------------------

//OFFSET------------------------------------------------

            double oTotal = calcOffset(&arrival, &origintv, &transmittv, &receivetv);

//------------------------------------------------------

//convert to UNIX time

            memset(&ntp, 0, sizeof(struct ntp_time_t));

            ntp.second = ntohl(recPacket.recv_ts_sec);
            ntp.fraction = ntohl(recPacket.recv_ts_frac);

            ntp_time_to_unix_time(&ntp, &tv);

//check LI for leap seconds

            if (recPacket.stratum > 0 && recPacket.stratum <= 15 ) {

                if (recPacket.LI == 0) {

                    //no leap
                    print_timestamp(&tv);
                    printf("+ %f +/- %f %s(%s) s%u no-leap\n", oTotal, dTotal, hn, inet_ntoa(their_addr.sin_addr),
                           recPacket.stratum);
                    activePolling = 0;
                }

                if (recPacket.LI == 1) {

                    //+1 second
                    print_leap_positive_timestamp(&tv);
                    printf("+ %f +/- %f %s(%s) s%u leap-minute +1seconds\n", oTotal, dTotal, hn,
                           inet_ntoa(their_addr.sin_addr),
                           recPacket.stratum);
                    activePolling = 0;
                }

                if (recPacket.LI == 2) {

                    //-1 second
                    print_leap_negative_timestamp(&tv);
                    printf("+ %f +/- %f %s(%s) s%u leap-minute -1seconds\n", oTotal, dTotal, hn,
                           inet_ntoa(their_addr.sin_addr),
                           recPacket.stratum);
                    activePolling = 0;
                }

                if (recPacket.LI == 3) {
                    //server clock not sync'd yet
                    printf("Server clock not synchronized, dropping packet\n");
                    printf("Retrying in %d seconds\n", POLL);
                    activePolling = 1;
                    sleep(POLL);
                }
            }
//check stratum for kiss codes
            if (recPacket.stratum == 0) {
                //get ref identifier
                getCode(&recPacket);
            }
//request again if stratum is too high
            if (recPacket.stratum > 15) {
                printf("Stratum too high, polling for new response...\n");
                activePolling = 1;
                sleep(POLL);
            }

        }
    }
    close(sockfd);
    return 0;
}

