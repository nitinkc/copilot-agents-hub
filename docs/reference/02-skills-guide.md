# Skills Guide

Reference documentation for creating and using Copilot skills.

---

## What Are Skills?

Skills are:
- **Reference libraries** with actionable templates
- **Multi-asset bundles** (markdown guides + code templates + checklists)
- **Reusable across projects** — copy and paste what you need
- **Accessible via `/skill-name`** in Copilot Chat

---

## Available Skills

### mkdocs-docs

Complete MkDocs reference library with:
- Configuration templates (mkdocs.yml, requirements.txt)
- Markdown article templates (summary and deep-dive)
- JavaScript and CSS setup (Mermaid, MathJax)
- GitHub Actions deployment workflow
- Validation checklists
- Setup guides for new projects

**Access:** `/mkdocs-docs` in Copilot Chat

*(More skills coming)*

---

## Creating a New Skill

### 1. Directory Structure

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

### 2. Create SKILL.md

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

\`\`\`yaml
# Your template here
\`\`\`

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

### 3. Add Supporting Files

- **SETUP-GUIDE.md** — Step-by-step setup instructions
- **templates/** — Reusable code/config templates
- **examples/** — Working example implementations

### 4. Update Registry

Add entry to `.github/skills/README.md` (or equivalent registry).

### 5. Test and Deploy

- Verify SKILL.md frontmatter is valid YAML
- Test in Copilot Chat: `/skill-name`
- Commit and push to GitHub

---

## Skill Design Best Practices

### Asset-Focused

Skills should provide **immediately usable templates** and reference material:
- Configuration files
- Code templates
- Markdown examples
- Validation checklists
- Setup procedures

### Clear Level Indication

Mark skill complexity:
- **Beginner** — No prior knowledge needed
- **Intermediate** — Some domain knowledge assumed
- **Advanced** — Expert-level concepts

### Single Responsibility

Each skill covers one domain:
- ✅ MkDocs documentation setup
- ✅ REST API patterns
- ❌ "Documentation and APIs" (too broad)

### Self-Contained

Skills should be independent:
- Include all templates needed
- Link to external docs only for deep learning
- No cross-skill dependencies

