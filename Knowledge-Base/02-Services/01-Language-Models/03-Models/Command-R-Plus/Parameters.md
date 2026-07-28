---
title: Command R+ — Parameters
service: 01-Language-Models
model: Command-R-Plus
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [language-models, command-r-plus, parameters, config]
author: Antigravity AI Knowledge Engine
---

# Command R+ — Parameter Reference

An overview of generation hyperparameters, RAG database connectors, and tokenizer specifications supported by Command R+.

---

## 1. Primary Parameters

These configurations control output generation and token boundaries:

| Parameter Name | Data Type | Default Value | Acceptable Range | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`temperature`** | `float` | `0.3` | `0.0` to `2.0` | Controls randomness. Enterprise default is set lower (`0.3`) for high RAG precision. |
| **`p`** | `float` | `0.75` | `0.01` to `0.99` | Nucleus sampling probability threshold. |
| **`max_tokens`** | `integer` | *Null* | Up to `4,096` | Output generation token limit. |
| **`frequency_penalty`**| `float` | `0.0` | `0.0` to `1.0` | Penalizes repetitive phrases. |
| **`presence_penalty`** | `float` | `0.0` | `0.0` to `1.0` | Penalizes repeating topics. |
| **`connectors`** | `array` | *Empty* | Predefined ids | Activates search connectors (e.g. `[{"id": "web-search"}]`) to trigger RAG grounding. |

---

## 2. Tokenizer Specifications

Command R+ utilizes Cohere’s custom high-vocabulary tokenizer:

* **Tokenizer Vocabulary Size**: **255,000 tokens**.
* **Multilingual Compression Gains**:
  * Reduces raw token footprints by **30% to 50%** for non-English enterprise scripts (Japanese, Korean, Chinese, Arabic) compared to standard tokenizers.
  * Allows larger enterprise documents to fit comfortably within the 128k input context window.
* **Code Efficiency**: Compresses syntax layouts, reducing latency for coding completions.
