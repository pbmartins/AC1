int main(int argc, char *argv[]) {
	int ch = 0;
	int len = 0;
	int maiu  = 0;
	int minu = 0;
	int max_len = 0;
	char **max;
	int i;

	for (i = 0; i < argc; i++) {
		char **j;
		j = argv[i];
		while (*j != '\0') {
			len++;
			if (*j > 32)
				ch++;
			if (*j > 64 && *j < 91)
				maiu++;
			else if (*j > 96 && *j < 123)
				minu++;
			j++;
		}
		printf("Numero de carateres de A%d: %d\n", ch);
		printf("Numero de maiusculas de A%d: %d\n", maiu);
		printf("Numero de minusculas de A%d: %d\n", minu);
		if (len > max_len) {
			max_len = len;
			max = argv[i];
		}
	}

	printf("Argumento mais longo: %s", *max);

	return 0;
}