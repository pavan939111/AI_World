---
title: NVIDIA AI — Complete Technical Specification & Provider Reference
provider: NVIDIA
view: By Provider
last_updated: 2026-07-28
tags: [nvidia, nim, nemotron, tensorrt-llm, nemo, cuda, build-nvidia-com, h100, blackwell]
author: Antigravity AI Documentation Engine
---

# NVIDIA AI — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: NVIDIA Corporation
- **Parent Company**: NVIDIA Corporation
- **Founders**: Jensen Huang (Founder & CEO), Chris Malachowsky, Curtis Priem
- **Headquarters**: Santa Clara, California, USA
- **Year Founded**: 1993
- **Mission**: To pioneer GPU-accelerated computing and build the engines, software frameworks, and infrastructure that power modern artificial intelligence.
- **Market Capitalization**: $3.5 Trillion+ (World's most valuable AI computing company)
- **AI Ecosystem**: Full-stack enterprise AI infrastructure providing CUDA parallel computing platform, Tensor Core GPU architecture (H100 SXM5, H200, Blackwell B200), NVIDIA NIM (Inference Microservices for self-hosted containerized model deployment via Docker & Helm), Nemotron-70B, NV-Embed-v2 (#1 MTEB embedding model), NV-Rerank-v1, NeMo Guardrails programmable safety framework, TensorRT-LLM GPU compiler engine, Omniverse 3D simulation, Cosmos World Models for robotics, and build.nvidia.com serverless cloud API (`integrate.api.nvidia.com/v1`).
- **Timeline & Major Milestones**:
  - **1993**: Founded in Santa Clara by Jensen Huang, Chris Malachowsky, and Curtis Priem.
  - **2006**: Introduced CUDA parallel computing architecture.
  - **2016**: Delivered DGX-1 — the world's first AI supercomputer in a box — to OpenAI.
  - **2022**: Released H100 Hopper GPU architecture featuring Transformer Engine FP8 precision.
  - **March 2024**: Announced Blackwell B200 GPU architecture and launched NVIDIA NIM Microservices.
  - **October 2024**: Released Llama-3.1-Nemotron-70B-Instruct, setting new open-model benchmark records, alongside NV-Embed-v2.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models / Tools | Status |
| :--- | :--- | :--- | :--- | :--- |
| **NVIDIA NIM Microservices** | Containerized inference microservices for enterprise K8s deployment | Yes | NIM Llama 3.3 70B, NIM Nemotron 70B, NIM DeepSeek-R1 | Active |
| **Nemotron & NV-Embed Models** | NVIDIA foundational LLMs, reward models, and #1 MTEB embedding models | Yes | Nemotron-70B, NV-Embed-v2, NV-Rerank-v1 | Active |
| **NeMo & Guardrails** | End-to-end framework and Colang programmable safety guardrails | Yes | NeMo Guardrails, NeMo Curator, NeMo Aligner | Active |
| **TensorRT-LLM Engine** | Open-source GPU compiler delivering In-Flight Batching & PagedAttention | Yes | TensorRT-LLM Engine Compiler | Active |
| **build.nvidia.com Cloud APIs** | Serverless cloud API testing and production endpoints | Yes | `integrate.api.nvidia.com/v1` | Active |
| **Omniverse & Cosmos** | 3D simulation platform and physical world models for robotics | Yes | Omniverse Replicator, Cosmos World Models | Active |

---

# 3. Nemotron & NV-Embed Models

### Model: Llama-3.1-Nemotron-70B-Instruct
- **Name**: Nemotron-70B (`nvidia/llama-3.1-nemotron-70b-instruct`)
- **Release Date**: October 2024
- **Parameters**: 70 Billion parameters
- **Context Window**: 128,000 tokens
- **Training Alignment**: Minimal Preference Optimization (MPO) and Bradley-Terry Reward Model alignment
- **Services Provided by the Model**:
  - **Frontier Performance at 70B Scale**: Outperforms GPT-4o-0513 and Claude 3.5 Sonnet on Arena-Hard, AlpacaEval 2, and MT-Bench benchmarks.
- **Pricing**: Free developer credits on build.nvidia.com

### Model: NV-Embed-v2
- **Name**: NV-Embed-v2 (`nvidia/nv-embed-v2`)
- **Services Provided by the Model**:
  - **#1 MTEB Benchmark Embedding Model**: Highest score ranking on Massive Text Embedding Benchmark across retrieval, classification, and clustering.

---

# 4. Code Example (OpenAI SDK Compatible)

```python
import os
from openai import OpenAI

# Initialize client pointing to NVIDIA API Catalog (build.nvidia.com)
client = OpenAI(
    base_url="https://integrate.api.nvidia.com/v1",
    api_key=os.environ.get("NVIDIA_API_KEY")
)

# Call Nemotron-70B Instruct model
completion = client.chat.completions.create(
    model="nvidia/llama-3.1-nemotron-70b-instruct",
    messages=[
        {"role": "system", "content": "You are a helpful assistant powered by NVIDIA Nemotron-70B."},
        {"role": "user", "content": "Explain how TensorRT-LLM In-Flight Batching accelerates GPU inference throughput."}
    ],
    temperature=0.5,
    max_tokens=1024
)

print("Generated Response:")
print(completion.choices[0].message.content)
```

---

# 5. Pricing Summary

| Licensing / Cloud API | Pricing Rate |
| :--- | :--- |
| **NVIDIA AI Enterprise License** | **$4,500 / GPU / year** (or $1.00 / GPU / hour) |
| **build.nvidia.com Serverless API** | **Free 1,000 credits** + Pay-as-you-go per 1M tokens |
| **TensorRT-LLM / NeMo Guardrails** | **Free Open-Source** (Apache 2.0 / NVIDIA License) |

---

# 6. Official References

- Official NVIDIA AI Documentation: [docs.nvidia.com](https://docs.nvidia.com)
- NVIDIA API Catalog (build.nvidia.com): [build.nvidia.com](https://build.nvidia.com)
- Official Website: [nvidia.com/ai](https://nvidia.com/ai)
