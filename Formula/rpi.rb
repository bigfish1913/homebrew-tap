# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.6.2. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.2/rpi-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "a37725ca08ab8e2fab51feede0e609f1707fb2c95b518c7d92a958a5a78430ad"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.2/rpi-v0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "520fe40860d658af677384e98e37e84bce5eb4221ac540e0e056950f5302d7d4"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.6.2/rpi-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b064e94a6aa0f790b65fc0472aecf0e041564dbc348098069302046d7a2fc32"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
