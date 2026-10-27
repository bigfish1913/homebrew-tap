# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.10.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.10.1/rpi-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "f83ed81f2324f241ae6fe007206155eea00ed5fec7ca403169e1f0fbb7dd6b5e"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.10.1/rpi-v0.10.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "929b51e293990e7f789dfa63137b84cbc0b13e37ad7bfe2e0e555c73acd22967"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.10.1/rpi-v0.10.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3d802c50f347a13271c6e42ec9af9d0de2d1da7ea1bbad0b84ddb76cf7efba3"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
