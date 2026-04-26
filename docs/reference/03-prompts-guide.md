# Prompts Guide

Reference documentation for creating and using Copilot prompts.

---

## What Are Prompts?

Prompts are:
- **Parameterized workflows** for specific tasks
- **Single-focused** — unlike agents which are multi-purpose
- **Reusable** across projects
- **Accessible via `/prompt-name`** in Copilot Chat

Think of prompts as **task-specific templates** that handle one job exceptionally well.

---

## Using Prompts

### In VS Code

1. Open **Copilot Chat** (Cmd+Shift+I)
2. Type `/` to see available prompts
3. Select a prompt (e.g., `/create-doc-section`)
4. Provide arguments when prompted

### In IntelliJ

1. Open **Copilot Chat** (View → Tool Windows → GitHub Copilot Chat)
2. Start with `/prompt-name`
3. Provide required parameters

---

## Available Prompts

*(To be populated as prompts are created)*

- `mkdocs-new-section` — Create new documentation section
- `mkdocs-deep-dive` — Create deep-dive article
- `mkdocs-validate` — Validate documentation structure

---

## Creating a New Prompt

### 1. File Format

Create file in `.github/prompts/` with format: `name.prompt.md`

### 2. Add YAML Frontmatter

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
```

### 3. Write Prompt Instructions

```markdown
# Prompt Title

Narrative introduction and context.

## Steps

1. Step one
2. Step two
3. Step three

Use the arguments:
- {{arg1_name}}
- {{arg2_name}}

Provide detailed guidance...
```

### 4. Full Example

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

Create a new section with the following details:

- **Section name:** {{section_name}}
- **Number:** {{section_number}}
- **Topics:** {{topics}}

## Steps

1. Create section file at `docs/{{section_number}}-{{section_name}}/`
2. Add summary article with topics
3. Update mkdocs.yml navigation
4. Add cross-references
```

### 5. Test and Deploy

```bash
bash scripts/setup-vscode.sh  # Sync prompts
# Restart VS Code
# Type / to verify prompt appears
```

---

## Prompt Design Best Practices

### One Prompt Per Task

Don't combine multiple workflows:
- ❌ `create-and-deploy-docs`
- ✅ `create-doc-section`
- ✅ `deploy-docs`

### Clear, Actionable Description

Used for discovery in `/` picker:
- ✅ "Create new documentation section with summary article"
- ❌ "Documentation helper"

### Meaningful Arguments

Parameters should be:
- **Specific** — not vague or overlapping
- **Well-described** — clear purpose
- **Have defaults** — where sensible

Example:
```yaml
arguments:
  - name: section_name
    type: string
    description: "Section title (e.g., 'Authentication')"
    default: "New Section"
```

### Step-by-Step Workflow

Provide clear, sequential instructions with:
- Numbered steps
- Example values
- Expected outputs
- Validation checklist

### Reusable, Not Project-Specific

Avoid hardcoded paths or domain-specific details:
- ✅ "Create a new file at `docs/{{section_number}}-{{section_name}}/`"
- ❌ "Create file in our docs folder for internal API docs"

