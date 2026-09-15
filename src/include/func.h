#if !defined(FUNC_H)
#define FUNC_H

#include <stdarg.h>
#include <stdint.h>

#if defined(LOG)
    extern void klog(const char* format, ...);
#endif

#if defined(PRINT)
    extern void vprint(const char* format, va_list parameters);
    extern void print(const char* format, ...);
#endif

#if defined(SYS_TIME)
    typedef struct sys_time{
        uint8_t second;
        uint8_t minute;
        uint8_t hour;
        uint8_t day;
        uint8_t month;
        uint16_t year;
    } sys_time;

    extern void get_sys_time(sys_time *time);
#endif

#endif