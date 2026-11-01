# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.16.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.16.0/rpi-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "171604fc693720ec81d5ee3645b3e4774bc600fc3cf69ac9f2a74750fd09dcae"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.16.0/rpi-v0.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ff25bd7761e00247181a39d0eb6fecf4958963ccc047ac28d647d1829801a0e"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.16.0/rpi-v0.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b82fc20d38fc598029ddbdfba5eeb0bdb15880254b7f048a724b2b3e17ec844"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
