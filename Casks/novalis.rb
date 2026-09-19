cask "novalis" do
  version "1.0.0-alpha.1"
  sha256 "f9c0f728ce3ebec86e1a77634fa15f0dbaf8341e761f5764654a1d808d905d44"

  url "https://github.com/grundhofer/novalis/releases/download/v#{version}/novalis_#{version}_aarch64.dmg"
  name "novalis"
  desc "Markdown notes with a Sublime-like editor and a Kanban board, in plain files"
  homepage "https://github.com/grundhofer/novalis"

  # Pre-releases are the only releases until 1.0.0. The strategy skips them
  # by default, so the block keeps them and drops only drafts.
  livecheck do
    url :url
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
  depends_on macos: :sonoma

  app "novalis.app"

  # ADR-0003: the app's own data lives here and nowhere else. Notes are the
  # user's files in their vault and are never touched.
  zap trash: [
    "~/Library/Application Support/io.github.grundhofer.novalis",
    "~/Library/Caches/io.github.grundhofer.novalis",
    "~/Library/Saved Application State/io.github.grundhofer.novalis.savedState",
    "~/Library/WebKit/io.github.grundhofer.novalis",
  ]

  caveats do
    <<~EOS
      novalis is not notarized by Apple (docs/RELEASING.md, ADR-0010). Install
      with --no-quarantine, or right-click novalis.app ▸ Open ▸ Open once.
      Every release asset carries a build-provenance attestation:
        gh attestation verify <file> --repo grundhofer/novalis
    EOS
  end
end
