# Solana Upstream BPF 

Repo for testing misalignment + latest nightly with a common pattern in solana programs (Blake Hash)

## Prerequisites

You'll need sbpf-linker with upstream-gallery features so, follow the steps

```bash
# Install sbpf-linker
git clone https://github.com/blueshift-gg/sbpf-linker.git

cargo install-with-gallery 
```

## Building

Build your BPF program:

```bash
make build
```

The compiled program will be at:
```
target/bpfel-unknown-none/release/libyour_program_name.so
```

You'll also have a llvm IR files for debugging at:
```
llvm_dump/
```

## Testing

Run tests:

```bash
make test
```

You should see

```
running 1 test
[2026-02-17T14:48:29.241647000Z DEBUG solana_runtime::message_processor::stable_log] Program 8qbHbw2BbbTHBW1sbeqakYXVKRQM8Ne7pLK7m6CVfeR invoke [1]
[2026-02-17T14:48:29.242479000Z DEBUG solana_runtime::message_processor::stable_log] Program 8qbHbw2BbbTHBW1sbeqakYXVKRQM8Ne7pLK7m6CVfeR consumed 302 of 1400000 compute units
[2026-02-17T14:48:29.242530000Z DEBUG solana_runtime::message_processor::stable_log] Program 8qbHbw2BbbTHBW1sbeqakYXVKRQM8Ne7pLK7m6CVfeR success
test tests::hello_world ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.01s
```


## License

MIT
