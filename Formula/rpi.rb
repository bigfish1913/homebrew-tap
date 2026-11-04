# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.17.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.17.1/rpi-v0.17.1-aarch64-apple-darwin.tar.gz"
      sha256 "eee47e43fea30cfab3284b7972413f08a4552924d85248f820dbf915bc7a6e5f"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.17.1/rpi-v0.17.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85e2790e4a28fcfdf4604d333bb39c153172bee5f455b5c873b5a061fcc99a88"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.17.1/rpi-v0.17.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca4ecf4c754f42cfed297d98fc069e77053caf9bcb862d9711fea514b3bed92b"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
