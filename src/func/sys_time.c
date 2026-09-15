#include <stdint.h>

#define PORT
#include <drivers.h>

#define SYS_TIME
#include <func.h>

static inline void outb(uint16_t port, uint8_t val) {
    __asm__ volatile ("outb %0, %1" : : "a"(val), "Nd"(port));
}

// CMOS stores the time in binary-coded decimal format
static uint8_t bcd_to_binary(uint8_t bcd) {
    return (bcd & 0x0F) + ((bcd / 16) * 10);
}

// Checking whether the CMOS is busy updating
static int cmos_updating_status(void) {
    outb(0x70, 0x0A);
    return (inb(0x71) & 0x80);
}

void get_sys_time(sys_time *time) {
    // waiting for the CMOS to finish updating the values
    while (cmos_updating_status());

    outb(0x70, 0x00); time->second = bcd_to_binary(inb(0x71));
    outb(0x70, 0x02); time->minute = bcd_to_binary(inb(0x71));
    outb(0x70, 0x04); time->hour   = bcd_to_binary(inb(0x71));
    outb(0x70, 0x07); time->day    = bcd_to_binary(inb(0x71));
    outb(0x70, 0x08); time->month  = bcd_to_binary(inb(0x71));
    outb(0x70, 0x09); 
    
    uint8_t year_bcd = inb(0x71);
    time->year = bcd_to_binary(year_bcd) + 2000;
}