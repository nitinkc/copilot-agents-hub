# Three-Level Concept Explanation Prompt

## Reusable Prompt

Explain the concept of **[INSERT CONCEPT HERE]** in **three levels of depth**, tailored to different audiences.

### Level 1 — Explain Like I’m 5
- Assume I am **5 years old**.
- Use **very simple words**, short sentences, and familiar everyday examples.
- Avoid jargon completely.
- Make the explanation friendly, clear, and easy to imagine.
- If helpful, use a short analogy from toys, school, animals, or daily life.

### Level 2 — College-Level Computer Science Graduate
- Assume I am a **college-level computer science graduate**.
- Explain the same concept with **moderate technical depth**.
- Use correct terminology, but keep it understandable and well-structured.
- Include how it works, why it matters, and where it is commonly used.
- If relevant, mention trade-offs, examples, or a simple technical illustration.

### Level 3 — Seasoned Professional
- Assume I am a **seasoned professional**.
- Provide a **precise, advanced, and nuanced explanation**.
- Include deeper technical, architectural, strategic, or domain-specific insights.
- Highlight practical implications, edge cases, limitations, and real-world considerations.
- Compare it with related concepts if useful.

## Output Requirements
- Keep the explanation for all three levels focused on the **same core concept**.
- Start with a **one-line definition** of the concept.
- Then present the explanation in the following markdown format:

```markdown
# [Concept Name]

## One-Line Definition
[Write a concise definition here.]

## Level 1 — Explain Like I’m 5
[Simple explanation]

## Level 2 — College-Level Computer Science Graduate
[Intermediate explanation]

## Level 3 — Seasoned Professional
[Advanced explanation]
```

## Optional Add-ons
If relevant, also include:
- A **real-world example** after each level
- A **short analogy** for Level 1
- A **simple technical example** for Level 2
- A **practical implementation or business consideration** for Level 3

## Copy-and-Use Version

```text
Explain the concept of [INSERT CONCEPT HERE] in three levels of depth for three different audiences.

Level 1: Assume I am 5 years old. Use very simple language, avoid jargon, and explain with a friendly everyday analogy.

Level 2: Assume I am a college-level computer science graduate. Use moderate technical depth, correct terminology, and explain how it works, why it matters, and where it is used.

Level 3: Assume I am a seasoned professional. Provide an advanced explanation with technical nuance, practical implications, trade-offs, edge cases, and real-world considerations.

Start with a one-line definition of the concept, then structure the response in markdown with clear headings for each level.
```

## Example Placeholder

- **Concept:** Distributed Systems
- **Use case:** Learning / interview prep / documentation / teaching

---

You can replace **[INSERT CONCEPT HERE]** with any topic, such as:
- Cloud Computing
- APIs
- Encryption
- Kubernetes
- Large Language Models
- Event-Driven Architecture
- Databases
- Microservices
