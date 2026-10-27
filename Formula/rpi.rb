# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.9.6. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.9.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.6/rpi-v0.9.6-aarch64-apple-darwin.tar.gz"
      sha256 "da4730c830a34fa5a4a123cf2ccdaa695eaed5778f9b7a9c97d1a6bfd2202b27"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.6/rpi-v0.9.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df41595920c7cc799854fb9657c4e436fe542ab9cb124527b77f73270096e4a5"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.6/rpi-v0.9.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e10f978aeea7a49b40804678ebce26ed4336649dc53e505c1695fdaed057459"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
