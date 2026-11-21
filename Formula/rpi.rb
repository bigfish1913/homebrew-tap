# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.27.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.27.0/rpi-v0.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "916edce9f20499e43041b5d8280993fa5d44bfe10a011a303c414aa817383ff5"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.27.0/rpi-v0.27.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "84474cab890368a8bec63a3935e72c78b87d871a76308d9289b2f93868f73017"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.27.0/rpi-v0.27.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f825bdf3489d26648b1a46c876204ac6992d0e620fb5fe74bd57fd71ad8f192"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
