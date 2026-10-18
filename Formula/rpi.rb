# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.6.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.0/rpi-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "a34075542fd252cf20f88ec72247b870e5477b72117c4537713c9a471f2e7b3c"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.0/rpi-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "351fcadd068fe297ccc193646ca684ba7393031aa33703ebaeda03f76d0b24e8"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.0/rpi-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "13358b548795ef42a771f2027890a57092991d3054b81434889fe1e16220c6ec"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
