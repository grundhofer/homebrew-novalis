class NovalisCli < Formula
  desc "Headless vault operations for novalis: notes, links, tags, boards"
  homepage "https://github.com/grundhofer/novalis"
  url "https://github.com/grundhofer/novalis/releases/download/v1.0.0-alpha.1/novalis-cli-1.0.0-alpha.1-arm64.tar.gz"
  sha256 "c2ee912d6457da22a88c8583789203b98b939f29e71a455f6ac415a028a5b8ec"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+(?:-[a-z]+\.\d+)?)$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        match[1] if match
      end
    end
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
