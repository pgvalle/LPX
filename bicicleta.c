// T(i, j) = quantos treinos possiveis de i niveis em j minutos
// T(i, 1) = 1                        , M <= i <= N
// T(i, j) = 0                        , i < M ou i > N
// T(i, j) = T(i-1, j-1) + T(i+1, j-1), M <= i <= N

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

// types
#include <stdint.h>
// signed
#define i32 int32_t
#define i64 int64_t
// unsigned
#define u32 uint32_t
#define u64 uint64_t

i64 mem[1000002][2] = { 0 };
i32 t = 0, m = 0, n = 0;

int main() {
	int a;
	scanf("%d", &a);
	while (a--) {
		scanf("%d %d %d", &t, &m, &n);
    // T(i, 1) = 1, M <= i <= N
		for (int i = 1; i <= n - m + 1; i++) {
			mem[i][1] = 1;
		}

		for (int j = 2; j <= t; j++) {
			for (int i = 1; i <= n - m + 1; i++) {
				mem[i][j%2] = mem[i-1][(j-1)%2] + mem[i+1][(j-1)%2];
			}
		}

		i64 value = 0;
		for (int i = 1; i <= n - m + 1; i++) {
			value = (value + (mem[i][t%2] % 1000000007)) % 1000000007;
		}
				
		printf("%ld\n", value);
		// reset
		memset(mem, 0, sizeof(mem));
	}
	return 0;
}
