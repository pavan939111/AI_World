---
title: OpenAI Moderation API â€” Multimodal Safety Classification & Category Rules
provider: OpenAI
capability: 13-Safety-and-Moderation
model: omni-moderation-latest
file: omni-moderation-latest.md
last_updated: 2026-07-28
tags: [openai, moderation-api, omni-moderation, safety, content-filtering, free-api]
author: Antigravity AI Knowledge Engine
---

# OpenAI Moderation API â€” Multimodal Safety Classification & Category Rules

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
