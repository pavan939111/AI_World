---
title: DeepSeek-V3 — Parameters
service: 01-Language-Models
model: DeepSeek-V3
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [language-models, deepseek-v3, parameters, config]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-V3 — Parameter Reference

An overview of generation configuration parameters, penalties, and tokenizer footprints supported by the DeepSeek-V3 API.

---

## 1. Primary Parameters

These configurations control output generation and token boundaries:

| Parameter Name | Data Type | Default Value | Acceptable Range | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`temperature`** | `float` | `1.0` | `0.0` to `2.0` | Controls randomness. DeepSeek recommends `0.7` for code/math and `1.0` for creative tasks. |
| **`top_p`** | `float` | `1.0` | `0.0` to `1.0` | Cumulative probability token selection pruning. |
| **`max_tokens`** | `integer` | *Null* | Up to `8,192` | The maximum number of output tokens generated per request. |
| **`presence_penalty`** | `float` | `0.0` | `-2.0` to `2.0` | Penalizes repeating topics to encourage diverse vocabularies. |
| **`frequency_penalty`**| `float` | `0.0` | `-2.0` to `2.0` | Penalizes exact word repetitions. |

---

## 2. Tokenizer Specifications

DeepSeek-V3 incorporates a custom-trained tokenizer:

* **Tokenizer Model**: Byte Pair Encoding (BPE).
* **Vocabulary Size**: **129,280 tokens**.
* **Language Footprint**: Specifically optimized to compress Chinese and English text efficiently.
* **Benefits**: Reduces token parsing overhead when processing mixed-language software code repositories or technical research documents.
