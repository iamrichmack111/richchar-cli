#!/usr/bin/env bash
set -euo pipefail
PREFIX="${PREFIX:-/usr/local}"
rm -f "$PREFIX/bin/richchar" "$PREFIX/share/man/man1/richchar.1"
echo "Removed Richchar CLI files from $PREFIX"
