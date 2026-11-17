# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.25.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.25.0/rpi-v0.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "6ddcb124e6b00fc4957bca68a8a47cd43ce8eecdc0100c160619395f38adeeff"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.25.0/rpi-v0.25.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2098cb6d7658fcd7f96b413ef39994e13c04626a5b0cf63b12ef8f6781c4d644"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.25.0/rpi-v0.25.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a387c57af04a6834d951ee823c73d8293f53e651c0c3adb113a9356532535786"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
