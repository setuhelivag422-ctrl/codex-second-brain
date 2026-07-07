---
id: ai-first-memory
type: principle
scope: global
status: active
confidence: high
source: system_design
created_at: 2026-01-01
updated_at: 2026-01-01
tags:
  - ai-first
  - memory
  - local-first
---

# AI-first Memory

## One Sentence

The second brain should first serve stable AI retrieval and reuse. Human-facing documents can be derived later.

## Rules

- Markdown and JSON are the source data.
- Start from entry files and manifests.
- Do not read the whole library by default.
- Keep entries short, structured, searchable, and auditable.
- Prefer reusable rules over raw material.
- Public versions should be sanitized skeletons, not real private memory.
