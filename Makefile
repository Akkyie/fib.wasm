.PHONY: all
all: fib.wasm fib_stack.wasm fib_heap.wasm fib_start.wasm

.PHONY: clean
clean:
	rm ./*.wasm

fib_start.wasm: fib_start.c
	clang $< -o $@ -s -O3 --target=wasm32-unknown-unknown-wasm -nostartfiles -nostdlib -fvisibility=hidden -Wl,--allow-undefined

%.wasm: %.c
	clang $< -o $@ -s -O3 --target=wasm32-unknown-unknown-wasm -nostartfiles -nostdlib -fvisibility=hidden -Wl,--no-entry
