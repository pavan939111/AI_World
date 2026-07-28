---
title: DeepSeek-R1 — Pricing
service: 01-Language-Models
model: DeepSeek-R1
section: 03-Models
file: Pricing.md
last_updated: 2026-07-28
tags: [language-models, deepseek-r1, pricing, cost]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-R1 — Pricing Reference

An overview of token transaction pricing, reasoning token billing, and prompt caching discounts for DeepSeek-R1.

---

## 1. DeepSeek Cloud API Pricing

DeepSeek-R1 is hosted at a competitive price point for reasoning models. Rates are calculated per 1 Million tokens:

| Token Transaction Type | Price (per 1M tokens) | Comparison to Cache Miss | Details |
| :--- | :--- | :--- | :--- |
| **Input (Cache Miss)** | **$0.55** | Base Rate | Billed when parsing prompt text for the first time. |
| **Input (Cache Hit)** | **$0.14** | **75% Discount** | Billed automatically on prefix cache hits. |
| **Output** | **$2.19** | Base Rate | Billed for generated tokens (includes thinking and visible text). |

---

## 2. Reasoning (Thinking) Token Billing

When running `deepseek-reasoner`, the API generates two outputs:
1. **Reasoning Tokens**: The internal chain-of-thought tokens (represented in the `reasoning_content` parameter).
2. **Final Content Tokens**: The standard visible response content.

* **Billing Rate**: Both reasoning tokens and final content tokens are billed equally at the **standard output rate ($2.19 per 1M tokens)**.
* **Cost Profile**: A long reasoning path (e.g. 3,000 thinking tokens) adds approximately $0.0065 to the request cost, regardless of how short the final response text is.

---

## 3. Cost Comparison vs. Closed Alternatives

* **Output Cost Comparison**: DeepSeek-R1's output token rate ($2.19 per 1M) is **96.3% cheaper** than OpenAI o1 ($60.00 per 1M) and **85.4% cheaper** than Claude 3.7 Sonnet ($15.00 per 1M).
* **Automatic Cache Hit Discount**: Using persistent system prefixes drops input rates to **$0.14 per 1M**, reducing costs for iterative programming cycles or chat histories.
