---
title: xAI (Grok) — Complete Technical Specification & Provider Reference
provider: xAI
view: By Provider
last_updated: 2026-07-28
tags: [xai, grok, grok-3, grok-2, elon-musk, colossus, real-time-x]
author: Antigravity AI Documentation Engine
---

# xAI (Grok) — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: xAI Corp.
- **Parent Company**: xAI Corp.
- **Founders**: Elon Musk (CEO), Igor Babuschkin, Christian Szegedy, Jimmy Ba, Greg Yang
- **Headquarters**: Burlingame, California, USA / Memphis, Tennessee (Colossus Supercomputer Data Center)
- **Year Founded**: July 2023
- **Mission**: To understand the true nature of the universe.
- **Valuation & Funding**: $50 Billion+ valuation with $6 Billion+ in Series B funding.
- **Infrastructure**: **Colossus Supercomputer** in Memphis, Tennessee featuring 100,000 liquid-cooled NVIDIA H100 GPUs (expanding to 200,000 H100/H200 GPUs).
- **AI Ecosystem**: Full-stack foundation model ecosystem providing Grok-3 flagship reasoning, Grok-2 128k context LLM, Grok-2-Vision multimodal, real-time X (Twitter) platform post search grounding, and OpenAI-compatible API (`api.x.ai/v1`).
- **Timeline & Major Milestones**:
  - **July 2023**: Founded by Elon Musk.
  - **November 2023**: Released Grok-1 preview for X Premium+ subscribers.
  - **March 2024**: Open-sourced Grok-1 314 Billion parameter base weights.
  - **July 2024**: Brought online Colossus 100k H100 supercomputer cluster in 122 days.
  - **August 2024**: Launched Grok-2 and Grok-2-mini with 128k context and vision capabilities.
  - **October 2024**: Launched xAI Cloud API platform (`api.x.ai`).
  - **February 2025**: Released Grok-3 flagship reasoning model trained on Colossus.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Language Models** | General-purpose chat, reasoning, and long-context dialogue | Yes | Grok-3, Grok-2, Grok-2-mini | Active |
| **Reasoning Models** | Extended chain-of-thought mathematical and logic reasoning | Yes | Grok-3 Extended Reasoning | Active |
| **Vision Models** | Multimodal visual understanding, document OCR, chart analysis | Yes | Grok-2-Vision | Active |
| **Live X Grounding** | Real-time access to live X platform posts and breaking trends | Yes | Grok Live Search Integration | Active |
| **OpenAI Compatible API** | Drop-in REST endpoint compatibility with `/v1/chat/completions` | Yes | `api.x.ai/v1` | Active |
| **Tool Use** | Parameter extraction and structured function execution loops | Yes | Messages API (`tools`) | Active |
| **Structured Outputs** | Guaranteed JSON schema adherence | Yes | `response_format: { type: "json_object" }` | Active |

---

# 3. Language Models

### Model: Grok-3
- **Name**: Grok-3 (`grok-3-latest`)
- **Release Date**: February 2025
- **Family**: xAI Frontier Flagship (Colossus Trained)
- **Context Window**: 128,000 tokens
- **Input Modalities**: Text, Image, Live X Posts
- **Output Modalities**: Text, JSON Schema, Function Calls
- **Services Provided by the Model**:
  - **Frontier Intelligence**: PhD-level mathematics, physics, and software engineering reasoning.
  - **Real-Time X Platform Grounding**: Searching live posts and breaking news on X.
  - **Function Calling & Structured Outputs**: Tool parameter extraction and JSON Schema validation.
- **Pricing**: $3.00 / 1M input tokens | $15.00 / 1M output tokens

### Model: Grok-2
- **Name**: Grok-2 (`grok-2-latest`)
- **Release Date**: August 2024
- **Context Window**: 128,000 tokens
- **Pricing**: $2.00 / 1M input tokens | $10.00 / 1M output tokens

---

# 4. Code Example (OpenAI SDK Compatible)

```python
import os
from openai import OpenAI

# Initialize client using OpenAI SDK pointed to xAI API base_url
client = OpenAI(
    api_key=os.environ.get("XAI_API_KEY"),
    base_url="https://api.x.ai/v1"
)

completion = client.chat.completions.create(
    model="grok-2-latest",
    messages=[
        {"role": "system", "content": "You are Grok, an AI created by xAI."},
        {"role": "user", "content": "Summarize key aerospace milestones from this week."}
    ]
)

print(completion.choices[0].message.content)
```

---

# 5. Pricing Summary

| Model | Input Rate / 1M | Output Rate / 1M |
| :--- | :--- | :--- |
| **Grok-3** | $3.00 | $15.00 |
| **Grok-2** | $2.00 | $10.00 |
| **Grok-2-mini** | $0.20 | $1.00 |
| **Grok-2-Vision** | $2.00 | $10.00 |

---

# 6. Official References

- Official xAI Documentation: [docs.x.ai](https://docs.x.ai)
- xAI Console: [console.x.ai](https://console.x.ai)
- Official Website: [x.ai](https://x.ai)
