#include <stdin.h>

unsigned int atoi(char* s) {
    unsigned int res = 0, e = 1;
    char* stmp = s;
    int i = 0;
    while((*stmp == '0') || (*stmp == '1')) {
        i++;
        stmp++;
    }

    s = s + i;
    i--;
    for (e = 1; i >= 0; i--, e = e * 2) {
        res = res + (*s-- - '0') * e; 
    }
    return res;
}
