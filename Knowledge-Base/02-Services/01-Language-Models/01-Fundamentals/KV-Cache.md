---
title: Language Models — KV-Cache Optimization
service: 01-Language-Models
section: 01-Fundamentals
file: KV-Cache.md
last_updated: 2026-07-28
tags: [language-models, llm, kv-cache, optimization]
author: Antigravity AI Knowledge Engine
---

# KV Cache Optimization

During autoregressive generation, Large Language Models run in two distinct execution phases. **KV (Key-Value) Caching** is a fundamental inference optimization designed to prevent redundant computations and speed up output generation.

---

## 1. Prefill vs. Decoding Phase

To understand why the KV Cache is necessary, we must examine the token generation lifecycle:

```
  Phase 1: Prefill (Parallel)            Phase 2: Decoding (Sequential, Autoregressive)
  
  "User Prompt Text"                     "User Prompt Text" -> [Gen Token 1]
           │                                                        │
           ▼                                                        ▼
  Compute Q, K, V for all tokens         Compute Q, K, V *only* for the newest token.
  in parallel.                           Retrieve past K & V states from KV Cache.
```

1. **Prefill Phase**: The model processes the entire input prompt (context) in parallel. It computes the Queries ($Q$), Keys ($K$), and Values ($V$) for all input tokens and generates the first output token.
2. **Decoding Phase**: The model generates subsequent tokens sequentially, one-by-one. Each new token requires computing attention against all previous tokens.
   * *The Problem*: Without caching, the model would have to recompute $Q, K, V$ vectors for all past tokens at every step, scaling the computational cost to $O(N^2)$ for each generated token.
   * *The Solution*: Store the Key ($K$) and Value ($V$) representations of past tokens in GPU memory (the **KV Cache**). For each new token, the model only computes the $Q, K, V$ vectors for that single token and retrieves the past $K$ and $V$ vectors from the cache.

---

## 2. KV Cache Memory Footprint

While the KV Cache reduces compute, it shifts the system bottleneck from being compute-bound to **memory-bound**. The size of the KV Cache in bytes can be calculated using the following formula:

$$\text{KV Cache Size (Bytes)} = 2 \times n_{\text{layers}} \times n_{\text{KV\_heads}} \times d_{\text{head}} \times s \times b \times p$$

Where:
* **$2$**: Accounts for storing both Key and Value vectors.
* **$n_{\text{layers}}$**: Number of Transformer layers in the model.
* **$n_{\text{KV\_heads}}$**: Number of Key/Value heads. (Note that in GQA, this is much smaller than the query head count).
* **$d_{\text{head}}$**: Dimension of each attention head ($d_{\text{head}} = d_{\text{model}} / n_{\text{query\_heads}}$).
* **$s$**: Sequence length (number of tokens in context).
* **$b$**: Batch size (number of concurrent requests).
* **$p$**: Precision of weights in bytes (e.g., `2` for FP16/BF16, `1` for FP8, `0.5` for INT4).

> [!TIP]
> For a 70B parameter model running FP16 with 128 batch size and 8k context, the KV cache can easily exceed 100GB of GPU memory, representing a significant portion of hardware hosting requirements.

---

## 3. KV Cache Optimization Techniques

To maximize concurrency (batch size) and support long context windows, serving engines implement several memory management architectures:

### A. Grouped-Query Attention (GQA)
By sharing single key and value heads across groups of query heads, GQA directly reduces the $n_{\text{KV\_heads}}$ term in the memory formula (often by 8x), reducing the overall cache memory footprint.

### B. PagedAttention (vLLM)
Traditionally, the KV cache for a request had to be allocated contiguously in GPU virtual memory. Because sequence lengths are unpredictable, engines over-allocated memory for the maximum context length, leading to up to 60-80% memory waste (**internal fragmentation**).
* **Mechanism**: PagedAttention partitions the KV cache into small, fixed-size physical blocks (similar to paging in operating systems). It maps logical tokens to non-contiguous physical memory blocks dynamically.
* **Impact**: Eliminates memory fragmentation, allowing serving engines to increase batch sizes by 2x to 4x.

### C. Prompt Caching
* **Mechanism**: Stores the KV cache of static, repetitive system instructions or document context. When a user sends a prompt sharing the same prefix, the engine loads the pre-computed KV cache instantly, bypassing the prefill compute phase and reducing time-to-first-token (TTFT) by up to 90%.

### D. KV Cache Quantization
* **Mechanism**: Stores Key and Value states in lower precision (such as FP8 or INT4) while maintaining the model weights at FP16/BF16. This halves the memory requirement of the cache, allowing larger batch sizes.
