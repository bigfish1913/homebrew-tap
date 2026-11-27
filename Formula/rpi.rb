# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.30.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.30.0/rpi-v0.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "0f6a435f2964d39e2e8b9e58ac48d287e000cbbcaa7ae87320364db5b010ed2e"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.30.0/rpi-v0.30.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdeed680ac75e47c6074145b3c60da9843338a2f765d2f9f98bdd36ccbaa4769"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.30.0/rpi-v0.30.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e623c98c9fe6e222df84809f65e20cb234de8cd9d79c372410d685635717a6d1"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
