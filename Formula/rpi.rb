# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.23.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.23.0/rpi-v0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "aeb399025ac2e35e4510859a388c59358d8328820de3c8f7836499ab7344b89e"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.23.0/rpi-v0.23.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ac39a574831f2457cee7251daea40cf2d8649d7e71186370bea360d09160646"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.23.0/rpi-v0.23.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "01a06918cca4e7aa8b161efc6ac74a2069cf88ebd13863575cf71f6cfed2a73d"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
