#!/usr/bin/env bash
set -euo pipefail

VERSION="1.1.0"
NAME="richchar-cli-${VERSION}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="${ROOT}/dist"
STAGE="${DIST}/${NAME}"

rm -rf "$STAGE"
mkdir -p "$STAGE"

for item in richchar src scripts docs man README.md CHANGELOG.md LICENSE pyproject.toml requirements-dev.txt; do
  if [[ -e "$ROOT/$item" ]]; then
    cp -R "$ROOT/$item" "$STAGE/"
  fi
done

chmod +x "$STAGE/richchar" 2>/dev/null || true
chmod +x "$STAGE/scripts/doctor.sh" 2>/dev/null || true

cd "$DIST"
tar -czf "${NAME}.tar.gz" "$NAME"
zip -qr "${NAME}.zip" "$NAME"
shasum -a 256 "${NAME}.tar.gz" "${NAME}.zip" > SHA256SUMS
rm -rf "$STAGE"

echo "Built:"
ls -lh "${NAME}.tar.gz" "${NAME}.zip" SHA256SUMS
