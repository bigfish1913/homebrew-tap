# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.7.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.7.0/rpi-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "c91d9cfedb7ed3768e44910401fb177d332281a7e0a5673d5b153291f3c22e6d"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.7.0/rpi-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9fb8d78cf2ff9300314a0a55a0860dfb1dadd74358b5509ffa2bd2e44e7f90cc"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.7.0/rpi-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9bf31e82012833b5e9881f7bfb8f7231f538b7d963c88d853875f9c43e05d62e"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
