---
title: Gemini 2.5 Pro — Pricing
service: 01-Language-Models
model: Gemini-2-5-Pro
section: 03-Models
file: Pricing.md
last_updated: 2026-07-28
tags: [language-models, gemini-2-5-pro, pricing, cost]
author: Antigravity AI Knowledge Engine
---

# Gemini 2.5 Pro — Pricing Reference

The API billing structures, context caching fees, and tier pricing for Gemini 2.5 Pro on Vertex AI and Google AI Studio platforms.

---

## 1. Vertex AI Pay-As-You-Go Pricing

Google Cloud Vertex AI bills requests based on standard vs. long context thresholds. Pricing is computed per 1 Million tokens:

| Context Window Threshold | Input Price (per 1M tokens) | Output Price (per 1M tokens) | Details |
| :--- | :--- | :--- | :--- |
| **Standard Context (<128k tokens)** | **$1.25** | **$5.00** | Standard requests. |
| **Long Context (>128k tokens)** | **$2.50** | **$10.00** | Applied when prompt + generation exceeds 128k tokens. |

---

## 2. Google AI Studio Pricing (Developer Console)

Google AI Studio provides a dual-rate tier structure:

* **Free Tier**: 
  * Cost: **$0.00** (Free).
  * Rate Limits: 2 RPM (Requests Per Minute), 32,000 TPM, 50 RPD.
  * Trade-off: Google may use inputs and outputs for model training.
* **Pay-As-You-Go Tier**:
  * Input (<128k): **$1.25** / Output: **$5.00** per 1M tokens.
  * Input (>128k): **$2.50** / Output: **$10.00** per 1M tokens.
  * Privacy: Customer data is kept private and not used for model training.

---

## 3. Context Caching Cost Structure

To optimize costs for large files (such as codebases, audio files, or videos), developers can cache prompt prefixes:

* **Cache Storage Cost**: Billed per hour for keeping the cached tokens in GPU memory.
  * Cost: **$4.50** per 1M cached tokens per hour.
* **Cache Read Cost**: Billed when a request hits the active cache (offering a ~75% discount on standard input pricing).
  * Cost (<128k): **$0.3125** per 1M tokens.
  * Cost (>128k): **$0.625** per 1M tokens.
