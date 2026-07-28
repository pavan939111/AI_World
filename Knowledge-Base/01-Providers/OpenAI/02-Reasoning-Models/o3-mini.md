---
title: OpenAI o3-mini â€” Ultra-Fast Low-Cost Reasoning Model Specification
provider: OpenAI
capability: 02-Reasoning-Models
model: o3-mini
file: o3-mini.md
last_updated: 2026-07-28
tags: [openai, o3-mini, reasoning-models, low-cost, math, codeforces, fast-inference]
author: Antigravity AI Knowledge Engine
---

# OpenAI o3-mini â€” Technical Specification & Production Guide

## 1. Summary & Market Position
**OpenAI o3-mini** (`o3-mini-2025-01-31`) is OpenAI's fast, low-cost reasoning model optimized for science, technology, engineering, and mathematics (STEM) fieldsâ€”particularly math and competitive programming.

It achieves higher competition math scores (87.3% AIME) than `o1` at **93% lower pricing** ($1.10/$4.40 vs $15.00/$60.00).

---

## 2. Technical Specifications & Pricing

| Parameter | Specification | Notes / Details |
| :--- | :--- | :--- |
| **Model ID** | `o3-mini`, `o3-mini-2025-01-31` | Production endpoint |
| **Context Window** | **200,000 tokens** | Multi-document context |
| **Max Output Tokens** | **65,536 tokens** | Includes thinking trace |
| **Reasoning Control** | `reasoning_effort`: `low`, `medium`, `high` | Default: `medium` |
| **API Pricing (1M Tokens)**| **$1.10 Input / $4.40 Output** | **93% cheaper than o1** |
| **Prompt Caching Discount**| **$0.55 / 1M Cached Tokens** | 50% discount on cached context |
| **Developer Features**| Function Calling, Structured Outputs, Developer Messages | Full developer tooling |

---

## 3. Python SDK Example (Reasoning Effort Configuration)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Execute competitive coding task using o3-mini with low effort for speed
response = client.chat.completions.create(
    model="o3-mini",
    messages=[
        {"role": "user", "content": "Write an optimal O(N log N) algorithm in Python to find the longest increasing subsequence in an integer array."}
    ],
    reasoning_effort="low"
)

print(response.choices[0].message.content)
```
