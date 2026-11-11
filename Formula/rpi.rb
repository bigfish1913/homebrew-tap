# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.22.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.22.0/rpi-v0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "4cc11f9b4f044076926462f54fc8ab5bbbe016c0771fa1d3959e5b5fff3b8233"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.22.0/rpi-v0.22.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "545d2d87b3d6b197bc1b2acc03f2584af5730b0f03a2151c473f22f87363f887"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.22.0/rpi-v0.22.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3051f7b767e3ac4a6e37a8a2ea9b48a47130c9e47d1bb9b8744a1a7994acd138"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
