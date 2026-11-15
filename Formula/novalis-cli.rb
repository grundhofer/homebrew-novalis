class NovalisCli < Formula
  desc "Headless vault operations for novalis: notes, links, tags, boards"
  homepage "https://github.com/grundhofer/novalis"
  url "https://github.com/grundhofer/novalis/releases/download/v1.4.1/novalis-cli-1.4.1-arm64.tar.gz"
  sha256 "457c70997050ec070aa750055f22c71d2a7fe03ca6e8fe18854f707e8073d328"
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
