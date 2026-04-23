# 🔧 Setup Guide — Copilot Agents Hub

Detailed instructions for setting up Copilot agents on VS Code or IntelliJ across different machines and operating systems.

---

## 📋 Table of Contents

1. [Quick Setup (All OSes)](#quick-setup--all-oses)
2. [VS Code Setup (Detailed)](#vs-code-setup--detailed)
3. [IntelliJ Setup (Detailed)](#intellij-setup--detailed)
4. [Verify Installation](#verify-installation)
5. [Update and Sync](#update-and-sync)
6. [Troubleshooting](#troubleshooting)

---

## Quick Setup (All OSes)

### Prerequisites

- [ ] Git installed
- [ ] VS Code 1.85+ (with GitHub Copilot extension) OR IntelliJ 2024.1+
- [ ] GitHub account with Copilot access
- [ ] Logged into GitHub Copilot in your IDE

### One-Command Setup

**macOS / Linux:**
```bash
git clone https://github.com/YOUR-ORG/copilot-agents-hub.git
cd copilot-agents-hub
bash scripts/setup-vscode.sh   # For VS Code
# OR
bash scripts/setup-intellij.sh  # For IntelliJ
```

**Windows (PowerShell):**
```powershell
git clone https://github.com/YOUR-ORG/copilot-agents-hub.git
cd copilot-agents-hub
powershell -ExecutionPolicy Bypass -File scripts/setup-vscode.ps1
```

**Done!** Restart your IDE and agents are ready to use.

---

## VS Code Setup (Detailed)

### Option A: Automatic Setup (Recommended)

#### macOS / Linux

```bash
# 1. Clone repository
git clone https://github.com/YOUR-ORG/copilot-agents-hub.git
cd copilot-agents-hub

# 2. Run setup script (creates symlinks)
bash scripts/setup-vscode.sh

# 3. Restart VS Code
# Use Cmd+Shift+P → Reload Window
```

**What the script does:**
- Creates symlinks from repo to VS Code user folder
- Copies workspace settings to `.vscode/settings.json`
- Installs recommended extensions
- Validates all agents

#### Windows (PowerShell)

```powershell
# 1. Clone repository
git clone https://github.com/YOUR-ORG/copilot-agents-hub.git
cd copilot-agents-hub

# 2. Run setup script
powershell -ExecutionPolicy Bypass -File scripts/setup-vscode.ps1

# 3. Restart VS Code
# Press Ctrl+Shift+P → Reload Window
```

### Option B: Manual Setup

If scripts don't work or you prefer manual control:

#### macOS

```bash
# 1. Create VS Code user directories
mkdir -p ~/Library/Application\ Support/Code/User/prompts
mkdir -p ~/Library/Application\ Support/Code/User/skills

# 2. Copy agents
cp .github/agents/*.agent.md ~/Library/Application\ Support/Code/User/prompts/

# 3. Copy prompts
cp .github/prompts/*.prompt.md ~/Library/Application\ Support/Code/User/prompts/

# 4. Copy instructions
cp .github/instructions/*.instructions.md ~/Library/Application\ Support/Code/User/prompts/

# 5. Copy skills
cp -r .github/skills/* ~/Library/Application\ Support/Code/User/skills/

# 6. Restart VS Code
```

#### Linux

```bash
# 1. Create VS Code user directories
mkdir -p ~/.config/Code/User/prompts
mkdir -p ~/.config/Code/User/skills

# 2. Copy all files (same as macOS but use ~/.config/Code/User/)
cp .github/agents/*.agent.md ~/.config/Code/User/prompts/
cp .github/prompts/*.prompt.md ~/.config/Code/User/prompts/
cp .github/instructions/*.instructions.md ~/.config/Code/User/prompts/
cp -r .github/skills/* ~/.config/Code/User/skills/

# 3. Restart VS Code
```

#### Windows

```powershell
# 1. Create VS Code user directories
$vscodePath = "$env:APPDATA\Code\User\prompts"
$skillsPath = "$env:APPDATA\Code\User\skills"
mkdir -Force $vscodePath | Out-Null
mkdir -Force $skillsPath | Out-Null

# 2. Copy files
Copy-Item ".github/agents/*.agent.md" $vscodePath
Copy-Item ".github/prompts/*.prompt.md" $vscodePath
Copy-Item ".github/instructions/*.instructions.md" $vscodePath
Copy-Item ".github/skills" $skillsPath -Recurse

# 3. Restart VS Code
```

### Verify Installation

1. **Restart VS Code** (Cmd+Shift+P → Reload Window)
2. **Open Copilot Chat** (Cmd+Shift+I)
3. Type **`@`** in the chat input
4. You should see **`@mkdocs-content`** and other agents in the dropdown

---

## IntelliJ Setup (Detailed)

### Prerequisites

- IntelliJ IDEA 2024.1+ (Community or Pro)
- GitHub Copilot plugin installed
- Logged into GitHub Copilot

### Option A: Guided Setup Using IDE

1. **Open IntelliJ Settings**
   - Mac: `⌘ + ,`
   - Windows/Linux: `Ctrl + Alt + S`

2. **Navigate to Tools → GitHub Copilot**

3. **Look for "Agent Configuration" or "Custom Agents"**
   - Not yet built into standard IntelliJ (you'll need to configure manually)

### Option B: Manual Configuration (Recommended for Now)

Since IntelliJ's agent system is still evolving, here's the manual approach:

#### Step 1: Copy Agent Files to IDE Config

**macOS:**
```bash
# Create custom config directory
mkdir -p ~/.config/JetBrains/IntelliJIdea2024.1/options/copilot

# Copy agent files
cp .github/agents/*.agent.md ~/.config/JetBrains/IntelliJIdea2024.1/options/copilot/
```

**Windows:**
```powershell
$intellijPath = "$env:APPDATA\JetBrains\IntelliJIdea2024.1\options\copilot"
mkdir -Force $intellijPath | Out-Null
Copy-Item ".github/agents/*.agent.md" $intellijPath
```

**Linux:**
```bash
mkdir -p ~/.config/JetBrains/IntelliJIdea2024.1/options/copilot
cp .github/agents/*.agent.md ~/.config/JetBrains/IntelliJIdea2024.1/options/copilot/
```

#### Step 2: Configure IDE Settings

See [`.jetbrains/copilot-config.md`](.jetbrains/copilot-config.md) for detailed IDE-specific configuration.

#### Step 3: Restart IntelliJ

**File → Invalidate Caches** (recommended for first setup)

Then restart the IDE.

### Verify Installation

1. **Open Copilot Chat** (View → Tool Windows → GitHub Copilot Chat)
2. **Type `@` to see agents**
3. **Select an agent and test a prompt**

---

## Verify Installation

### VS Code Verification

```bash
# Check symlinks (macOS/Linux)
ls -la ~/Library/Application\ Support/Code/User/prompts/ | grep agent

# OR run validation script
bash scripts/validate-agents.sh
```

### IntelliJ Verification

1. Open Copilot Chat panel
2. Type message starting with `@`
3. See list of available agents
4. Select an agent and test

---

## Update and Sync

### Keep Agents in Sync Across Machines

After pulling latest changes from GitHub:

**macOS / Linux:**
```bash
git pull origin main
bash scripts/setup-vscode.sh   # Re-sync symlinks and settings
```

**Windows:**
```powershell
git pull origin main
powershell -ExecutionPolicy Bypass -File scripts/setup-vscode.ps1
```

This ensures:
- All agents are up-to-date
- New agents are automatically loaded
- Settings are current

---

## Troubleshooting

### Problem: Agents Not Appearing in VS Code

**Solution 1: Restart VS Code**
```
Cmd+Shift+P → Reload Window (or Ctrl+Shift+P on Windows/Linux)
```

**Solution 2: Check Symlinks**
```bash
# macOS
ls -la ~/Library/Application\ Support/Code/User/prompts/

# Should show *.agent.md files
# If symlinks are broken, re-run setup
bash scripts/setup-vscode.sh
```

**Solution 3: Verify Permissions**
```bash
# Ensure VS Code has read permissions
chmod -R u+rX ~/Library/Application\ Support/Code/User/prompts/
```

### Problem: YAML Frontmatter Errors

**Error:** `Invalid YAML in agent file`

**Solution:**
- Check that agent file has `---` at start and end of frontmatter
- Verify indentation (use 2 spaces, never tabs)
- Quote colons in descriptions: `description: "Use when: doing X"`

Example:
```yaml
---
name: my-agent
description: "Use when: specific task here"  # Quote if description has colons
---
```

### Problem: Copilot Chat Prompt Doesn't Appear

**Solution 1: Check File Extension**
- Prompts should be `.prompt.md` not `.prompt` or `.md`
- Same for instructions: `.instructions.md`
- Same for agents: `.agent.md`

**Solution 2: Check Directory Structure**
```
~/Library/Application Support/Code/User/prompts/
├── mkdocs-content.agent.md              ✓ (agent)
├── mkdocs-new-section.prompt.md         ✓ (prompt)
├── mkdocs-markdown.instructions.md      ✓ (instruction)
└── skills/
    └── mkdocs-docs/
        └── SKILL.md                     ✓ (skill)
```

### Problem: Different Results on Different Machines

**Cause:** Git might have different line endings (CRLF vs LF)

**Solution:**
```bash
# Configure Git to use LF globally
git config --global core.autocrlf false
git config --global core.safecrlf warn

# Re-clone repo
cd ..
rm -rf copilot-agents-hub
git clone https://github.com/YOUR-ORG/copilot-agents-hub.git
bash scripts/setup-vscode.sh
```

### Problem: IntelliJ Not Recognizing Agents

**Check:**
1. GitHub Copilot plugin is installed and enabled
2. You're logged into GitHub Copilot in IntelliJ
3. Agent files are in correct config directory
4. Agent files have valid YAML frontmatter

**Solution:**
```bash
# Reload IDE configuration
# IntelliJ: File → Invalidate Caches → Restart
```

### Problem: Permission Denied on Scripts

**macOS / Linux:**
```bash
# Make scripts executable
chmod +x scripts/*.sh

# Then re-run
bash scripts/setup-vscode.sh
```

**Windows PowerShell:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
powershell -File scripts/setup-vscode.ps1
```

---

## Testing Agents

After setup, test an agent:

### In VS Code

1. Open **Copilot Chat** (Cmd+Shift+I)
2. Type: `@mkdocs-content Create a new documentation section on "Testing"`
3. The agent should respond with MkDocs-specific guidance

### In IntelliJ

1. Open **Copilot Chat** (View → Tool Windows → GitHub Copilot Chat)
2. Type: `@mkdocs-content Create a new documentation section on "Testing"`
3. The agent should respond

---

## Next Steps

- ✅ Setup complete!
- 📚 Read [AGENTS-INDEX.md](../AGENTS-INDEX.md) to learn about available agents
- 🚀 Check [README.md](../README.md) for usage examples
- ➕ [Add your own agents](.github/agents/README.md) following the template

---

## Quick Reference: Key Paths

| OS | Agents Path | Skills Path |
|---|---|---|
| **macOS** | `~/Library/Application Support/Code/User/prompts/` | `~/Library/Application Support/Code/User/skills/` |
| **Linux** | `~/.config/Code/User/prompts/` | `~/.config/Code/User/skills/` |
| **Windows** | `%APPDATA%\Code\User\prompts\` | `%APPDATA%\Code\User\skills\` |

---

## Still Having Issues?

1. **Check GitHub Issues:** [Project Issues Page]
2. **Run validation:** `bash scripts/validate-agents.sh`
3. **Review logs:** Check VS Code Output panel (View → Output)
4. **Read troubleshooting:** Section above

---

**Last Updated:** April 23, 2026
