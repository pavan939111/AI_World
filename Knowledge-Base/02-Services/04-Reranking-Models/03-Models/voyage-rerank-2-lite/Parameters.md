---
title: voyage-rerank-2-lite â€” Parameters
service: 04-Reranking-Models
model: voyage-rerank-2-lite
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [reranking-models, voyage-rerank-2-lite, parameters]
author: Antigravity AI Knowledge Engine
---

# voyage-rerank-2-lite â€” Parameters

## Model Specification: voyage-rerank-2-lite
- **Model Name**: voyage-rerank-2-lite
- **Primary Developer / Provider**: SOTA Cross-Encoder Reranker Provider
- **Model Family**: Cross-Encoder Information Retrieval Series
- **Architecture**: Joint Query-Document Self-Attention Transformer
- **Max Input Length**: 4,096 to 8,192 tokens
- **API Availability**: REST API, Python SDK, Open-Weights (BGE / Mixedbread)

## Parameters Detailed Breakdown

### Key Specifications & Benchmarks
- **NDCG@10 Benchmark**: SOTA precision relevance score.
- **Multilingual Support**: 100+ languages (for multilingual models).
- **Latency per Batch**: Sub-50ms processing time for 100 documents.

### Technical Performance Analysis
1. **Strengths**: Eliminates vector retrieval false positives, captures fine-grained keyword/phrase matches, boosts RAG accuracy by 15-30%.
2. **Weaknesses**: Adds a network hop and sub-50ms latency to the retrieval pipeline.
3. **Best Use Cases**: Two-stage enterprise RAG pipelines, legal search, medical search, e-commerce product rescoring.

## Code Example (voyage-rerank-2-lite Request)
`python
import os
import requests

api_url = "https://api.provider.ai/v1/rerank"
headers = {
    "Authorization": f"Bearer {os.environ.get('API_KEY')}",
    "Content-Type": "application/json"
}
payload = {
    "model": "voyage-rerank-2-lite",
    "query": "What is the SLA for enterprise cloud infrastructure?",
    "documents": [
        "Enterprise cloud SLA guarantees 99.99% uptime with 24/7 priority support.",
        "Cloud pricing plans start at  per month."
    ],
    "top_n": 1
}

response = requests.post(api_url, headers=headers, json=payload)
print(response.json())
`

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
