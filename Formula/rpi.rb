# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.10.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.10.0/rpi-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "c705202a1a8ea7661fc6d59a6a9d5d6381388651588634572dcc8591f015d001"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.10.0/rpi-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ed93d3ee26022793db9f5d930bfc0946d987ded828736ed2faa0c8a5cd63f57"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.10.0/rpi-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77db23c5f2ae40d805ac96a65aa75d84ba10051ccfbeac8cca053b63ec374dd7"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
