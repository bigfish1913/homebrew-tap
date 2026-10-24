# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.8.5. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.8.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.5/rpi-v0.8.5-aarch64-apple-darwin.tar.gz"
      sha256 "4305e8222ad5f41c96593bccff04174e8363c2c85181a611588b21d4c688b729"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.5/rpi-v0.8.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4098bda9ea43982704c8c73d7da186b06c4a0d35759b0c48cf6d0b8c740fead3"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.5/rpi-v0.8.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88ecd843e1128fce690b3e215a1733c44f09c2c93c56554eb3d280a7b6641508"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
