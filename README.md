# rpi tap

Homebrew formulae for [rpi](https://github.com/bigfish1913/pi-rust), a
Rust-native, library-first coding-agent runtime and terminal CLI.

```bash
brew tap bigfish1913/tap
brew install rpi
rpi --version
```

`rpi` ships a prebuilt binary for aarch64 macOS and for x86_64/aarch64 Linux.
There is no x86_64 macOS build, so Intel Macs should use `cargo install rpi-cli`.

This tap exists because [homebrew-core](https://github.com/Homebrew/homebrew-core)
requires notability (stars/forks) the project does not have yet.
