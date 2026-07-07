---
id: memory-decay-and-forgetting
type: protocol
scope: global
status: active
confidence: high
source: system_design
created_at: 2026-01-01
updated_at: 2026-01-01
tags:
  - forgetting
  - memory
  - maintenance
---

# Memory Decay And Forgetting

## One Sentence

Good memory needs forgetting. Old or uncertain knowledge should be downgraded instead of silently steering future work.

## Status

- `active`: default usable rule.
- `draft`: possible memory, clue only.
- `deprecated`: outdated but useful for history.
- `superseded`: replaced by a newer rule.

## Default Behavior

Only `active` memory should guide action by default.

Read old memory only when:

- Debugging a historical decision.
- Resolving a conflict.
- Auditing why something changed.
- Migrating or cleaning the second brain.

## Rule

When a memory no longer improves Codex behavior, lower its weight instead of letting it linger as an active rule.
