---
title: Mistral-Large-2 — Parameters
service: 01-Language-Models
model: Mistral-Large-2
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [language-models, mistral-large-2, parameters, config]
author: Antigravity AI Knowledge Engine
---

# Mistral-Large-2 — Parameter Reference

An overview of generation hyperparameters, safety toggles, and tokenizer properties supported by Mistral-Large-2.

---

## 1. Primary Parameters

These configurations control output generation and token boundaries:

| Parameter Name | Data Type | Default Value | Acceptable Range | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`temperature`** | `float` | `0.7` | `0.0` to `1.0` | Controls randomness. Lower values (e.g. `0.2`) optimize structured JSON schemas. |
| **`top_p`** | `float` | `1.0` | `0.0` to `1.0` | Cumulative probability nucleus sampling. |
| **`max_tokens`** | `integer` | *Null* | Up to `8,192` | The maximum output token limit per request. |
| **`presence_penalty`** | `float` | `0.0` | `-2.0` to `2.0` | Penalizes repeating topics. |
| **`frequency_penalty`**| `float` | `0.0` | `-2.0` to `2.0` | Penalizes exact word repetitions. |
| **`safe_prompt`** | `boolean` | `false` | `true` / `false` | Enables/disables Mistral's built-in system safety moderation filter. |

---

## 2. Tokenizer Specifications

Mistral-Large-2 features a custom BPE tokenizer named **Tekken**:

* **Tekken Vocabulary Size**: **131,072 tokens**.
* **Compression Gains**:
  * Improves English text compression by **over 12%** compared to previous architectures.
  * Achieves up to **30% better compression** for major European languages (French, Spanish, German, Italian, Portuguese).
  * Optimizes code parsing by grouping common programming symbol patterns, resulting in fewer overall tokens per script.
