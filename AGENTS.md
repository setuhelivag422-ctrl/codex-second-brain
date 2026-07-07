# Second Brain Agent Rules

This directory is an AI-first local second brain. Its goal is not to be a beautiful human-facing knowledge base, but to help Codex read long-term user knowledge in a stable, low-cost, auditable way.

## Core Principle

- Do not read the whole knowledge base by default.
- Start each second-brain task from `AGENTS.md`, `index.md`, and `manifest.json`.
- Select entries by task type, project name, keywords, tags, status, and summary.
- For common tasks, use `00_boot/task-entry-map.example.md` as a candidate map, then confirm with routing rules.
- Read only 3 to 5 relevant entries in the first pass.
- If current user instructions conflict with stored memory, follow the current user instructions.
- Add new memory only when it reduces future explanation, prevents repeated mistakes, or improves Codex collaboration.

## Memory Layers

- `AGENTS.md`: agent behavior rules.
- `index.md`: human and AI readable entry map.
- `manifest.json`: machine-readable routing manifest.
- `00_boot`: bootstrapping and routing rules.
- `01_protocols`: capture, triage, forgetting, automation boundaries.
- `02_principles`: reusable principles.
- `03_examples`: public examples only.
- `06_templates`: reusable memory templates.

## Capture Trigger

When the user says phrases such as:

- put this into the second brain
- remember this
- capture this
- add this to my knowledge base

Codex should run the capture protocol before writing.

## Capture Decisions

Every capture should become one of:

- `create`: create a new entry.
- `update`: update an existing entry.
- `merge`: merge with a related entry.
- `skip`: keep as temporary context.
- `deprecate`: mark old memory as outdated.

## Metadata

Every Markdown memory entry should include YAML front matter:

```yaml
id: stable-id
type: principle
scope: global
status: active
confidence: high
source: user_design
created_at: 2026-01-01
updated_at: 2026-01-01
tags: []
```

## Status Meaning

- `active`: default usable memory.
- `draft`: clue only, not default action basis.
- `deprecated`: old memory with historical value.
- `superseded`: replaced by a newer entry.

## Output Style

- Prefer AI-friendly structure: short, searchable, and actionable.
- Do not optimize for visual beauty at the cost of retrieval.
- Keep private memories out of public repositories.
