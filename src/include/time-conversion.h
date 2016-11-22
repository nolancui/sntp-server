//
// Created by Nathaniel Steers on 20/11/2016.
//

#ifndef SNTP_COURSEWORK_TIME_CONVERSION_H
#define SNTP_COURSEWORK_TIME_CONVERSION_H

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>
#include <arpa/inet.h>
#include "ntp-time.h"
#include "sntp-packet.h"



//ref http://waitingkuo.blogspot.co.uk/2012/06/conversion-between-ntp-time-and-unix.html

void ntp_time_to_unix_time(struct ntp_time_t *ntp, struct timeval *tv)
{
    tv->tv_sec = ntp->second - 2208988800; // the seconds from Jan 1, 1900 to Jan 1, 1970
    tv->tv_usec = (uint32_t)( (double)ntp->fraction * 1.0e6 / (double)(1LL<<32) );
}

void unix_time_to_ntp_time(struct timeval *tv, struct ntp_time_t *ntp)
{
    ntp->second = (uint32_t) (tv->tv_sec + 2208988800);
    ntp->fraction = (uint32_t)( (double)(tv->tv_usec+1) * (double)(1LL<<32) * 1.0e-6 );
}

//-------------------------------------------------------------------------------------------

void get_time(struct timeval *tv){
  gettimeofday(tv, NULL);
}


void print_unix_to_hr(struct timeval *tv)
{
    time_t t2 = (time_t) tv->tv_sec;
    uint32_t milliseconds = (uint32_t) (tv->tv_usec / 1);
    struct tm* tm_info;
    tm_info = localtime(&t2);
    char b1[200];
    char b2[100];
    char b3[100];

    sprintf(b2, "%u", milliseconds);
    strftime(b1, 50, "%Y-%m-%d %H:%M:%S.", tm_info);

    strftime(b3, 10, " (%z)", tm_info);
    strcat(b1, b2);
    strcat(b1, b3);
    printf("%s ", b1);
}

void get_ntp_time(struct timeval *tv, struct ntp_time_t *ntp)
{
    gettimeofday(tv, NULL);
    unix_time_to_ntp_time(tv, ntp);
}



void print_network_packet(struct sntpPacket *sntp){
  printf("Packet contains: \n"
                 "Flags: %X \n"
                 "Stratum: %u \n"
                 "Poll: %u \n"
                 "Precision: %i \n"
                 "Root Delay: %i \n"
                 "Root Dispersion: %u \n"
                 "Ref ID: %u \n"
                 "Reference Seconds: %u \n"
                 "Reference Fractions: %u \n"
                 "Origin Seconds: %u \n"
                 "Origin Fractions: %u \n"
                 "Received Seconds: %u \n"
                 "Received Fractions: %u \n"
                 "Transmit Seconds: %u \n"
                 "Transmit Fractions: %u \n\n\n",
             sntp->flags,
             sntp->stratum,
             sntp->poll,
             sntp->precision,
             ntohl(sntp->root_delay),
             ntohl(sntp->root_dispersion),
             ntohl(sntp->ref_ID),
             ntohl(sntp->ref_ts_sec),
             ntohl(sntp->ref_ts_frac),
             ntohl(sntp->origin_ts_sec),
             ntohl(sntp->origin_ts_frac),
             ntohl(sntp->recv_ts_sec),
             ntohl(sntp->recv_ts_frac),
             ntohl(sntp->trans_ts_sec),
             ntohl(sntp->trans_ts_frac));
}



/*

    // convert unix time to ntp time
    unix_time_to_ntp_time(&tv, &ntp);
    printf("NTP Time: %u %u\n", ntp.second, ntp.fraction);

    // convert ntp time back to unix time to see whether they are same
    ntp_time_to_unix_time(&ntp, &tv);
    printf("UNIX Time: %ld %ld\n", tv.tv_sec, tv.tv_usec)


 //print time in milliseconds

    printf("UNIX Time: %ld %ld\n", tv.tv_sec, (long) tv.tv_usec);

    unsigned long long millisecondsSinceEpoch =
            (unsigned long long) (tv.tv_sec) * 1000 + (unsigned long long) (tv.tv_usec) / 1000;

   printf("Milliseconds since epoch (UNIX) %llu\n\n", millisecondsSinceEpoch);



*/

#endif //SNTP_COURSEWORK_TIME_CONVERSION_H
