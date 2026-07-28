---
title: OpenAI Embedding Models â€” Comparative Selection Matrix
provider: OpenAI
capability: 03-Embedding-Models
file: Comparisons.md
last_updated: 2026-07-28
tags: [openai, embedding-models, comparison, text-embedding-3-large, text-embedding-3-small]
author: Antigravity AI Knowledge Engine
---

# OpenAI Embedding Models â€” Comparative Selection Matrix

| Feature / Metric | text-embedding-3-large | text-embedding-3-small | text-embedding-ada-002 (Legacy) |
| :--- | :--- | :--- | :--- |
| **Primary Focus** | SOTA Retrieval Precision | Low Cost & High Speed | Legacy Baseline |
| **Native Dimensions** | **3,072 dims** | 1,536 dims | 1,536 dims |
| **MTEB Retrieval Score** | **64.6** (#1 OpenAI) | 62.3 | 61.0 |
| **Context Window** | **8,191 tokens** | 8,191 tokens | 8,191 tokens |
| **API Price per 1M** | **$0.130 / 1M** | **$0.020 / 1M** (Cheapest) | $0.100 / 1M |
| **Matryoshka Truncation**| **Yes (1536, 1024, 512, 256)** | Yes (512, 256) | No |
