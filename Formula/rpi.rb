# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.14.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.14.0/rpi-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "204add12633336760bc7d3c7859aabfa80355b042b8ca9c02dd9a0ef2ec0d7b2"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.14.0/rpi-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe129676eab7e6b0c01b090d4e7a92a6ba48942af0e039dc8230663589c76ac4"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.14.0/rpi-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c0bfc4919fa5ff3ca385a2a0a23e8d006dbb4c1b8dc07901f00821f9d07b1b9"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
