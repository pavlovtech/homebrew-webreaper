class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler — AI-native CLI"
  homepage "https://github.com/pavlovtech/WebReaper"
  version "10.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.0.0/webreaper-v10.0.0-osx-arm64.zip"
      sha256 "c34c5b22ed2197a649633b02c9d62628ae4ed5cc53cef0d2321f69c2cbdb9c8f"
    end
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.0.0/webreaper-v10.0.0-osx-x64.zip"
      sha256 "b78bb5d489719b6cf696ef28a1965130b71b4ca41c4a5e6b510f6c56e0bfef23"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.0.0/webreaper-v10.0.0-linux-x64.tar.gz"
      sha256 "fc13b078abbc5db41483ccce5bafc67d0ce9c5bcf5ff4f9d99f9d1106c81b73e"
    end
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.0.0/webreaper-v10.0.0-linux-arm64.tar.gz"
      sha256 "4b20e649395ac6a9a90e208512ee0bff76ff6f6f726404c11077ee0ca536d9d1"
    end
  end

  def install
    bin.install "webreaper"
    # The archive ships LICENSE.txt + README.md alongside the binary —
    # `bin.install "webreaper"` ignores them, which is the desired shape.
    # Homebrew's auto-generated caveats include `webreaper help`.
  end

  test do
    # Smoke test — the binary must run and print a version string.
    # ADR-0024: version is tag-derived; matches the formula's `version`.
    assert_match version.to_s, shell_output("#{bin}/webreaper version")
  end
end
