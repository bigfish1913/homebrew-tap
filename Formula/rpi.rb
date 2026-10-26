# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.9.4. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.9.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.4/rpi-v0.9.4-aarch64-apple-darwin.tar.gz"
      sha256 "eb307dc7c6d2e7781498f7139d048428764c9aceecc47d0f6ea9400e67899e77"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.4/rpi-v0.9.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21ee44d5157f77eddb1b3d9893f421ddc19bf924ba0cb0a0fdc12224fe4bd945"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.4/rpi-v0.9.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dfd8ae50f58c5b92775433f26500b31c2b2f7607892c30099b599fb2d60dcc35"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
