---
title: Reasoning Models — Hidden Thinking Tokens
service: 02-Reasoning-Models
section: 01-Fundamentals
file: Hidden-Thinking-Tokens.md
last_updated: 2026-07-28
tags: [reasoning-models, thinking-tokens, api, latency, kv-cache]
author: Antigravity AI Knowledge Engine
---

# Hidden Thinking Tokens

**Thinking Tokens** (or reasoning tokens) are intermediate outputs generated autoregressively by reasoning models to formulate their step-by-step chain of thought. Unlike standard output text, these tokens are typically hidden in the final client interfaces, serving as the model's internal scratchpad.

---

## 1. Generation Mechanics

During inference, the model runs a continuous token prediction loop:

1. **Trigger Reasoning**: Upon receiving the user prompt, the model outputs start-thinking markers (e.g. `<think>` or proprietary API states).
2. **Autoregressive CoT Generation**: The model predicts intermediate reasoning tokens. Each predicted token is fed back into the context window, guiding the next reasoning step.
3. **Trigger Transition**: Once the model's reasoning logic satisfies internal termination criteria, it outputs an end-thinking marker (e.g. `</think>`) and begins generating the final visible completion text.

---

## 2. KV Cache & Context Window Constraints

> [!IMPORTANT]
> **Thinking tokens occupy active space in the context window.**
> Generating 4,000 thinking tokens consumes 4,000 positions of the context window and populates the KV cache. This has two major production implications:
> * **Context Size Degradation**: In multi-turn chat dialogues, large reasoning traces can quickly exhaust context windows (e.g. 128k limit), truncating early messages.
> * **Time-to-Last-Token Latency**: Since the model must generate these tokens before outputting the final answer, each thinking token adds to the overall request generation duration.

---

## 3. Billing & API Architectures

* **Equal Billing Rates**: Providers bill thinking tokens at standard output token rates, as they consume equivalent GPU computation cycles during generation.
* **Separated API Structures**:
  * **OpenAI (o1/o3-mini)**: Replaces thinking traces with `reasoning_tokens` integer metadata counts. Traces are hidden by default to prevent safety jailbreaks or intellectual property extraction.
  * **DeepSeek (R1)**: Returns the raw text of the thinking trace inside the `reasoning_content` parameter in chat completions, allowing developers to audit or display the reasoning path.
