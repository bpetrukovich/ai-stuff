# AI Rules

Single source of truth for all global AI rules and skills.

## Setup

```sh
./scripts/install-links.sh
```

This creates the symlinks for every tool (idempotent, safe to re-run):

| Tool       | Rules        | Skills |
| ---------- | ------------ | ------ |
| Cursor     | `~/.cursor/rules` | `~/.cursor/skills` |
| opencode   | `~/.config/opencode/AGENTS.md` | `~/.config/opencode/skills` |
| Claude Code | `~/.claude/CLAUDE.md` | `~/.claude/skills` |

It also points `core.hooksPath` at `.githooks`.

## How it works

Rules live only in `cursor-rules/*.mdc`. The pre-commit hook regenerates the
single `AGENTS.md` (stripping Cursor-only frontmatter) on every commit, so
opencode and Claude Code always get a fresh copy without duplication.

Change a rule → commit in this repo → restart opencode.
