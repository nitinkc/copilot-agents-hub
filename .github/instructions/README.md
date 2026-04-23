# Instructions Directory

This directory contains **Copilot file-level instructions** — auto-applied guidance that appears when you edit matching file types.

## What Are Instructions?

Instructions are:
- **Auto-applied** to matching files (via `applyTo` patterns)
- **Non-intrusive** — offer guidance without blocking your work
- **File-specific** — different rules for markdown, YAML, Python, etc.
- **Cumulative** — multiple instructions can apply to one file

## Creating an Instruction

### File Format: `name.instructions.md`

```markdown
---
name: instruction-name
description: "Style guide for X file type"
applyTo:
  - "docs/**/*.md"
  - "*.config.yml"
---

# Instruction Title

Auto-applied guidance for files matching the patterns above.

## Rule 1

Explanation and examples.

## Rule 2

More guidance...
```

### Example: MkDocs Markdown Instructions

```markdown
---
name: mkdocs-markdown
description: "Auto-apply MkDocs content style rules: blank lines before lists, Mermaid syntax, abbreviations footer"
applyTo:
  - "docs/**/*.md"
  - "docs/**/*.markdown"
---

# MkDocs Markdown Style Guide

## Blank Line Before Lists

Always add a blank line before lists:

✅ **Correct:**
```
Paragraph text.

- Item 1
- Item 2
```

❌ **Wrong:**
```
Paragraph text.
- Item 1
- Item 2
```

## More Rules...
```

## Best Practices

1. **Specific file patterns** — Use glob patterns in `applyTo`
2. **Clear, actionable rules** — Not just warnings
3. **Examples** — Show correct and incorrect patterns
4. **Not too strict** — Suggest, don't mandate
5. **Auto-discoverable** — Clear description for context

## Directory Structure

```
.github/instructions/
└── instruction-name.instructions.md
```

## Examples (To Be Added)

- `mkdocs-markdown.instructions.md` — MkDocs markdown style rules
- `python-code.instructions.md` — Python coding standards
- `yaml-format.instructions.md` — YAML configuration format
- *(More coming)*

---

See [README.md](../../README.md) for setup and usage instructions.
