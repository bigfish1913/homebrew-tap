# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.26.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.26.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.26.1/rpi-v0.26.1-aarch64-apple-darwin.tar.gz"
      sha256 "2bfa7c3043dc731de5c4fb03f2ef726013f39f3e4d56c84cb6f166d87dcf53ca"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.26.1/rpi-v0.26.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "979ec0324a05fedc3ad36a8aa4e15afa36f1883aa0f04e312313201e4b60b7a4"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.26.1/rpi-v0.26.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8177b483ba3452b9677e8ab88548a6b2186a7539b9f1c5b3eacd4a09a3daf4ae"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
