---
title: Claude 3.7 Sonnet — Pricing
service: 01-Language-Models
model: Claude-3-7-Sonnet
section: 03-Models
file: Pricing.md
last_updated: 2026-07-28
tags: [language-models, claude-3-7-sonnet, pricing, cost]
author: Antigravity AI Knowledge Engine
---

# Claude 3.7 Sonnet — Pricing Reference

The API billing structures, prompt caching discounts, and reasoning token costs for Claude 3.7 Sonnet.

---

## 1. Standard Token Pricing

Billing is calculated per 1 Million tokens and divided between input queries and generated outputs.

| Model | Input Price (per 1M tokens) | Output Price (per 1M tokens) | Description |
| :--- | :--- | :--- | :--- |
| **Claude 3.7 Sonnet** | **$3.00** | **$15.00** | Flagship hybrid reasoning model. |

---

## 2. Thinking (Reasoning) Token Billing

When running in **Thinking Mode**, the model generates two types of output tokens:
1. **Thinking Tokens**: The internal, hidden chain-of-thought tokens (enclosed in `<thinking>` blocks in raw API streams).
2. **Standard Output Tokens**: The final response returned to the user.

* **Billing Rate**: Both thinking tokens and standard output tokens are billed at the **standard output rate ($15.00 per 1M tokens)**.
* **Impact**: Allocating a large thinking budget (e.g., 4096 tokens) adds up to $0.06 of processing cost per request, regardless of the length of the final visible response.

---

## 3. Ephemeral Prompt Caching Rates

Anthropic allows manual prompt caching of static instructions, system contexts, or history.

| Cache Operation | Price (per 1M tokens) | Comparison to Standard | Description |
| :--- | :--- | :--- | :--- |
| **Cache Write (Creation)** | **$3.75** | ~1.25x Standard Input | Billed when a cached segment is compiled and written for the first time. |
| **Cache Read (Hit)** | **$0.30** | **0.10x Standard Input** (90% off) | Billed on subsequent calls when hitting the active cache, yielding a 90% discount. |

* **Cache Lifespan**: Ephemeral caches persist in memory for approximately 5 minutes after the most recent request.
