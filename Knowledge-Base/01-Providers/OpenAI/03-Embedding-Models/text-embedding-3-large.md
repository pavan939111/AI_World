---
title: OpenAI text-embedding-3-large â€” SOTA Vector Embedding Specification
provider: OpenAI
capability: 03-Embedding-Models
model: text-embedding-3-large
file: text-embedding-3-large.md
last_updated: 2026-07-28
tags: [openai, embeddings, text-embedding-3-large, vector-search, mteb, matryoshka]
author: Antigravity AI Knowledge Engine
---

# OpenAI text-embedding-3-large â€” Technical Specification & Vector Guide

## 1. Summary & Architecture
**`text-embedding-3-large`** is OpenAI's flagship text embedding foundation model. It converts text into 3,072-dimensional dense floating-point vector representations tailored for semantic search, enterprise RAG document retrieval, code search, and clustering.

The model natively supports **Matryoshka Representation Learning (MRL)**, allowing developers to truncate vector dimensions (e.g. from 3072 to 1536, 1024, 512, or 256) via the `dimensions` API parameter while retaining high search recall.

---

## 2. Technical Specifications & Pricing

| Parameter | Specification | Notes / Details |
| :--- | :--- | :--- |
| **Model ID** | `text-embedding-3-large` | Production endpoint |
| **Native Dimensions** | **3,072 dimensions** | Maximum vector dimension size |
| **Context Window** | **8,191 tokens** | Input document token ceiling |
| **MTEB Retrieval Score** | **64.6** | Multi-domain retrieval benchmark |
| **API Pricing (1M Tokens)**| **$0.130 / 1M Tokens** | Cost per 1M processed tokens |
| **Supported Dimensions** | 3072, 1536, 1024, 512, 256 | Configurable via `dimensions` parameter |
| **Default Distance Metric**| **Cosine Similarity** / Inner Product | Vectors are pre-normalized to L2=1 |

---

## 3. Matryoshka Truncation & Accuracy Trade-Off Table

| Dimensions Requested | Memory Storage Saved | MTEB Retrieval Recall | Recommended Use Case |
| :--- | :--- | :--- | :--- |
| **3,072 (Native)** | 0% (Full Size) | **64.6 (100%)** | SOTA precision legal & medical search |
| **1,536** | **50% Memory Saved** | **64.3 (99.5%)** | Standard enterprise RAG vector search |
| **512** | **83% Memory Saved** | **62.8 (97.2%)** | High-volume fast vector database search |
| **256** | **92% Memory Saved** | **61.1 (94.6%)** | In-memory edge or mobile vector search |

---

## 4. Python SDK Example (Matryoshka Dimension Truncation)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

text_data = "Enterprise RAG system retrieving dense semantic vectors from Qdrant database."

# Request 1536-dim truncated embedding (50% storage savings)
response = client.embeddings.create(
    model="text-embedding-3-large",
    input=text_data,
    dimensions=1536
)

vector = response.data[0].embedding
print(f"Truncated Vector Dimension: {len(vector)}") # 1536
print(f"First 3 Float Values: {vector[:3]}")
```
