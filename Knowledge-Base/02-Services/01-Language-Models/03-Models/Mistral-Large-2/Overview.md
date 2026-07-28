---
title: Mistral-Large-2 — Overview
service: 01-Language-Models
model: Mistral-Large-2
section: 03-Models
file: Overview.md
last_updated: 2026-07-28
tags: [language-models, mistral-large-2, overview, specs]
author: Antigravity AI Knowledge Engine
---

# Mistral-Large-2 — Technical Overview

**Mistral-Large-2** (version 24.07) is Mistral AI's premier high-performance dense open-weights Large Language Model. Designed specifically for advanced code generation, multi-lingual translation, and agentic function calling, Mistral-Large-2 serves as a frontier model capable of local enterprise hosting or direct commercial API integration.

---

## 1. Technical Specifications & Specs

| Metric | Specification | Details |
| :--- | :--- | :--- |
| **Developer / Provider** | Mistral AI | Released July 2024. |
| **Model Type** | Open-Weights Text Generation | Available via Mistral Research License or commercial API. |
| **Architecture** | Dense Decoder-Only Transformer | Features RoPE and sliding window configurations. |
| **Parameter Count** | 123 Billion (Dense) | Robust size for multi-GPU hardware servers. |
| **Context Window** | 128,000 tokens | Expansive inputs for large multi-file documents. |
| **Max Output Tokens** | 8,192 tokens | Supported output sequence length limit. |
| **Vocabulary Size** | 131,072 tokens | Optimized custom "Tekken" BPE tokenizer. |

---

## 2. Core Architectural Highlights

* **Dense Execution Quality**: By utilizing a 123 Billion parameter dense transformer network (unlike sparse Mixture-of-Experts), Mistral-Large-2 maintains deep semantic understanding and low instruction-following drift across long contexts.
* **Tekken Tokenizer**: Features a highly efficient vocabulary indexing system. Tekken compresses non-English European languages and coding keywords far better than previous tokenizers, reducing prompt length requirements.
* **Tool & Agent Optimization**: Pre-trained to handle recursive function calls and strict JSON configurations, reducing output format exceptions in agentic loops.

---

## 3. Basic Integration Example

### Python SDK Request (Official Mistral AI API)
```python
import os
from mistralai import Mistral

# Initialize Mistral client
client = Mistral(api_key=os.environ.get("MISTRAL_API_KEY"))

response = client.chat.complete(
    model="mistral-large-latest",
    messages=[
        {"role": "user", "content": "Explain the efficiency gains of the Tekken tokenizer."}
    ]
)

print(response.choices[0].message.content)
```
