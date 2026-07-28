---
title: Together AI — Complete Technical Specification & Provider Reference
provider: Together AI
view: By Provider
last_updated: 2026-07-28
tags: [together-ai, llama, deepseek, flux, open-models, fine-tuning, flashattention-3]
author: Antigravity AI Documentation Engine
---

# Together AI — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Together AI Inc.
- **Parent Company**: Together AI Inc.
- **Founders**: Vipul Ved Prakash (CEO, former BitTorrent CEO and Napster lead), Ce Zhang (CTO, former ETH Zurich Associate Professor), Percy Liang (Chief Scientist, Associate Professor of Computer Science at Stanford University and director of CRFM)
- **Headquarters**: San Francisco, California, USA
- **Year Founded**: June 2022
- **Mission**: To build the fastest, most scalable GPU cloud for open-source AI inference and model training.
- **Valuation & Funding**: $1.25 Billion unicorn valuation following $228M in funding led by Salesforce Ventures, NVIDIA, Kleiner Perkins, Emergence Capital, and Lux Capital.
- **AI Ecosystem**: Full-stack open-source AI cloud platform providing serverless inference for 100+ open foundation models (Llama 3.3 70B, Llama 3.1 405B, DeepSeek-R1, DeepSeek-V3, Qwen 2.5 72B, Mixtral 8x22B, FLUX.1 [schnell]/[dev]/[pro]), Together Kernel inference engine (FlashAttention-3 delivering 400+ tokens/second), serverless LoRA fine-tuning API, dedicated H100/H200/B200 GPU cluster hosting, and OpenAI-compatible REST API (`api.together.xyz/v1`).
- **Timeline & Major Milestones**:
  - **June 2022**: Founded in SF by Vipul Ved Prakash, Ce Zhang, and Percy Liang.
  - **May 2023**: Announced $20M seed funding and launched Together Inference platform.
  - **November 2023**: Raised $102M Series A led by Kleiner Perkins and NVIDIA.
  - **March 2024**: Raised $106M Series A extension led by Salesforce Ventures.
  - **July 2024**: Launched Llama 3.1 405B serverless endpoints on day one.
  - **September 2024**: Released Together Kernel Engine powered by FlashAttention-3 delivering 400+ tok/s response speeds.
  - **January 2025**: Hosted DeepSeek-R1 and DeepSeek-V3 serverless endpoints on day one.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Serverless Language LLMs** | Fast inference serving 100+ open-weights LLMs with 400+ tok/s speed | Yes | Llama 3.3 70B, Llama 3.1 405B, DeepSeek-V3 | Active |
| **Reasoning Models** | Serverless reasoning chain-of-thought endpoints | Yes | DeepSeek-R1 (671B MoE) | Active |
| **Image & Vision Gen** | SOTA image generation endpoints and multimodal vision models | Yes | FLUX.1 [pro]/[dev]/[schnell], Llama 3.2 Vision | Active |
| **Together Kernel Engine** | FlashAttention-3 & Speculative Decoding GPU kernel acceleration | Yes | All Together Serverless Models | Active |
| **Custom Fine-Tuning API** | Serverless LoRA and full-parameter model fine-tuning API | Yes | `/v1/fine-tuning` | Active |
| **Dedicated GPU Clusters** | Reserved and on-demand NVIDIA H100, H200, and B200 GPU clusters | Yes | Dedicated Cloud Console | Active |

---

# 3. Serverless Language & Reasoning Models

### Model: Llama 3.3 70B Instruct Turbo
- **Name**: Llama 3.3 70B (`meta-llama/Llama-3.3-70B-Instruct-Turbo`)
- **Release Date**: December 2024
- **Parameters**: 70 Billion parameters
- **Context Window**: 128,000 tokens
- **Throughput**: 400+ tokens / second
- **Services Provided by the Model**:
  - **High-Throughput Dialogue & RAG**: Enterprise-grade open model inference with sub-second response times.
- **Pricing**: $0.88 / 1,000,000 input & output tokens

### Model: DeepSeek-R1 (671B MoE)
- **Name**: DeepSeek-R1 (`deepseek-ai/DeepSeek-R1`)
- **Release Date**: January 2025
- **Pricing**: $7.00 / 1,000,000 input & output tokens

---

# 4. Code Example (Official `together` Python SDK)

```python
import os
from together import Together

# Initialize Together AI Client
client = Together(api_key=os.environ.get("TOGETHER_API_KEY"))

# Call serverless Llama 3.3 70B Instruct Turbo
response = client.chat.completions.create(
    model="meta-llama/Llama-3.3-70B-Instruct-Turbo",
    messages=[
        {"role": "system", "content": "You are a helpful enterprise AI assistant."},
        {"role": "user", "content": "Explain Together FlashAttention-3 kernel acceleration."}
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
| **Llama 3.1 8B Instruct Turbo** | **$0.18 / 1M tokens** |
| **Llama 3.3 70B Instruct Turbo** | **$0.88 / 1M tokens** |
| **Llama 3.1 405B Instruct Turbo** | **$3.50 / 1M tokens** |
| **DeepSeek-V3** | **$1.25 / 1M tokens** |
| **DeepSeek-R1** | **$7.00 / 1M tokens** |
| **FLUX.1 [schnell]** | **$0.003 / image** |

---

# 6. Official References

- Official Together AI API Documentation: [docs.together.ai](https://docs.together.ai)
- Together AI Platform Console: [api.together.ai](https://api.together.ai)
- Official Website: [together.ai](https://together.ai)
