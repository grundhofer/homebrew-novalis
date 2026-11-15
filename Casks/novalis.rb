cask "novalis" do
  version "1.4.2"
  sha256 "1b6b954b6662cc926527b9ba6913d6dfe4e0db0231d9dfc231c14cf4788b5b73"

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
      novalis is not notarized by Apple (docs/RELEASING.md, ADR-0010). Before
      the first launch, and again after each upgrade, run
        xattr -dr com.apple.quarantine /Applications/novalis.app
      or once: System Settings ▸ Privacy & Security ▸ Open Anyway.
      Every release asset carries a build-provenance attestation:
        gh attestation verify <file> --repo grundhofer/novalis
    EOS
  end
end
