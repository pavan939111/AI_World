---
title: DeepSeek-R1 — Overview
service: 01-Language-Models
model: DeepSeek-R1
section: 03-Models
file: Overview.md
last_updated: 2026-07-28
tags: [language-models, deepseek-r1, overview, specs]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-R1 — Technical Overview

**DeepSeek-R1** is DeepSeek's flagship open-weights reasoning model. Trained extensively using reinforcement learning, it is the first open-weights model to achieve competitive parity with proprietary reasoning systems (such as OpenAI's o1) in mathematics, logic, and software engineering.

---

## 1. Technical Specifications & Specs

| Metric | Specification | Details |
| :--- | :--- | :--- |
| **Developer / Provider** | DeepSeek | Released January 2025. |
| **Model Type** | Large-scale Reasoning Model | Outputs a separate reasoning trace before the final answer. |
| **Architecture** | Mixture-of-Experts (MoE) | Incorporates MLA, DeepSeekMoE, and GRPO. |
| **Total Parameters** | 671 Billion | Dense parameter volume. |
| **Active Parameters** | 37 Billion | Activated per token sequence. |
| **Context Window** | 128,000 tokens | Maximum sequence input limit. |
| **Max Output Tokens** | 8,192 tokens | Total output (includes reasoning trace and final content). |
| **Vocabulary Size** | 129,280 tokens | Custom BPE tokenizer. |

---

## 2. Core Architectural Highlights

* **Reasoning Trace Outputs**: Unlike standard LLMs that generate responses immediately, DeepSeek-R1 outputs a hidden, structural chain-of-thought trace (captured in a designated `reasoning_content` API property or wrapped in `<think>` XML blocks). The model self-corrects, plans, and evaluates alternatives before outputting its final response.
* **GRPO Reinforcement Training**: Trained via Group Relative Policy Optimization (GRPO) without traditional critic value models, significantly reducing memory consumption during the RL alignment phase.
* **Frontier Capabilities**: Matches top SOTA reasoning models on PhD-level physics, competitive programming (Codeforces), and high-level mathematics.

---

## 3. Basic Integration Example

### Python SDK Request (DeepSeek Reasoner)
```python
import os
from openai import OpenAI

client = OpenAI(
    api_key=os.environ.get("DEEPSEEK_API_KEY"),
    base_url="https://api.deepseek.com/v1"
)

response = client.chat.completions.create(
    model="deepseek-reasoner",  # Accesses the reasoning model pipeline
    messages=[
        {"role": "user", "content": "Solve: How many integers exist between 1 and 100 that are divisible by 3 but not by 5?"}
    ]
)

# Inspect reasoning traces separately from final response
print("Reasoning Chain of Thought:")
print(response.choices[0].message.reasoning_content)

print("\nFinal Answer Output:")
print(response.choices[0].message.content)
```
