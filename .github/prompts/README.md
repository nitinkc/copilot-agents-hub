# Prompts Directory

This directory contains reusable **Copilot prompts** — parameterized single-task workflows that appear as `/prompt-name` slash commands in VS Code or IntelliJ Copilot Chat.

## What Are Prompts?

Prompts are:
- **Parameterized workflows** for specific tasks
- **Single-focused** (unlike agents which are multi-purpose)
- **Reusable** across projects
- **Accessible via `/prompt-name`** in Copilot Chat

## Creating a Prompt

### File Format: `name.prompt.md`

```markdown
---
name: prompt-name
description: "Create a new X with Y parameters"
arguments:
  - name: arg1_name
    type: string
    description: "What is this argument?"
  - name: arg2_name
    type: integer
    description: "Description"
    default: 10
---

# Prompt Title

Prompt instructions and template...

Use the arguments like this:
- {{arg1_name}}
- {{arg2_name}}

Provide step-by-step instructions...
```

### Template Example

```markdown
---
name: create-doc-section
description: "Create a new documentation section with summary article"
arguments:
  - name: section_name
    type: string
    description: "Section title (e.g., 'Authentication')"
  - name: section_number
    type: integer
    description: "Numeric prefix (e.g., 05)"
  - name: topics
    type: string
    description: "Topics to cover (comma-separated)"
---

# Create Documentation Section

Create a new section with:
- Section name: {{section_name}}
- Number: {{section_number}}
- Topics: {{topics}}

## Steps

1. Create section file
2. Add topics
3. Update navigation
```

## Best Practices

1. **One prompt per task** — Don't combine multiple workflows
2. **Clear description** — Used for discovery in `/` picker
3. **Meaningful arguments** — Parameters should be specific
4. **Helpful defaults** — Pre-fill sensible values
5. **Step-by-step instructions** — Clear workflow

## Directory Structure

```
.github/prompts/
└── prompt-name.prompt.md
```

## Examples (To Be Added)

- `mkdocs-new-section` — Create new documentation section
- `mkdocs-deep-dive` — Create deep-dive article
- `mkdocs-validate` — Validate documentation structure
- *(More coming)*

---

See [README.md](../../README.md) for usage and setup instructions.
