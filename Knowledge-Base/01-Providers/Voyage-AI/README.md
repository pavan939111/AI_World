---
title: Voyage AI — Complete Technical Specification & Provider Reference
provider: Voyage AI
view: By Provider
last_updated: 2026-07-28
tags: [voyage-ai, voyage-3, rerank-2, embeddings, reranking, matryoshka, vector-search]
author: Antigravity AI Documentation Engine
---

# Voyage AI — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Voyage AI Inc.
- **Parent Company**: Voyage AI Inc.
- **Founders**: Tengyu Ma (CEO & Founder, Associate Professor of Computer Science and Statistics at Stanford University)
- **Headquarters**: Palo Alto, California, USA
- **Year Founded**: 2023
- **Mission**: To build domain-specific, state-of-the-art vector embedding and semantic retrieval models that power production AI search.
- **Valuation & Funding**: $20 Million+ funding round led by CRV (Charles River Ventures), MongoDB Ventures, and prominent AI researchers.
- **AI Ecosystem**: Premier vector embedding and semantic reranking provider offering general-purpose embeddings (voyage-3 with 32k context, voyage-3-lite), domain-specific models (voyage-code-3 for programming code, voyage-finance-2 for SEC filings, voyage-law-2 for legal statutes), multimodal joint text-image embeddings (voyage-multimodal-3), cross-encoder rerankers (rerank-2), Matryoshka dimension truncation, Int8/Binary quantization, and official REST API (`api.voyageai.com/v1`).
- **Timeline & Major Milestones**:
  - **2023**: Spun out of Stanford AI Lab by Professor Tengyu Ma.
  - **December 2023**: Released voyage-02 and voyage-code-02, setting world records on MTEB retrieval benchmarks.
  - **May 2024**: Announced funding round backed by CRV and MongoDB.
  - **September 2024**: Released voyage-3 (32k context), voyage-code-3, and rerank-2.
  - **November 2024**: Released voyage-multimodal-3 for visual RAG retrieval.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **General Embeddings** | SOTA 1024-dim vector embeddings with 32k context window | Yes | voyage-3, voyage-3-lite | Active |
| **Domain-Specific Embeddings** | Specialized vector models for Code, Finance, and Legal search | Yes | voyage-code-3, voyage-finance-2, voyage-law-2 | Active |
| **Multimodal Embeddings** | Joint text & image vector space for visual PDF/chart retrieval | Yes | voyage-multimodal-3 | Active |
| **Semantic Reranking** | Cross-encoder rerankers for two-stage retrieval optimization | Yes | rerank-2, rerank-2-lite | Active |
| **Matryoshka Quantization** | Vector dimension truncation (1024 → 512 → 256) & Int8/Binary compression | Yes | Matryoshka & Quantization Spec | Active |

---

# 3. Embedding & Reranking Models

### Model: voyage-3
- **Name**: voyage-3 (`voyage-3`)
- **Release Date**: September 2024
- **Dimensions**: 1,024 dimensions (Truncatable to 512, 256, 128)
- **Context Window**: 32,000 tokens
- **Services Provided by the Model**:
  - **#1 Benchmark Retrieval Accuracy**: Beats OpenAI text-embedding-3-large and Cohere embed-v3 on MTEB and enterprise RAG benchmarks.
  - **Long-Context Document Embedding**: 32k context allows embedding entire multi-page documents in a single vector.
- **Pricing**: $0.060 / 1,000,000 tokens

### Model: rerank-2
- **Name**: rerank-2 (`rerank-2`)
- **Services Provided by the Model**:
  - **Cross-Encoder Relevance Scoring**: Re-scoring top-K retrieved vector candidates for maximum precision.
- **Pricing**: $0.050 / 100,000 tokens

---

# 4. Code Example (Official `voyageai` Python SDK)

```python
import os
import voyageai

# Initialize Voyage AI Client
vo = voyageai.Client(api_key=os.environ.get("VOYAGE_API_KEY"))

# 1. Embed Query & Documents using voyage-3
documents = [
    "Voyage AI provides state-of-the-art vector embedding models for enterprise search.",
    "Python is a popular programming language for AI development."
]

result = vo.embed(documents, model="voyage-3", input_type="document")
print(f"Embedding Vector Dimensions: {len(result.embeddings[0])}")

# 2. Rerank Candidates using rerank-2
rerank_result = vo.rerank(
    query="What is Voyage AI used for?",
    documents=documents,
    model="rerank-2",
    top_k=1
)

print(f"Top Document Index: {rerank_result.results[0].index}")
print(f"Relevance Score: {rerank_result.results[0].relevance_score}")
```

---

# 5. Pricing Summary

| Model / Endpoint | Token Price |
| :--- | :--- |
| **voyage-3** | **$0.060 / 1M tokens** |
| **voyage-3-lite** | **$0.020 / 1M tokens** |
| **voyage-code-3** | **$0.120 / 1M tokens** |
| **voyage-finance-2** | **$0.120 / 1M tokens** |
| **voyage-law-2** | **$0.120 / 1M tokens** |
| **rerank-2** | **$0.050 / 100k tokens** |

---

# 6. Official References

- Official Voyage AI API Documentation: [docs.voyageai.com](https://docs.voyageai.com)
- Voyage Dashboard: [dashboard.voyageai.com](https://dashboard.voyageai.com)
- Official Website: [voyageai.com](https://voyageai.com)
