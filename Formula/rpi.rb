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
      sha256 "646c8c118751c358a1fb15ac01aa71f4d3d8ba69597de36d599fcb6c0475cfc0"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.27.1/rpi-v0.27.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62772676f61345d77006d9c5a56ad791b70a0e4232e56ca78671e6af2eba98f8"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.27.1/rpi-v0.27.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb0b426445838cce16c38da83b51dc20d8624f1f2d79735ee8aecb8d573432ca"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
