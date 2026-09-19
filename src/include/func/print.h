#if !defined(PRINT_H)
#define PRINT_H

/*
 * allows you to output any text to the console,
 * also you can use the following wildcards 
 * to insert various variables:
 *
 * %d - integer 
 * %x - unsigned integer
 *
 * %s - string
 * %c - character
 *
 * you can use `%%` to display `%`
 */
extern void print(const char* str, ...);

#endif