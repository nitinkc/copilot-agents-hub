# Getting Started

> Before diving in, make sure you have the right context and understand how this guide is structured.

---

## Prerequisites

You'll get the most from this guide if you have:

| Prerequisite | Why it helps | Learn more |
|---|---|---|
| Basic understanding of your domain | Provides context | [FAQ](00-introduction/02-faq.md) |
| 30 minutes per session recommended | This isn't a quick reference | Bookmark [Quick Reference](reference/01-quick-reference.md) |
| Willingness to experiment | Best learning is hands-on | See practical examples in each section |

**Don't have these?** That's fine — each article links back to prerequisite concepts. You can jump around and come back.

---

## Recommended Reading Order

### First Time Here?
```mermaid
graph TD
    A["📖 Read This Page<br/>(You are here)"]
    A --> B["📍 Learning Path Overview<br/>00-introduction/01-learning-path.md"]
    B --> C["🟢 Fundamentals<br/>01-fundamentals/01-core-concepts.md"]
    C --> D{("Ready for<br/>intermediate?")}
    D -->|Yes| E["🟡 Intermediate<br/>02-intermediate/01-building-blocks.md"]
    D -->|Not yet| F["📍 Review & Practice<br/>Use Reference section"]
    E --> G["🔴 Advanced<br/>03-advanced/01-advanced-patterns.md"]
    F --> E
    
    style A fill:#e3f2fd,stroke:#1976d2
    style C fill:#fff3e0,stroke:#f57f17
    style E fill:#fff3e0,stroke:#f57f17
    style G fill:#ffebee,stroke:#c62828
```

### Jumping to Specific Topics?
1. Use **search** (top of page) to find topics
2. See the **[Quick Reference](reference/01-quick-reference.md)** for fast lookups
3. Articles link to prerequisites automatically

---

## How Articles Are Structured

Every deep-dive article follows this pattern:

- **Level badge** — Beginner 🟢 / Intermediate 🟡 / Advanced 🔴
- **Pre-reading links** — what to read first (if you're new)
- **Plain-language intro** — 2-3 sentences before any jargon
- **Concept explanation** — clear prose with examples
- **Diagram** — visual representation (Mermaid)
- **Math section** — equations when applicable (with explanations)
- **Interview Q&A** — collapsible blocks with model answers
- **Abbreviations** — hover over **underlined terms** for definitions

---

## Key Questions This Guide Answers

This guide provides clear, practical answers to:

- ✓ What is [your topic]?
- ✓ How does it work?
- ✓ When should I use it?
- ✓ How is it different from [similar concept]?
- ✓ What are common interview questions?

See each section for specific questions.

---

## Tips for Getting the Most Value

### 🌙 Dark Mode
Click the **moon icon** ☀️ (top right) to toggle between light and dark modes. Your preference persists.

### 🔍 Search
Use the search box to find topics by keyword. Results include all sections.

### 💾 Bookmarks
Bookmark the [Quick Reference](reference/01-quick-reference.md) and [Interview Q&A](reference/03-interview-qa.md) pages for later.

### 🔗 Sharing Links
Every section has a permalink icon (`🔗`). Click it to copy a shareable link.

### 📱 Mobile
This guide works great on phone, tablet, or desktop. Navigation collapses on smaller screens.

### 📖 Reader Mode
Use your browser's **Reader Mode** (Safari, Firefox, Chrome) for distraction-free reading.

---

## Navigation Guide

### How to Navigate

| Want to... | Do this |
|---|---|
| **Start learning** | Click main topic in left sidebar |
| **Jump to a section** | Use top navigation tabs |
| **Search for keywords** | Use search box (magnifying glass) |
| **Go back** | Click back button or use breadcrumb |
| **Print or PDF** | Use browser's print function (Ctrl+P / Cmd+P) |

### Structure Overview

```
📚 Learning Site
├── 🏠 Home (you started here)
├── 📍 Getting Started (you are here)
├── 📖 Fundamentals (beginner concepts)
├── 📖 Intermediate (building blocks)
├── 📖 Advanced (production patterns)
└── 📖 Reference (quick lookup)
```

---

## Common Questions

??? question "I'm completely new to this topic. Where do I start?"
    Start with [Fundamentals → Core Concepts](../01-fundamentals/01-core-concepts.md). It assumes zero prior knowledge and builds up.

??? question "I already know the basics. Can I skip ahead?"
    Yes! Each section is somewhat independent. Start with [Intermediate → Building Blocks](../02-intermediate/01-building-blocks.md) and jump back to fundamentals if you hit a term you don't know.

??? question "How long does this take to read?"
    Each section takes 20-40 minutes. You don't have to read it all at once. Bookmark your spot and come back.

??? question "Is there a printed version?"
    Use your browser's Print function (Ctrl+P / Cmd+P) to save as PDF. All formatting is preserved.

??? question "Can I download this offline?"
    The [repository](https://github.com/yourname/learning-site-template) contains all source files. Clone it and run `mkdocs serve` locally.

??? question "Can I contribute or suggest improvements?"
    Absolutely! See the [contributing guide](#) in the repository.

---

## What NOT to Expect

❌ This isn't a textbook (too dense, too academic)  
❌ This isn't a reference manual (jump to [Quick Reference](reference/01-quick-reference.md) instead)  
❌ This isn't a video course (no videos, just text + diagrams)  
❌ This isn't an online course (no quizzes or certificates)  

**What you get:** Clear explanations, practical examples, and interview prep in one place.

---

## Ready?

→ **Next: [Learning Path Overview](00-introduction/01-learning-path.md)**

Or jump straight to a section:
- **[🟢 Fundamentals](../01-fundamentals/01-core-concepts.md)** — Start here if you're new
- **[🟡 Intermediate](../02-intermediate/01-building-blocks.md)** — For building blocks
- **[🔴 Advanced](../03-advanced/01-advanced-patterns.md)** — For production patterns
- **[📋 Quick Reference](reference/01-quick-reference.md)** — For fast lookups

---

--8<-- "_abbreviations.md"
