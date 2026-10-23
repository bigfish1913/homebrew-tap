# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.8.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.1/rpi-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "2151bf2051bfa8de541d4a4d55c8fd206490b89f1efaee99ed3ccc1755c9a2a6"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.1/rpi-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a10bb6c18a8816c0206357be75084d8d7c8816a09e39471dfbebcd6466fea54c"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.1/rpi-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d6ac2b04b6fc5b59ffe91d278ac00391512a76a0d1fd8159c865baee0d76cdb"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
