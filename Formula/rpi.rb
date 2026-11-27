# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.31.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.31.0/rpi-v0.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "babc5e42033694940083d69eb6e2edd5e7e333303631da50d4a8ea273ef053c2"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.31.0/rpi-v0.31.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f70241243e3570894668e004451b7077849f8ccc0130349f285a7bb8cada6e6"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.31.0/rpi-v0.31.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b82df1fa82fb80908ad5d6b3b1e6a09bfd614975a62b1da903d08776e1d10adc"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
