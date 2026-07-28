---
title: AI Service â€” 03-Embedding-Models Complete Master Reference
service: 03-Embedding-Models
view: By Service
last_updated: 2026-07-28
tags: [embedding-models, vector-embeddings, mteb, voyage-3, text-embedding-3-large, cohere-embed-v3, nv-embed-v2, bge-m3]
author: Antigravity AI Knowledge Engine
---

# AI Service â€” 03-Embedding-Models: Master Technical Specification & Encyclopedia

Welcome to the **03-Embedding-Models Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, vector optimization handbook, and production architectural guide for Dense Vector Embedding Models.

---

# ðŸ“ Service Folder Structure & Taxonomy

`	ext
03-Embedding-Models/
â”œâ”€â”€ 00-Overview/                            # What are Vector Embeddings, History, Vector Space Pipeline, AI Terminology, FAQ
â”œâ”€â”€ 01-Fundamentals/                        # Dense vs Sparse, Vector Dimensions, Distance Metrics (Cosine, L2, Dot Product), Matryoshka MRL, Quantization
â”œâ”€â”€ 02-Providers/                           # Voyage AI, OpenAI, Cohere, Jina AI, Google Vertex AI, NVIDIA (NV-Embed), Nomic AI, BAAI (BGE)
â”œâ”€â”€ 03-Models/                              # Deep-Dive Specs for voyage-3, text-embedding-3-large, cohere-embed-v3, jina-embeddings-v3, nv-embed-v2, bge-m3, etc.
â”‚   â”œâ”€â”€ voyage-3/                           # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
â”‚   â”œâ”€â”€ text-embedding-3-large/             # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ cohere-embed-v3/                    # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ jina-embeddings-v3/                 # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ nv-embed-v2/                        # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ bge-m3/                             # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ nomic-embed-text-v1-5/              # (10 Deep-Dive Spec Files)
â”‚   â””â”€â”€ voyage-code-3/                      # (10 Deep-Dive Spec Files)
â”œâ”€â”€ 04-Tasks/                               # Semantic Search, RAG Retrieval, Text Clustering, Classification, Cross-Lingual Search, Code Retrieval
â”œâ”€â”€ 05-API/                                 # REST APIs, SDKs, Auth, Request Formats, Dimension Truncation Parameters, Rate Limits, Pricing
â”œâ”€â”€ 06-Vector-Optimization/                 # Matryoshka Truncation, Int8 Quantization, Binary Quantization, PCA Dimension Reduction, Normalization
â”œâ”€â”€ 07-Quality/                             # MTEB Benchmark Leaderboard, BEIR Retrieval Benchmark, Memory Footprint vs Recall Score
â”œâ”€â”€ 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best Code Search, Decision Matrix
â”œâ”€â”€ 09-Use-Cases/                           # Enterprise Search, Legal Document Discovery, E-Commerce Search, Financial Filing Search
â”œâ”€â”€ 10-Open-Source/                         # BGE-M3, Nomic Embed, E5-v2, Sentence-Transformers, Local Hugging Face Serving
â”œâ”€â”€ 11-Production/                          # Storage Memory Optimization, Batch Ingestion, Indexing Latency, HNSW vs IVF Indexing, Caching
â”œâ”€â”€ 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
â”œâ”€â”€ 13-Benchmarks/                          # MTEB Retrieval Score, Embedding Latency (ms), Cost per 1M Tokens, Storage Footprint
â”œâ”€â”€ 14-Learning-Resources/                  # Official Docs, Research Papers (Matryoshka MRL, MTEB, Sentence-BERT), Blogs, Videos, Courses
â””â”€â”€ 15-Glossary/                            # Terms, Acronyms, References
`

---

# ðŸŽ¯ Model Comparison & Decision Matrix Snapshot

| Model | Provider | Native Dimensions | Context Window | MTEB Retrieval Score | API Pricing (per 1M tokens) | Matryoshka Truncation |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **voyage-3** | Voyage AI | 1024-dim | **32,000 tokens** | **66.8** (#1 SOTA) | **.060 / 1M** | Yes (512, 256, 128) |
| **nv-embed-v2** | NVIDIA | 4096-dim | 32,000 tokens | **69.2** (#1 Overall) | Open-Weights / NIM | Yes |
| **text-embedding-3-large** | OpenAI | 3072-dim | 8,191 tokens | 64.6 | **.130 / 1M** | Yes (1536, 256) |
| **jina-embeddings-v3** | Jina AI | 1024-dim | 8,192 tokens | 65.4 | **.020 / 1M** | Yes (Task Adapters) |
| **cohere-embed-v3** | Cohere | 1024-dim | 512 tokens | 64.1 | **.100 / 1M** | No |
| **bge-m3** | BAAI | 1024-dim | 8,192 tokens | 63.8 | **Free (Apache 2.0)** | Yes |
| **nomic-embed-text-v1.5** | Nomic AI | 768-dim | 8,192 tokens | 62.3 | **Free (Apache 2.0)** | Yes (512, 256, 128, 64) |

---

# ðŸš€ Quick Start Example: Generating Embeddings via Voyage AI

`python
import os
import voyageai

vo = voyageai.Client(api_key=os.environ.get("VOYAGE_API_KEY"))

# Generate 1024-dim document embedding
result = vo.embed(
    texts=["Vector embeddings enable high-precision semantic retrieval for RAG."],
    model="voyage-3",
    input_type="document"
)

print(f"Vector Dimension: {len(result.embeddings[0])}")
`

---

# ðŸ“š Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for vector space concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for Cosine Similarity vs Dot Product vs Euclidean distance.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on voyage-3, text-embedding-3-large, cohere-embed-v3, jina-embeddings-v3, and nv-embed-v2.
- Explore **[06-Vector-Optimization](./06-Vector-Optimization/README.md)** for Matryoshka truncation and Int8/Binary scalar quantization.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Open Source, Best Paid, Cheapest).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for Sentence-Transformers, BGE-M3, and local vector embedding serving.
