# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.15.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.15.0/rpi-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "438bf07ad6d27cd00f41e9a1586c9b6fe3e0d6698e7abd93a0a85ae1ab9a124d"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.15.0/rpi-v0.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59b21b680bb677f51d308080d8ee0688d0c2f3b2936ce061d3bbfd70a9c4a178"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.15.0/rpi-v0.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5762028e9e3a91229e4440c0dfd1260da55a9c4c35ce1b880f521fcc22386ebf"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
