#include <stdio.h>

int main(void) {
    static char str[] = "String de teste";
    printf("%s\n", strrev(str));
    return 0; 
}
