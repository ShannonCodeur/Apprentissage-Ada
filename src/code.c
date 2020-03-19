#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define MAX 100

/* run this program using the console pauser or add your own getch, system("pause") or input loop */


int main(int argc, char *argv[]) {
	FILE* fichier;
	fichier = fopen("E:\\a.txt", "r");
	time_t t = time(NULL);
	char buf[MAX];
	fgets(buf, MAX, fichier);
	printf("String is: %s\n", buf);
	struct tm tm = *localtime(&t);
	printf("\n Now: %d-%02d-%02d %02d:%02d\n", tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
	menuPrincipal();
	switch(choice){

	}
	return 0;
}
