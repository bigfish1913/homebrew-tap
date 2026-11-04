# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.18.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.18.0/rpi-v0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "182d6539814ad37eb4be2df36a90bed32e009043b35429e4d0e6a2f462251972"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.18.0/rpi-v0.18.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d906c46cdbd5a0d6f5da97d4035ff08612ba8d24fbcfc55c346d014bca3f94f"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.18.0/rpi-v0.18.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05651feb5785445d5739ff06347026d3271f71d0e99026570f0c230dc1622f1c"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
