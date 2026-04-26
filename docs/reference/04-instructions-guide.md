# Instructions Guide

Reference documentation for creating and using Copilot file-level instructions.

---

## What Are Instructions?

Instructions are:
- **Auto-applied** to matching files (via `applyTo` patterns)
- **Non-intrusive** — offer guidance without blocking your work
- **File-specific** — different rules for markdown, YAML, Python, etc.
- **Cumulative** — multiple instructions can apply to one file

Think of instructions as **style guides that auto-appear** when you're editing matching file types.

---

## Using Instructions

Instructions require no special command or invocation. They automatically appear as contextual guidance in:
- **Copilot Chat** — when editing a matching file
- **Inline suggestions** — as you type
- **Code completions** — tailored to file type

### Example

When you open `docs/**/*.md`:
- The MkDocs markdown instruction auto-applies
- Guidance appears for blank lines before lists, Mermaid syntax, etc.
- No explicit action needed

---

## Available Instructions

*(To be populated as instructions are created)*

- `mkdocs-markdown` — MkDocs markdown style rules
- `python-code` — Python coding standards
- `yaml-format` — YAML configuration format

---

## Creating a New Instruction

### 1. File Format

Create file in `.github/instructions/` with format: `name.instructions.md`

### 2. Add YAML Frontmatter

```markdown
---
name: instruction-name
description: "Style guide for X file type"
applyTo:
  - "docs/**/*.md"
  - "*.config.yml"
---
```

The `applyTo` patterns use standard glob syntax:
- `docs/**/*.md` — All markdown files under docs/
- `*.config.yml` — Config files at root
- `src/**/test-*.js` — Test files in src/

### 3. Write Instruction Content

```markdown
---
name: mkdocs-markdown
description: "Auto-apply MkDocs content style rules"
applyTo:
  - "docs/**/*.md"
---

# MkDocs Markdown Style Guide

## Rule 1: Blank Lines Before Lists

Always add a blank line before lists — this includes after bold text, headings, or regular text.

✅ **Correct (with blank line):**
```
**Bold text:**

- Item 1
- Item 2

Paragraph text.

- Item 1
- Item 2
```

❌ **Wrong (no blank line):**
```
**Bold text:**
- Item 1
- Item 2

Paragraph text.
- Item 1
- Item 2
```

This is required for proper markdown rendering in all parsers.

## Rule 2: Mermaid Diagrams

Use Mermaid for flowcharts and diagrams:

\`\`\`markdown
\`\`\`mermaid
graph TD
    A[Start] --> B[Process]
    B --> C[End]
\`\`\`
\`\`\`

## More Rules...
```

### 4. Best Practices

| ✅ Do | ❌ Don't |
|------|----------|
| Use specific glob patterns | Use overly broad patterns |
| Show correct + incorrect examples | Just list rules |
| Focus on consistency | Enforce extreme strictness |
| Make rules actionable | Vague or theoretical guidance |

### 5. Test and Deploy

```bash
bash scripts/setup-vscode.sh  # Sync instructions
# Restart VS Code
# Open matching file to verify instruction applies
```

---

## Multiple Instructions on Same File

Instructions are cumulative. Multiple instructions can apply to one file:

**Example:**
- File: `docs/tutorial.md`
- Matches: `docs/**/*.md` (MkDocs instruction) AND `**/*.md` (General markdown instruction)
- Both instructions auto-apply

---

## Instruction Design Best Practices

### Specific File Patterns

Use precise glob patterns in `applyTo`:
- ✅ `docs/**/*.md` — All docs markdown
- ✅ `src/**/test-*.py` — Test Python files
- ❌ `**/*` — Everything (too broad)
- ❌ `.md` — Invalid glob pattern

### Clear, Actionable Rules

Each rule should be:
- **Understandable** — no jargon
- **Actionable** — specific what to do
- **Exemplified** — show correct and incorrect

✅ **Good:**
```
## Blank Lines Before Lists

Always add a blank line before lists:

✅ Correct:
Paragraph.

- Item 1

❌ Wrong:
Paragraph.
- Item 1
```

❌ **Bad:**
```
## Formatting

Make sure everything is formatted correctly.
```

### Focus on Consistency

Instructions should promote **project consistency**, not personal style:
- ✅ "Use 2-space indentation in YAML (project standard)"
- ❌ "Use spaces instead of tabs (personal preference)"

### Suggestion, Not Mandatory

Tone should be helpful, not bossy:
- ✅ "Consider adding a blank line before lists for readability"
- ❌ "You MUST add a blank line before all lists"

