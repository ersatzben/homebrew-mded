#!/usr/bin/env bash
# Bump the mded cask to a new version + sha256, commit, and push.
#
# Usage:
#   ./bump-tap.sh <version> <sha256>
#   ./bump-tap.sh <version> <path-to-zip>     # computes the sha256 for you
#
# Examples:
#   ./bump-tap.sh 1.0.1 6ee432f88b21...
#   ./bump-tap.sh 1.0.1 ../mded/dist/mded-1.0.1.zip

set -euo pipefail
cd "$(dirname "$0")"

VERSION="${1:?usage: ./bump-tap.sh <version> <sha256|zipfile>}"
ARG2="${2:?usage: ./bump-tap.sh <version> <sha256|zipfile>}"

# Distinguish a 64-char hex SHA from a file path.
if [[ "${ARG2}" =~ ^[0-9a-fA-F]{64}$ ]]; then
    SHA="${ARG2}"
elif [[ -f "${ARG2}" ]]; then
    SHA=$(shasum -a 256 "${ARG2}" | awk '{print $1}')
else
    echo "✘ second argument must be a 64-char sha256 or a path to an existing file" >&2
    exit 1
fi

CASK="Casks/mded.rb"
[[ -f "${CASK}" ]] || { echo "✘ ${CASK} not found — run from the tap repo root" >&2; exit 1; }

echo "→ updating ${CASK} to version=${VERSION}, sha256=${SHA}"
# macOS sed needs -i ''
sed -i '' -E "s|^([[:space:]]*version \").*(\".*)$|\1${VERSION}\2|" "${CASK}"
sed -i '' -E "s|^([[:space:]]*sha256 \").*(\".*)$|\1${SHA}\2|" "${CASK}"

if git diff --quiet "${CASK}"; then
    echo "✓ no change — cask already at ${VERSION}/${SHA}"
    exit 0
fi

git add "${CASK}"
git commit -m "mded ${VERSION}"
git push origin HEAD

echo "✓ pushed mded ${VERSION} to the tap"
