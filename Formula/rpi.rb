# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.20.0. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.20.0/rpi-v0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "6f7fdd9fb1d1c58ec2ed316e55b3a425834bd48437abe70994cb4e047bdc39d6"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.20.0/rpi-v0.20.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "574ce4677a2280f2505bdf5389de524e025f9e870e9afb4fbe11f5d9261ed93f"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.20.0/rpi-v0.20.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17f9963600672d4b608effdca1ad7145c642a9f3d8396184502d763a258d63b8"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
