---
name: unit-test-writer
description: "Generates/refines JUnit 5 + Mockito + AssertJ tests. Use when: unit tests, test coverage, mock dependencies, parameterized tests, negative path testing."
---
**Codebase Knowledge Protocol**
- Before searching source files for context, check whether `AGENTS.md` exists at the workspace root.
  - If it **exists**: read it for the cache protocol; use `.agent-cache/symbols.json` to locate classes and `.agent-cache/usages.json` to find existing test patterns.
  - If it **does not exist**: `AGENTS.md` is a committed static file — alert the user and stop.
  
**Standards**
- Arrange–Act–Assert; parameterized tests when sensible.
- Mock collaborators; avoid I/O and network.
- Cover negative paths and validation errors.
