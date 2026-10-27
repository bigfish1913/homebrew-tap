# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.9.5. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.9.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.5/rpi-v0.9.5-aarch64-apple-darwin.tar.gz"
      sha256 "794f9147140df8a8c3a5dc4d41d05a1d9433de39f572ecd63b20e751f156b8de"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.5/rpi-v0.9.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4360dc054909465a0daf2430c302e3167faabcf1bb7437369ced6ed5445a2af6"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.5/rpi-v0.9.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bf1f77a1243bb7ea0f581feabed0f0274f0bf9828fb53a01b49a2d0c076c771"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
