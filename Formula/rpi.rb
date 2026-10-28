# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.12.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.12.0/rpi-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "1fdc2b98b6db1651e4396d1d6d8559dbaa19a861c88564c993b26fd558bdd081"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.12.0/rpi-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8fb531c46d280acd61e4a58e824f1e0e9d996b4535838d7df812c89da9fec2a"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.12.0/rpi-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e091b849d678e961c95abc924fec68ad6079a658eb54ca33b6fdcd2e9aa09229"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
