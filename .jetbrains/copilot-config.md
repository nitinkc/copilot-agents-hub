# GitHub Copilot Configuration for IntelliJ IDEA

This guide walks you through setting up GitHub Copilot agents in IntelliJ IDEA (and other JetBrains IDEs).

---

## 📋 Prerequisites

- IntelliJ IDEA 2024.1 or later (Community or Pro)
- GitHub Copilot plugin (install from **Plugins → Marketplace**)
- GitHub account with Copilot access
- Logged into GitHub Copilot within the IDE

---

## 🚀 Setup Instructions

### Step 1: Install GitHub Copilot Plugin

1. Open **IntelliJ IDEA**
2. Go to **IntelliJ IDEA → Preferences** (macOS) or **File → Settings** (Windows/Linux)
3. Navigate to **Plugins → Marketplace**
4. Search for **"GitHub Copilot"**
5. Click **Install**
6. Restart IDE

### Step 2: Authenticate with GitHub

1. Open **Tools → GitHub Copilot**
2. Click **Sign In** or **Authorize**
3. You'll be redirected to GitHub authentication
4. Complete the login flow
5. Return to IntelliJ

### Step 3: Copy Agent Files (Manual Process)

IntelliJ currently requires manual import of custom agents. Here's the process:

#### macOS

```bash
# Navigate to IntelliJ config directory
cd ~/.config/JetBrains/IntelliJIdea2024.1/options

# Create copilot directory if needed
mkdir -p copilot

# Copy agent files from this repo
cp /path/to/copilot-agents-hub/.github/agents/*.agent.md copilot/

# Restart IntelliJ
```

#### Windows (PowerShell)

```powershell
# Navigate to config directory
$ideaPath = "$env:APPDATA\JetBrains\IntelliJIdea2024.1\options\copilot"
mkdir -Force $ideaPath | Out-Null

# Copy agent files
Copy-Item ".\copilot-agents-hub\.github\agents\*.agent.md" $ideaPath
```

#### Linux

```bash
cd ~/.config/JetBrains/IntelliJIdea2024.1/options
mkdir -p copilot
cp /path/to/copilot-agents-hub/.github/agents/*.agent.md copilot/
```

### Step 4: Restart IntelliJ

1. **File → Invalidate Caches** (Recommended for first setup)
2. Click **Invalidate and Restart**
3. IntelliJ will restart

### Step 5: Verify Installation

1. Open **Copilot Chat** panel (View → Tool Windows → GitHub Copilot Chat)
2. Type a message starting with `@`
3. You should see available agents in a dropdown
4. Select an agent and test with a prompt

---

## 🔄 Keeping Agents in Sync

When you update agents in GitHub:

```bash
# Pull latest changes
git pull origin main

# Copy updated agents to IntelliJ config
cp .github/agents/*.agent.md ~/.config/JetBrains/IntelliJIdea2024.1/options/copilot/

# Restart IntelliJ (or invalidate caches)
```

---

## ⚙️ IDE-Specific Configuration

### GitHub Copilot Settings in IntelliJ

**Preferences → Tools → GitHub Copilot:**

- **Enable GitHub Copilot** — Check this box
- **Enable Copilot Chat** — Check this box
- **Preferred Language** — Optionally select your language
- **Show Copilot Status** — Check to see status indicator

### Code Style Settings

Set consistent code style for all IDEs:

**Preferences → Editor → Code Style:**
- **Tab Size:** 2
- **Indent:** 2 spaces
- **Keep indents on empty lines:** Checked
- **Line length:** 100

---

## 🧪 Testing Agents in IntelliJ

### Test 1: Agent Discovery

1. Open Copilot Chat panel
2. Type: `@`
3. **Expected:** See list of agents (e.g., `@mkdocs-content`)
4. Select an agent

### Test 2: Agent Response

1. Keep agent selected
2. Type a test prompt: `Create a new documentation section on "Testing"`
3. **Expected:** Agent responds with domain-specific guidance

### Test 3: In-Editor Chat

1. Right-click in code editor
2. Select **GitHub Copilot Chat**
3. Type: `@your-agent [request]`
4. Agent should respond in the chat panel

---

## 🐛 Troubleshooting

### Agents Not Showing in `@` Picker

**Check:**
1. GitHub Copilot plugin is installed and enabled
2. You're logged into GitHub
3. Agent files are in correct location:
   ```
   ~/.config/JetBrains/IntelliJIdea2024.1/options/copilot/
   ```
4. Agent files have `.agent.md` extension
5. YAML frontmatter is valid

**Fix:**
```bash
# Verify file location
ls -la ~/.config/JetBrains/IntelliJIdea2024.1/options/copilot/

# Re-invalidate caches
# IntelliJ: File → Invalidate Caches → Restart
```

### Agent Selected but Not Responding

**Check:**
1. Agent file has valid YAML frontmatter
2. Agent name is correct (in `name:` field)
3. Description is present
4. No syntax errors in agent instructions

**Fix:**
1. Validate agent file: `bash scripts/validate-agents.sh`
2. Restart IntelliJ
3. Try a simpler test prompt

### "GitHub Copilot Chat" Panel Missing

**Solution:**
1. **View → Tool Windows**
2. Look for **GitHub Copilot Chat**
3. If not present, restart IntelliJ with cache invalidation:
   - **File → Invalidate Caches**

### Different Agent Behavior on IntelliJ vs VS Code

IntelliJ may interpret agent instructions slightly differently than VS Code. If an agent behaves oddly:

1. Test same prompt in VS Code (for reference)
2. Simplify agent instructions if needed
3. File issue in repository

---

## 📋 Version Compatibility

| IntelliJ Version | Copilot Support | Status |
|---|---|---|
| 2024.2+ | Full | ✅ Supported |
| 2024.1 | Partial | ⚠️ May need manual setup |
| 2023.3 | Limited | ❌ Use VS Code instead |

(Check [JetBrains documentation](https://plugins.jetbrains.com/plugin/17718-github-copilot) for latest support)

---

## 🔐 Security

- **No agent files contain secrets** — Use environment variables for credentials
- **GitHub auth is secure** — Uses OAuth2 via GitHub
- **IDE config is private** — Not shared via settings sync

---

## 📚 Related Guides

- [Main README.md](../README.md) — Project overview
- [SETUP.md](../SETUP.md) — VS Code and general setup
- [.github/agents/README.md](../​.github/agents/README.md) — How to add agents
- [AGENTS-INDEX.md](../AGENTS-INDEX.md) — Registry of all agents

---

## 🤝 Contributing Improvements

If you find a way to improve IntelliJ setup (e.g., automation scripts, better config distribution):

1. Document your approach
2. Create a pull request to this repo
3. We'll add it to this guide!

---

**Last Updated:** April 23, 2026  
**IntelliJ Version Tested:** 2024.1+
