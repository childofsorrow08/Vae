#if !defined(PORT_H)
#define PORT_H

#include <stdint.h>

extern uint8_t inb(uint16_t port);
extern void outb(uint16_t port, uint8_t data);

#endif