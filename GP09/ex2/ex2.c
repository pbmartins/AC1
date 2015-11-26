#include <stdin.h>
#define MAX_SIZE 20

int main(int argc, char* argv) {
    static char string2[MAX_SIZE];
    *char p2 = string2;
    *char p = argv;   

    if (argc == 1) {
        if (strlen(p) <= MAX_SIZE) {
            strcpy(p2, argv);
            printf("%d", string2);
        } else {
            printf("String too long. Nothing done!\n");
            return 1;
        }
    }
    return 0;
}

