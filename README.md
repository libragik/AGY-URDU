# 🌐 AGY-URDU: Official Antigravity Urdu RTL & BiDi Typography Plugin

> **The definitive Urdu Right-to-Left (RTL) formatting, bidirectional typography isolation, and architectural engineering plugin for Google Antigravity (IDE, Desktop, and CLI).**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Google%20Antigravity-orange.svg)](https://github.com/libragik/AGY-URDU)
[![RTL Compliant](https://img.shields.io/badge/RTL-Urdu%20Native-brightgreen.svg)](https://github.com/libragik/AGY-URDU)
[![Version](https://img.shields.io/badge/Version-v1.2.0-blueviolet.svg)](https://github.com/libragik/AGY-URDU)

---

## 📖 تعارف و خصوصیات (Overview & Features)

<div dir="rtl" style="text-align: right; line-height: 1.9; font-size: 15px;">

یہ ریپازٹری **گوگل اینٹی گریوٹی (Google Antigravity)** کے لیے مکمل اردو پلگ ان اور رولز فریم ورک فراہم کرتی ہے:

### 1. مکمل دائیں سے بائیں محاذاة (True RTL Alignment):
- اینٹی گریوٹی کے تمام رسپانسز، چیٹ ونڈوز اور آرٹی فیکٹس میں اردو متن کو خودکار طور پر معیاری `dir="rtl"` میں رینڈر کرتا ہے۔
- خطِ نستعلیق کی روانی اور خوبصورتی کے لیے خصوصی لائن ہائٹ (`line-height: 1.9`) اور فونٹ سائز (`15px`) کی ایڈجسٹمنٹ۔
- علاماتِ اوقاف (جیسے `؟`، `۔`، `:`) کو جملے کے اختتام (بائیں جانب) پر درست پوزیشن میں رکھتا ہے۔

### 2. دو سمتی متن کا عزل (Bidirectional BiDi Isolation):
- اردو جملوں کے دوران آنے والے انگریزی الفاظ، ٹیکنیکل کمانڈز، اور کوڈ ٹوکنز کو خودکار طور پر `<bdi dir="ltr">` یا کوڈ بیک ٹکس میں لپیٹتا ہے تاکہ جملے کے الفاظ اور ساخت آپس میں نہ الجھیں۔

### 3. اردو میں معمارانہ اور تکنیکی استجواب (`/interview-me-urdu`):
- کوڈ لکھنے سے قبل پروجیکٹ کے آرکیٹیکچر، سیکیورٹی، ڈیٹا بیس اور ایج کیسز پر مستند اردو میں گہرا سقراطی انٹرویو۔
- **چیٹ فرسٹ ڈیزائن:** تمام مکالمہ چیٹ ونڈو کے اندر رکھا جاتا ہے تاکہ آئی ڈی ای کے ماڈل پاپ اپس کی وجہ سے اردو کا رخ خراب نہ ہو۔

</div>

---

## ⚡ فوری تنصیب (One-Liner Quick Install)

### ونڈوز پر خودکار تنصیب (Windows PowerShell):
کسی بھی ونڈوز سسٹم پر پاور شیل کھولیں اور یہ کمانڈ چلائیں:

```powershell
irm https://raw.githubusercontent.com/libragik/AGY-URDU/main/install.ps1 | iex
```

### لینکس و میک او ایس (Linux & macOS Bash):
```bash
curl -fsSL https://raw.githubusercontent.com/libragik/AGY-URDU/main/install.sh | bash
```

---

## 📁 پروجیکٹ کی ساخت (Project Structure)

```text
AGY-URDU/
├── plugin.json                 # اینٹی گریوٹی پلگ ان مینی فیسٹ (v1.2.0)
├── README.md                   # تفصیلی دستاویزات اور استعمال کا طریقہ کار
├── LICENSE                     # اوپن سورس MIT لائسنس
├── GEMINI.md                   # گلوبل کنفیگ کا متبادل سانچہ
├── install.ps1                 # ونڈوز پاور شیل کا خودکار انسٹالر
├── install.sh                  # لینکس/میک بیش کا خودکار انسٹالر
├── rules/
│   ├── AGENTS.md               # ہمہ گیر اینٹی گریوٹی رولز (Universal Rules)
│   └── urdu-output-rtl.md      # اسٹینڈ الون گلوبل رول (Rules Engine)
└── skills/
    ├── urdu-rtl/
    │   └── SKILL.md            # اردو ٹیکسٹ فارمیٹنگ اسکل (/urdu-rtl)
    └── interview-me-urdu/
        └── SKILL.md            # اردو سقراطی انٹرویو اسکل (/interview-me-urdu)
```

---

## 🛠️ تنصیب کے بعد دستیابی (What Gets Activated)

یہ انسٹالر چلنے کے بعد اینٹی گریوٹی کے تین مختلف درجوں پر خودکار طریقے سے فعال ہو جاتا ہے:
1. **Antigravity Plugin:** `~/.gemini/config/plugins/urdu-rtl/` (پلگ ان کے طور پر دریافت اور فعال)۔
2. **Always-On Rule:** `~/.gemini/config/rules/urdu-output-rtl.md` (ہمیشہ فعال رول)۔
3. **Global Persona Instructions:** `~/.gemini/config/GEMINI.md` (ماڈل کے بنیادی ڈی این اے میں شامل)۔

---

## 📜 لائسنس (License)
یہ پروجیکٹ اوپن سورس [MIT License](LICENSE) کے تحت آزادانہ استعمال اور شیئرنگ کے لیے دستیاب ہے۔
Copyright (c) 2026 Muhammad Rafiq ([@libragik](https://github.com/libragik)).
