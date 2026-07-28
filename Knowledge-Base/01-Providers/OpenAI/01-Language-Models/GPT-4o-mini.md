---
title: OpenAI GPT-4o-mini â€” Technical Specification & Low-Cost High-Speed Integration Guide
provider: OpenAI
capability: 01-Language-Models
model: GPT-4o-mini
file: GPT-4o-mini.md
last_updated: 2026-07-28
tags: [openai, gpt-4o-mini, llm, low-cost, fast-inference, vision, structured-outputs]
author: Antigravity AI Knowledge Engine
---

# OpenAI GPT-4o-mini â€” Technical Specification & Production Guide

## 1. Summary & Market Position
**GPT-4o-mini** is OpenAI's small, high-speed, cost-optimized multimodal foundation model designed to replace `gpt-3.5-turbo`. It delivers superior intelligence than GPT-4 (original) at a fraction of the cost, making high-volume AI applications economically viable.

GPT-4o-mini supports native multimodal text and vision inputs, structured JSON outputs, function calling, and streaming completions.

---

## 2. Technical Specifications & Pricing

| Parameter | Specification | Notes / Details |
| :--- | :--- | :--- |
| **Model ID** | `gpt-4o-mini`, `gpt-4o-mini-2024-07-18` | Production endpoint pointer |
| **Context Window** | **128,000 tokens** | Multi-page text & vision ingestion |
| **Max Output Tokens** | **16,384 tokens** | Max response completion length |
| **Knowledge Cutoff** | **October 2023** | Supplemental search support |
| **API Pricing (1M Tokens)**| **$0.15 Input / $0.60 Output** | **94% cheaper than GPT-4o** |
| **Prompt Caching Discount**| **$0.075 / 1M Cached Tokens** | 50% discount on cached prefixes |
| **MMLU Score** | **82.0%** | Outperforms GPT-4 (0613) at 81.8% |
| **Vision Support** | Supported (`detail="low"` or `"high"`) | Cost-effective image analysis |

---

## 3. Benchmark Comparisons (GPT-4o-mini vs Competitors)

| Benchmark | GPT-4o-mini | GPT-3.5-Turbo | Claude 3 Haiku | Gemini 1.5 Flash |
| :--- | :--- | :--- | :--- | :--- |
| **MMLU (Reasoning)** | **82.0%** | 70.0% | 75.2% | 78.9% |
| **MGSM (Math)** | **87.0%** | 56.4% | 75.9% | 75.5% |
| **HumanEval (Code)** | **87.2%** | 69.8% | 75.9% | 74.3% |
| **MMMU (Multimodal Vision)** | **59.4%** | N/A (Text Only) | 50.2% | 56.1% |

---

## 4. Python SDK Example (Routing Sub-Task Execution)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Ultra-fast low-cost text classification task
response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "Classify the sentiment of the user review as POSITIVE, NEGATIVE, or NEUTRAL."},
        {"role": "user", "content": "The shipping was delayed by two days, but the product quality exceeded my expectations!"}
    ],
    temperature=0.0
)

print("Classification Result:", response.choices[0].message.content.strip())
```
