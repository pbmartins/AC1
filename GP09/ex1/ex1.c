#include <stdin.h>

void main() {
    static char string[] = "Aulas de AC1";
    *char p = string;
    
    printf("%d", strlen(p));
}
