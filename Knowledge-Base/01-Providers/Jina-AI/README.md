---
title: Jina AI — Complete Technical Specification & Provider Reference
provider: Jina AI
view: By Provider
last_updated: 2026-07-28
tags: [jina-ai, jina-embeddings-v3, reader-api, search-api, reranker, clip, web-scraping]
author: Antigravity AI Documentation Engine
---

# Jina AI — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Jina AI GmbH
- **Parent Company**: Jina AI GmbH
- **Founders**: Dr. Han Xiao (CEO & Founder, creator of Fashion-MNIST and `bert-as-service`), Alex Cureton-Gordon
- **Headquarters**: Berlin, Germany (Secondary presence in Palo Alto, CA and Shenzhen)
- **Year Founded**: February 2020
- **Mission**: To build multimodal search AI infrastructure and web scraping pipelines that make web content instantly accessible for LLMs and RAG systems.
- **Valuation & Funding**: $38 Million funding round led by Canaan Partners, Granite Asia (GGV Capital), and SAP.iO.
- **AI Ecosystem**: Full-stack search infrastructure providing jina-embeddings-v3 (8192-token context vector model with Matryoshka Task Adapters), jina-reranker-v2-base-multilingual (cross-encoder across 100+ languages), jina-clip-v2 (joint text-image embeddings), Jina Reader API (`r.jina.ai` converting any webpage into clean Markdown), Jina Search API (`s.jina.ai` real-time web search grounding), Jina Segmenter API (`segment.jina.ai`), and official REST API (`api.jina.ai/v1`).
- **Timeline & Major Milestones**:
  - **2020**: Founded in Berlin by Dr. Han Xiao.
  - **2021**: Released open-source Jina Core neural search framework.
  - **2023**: Launched jina-embeddings-v2 offering 8192-token long context embeddings.
  - **March 2024**: Launched viral Jina Reader API (`r.jina.ai`) allowing developers to prepend `r.jina.ai/` to any URL to parse clean Markdown for LLMs.
  - **September 2024**: Released jina-embeddings-v3 with Matryoshka task-specific adapters, jina-reranker-v2, and jina-clip-v2.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Vector Embeddings** | 8192-token long-context embeddings with Matryoshka Task Adapters | Yes | jina-embeddings-v3 | Active |
| **Web Reader API** | Prepend `r.jina.ai/` to any URL to parse JavaScript pages into clean Markdown | Yes | `r.jina.ai/<URL>` | Active |
| **Web Search API** | Prepend `s.jina.ai/` to any query for real-time web search grounding in Markdown | Yes | `s.jina.ai/<query>` | Active |
| **Multilingual Reranking** | Cross-encoder relevance scoring across 100+ languages | Yes | jina-reranker-v2-base-multilingual | Active |
| **Multimodal CLIP** | Joint vision and text vector embedding space for visual RAG | Yes | jina-clip-v2 | Active |
| **Document Segmenter** | Semantic sentence and paragraph document chunking engine | Yes | `segment.jina.ai` | Active |

---

# 3. Embedding & Reranking Models

### Model: jina-embeddings-v3
- **Name**: jina-embeddings-v3 (`jina-embeddings-v3`)
- **Release Date**: September 2024
- **Dimensions**: 1,024 dimensions (Truncatable to 512, 256, 128, 64)
- **Context Window**: 8,192 tokens
- **Services Provided by the Model**:
  - **Matryoshka Task-Specific Adapters**: Optimizes embeddings dynamically by passing `task`:
    - `retrieval.query`: For query embeddings in vector search.
    - `retrieval.passage`: For document chunk embeddings in vector search.
    - `separation`: For clustering and dimension reduction.
    - `classification`: For text classification tasks.
    - `text-matching`: For pairwise semantic similarity.
    - `code`: For programming source code retrieval.
- **Pricing**: $0.020 / 1,000,000 tokens

---

# 4. Code Example (Jina Reader API & Python Embeddings)

```python
import os
import requests

# 1. Scrape Webpage into Clean Markdown using Jina Reader API
url_to_scrape = "https://en.wikipedia.org/wiki/Artificial_intelligence"
reader_response = requests.get(f"https://r.jina.ai/{url_to_scrape}")
markdown_content = reader_response.text

print("Scraped Markdown Output Snippet:")
print(markdown_content[:250])

# 2. Generate Vector Embeddings using Jina REST API
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
```

---

# 5. Pricing Summary

| Endpoint / Model | Pricing Rate |
| :--- | :--- |
| **jina-embeddings-v3** | **$0.020 / 1M tokens** |
| **jina-reranker-v2** | **$0.020 / 1M tokens** |
| **Jina Reader API (`r.jina.ai`)** | **1,000,000 Free tokens / month** |
| **Jina Search API (`s.jina.ai`)** | **$0.020 / 1k search queries** |

---

# 6. Official References

- Official Jina AI Documentation: [jina.ai](https://jina.ai)
- Jina Reader Portal: [r.jina.ai](https://r.jina.ai)
- Official GitHub: [github.com/jina-ai](https://github.com/jina-ai)
