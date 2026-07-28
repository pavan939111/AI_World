---
title: OpenAI text-embedding-3-small â€” Low-Cost Vector Embedding Specification
provider: OpenAI
capability: 03-Embedding-Models
model: text-embedding-3-small
file: text-embedding-3-small.md
last_updated: 2026-07-28
tags: [openai, embeddings, text-embedding-3-small, vector-search, low-cost]
author: Antigravity AI Knowledge Engine
---

# OpenAI text-embedding-3-small â€” Technical Specification & Guide

## 1. Summary & Market Position
**`text-embedding-3-small`** is OpenAI's highly efficient, low-cost text embedding model. It generates 1,536-dimensional vectors and outperforms legacy `text-embedding-ada-002` on MTEB benchmarks while costing **5x less** ($0.020 vs $0.100 per 1M tokens).

---

## 2. Technical Specifications & Pricing

| Parameter | Specification | Notes / Details |
| :--- | :--- | :--- |
| **Model ID** | `text-embedding-3-small` | Production endpoint |
| **Native Dimensions** | **1,536 dimensions** | Default vector dimensions |
| **Context Window** | **8,191 tokens** | Maximum input token limit |
| **MTEB Retrieval Score** | **62.3** | Outperforms `ada-002` (61.0) |
| **API Pricing (1M Tokens)**| **$0.020 / 1M Tokens** | **5x cheaper than ada-002** |
| **Supported Dimensions** | 1536, 512, 256 | Configurable via `dimensions` |
