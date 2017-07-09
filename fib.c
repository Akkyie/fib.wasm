int fib(int n) {
  if (n <= 1) { return 1; }
  return fib(n - 1) + fib(n - 2);
}

int fib_memo(int n) {
  if (n <= 1) { return 1; }

  int memo[n];
  memo[0] = memo[1] = 1;
  for (int i = 2; i < n; i++) {
    memo[i] = memo[i - 1] + memo[i - 2];
  }

  return memo[n];
}
