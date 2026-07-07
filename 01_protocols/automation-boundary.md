---
id: automation-boundary
type: protocol
scope: global
status: active
confidence: high
source: system_design
created_at: 2026-01-01
updated_at: 2026-01-01
tags:
  - automation
  - boundary
  - governance
---

# Automation Boundary

## One Sentence

Automation may remind, inspect, and draft. It must not silently rewrite long-term memory or ingest private raw data.

## Allowed

- Read-only health checks.
- Broken link checks.
- Manifest consistency checks.
- Draft candidate generation.
- Reminders to review relevant memory.

## Not Allowed By Default

- Auto-promoting draft to active.
- Auto-deleting or overwriting memory.
- Auto-ingesting raw private documents.
- Auto-reading secrets, chats, profiles, or auth files.
- Letting automation override current user instructions.

## Rule

Automation should reduce user burden. If it creates more confirmations, noise, or maintenance work, it is probably the wrong automation.
