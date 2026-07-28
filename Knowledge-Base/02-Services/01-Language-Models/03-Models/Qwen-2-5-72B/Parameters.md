---
title: Qwen 2.5 72B — Parameters
service: 01-Language-Models
model: Qwen-2-5-72B
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [language-models, qwen-2-5-72b, parameters, config]
author: Antigravity AI Knowledge Engine
---

# Qwen 2.5 72B — Parameter Reference

An overview of execution hyperparameters, generation limits, and tokenizer structures supported by Qwen 2.5 72B.

---

## 1. Generation Parameters

These configurations control output generation and token boundaries:

| Parameter Name | Data Type | Default Value | Acceptable Range | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`temperature`** | `float` | `0.7` | `0.0` to `2.0` | Controls randomness. Lower values (e.g. `0.2`) optimize structured JSON configurations. |
| **`top_p`** | `float` | `0.8` | `0.0` to `1.0` | Cumulative probability nucleus sampling. |
| **`max_tokens`** | `integer` | *Null* | Up to `8,192` | The maximum number of output tokens generated per request. |
| **`presence_penalty`** | `float` | `0.0` | `-2.0` to `2.0` | Penalizes repeating topics to encourage diverse vocabularies. |
| **`frequency_penalty`**| `float` | `0.0` | `-2.0` to `2.0` | Penalizes exact word repetitions. |

---

## 2. Tokenizer Specifications

Qwen 2.5 72B incorporates a custom tiktoken-based tokenizer optimized for multilingual structures:

* **Tokenizer Vocabulary Size**: **151,936 tokens**.
* **CJK Compression Efficiency**:
  * Reduces raw token lengths for Chinese, Japanese, and Korean character sequences by **over 30%** compared to standard llama vocabularies.
  * Ensures that large multi-lingual files do not exhaust the 128k input context window.
* **Code Compaction**: Optimizes symbol groupings, allowing highly compacted representations of programming brackets and keywords.
