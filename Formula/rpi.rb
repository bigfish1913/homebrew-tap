# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.8.4. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.8.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.4/rpi-v0.8.4-aarch64-apple-darwin.tar.gz"
      sha256 "4022c2b9f9dd2474a104c99c059a980cffd6673f91318cea852cb2ef36b42803"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.4/rpi-v0.8.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "227a94e15706e313a8d32e30965ae96f3d6d20336fa442319e68f46e7b187458"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.4/rpi-v0.8.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df94738743217c120e417d658485906930c5c6d50e64b9a9b9a1345500861357"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
