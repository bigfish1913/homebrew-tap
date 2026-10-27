# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.11.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.11.0/rpi-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "ef9eb7ab9a0c754e8cc4c45ef65a1c47e3403b363eee6b40ebbd987df5955862"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.11.0/rpi-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd7d796052fc2782263bbdf8cc4284ebac6b8aebfda12a4cb414474a0aadcac9"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.11.0/rpi-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "761e4c0ba442037e62ad4ca912f0dc0b94fcd7f031849a6b01d63297f5a0c586"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
