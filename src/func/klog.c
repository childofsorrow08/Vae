#define SYS_TIME
#define PRINT 
#include <func.h>

#include <stdarg.h>

/*
 * [KERNEL] logging with time stamp from CMOS
 */
void klog(const char* format, ...) {
    sys_time time;
    get_sys_time(&time);

    print("[KERNEL] [%d:%d:%d] ", time.hour, time.minute, time.second);

    va_list parameters;
    va_start(parameters, format);
    vprint(format, parameters);
    va_end(parameters);

    print("\n");
}