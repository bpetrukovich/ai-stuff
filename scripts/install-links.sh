#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

"$ROOT/scripts/build-agents.sh"

link() {
  local target="$1" name="$2"
  mkdir -p "$(dirname "$name")"
  if [ -L "$name" ] && [ "$(readlink "$name")" = "$target" ]; then
    echo "ok:     $name"
    return
  fi
  if [ -e "$name" ] || [ -L "$name" ]; then
    echo "SKIP:   $name exists and is not the expected symlink -> $target"
    return
  fi
  ln -s "$target" "$name"
  echo "linked: $name -> $target"
}

link "$ROOT/cursor-rules" "$HOME/.cursor/rules"
link "$ROOT/skills" "$HOME/.cursor/skills"
link "$ROOT/AGENTS.md" "$HOME/.config/opencode/AGENTS.md"
link "$ROOT/skills" "$HOME/.config/opencode/skills"
link "$ROOT/AGENTS.md" "$HOME/.claude/CLAUDE.md"
link "$ROOT/skills" "$HOME/.claude/skills"

git -C "$ROOT" config core.hooksPath .githooks
echo "hooks:  core.hooksPath -> .githooks"