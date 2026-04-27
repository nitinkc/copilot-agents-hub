---
description: "Quick start guide for using agents, skills, and instructions from ai-core. Learn what assets are available, how they work together, and which ones to use for your workflow."
applyTo: "README.md, docs/guides/**/*.md"
---

# Getting Started with AI Core

Welcome to the centralized AI agent repository! This guide will show you how to get the agents, skills, and instructions into your workspace and start using them immediately.

---

## What You're Getting

When your repo syncs from **ai-core**, you receive:

| Asset Type | Count | What It Is |
|---|---|---|
| **Agents** | 12-15 | Specialized AI roles for coding tasks (design, implement, test, review, etc.) |
| **Skills** | 1-2 | Deep expertise packages for complex domains (Databricks, infrastructure) |
| **Instructions** | 2-5 files | Tech-stack conventions and best practices |
| **Prompts** | 1-2 | Reusable prompt templates |
| **Templates** | 2-4 | Design templates and code examples |
| **Guides** | 2-5 | How-to documentation |

---

## ⚡ Quick Start (5 minutes)

### Step 1: Pull the Latest Sync

When the auto-sync workflow runs, a PR is created on your repo with the latest agents and assets. **Approve and merge it.**

### Step 2: Discover Available Agents

Once merged, agents are ready to use. For Java/Spring Boot teams:

```bash
# In VS Code, open chat and type:
@java-squad
# Shows the squad orchestrator for coordinated multi-agent workflows
```

For Databricks teams:

```bash
@agent-dab-generator
# Generates project-specific DAB agents
```

For Infrastructure teams:

```bash
# The GoBrew skill is available as a slash command - no agent needed
# Type: /
# Then search for "GoBrew" or "resource"
```

### Step 3: Use an Agent

Example: Create a design document

```bash
@tech-designer
# Describe your feature in chat
# Agent reads requirements → creates design doc → suggests next agent
```

Then continue with:

```bash
@lead-architect
# Agent reviews design, creates ADR, proposes code structure
```

Then implement:

```bash
@implementer
# Agent reads design, plans implementation, writes production code
```

---

## 🗂️ Asset Guide by Tech Stack

### Java / Spring Boot

**If your repo is tagged `java`**, you have:

- **12 Agents**: java-squad, tech-designer, implementer, reviewer, unit-test-writer, int-testcontainers, functional-jbehave, and more
- **Instructions**: Java conventions, Cassandra patterns
- **Templates**: README template, event processor design, syndication design
- **Guides**: Squad workflow guide, agent flow diagram

**Key pattern: Use the squad**

```
@java-squad
  → Plan feature
    → @tech-designer (design doc)
    → @lead-architect (architecture)
    → @implementer (code)
    → @unit-test-writer (tests)
    → ... → reviewer
```

### Databricks / PySpark

**If your repo is tagged `databricks`**, you have:

- **2 Meta-Agents**: agent-dab-generator, agent-functional-tests-generator (Tier 1 → Tier 2 pattern)
- **1 Skill**: Databricks streaming platform (1,200+ lines)
- **Instructions**: Databricks data flow patterns
- **Templates**: Scala test templates, notebook patterns
- **Guides**: Meta-agent generation guides

**Key pattern: Use meta-agents for fast artifact creation**

```
@agent-dab-generator
  → Analyzes your project
    → Creates project-specific agent (Tier 2)
    → Use that agent 100+ times for DAB bundles
```

### Infrastructure / Azure

**If your repo is tagged `infrastructure`**, you have:

- **1 Skill**: GoBrew platform engineer (56 Azure resource types)
- **35+ Resource Docs**: Detailed YAML examples for all resource types
- **Instructions**: GitOps patterns, YAML conventions
- **Templates**: YAML examples

**Key pattern: Discover resource types via slash command**

```
# Type "/" in chat, search "GoBrew" or "resource-yaml"
# Agent helps you create/update Azure resource YAML files
# Example: "Create a storage account for dev environment"
```

### Shared Assets

**All repos get:**

- **readme-generator** agent for generating READMEs
- **save-session** prompt for saving context
- **Cross-org standards** instructions

---

## 📚 Common Workflows

### Scenario 1: Start a New Java Feature

1. **Invoke squad**: `@java-squad` + describe feature
2. **Review plan**: Agent suggests phases and team
3. **Design phase**: `@tech-designer` → creates design doc
4. **Architecture**: `@lead-architect` → reviews design + creates seed PR
5. **Implement**: `@implementer` → writes production code
6. **Test**: `@unit-test-writer` + `@int-testcontainers` + `@functional-jbehave`
7. **Review**: `@reviewer` → final pre-merge audit
8. **Merge**: Ready to go!

**Time savings**: 60-70% faster than manual workflow (avg 4-6 hours → 1-2 hours)

### Scenario 2: Create Databricks DAB Bundle

1. **Generate meta-agent**: `@agent-dab-generator` + your project name
2. **Customize agent**: Answers 5-6 questions about your environment (clusters, topics, etc.)
3. **Use specialized agent**: `@agent-dab-my-project` + "Create DAB for Kafka→AEP"
4. **Get bundle**: Agent generates databricks.yml + workflow YAML + test
5. **Commit**: Ready to deploy!

**Time savings**: 80-92% faster than manual (avg 3-5 hours → 20-25min)

### Scenario 3: Provision Azure Infrastructure

1. **Describe needs**: "Create a storage account in westus for development"
2. **Use skill**: Slash command for GoBrew resource provisioning
3. **Customize YAML**: Agent populates .github/skills/infrastructure YAML config
4. **Commit**: Terraform picks up changes; infrastructure provisioned
5. **Check status**: Monitor ADO pipeline

**Time savings**: 75-85% faster than manual YAML (avg 1-2 hours → 15-30min)

---

## 🔍 Where to Find Assets

All synced assets are in your repo under:

```
.github/
  ├── agents/        # All agents (.agent.md files)
  ├── skills/        # Domain skills (SKILL.md files)
  └── instructions/  # Tech-stack conventions
docs/
  ├── templates/     # Design and code templates
  └── guides/        # Integration how-to guides
prompts/            # Reusable prompts
```

**Bonus**: Reference docs synced to `.github/agent-inventory.md` and `.github/repo-mapping.yml` for offline access.

---

## ❓ FAQ

### Q: How often does my repo sync with ai-core?
**A**: Daily (2 AM UTC) or when you manually trigger the workflow. You'll get a PR for review each time.

### Q: Can I customize agents for my project?
**A**: Yes! Agents sync to `.github/agents/` as plain Markdown files. You can add org-specific guardrails or adjust instructions. The sync workflow detects local changes and creates a " review needed" PR rather than force-pushing.

### Q: What if my agent version differs from ai-core?
**A**: The sync workflow is smart—it only updates if ai-core changed. If you locally modified an agent, you'll see a PR asking to review the diff. Merge selectively.

### Q: Can I use multiple agents in one workflow?
**A**: Absolutely! The squad pattern (for Java) is exactly that—multiple agents coordinating. For custom workflows, chain agents: invoke one agent, then use its output to invoke another.

### Q: What if I need help?
**A**: Check the guides in `docs/guides/{tech-stack}/` or read the individual agent descriptions (each has "Use when..." keywords). See [INTEGRATION_GUIDE.md](INTEGRATION_GUIDE.md) for customization patterns.

---

## 📞 Next Steps

1. **Explore your tech-stack guide**: `docs/guides/{java|databricks|infrastructure}/`
2. **Try an agent**: Pick one from `.github/agents/` and invoke it in chat
3. **Customize if needed**: Edit .github/instructions/ for org-specific rules
4. **Give feedback**: Create issue in ai-core repo with label `usage-feedback`

---

**Happy coding!** 🚀

---

*For maintaining agents, see [MAINTAINING_ASSETS.md](MAINTAINING_ASSETS.md).*
