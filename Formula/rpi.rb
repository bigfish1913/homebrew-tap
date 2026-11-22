# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.27.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.27.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.27.1/rpi-v0.27.1-aarch64-apple-darwin.tar.gz"
      sha256 "634cf38987b1c7445aa8516ecb7d3792637eadfb738d7b53b44157284de1ed43"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.27.1/rpi-v0.27.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8624eb572d7d0c1d40c1397ea1b69928cdfe213c305e47ea18dbb06094360d44"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.27.1/rpi-v0.27.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d032033c879d78013a73333b668bcd72724aaf216fb17987d1429f0a9a48c77"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
