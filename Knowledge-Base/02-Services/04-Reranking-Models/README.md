---
title: AI Service â€” 04-Reranking-Models Complete Master Reference
service: 04-Reranking-Models
view: By Service
last_updated: 2026-07-28
tags: [reranking-models, cross-encoder, cohere-rerank, voyage-rerank, jina-reranker, nv-rerank, bge-reranker]
author: Antigravity AI Knowledge Engine
---

# AI Service â€” 04-Reranking-Models: Master Technical Specification & Encyclopedia

Welcome to the **04-Reranking-Models Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, two-stage retrieval handbook, and production architectural guide for Cross-Encoder Reranking Models.

---

# ðŸ“ Service Folder Structure & Taxonomy

`	ext
04-Reranking-Models/
â”œâ”€â”€ 00-Overview/                            # What are Reranking Models, History, Two-Stage Retrieval Pipeline, Terminology, FAQ
â”œâ”€â”€ 01-Fundamentals/                        # Cross-Encoder vs Bi-Encoder, Attention Matrix, Relevance Scoring, Top-N Filtering, Recall vs Precision
â”œâ”€â”€ 02-Providers/                           # Cohere, Voyage AI, Jina AI, NVIDIA, BAAI, Mixedbread AI, ZeroShot
â”œâ”€â”€ 03-Models/                              # Deep-Dive Specs for cohere-rerank-v3.5, voyage-rerank-2, jina-reranker-v2, nv-rerank-v1, bge-reranker, etc.
â”‚   â”œâ”€â”€ cohere-rerank-v3-5/                 # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
â”‚   â”œâ”€â”€ voyage-rerank-2/                    # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ jina-reranker-v2-multilingual/      # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ nv-rerank-v1/                       # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ bge-reranker-large/                 # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ bge-reranker-v2-m3/                 # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ mxbai-rerank-large-v1/              # (10 Deep-Dive Spec Files)
â”‚   â””â”€â”€ voyage-rerank-2-lite/               # (10 Deep-Dive Spec Files)
â”œâ”€â”€ 04-Tasks/                               # Candidate Rescoring, Keyword Rescoring, Hybrid Search Fusion, Multi-Doc RAG Filtering
â”œâ”€â”€ 05-API/                                 # REST APIs, SDKs, Auth, Request Formats (	op_n), Rate Limits, Pricing, Error Handling
â”œâ”€â”€ 06-Pipeline-Integration/                # Two-Stage Retrieval Workflow, Hybrid BM25 Fusion, Score Thresholding, LangChain / LlamaIndex
â”œâ”€â”€ 07-Quality/                             # NDCG@10 Benchmark, MAP Score, MRR (Mean Reciprocal Rank), Cross-Encoder Accuracy Gains
â”œâ”€â”€ 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best Multilingual, Decision Matrix
â”œâ”€â”€ 09-Use-Cases/                           # Enterprise Knowledge Base, Legal Retrieval, E-Commerce Search, Medical Search
â”œâ”€â”€ 10-Open-Source/                         # BGE Reranker Large, MXBAI Rerank, FlashRank, Sentence-Transformers CrossEncoder, Local Serving
â”œâ”€â”€ 11-Production/                          # Latency Budget Optimization (sub-50ms), Batch Processing, Score Normalization, Caching
â”œâ”€â”€ 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
â”œâ”€â”€ 13-Benchmarks/                          # NDCG@10 Score, Reranking Latency (ms), Cost per 100k Tokens, Accuracy Gain
â”œâ”€â”€ 14-Learning-Resources/                  # Official Docs, Research Papers (Cross-Encoders for IR, BEIR), Blogs, Videos, Courses
â””â”€â”€ 15-Glossary/                            # Terms, Acronyms, References
`

---

# ðŸŽ¯ Model Comparison & Decision Matrix Snapshot

| Model | Provider | Architecture | Multilingual Support | NDCG@10 Gain Over Raw Vector Search | API Pricing (per 100k search tokens) | Open-Weights |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **cohere-rerank-v3.5** | Cohere | Multi-Aspect Cross-Encoder | 100+ Languages | **+25% Accuracy Gain** | **.020 / 100k** | Proprietary API |
| **voyage-rerank-2** | Voyage AI | SOTA Dense Cross-Encoder | High English / Code | **+28% Accuracy Gain** | **.050 / 100k** | Proprietary API |
| **jina-reranker-v2-multilingual** | Jina AI | Multilingual Cross-Encoder | 100+ Languages | **+24% Accuracy Gain** | **.020 / 1M** | Proprietary API |
| **nv-rerank-v1** | NVIDIA | NVIDIA NIM Cross-Encoder | English / Enterprise | **+26% Accuracy Gain** | NVIDIA AI Enterprise | NIM Microservice |
| **bge-reranker-large** | BAAI | Open Cross-Encoder | English / Chinese | **+22% Accuracy Gain** | **Free (Apache 2.0)** | **Open-Weights** |
| **mxbai-rerank-large-v1** | Mixedbread | Open Cross-Encoder | English | **+23% Accuracy Gain** | **Free (Apache 2.0)** | **Open-Weights** |

---

# ðŸš€ Quick Start Example: Calling Cohere Rerank API

`python
import os
import cohere

co = cohere.Client(os.environ.get("COHERE_API_KEY"))

# Two-Stage Retrieval: Rerank vector search candidate results
results = co.rerank(
    query="How does Matryoshka vector truncation reduce storage costs?",
    documents=[
        "Matryoshka Representation Learning allows truncating vector dimensions while preserving recall accuracy.",
        "Vector databases index high-dimensional embeddings using HNSW graphs.",
        "Python is a popular programming language for AI development."
    ],
    top_n=1,
    model="rerank-v3.5"
)

print(f"Top Document Index: {results.results[0].index}")
print(f"Relevance Score: {results.results[0].relevance_score:.4f}")
`

---

# ðŸ“š Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for two-stage retrieval concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for Cross-Encoder vs Bi-Encoder self-attention mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on cohere-rerank-v3.5, voyage-rerank-2, jina-reranker-v2, nv-rerank-v1, and bge-reranker.
- Explore **[06-Pipeline-Integration](./06-Pipeline-Integration/README.md)** for LangChain and LlamaIndex two-stage RAG integration scripts.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Paid, Fastest, Best Multilingual).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for FlashRank, BGE Reranker, and local Hugging Face cross-encoder serving.
