---
title: Mistral-Large-2 — Pricing & Licensing
service: 01-Language-Models
model: Mistral-Large-2
section: 03-Models
file: Pricing.md
last_updated: 2026-07-28
tags: [language-models, mistral-large-2, pricing, licensing, cost]
author: Antigravity AI Knowledge Engine
---

# Mistral-Large-2 — Pricing & Hosting Economics

Mistral-Large-2 features a dual licensing structure. Access is split between local hosting models or utilizing serverless cloud APIs.

---

## 1. Local Serving & Licensing Structures

Because Mistral AI distributes model weights open-access, local deployment depends on the licensing category:

* **Mistral Research License (MRL)**: 
  * Cost: **Free ($0.00)**.
  * Allowable Scope: Strictly limited to research, evaluation, and non-commercial educational operations.
* **Commercial License**:
  * Cost: Requires custom enterprise contract agreements with Mistral AI.
  * Scope: Required to run weights for commercial, customer-facing, or paid business hosting.
* **Local VRAM Hardware requirements (FP16)**: Requires **~246 GB VRAM** (minimum of 8x A100 80GB or 4x H100 GPUs), which represents a high upfront infrastructure cost.

---

## 2. Serverless API Pricing (Mistral La Plateforme)

For projects using managed endpoints, Mistral AI hosts the model on their cloud platform. Rates are calculated per 1 Million tokens:

| API Tier | Input Price (per 1M tokens) | Output Price (per 1M tokens) | Details |
| :--- | :--- | :--- | :--- |
| **Mistral La Plateforme** | **$2.00** | **$6.00** | Accessed via model string `mistral-large-latest`. |

---

## 3. Alternative Cloud Provider Pricing

Third-party API providers also host Mistral-Large-2 under serverless models:

* **Together AI**: Input: **$2.00** / Output: **$6.00** per 1M tokens.
* **Fireworks AI**: Input: **$2.00** / Output: **$6.00** per 1M tokens.
