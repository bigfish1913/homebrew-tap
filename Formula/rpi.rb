# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.29.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.29.0/rpi-v0.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "9061b0351390771acdc361ab5d6d6330f7a3540ecde315f4dfdff8a989de410b"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.29.0/rpi-v0.29.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "143ef7ef33884e99bce4b3cd7939dc340f216b47de45a18136f168e293e3bd38"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.29.0/rpi-v0.29.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd0bfef85b1abd52e2f3b83718d0c854af150c24b31c364d7c9295f8e40d2865"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
