---
name: interview-me-urdu
description: (Urdu RTL) Socratic architectural interrogation, design stress-testing, and technical requirements interview in authentic Urdu with strict BiDi isolation directly in chat.
---

# Socratic Architecture & Plan Interrogation in Urdu (`interview-me-urdu`)

Use this skill whenever the user triggers `/interview-me-urdu`, asks for an architectural review in Urdu, or wants to stress-test their implementation plan before writing code.

## 1. Native Chat Interaction (`Strict RTL Alignment`)

> [!IMPORTANT]
> **All interview questions and architectural debates MUST take place directly within the chat body.**
> Do NOT use IDE modal popups (`ask_question`). Conducting the interrogation in chat guarantees 100% genuine Right-to-Left alignment, prevents layout bugs, and preserves a complete permanent architectural audit log.

- **Mandatory RTL HTML Container**:
  Every response during the interrogation MUST be wrapped in:
  ```html
  <div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">
  ... اردو مکالمہ یہاں آئے گا ...
  </div>
  ```

- **Strict BiDi Isolation**:
  Isolate EVERY English technical term, framework, database table, command, file path, and type using `<bdi dir="ltr"><code>...</code></bdi>` or code backticks (e.g. `Next.js`, `Supabase`, `Row Level Security`, `pnpm test`). Never allow unescaped Latin characters to scramble Urdu sentence order.

## 2. Socratic Interrogation Protocol

1. **Do NOT write implementation code** during the interrogation phase.
2. Ask **2 to 3 sharp, critical architectural questions** per round directly in the chat body, focusing on:
   - Edge cases, error handling, and failure modes.
   - Database invariants, concurrency, and security rules (RLS, Auth).
   - Component state management and data flow.
   - User experience, empty states, and loading states.
3. Present clear options (1, 2, 3) and challenge any weak assumptions.
4. Only when all architectural decisions are debated and confirmed by the user, summarize the final design and give the green light to proceed with implementation.
