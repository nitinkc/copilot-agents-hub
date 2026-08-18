# How This System Works

You now have **two kinds of files**:

### A. Persona files (reusable — same file works for every subject)
- `1_Tutor_Persona_Generic.md` — one-on-one diagnostic teaching (Test → Diagnose → Teach → Test)
- `2_Editor_Persona_Generic.md` — critical challenger, stress-tests what you already produced
- `3_Advisor_Persona_Generic.md` — baseline, roadmap, sequencing, readiness gates

These never change per subject. They contain no subject-specific content — only *how* the
persona should behave.

### B. State files (one per subject — this is your data)
- `4_Subject_State_Template.md` — copy this once per subject, e.g.:
  - `DSA — State.md`
  - `System Design — State.md`
  - `Spanish — State.md`
  - `Statistics — State.md`

Each copy holds that subject's background, self-assessment, skill matrix, known weak areas,
recurring mistakes, and session history.

---

## Each session, attach two files

**[Persona file] + [Subject State file]**

Example: to tutor yourself on DSA, attach `1_Tutor_Persona_Generic.md` +
`DSA — State.md`. To do a system-design roadmap, attach `3_Advisor_Persona_Generic.md` +
`System Design — State.md`. Same Tutor persona, different subject, different state.

---

## Keeping the State file current

Personas can't edit your files directly — at natural checkpoints they'll output a block like:

```
### STATE FILE UPDATE — [date]
Topic: ...
Level: ...
...
```

Copy that block into the matching section of your subject's State file. Over time this
becomes a real, evidence-based record instead of a self-assessment — the Advisor uses it to
replan, the Tutor uses it to avoid re-teaching what you already know, and the Editor uses it
to target your actual known weak spots instead of generic gotchas.

---

## First time setting up a new subject

1. Copy `4_Subject_State_Template.md` → rename to `[Subject] — State.md`.
2. Fill in Sections 1–4 yourself (target, background, existing exposure, self-assessment).
3. Attach it with the **Advisor** persona first and say *"Begin my assessment."* This
   produces a baseline, a plan, and fills in "Next Recommended Focus."
4. From there, alternate **Tutor** sessions (to build understanding) and **Editor** sessions
   (to stress-test what you've built), checking back in with the **Advisor** periodically
   ("Review my progress").

---

## Note on your existing Roommate persona

`Roommate — Cross-Disciplinary Thinking.md` (the one you already have) is naturally
subject-agnostic already — its whole point is to import outside perspectives regardless of
domain. You can keep using it as-is, or optionally attach a subject's State file with it so
its cross-disciplinary prompts are aimed at your actual current weak spots rather than
generic ones.
