# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.8.3. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.3/rpi-v0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "d916c269fbfbcc539b1b2c8ca6329c60ef0b8eed1bb5a1b69d73f32268c16e9b"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.3/rpi-v0.8.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "edca2ccb15b050b6148ffe57e91a28fb20636087180c07b113a918b753b2d61a"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.3/rpi-v0.8.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d69bf412e3139b011b667cb65bb752addafa917d909b8e85daaea0ff400c5667"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
