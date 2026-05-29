class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler: AI-native CLI"
  homepage "https://github.com/pavlovtech/WebReaper"
  version "10.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.2.0/webreaper-v10.2.0-osx-arm64.zip"
      sha256 "b8cb4909e486e52ba00106fda390383a35a9d66ce48997b06f323525925c94bc"
    end
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.2.0/webreaper-v10.2.0-osx-x64.zip"
      sha256 "86ff50b1891325d02ea002867d241da375715afd50ead70c79efb66da26780c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.2.0/webreaper-v10.2.0-linux-x64.tar.gz"
      sha256 "4adaeaad03116a5c265d717b4b0441c72197eed55a4d216ff2a7c3613bcc3780"
    end
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.2.0/webreaper-v10.2.0-linux-arm64.tar.gz"
      sha256 "13931360396fc64a3f309efd54cae25cfef3e64afd244f905917b4a343012839"
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
