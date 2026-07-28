---
title: Reranking Models â€” Two-Stage-Retrieval-Workflow
service: 04-Reranking-Models
section: 06-Pipeline-Integration
file: Two-Stage-Retrieval-Workflow.md
last_updated: 2026-07-28
tags: [reranking-models, cross-encoder, ndcg, 06-pipeline-integration, two-stage-retrieval-workflow]
author: Antigravity AI Knowledge Engine
---

# Two-Stage-Retrieval-Workflow

## Executive Summary
Detailed technical breakdown of **Two-Stage-Retrieval-Workflow** within the **06-Pipeline-Integration** domain of Cross-Encoder Reranking Models & Two-Stage Information Retrieval.

## Key Concepts & Architecture
- **Domain**: Two-Stage Information Retrieval & Semantic Re-Scoring
- **Core Technology**: Cross-Encoder Transformers (joint query-document self-attention), NDCG@10 Optimization, Relevance Score Thresholding.
- **Industry Standard**: First stage vector/hybrid search retrieves candidate top 50-100 documents; second-stage cross-encoder reranker re-scores and sorts candidates to pass top 3-5 hyper-relevant chunks to the LLM context window.

## Detailed Analysis
1. **Technical Foundation**: How Two-Stage-Retrieval-Workflow computes full cross-attention between query and document text to dramatically outperform bi-encoder vector similarity on precision benchmarks.
2. **Production Application**: Best practices for implementing Two-Stage-Retrieval-Workflow in RAG pipelines to eliminate irrelevant context noise and reduce LLM prompt token costs.
3. **Trade-offs**: Evaluating cross-encoder inference latency (20ms - 80ms) vs. 15-30% gains in NDCG@10 retrieval precision.

## Best Practices
- **Retrieve Top 50-100 First**: Use vector search or BM25 to get a fast candidate pool of 50-100 documents, then pass to the reranker for final re-scoring.
- **Apply Relevance Thresholding**: Filter out reranked documents with relevance scores below a minimum threshold (e.g. score < 0.35) before injecting into LLM context.
- **Use Top-K Filtering**: Keep only top 3 to 5 documents (	op_n=5) to maximize prompt relevance and avoid LLM "lost-in-the-middle" attention degradation.

## Code / Configuration Example (Cohere Rerank / Voyage Rerank API)
`python
import os
import cohere

# Initialize Cohere Client for Cross-Encoder Reranking
co = cohere.Client(os.environ.get("COHERE_API_KEY"))

query = "What is the capital of France?"
documents = [
    "Paris is the capital and most populous city of France.",
    "Lyon is a major financial center in southeastern France.",
    "London is the capital of the United Kingdom."
]

# Rerank retrieved candidate documents
response = co.rerank(
    query=query,
    documents=documents,
    top_n=2,
    model="rerank-v3.5"
)

for result in response.results:
    print(f"Index: {result.index} | Relevance Score: {result.relevance_score:.4f} | Text: {documents[result.index]}")
`

## Related References
- See [00-Overview](./00-Overview/README.md) and [08-Comparisons](./08-Comparisons/README.md) for decision matrices.
