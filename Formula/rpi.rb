# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.21.2. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.21.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.21.2/rpi-v0.21.2-aarch64-apple-darwin.tar.gz"
      sha256 "90000eefc3963707c83008ac177803be742da99722ddb66e106d9cc1f87c0f03"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.21.2/rpi-v0.21.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c05cceff56cefff43c66c9e42c4443fbdaa07988788f71796d07ce640545383e"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.21.2/rpi-v0.21.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4477ded68eb49f069d2ec4e197371812d33cafbc7985a3531c4d3cd09ace657"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
