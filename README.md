# Copilot Agents Hub

Reusable repository for managing custom GitHub Copilot agents, prompts, instructions, and skills — synced across machines via Git.

[https://nitinkc.github.io/copilot-agents-hub/](https://nitinkc.github.io/copilot-agents-hub/)
## Quick Start

```bash
git clone https://github.com/nitinkc/copilot-agents-hub.git
cd copilot-agents-hub
bash scripts/setup-vscode.sh   # or setup-intellij.sh
# Restart your IDE
```

## Documentation

Full documentation lives in [`docs/`](docs/) and is served with MkDocs.

**Option 1 — convenience script (installs deps automatically):**

```bash
bash scripts/serve-docs.sh
# → http://127.0.0.1:8000
```

**Option 2 — manual steps:**

```bash
# 1. Create and activate a virtual environment
python3 -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate

# 2. Install dependencies
pip install -r requirements.txt

# 3. Serve locally
mkdocs serve
# → http://127.0.0.1:8000

# 4. (Optional) Build static site
mkdocs build
# → output in site/
```

| Section | Description |
|---|---|
| [Fundamentals](docs/fundamentals/01-core-concepts.md) | What agents, instructions, skills, and prompts are |
| [Intermediate](docs/intermediate/01-working-together.md) | Composition patterns and real-world use cases |
| [Advanced](docs/advanced/01-advanced-patterns.md) | Hooks, multi-agent pipelines, MCP, anti-patterns |
| [IDE Compatibility](docs/ide-compatibility/01-overview.md) | VS Code, JetBrains, Visual Studio, Vim, CLI |

## 🚀 scaffold-learning-site — Quick Usage Demo

Use `/scaffold-learning-site` to generate a complete MkDocs learning tutorial project for any topic.

**Invoke it in Copilot Chat like this:**

```
/scaffold-learning-site
Topic: RAG Search & Vector Databases
Key questions:
- How does cosine similarity work mathematically?
- How do you prevent "Order #1766" matching "Order #1767"?
- What is the difference between lexical and semantic search?
```

```
/scaffold-learning-site
Topic: Database Engineering
Sections: SQL vs NoSQL, ACID, Normalization, Indexing, Replication, Caching
Cloud implementations: Spanner, BigQuery, DynamoDB, Cassandra, MongoDB, PostgreSQL
```

**Where each piece lives:**

| File type | Location | Purpose |
|---|---|---|
| **Prompt** — `/scaffold-learning-site` | `.github/prompts/scaffold-learning-site.prompt.md` | The invocable command; tells Copilot what to do |
| **Skill** — reference library | `.github/skills/scaffold-learning-site/SKILL.md` | Conventions, token map, template index |
| **Templates** | `.github/skills/scaffold-learning-site/templates/` | Reusable file starters (mkdocs.yml, CSS, JS, article layouts) |
| **Instructions** — auto-rules | `.github/instructions/application-instructions/mkdocs.instructions.md` | Style rules applied automatically when editing `docs/**/*.md` or `mkdocs.yml` |
| **Agent** — persona | `.github/agents/01-mkdocs-content.agent.md` | `@mkdocs-content` — manages article creation, nav, cross-references |

**Rule of thumb for where to put what:**

| Content type | Goes in |
|---|---|
| AI persona, role, decision logic, step-by-step workflows | **Agent** (`.agent.md`) |
| Coding/style rules, known issues, templates auto-applied to files | **Instructions** (`.instructions.md`) |
| Single-shot reusable task commands | **Prompts** (`.prompt.md`) |
| Reference libraries, file templates, scaffolding patterns | **Skills** (`SKILL.md` + `templates/`) |

---

## Agent Registry

See [docs/agents-index.md](docs/agents-index.md) for all available agents.

## Validate Before Committing

```bash
bash scripts/validate-agents.sh
```
