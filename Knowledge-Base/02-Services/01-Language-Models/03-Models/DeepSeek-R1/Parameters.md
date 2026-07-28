---
title: DeepSeek-R1 — Parameters
service: 01-Language-Models
model: DeepSeek-R1
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [language-models, deepseek-r1, parameters, config]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-R1 — API Parameters Reference

An overview of generation hyperparameters and configuration rules for DeepSeek-R1 APIs.

---

## 1. Generation Parameters

These configurations control output generation and token boundaries:

| Parameter Name | Data Type | Default Value | Acceptable Range | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`temperature`** | `float` | `0.6` | `0.0` to `2.0` | Controls randomness. DeepSeek strictly recommends setting `0.6` for R1 to prevent logic loops. |
| **`top_p`** | `float` | `0.95` | `0.0` to `1.0` | Cumulative probability nucleus sampling. |
| **`max_tokens`** | `integer` | *Null* | Up to `8,192` | The maximum output length (includes thinking and visible text). |
| **`presence_penalty`** | `float` | `0.0` | `-2.0` to `2.0` | Penalizes repeating topics. |
| **`frequency_penalty`**| `float` | `0.0` | `-2.0` to `2.0` | Penalizes exact word repetitions. |

---

## 2. Critical Temperature Warning

Unlike standard models where temperature adjustments alter writing style:

> [!WARNING]
> Setting the temperature to `1.0` or higher when querying `deepseek-reasoner` increases the probability of **logical formatting collapse** or **circular loop traps**. The model can start repeating identical thinking sequences indefinitely. Keep temperature strictly at **`0.5` or `0.6`** for reasoning workflows.

---

## 3. Tokenizer Specifications

DeepSeek-R1 utilizes the same vocabulary mapping footprint as DeepSeek-V3:

* **Vocabulary Size**: **129,280 tokens**.
* **Encoding Algorithm**: Custom BPE optimized for math, code syntax, Chinese, and English tokens.
