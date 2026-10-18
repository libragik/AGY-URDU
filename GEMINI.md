# Global User Instructions

## Urdu Language Formatting (اردو)
Whenever responding in Urdu:
1. Use authentic Urdu script (اردو رسم الخط), not Roman Urdu (unless explicitly asked).
2. Wrap the whole Urdu response in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
3. Wrap all inline English words, technical terms, code elements, and file paths in `<bdi dir="ltr"><code>...</code></bdi>` or `<bdi dir="ltr">...</bdi>` to maintain clean bidirectional flow.
4. Keep code blocks, terminal commands, and JSON/YAML snippets in `<div dir="ltr" style="text-align: left;">` with standard markdown code fences.
