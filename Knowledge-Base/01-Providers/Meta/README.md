---
title: Meta AI (Llama) — Complete Technical Specification & Provider Reference
provider: Meta
view: By Provider
last_updated: 2026-07-28
tags: [meta, llama, llama-3-3-70b, llama-3-1-405b, open-source, vllm, ollama]
author: Antigravity AI Documentation Engine
---

# Meta AI (Llama) — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Meta Platforms, Inc.
- **Parent Company**: Meta Platforms, Inc.
- **Founders**: Mark Zuckerberg (Founder & CEO), Yann LeCun (Chief AI Scientist, Turing Award laureate)
- **Headquarters**: Menlo Park, California, USA (FAIR research labs in Menlo Park, New York, Paris)
- **Year Founded**: 2004 (Meta), 2013 (FAIR - Fundamental AI Research)
- **Mission**: To build open-source AI infrastructure that empowers developers globally and accelerates technological progress.
- **Market Capitalization**: $1.5 Trillion+ (Meta Platforms, Inc.)
- **AI Ecosystem**: Comprehensive open-source foundation model ecosystem providing open weights (Llama 3.3 70B, Llama 3.1 405B, Llama 3.2 90B/11B Vision), Segment Anything Model (SAM 2), SeamlessM4T speech translation, Movie Gen video synthesis, Llama Guard 3 safety classifiers, Llama Stack API standard, and local self-hosting ecosystems (Ollama, vLLM, GGUF).
- **Timeline & Major Milestones**:
  - **February 2023**: Released LLaMA 1 open research weights (65B parameters).
  - **July 2023**: Released Llama 2 with free commercial use license.
  - **April 2024**: Released Llama 3 (8B and 70B models).
  - **July 2024**: Released Llama 3.1 405B — the world's largest open foundation model, alongside SAM 2.
  - **September 2024**: Released Llama 3.2 multimodal vision (90B and 11B) and lightweight mobile (3B and 1B) models.
  - **October 2024**: Announced Movie Gen 30B generative video foundation model.
  - **December 2024**: Released Llama 3.3 70B delivering Llama 3.1 405B performance at 70B scale.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Language Models** | Open-weights foundation models for general reasoning, chat, & code | Yes (Open Weights) | Llama 3.1 405B, Llama 3.3 70B, Llama 3.1 8B | Active |
| **Vision Models** | Multimodal visual understanding, document OCR, chart analysis | Yes (Open Weights) | Llama 3.2 90B Vision, Llama 3.2 11B Vision | Active |
| **Image Segmentation** | Real-time video and image object segmentation | Yes (Open Source) | Segment Anything Model 2 (SAM 2) | Active |
| **Speech Translation** | Multilingual speech recognition & translation across 100+ languages | Yes (Open Source) | SeamlessM4T v2 | Active |
| **Video Generation** | Generative 1080p video clip synthesis with synchronized audio | Research | Movie Gen (30B) | Preview |
| **Safety Guardrails** | Open safety classifiers for prompt injection & toxic output filtering | Yes (Open Source) | Llama Guard 3, Prompt Guard | Active |
| **Llama Stack Standard** | Open API specification standard for cloud & local Llama backends | Yes | Llama Stack API Client (`llama-stack-client`) | Active |
| **Self-Hosting Engines** | High-throughput local inference servers & 4-bit quantization | Yes | Ollama, vLLM, llama.cpp (GGUF) | Active |

---

# 3. Language Models

### Model: Llama 3.3 70B Instruct
- **Name**: Llama 3.3 70B (`meta-llama/Llama-3.3-70B-Instruct`)
- **Release Date**: December 2024
- **Parameters**: 70 Billion parameters
- **Context Window**: 128,000 tokens
- **License**: Meta Llama 3 Community License Agreement
- **Services Provided by the Model**:
  - **Frontier Performance at 70B Scale**: Matches Llama 3.1 405B benchmark performance while requiring far fewer GPU resources (runnable on a single node with 2x H100 or 4x A100 GPUs).
  - **Tool Use & Function Calling**: Native `<|start_header_id|>ipython<|end_header_id|>` tool execution.
  - **Fine-Tuning Flexibility**: Fully customizable weights via LoRA, QLoRA, and DPO preference tuning.

### Model: Llama 3.1 405B Instruct
- **Name**: Llama 3.1 405B (`meta-llama/Meta-Llama-3.1-405B-Instruct`)
- **Release Date**: July 2024
- **Parameters**: 405 Billion parameters
- **Context Window**: 128,000 tokens
- **Services Provided by the Model**:
  - **Frontier Foundation Teacher Model**: Open model capability matching GPT-4o and Claude 3.5 Sonnet, ideal for synthetic data generation and distilled model training.

---

# 4. Code Example (Ollama Self-Hosted Python SDK)

```python
import os
import ollama

# Execute prompt against local self-hosted Llama 3.3 70B instance
response = ollama.chat(
    model="llama3.3:70b",
    messages=[
        {"role": "system", "content": "You are a privacy-first local AI assistant."},
        {"role": "user", "content": "Explain how vLLM PagedAttention optimizes KV cache memory management."}
    ]
)

print(response['message']['content'])
```

---

# 5. Hardware Sizing Guide for Self-Hosting

| Model Size | Precision | Quantization | Required VRAM | Minimum Recommended Hardware |
| :--- | :--- | :--- | :--- | :--- |
| **Llama 3.1 8B** | FP16 | None | 16 GB VRAM | 1x RTX 4090 (24GB) or Apple M3 Max |
| **Llama 3.1 8B** | INT4 | GGUF Q4_K_M | 5.5 GB VRAM | Consumer Laptop / RTX 3060 |
| **Llama 3.3 70B** | FP16 | None | 140 GB VRAM | 2x NVIDIA H100 (80GB) or 4x A100 |
| **Llama 3.3 70B** | INT4 | AWQ / GGUF | 40 GB VRAM | 1x A100 (80GB) or 2x RTX 4090 |
| **Llama 3.1 405B** | FP16 | None | 810 GB VRAM | 8x NVIDIA H100 (80GB) HGX Cluster |

---

# 6. Official References

- Official Meta Llama Website: [llama.meta.com](https://llama.meta.com)
- Meta Llama GitHub Organization: [github.com/meta-llama](https://github.com/meta-llama)
- Hugging Face Meta Llama Hub: [huggingface.co/meta-llama](https://huggingface.co/meta-llama)
