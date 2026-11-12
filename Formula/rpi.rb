# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.22.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.22.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.22.1/rpi-v0.22.1-aarch64-apple-darwin.tar.gz"
      sha256 "6ccc7ca18d06ca8325242cdefd7c3ef76d2810510dda5e2d5806e32785ebf797"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.22.1/rpi-v0.22.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e6384f65c2efcbf392290e5af610cff1a36da8b51e9352e4d65bb6f62b5bac3"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.22.1/rpi-v0.22.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdc9239cf090d6a9208b2b8fb70bf58f754965b5d66336a26017b8ea06c70d5c"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
