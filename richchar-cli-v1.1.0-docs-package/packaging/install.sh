#!/usr/bin/env bash
set -euo pipefail
PREFIX="${PREFIX:-/usr/local}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
install -d "$PREFIX/bin" "$PREFIX/share/man/man1"
install -m 0755 "$ROOT/richchar" "$PREFIX/bin/richchar"
install -m 0644 "$ROOT/man/richchar.1" "$PREFIX/share/man/man1/richchar.1"
echo "Installed richchar to $PREFIX/bin/richchar"
echo "Installed man page to $PREFIX/share/man/man1/richchar.1"
