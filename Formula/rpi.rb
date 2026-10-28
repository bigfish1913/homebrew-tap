# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.11.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.11.1/rpi-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "6a533a4216551e8594759db738b238b44d5f9cbc2d18c03a6ed571ffa65f5bc3"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.11.1/rpi-v0.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95dd0f43c57b3378ec0da3114d80363dd2374e296174aff79c6d9714c4bf2256"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.11.1/rpi-v0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b8d2306daf1962b23e1835154b0650b2897b045b0a8c20bec18d71e4561c84c"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
