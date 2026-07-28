---
title: OpenAI GPT-4 Turbo â€” Technical Specification & Long-Context Guide
provider: OpenAI
capability: 01-Language-Models
model: GPT-4-Turbo
file: GPT-4-Turbo.md
last_updated: 2026-07-28
tags: [openai, gpt-4-turbo, llm, long-context, vision]
author: Antigravity AI Knowledge Engine
---

# OpenAI GPT-4 Turbo â€” Technical Specification & Production Guide

## 1. Summary & Architecture
**GPT-4 Turbo** (`gpt-4-turbo-2024-04-09`) is OpenAI's precursor flagship model introducing the 128k context window and vision capabilities prior to GPT-4o. It utilizes a 1.8 Trillion parameter Mixture-of-Experts (MoE) architecture.

---

## 2. Technical Specifications & Pricing

| Parameter | Specification | Notes / Details |
| :--- | :--- | :--- |
| **Model ID** | `gpt-4-turbo`, `gpt-4-turbo-2024-04-09` | Production Turbo endpoint |
| **Context Window** | **128,000 tokens** | Multi-document ingestion |
| **Max Output Tokens** | **4,096 tokens** | Response limit |
| **Knowledge Cutoff** | **December 2023** | Deep training cutoff |
| **API Pricing (1M Tokens)**| **$10.00 Input / $30.00 Output** | Higher pricing than GPT-4o |
| **Supported Modalities**| Text, Image Vision | Multimodal input support |

---

## 3. Legacy Migration Recommendation
For all new production applications, OpenAI explicitly recommends migrating from `gpt-4-turbo` to **`gpt-4o`**, which offers 4x faster generation speed, 16k output tokens, and 75% lower input token pricing ($2.50 vs $10.00).
