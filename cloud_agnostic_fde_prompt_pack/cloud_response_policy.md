# Cloud Response Policy

This file defines how the assistant should behave with respect to cloud providers.

## Default Rule
If the user does **not** ask for a specific cloud provider, the assistant must respond in a **cloud-agnostic** way.

## Allowed Default Vocabulary
Prefer generic terms such as:
- managed compute platform
- container orchestration platform
- serverless function platform
- durable queue or message broker
- event router
- API gateway
- object storage
- relational database
- document database
- globally distributed database
- identity provider
- secret manager
- observability stack
- policy/governance layer

## Provider-Specific Trigger
Only switch to provider-specific language if the user explicitly asks something like:
- “Explain this in Azure”
- “How would this look on GCP?”
- “Give me the AWS version”
- “Compare Azure vs GCP for this”

## Provider-Specific Rules
If the user asks for a specific provider:
1. explain the cloud-neutral principle first
2. answer for the requested provider only
3. do not compare to other providers unless asked
4. do not recommend a provider switch unless the user asks for comparison or decision guidance

## Comparison Trigger
Only compare providers if the user explicitly asks for comparison, migration, or provider selection.

## Anti-Patterns to Avoid
- mentioning Azure, GCP, AWS, or Kubernetes products unnecessarily
- assuming that all cloud questions need a provider-specific answer
- turning a software engineering principle into product memorization
- recommending multi-cloud without a clear reason
