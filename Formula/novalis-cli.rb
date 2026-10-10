class NovalisCli < Formula
  desc "Headless vault operations for novalis: notes, links, tags, boards"
  homepage "https://github.com/grundhofer/novalis"
  url "https://github.com/grundhofer/novalis/releases/download/v1.0.0/novalis-cli-1.0.0-arm64.tar.gz"
  sha256 "a4c0ef15d702c1a8b022a4c1ebfd4e24c6db0d3df331be488eaf5e07fec4fd79"
  license "AGPL-3.0-only"

  # Stable releases only: GitHub's latest release is never a pre-release.
  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "novalis"
    # The agent skill (`novalis skill --path`), from 1.0.0-alpha.2 on.
    share.install "share/novalis"
  end

  test do
    assert_match "novalis", shell_output("#{bin}/novalis --help")
    assert_path_exists share/"novalis/skill/SKILL.md"
  end
end
