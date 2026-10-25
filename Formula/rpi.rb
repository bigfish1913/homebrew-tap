# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.9.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.0/rpi-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "02b3e68c0ee3b38c0dd8bd30a76f3099443295a2dc9e7dc81792c528408fb9d2"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.0/rpi-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f67d5b9198f025d9cc34fdd3bbbde0962a68db6240532c32e2d86dd207c9217"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.0/rpi-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "472652f23fe22ce8f2d67b58e88f04b9419ea925fb9384423147f491e4b2ce0e"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
