---
title: OpenAI GPT-3.5 Turbo â€” Legacy Technical Reference
provider: OpenAI
capability: 01-Language-Models
model: GPT-3.5-Turbo
file: GPT-3.5-Turbo.md
last_updated: 2026-07-28
tags: [openai, gpt-3-5-turbo, legacy-models, 16k-context]
author: Antigravity AI Knowledge Engine
---

# OpenAI GPT-3.5 Turbo â€” Legacy Technical Reference

## 1. Overview & Deprecation Context
**GPT-3.5 Turbo** (`gpt-3.5-turbo-0125`) powered the original launch of ChatGPT. While historically significant, it has been officially superseded by **`gpt-4o-mini`**.

---

## 2. Technical Specifications & Pricing

| Parameter | Specification | Notes / Details |
| :--- | :--- | :--- |
| **Model ID** | `gpt-3.5-turbo`, `gpt-3.5-turbo-0125` | Legacy endpoint pointer |
| **Context Window** | 16,385 tokens | 16k context window |
| **Max Output Tokens** | 4,096 tokens | Completion limit |
| **API Pricing (1M Tokens)**| **$0.50 Input / $1.50 Output** | **3x more expensive than GPT-4o-mini** |

---

## 3. Migration Action Required
All projects using `gpt-3.5-turbo` should update model pointers to `gpt-4o-mini` to instantly gain 128k context, vision support, 12% higher MMLU accuracy, and a 70% reduction in API bills.
