# Copilot Instructions — Agents Hub

This repository contains a comprehensive system for managing custom GitHub Copilot agents, prompts, instructions, and skills. All files are designed to be synced across machines via GitHub and automatically loaded into VS Code or IntelliJ.

---

## 📋 Repository Structure

```
copilot-agents-hub/
├── README.md                           ← Main overview
├── SETUP.md                            ← Detailed setup guide
├── AGENTS-INDEX.md                     ← Registry of all agents
├── .github/
│   ├── copilot-instructions.md         ← Workspace-level instructions
│   ├── AGENTS.md                       ← Agent configuration reference
│   ├── agents/                         ← Custom agent definitions
│   │   ├── 01-mkdocs-content.agent.md
│   │   └── README.md
│   ├── prompts/                        ← Reusable prompt templates
│   │   └── README.md
│   ├── instructions/                   ← File-level instructions
│   │   └── README.md
│   ├── skills/                         ← Skill bundles with templates
│   │   ├── mkdocs-docs/
│   │   │   ├── SKILL.md
│   │   │   ├── SETUP-GUIDE.md
│   │   │   └── templates/
│   │   └── README.md
│   ├── hooks/                          ← Auto-run hooks (optional)
│   └── workflows/                      ← GitHub Actions
├── .vscode/
│   ├── settings.json                   ← VS Code workspace settings
│   └── extensions.json                 ← Recommended extensions
├── .jetbrains/
│   ├── copilot-config.md               ← IntelliJ setup guide
│   └── settings.xml                    ← IDE configuration
└── scripts/
    ├── setup-vscode.sh
    ├── setup-intellij.sh
    └── validate-agents.sh
```

---

## 🚀 Quick Setup

```bash
# Clone repo
git clone https://github.com/YOUR-ORG/copilot-agents-hub.git
cd copilot-agents-hub

# Setup (choose one)
bash scripts/setup-vscode.sh            # For VS Code
bash scripts/setup-intellij.sh          # For IntelliJ

# Restart your IDE
```

---

## 📚 Key Concepts

### **Agents** (`.agent.md`)
Specialized AI personas for specific tasks:
- MkDocs documentation management
- API design and documentation
- Security analysis
- Code review
- *(Add more!)*

**Location:** `.github/agents/`  
**How to use:** `@agent-name` in Copilot Chat

### **Prompts** (`.prompt.md`)
Parameterized single-task workflows:
- Create new documentation section
- Generate API schema from code
- Write unit tests
- *(Add more!)*

**Location:** `.github/prompts/`  
**How to use:** `/prompt-name` in Copilot Chat

### **Instructions** (`.instructions.md`)
File-level auto-applied guidance:
- MkDocs markdown style rules
- Python code standards
- API documentation format
- *(Add more!)*

**Location:** `.github/instructions/`  
**Auto-applies:** When you open matching files (via `applyTo` patterns)

### **Skills** (SKILL bundles)
Reference libraries and templates:
- MkDocs templates and configuration
- REST API patterns
- Documentation best practices
- *(Add more!)*

**Location:** `.github/skills/`  
**How to use:** `/skill-name` in Copilot Chat

---

## 🔄 How It Works Across Machines

1. **All agents are stored in GitHub** (`.github/agents/`, etc.)
2. **Setup scripts symlink or copy files** to your IDE config folder
3. **Changes are synced via Git** (`git push` / `git pull`)
4. **Re-run setup** after pulling to sync new agents

### File Destinations

| OS | Agents Path | Skills Path |
|---|---|---|
| **macOS** | `~/Library/Application Support/Code/User/prompts/` | `~/Library/Application Support/Code/User/skills/` |
| **Linux** | `~/.config/Code/User/prompts/` | `~/.config/Code/User/skills/` |
| **Windows** | `%APPDATA%\Code\User\prompts\` | `%APPDATA%\Code\User\skills\` |

---

## 🎯 How to Use This Repository

### **Adding a New Agent**

1. Create `.github/agents/NN-name.agent.md`
2. Update [AGENTS-INDEX.md](AGENTS-INDEX.md)
3. Test locally:
   ```bash
   bash scripts/setup-vscode.sh
   # Restart VS Code
   # Type: @your-agent [test prompt]
   ```
4. Commit and push

### **Syncing Across Machines**

```bash
# Machine 1 (primary)
# Edit agents, commit, push
git push origin main

# Machine 2 (secondary)
git pull origin main
bash scripts/setup-vscode.sh  # Re-sync
```

### **Contributing Customizations**

1. **Create your customization** (agent, prompt, etc.)
2. **Test thoroughly** on your local machine
3. **Document in README** sections (.github/agents/, etc.)
4. **Commit with clear message**: `Add: agent-name — description`
5. **Push to GitHub**: Other machines pull and auto-load

---

## 🛠️ Workspace Rules

This workspace has **auto-enforced style rules** and **agent preferences**:

- **Default agent**: `mkdocs-content` (for MkDocs projects)
- **Markdown files**: Use 2-space indentation, blank lines before lists
- **YAML config**: Validate before committing
- **Commit messages**: `Add:`, `Update:`, `Remove:` prefixes required
- *(Customize in `.github/copilot-instructions.md`)*

---

## 🔗 Key Files

| File | Purpose |
|------|---------|
| [README.md](README.md) | Project overview and quick start |
| [SETUP.md](SETUP.md) | Detailed setup for VS Code and IntelliJ |
| [AGENTS-INDEX.md](AGENTS-INDEX.md) | Registry of all agents |
| [.github/copilot-instructions.md](.github/copilot-instructions.md) | Workspace-level rules |
| [.github/agents/README.md](.github/agents/README.md) | How to add agents |
| [.jetbrains/copilot-config.md](.jetbrains/copilot-config.md) | IntelliJ setup guide |

---

## ✅ Validation

Run validation before committing:

```bash
bash scripts/validate-agents.sh
```

This checks:
- ✓ All agents have valid YAML frontmatter
- ✓ Agent names match filenames
- ✓ No duplicate agent names
- ✓ All referenced files exist
- ✓ AGENTS-INDEX.md is up-to-date

---

## 🚨 Common Issues

### Agents not appearing in VS Code

```bash
bash scripts/setup-vscode.sh           # Re-sync
# Restart VS Code (Cmd+Shift+P → Reload Window)
```

### YAML parse error

Check `.agent.md` file:
- Quotes around descriptions with colons
- 2-space indentation (never tabs)
- Valid YAML structure

### IntelliJ not recognizing agents

See [`.jetbrains/copilot-config.md`](.jetbrains/copilot-config.md) for IDE-specific setup.

---

## 🤝 Contributing Guidelines

1. **One agent per file** — `NN-name.agent.md` format
2. **Clear descriptions** — Used for auto-discovery in `@` picker
3. **Test before pushing** — Verify agent works locally
4. **Update indexes** — Add entries to [AGENTS-INDEX.md](AGENTS-INDEX.md)
5. **Document in README** sections (`.github/agents/README.md`, etc.)
6. **Use standard commit messages**:
   - `Add: agent-name — short description`
   - `Update: agent-name — what changed`
   - `Remove: agent-name — why removed`

---

## 📖 Next Steps

1. **[Read SETUP.md](SETUP.md)** — Get your IDE configured
2. **[Check AGENTS-INDEX.md](AGENTS-INDEX.md)** — See what's available
3. **[Review .github/agents/README.md](.github/agents/README.md)** — Learn to add agents
4. **[Explore .github/ folders](​.github/)** — See examples

---

## 🔐 Security & Privacy

- **No credentials in configs** — Use environment variables for secrets
- **.gitignore updated** — IDE caches and personal settings excluded
- **All content is shareable** — Nothing sensitive should be committed
- **GitHub-private option** — Make repo private if needed

---

## 📞 Support

- 🐛 **Issues:** Check [GitHub Issues](../../issues)
- 📚 **Docs:** Read [README.md](README.md) and [SETUP.md](SETUP.md)
- ✓ **Validate:** Run `bash scripts/validate-agents.sh`
- 🔍 **Troubleshoot:** See [SETUP.md § Troubleshooting](SETUP.md#troubleshooting)

---

**Last Updated:** April 23, 2026  
**Maintainer:** Your Name/Team  
**Repository:** [GitHub URL]
