# Skills Directory

This directory contains **Copilot Skills** — bundled reference libraries, templates, and tools that appear as `/skill-name` commands in Copilot Chat.

## What Are Skills?

Skills are:
- **Reference libraries** with actionable templates
- **Multi-asset bundles** (markdown guides + code templates + checklists)
- **Reusable across projects** — copy paste what you need
- **Accessible via `/skill-name`** in Copilot Chat

## Available Skills

### mkdocs-docs

Complete MkDocs reference library with:
- Configuration templates (mkdocs.yml, requirements.txt)
- Markdown article templates (summary and deep-dive)
- JavaScript and CSS setup (Mermaid, MathJax)
- GitHub Actions deployment workflow
- Validation checklists
- Setup guides for new projects

**Location:** `mkdocs-docs/`  
**Access:** `/mkdocs-docs` in chat

## Creating a Skill

### Directory Structure

```
.github/skills/skill-name/
├── SKILL.md                    ← Main documentation (required)
├── SETUP-GUIDE.md              ← Setup instructions (optional)
├── templates/                  ← Asset templates
│   ├── template1.md
│   ├── template2.yaml
│   └── template3.json
├── examples/                   ← Example code (optional)
│   └── example.py
└── README.md                   ← How to use this skill (optional)
```

### SKILL.md Template

```markdown
---
name: skill-name
description: "Use when: specific use case or learning need"
---

# Skill Title

> **Level:** Beginner | Intermediate | Advanced

Brief introduction to the skill.

---

## What This Skill Provides

| Asset | Purpose |
|-------|---------|
| Asset 1 | Description |
| Asset 2 | Description |

---

## Asset 1: Name

Copy this directly into your project:

```yaml
# Your template here
```

---

## Asset 2: Name

More template or reference material...

---

## Quick Start

Steps to get started with this skill.

---

## Common Patterns

Best practices and examples.

---

## Resources

Links to official docs, related skills, etc.
```

## Best Practices

1. **Self-contained** — Skill should work independently
2. **CopyPaste-ready** — Templates should be directly usable
3. **Well-documented** — Include examples and gotchas
4. **Versioned assets** — Include version numbers in templates
5. **Related resources** — Link to other skills and documentation

## Directory Structure

```
.github/skills/
├── skill-name-1/
│   ├── SKILL.md
│   ├── SETUP-GUIDE.md
│   ├── templates/
│   └── examples/
├── skill-name-2/
│   ├── SKILL.md
│   └── templates/
└── README.md (this file)
```

## Examples to Create

- `rest-api-docs/` — REST API documentation patterns
- `python-testing/` — Unit testing templates
- `security-checklist/` — Security audit checklists
- `docker-setup/` — Docker configuration templates
- *(More coming)*

---

See [README.md](../../README.md) for setup and usage instructions.
