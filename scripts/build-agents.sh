#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT/generated/AGENTS.md"

mkdir -p "$(dirname "$OUT")"
: > "$OUT"

for f in "$ROOT"/cursor-rules/*.mdc; do
  awk '
    BEGIN { delim = 0 }
    /^---$/ {
      if (delim < 2) { delim++; next }
    }
    delim >= 2 { print }
  ' "$f" >> "$OUT"
  printf '\n' >> "$OUT"
done