# 🇵🇰 AGY-URDU: Elite Urdu RTL Formatting for Google Antigravity

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Google Antigravity](https://img.shields.io/badge/Google-Antigravity%202.0-orange.svg)](https://antigravity.google)
[![Urdu RTL](https://img.shields.io/badge/Language-Urdu%20%28%D8%A7%D8%B1%D8%AF%D9%88%29-green.svg)](README.md)

**AGY-URDU** is the definitive, production-grade Urdu Right-to-Left (RTL) formatting and bidirectional typography rule set for **Google Antigravity (AGY)**.

It ensures that any AI agent operating in Antigravity outputs clean, elegant, authentic Urdu script (`اردو رسم الخط`) with proper bidirectional wrappers (`<bdi dir="ltr">`), so English technical terms, code elements, file paths, and punctuation never flip or break sentence flow.

---

## ⚡ Quick Install (One-Liner)

Install globally with a single command on your machine:

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/libragik/AGY-URDU/main/install.ps1 | iex
```

### Linux & macOS (Bash)
```bash
curl -fsSL https://raw.githubusercontent.com/libragik/AGY-URDU/main/install.sh | bash
```

---

## 🌟 What It Enforces

1. **Authentic Urdu Script (`اردو رسم الخط`)**: Strictly forbids informal Roman Urdu unless explicitly requested by the user.
2. **Right-to-Left (RTL) Aesthetics**: Wraps the entire Urdu response inside an elegant `<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">...</div>`.
3. **Preserves English Flow & Punctuation**: Automatically isolates inline code, variables, and technical terms inside `<bdi dir="ltr"><code>...</code></bdi>` to prevent reversed parentheses and broken punctuation.
4. **Clean Code Alignment**: Keeps terminal commands, code snippets, and JSON/YAML blocks strictly Left-to-Right (`<div dir="ltr" style="text-align: left;">`).

---

## 📂 Directory Structure

```text
AGY-URDU/
├── rules/
│   └── urdu-output-rtl.md    # The Antigravity Always-On rule
├── GEMINI.md                 # Global user instruction block
├── install.ps1               # Automated Windows PowerShell installer
├── install.sh                # Automated Linux/macOS Bash installer
├── LICENSE                   # MIT License
└── README.md
```

---

## 🛠️ Manual Installation

If you prefer to configure it manually:

1. Copy `rules/urdu-output-rtl.md` into:
   ```text
   ~/.gemini/config/rules/urdu-output-rtl.md
   ```
2. Or append the rules from `GEMINI.md` to:
   ```text
   ~/.gemini/config/GEMINI.md
   ```

---

## 👤 Author & Credits

- **Author**: Muhammad Rafiq ([@libragik](https://github.com/libragik))
- **Workspace**: Google Antigravity Agentic IDE
- **License**: [MIT](LICENSE)
