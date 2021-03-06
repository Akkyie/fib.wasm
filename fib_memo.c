#define WASM_EXPORT __attribute__((visibility("default")))

WASM_EXPORT int fib(int n)
{
  if (n <= 1)
  {
    return 1;
  }

  int memo[n];
  memo[0] = memo[1] = 1;
  for (int i = 2; i < n; i++)
  {
    memo[i] = memo[i - 1] + memo[i - 2];
  }

  return memo[n];
}
