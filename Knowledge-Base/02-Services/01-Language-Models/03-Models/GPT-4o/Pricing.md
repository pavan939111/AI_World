---
title: GPT-4o — Pricing
service: 01-Language-Models
model: GPT-4o
section: 03-Models
file: Pricing.md
last_updated: 2026-07-28
tags: [language-models, gpt-4o, pricing, cost]
author: Antigravity AI Knowledge Engine
---

# GPT-4o — Pricing Reference

The API billing rates, caching discounts, and comparison pricing for GPT-4o endpoints.

---

## 1. Standard API Pricing

Pricing is calculated per 1 Million tokens and billed separately for input queries (prompts) and output generations (completions).

| Model Variant | Input Price (per 1M tokens) | Output Price (per 1M tokens) | Rationale |
| :--- | :--- | :--- | :--- |
| **GPT-4o (Standard)** | **$2.50** | **$10.00** | Flagship reasoning and multimodal model. |
| **GPT-4o mini** | **$0.15** | **$0.60** | Cost-effective variant for high-volume pipelines. |

---

## 2. API Cost Optimization Schemes

OpenAI offers two primary mechanisms to reduce token costs:

### A. Automatic Prompt Caching
* **Discounts**: Cached input tokens are charged at a **50% discount** compared to standard input rates:
  * **GPT-4o Cached Input**: **$1.25** per 1M tokens.
  * **GPT-4o mini Cached Input**: **$0.075** per 1M tokens.
* **Mechanism**: Caching is automatic for prompt prefixes longer than 1024 tokens. When identical system prompts, system files, or conversational history strings are detected across consecutive calls, the cached rate is applied.

### B. Batch API (Asynchronous Processing)
* **Discounts**: Off-peak, non-real-time jobs run via the Batch API endpoint receive a flat **50% discount** on both input and output tokens:
  * **GPT-4o Batch Input**: **$1.25** per 1M tokens.
  * **GPT-4o Batch Output**: **$5.00** per 1M tokens.
* **Mechanism**: Requests are uploaded as a `.jsonl` file and executed asynchronously. Results are returned within 24 hours (usually much faster).

---

## 3. Multimodal (Media) Pricing

For multimodal inputs, files are translated into equivalent token counts before billing:

* **Image Inputs (Vision)**: Ingesting an image uses a detail-mode token formula:
  * **Low-Detail Mode**: Flat cost of **85 tokens** per image.
  * **High-Detail Mode**: Images are scaled to fit a $2048 \times 2048$ box, then scaled down so the shortest side is 768px. The image is split into $512 \times 512$ tile squares. Each tile costs **170 tokens**, plus a flat base fee of **85 tokens**.
* **Audio Inputs (Speech)**: Billed per minute of audio processed. Input audio is converted to tokens at approximately **2.8k tokens per minute**.
