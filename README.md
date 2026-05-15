# homebrew-mded

A [Homebrew](https://brew.sh) tap for [mded](https://github.com/ersatzben/mded) — a minimal macOS markdown editor with a Finder Quick Look extension.

## Install

```bash
brew install --cask ersatzben/mded/mded
```

(Homebrew auto-taps `ersatzben/mded` from the first invocation; no separate `brew tap` step is required.)

## Update

```bash
brew upgrade --cask mded
```

## Uninstall

```bash
brew uninstall --cask mded               # remove the app
brew uninstall --cask --zap mded         # also remove preferences & caches
```

## About

The app is signed with a Developer ID and notarised by Apple, so installation has no Gatekeeper friction. Source and release notes live at <https://github.com/ersatzben/mded>.
