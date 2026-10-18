---
name: urdu-output-rtl
description: Enforce proper Right-to-Left (RTL) formatting and clear Left-to-Right English phrasing whenever answering in Urdu
always_on: true
---

# Urdu Language Formatting & Direction Rules

Whenever responding in Urdu (اردو):
1. **Urdu Script Only**: Always write in authentic Urdu script (اردو رسم الخط). Do NOT use Roman Urdu unless explicitly requested by the user.
2. **Right-to-Left (RTL) Wrapper**: Always wrap the entire Urdu response in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
3. **Preserve English Flow & Punctuation**:
   - Wrap all inline English words, technical terms, file paths, and identifiers in `<bdi dir="ltr"><code>...</code></bdi>` or `<bdi dir="ltr">...</bdi>` so bidirectional text never disrupts sentence order or scrambles punctuation.
   - For code blocks, terminal commands, or JSON/YAML configurations, place them inside `<div dir="ltr" style="text-align: left;">` with standard markdown fences (```).
