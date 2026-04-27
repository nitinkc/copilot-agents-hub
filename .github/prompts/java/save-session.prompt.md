---
description: "Save current conversation to a markdown file for later reference. Use when: save session, dump conversation, export chat, preserve context, end of day, taking a break, pause work."
name: "Save Session"
argument-hint: "Brief topic name for this session (e.g., 'cdh-agents-setup')"
agent: "agent"
---

# Save Session to Markdown

Create a session summary file so I can resume this work later.

## Output Location

Save to: `sessions/session-{{DATE}}-{{TOPIC}}.md`

Where:
- `{{DATE}}` = today's date in `YYYY-MM-DD` format
- `{{TOPIC}}` = the topic I provided (or infer from conversation if not provided)

If the `sessions/` folder doesn't exist, create it.

## File Structure

Generate a markdown file with this structure:

```markdown
# Session: {{TOPIC}}
**Date**: {{DATE}}
**Status**: In Progress | Completed | Blocked

## Summary
[2-3 sentence overview of what we worked on]

## Key Decisions
- [Bullet list of decisions made during this session]

## Changes Made
- [List files created/modified with brief description]

## Current State
[Where did we leave off? What's the current status?]

## Next Steps
- [ ] [Actionable items to continue this work]

## Context for Resuming
[Any important context, gotchas, or notes needed to pick up where we left off]

## Related Files
- [Links to key files touched in this session]
```

## Instructions

1. Review our conversation history
2. Extract key information for each section
3. Be specific about file paths and changes
4. Make "Next Steps" actionable — I should know exactly what to do when I resume
5. Include any unresolved questions or blockers
6. Create the file and confirm the path

**Important**: Focus on information needed to resume work, not a transcript. Be concise but complete.
