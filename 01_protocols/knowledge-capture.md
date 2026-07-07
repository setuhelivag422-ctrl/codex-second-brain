---
id: knowledge-capture
type: protocol
scope: global
status: active
confidence: high
source: system_design
created_at: 2026-01-01
updated_at: 2026-01-01
tags:
  - capture
  - second-brain
---

# Knowledge Capture

## One Sentence

Capture only reusable knowledge that can help Codex act better in the future.

## Five Questions

Before writing, answer:

1. What was actually learned?
2. When will this be useful again?
3. Did it create a reusable rule?
4. What risk, failure, or counterexample should be remembered?
5. Should this become a `principle`, `protocol`, `project`, `case`, `tool`, or `template`?

## Decisions

- `create`: new reusable memory.
- `update`: add detail to an existing memory.
- `merge`: combine overlapping memories.
- `skip`: keep as temporary context.
- `deprecate`: mark old memory as outdated.

## Rule

When in doubt, prefer `skip` or `draft` over adding a noisy active memory.
