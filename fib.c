#define WASM_EXPORT __attribute__((visibility("default")))

WASM_EXPORT
int fib(int n)
{
  if (n <= 1)
  {
    return 1;
  }
  return fib(n - 1) + fib(n - 2);
}

WASM_EXPORT
int _start() {
  return fib(10);
}

