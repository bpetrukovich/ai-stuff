# AI Rules

Single source of truth for all global AI rules and skills.

## Setup

| Tool     | Rules | Skills |
| -------- | ----- | ------ |
| Cursor   | `~/.cursor/rules/` | `~/.cursor/skills/` |
| opencode | `~/.config/opencode/AGENTS.md` | `~/.config/opencode/skills/` |

## Symlinks

```sh
# WARNING: this will delete all your existing rules and skills
rm -rf ~/.cursor/rules ~/.cursor/skills
ln -s ~/ai/cursor-rules ~/.cursor/rules
ln -s ~/ai/skills ~/.cursor/skills
```
