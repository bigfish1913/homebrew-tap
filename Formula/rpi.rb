# Homebrew formula for rpi.
#
# Not in homebrew-core: that requires notability (stars/forks) rpi does not have
# yet. It works today from a tap — publish this file as `Formula/rpi.rb` in a
# repo named `homebrew-tap` under the same owner, then:
#
#   brew tap bigfish1913/tap
#   brew install rpi
#
# Hashes below are for v0.8.2. See packaging/README.md for the refresh procedure.
class Rpi < Formula
  desc "Rust-native, library-first coding-agent runtime and terminal CLI"
  homepage "https://rpi.laofu.online/"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.2/rpi-v0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "61ba65c5b966e6eb2f771cbccd433e617a755f0943f893e6847fe2a4ed978232"
    end
    # Intel macOS prebuilt binaries are installed via scripts/install.sh.
    # This formula currently covers Apple silicon on macOS.
  end

  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.2/rpi-v0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06deab14a4236ee56cc190ca98352358fe54cf29d841fa57bfc882711bf0001d"
    end
    on_intel do
      url "https://github.com/bigfish1913/pi-rust/releases/download/v0.8.2/rpi-v0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a584464f4b73fc6143af3283d4ffc108bd863bdd5b0f261113055c57057eecf"
    end
  end

  def install
    bin.install "rpi"
  end

  test do
    assert_match "rpi", shell_output("#{bin}/rpi --version")
  end
end
