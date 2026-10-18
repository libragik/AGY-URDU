#!/usr/bin/env bash
# ==============================================================================
# AGY-URDU Global Installer for Linux & macOS
# ==============================================================================

set -euo pipefail

CONFIG_DIR="${HOME}/.gemini/config"
RULES_DIR="${CONFIG_DIR}/rules"
RULE_FILE="${RULES_DIR}/urdu-output-rtl.md"
GEMINI_FILE="${CONFIG_DIR}/GEMINI.md"

mkdir -p "${RULES_DIR}"

cat > "${RULE_FILE}" << 'EOF'
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
EOF

echo "[✓] Installed: ${RULE_FILE}"

if [ -f "${GEMINI_FILE}" ]; then
  if ! grep -q "Urdu Language Formatting" "${GEMINI_FILE}"; then
    cat >> "${GEMINI_FILE}" << 'EOF'

## Urdu Language Formatting (اردو)
Whenever responding in Urdu:
1. Use authentic Urdu script (اردو رسم الخط), not Roman Urdu (unless explicitly asked).
2. Wrap the whole Urdu response in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
3. Wrap all inline English words, technical terms, code elements, and file paths in `<bdi dir="ltr"><code>...</code></bdi>` or `<bdi dir="ltr">...</bdi>` to maintain clean bidirectional flow.
4. Keep code blocks, terminal commands, and JSON/YAML snippets in `<div dir="ltr" style="text-align: left;">` with standard markdown code fences.
EOF
    echo "[✓] Updated: ${GEMINI_FILE}"
  fi
else
  cat > "${GEMINI_FILE}" << 'EOF'
# Global User Instructions

## Urdu Language Formatting (اردو)
Whenever responding in Urdu:
1. Use authentic Urdu script (اردو رسم الخط), not Roman Urdu (unless explicitly asked).
2. Wrap the whole Urdu response in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
3. Wrap all inline English words, technical terms, code elements, and file paths in `<bdi dir="ltr"><code>...</code></bdi>` or `<bdi dir="ltr">...</bdi>` to maintain clean bidirectional flow.
4. Keep code blocks, terminal commands, and JSON/YAML snippets in `<div dir="ltr" style="text-align: left;">` with standard markdown code fences.
EOF
  echo "[✓] Created: ${GEMINI_FILE}"
fi

echo "=========================================================="
echo "   Installation Successful! AGY-URDU is active globally.  "
echo "=========================================================="
