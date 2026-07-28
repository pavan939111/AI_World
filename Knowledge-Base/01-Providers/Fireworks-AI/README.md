---
title: Fireworks AI — Complete Technical Specification & Provider Reference
provider: Fireworks AI
view: By Provider
last_updated: 2026-07-28
tags: [fireworks-ai, llama, deepseek, fireattention, lora, fine-tuning, open-models]
author: Antigravity AI Documentation Engine
---

# Fireworks AI — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Fireworks AI (Fireworks.ai Inc.)
- **Parent Company**: Fireworks.ai Inc.
- **Founders**: Lin Qiao (CEO & Founder, former Meta Senior Engineering Director leading the PyTorch team), Dmytro Dzhulgakov (CTO & Co-founder, PyTorch co-creator at Meta)
- **Headquarters**: Redwood City, California, USA
- **Year Founded**: 2022
- **Mission**: To provide the fastest, most production-ready AI inference and fine-tuning platform for generative open foundation models.
- **Valuation & Funding**: $550 Million valuation following $52M Series B funding round led by Sequoia Capital, Benchmark, and AMD Ventures.
- **AI Ecosystem**: High-performance open-model inference platform providing serverless endpoints for 100+ open foundation models (Llama 3.3 70B, Llama 3.1 405B, DeepSeek-R1, DeepSeek-V3, Qwen 2.5 72B, Mixtral 8x22B, FLUX.1 [schnell]/[dev]), FireAttention GPU CUDA kernel acceleration engine (4x lower latency), sub-second Multi-LoRA adapter hot-swapping, serverless LoRA fine-tuning API, structured output enforcement, and OpenAI-compatible REST API (`api.fireworks.ai/inference/v1`).
- **Timeline & Major Milestones**:
  - **2022**: Founded in Redwood City by Meta PyTorch leadership Lin Qiao and Dmytro Dzhulgakov.
  - **2023**: Launched Fireworks AI production platform featuring FireAttention CUDA kernels.
  - **March 2024**: Announced $25M funding led by Benchmark.
  - **July 2024**: Announced $52M Series B led by Sequoia Capital and launched sub-second Multi-LoRA adapter hot-swapping.
  - **August 2024**: Hosted FLUX.1 image generation endpoints on day one.
  - **January 2025**: Hosted DeepSeek-R1 and DeepSeek-V3 serverless endpoints on day one.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Serverless Language LLMs** | Fast inference serving 100+ open-weights LLMs powered by FireAttention | Yes | Llama 3.3 70B, Llama 3.1 405B, DeepSeek-V3 | Active |
| **Reasoning Models** | Serverless chain-of-thought reasoning endpoints | Yes | DeepSeek-R1 (671B MoE) | Active |
| **Multimodal & Vision** | Image generation endpoints and multimodal visual LLMs | Yes | FLUX.1 [schnell]/[dev], Llama 3.2 Vision, FireLLaVA | Active |
| **FireAttention Engine** | Custom CUDA attention kernels delivering 4x lower latency & KV management | Yes | All Fireworks Endpoints | Active |
| **Multi-LoRA Hot-Swapping** | Sub-second multi-tenant LoRA adapter switching without base reload | Yes | `/inference/v1/chat/completions` | Active |
| **Custom Fine-Tuning API** | Serverless LoRA fine-tuning API for Llama and Qwen models | Yes | `/v1/fine_tuning/jobs` | Active |

---

# 3. Serverless Language & Reasoning Models

### Model: Llama 3.3 70B Instruct
- **Name**: Llama 3.3 70B (`accounts/fireworks/models/llama-v3p3-70b-instruct`)
- **Release Date**: December 2024
- **Parameters**: 70 Billion parameters
- **Context Window**: 128,000 tokens
- **Services Provided by the Model**:
  - **High-Speed Enterprise Dialogue & RAG**: Accelerated by FireAttention CUDA kernels for sub-second TTFT.
- **Pricing**: $0.90 / 1,000,000 input & output tokens

### Model: DeepSeek-R1 (671B MoE)
- **Name**: DeepSeek-R1 (`accounts/fireworks/models/deepseek-r1`)
- **Release Date**: January 2025
- **Pricing**: $8.00 / 1,000,000 input & output tokens

---

# 4. Code Example (Official `fireworks-ai` Python SDK)

```python
import os
import fireworks.client

# Initialize Fireworks Client
fireworks.client.api_key = os.environ.get("FIREWORKS_API_KEY")

# Call serverless Llama 3.3 70B Instruct
response = fireworks.client.ChatCompletion.create(
    model="accounts/fireworks/models/llama-v3p3-70b-instruct",
    messages=[
        {"role": "system", "content": "You are a helpful production AI assistant."},
        {"role": "user", "content": "Explain FireAttention GPU CUDA kernel acceleration."}
    ],
    temperature=0.7,
    max_tokens=1000
)

print(response.choices[0].message.content)
```

---

# 5. Pricing Summary

| Model | Input / Output Rate (per 1M tokens) |
| :--- | :--- |
| **Llama 3.1 8B Instruct** | **$0.20 / 1M tokens** |
| **Llama 3.3 70B Instruct** | **$0.90 / 1M tokens** |
| **Llama 3.1 405B Instruct** | **$3.00 / 1M tokens** |
| **DeepSeek-V3** | **$0.90 / 1M tokens** |
| **DeepSeek-R1** | **$8.00 / 1M tokens** |
| **FLUX.1 [schnell]** | **$0.003 / image** |

---

# 6. Official References

- Official Fireworks AI API Documentation: [docs.fireworks.ai](https://docs.fireworks.ai)
- Fireworks Console: [fireworks.ai/dashboard](https://fireworks.ai/dashboard)
- Official Website: [fireworks.ai](https://fireworks.ai)
