class NovalisCli < Formula
  desc "Headless vault operations for novalis: notes, links, tags, boards"
  homepage "https://github.com/grundhofer/novalis"
  url "https://github.com/grundhofer/novalis/releases/download/v1.3.0/novalis-cli-1.3.0-arm64.tar.gz"
  sha256 "5295edd6c652ed819b806bfac25c5efa4366d30775ba1b8a92f7e8a444be53db"
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
