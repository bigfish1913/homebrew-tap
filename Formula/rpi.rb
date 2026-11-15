# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.24.1. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.24.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.24.1/rpi-v0.24.1-aarch64-apple-darwin.tar.gz"
      sha256 "b19085f8b93161547d7f93c19c590a74502c6601f1090f4eb4e5af84649d667b"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.24.1/rpi-v0.24.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "066b62f8474bcf7885a4c7c69260c27395b2847d52c87b6d9809c8b45b6e25ea"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.24.1/rpi-v0.24.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e49f6f8646eb434f882ea04208812443318a92333e9320ee3b74bbea89f46d89"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
