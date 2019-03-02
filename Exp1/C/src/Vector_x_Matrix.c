#include <stdio.h>
#include <time.h>

#define N 4096

void v_x_m(int v[N], int m[N][N]) {
	int c[N] = { 0 };
	for (int j = 0; j < N; j++) {
		for (int i = 0; i < N; i++) {
			c[i] += v[j] * m[i][j];
		}
	}
}

int vct[N] = { 0 }, mtx[N][N] = { 0 };

int main() {
	freopen("vector.data", "r", stdin);
	for (int i = 0; i < N; i++) {
		scanf("%d", &vct[i]);
	}
	fclose(stdin);

	freopen("matrix.data", "r", stdin);
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			scanf("%d", &mtx[i][j]);
		}
	}
	fclose(stdin);
	
	
	struct timespec time_start = { 0, 0 }, time_end = { 0, 0 };
	clock_gettime(CLOCK_REALTIME, &time_start);
	v_x_m(vct, mtx);
	clock_gettime(CLOCK_REALTIME, &time_end);
	long long int roundtime = (time_end.tv_sec - time_start.tv_sec) * 1000000000 + time_end.tv_nsec - time_start.tv_nsec;

	double t = roundtime / 1000000.0;
	printf("C time %.2f ms\n", t);

	return 0;
}
