# Generated from the published release's SHA256SUMS; do not substitute placeholder hashes.
class Cargoc < Formula
  desc "Cargo wrapper with managed intermediate caches and safe disk-pressure cleanup"
  homepage "https://github.com/bigfish1913/cargoc"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bigfish1913/cargoc/releases/download/v0.1.2/cargoc-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "55243fbd270cd63ee2d2787d72a4903d15418a39ef0666750033638596d5ea32"
    end
    on_intel do
      url "https://github.com/bigfish1913/cargoc/releases/download/v0.1.2/cargoc-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "7e66fb12d126d2f3838d80a3f8bd94438de514fdd19e5d43c988089fb82e955e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/bigfish1913/cargoc/releases/download/v0.1.2/cargoc-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b5ed76db9941b8386862aaa7626871b4a56c16cc0b9b98fbb48e6580c15eecc"
    end
    on_intel do
      url "https://github.com/bigfish1913/cargoc/releases/download/v0.1.2/cargoc-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42998fa980e40a08b21664c928261b03c1c2e41145a8e688a1223f95c335094a"
    end
  end

  def install
    bin.install "cargoc"
  end

  test do
    assert_match "cargoc 0.1.2", shell_output("#{bin}/cargoc --version")
  end
end
