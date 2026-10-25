# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.9.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.1/rpi-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "40f4d4ab45c1a119eaf14aeeb5b7c51c04e1a4ba19d08e5f8a235f00c9445805"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.1/rpi-v0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df886d2e800060202b8b724d9cf756b62801cd8bccedd726e2b3407d26eb0403"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.1/rpi-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d88cfcfc05d28553cafae3289a3593f476be3acf1085c8464f274e504c94893a"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
