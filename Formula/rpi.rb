# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.17.2. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.17.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.17.2/rpi-v0.17.2-aarch64-apple-darwin.tar.gz"
      sha256 "03350730d87d8eb4a1aaecc01869c4727ce1229fe41739a89250e6ce3e5831bd"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.17.2/rpi-v0.17.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "20284175e3caab37635ce59160a11b2dceff39f522c9189efad30ab40c96c701"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.17.2/rpi-v0.17.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3eceba71027584e8b04466642f32d5885db6073f7698d8c60f5f98ef077cfac"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
