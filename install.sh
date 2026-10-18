#!/usr/bin/env bash
# ==============================================================================
# AGY-URDU Global Installer & Plugin Setup for Linux & macOS
# ==============================================================================

set -euo pipefail

CONFIG_DIR="${HOME}/.gemini/config"
PLUGINS_BASE_DIR="${CONFIG_DIR}/plugins"
PLUGIN_TARGET_DIR="${PLUGINS_BASE_DIR}/urdu-rtl"
RULES_DIR="${CONFIG_DIR}/rules"
RULE_FILE="${RULES_DIR}/urdu-output-rtl.md"
GEMINI_FILE="${CONFIG_DIR}/GEMINI.md"

mkdir -p "${RULES_DIR}"
mkdir -p "${PLUGIN_TARGET_DIR}/rules"
mkdir -p "${PLUGIN_TARGET_DIR}/skills/urdu-rtl"
mkdir -p "${PLUGIN_TARGET_DIR}/skills/interview-me-urdu"

# 1. Plugin Manifest
cat > "${PLUGIN_TARGET_DIR}/plugin.json" << 'EOF'
{
  "name": "urdu-rtl",
  "displayName": "Urdu RTL & BiDi Typography Assistant",
  "version": "1.2.0",
  "description": "Native Urdu Right-to-Left (RTL) formatting, bidirectional typography isolation, Nastaliq line-height tuning, and Socratic architectural interrogation for Google Antigravity.",
  "author": {
    "name": "Muhammad Rafiq",
    "url": "https://github.com/libragik"
  },
  "homepage": "https://github.com/libragik/AGY-URDU",
  "repository": "https://github.com/libragik/AGY-URDU",
  "license": "MIT",
  "suggestedPrompts": [
    "اردو میں درست RTL اور BiDi فارمیٹنگ کے ساتھ جواب دیں",
    "اس پروجیکٹ کے آرکیٹیکچر کا اردو میں جائزہ لیں (/interview-me-urdu)",
    "Convert this technical documentation into professional Urdu RTL Markdown"
  ]
}
EOF

# 2. Universal AGENTS Rule in Plugin
cat > "${PLUGIN_TARGET_DIR}/rules/AGENTS.md" << 'EOF'
# Universal Urdu RTL & BiDi Directionality Rules

> **ALWAYS ACTIVE**: This rule is permanently active across all Antigravity surfaces, sessions, chats, and workspaces (Antigravity 2.0 Desktop, IDE, Chat Canvas, and CLI).

## 1. Universal Language Trigger (Urdu Script)
- Whenever the user speaks in Urdu script (اردو رسم الخط):
  1. Comprehend the prompt immediately without requiring external translation.
  2. Always wrap Urdu responses in strict Right-to-Left (RTL) HTML:
     <div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>
  3. Never use Roman Urdu unless explicitly requested.

## 2. Bidirectional (BiDi) Isolation
- When English words or commands appear in Urdu:
  Always isolate them with `<bdi dir="ltr"><code>...</code></bdi>` or backticks (`...`).
EOF

# 3. Skills
cat > "${PLUGIN_TARGET_DIR}/skills/urdu-rtl/SKILL.md" << 'EOF'
---
name: urdu-rtl
description: (Urdu RTL) Formats, re-aligns, and handles Urdu text directionality (RTL/LTR), bidirectional typography isolation (BiDi), Nastaliq spacing, and Markdown documentation generation.
---
# Urdu RTL Skill
Wraps Urdu content in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">`.
EOF

cat > "${PLUGIN_TARGET_DIR}/skills/interview-me-urdu/SKILL.md" << 'EOF'
---
name: interview-me-urdu
description: (Urdu RTL) Socratic architectural interrogation, design stress-testing, and technical requirements interview in authentic Urdu with strict BiDi isolation directly in chat.
---
# Socratic Architecture in Urdu
Interrogates user plans directly inside chat (avoiding LTR modal popups).
EOF

# 4. Global Standalone Rule
cat > "${RULE_FILE}" << 'EOF'
---
name: urdu-output-rtl
description: Enforce proper Right-to-Left (RTL) formatting and clear Left-to-Right English phrasing whenever answering in Urdu
always_on: true
---

# Urdu Language Formatting & Direction Rules

Whenever responding in Urdu (اردو):
1. **Urdu Script Only**: Always write in authentic Urdu script (اردو رسم الخط).
2. **Right-to-Left (RTL) Wrapper**: Always wrap entire response in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
3. **Preserve English Flow & Punctuation**: Wrap inline English in `<bdi dir="ltr"><code>...</code></bdi>`.
EOF

# 5. Append to GEMINI.md
if [ -f "${GEMINI_FILE}" ]; then
  if ! grep -q "Urdu Language Formatting" "${GEMINI_FILE}"; then
    cat >> "${GEMINI_FILE}" << 'EOF'

## Urdu Language Formatting (اردو)
Whenever responding in Urdu:
1. Use authentic Urdu script (اردو رسم الخط), not Roman Urdu (unless explicitly asked).
2. Wrap the whole Urdu response in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
3. Wrap all inline English words, technical terms, code elements, and file paths in `<bdi dir="ltr"><code>...</code></bdi>` or `<bdi dir="ltr">...</bdi>`.
4. Keep code blocks, terminal commands, and JSON/YAML snippets in `<div dir="ltr" style="text-align: left;">` with standard markdown code fences.
EOF
  fi
else
  cat > "${GEMINI_FILE}" << 'EOF'
# Global User Instructions

## Urdu Language Formatting (اردو)
Whenever responding in Urdu:
1. Use authentic Urdu script (اردو رسم الخط), not Roman Urdu (unless explicitly asked).
2. Wrap the whole Urdu response in `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
3. Wrap all inline English words, technical terms, code elements, and file paths in `<bdi dir="ltr"><code>...</code></bdi>` or `<bdi dir="ltr">...</bdi>`.
4. Keep code blocks, terminal commands, and JSON/YAML snippets in `<div dir="ltr" style="text-align: left;">` with standard markdown code fences.
EOF
fi

echo "=========================================================="
echo "   Installation Successful! AGY-URDU Plugin is active.    "
echo "=========================================================="
