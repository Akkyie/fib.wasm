#define WASM_EXPORT __attribute__((visibility("default")))

extern void print(int i);

int fib(int n) {
  if (n <= 1) return 1;
  return fib(n - 1) + fib(n - 2);
}

// WASM_EXPORT
void _start() {
  int r = fib(10);
  print(r);
}

