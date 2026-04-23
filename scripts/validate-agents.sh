#!/bin/bash

# Validation script for Copilot agents
# Checks YAML syntax, file naming, duplicates, and completeness

set -e

ERRORS=0
WARNINGS=0
AGENTS_FOUND=0

echo "🔍 Validating Copilot Agents Hub..."
echo ""

# Check for required files
echo "📋 Checking required files..."
if [ ! -f "AGENTS-INDEX.md" ]; then
  echo "❌ ERROR: AGENTS-INDEX.md not found"
  ERRORS=$((ERRORS + 1))
else
  echo "✓ AGENTS-INDEX.md found"
fi

if [ ! -f "README.md" ]; then
  echo "❌ ERROR: README.md not found"
  ERRORS=$((ERRORS + 1))
else
  echo "✓ README.md found"
fi

# Check agents
echo ""
echo "🤖 Checking agents (.agent.md files)..."
for agent_file in .github/agents/*.agent.md; do
  if [ ! -f "$agent_file" ]; then
    continue
  fi
  
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  agent_name=$(basename "$agent_file" | sed 's/^[0-9]*-//' | sed 's/\.agent\.md$//')
  echo ""
  echo "  📄 $agent_file"
  
  # Check YAML frontmatter
  if ! head -1 "$agent_file" | grep -q "^---"; then
    echo "    ❌ ERROR: Missing opening --- delimiter"
    ERRORS=$((ERRORS + 1))
  else
    echo "    ✓ Valid YAML start"
  fi
  
  # Check closing delimiter
  if ! grep -q "^---$" "$agent_file"; then
    echo "    ❌ ERROR: Missing closing --- delimiter"
    ERRORS=$((ERRORS + 1))
  fi
  
  # Check for name field
  if ! grep -q "^name:" "$agent_file"; then
    echo "    ❌ ERROR: Missing 'name:' field in frontmatter"
    ERRORS=$((ERRORS + 1))
  else
    echo "    ✓ Name field present"
  fi
  
  # Check for description
  if ! grep -q "^description:" "$agent_file"; then
    echo "    ⚠️  WARNING: Missing 'description:' field"
    WARNINGS=$((WARNINGS + 1))
  else
    echo "    ✓ Description present"
  fi
  
  # Check indentation
  if grep -E "^\t" "$agent_file" > /dev/null; then
    echo "    ❌ ERROR: File contains tabs (use spaces)"
    ERRORS=$((ERRORS + 1))
  else
    echo "    ✓ No tabs (spaces only)"
  fi
done

if [ $AGENTS_FOUND -eq 0 ]; then
  echo "  ⚠️  WARNING: No agents found in .github/agents/"
  WARNINGS=$((WARNINGS + 1))
fi

# Check for duplicate agent names
echo ""
echo "🔍 Checking for duplicate agent names..."
if command -v sort &> /dev/null; then
  agent_names=$(grep "^name:" .github/agents/*.agent.md 2>/dev/null | cut -d: -f2 | sort)
  if [ ! -z "$agent_names" ]; then
    duplicates=$(echo "$agent_names" | uniq -d)
    if [ ! -z "$duplicates" ]; then
      echo "❌ ERROR: Duplicate agent names found:"
      echo "$duplicates" | sed 's/^/  - /'
      ERRORS=$((ERRORS + 1))
    else
      echo "✓ No duplicate names"
    fi
  fi
fi

# Check AGENTS-INDEX.md entries
echo ""
echo "📑 Checking AGENTS-INDEX.md..."
expected_agents=$AGENTS_FOUND
indexed_agents=$(grep -c "^| " AGENTS-INDEX.md || true)
if [ $indexed_agents -lt $expected_agents ]; then
  echo "⚠️  WARNING: AGENTS-INDEX.md may be incomplete"
  echo "  Expected at least $expected_agents entries, found $indexed_agents"
  WARNINGS=$((WARNINGS + 1))
else
  echo "✓ AGENTS-INDEX.md appears complete"
fi

# Summary
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ VALIDATION SUMMARY"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Agents found: $AGENTS_FOUND"
echo "  Errors: $ERRORS"
echo "  Warnings: $WARNINGS"
echo ""

if [ $ERRORS -gt 0 ]; then
  echo "❌ Validation FAILED with $ERRORS error(s)"
  echo ""
  echo "Please fix the errors above before committing."
  exit 1
elif [ $WARNINGS -gt 0 ]; then
  echo "⚠️  Validation PASSED with $WARNINGS warning(s)"
  echo ""
  echo "Consider fixing the warnings, but not required."
  exit 0
else
  echo "✅ Validation PASSED - Everything looks good!"
  exit 0
fi
