.PHONY: all
all: fib.wasm fib_memo.wasm

.PHONY: clean
clean:
	rm ./*.wasm

%.wasm: %.c
	clang $< -o $@ -O3 --target=wasm32-unknown-unknown-wasm -nostartfiles -nostdlib -fvisibility=hidden -Wl,--no-entry
