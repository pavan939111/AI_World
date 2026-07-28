---
title: Command R+ — Pricing & Hosting Economics
service: 01-Language-Models
model: Command-R-Plus
section: 03-Models
file: Pricing.md
last_updated: 2026-07-28
tags: [language-models, command-r-plus, pricing, cost]
author: Antigravity AI Knowledge Engine
---

# Command R+ — Pricing & Hosting Economics

An overview of local weight licensing structures, hardware configurations, and Cohere platform serverless API pricing.

---

## 1. Licensing & Local Hosting Infrastructure

Cohere releases Command R+ weights under dual terms:

* **Cohere Non-Commercial License (C-UDA)**:
  * Cost: **Free ($0.00)**.
  * Scope: Permitted for research, educational projects, testing, and private evaluation work.
* **Commercial Enterprise Licensing**:
  * Cost: Requires custom negotiation contracts directly with Cohere's enterprise division.
  * Scope: Required to use weights for commercial production deployment or integration into commercial services.
* **Local Hardware Profile**: Servicing the 104 Billion parameter weights locally requires **~208 GB VRAM** for FP16 configurations, requiring multi-GPU servers (e.g. 4x A100 or H100 GPU clusters).

---

## 2. Serverless API Pricing (Cohere Cloud)

For organizations choosing managed hosting, Cohere endpoints are priced per 1 Million tokens:

| API Tier | Input Price (per 1M tokens) | Output Price (per 1M tokens) | Details |
| :--- | :--- | :--- | :--- |
| **Cohere Platform API** | **$2.50** | **$10.00** | Accessed via model string `command-r-plus`. |

---

## 3. Alternative Cloud Provider Pricing

Third-party serverless cloud hosts (e.g. Together AI, AWS SageMaker) also host the model:

* **Together AI Serverless**: Input: **$2.50** / Output: **$10.00** per 1M tokens.
* **AWS SageMaker Marketplace**: Subject to regional server instances and hourly compute configurations.
