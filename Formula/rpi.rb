# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.9.3. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.9.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.3/rpi-v0.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "1e987ae0bedb83136fec592ec45b9f183b6808816a900f7a9b27a32e199d08ca"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.3/rpi-v0.9.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b68265818e03676e85825e7f808706909fb80a7c1e71704fe476434ab51895e9"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.9.3/rpi-v0.9.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f3d57c6eb58d827fe9ef9f0efca75b6ef46031265005ace594bf57919cb0484"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
