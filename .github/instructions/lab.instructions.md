---
applyTo: "**/lab_*.md, **/labs/**/*.md"
---

# Lab Authoring Standards

These rules apply automatically whenever you edit a `lab_*.md` file or any file under a `labs/` folder.

---

## Required Sections (in this order)

Every lab document **must** contain all five sections:

| # | Section | Heading |
|---|---------|---------|
| 1 | Learning Objectives | `## 🎯 Learning Objectives` |
| 2 | Starter Code reference | `## 🛠️ Starter Code` |
| 3 | Dataset | `## 📦 Dataset` |
| 4 | Evaluation Rubric | `## 📋 Evaluation Rubric` |
| 5 | Expected Outputs | `## ✅ Expected Outputs` |

If any section is missing, add it before saving.

---

## Learning Objectives

- Minimum **3**, maximum **5** objectives
- Every objective must start with a Bloom's Taxonomy action verb:
  - ✅ *implement, construct, apply, evaluate, compare, design, debug, trace, configure*
  - ❌ ~~understand~~, ~~know~~, ~~learn~~, ~~be familiar with~~
- Each objective must be **directly testable** by the rubric

---

## Starter Code

- Reference the companion starter file: `lab_<topic>_starter.<ext>`
- Every TODO must include:
  - Sequential number: `TODO 1`, `TODO 2`, ...
  - Point value in the comment: `# TODO 1 (10 pts): ...`
  - A precise instruction (not just "implement this")
- The starter file must **run without error** before TODOs are filled (use `raise NotImplementedError`)
- Sum of TODO point values must equal the rubric total

---

## Dataset

- Use **domain-realistic data** — no toy arrays, no Lorem Ipsum
- Include at least **one edge case** row (null, empty string, duplicate, zero, outlier)
- Inline datasets (≤20 rows) directly as code blocks
- Larger datasets: provide a generation script

---

## Evaluation Rubric

- Use a **Markdown table** with columns: `TODO | Points | Full credit | Partial credit | No credit`
- Every TODO maps to exactly one rubric row
- Edge case handling must appear as an explicit criterion
- Last row: `**Total** | **XX pts**`
- Optional Bonus row for stretch challenge (+5 pts max)

---

## Expected Outputs

- Show **exact output** for the provided dataset (not a different example)
- Include edge case outputs explicitly
- Add a one-liner `> How to verify: ...` under each output block
- For visual/plot output: describe expected shape (e.g., "bar chart with 4 bars, tallest at 'shipped'")

---

## Style Rules

- Add a blank line before every list
- Use 2-space indentation inside fenced code blocks where applicable
- Code blocks must declare language: ```` ```python ````, ```` ```typescript ```` etc.
- Do not use `|` inside code variable names shown inline in prose — use backticks instead
- Solution files must include a header comment:

  ```
  # ─────────────────────────────────────────────────────
  # SOLUTION FILE — Do not distribute to students
  # ─────────────────────────────────────────────────────
  ```

---

## File Naming Convention

| File | Pattern |
|------|---------|
| Lab document | `lab_<topic>.md` |
| Starter code | `lab_<topic>_starter.<ext>` |
| Solution code | `lab_<topic>_solution.<ext>` |
| Dataset | `data/<topic>_data.<ext>` |

Use `snake_case` for all lab file names.

