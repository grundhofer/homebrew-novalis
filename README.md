# homebrew-novalis

The Homebrew tap for [novalis](https://github.com/grundhofer/novalis): Markdown
notes, a Sublime-like editor and a small Kanban board over a folder of plain
files, for Apple Silicon Macs on macOS 14 or later.

```sh
brew tap grundhofer/novalis
brew install --cask --no-quarantine novalis   # the app
brew install novalis-cli                       # the `novalis` command
```

The app is not notarized by Apple (see the project's `docs/RELEASING.md`):
`--no-quarantine` spares the right-click ▸ Open on first launch. Every release
asset carries a build-provenance attestation — verify a download with
`gh attestation verify <file> --repo grundhofer/novalis`.

Releases before 1.0.0 are pre-releases; `brew upgrade` follows them.

Two files change per release, both from the release's `SHA256SUMS`:
`Casks/novalis.rb` (`version`, `sha256` of the DMG) and
`Formula/novalis-cli.rb` (`version`, `sha256` of the CLI tarball).
