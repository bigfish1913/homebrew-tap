# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.13.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.13.0/rpi-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "f78722001d937579289a4b7839cd56599f49de1827925edba77bd6c0d03eb534"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.13.0/rpi-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a751577a8d99d616f0675d171200cdbe1fc572460c20d5e26ce2711ed6dcf6cd"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.13.0/rpi-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf3b9997b0ac24937abcfb79637b7001729c53f8090125093a20c8837b473672"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
