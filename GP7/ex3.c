#include<stdio.h>

char *strcpy(char *dst, char *src) {
    char *pdest;
    char *psrc;
    pdest = dst;
    psrc = src;

    do {
        *pdest = *psrc;
        pdest++;
    } while(*psrc++ != '\0');
    return dst;
}
