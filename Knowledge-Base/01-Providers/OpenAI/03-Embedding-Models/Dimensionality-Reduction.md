---
title: OpenAI Vector Embeddings â€” Dimensionality Reduction & Matryoshka Mechanics
provider: OpenAI
capability: 03-Embedding-Models
file: Dimensionality-Reduction.md
last_updated: 2026-07-28
tags: [openai, embeddings, matryoshka, dimensionality-reduction, vector-db]
author: Antigravity AI Knowledge Engine
---

# OpenAI Vector Embeddings â€” Dimensionality Reduction & Matryoshka Mechanics

## 1. How Matryoshka Truncation Works
OpenAI `text-embedding-3` models are trained such that the most critical semantic information is concentrated in the early indices of the vector array.

Passing `dimensions=512` in the API call instructs the server to slice the first 512 floats of the vector and re-normalize the vector using L2 normalization:

```text
Full Vector (3072 dims) â”€â”€â–º Slice First 512 Floats â”€â”€â–º L2 Normalization (||v||=1) â”€â”€â–º Return 512-dim Vector
```

---

## 2. Vector Database Storage Impact

| Dimension Size | Bytes per Vector (Float32) | Memory Footprint for 1,000,000 Vectors |
| :--- | :--- | :--- |
| **3,072 dims** | 12,288 Bytes (~12.3 KB) | **12.3 GB RAM** |
| **1,536 dims** | 6,144 Bytes (~6.1 KB) | **6.1 GB RAM** |
| **512 dims** | 2,048 Bytes (~2.0 KB) | **2.0 GB RAM** |
| **256 dims** | 1,024 Bytes (~1.0 KB) | **1.0 GB RAM (92% Savings)** |
