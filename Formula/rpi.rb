# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.26.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.26.0/rpi-v0.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "c08e76d36d75a92ebca485404594469af092cd4b2f4392ce8ccec34b20d9a1fc"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.26.0/rpi-v0.26.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2bb009ea0e06839b3b54043891f496765d0cc34c15f704eea79601fc51b05b2"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.26.0/rpi-v0.26.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddddb058cda69bb2a450551f405579e86b4d2384ee22d86cb73b8945ad06ee25"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
