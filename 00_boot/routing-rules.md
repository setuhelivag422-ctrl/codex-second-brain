---
id: routing-rules
type: protocol
scope: global
status: active
confidence: high
source: system_design
created_at: 2026-01-01
updated_at: 2026-01-01
tags:
  - routing
  - memory
---

# Routing Rules

## One Sentence

The second brain is not meant to be read all at once. Codex should read the map first, then select only the entries relevant to the current task.

## Default Read Order

1. Read the current user request.
2. Read local project rules if they exist.
3. Read `AGENTS.md`.
4. Read `index.md`.
5. Read `manifest.json`.
6. Select candidate entries by task type, tags, summaries, paths, and status.
7. Read only 3 to 5 relevant entries in the first pass.

## Status Weight

- `active`: default usable memory.
- `draft`: clue only.
- `deprecated`: historical reference only.
- `superseded`: replaced by a newer entry.

## Forbidden Behavior

- Do not read the whole second brain for ordinary tasks.
- Do not treat `draft`, `deprecated`, or `superseded` as default rules.
- Do not move private raw data into public memory.
- Do not let old memory override the current user request.

## Expand Search Only When

- Entry files cannot classify the task.
- Relevant entries conflict.
- The user asks for a full review.
- The task is maintaining the second brain itself.
