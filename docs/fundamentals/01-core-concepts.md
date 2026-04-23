# Core Concepts — Agents, Instructions, Skills & Prompts

> **Level:** Beginner
> **Pre-reading:** [Home](../index.md)

---

## Why Custom Agents Exist

GitHub Copilot's default mode is a general-purpose assistant. It answers questions, writes code, and explains things — but it has no persistent context about your project's conventions, domain language, or preferred workflows.

Custom agents solve this by letting you encode that knowledge permanently into a file that Copilot loads every time you invoke the agent. Think of it as giving Copilot a detailed job description before each conversation.

---

## The Four Primitives

Every customization in GitHub Copilot fits into one of four categories.

### 1. Agents (`.agent.md`)

An **agent** is a persistent AI persona with a defined purpose, a set of allowed tools, and always-on instructions baked in. It is the most powerful primitive because it combines identity, context, and capability restrictions in one file.

**Key properties:**

- Has a `name` — typed as `@agent-name` in chat
- Has a `description` — used by Copilot to decide when to suggest it
- Can restrict which tools are available (e.g., read-only, no shell access)
- Carries its own system-level instructions that override the workspace defaults for that session

**Simple example — a docs-only agent:**

```yaml
---
name: docs-writer
description: "Use when: writing or editing documentation, README files, or MkDocs content"
tools:
  - read_file
  - create_file
  - replace_string_in_file
---

You are a technical writer specialized in MkDocs documentation.
Always use admonition blocks for warnings and notes.
Always add a blank line before bullet lists.
```

**When to reach for an agent:**

- You repeat the same contextual briefing in every chat session
- You want different tool permissions for different tasks (e.g., no `run_in_terminal` for a review agent)
- You need a subagent to handle one isolated step in a larger pipeline

---

### 2. Instructions (`.instructions.md`)

**Instructions** are passive, always-on rules that Copilot silently applies whenever it opens a matching file. They do not require any user action — they are loaded automatically based on file path patterns.

**Two activation modes:**

| Mode | How It Activates | Frontmatter Key |
|---|---|---|
| `applyTo` pattern | Automatically, when a file matching the glob is open | `applyTo: "docs/**/*.md"` |
| `description` | On-demand, Copilot decides based on relevance | `description: "Use when editing Python files"` |

**Example — auto-applied to all markdown files:**

```yaml
---
name: markdown-style
applyTo: "**/*.md"
---

Always add a blank line before bullet lists.
Never use pipe characters inside Mermaid node labels.
Every file must end with the abbreviations snippet.
```

**Good use cases:**

- Enforcing team code style in all Python files
- Ensuring every SQL file follows naming conventions
- Auto-applying MkDocs markdown rules to documentation files

**What instructions cannot do:**

- They cannot invoke tools or run code
- They cannot make Copilot take action — they only shape how it responds

---

### 3. Skills (`SKILL.md`)

A **skill** is an on-demand knowledge package bundled with templates, scripts, and domain context. Unlike instructions (which are always passive), skills are loaded only when triggered by the user or another agent.

**Structure of a skill bundle:**

```
.github/skills/my-skill/
├── SKILL.md          ← Main skill file (loaded into context)
├── templates/        ← Reusable file templates
│   └── article.md
└── scripts/          ← Helper scripts referenced in the skill
    └── validate.sh
```

**A skill is the right choice when:**

- The knowledge is needed only for specific tasks (not all the time)
- You want to bundle reference templates alongside instructions
- You are building a repeatable multi-step workflow with assets

**Comparison: Instructions vs Skills:**

| | Instructions | Skills |
|---|---|---|
| Activation | Automatic (applyTo) or passive | Explicit — user or agent triggers it |
| Assets | None | Can include templates, scripts |
| Best for | Always-on style rules | On-demand domain workflows |

---

### 4. Prompts (`.prompt.md`)

A **prompt** is a parameterized, single-task template. It appears as a slash command in chat and lets you invoke a common workflow with variable inputs.

**Example prompt — create a new doc section:**

```yaml
---
name: new-doc-section
description: "Creates a new MkDocs section with a summary article and placeholder deep-dives"
---

Create a new MkDocs section called "${sectionName}" under the docs/ folder.
Follow the two-tier content model: one summary article (NN-section.md) and
at least two deep-dive placeholders.
```

**Invoke it in chat as:**

```
/new-doc-section sectionName="API Reference"
```

**Skills vs Prompts:**

| | Prompts | Skills |
|---|---|---|
| Appears as | `/prompt-name` (slash command) | `/skill-name` (slash command) |
| Bundled assets | No | Yes (templates, scripts) |
| Best for | Single parameterized tasks | Multi-step workflows with assets |

---

## How Copilot Discovers These Files

Copilot looks in two locations:

**1. Workspace level** — shared with the team via version control:

```
.github/agents/       ← agents
.github/prompts/      ← prompts and skills
.github/instructions/ ← instructions
```

**2. User level** — personal, roams with VS Code settings sync:

```
~/Library/Application Support/Code/User/prompts/   (macOS)
~/.config/Code/User/prompts/                        (Linux)
%APPDATA%\Code\User\prompts\                        (Windows)
```

---

## The `description` Field Is Everything

The `description` field in every frontmatter block is how Copilot's internal planner decides whether to load a file. If the trigger phrases are not in `description`, the agent, instruction, or skill will never be found.

**Pattern that works:**

```yaml
description: "Use when: creating MkDocs articles, updating documentation, adding content to the site"
```

**Pattern that fails:**

```yaml
description: "MkDocs helper"
```

---

## Interview Q&A

??? question "What is the difference between an agent and a prompt?"
    An agent is a persistent persona with always-on instructions and optional tool restrictions — it shapes every response for its entire session. A prompt is a one-shot template invoked via `/prompt-name` for a single task. Agents are heavy; prompts are lightweight.

??? question "Do instructions automatically apply to all files?"
    Only if you set `applyTo` to a matching glob pattern. Without `applyTo`, Copilot uses the `description` field to decide when to load the instruction file — it is passive, not automatic.

??? question "Can a skill call tools?"
    No. A skill is a knowledge document loaded into context, not executable code. It tells Copilot what to do; the agent or Copilot itself executes tool calls.

??? question "Where should I store team-shared agents vs personal agents?"
    Team-shared agents go in `.github/agents/` and are committed to Git. Personal agents go in your user-level prompts folder and roam with VS Code settings sync.

??? question "What happens if two instruction files conflict?"
    Workspace-level instructions take precedence over user-level ones. If two workspace instructions both match a file, both are loaded and Copilot merges them — explicit wins over implicit where there is a contradiction.
