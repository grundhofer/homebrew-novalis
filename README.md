# homebrew-novalis

The Homebrew tap for [novalis](https://github.com/grundhofer/novalis): Markdown
notes, a Sublime-like editor and a small Kanban board over a folder of plain
files, for Apple Silicon Macs on macOS 14 or later.

```sh
brew tap grundhofer/novalis
brew trust grundhofer/novalis                  # Homebrew 7 loads nothing from an untrusted tap
brew install --cask novalis                    # the app
brew install novalis-cli                       # the `novalis` command
xattr -dr com.apple.quarantine /Applications/novalis.app   # once per app install or upgrade
```

The app is not notarized by Apple (see the project's `docs/RELEASING.md`):
the `xattr` line spares the System Settings ▸ Privacy & Security ▸ Open
Anyway step on first launch. Homebrew 7 no longer has `--no-quarantine`. Every release
asset carries a build-provenance attestation — verify a download with
`gh attestation verify <file> --repo grundhofer/novalis`.

`brew upgrade` follows stable releases only; pre-releases are on GitHub.

Two files change per release, both from the release's `SHA256SUMS`:
`Casks/novalis.rb` (`version`, `sha256` of the DMG) and
`Formula/novalis-cli.rb` (the version in the `url`, `sha256` of the CLI tarball).
