#!/usr/bin/env bash
set -euo pipefail
VERSION="1.1.0"
NAME="richchar-cli-${VERSION}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="${ROOT}/dist"
STAGE="${DIST}/${NAME}"
rm -rf "$STAGE"
mkdir -p "$STAGE"
for item in richchar src scripts tests docs man packaging README.md CHANGELOG.md LICENSE requirements-dev.txt pyproject.toml .gitignore; do
  [[ -e "$ROOT/$item" ]] && cp -R "$ROOT/$item" "$STAGE/"
done
chmod +x "$STAGE/richchar" "$STAGE/scripts/doctor.sh" "$STAGE/packaging/"*.sh 2>/dev/null || true
cd "$DIST"
tar -czf "${NAME}.tar.gz" "$NAME"
zip -qr "${NAME}.zip" "$NAME"
shasum -a 256 "${NAME}.tar.gz" "${NAME}.zip" > SHA256SUMS
rm -rf "$STAGE"
echo "Built release artifacts in $DIST"
