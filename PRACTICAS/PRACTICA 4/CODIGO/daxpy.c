#include <stdio.h>
#include <time.h>
#include <stdlib.h>

void daxpy(double *y, double *x, double a, unsigned n, struct timespec *cgt1, struct timespec *cgt2){
	clock_gettime(CLOCK_REALTIME, cgt1);
	
	for(unsigned i=0; i<n; ++i)
		y[i] += a*x[i];
	
	clock_gettime(CLOCK_REALTIME, cgt2);
}
int main(int argc, char **argv){
	if(argc < 3){
		fprintf(stderr, "ERROR: falta tamaño del vector y/o constante\n");
		exit(1);
	}
	unsigned n = strtol(argv[1], NULL, 10);
	double a = strtol(argv[2], NULL, 10);
	double *y, *x;
	y = (double*) malloc(n*sizeof(double));
	x = (double*) malloc(n*sizeof(double));

	for(unsigned i = 0; i < n; ++i){
		y[i] = i+2;
		x[i] = i*2;
	}
	struct timespec cgt1, cgt2;
	double ncgt;
	daxpy(y,x,a,n, &cgt1, &cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("y[0] = %11.9f, y[%i] = %11.9f\n", y[0], n-1, y[n-1]);
	printf("\nTiempo (seg.) = %11.9f\n", ncgt);
	
	free(y);
	free(x);
}
