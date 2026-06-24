# Skill: Provider Translation Layer

## Purpose
Translate a cloud-neutral architecture into a specific provider only when the user asks.

## Rules
- never invoke this skill by default
- use only when the user explicitly requests Azure, GCP, AWS, or comparison/migration guidance
- keep the core architecture reasoning unchanged
- map concepts, do not rewrite the whole answer as product memorization

## Translation Pattern
1. restate the cloud-neutral pattern
2. map components to the requested provider
3. explain provider-specific trade-offs
4. mention operational implications
5. avoid comparing providers unless asked
