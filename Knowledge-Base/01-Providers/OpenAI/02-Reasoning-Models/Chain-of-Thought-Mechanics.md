---
title: OpenAI Reasoning Models â€” Hidden Chain-of-Thought Mechanics
provider: OpenAI
capability: 02-Reasoning-Models
file: Chain-of-Thought-Mechanics.md
last_updated: 2026-07-28
tags: [openai, reasoning, cot, test-time-compute, grpo, thinking-tokens]
author: Antigravity AI Knowledge Engine
---

# OpenAI Reasoning Models â€” Hidden Chain-of-Thought Mechanics

## 1. How Test-Time Compute Scaling Works
Standard LLMs predict tokens autoregressively without reflection. OpenAI's reasoning models (`o1` and `o3-mini`) allocate variable amounts of **Test-Time Compute** based on problem complexity:

```text
User Query â”€â”€â–º Model Ingestion â”€â”€â–º Hidden CoT Reasoning Trace â”€â”€â–º Final Completion Token
                                       (Self-Correction &         (Visible to User/API)
                                        Logical Verification)
```

---

## 2. Hidden Reasoning Trace Privacy & Safety
- **Hidden Tokens**: The internal Chain-of-Thought text is hidden from the API output to allow the model to reason uncensored and explore wrong logical branches safely.
- **Reasoning Token Accounting**: The total number of reasoning tokens generated during the hidden CoT trace is billed as output tokens and reported in the API response under `usage.completion_tokens_details.reasoning_tokens`.
