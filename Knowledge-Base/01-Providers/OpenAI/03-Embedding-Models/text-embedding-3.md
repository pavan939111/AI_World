---
title: OpenAI Text Embeddings â€” Technical Specification & Vector Search Guide
provider: OpenAI
capability: 03-Embedding-Models
model: text-embedding-3-large
file: text-embedding-3.md
last_updated: 2026-07-28
tags: [openai, embeddings, vector-search, text-embedding-3-large, text-embedding-3-small, matryoshka]
author: Antigravity AI Knowledge Engine
---

# OpenAI Text Embeddings â€” Technical Specification & Vector Search Guide

## 1. Summary & Matryoshka Dimension Truncation
OpenAI offers two primary vector embedding models: **`text-embedding-3-small`** and **`text-embedding-3-large`**.

These models utilize **Matryoshka Representation Learning (MRL)**, which allows developers to truncate vector dimensions (e.g. reducing 3072-dimensional vectors to 1536 or 256 dimensions) via the `dimensions` parameter without sacrificing significant semantic search accuracy.

---

## 2. Technical Specifications & Pricing

| Model ID | Native Dimensions | Max Context | MTEB Retrieval Score | API Pricing (per 1M Tokens) | Truncation Support |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **`text-embedding-3-large`**| **3,072 dimensions** | **8,191 tokens** | **64.6** | **$0.130 / 1M** | Yes (1536, 1024, 512, 256) |
| **`text-embedding-3-small`**| **1,536 dimensions** | **8,191 tokens** | **62.3** | **$0.020 / 1M** | Yes (512, 256) |
| `text-embedding-ada-002` (Legacy)| 1,536 dimensions | 8,191 tokens | 61.0 | $0.100 / 1M | No |

---

## 3. Python Integration Example (Dimension Truncation)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

text_to_embed = "Vector embeddings project semantic meaning into high-dimensional geometric space."

# Generate truncated 256-dimensional vector embedding
response = client.embeddings.create(
    model="text-embedding-3-large",
    input=text_to_embed,
    dimensions=256
)

embedding_vector = response.data[0].embedding
print(f"Generated Vector Dimension: {len(embedding_vector)}") # 256
print(f"Sample Vector Values: {embedding_vector[:5]}")
```
