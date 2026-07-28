---
title: OpenAI GPT-4 (Original) â€” Technical Specification & Legacy Reference
provider: OpenAI
capability: 01-Language-Models
model: GPT-4
file: GPT-4.md
last_updated: 2026-07-28
tags: [openai, gpt-4, legacy-models, 8k-context, 32k-context]
author: Antigravity AI Knowledge Engine
---

# OpenAI GPT-4 (Original) â€” Technical Specification & Legacy Reference

## 1. Model Overview
**GPT-4** (original `gpt-4-0613` and `gpt-4-32k`) was OpenAI's historical frontier model released in March 2023. It introduced massive improvements in reasoning, safety alignment, and academic test performance over GPT-3.5.

---

## 2. Technical Specifications & Pricing

| Parameter | `gpt-4-0613` | `gpt-4-32k` (Legacy) |
| :--- | :--- | :--- |
| **Context Window** | 8,192 tokens | 32,768 tokens |
| **Max Output Tokens** | 4,096 tokens | 4,096 tokens |
| **API Pricing (1M Tokens)**| **$30.00 Input / $60.00 Output** | **$60.00 Input / $120.00 Output** |
| **Knowledge Cutoff** | September 2021 | September 2021 |

---

## 3. Migration Directive
`gpt-4` is considered a legacy tier. Developers should migrate to `gpt-4o` ($2.50/$10.00 per 1M) or `gpt-4o-mini` ($0.15/$0.60 per 1M) for higher accuracy, larger 128k context, and up to 96% cost savings.
