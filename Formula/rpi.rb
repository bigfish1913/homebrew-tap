# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.24.2. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.24.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.24.2/rpi-v0.24.2-aarch64-apple-darwin.tar.gz"
      sha256 "a0c2330049af5e1f31efbbf47c2c6cbfd3b1ab7729c2907ee6a2519147a4f89a"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.24.2/rpi-v0.24.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e76543343226e6f87f6716661949a26889ad050fa880e554bb1c4a60575b423a"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.24.2/rpi-v0.24.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7502d5c78c93a7c04983d18c7c4d20052815f23371de43bb27b379ce47783e25"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
