---
title: DeepSeek-V3 — Pricing
service: 01-Language-Models
model: DeepSeek-V3
section: 03-Models
file: Pricing.md
last_updated: 2026-07-28
tags: [language-models, deepseek-v3, pricing, cost]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-V3 — Pricing Reference

An overview of token rates and automatic prompt caching discounts for DeepSeek-V3 Cloud APIs.

---

## 1. DeepSeek Cloud API Pricing

DeepSeek’s pricing structure is significantly lower than that of Western proprietary providers. Rates are calculated per 1 Million tokens:

| Token Transaction Type | Price (per 1M tokens) | Comparison to Cache Miss | Details |
| :--- | :--- | :--- | :--- |
| **Input (Cache Miss)** | **$0.14** | Base Rate | Applied when prompt text is parsed for the first time. |
| **Input (Cache Hit)** | **$0.055** | **60% Discount** | Applied automatically when hitting prefix caches. |
| **Output** | **$0.28** | Base Rate | Billed for generated tokens. |

---

## 2. Automatic Prompt Caching

DeepSeek handles prompt caching implicitly at the server level, requiring no manual headers or API changes from developers:

* **Prefix Caching**: If consecutive user requests share a matching prefix (e.g., identical system instructions, background datasets, or historical chat messages), the server automatically hits the cache.
* **Saving**: Prompt tokens matching the cached prefix are billed at the **Cache Hit rate ($0.055 per 1M)**, reducing input costs by over 60% automatically.

---

## 3. Cost-Efficiency vs. Proprietary Alternatives

* **Output Cost Comparison**: DeepSeek-V3's output token rate ($0.28 per 1M) is **98% cheaper** than Claude 3.7 Sonnet ($15.00 per 1M) and **97% cheaper** than GPT-4o ($10.00 per 1M).
* **Workload Application**: Highly suited for processing massive documents, chat history logging, and high-concurrency translation or summarization jobs.
