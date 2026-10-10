cask "novalis" do
  version "1.0.0"
  sha256 "a159e47d5df70f23f6ec341d0a3e937f3121df159e27baab4e7dbef077c274b0"

  url "https://github.com/grundhofer/novalis/releases/download/v#{version}/novalis_#{version}_aarch64.dmg"
  name "novalis"
  desc "Markdown notes with a Sublime-like editor and a Kanban board, in plain files"
  homepage "https://github.com/grundhofer/novalis"

  # Stable releases only: GitHub's latest release is never a pre-release.
  livecheck do
    url :url
    strategy :github_latest
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
