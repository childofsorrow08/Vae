int int_to_ascii(int value, char* str, int base) {
    char* rc = str;
    char* ptr = rc;
    char* low;
    
    if (base < 2 || base > 36) { *str = '\0'; return 0; }
    
    if (value < 0 && base == 10) {
        *ptr++ = '-';
        value = -value;
    }
    
    low = ptr;
    do {
        int modulo = value % base;
        *ptr++ = (modulo < 10) ? (modulo + '0') : (modulo - 10 + 'a');
        value /= base;
    } while (value);
    
    *ptr-- = '\0';
    
    while (low < ptr) {
        char tmp = *low;
        *low++ = *ptr;
        *ptr-- = tmp;
    }
    
    return 0;
}