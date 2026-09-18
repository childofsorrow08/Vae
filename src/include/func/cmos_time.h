#if !defined(CMOS_TIME_H)
#define CMOS_TIME_H

#include <stdint.h>


typedef struct sys_time{
    uint8_t second;
    uint8_t minute;
    uint8_t hour;
    uint8_t day;
    uint8_t month;
    uint16_t year;
} sys_time;

extern void get_time(sys_time *time);

#endif