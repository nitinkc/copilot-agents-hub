# Slash Commands vs Agents — `/` vs `@`

> **Level:** Beginner (Clarification)
> **Pre-reading:** [Fundamentals · Core Concepts](01-core-concepts.md)

---

## Quick Answer

- **`/something`** — One-off task execution (prompts & skills)
- **`@something`** — Persistent agent activation for multi-turn conversations

They serve fundamentally different purposes and are often used together.

---

## `/` Slash Commands

A **slash command** invokes a specific, parameterized task. It runs once, completes, and returns a result. No persistent state.

**Activation:**

```
/new-doc-section sectionName="API Reference"
/generate-tests filePath="src/utils.ts"
/validate-schema filePath="schema.yaml"
```

**What they execute:**

| Type         | File         | Purpose                                                    |
|:-------------|:-------------|:-----------------------------------------------------------|
| **Prompts**  | `.prompt.md` | Single-purpose, parameterized workflows with inputs        |
| **Skills**   | `SKILL.md`   | Multi-step workflows bundled with templates and scripts    |
| **Built-in** | —            | Copilot's native commands: `/explain`, `/fix`, `/optimize` |

**Behavior:**

- User types `/command-name [parameters]`
- Copilot executes once
- Returns a single result
- No context carries to the next invocation (unless part of the same agent session)
- Good for isolated, one-off tasks

**Example:**

```
User: /generate-boilerplate language=python projectType=flask
Tool: Generates Flask app scaffold
User: [reads result, manually integrates or discards]
(One-off operation complete)
```

---

## `@` Agent/Context References

An **@ reference** activates something in the context of the current conversation and shapes all subsequent responses.

**Activation:**

```
@mkdocs-content
@code-reviewer
@workspace
@#file.ts
@SomeClass
```

**What they activate:**

| Type            | Reference                     | Effect                                                                  |
|:----------------|:------------------------------|:------------------------------------------------------------------------|
| **Agent**       | `@agent-name`                 | Loads `.agent.md` — persistent persona, tool restrictions, instructions |
| **Workspace**   | `@workspace`                  | Pulls repo structure and metadata into context                          |
| **File**        | `@#file.ts`                   | Includes specific file content in context                               |
| **Code symbol** | `@ClassName`, `@functionName` | Brings that symbol's definition into context                            |

**Behavior:**

- User types `@something` once per conversation
- All subsequent responses use that agent's instructions and rules
- Agent stays active until user switches to a different `@agent`
- Tool restrictions are enforced throughout the session
- Good for multi-turn conversations with consistent rules

**Example:**

```
User: @test-writer
Agent: Loads test-writing instructions, tool restrictions, conventions

User: Write tests for src/utils.ts
Agent: Generates tests following test-writer rules

User: Now add type safety comments
Agent: Still active—adds comments while respecting test-writer rules

User: Create a coverage report
Agent: Runs coverage check, respects tool restrictions, reports
(Multi-turn conversation—agent remains active)
```

---

## Direct Comparison

| Aspect                 | `/` Slash Command                  | `@` Agent/Context                          |
|:-----------------------|:-----------------------------------|:-------------------------------------------|
| **Activation**         | Explicit invocation for one task   | Active for entire session                  |
| **Persistence**        | Single-use                         | Persists across multiple turns             |
| **Parameter syntax**   | `/prompt-name param=value`         | `@agent-name [then ask questions]`         |
| **Scope**              | Isolated operation                 | Session-wide ruleset                       |
| **Tool restrictions**  | Not enforced                       | Enforced throughout session                |
| **Instructions**       | Applied once to that task          | Applied to every response                  |
| **Context carry-over** | None (unless in agent session)     | Yes (full context maintained)              |
| **Best for**           | Isolated, parameterized tasks      | Multi-turn workflows with consistent rules |
| **Examples**           | `/new-doc-section`, `/fix-imports` | `@mkdocs-content`, `@code-reviewer`        |

---

## Layering: Using Both Together

**They often work together:**

```
@code-reviewer
(Agent is now active)

User: Review this function for security issues
Agent: Uses code-reviewer rules to analyze

User: /suggest-fixes
(Slash command runs within agent's context)
Copilot: Generates fixes respecting code-reviewer tool restrictions

User: Write unit tests
(Still in code-reviewer agent context)
Agent: Attempts test generation (may fail if tests not in allowed tools)
```

**Order matters:**

```
Scenario 1: @agent-name /skill-name
→ Skill runs within agent's context and restrictions

Scenario 2: /skill-name @agent-name
→ Skill runs first (no agent context), then agent activates
   (Less useful—lost the skill's context)
```

---

## Mental Model: Theater Analogy

```
/ Slash Command = One-act play
  └─ You request a specific performance
  └─ Actors perform once
  └─ Curtain closes
  └─ Next performance is independent

@ Agent = Long-running play with a consistent ensemble cast
  └─ You hire an acting troupe (the agent)
  └─ The same performers stay in character for the whole show
  └─ Consistency across multiple scenes
  └─ Next scene, same rules apply
```

---

## Common Patterns

### Pattern 1: Agent-Driven Multi-Turn Workflow

```
@mkdocs-content

User: Create a new section on "Security Best Practices"
Agent responds (with mkdocs conventions)

User: Add a deep-dive article on OAuth2
Agent responds (still following mkdocs rules)

User: Generate a table of contents
Agent responds (respects mkdocs structure)
```

**Why:** Multi-turn workflow needs consistent rules and context.

---

### Pattern 2: One-Off Slash Command (No Agent)

```
/generate-readme projectName="copilot-agents-hub"
(Returns readme, done)
```

**Why:** Single task, no need for persistent context.

---

### Pattern 3: Slash Command Within Agent Context

```
@test-writer

User: Analyze src/utils.ts
(Agent analyzes)

User: /generate-tests-from-analysis
(Slash command runs within test-writer rules)

Agent: Generates tests respecting tool restrictions
```

**Why:** Agent provides ongoing context; slash command executes specific subtask.

---

## Interview Q&A

??? question "Can I use both `/` and `@` in the same message?"
    Yes. Example: `@code-reviewer /generate-tests src/handler.ts`. The agent is activated, then the slash command runs within that agent's context (subject to its tool restrictions and instructions).

??? question "If I invoke a slash command, does it need an agent context?"
    No. Slash commands work standalone — you don't need an `@agent` active. But if an agent *is* active, the slash command inherits that agent's rules.

??? question "Can a slash command override an agent's tool restrictions?"
    No. If an agent has `tools: [read_file, create_file]` (no shell), a `/run-bash` command will fail because `run_in_terminal` is not in the allowed tools list. Agent restrictions always apply.

??? question "What happens if I switch agents mid-conversation?"
    The new agent becomes active. All previous responses using the old agent's context are preserved in history, but new responses follow the new agent's rules. Good for: pivoting to a different specialist. Bad for: losing previous chain-of-thought consistency.

??? question "Is there a limit to how many slash commands I can invoke in one conversation?"
    No hard limit, but context window fills up. Each `/command` consumes tokens. Eventually you'll hit the model's context limit and the conversation becomes too cluttered. Rule of thumb: keep to 5–10 slash commands per session.

??? question "Should I create a prompt or an agent?"
    Use a **prompt** (`/prompt.md`) if the task is short, one-off, and parameterized. Use an **agent** (`@agent.md`) if the task requires multi-turn conversations, persistent context, or tool restrictions.

??? question "Can an agent spawn a slash command?"
    Not directly via the agent body. But agents can *invoke subagents* (using the `runSubagent` tool), which is a different mechanism — more powerful for complex orchestration.
