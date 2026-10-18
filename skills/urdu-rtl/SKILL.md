---
name: urdu-rtl
description: (Urdu RTL) Formats, re-aligns, and handles Urdu text directionality (RTL/LTR), bidirectional typography isolation (BiDi), Nastaliq spacing, and Markdown documentation generation.
---

# Urdu RTL & BiDi Helper Skill (`urdu-rtl`)

Use this skill when formatting Urdu text with proper Right-to-Left (RTL) alignment, fixing bidirectional text scrambling, or generating professional Urdu documentation, reports, and Markdown files.

## 1. RTL Markdown Formatting

When the user asks to format an Urdu explanation, article, or documentation with clean RTL:

1. **Section Containers:**
   Wrap the Urdu content in:
   ```html
   <div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">
   ... اردو متن یہاں درج کریں ...
   </div>
   ```

2. **Mixed Language Handling (BiDi):**
   - Keep English words, brand names, and code tokens wrapped in:
     `<bdi dir="ltr"><code>...</code></bdi>` or `<bdi dir="ltr">...</bdi>` or code backticks (`` `token` ``).
   - Ensure numbers and punctuation adhere to the surrounding Urdu flow so sentences don't break awkwardly.

3. **Code Blocks:**
   All code snippets must remain strictly LTR (`dir="ltr"`) with standard markdown fences inside:
   ```html
   <div dir="ltr" style="text-align: left;">

   ```language
   // code here
   ```

   </div>
   ```

## 2. Bidirectional Scrambling Prevention

When mixed Urdu and English text is being processed:
- Never allow raw Latin characters to follow punctuation marks without BiDi isolation.
- Use explicit directional markers (`<bdi dir="ltr">`) to ensure that browser rendering engines do not reverse phrase segments.
