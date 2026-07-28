---
title: Gemini 2.5 Pro — Parameters
service: 01-Language-Models
model: Gemini-2-5-Pro
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [language-models, gemini-2-5-pro, parameters, config]
author: Antigravity AI Knowledge Engine
---

# Gemini 2.5 Pro — API Parameters Reference

An overview of runtime configuration keys, safety structures, and search grounding configurations accepted by the Gemini API endpoints.

---

## 1. Generation Parameters

These configurations control output generation and token boundaries:

| Parameter Name | Data Type | Default Value | Acceptable Range | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`temperature`** | `float` | `1.0` | `0.0` to `2.0` | Controls randomness. Lower values enforce factual deterministic outputs. |
| **`top_p`** | `float` | `0.95` | `0.0` to `1.0` | Cumulative probability token pruning. |
| **`top_k`** | `integer` | *Null* | $\ge 1$ | Restricts candidates to the top $k$ tokens. |
| **`max_output_tokens`**| `integer` | *Null* | Up to `8,192` | Sets the maximum length limit on generated output. |
| **`candidate_count`** | `integer` | `1` | `1` | Number of alternative response generations to return (currently locked to 1). |

---

## 2. Safety Settings (`safety_settings`)

Google enforces strict content filters that developers can customize by specifying threshold blocks:

* **Categories Evaluated**:
  * `HARM_CATEGORY_HATE_SPEECH`
  * `HARM_CATEGORY_HARASSMENT`
  * `HARM_CATEGORY_SEXUALLY_EXPLICIT`
  * `HARM_CATEGORY_DANGEROUS_CONTENT`
* **Block Threshold Options**:
  * `BLOCK_NONE`: Turn off safety filters (available for Vertex AI and paid Studio tiers).
  * `BLOCK_LOW_AND_ABOVE`: Filter out content with low probability of harm.
  * `BLOCK_MEDIUM_AND_ABOVE` (Default): Filter out medium to high probability harm.
  * `BLOCK_ONLY_HIGH`: Only block high probability harm.

---

## 3. Search Grounding Configuration

To ground responses in real-time Google Search results, pass the `tools` array:

```json
"tools": [
  {
    "google_search": {}
  }
]
```
This activates Google's search retrieval pipeline, grounding the model's response and returning citations in the metadata.
