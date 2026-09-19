class NovalisCli < Formula
  desc "Headless vault operations for novalis: notes, links, tags, boards"
  homepage "https://github.com/grundhofer/novalis"
  version "1.0.0-alpha.1"
  url "https://github.com/grundhofer/novalis/releases/download/v#{version}/novalis-cli-#{version}-arm64.tar.gz"
  sha256 "c229acb9de694fd061616650b17e54958a21f0d9fda74e4381e8fda8be6174e2"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "novalis"
  end

  test do
    assert_match "novalis", shell_output("#{bin}/novalis --help")
  end
end
