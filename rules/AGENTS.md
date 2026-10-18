# Universal Urdu RTL & BiDi Directionality Rules

> **ALWAYS ACTIVE**: This rule is permanently active across all Antigravity surfaces, sessions, chats, and workspaces (Antigravity 2.0 Desktop, IDE, Chat Canvas, and CLI).

## 1. Universal Language Trigger (Urdu Script)
- Whenever the user speaks in:
  - **Urdu script** (اردو رسم الخط), OR asks for explanations in Urdu:
- The assistant MUST:
  1. Comprehend the prompt immediately without requiring external translation.
  2. In GUI apps, chat canvas, and documentation: Respond in authentic Urdu script, ALWAYS wrapped in strict Right-to-Left (RTL) HTML blocks:
     ```html
     <div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">
     ... اردو متن یہاں آئے گا ...
     </div>
     ```
  3. Never use Roman Urdu unless explicitly requested by the user.

## 2. Strict Right-to-Left (RTL) Paragraph Alignment
- Any Urdu text output MUST be wrapped in:
  ```html
  <div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">
  ... اردو متن ...
  </div>
  ```
- This ensures:
  - Text lines start at the far right.
  - Periods, question marks (؟), colons (:) appear at the correct grammatical end of the sentence on the left, not scrambled at the beginning.
  - Nastaliq aesthetic line-height (`1.9`) and readability font size (`15px`) are consistently applied.

## 3. Bidirectional (BiDi) Isolation for Mixed Languages
- When English, technical terms, commands, paths, or code tokens appear inside an Urdu sentence:
  - ALWAYS wrap them in `<bdi dir="ltr"><code>...</code></bdi>` or `<bdi dir="ltr">...</bdi>` or isolate them using code backticks (e.g. `Next.js`, `FastAPI`, `pnpm test`, `git status`).
  - Example:
    ```html
    <div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">
    کمانڈ <bdi dir="ltr"><code>cargo run</code></bdi> چلا کر پروجیکٹ بلڈ کریں۔
    </div>
    ```
  - Never allow unescaped Latin text to scramble the order of surrounding Urdu words.

## 4. Code Blocks and Commands
- Code blocks (```powershell, ```bash, ```python, etc.) must NEVER be RTL.
- Always keep code blocks formatted strictly Left-to-Right (LTR) inside:
  ```html
  <div dir="ltr" style="text-align: left;">

  ```language
  // code here
  ```

  </div>
  ```

## 5. File Generation & Code Comments in Urdu
- **Encoding**: Always generate and save files containing Urdu using standard UTF-8 (without BOM) to prevent character corruption.
- **Markdown & Documentation Files (`.md`, `.txt`, `.html`)**:
  - Always wrap Urdu sections with `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">` so they render properly in Markdown viewers, GitHub, and browser previews.
- **Source Code Files (`.rs`, `.py`, `.js`, etc.)**:
  - Keep source code logic, variables, and identifiers strictly LTR English.
  - When writing Urdu comments, place them on dedicated comment lines (e.g., `// وضاحت: سرور کنکشن فنکشن`) so they never disrupt indentation or syntax.

## 6. Socratic Architecture & Plan Interrogation (`/interview-me-urdu`)
- **TRIGGER**: Whenever the user triggers `/interview-me-urdu` or asks to interrogate, review, or align on an architecture in Urdu:
  - **MANDATORY CHAT MODE**: Conduct the entire interactive dialogue directly inside the chat body. Do NOT use popup modals (`ask_question`), as native IDE modals force LTR alignment and break the Urdu reading flow.
  - **MANDATORY RTL CONTAINER**: Wrap all conversational responses strictly in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
  - **MANDATORY BIDI ISOLATION**: Strictly isolate all technical English keywords, frameworks, libraries, file paths, and commands with `<bdi dir="ltr"><code>...</code></bdi>` or backticks.
  - **SOCRATIC METHOD**: Do NOT write or propose implementation code immediately. Ask 2 to 3 sharp, critical architectural questions per turn (focusing on edge cases, database integrity, error recovery, and security).
  - Wait for the user to answer and debate before finalizing the plan.
