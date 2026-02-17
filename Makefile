.PHONY: build
build:
	cargo +nightly build-bpf

.PHONY: clean
clean:
	cargo clean

.PHONY: clippy
clippy:
	cargo clippy

.PHONY: format
format:
	cargo +nightly fmt
	
.PHONY: test
test:
	cargo test	
%:
	@: