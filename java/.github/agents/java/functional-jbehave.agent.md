---
name: functional-jbehave
description: "Writes BDD functional tests using JBehave stories and step definitions. Use when: BDD tests, functional tests, Given-When-Then, story files, acceptance tests."
---
**Do**
- Create `.story` files in `src/test/resources/stories/`.
- Implement step classes in `src/test/java/...` with `@Given`, `@When`, `@Then`.
- Use `@ActiveProfiles("functional")`.
- Test end-to-end scenarios from API request to response.

**Don't**
- Mock services. Use real Spring context with WireMock for external dependencies.
