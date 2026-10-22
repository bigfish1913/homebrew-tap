# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.8.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.0/rpi-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "98d04ec429bbbae244e9e5fea43adc744bef7912367453e7b0de15e355130736"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.0/rpi-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f349c6b021907f477d5fd5f710b865f6db1680b54ff9b90bb31f633ac5c5a8a9"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.0/rpi-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e62ae4d79228f46826fe39e41ff701490e07fe4b6ff04147c51def65fd316225"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
