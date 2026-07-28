---
title: GPT-4o — Parameters
service: 01-Language-Models
model: GPT-4o
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [language-models, gpt-4o, parameters, config]
author: Antigravity AI Knowledge Engine
---

# GPT-4o — API Parameters Reference

An overview of the runtime parameters and configuration variables accepted by the GPT-4o API endpoints.

---

## 1. Primary Parameters

| Parameter Name | Data Type | Default Value | Acceptable Range | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`temperature`** | `float` | `1.0` | `0.0` to `2.0` | Controls randomness. Lower values are deterministic and factual; higher values increase diversity. |
| **`top_p`** | `float` | `1.0` | `0.0` to `1.0` | Nucleus sampling. Discards tokens outside the top cumulative probability threshold. |
| **`max_tokens`** | `integer` | *Null* | Up to `16,384` | Sets the maximum limit on output tokens generated. |
| **`presence_penalty`**| `float` | `0.0` | `-2.0` to `2.0` | Penalizes tokens based on whether they have appeared in the output, encouraging the model to introduce new topics. |
| **`frequency_penalty`**| `float` | `0.0` | `-2.0` to `2.0` | Penalizes tokens based on their cumulative frequency in the output, preventing repetitive phrase generation. |
| **`seed`** | `integer` | *Null* | Signed 32-bit int | Enforces deterministic generation. Consecutive calls with identical parameters and seed will return the same output. |

---

## 2. Structured Outputs & Response Formats

* **`response_format`**: Configures the syntax format of the output generation.
  * **Text Mode (Default)**: `{"type": "text"}`
  * **JSON Object**: `{"type": "json_object"}`. Requires a prompt containing "JSON".
  * **JSON Schema (Structured Outputs)**: `{"type": "json_schema", "json_schema": {...}}`. Guarantees generation matches the exact JSON schema definition supplied.
* **`tools` & `tool_choice`**:
  * **`tools`**: An array of function descriptions, arguments, and schemas the model can access.
  * **`tool_choice`**: Sets tool execution behavior: `"none"` (bypass tools), `"auto"` (model decides dynamically), or `"required"` (enforces calling a tool).

---

## 3. Advanced Parameters

* **`logit_bias`**: Modifies the likelihood of specific tokens appearing in the completion. Maps token IDs (from the tokenizer) to integer bias values ranging from `-100` (complete exclusion) to `100` (forced selection).
* **`user`**: A unique string identifier representing the end-user. Helps OpenAI trace and monitor abusive behavior patterns without exposing PII.
* **`parallel_tool_calls`**: `boolean` (Default: `true`). If enabled, the model can generate multiple tool execution requests in a single output sequence.
