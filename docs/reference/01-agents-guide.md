# Agents Guide

Reference documentation for creating and using Copilot agents.

---

## What Are Agents?

Agents are:
- **Specialized AI assistants** focused on a particular domain (MkDocs, security, API design, etc.)
- **Discoverable** — appear in the `@` picker when relevant to your task
- **Reusable** — shared across all your machines via GitHub
- **Customizable** — easily modify or create new agents

---

## Using Agents

### In VS Code

1. Open **Copilot Chat** (Cmd+Shift+I)
2. Type **`@`** to see available agents
3. Select an agent (e.g., `@mkdocs-content`)
4. Type your request

### In IntelliJ

1. Open **Copilot Chat** (View → Tool Windows → GitHub Copilot Chat)
2. Start a message with **`@agent-name`**
3. The agent will be selected for that conversation

---

## Available Agents

See [Agents Index](../agents-index.md) for the complete registry.

---

## Creating a New Agent

### 1. Create Agent File

Create a new file in `.github/agents/` with format: `NN-name.agent.md`
- Start with a number for ordering (01, 02, 03...)
- Use hyphens in filename
- Match `name:` in frontmatter to filename (without `NN-` prefix and `.agent.md`)

### 2. Add YAML Frontmatter

```yaml
---
name: your-agent-name
description: "Use when: specific use case or task to trigger auto-discovery"
temperature: 0.7
context_limit: 8000
applyToFilePattern:
  - "relevant/**/*.md"
---
```

### 3. Write Agent Instructions

Add your agent system prompt in markdown following the frontmatter.

### 4. Update Agent Index

Add your agent to [Agents Index](../agents-index.md) with name, category, and purpose.

### 5. Test Locally

```bash
bash scripts/setup-vscode.sh
# Restart VS Code
# Verify agent appears in @ picker
```

### 6. Commit and Push

```bash
git add .github/agents/NN-name.agent.md
git commit -m "Add: agent-name — short description"
git push origin main
```

---

## Agent Design Best Practices

### Clear, Specific Description

The `description` field is used for:
- Display in the `@` picker
- Auto-suggestion triggering
- User discovery

✅ **Good:**
```yaml
description: "Use when: writing REST API documentation with OpenAPI specs"
```

❌ **Bad:**
```yaml
description: "API agent for documentation"
```

### Specialized, Not Generic

Each agent should have a clear domain and purpose. Avoid overlap.

| ❌ Bad | ✅ Good |
|--------|---------|
| "General documentation agent" | "MkDocs content creation and navigation management" |
| "Coding helper" | "Python FastAPI REST API implementation" |

### Clear Operating Principles

Define agent's:
- **Primary domain** — what it specializes in
- **When to use** — must be clear from description
- **Key capabilities** — what it can help with
- **Tool restrictions** — if applicable
- **Output format** — expected deliverables
