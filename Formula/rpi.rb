# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.7.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.7.1/rpi-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "57adb8f76832122bc5fc169a7296f0e53585d3d0ecb4d239c99675565d4609f5"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.7.1/rpi-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da386bb200cb58291f277e2ddf1fb38b4ba84df054a37fb5ccec20fd267e7639"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.7.1/rpi-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e17109c5d64d63908ee3276f76d52c2bb4c2ea27e04fa6188569e50582fea0b"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
