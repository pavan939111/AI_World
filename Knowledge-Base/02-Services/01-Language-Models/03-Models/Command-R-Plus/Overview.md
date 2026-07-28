---
title: Command R+ — Overview
service: 01-Language-Models
model: Command-R-Plus
section: 03-Models
file: Overview.md
last_updated: 2026-07-28
tags: [language-models, command-r-plus, overview, specs]
author: Antigravity AI Knowledge Engine
---

# Command R+ — Technical Overview

**Command R+** is Cohere’s flagship open-weights Large Language Model designed specifically for enterprise-grade Retrieval-Augmented Generation (RAG) and multi-step agentic workflows. Optimized for high-throughput operational compliance across 10 global languages, Command R+ combines large-context reasoning with robust search citations formatting.

---

## 1. Technical Specifications & Specs

| Metric | Specification | Details |
| :--- | :--- | :--- |
| **Developer / Provider** | Cohere | Released April 2024. |
| **Model Type** | Enterprise Text Generation | Distributed under Cohere Non-Commercial License. |
| **Architecture** | Dense Decoder-Only Transformer | Fine-tuned for context gating and search APIs. |
| **Parameter Count** | 104 Billion | Scale engineered for multi-GPU servers. |
| **Context Window** | 128,000 tokens | Support for large document repositories. |
| **Max Output Tokens** | 4,096 tokens | Standard generation window limits. |
| **Vocabulary Size** | **255,000 tokens** | Custom BPE tokenizer optimized for 10 global scripts. |

---

## 2. Core Architectural Highlights

* **Native RAG and Citation Engines**: The model is pre-trained to ingest external document arrays, return structured responses, and generate inline semantic citations referencing specific parts of the source text.
* **Large Tokenizer Vocab Size**: Cohere's custom 255k vocabulary is one of the largest in production, enabling efficient compression ratios for non-English texts (e.g. Japanese, Korean, Arabic, Chinese).
* **Multi-Step Agent Tool Use**: Handles complex, multi-turn tool calling plans, allowing the model to make consecutive API queries to retrieve data before returning the final response.

---

## 3. Basic Integration Example

### Python SDK Request (Official Cohere API)
```python
import os
import cohere

# Initialize Cohere client
co = cohere.Client(api_key=os.environ.get("COHERE_API_KEY"))

response = co.chat(
    model="command-r-plus",
    message="What are the benefits of a 255,000 token vocabulary tokenizer?"
)

print(response.text)
```
