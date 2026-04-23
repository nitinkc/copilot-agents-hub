#!/bin/bash

# Setup script for VS Code on macOS/Linux
# Copies agents, prompts, instructions, and skills to VS Code user folder

set -e  # Exit on error

echo "🚀 Setting up Copilot Agents Hub for VS Code..."

# Detect OS and set paths
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  VSCODE_PATH="$HOME/Library/Application Support/Code/User"
  echo "📱 Detected macOS"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  VSCODE_PATH="$HOME/.config/Code/User"
  echo "🐧 Detected Linux"
else
  echo "❌ Unsupported OS. Please use macOS or Linux (or run setup-vscode.ps1 on Windows)"
  exit 1
fi

# Create directories if they don't exist
echo "📁 Creating directories..."
mkdir -p "$VSCODE_PATH/prompts"
mkdir -p "$VSCODE_PATH/skills"

# Copy agents
echo "📋 Copying agents..."
cp .github/agents/*.agent.md "$VSCODE_PATH/prompts/" 2>/dev/null || echo "⚠️  No agents found"

# Copy prompts
echo "📋 Copying prompts..."
cp .github/prompts/*.prompt.md "$VSCODE_PATH/prompts/" 2>/dev/null || echo "⚠️  No prompts found"

# Copy instructions
echo "📋 Copying instructions..."
cp .github/instructions/*.instructions.md "$VSCODE_PATH/prompts/" 2>/dev/null || echo "⚠️  No instructions found"

# Copy skills
echo "🎓 Copying skills..."
if [ -d ".github/skills" ]; then
  cp -r .github/skills/* "$VSCODE_PATH/skills/" 2>/dev/null || echo "⚠️  No skills found"
fi

# Copy workspace settings
echo "⚙️  Applying workspace settings..."
mkdir -p .vscode
if [ -f ".vscode/settings.json" ]; then
  cp .vscode/settings.json "$VSCODE_PATH/settings.json" || echo "⚠️  Could not copy settings.json"
else
  echo "⚠️  .vscode/settings.json not found, skipping..."
fi

# Install recommended extensions
echo "📦 Installing recommended extensions..."
if [ -f ".vscode/extensions.json" ]; then
  # VS Code recommends extensions through extensions.json
  # Manual install would require code CLI
  echo "   (Extensions will be prompted in VS Code)"
else
  echo "⚠️  .vscode/extensions.json not found"
fi

# Validate
echo "✓ Validating setup..."
if [ -f "scripts/validate-agents.sh" ]; then
  bash scripts/validate-agents.sh || echo "⚠️  Validation warnings (non-critical)"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "📍 Files copied to: $VSCODE_PATH"
echo ""
echo "🔄 Next steps:"
echo "  1. Restart VS Code (Cmd+Shift+P → Reload Window)"
echo "  2. Open Copilot Chat (Cmd+Shift+I)"
echo "  3. Type: @ to see available agents"
echo ""
echo "📚 For more info, see:"
echo "  - README.md — Overview"
echo "  - SETUP.md — Detailed setup guide"
echo "  - AGENTS-INDEX.md — Registry of all agents"
