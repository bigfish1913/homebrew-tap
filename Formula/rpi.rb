# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.6.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.1/rpi-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "068e1d2d323ba8a5a5f6f4331cc1c90826175a65227b5dac1c2c7c4f3516fbdf"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.1/rpi-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "40c5085c5cfddf1ab309c12e09859d8b914f90f8c35812aceaf4a309fd1ffb3a"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.1/rpi-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba0436e3a3d9e406092d73b2bdca8427fd6913bbad0fbd8326674a6d47dc11b1"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
