#![cfg_attr(target_arch = "bpf", no_std, no_builtins)]

#[cfg(target_arch = "bpf")]
#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    unsafe { core::hint::unreachable_unchecked() }
}

pub struct Blake3Hash([u8; 32]);

#[unsafe(no_mangle)]
pub fn entrypoint(input: *mut u8) -> u64 {
    let pubkey: Blake3Hash = unsafe { Blake3Hash(*(input.add(16) as *const [u8; 32])) };
    if pubkey.0.ne(&Blake3Hash([3u8; 32]).0) {
        return 1
    }
    0
}

#[cfg(test)]
mod tests {
    use mollusk_svm::{Mollusk, result::Check};
    use solana_instruction::Instruction;

    #[test]
    pub fn hello_world() {
        let mollusk = Mollusk::new(&[2u8;32].into(), "target/bpfel-unknown-none/release/libblake_upstream");
        mollusk.process_and_validate_instruction(&Instruction {
            program_id: [2u8;32].into(),
            accounts: vec![],
            data: [3u8; 32].into(),
        }, &vec![], &[
            Check::success()
        ]);
    }
}