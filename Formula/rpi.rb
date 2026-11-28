# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.32.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.32.0/rpi-v0.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "7e5d687c5f5306e85e95098b72d39c676c0120a4a21d38a3aa261fc54de66d02"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.32.0/rpi-v0.32.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fb5d58a2ff60aeae0a6a7af4908163c08bce171b9c2fe97eaab9961fd13c841"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.32.0/rpi-v0.32.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea0d1052afa5ebeeda8c99dad16fc2705b62b30c2b39dfb157ccced202f96dea"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
