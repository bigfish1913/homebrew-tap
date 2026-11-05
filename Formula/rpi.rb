# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.19.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.19.0/rpi-v0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "9ff727d50b2b664683a125aed5e49cade9c84fd6eb2665cec3aa3f65c23786e4"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.19.0/rpi-v0.19.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f1d2264ca3bd864b4498dacf052e0ec26d90eb1101464025d249e1d3b3d255a"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.19.0/rpi-v0.19.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85363df1ab52cbcedc5bfd92db5d8cbeec609d5445bd4ac9680bb82c7b0fc8ca"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
