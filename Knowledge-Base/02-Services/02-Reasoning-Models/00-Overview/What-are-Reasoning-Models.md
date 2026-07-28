---
title: Reasoning Models — What are Reasoning Models
service: 02-Reasoning-Models
section: 00-Overview
file: What-are-Reasoning-Models.md
last_updated: 2026-07-28
tags: [reasoning-models, test-time-compute, reinforcement-learning, chain-of-thought]
author: Antigravity AI Knowledge Engine
---

# What are Reasoning Models?

**Reasoning Models** represent a paradigm shift in generative artificial intelligence. Unlike standard Large Language Models (LLMs) that immediately predict the next word in a single forward pass, reasoning models dynamically allocate additional computational resources during inference (called **test-time compute scaling**) to formulate, verify, and correct a structural chain-of-thought (CoT) path before outputting a final answer.

---

## 1. Standard LLMs vs. Reasoning Models

Standard models and reasoning models diverge across latency, compute, and planning dimensions:

| Dimension / Property | Standard LLMs (System 1) | Reasoning Models (System 2) |
| :--- | :--- | :--- |
| **Inference Generation** | Single immediate token generation pipeline. | Multi-step internal reasoning traces before answering. |
| **Inference Cost (Compute)**| Fixed based on length of input + output. | Scalable; scales based on logical complexity of the query. |
| **Self-Correction** | Cannot backtrack on tokens already output. | Can detect logic slips and backtrack inside the trace. |
| **Primary Training Focus** | Supervised Fine-Tuning (SFT) & RLHF. | Large-scale Reinforcement Learning (RL) (e.g., GRPO). |
| **Optimized Workloads** | Writing, summary, chat, simple queries. | PhD science logic, competitive programming, math proofs. |

---

## 2. Core Architectural Pillars

* **Test-Time Compute Scaling**: Enables the model to allocate more reasoning steps (generates extra "thinking tokens") for harder tasks, mirroring how humans take longer to solve difficult math questions than simple conversational queries.
* **Process Reward Models (PRMs)**: Unlike Outcome Reward Models (ORMs) which only grade the final completion, PRMs grade each individual reasoning step. This reinforces correct step-by-step logic pathways.
* **Self-Correction & Backtracking**: Through reinforcement training loops, the model learns to identify its own logical contradictions (e.g. "Wait, this does not yield x = 2. Let me try factoring differently.") and backtrack dynamically.

---

## 3. Basic Integration Example

To query reasoning models, target their respective APIs (like `deepseek-reasoner` or `o3-mini`) and parse the reasoning trace metadata:

```python
import os
from openai import OpenAI

client = OpenAI(
    api_key=os.environ.get("DEEPSEEK_API_KEY"),
    base_url="https://api.deepseek.com/v1"
)

response = client.chat.completions.create(
    model="deepseek-reasoner",
    messages=[
        {"role": "user", "content": "How many combinations exist to color a 3x3 grid using 3 colors if rotation is not considered?"}
    ]
)

# Extract internal reasoning tokens and visible answer separately
print("Internal Thinking Process:")
print(response.choices[0].message.reasoning_content)

print("\nFinal Answer Output:")
print(response.choices[0].message.content)
```
