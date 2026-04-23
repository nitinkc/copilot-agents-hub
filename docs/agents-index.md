# 📋 Agents Index

Registry of all available Copilot agents in this hub. Use the `@` picker in VS Code or IntelliJ to access these agents.

---

## Available Agents

| Agent Name | Category | Purpose | File | Status |
|---|---|---|---|---|
| `mkdocs-content` | Documentation | Create and manage MkDocs documentation with two-tier content model | [01-mkdocs-content.agent.md](.github/agents/01-mkdocs-content.agent.md) | ✅ Active |

---

## How to Use Agents

### In VS Code

1. Open **Copilot Chat** (Cmd+Shift+I)
2. Type **`@`** to see all agents
3. Select **`@agent-name`**
4. Type your request

### In IntelliJ

1. Open **Copilot Chat** (View → Tool Windows → GitHub Copilot Chat)
2. Type **`@agent-name`** at the start of your message
3. The agent will be selected

---

## Agent Details

### mkdocs-content

**Purpose:** Specialized for creating and managing MkDocs documentation projects.

**Use when:**
- Creating new documentation sections or articles
- Managing MkDocs project structure and navigation
- Ensuring style consistency across markdown files
- Adding deep-dive topics with diagrams and Q&A blocks
- Updating mkdocs.yml navigation

**Capabilities:**
- ✅ Create summary articles (NN-section.md)
- ✅ Create deep-dive articles (NN.XX-topic.md) with Mermaid diagrams
- ✅ Generate interview Q&A blocks
- ✅ Manage cross-references and breadcrumbs
- ✅ Validate documentation structure

**File:** [.github/agents/01-mkdocs-content.agent.md](.github/agents/01-mkdocs-content.agent.md)

**Example Prompts:**
```
@mkdocs-content Create a new documentation section on "Advanced Topics"

@mkdocs-content Add a deep-dive article about "Security Patterns" under section 05

@mkdocs-content Update the navigation in mkdocs.yml to include all new articles

@mkdocs-content Check for broken cross-references in the docs
```

---

## Adding New Agents

Want to create a new agent? See [.github/agents/README.md](.github/agents/README.md) for detailed instructions.

**Quick checklist:**
1. Create `.github/agents/NN-name.agent.md`
2. Add YAML frontmatter (name, description, temperature)
3. Write agent instructions (core responsibilities, operating principles)
4. Update this index
5. Test locally: `bash scripts/setup-vscode.sh`
6. Commit and push

---

## Related Documentation

- **README.md** — Project overview and quick start
- **SETUP.md** — Detailed setup for VS Code and IntelliJ
- **.github/agents/README.md** — How to create agents
- **.github/copilot-instructions.md** — Workspace rules
- **.jetbrains/copilot-config.md** — IntelliJ setup guide

---

**Last Updated:** April 23, 2026  
**Total Agents:** 1 (active)  
**Next Agent:** Coming soon!
