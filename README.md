# Copilot Agents Hub

Reusable repository for managing custom GitHub Copilot agents, prompts, instructions, and skills — synced across machines via Git.

## Quick Start

```bash
git clone https://github.com/YOUR-ORG/copilot-agents-hub.git
cd copilot-agents-hub
bash scripts/setup-vscode.sh   # or setup-intellij.sh
# Restart your IDE
```

## Documentation

Full documentation lives in [`docs/`](docs/) and is served with MkDocs:

```bash
bash scripts/serve-docs.sh
# → http://127.0.0.1:8000
```

| Section | Description |
|---|---|
| [Fundamentals](docs/fundamentals/01-core-concepts.md) | What agents, instructions, skills, and prompts are |
| [Intermediate](docs/intermediate/01-working-together.md) | Composition patterns and real-world use cases |
| [Advanced](docs/advanced/01-advanced-patterns.md) | Hooks, multi-agent pipelines, MCP, anti-patterns |
| [IDE Compatibility](docs/ide-compatibility/01-overview.md) | VS Code, JetBrains, Visual Studio, Vim, CLI |

## Agent Registry

See [docs/agents-index.md](docs/agents-index.md) for all available agents.

## Validate Before Committing

```bash
bash scripts/validate-agents.sh
```
