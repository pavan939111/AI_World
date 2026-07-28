---
title: Command R+ — Best Practices
service: 01-Language-Models
model: Command-R-Plus
section: 03-Models
file: Best-Practices.md
last_updated: 2026-07-28
tags: [language-models, command-r-plus, best-practices, optimization]
author: Antigravity AI Knowledge Engine
---

# Command R+ — Production Best Practices

Guidelines and architecture patterns for optimizing document grounding, managing weight quantization size, and routing requests for Cohere's Command R+.

---

## 1. Grounded Generation RAG Optimization

To prevent input context bloat and optimize citation coverage:

* **Chunk and Prune Input Documents**: Rather than passing raw text files directly, pre-process datasets using semantic chunking models. Pass only the top relevant chunks (typically **10 to 20 snippets**, max 300 words each) inside the `"documents"` array parameter.
* **Normalize Document Fields**: Keep document objects clean by passing only three primary properties: `id`, `title`, and `snippet`. Avoid injecting large unrelated metadata dictionaries into the API payload.
* **Keep Temperatures Low**: For high grounding accuracy and precise citation mapping, set `temperature` strictly to **`0.0` or `0.1`**. Higher temperatures increase conversational fluency but can cause minor citation misalignments.

---

## 2. Quantization Selections for Local Serving

* **For Production Serving (vLLM / TGI)**:
  * Select **AWQ (Activation-aware Weight Quantization)** in **4-bit** or **8-bit** formats. AWQ preserves attention layer accuracy, keeping citation index parameters correct.
* **For Local Development Workstations (Ollama)**:
  * Select the **GGUF** format with **`Q4_K_M`** (4-bit medium) or **`Q8_0`** (8-bit) compression. `Q4_K_M` balances memory VRAM footprint (~60 GB) and generation quality.

---

## 3. Concurrency & Rate Limit Retries

* **Design Exponential Backoff**: Cohere endpoints return HTTP `429` (Too Many Requests) under high congestion. Write custom retry loops with exponential backoff configurations to handle rate limits.
* **Route Failover**: If endpoints fail, configure routers to failover to serverless endpoints of equivalent context size (such as Together AI's Command R+ endpoints or Llama 3.3 70B endpoints).
