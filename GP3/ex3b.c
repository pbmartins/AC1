#include <stdio.h>

void main(void) {
	int res=0, i=0, mdor, mdo;
	
	printf("Introduza dois numeros:\n");
	scanf("%d", &mdor);
	scanf("%d", &mdo);
	
	while( (mdor != 0) && (i++ < 16) )
	{
	    if( (mdor & 0x00000001) != 0 )
	         res = res + mdo;
	    mdo = mdo << 1;
	    mdor = mdor >> 1;
	}
	printf("Resultado: ");
	printf("%d\n", res);
}
