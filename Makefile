.PHONY: all
all: fib.ll fib.s fib.wast fib.wasm

.PHONY: clean
clean:
	rm fib.ll fib.s fib.wast fib.wasm

fib.ll: fib.c
	xcrun clang --target=wasm64 -emit-llvm -S -O0 fib.c -o fib.ll

fib.s: fib.ll
	llc --march=wasm32 fib.ll -o fib.s

fib.wast: fib.s
	s2wasm -s 65536 fib.s -o fib.wast

fib.wasm: fib.wast
	wasm-as fib.wast -o fib.wasm
