# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.21.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.21.0/rpi-v0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "96c0e92ccd7616c83fa610b3dc2eb201e61d3fdf03590a067f11f69146d46bcd"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.21.0/rpi-v0.21.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b4b2c67d1fa11406a82c2258a263fed5651a9981c4e04522fdd4780260993e3"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.21.0/rpi-v0.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "60cd16904ecdd8062cee432ce165c0057b621e1416e42790c6eae23b4c21240c"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
