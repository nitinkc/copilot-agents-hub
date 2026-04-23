# Using Agents from This Repository

This directory contains **Copilot Agent definitions** — specialized AI personas tailored for specific tasks and domains.

## 📋 What Are Agents?

Agents are:
- **Specialized AI assistants** focused on a particular domain (MkDocs, security, API design, etc.)
- **Discoverable** — appear in the `@` picker when relevant to your task
- **Reusable** — shared across all your machines via GitHub
- **Customizable** — easily modify or create new agents

## 🚀 Using Agents

### In VS Code

1. Open **Copilot Chat** (Cmd+Shift+I)
2. Type **`@`** to see available agents
3. Select an agent (e.g., `@mkdocs-content`)
4. Type your request

### In IntelliJ

1. Open **Copilot Chat** (View → Tool Windows → GitHub Copilot Chat)
2. Start a message with **`@agent-name`**
3. The agent will be selected for that conversation

## 📝 Available Agents

| Agent | Purpose | File |
|-------|---------|------|
| `mkdocs-content` | Create and manage MkDocs documentation | `01-mkdocs-content.agent.md` |
| *(More coming)* | | |

See [AGENTS-INDEX.md](../../AGENTS-INDEX.md) for complete list with descriptions.

## ➕ Adding a New Agent

1. **Create agent file**: `NN-name.agent.md`
   - Start with number for ordering (01, 02, 03...)
   - Use hyphens in filename
   - Match `name:` in frontmatter to filename (without `NN-` prefix and `.agent.md`)

2. **Add YAML frontmatter**:
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

3. **Write agent instructions** in markdown (agent system prompt)

4. **Update [AGENTS-INDEX.md](../../AGENTS-INDEX.md)** with new agent entry

5. **Test locally**:
   - Run `bash scripts/setup-vscode.sh`
   - Restart VS Code
   - Verify agent appears in `@` picker

6. **Commit and push**:
   ```bash
   git add .github/agents/NN-name.agent.md
   git commit -m "Add: agent-name — short description"
   git push origin main
   ```

## 🎯 Agent Design Best Practices

### 1. Clear, Specific Description

The `description` field is used to:
- Show in the `@` picker
- Determine when agent is auto-suggested
- Help users discover the right agent

✅ **Good:**
```yaml
description: "Use when: writing REST API documentation with OpenAPI specs"
```

❌ **Bad:**
```yaml
description: "API agent for documentation"
```

### 2. Specialized, Not Generic

Each agent should have a clear domain and purpose. Avoid overlap.

| Bad | Good |
|-----|------|
| "General documentation agent" | "MkDocs content creation and navigation management" |
| "Coding helper" | "Python FastAPI REST API implementation" |

### 3. Clear Operating Principles

Tell the agent:
- **What it does** (core responsibilities)
- **How it approaches tasks** (operating principles)
- **Which tools to use** (tool preferences)
- **When to suggest vs implement** (boundaries)

### 4. Example Workflows

Provide 2–3 concrete example workflows showing how the agent should be used.

### 5. Moderate Temperature Setting

- **0.7** (default): Good balance of creativity and consistency
- **0.5**: More deterministic, better for structured tasks
- **0.9**: More creative, better for ideation

## 🔍 Agent File Anatomy

```markdown
---
name: agent-name                          # ← Used in @ picker
description: "Use when: ..."              # ← Auto-discovery trigger
temperature: 0.7                          # ← Creativity level
context_limit: 8000                       # ← Max tokens
applyToFilePattern:                       # ← When to auto-suggest
  - "docs/**/*.md"
---

# Agent Title

Your background and role.

## Core Responsibilities

- What you do
- What you manage

## Operating Principles

- How you approach tasks
- Tool usage
- Boundaries

## Example Workflows

**Scenario 1:**
1. Step 1
2. Step 2

**Scenario 2:**
1. Step 1
2. Step 2
```

## 🧪 Testing a New Agent

```bash
# 1. Create agent file
vim .github/agents/NN-your-agent.agent.md

# 2. Update index
vim AGENTS-INDEX.md

# 3. Sync to local IDE
bash scripts/setup-vscode.sh

# 4. Restart VS Code
# Cmd+Shift+P → Reload Window

# 5. Test in Copilot Chat
# Type: @your-agent-name [Your test prompt]
```

## 🐛 Troubleshooting

### Agent doesn't appear in `@` picker

**Check:**
1. Frontmatter is valid YAML (colon in description must be quoted)
2. File extension is `.agent.md` (not `.md` or `.agent`)
3. Name matches (without `NN-` and `.agent.md`)
4. Run `bash scripts/validate-agents.sh`

**Fix:**
```bash
bash scripts/setup-vscode.sh              # Re-sync
# Restart VS Code
```

### Agent selected but not working as expected

**Check:**
1. Operating Principles are clear
2. Tool preferences are documented
3. Example workflows match the task
4. Context limit is sufficient (8000 is typical)

**Fix:**
- Adjust operating principles
- Add more specific examples
- Increase context_limit if needed

## 📚 Resources

- [Copilot Agent Documentation](https://github.com/github/copilot-instructions)
- [Writing Better Prompts](https://github.blog/2023-06-20-how-to-write-better-prompts-for-github-copilot/)
- [AGENTS-INDEX.md](../../AGENTS-INDEX.md) — Registry of all agents
- [SETUP.md](../../SETUP.md) — Setup instructions for all machines

## 💡 Pro Tips

1. **One agent per concern** — Don't cram multiple domains into one agent
2. **Clear boundaries** — Tell agent when to suggest vs implement
3. **Test cross-machine** — Verify agent works on Windows, macOS, Linux
4. **Document examples** — Real-world workflow examples are super helpful
5. **Version your agents** — Update name/number if you drastically change behavior

