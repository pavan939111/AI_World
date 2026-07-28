---
title: Language Models — Together AI
service: 01-Language-Models
section: 02-Providers
file: Together-AI.md
last_updated: 2026-07-28
tags: [language-models, llm, providers, together-ai, cloud]
author: Antigravity AI Knowledge Engine
---

# Together AI Provider Profile

**Together AI** (Together Computer) is an AI infrastructure company founded in 2022. It provides a decentralized cloud platform for training, fine-tuning, and serving open-weights Large Language Models at scale. Together AI is known for its custom inference engine optimizations that deliver high throughput on standard GPU clusters.

---

## 1. Cloud Capabilities & Catalog

Together AI hosts a large selection of open-weights models through a serverless API, including:

* **Supported Model Families**:
  * **Llama series** (8B, 70B, 405B).
  * **Qwen series** (e.g., Qwen 2.5 7B, 14B, 72B).
  * **DeepSeek series** (V3, R1, Coder).
  * **Mistral & Mixtral series**.
  * **LoRA Adapters**: Allows developers to host and load their own custom LoRA adapter weights dynamically at runtime.
* **Together Inference Engine**: A custom-designed TensorRT-LLM and FlashAttention stack that optimizes memory layouts and kernel execution on GPUs (A100/H100/H200), offering generation speeds competitive with specialized hardware LPU solutions.

---

## 2. Platform Core Services

* **Serverless Inference API**: Exposes serverless endpoints for over 100 open-weights models under a pay-per-token pricing model.
* **Together Fine-Tuning**: Provides an API for running training jobs on open models. Developers upload dataset files, select training parameters, and run fine-tuning jobs on dedicated nodes.
* **Dedicated GPU Clusters**: For enterprise scale, Together AI allocates dedicated GPU instances (e.g., A100/H100 clusters) running their optimized serving stack, ensuring predictable throughput and zero rate limits.

---

## 3. Integration Standards

Together AI provides a dedicated Python client and implements OpenAI-compatible API routes.

### Serverless API Example (OpenAI SDK)
```python
import os
from openai import OpenAI

client = OpenAI(
    base_url="https://api.together.xyz/v1",
    api_key=os.environ.get("TOGETHER_API_KEY")
)

response = client.chat.completions.create(
    model="meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo",
    messages=[
        {"role": "user", "content": "Write a rust function to parse JSON with serde."}
    ],
    temperature=0.3
)

print(response.choices[0].message.content)
```

* **Best Fit Use Case**: Together AI is ideal for teams deploying open-weights models who require high-speed serverless endpoints, custom fine-tuning environments, or dynamic runtime loading of LoRA adapters.
