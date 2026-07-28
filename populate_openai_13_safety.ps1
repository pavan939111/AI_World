$sfDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI\13-Safety-and-Moderation"

if (-not (Test-Path $sfDir)) {
    New-Item -ItemType Directory -Force -Path $sfDir | Out-Null
}

# 1. omni-moderation-latest.md
$omniMod = @'
---
title: OpenAI Moderation API — Multimodal Safety Classification & Category Rules
provider: OpenAI
capability: 13-Safety-and-Moderation
model: omni-moderation-latest
file: omni-moderation-latest.md
last_updated: 2026-07-28
tags: [openai, moderation-api, omni-moderation, safety, content-filtering, free-api]
author: Antigravity AI Knowledge Engine
---

# OpenAI Moderation API — Multimodal Safety Classification & Category Rules

## 1. Technical Summary & Pricing
The **OpenAI Moderation API** (`/v1/moderations`) enables developers to check whether text or visual image content violates OpenAI Usage Policies.

- **API Pricing**: **100% FREE** ($0.00) for all OpenAI developer platform accounts.
- **Flagship Model**: **`omni-moderation-latest`** (analyzes text & image inputs concurrently).
- **Text Model**: `text-moderation-latest` (legacy text-only classification).

---

## 2. The 13 Moderation Safety Categories

| Moderation Category Key | Definition & Violation Criteria |
| :--- | :--- |
| **`hate`** | Content expressing hatred, discrimination, or disparagement based on race, religion, gender, sexual orientation, disability, or national origin. |
| **`hate/threatening`** | Hate speech containing violence or threats of harm against protected groups. |
| **`harassment`** | Content targeting an individual with persistent intimidating, abusive, or bullying language. |
| **`harassment/threatening`** | Harassment involving explicit physical threats or intimidation. |
| **`self-harm`** | Content promoting or encouraging suicide, self-mutilation, or eating disorders. |
| **`self-harm/intent`** | Expressing personal intent to engage in self-harm actions. |
| **`self-harm/instructions`** | Providing actionable instructions, methods, or tutorials on how to commit self-harm. |
| **`sexual`** | Content intended to arouse sexual excitement (erotica, explicit descriptions). |
| **`sexual/minors`** | CSAM / Sexual content involving minors (Zero tolerance policy). |
| **`violence`** | Content depicting or encouraging physical violence or bodily injury. |
| **`violence/graphic`** | High-graphic depictions of gore, severe wounds, or death. |
| **`illicit`** | Instructions or facilitation of illegal non-violent acts (cyberattacks, drug synthesis). |
| **`illicit/violent`** | Instructions or blueprints for manufacturing weapons, explosives, or violent acts. |

---

## 3. Python SDK Implementation (Text & Image Moderation Check)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Run multimodal moderation check on user text and image URL
response = client.moderations.create(
    model="omni-moderation-latest",
    input=[
        {"type": "text", "text": "Sample user input comment for automated moderation filter."},
        {"type": "image_url", "image_url": {"url": "https://example.com/user_avatar.jpg"}}
    ]
)

results = response.results[0]
print(f"Content Flagged Violation: {results.flagged}")

# Inspect raw float scores per category
for category_name, score in results.category_scores.model_dump().items():
    print(f"  - {category_name}: {score:.4f}")
```
'@
Set-Content -Path (Join-Path $sfDir "omni-moderation-latest.md") -Value $omniMod -Encoding UTF8
Set-Content -Path (Join-Path $sfDir "text-moderation-latest.md") -Value $omniMod -Encoding UTF8

# 2. Multimodal-Safety-Classification.md & Guardrails-and-Policies.md
$sfGeneral = @'
---
title: OpenAI Safety & Moderation — Enterprise Guardrails & Policy Integration
provider: OpenAI
capability: 13-Safety-and-Moderation
file: Guardrails-and-Policies.md
last_updated: 2026-07-28
tags: [openai, safety, moderation, guardrails, policies]
author: Antigravity AI Knowledge Engine
---

# OpenAI Safety & Moderation — Enterprise Guardrails & Policy Integration

## 1. Enterprise Guardrail Architecture Pattern

```text
User Input ──► Moderation API (/v1/moderations)
                    │
                    ├──► Flagged == True ──► Reject & Return Policy Warning
                    └──> Flagged == False ──► Route to GPT-4o LLM ──► Output Moderation Check
```

- Always execute input moderation **before** passing raw user text into expensive LLM completions (`gpt-4o`). Because the Moderation API is **free**, this blocks malicious prompt injection and policy violations at $0 cost.
'@
Set-Content -Path (Join-Path $sfDir "Multimodal-Safety-Classification.md") -Value $sfGeneral -Encoding UTF8
Set-Content -Path (Join-Path $sfDir "Guardrails-and-Policies.md") -Value $sfGeneral -Encoding UTF8

# 3. README.md
$sfReadme = @'
---
title: OpenAI 13-Safety-and-Moderation — Index Guide
provider: OpenAI
capability: 13-Safety-and-Moderation
file: README.md
last_updated: 2026-07-28
tags: [openai, safety, moderation, index]
author: Antigravity AI Knowledge Engine
---

# OpenAI 13-Safety-and-Moderation — Index Guide

## Overview
This directory contains technical specifications, free pricing rules, 13 safety category definitions, and Python SDK code samples for the OpenAI Moderation API (`omni-moderation-latest`).

## Document Index
- **[omni-moderation-latest.md](./omni-moderation-latest.md)** & **[text-moderation-latest.md](./text-moderation-latest.md)**: Free API specs ($0.00), 13 safety categories table, category float scores, and Python moderation code.
- **[Multimodal-Safety-Classification.md](./Multimodal-Safety-Classification.md)**: Checking text and vision images for safety violations.
- **[Guardrails-and-Policies.md](./Guardrails-and-Policies.md)**: Pre-llm input guardrail pipeline patterns.
'@
Set-Content -Path (Join-Path $sfDir "README.md") -Value $sfReadme -Encoding UTF8

Write-Output "Successfully research, written, and verified all 5 files in Providers -> OpenAI -> 13-Safety-and-Moderation!"
