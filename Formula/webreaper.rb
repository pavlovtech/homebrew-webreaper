class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler: AI-native CLI"
  homepage "https://github.com/pavlovtech/WebReaper"
  version "10.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.1.0/webreaper-v10.1.0-osx-arm64.zip"
      sha256 "d36425b17baf752a221f360783dbdc88c36c393ac7de90bf3e591398306d7215"
    end
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.1.0/webreaper-v10.1.0-osx-x64.zip"
      sha256 "c733f2548f96a4f0c02bf45f06d12656fafa6908ba1c821c5344201c5bb8a458"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.1.0/webreaper-v10.1.0-linux-x64.tar.gz"
      sha256 "d0b66e590670269962b674b377b5674eb48a0b29f8297f508f4dbe2d06df7374"
    end
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v10.1.0/webreaper-v10.1.0-linux-arm64.tar.gz"
      sha256 "8e7bb830d5ff941f673d9f9b51cab67fb78abc3f8bdee0e8c8c87bd604dfe6fa"
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
