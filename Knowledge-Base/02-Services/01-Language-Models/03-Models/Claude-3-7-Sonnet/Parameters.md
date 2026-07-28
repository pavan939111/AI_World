---
title: Claude 3.7 Sonnet — Parameters
service: 01-Language-Models
model: Claude-3-7-Sonnet
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [language-models, claude-3-7-sonnet, parameters, config]
author: Antigravity AI Knowledge Engine
---

# Claude 3.7 Sonnet — API Parameters Reference

An overview of runtime configuration parameters and query hyperparameters supported by the Anthropic Claude API endpoints.

---

## 1. Primary Parameters

| Parameter Name | Data Type | Default Value | Acceptable Range | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`max_tokens`** | `integer` | *Required* | Up to `8,192` (standard)<br>Up to `16,384` (thinking) | The maximum number of tokens to generate. Maxes out at 16k when thinking is enabled. |
| **`system`** | `string` / `array` | *Null* | Text or content blocks | Defines the system instruction or persona settings. Supports caching headers. |
| **`temperature`** | `float` | `1.0` | `0.0` to `1.0` | Controls randomness. Must be strictly set to `1.0` if `thinking` is enabled. |
| **`top_p`** | `float` | `1.0` | `0.0` to `1.0` | Discards tokens below cumulative threshold. |
| **`top_k`** | `integer` | *Null* | $\ge 1$ | Restricts candidates to the top $k$ most probable tokens. |

---

## 2. Thinking Configuration (Reasoning Mode)

To enable System 2 deliberate reasoning, pass the `thinking` object in the API request:

* **`thinking`**: Configures the reasoning behavior.
  * **`type`**: `string` (Must be set to `"enabled"` or `"disabled"`).
  * **`budget_tokens`**: `integer` (Sets the maximum number of output tokens dedicated to thinking). Must satisfy:
    * $\ge 1024$ tokens.
    * $\le$ `max_tokens` parameter value.

> [!WARNING]
> If `thinking` is enabled, the API requires `temperature` to be explicitly set to `1.0`. Any other temperature setting will return an API validation error.

---

## 3. Tool Use & Formatting

* **`tools`**: An array of tools available to the model, supporting parameters defined as JSON Schema.
* **`tool_choice`**: Sets tool behavior: `{"type": "auto"}` (model chooses), `{"type": "any"}` (forces calling at least one tool), or `{"type": "tool", "name": "..."}` (enforces calling a specific tool).
* **`metadata`**: Object containing tracking headers (e.g., custom user IDs).
