class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler: AI-native CLI"
  homepage "https://github.com/pavlovtech/WebReaper"
  version "11.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.1/webreaper-v11.1.1-osx-arm64.zip"
      sha256 "af2a86715e48fc7e836c436166701928c55e3bb876793b3264484b9da2de2a07"
    end
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.1/webreaper-v11.1.1-osx-x64.zip"
      sha256 "46d345f427dd8240d3dc1410fcb9e156b1bcc77247ff477c5cfbbd875ccaba20"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.1/webreaper-v11.1.1-linux-x64.tar.gz"
      sha256 "8238a9c54bca890f424400f518ad0fc36af06257c724b04618b5b015ce2e920a"
    end
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.1/webreaper-v11.1.1-linux-arm64.tar.gz"
      sha256 "ac34b6ed6608c19e0f3a0eb3a170b059f47c1607222a8a66472b489c58b66b2e"
    end
  end

  def install
    bin.install "webreaper"
    # The archive ships LICENSE.txt + README.md alongside the binary;
    # `bin.install "webreaper"` ignores them, which is the desired shape.
    # Homebrew's auto-generated caveats include `webreaper help`.
  end

  test do
    # Smoke test: the binary must run and print a version string.
    # ADR-0024: version is tag-derived; matches the formula's `version`.
    assert_match version.to_s, shell_output("#{bin}/webreaper version")
  end
end
