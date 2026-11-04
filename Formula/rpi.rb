# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.17.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.17.0/rpi-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "e849456f32ae55cc9c898ca00ce75b8816e700799a848de50f83478f7103e544"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.17.0/rpi-v0.17.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34c3f4e81dfac0939784a11f0cdf17571d4c1a2dc3f7ef0092f73459ec0d0366"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.17.0/rpi-v0.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d20dd1f1f29e4d958e52800546b3de7baaa2778aa99e6747be21cb1a5066eac"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
