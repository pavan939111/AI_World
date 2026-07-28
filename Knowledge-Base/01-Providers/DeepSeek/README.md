---
title: DeepSeek — Complete Technical Specification & Provider Reference
provider: DeepSeek
view: By Provider
last_updated: 2026-07-28
tags: [deepseek, deepseek-r1, deepseek-v3, grpo, mla, open-weights, low-cost-ai]
author: Antigravity AI Documentation Engine
---

# DeepSeek — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: DeepSeek AI (Hangzhou DeepSeek Artificial Intelligence Co., Ltd.)
- **Parent Company**: High-Flyer Quant (Capital backing)
- **Founders**: Liang Wenfeng (CEO & Co-founder)
- **Headquarters**: Hangzhou, Zhejiang, China
- **Year Founded**: July 2023
- **Mission**: To unravel the mysteries of AGI with open, efficient, and accessible foundation model architectures.
- **AI Ecosystem**: High-efficiency open-weights foundation model ecosystem providing frontier reasoning (DeepSeek-R1 671B MoE), general foundation dialogue (DeepSeek-V3 671B MoE), coding models (DeepSeek-Coder-V2), autoregressive image generation (Janus-Pro 7B), Group Relative Policy Optimization (GRPO), Multi-Head Latent Attention (MLA), automatic context caching (90% discount), and OpenAI-compatible API (`api.deepseek.com/v1`).
- **Timeline & Major Milestones**:
  - **July 2023**: Founded in Hangzhou by Liang Wenfeng.
  - **November 2023**: Released DeepSeek-Coder open-weights code model series.
  - **May 2024**: Released DeepSeek-V2 introducing Multi-Head Latent Attention (MLA) and DeepSeekMoE, cutting KV cache memory by 93%.
  - **December 2024**: Released DeepSeek-V3 (671B parameters, 37B active) setting world records for open-model pre-training efficiency ($6 Million total training cost).
  - **January 2025**: Released DeepSeek-R1 and DeepSeek-R1-Zero, achieving OpenAI o1 performance across math, coding, and reasoning at a fraction of the cost, alongside Janus-Pro 7B.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Reasoning Models** | Extended chain-of-thought reasoning trained via GRPO RL | Yes | DeepSeek-R1, DeepSeek-R1-Zero | Active |
| **Language Models** | High-efficiency general foundation dialogue & 128k context | Yes | DeepSeek-V3, DeepSeek-V2.5 | Active |
| **Distilled Models** | Open-weights distilled reasoning models (1.5B to 70B) | Yes (Open Weights) | DeepSeek-R1-Distill-Llama-70B, Qwen-32B | Active |
| **Coding Models** | Multi-file code generation & refactoring across 338 languages | Yes | DeepSeek-Coder-V2 | Active |
| **Multimodal / Vision** | Autoregressive visual understanding & text-to-image synthesis | Yes (Open Source) | Janus-Pro 7B, Janus 1.3B | Active |
| **Prompt Caching** | Disk-backed automatic context caching for a **90% discount** | Yes | DeepSeek API (`cache_hit_tokens`) | Active |
| **OpenAI Compatible API** | Drop-in REST endpoint compatibility with `/v1/chat/completions` | Yes | `api.deepseek.com/v1` | Active |
| **Tool Use** | Function parameter extraction and execution loops | Yes | DeepSeek API (`tools`) | Active |

---

# 3. Language & Reasoning Models

### Model: DeepSeek-R1
- **Name**: DeepSeek-R1 (`deepseek-reasoner`)
- **Release Date**: January 2025
- **Architecture**: 671B Parameter Sparse MoE (37B active per token) trained via GRPO Reinforcement Learning
- **Context Window**: 64,000 tokens
- **Output Modalities**: Text, Internal Reasoning Chain-of-Thought
- **Services Provided by the Model**:
  - **Frontier Reasoning Chain-of-Thought**: Generating explicit `<think>` reasoning tokens to solve complex competition mathematics (AIME, MATH), competitive programming (Codeforces), and logical deduction.
  - **Automatic Context Caching**: 90% discount on cached inputs ($0.14 / 1M cache read rate).
- **Pricing**: $0.55 / 1M input tokens | $0.14 / 1M cached input tokens | $2.19 / 1M output tokens

### Model: DeepSeek-V3
- **Name**: DeepSeek-V3 (`deepseek-chat`)
- **Release Date**: December 2024
- **Architecture**: 671B Parameter Sparse MoE (37B active) with Multi-Head Latent Attention (MLA)
- **Context Window**: 128,000 tokens
- **Pricing**: $0.14 / 1M input tokens | $0.014 / 1M cached input tokens | $0.55 / 1M output tokens

---

# 4. Code Example (OpenAI SDK Compatible)

```python
import os
from openai import OpenAI

# Initialize client using OpenAI SDK pointed to DeepSeek API base_url
client = OpenAI(
    api_key=os.environ.get("DEEPSEEK_API_KEY"),
    base_url="https://api.deepseek.com/v1"
)

# Call DeepSeek-R1 reasoning model
completion = client.chat.completions.create(
    model="deepseek-reasoner",
    messages=[
        {"role": "system", "content": "You are a helpful mathematical assistant."},
        {"role": "user", "content": "Find all integer solutions to x^3 + y^3 = z^3 + w^3 for values under 100."}
    ]
)

# Inspect internal thinking and final output
print("Model Response:")
print(completion.choices[0].message.content)
```

---

# 5. Pricing Summary

| Model | Input Rate / 1M | Cache Read Rate / 1M (90% Off) | Output Rate / 1M |
| :--- | :--- | :--- | :--- |
| **DeepSeek-V3** | $0.14 | $0.014 | $0.55 |
| **DeepSeek-R1** | $0.55 | $0.14 | $2.19 |
| **DeepSeek-Coder-V2** | $0.14 | $0.014 | $0.28 |

---

# 6. Official References

- Official DeepSeek Platform: [platform.deepseek.com](https://platform.deepseek.com)
- DeepSeek GitHub Organization: [github.com/deepseek-ai](https://github.com/deepseek-ai)
- DeepSeek Web Application: [chat.deepseek.com](https://chat.deepseek.com)
