# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.6.3. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.3/rpi-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "eb1cad4659d2da2a05cad760a037d7253b4f136ca4e3977af3ac829d8bdc9cda"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.3/rpi-v0.6.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "574082be0b43fac5de5ddb124324e1144a523449fad4ffcc509b276c861db7db"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.3/rpi-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ae70bb36b906c7efc23027f3702c38e01af7db3d4843af4f0c32cdd6b0844bb"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
