#include <stdio.h>

int main(void) {
    int value, i, digito;
    printf("Introduza um numero: ");
    scanf("%d", &value);
    printf("\nO valor em octal: ");
    i=10;
    while( ((value & 07000000000) == 0 ) && (i > 0) ) {
        value = value << 3;
        i--;
    }
    do {
        digito = (value & 07000000000) >> 27;
        printf("%c", digito + '0');
        value = value << 3;
        i--;
    } while(i > 0);
    printf("\n");
    return 0;
}

