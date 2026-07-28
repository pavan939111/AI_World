---
title: Jina AI â€” jina-reranker-v2-base-multilingual Specification
provider: Jina AI
capability: 02-Reranking-Models
file: jina-reranker-v2-base-multilingual.md
last_updated: 2026-07-28
tags: [jina-ai, jina-embeddings-v3, 02-reranking-models, jina-reranker-v2-base-multilingual]
author: Antigravity AI Documentation Engine
---

# Jina AI â€” jina-reranker-v2-base-multilingual

## Overview
Detailed technical specification for **jina-reranker-v2-base-multilingual** under **02-Reranking-Models**.

## Model & Feature Specifications
- **Model Family**: Jina AI Multimodal Search & Web Infrastructure Series (Dr. Han Xiao)
- **Release Information**: Official production release specifications
- **Dimensions**: 1024 dimensions (jina-embeddings-v3, truncatable via Matryoshka)
- **Context Window**: 8,192 tokens
- **Pricing**: jina-embeddings-v3 ($0.02 / 1M tokens) | jina-reranker-v2 ($0.02 / 1M) | Reader API (1M Free tokens/mo)
- **API Availability**: Official Jina API (pi.jina.ai), Reader API (.jina.ai), Python SDK (jina)
- **Task Adapters**: etrieval.query, etrieval.passage, separation, classification, 	ext-matching, code

## Typical Use Cases
1. Prepending https://r.jina.ai/ to any URL to parse JavaScript pages into clean Markdown for LLM prompt context.
2. 8192-token long-context document vector search using jina-embeddings-v3 with task adapters.

## Strengths & Limitations
- **Strengths**: #1 Web scraping Reader API (.jina.ai), 8192-token context with FlashAttention, Matryoshka task adapters, multilingual cross-encoders.
- **Limitations**: Focused on search, embedding, and web data scraping infrastructure (no generative LLM chat models).

## Example Request (Jina Reader API & Python Embeddings)
`python
import os
import requests

# 1. Scrape Webpage into Clean Markdown using Jina Reader API
url_to_scrape = "https://en.wikipedia.org/wiki/Artificial_intelligence"
reader_response = requests.get(f"https://r.jina.ai/{url_to_scrape}")
markdown_content = reader_response.text
print("Scraped Markdown Snippet:")
print(markdown_content[:200])

# 2. Generate Vector Embeddings using Jina API
api_url = "https://api.jina.ai/v1/embeddings"
headers = {
    "Authorization": f"Bearer {os.environ.get('JINA_API_KEY')}",
    "Content-Type": "application/json"
}
payload = {
    "model": "jina-embeddings-v3",
    "task": "retrieval.passage",
    "dimensions": 1024,
    "input": [markdown_content[:500]]
}

emb_response = requests.post(api_url, headers=headers, json=payload)
print(f"Embedding Vector Dimension: {len(emb_response.json()['data'][0]['embedding'])}") # 1024
`

## Related Documentation & Models
- See official Jina AI documentation at https://jina.ai & https://r.jina.ai
