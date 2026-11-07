# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.21.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.21.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.21.1/rpi-v0.21.1-aarch64-apple-darwin.tar.gz"
      sha256 "95be0ae582d2558c08d19aa3f98a9a4100d5325edbaa5086a2df32a808bb3514"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.21.1/rpi-v0.21.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "725c6dbb999b231247459b0412497e29e03090f3737964a9e1306f72a2f362c9"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.21.1/rpi-v0.21.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69c061dd9a0cb036237b027c63953690cb09f913fa51ba22860795ac6c369542"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
