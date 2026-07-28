---
title: Voyage AI â€” Vector-Representation-Architecture Specification
provider: Voyage AI
capability: 00-Overview
file: Vector-Representation-Architecture.md
last_updated: 2026-07-28
tags: [voyage-ai, voyage-3, 00-overview, vector-representation-architecture]
author: Antigravity AI Documentation Engine
---

# Voyage AI â€” Vector-Representation-Architecture

## Overview
Detailed technical specification for **Vector-Representation-Architecture** under **00-Overview**.

## Model & Feature Specifications
- **Model Family**: Voyage AI Vector Embedding & Reranking Series (Stanford AI Lab Origin)
- **Release Information**: Official production release specifications
- **Dimensions**: 1024 dimensions (voyage-3), 512 dimensions (voyage-3-lite)
- **Context Window**: 32,000 tokens
- **Pricing**: voyage-3 ($0.06 / 1M tokens) | voyage-code-3 ($0.12 / 1M) | rerank-2 ($0.05 / 100k tokens)
- **API Availability**: Official Voyage API (pi.voyageai.com), Python SDK (oyageai), LangChain, LlamaIndex
- **Matryoshka Truncation**: Supported (Truncate to 512, 256, 128 dimensions)
- **Input Types**: query or document

## Typical Use Cases
1. Production two-stage retrieval pipeline (voyage-3 vector search + rerank-2 cross-encoder reranking).
2. Specialized code repository search across 30+ languages using voyage-code-3.

## Strengths & Limitations
- **Strengths**: Industry-leading retrieval accuracy on MTEB benchmarks, specialized domain models (Code, Finance, Law), Matryoshka dimension truncation.
- **Limitations**: Specialized exclusively on vector embeddings and reranking (does not output generative text chat).

## Example Request (Official Python SDK)
`python
import os
import voyageai

vo = voyageai.Client(api_key=os.environ.get("VOYAGE_API_KEY"))

# 1. Embed Query and Documents
documents = [
    "Voyage AI provides state-of-the-art vector embedding models for RAG.",
    "Python is a high-level programming language used in machine learning."
]

result = vo.embed(documents, model="voyage-3", input_type="document")
print(f"Embedding Vector Dim: {len(result.embeddings[0])}") # 1024

# 2. Rerank Documents
rerank_result = vo.rerank(
    query="What is Voyage AI used for?",
    documents=documents,
    model="rerank-2",
    top_k=1
)
print(f"Top Result Score: {rerank_result.results[0].relevance_score}")
`

## Related Documentation & Models
- See official Voyage AI documentation at https://docs.voyageai.com
