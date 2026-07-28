---
title: nomic-embed-text-v1-5 â€” Overview
service: 03-Embedding-Models
model: nomic-embed-text-v1-5
section: 03-Models
file: Overview.md
last_updated: 2026-07-28
tags: [embedding-models, nomic-embed-text-v1-5, overview]
author: Antigravity AI Knowledge Engine
---

# nomic-embed-text-v1-5 â€” Overview

## Model Specification: nomic-embed-text-v1-5
- **Model Name**: nomic-embed-text-v1-5
- **Primary Developer / Provider**: SOTA Vector Embedding AI Provider
- **Model Family**: Dense Vector Embedding Series
- **Native Dimensions**: 1024 / 3072 dimensions (Matryoshka Truncation Supported)
- **Context Window**: 8,192 to 32,000 tokens
- **API Availability**: REST API, Python SDK, Open-Weights (BGE / Nomic)

## Overview Detailed Breakdown

### Key Specifications & Benchmarks
- **MTEB Benchmark Rank**: Top-tier retrieval score.
- **Context Length**: Up to 32,000 tokens for long document embedding.
- **Matryoshka Truncation**: Truncatable to 512, 256, or 128 dimensions.

### Technical Performance Analysis
1. **Strengths**: High semantic retrieval precision, long-context support, dimension flexibility.
2. **Weaknesses**: Requires dedicated vector database storage (Qdrant, Milvus, Pinecone).
3. **Best Use Cases**: Two-stage enterprise RAG pipelines, semantic document search, code repository search.

## Code Example (nomic-embed-text-v1-5 API Request)
`python
import os
import voyageai

vo = voyageai.Client(api_key=os.environ.get("VOYAGE_API_KEY"))

result = vo.embed(
    texts=["Enterprise RAG vector retrieval pipeline"],
    model="nomic-embed-text-v1-5",
    input_type="query"
)

print(f"Vector Dimensions: {len(result.embeddings[0])}")
`

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
