# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.24.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.24.0/rpi-v0.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "b38a059664805d669c0e5e080d3a457e31e6bf7082e207eed656babbc5570d0a"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.24.0/rpi-v0.24.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a92cebf2022adc1e1810ced92e3f7a3e5abcdacabc093d2fc7b6dffb3e5cd74"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.24.0/rpi-v0.24.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61811d77796886a570e2c81ab1334eebf63d03bf0e786318d63715cf16e9490f"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
