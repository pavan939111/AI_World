---
title: NVIDIA AI â€” Examples Specification
provider: NVIDIA
capability: 05-NVIDIA-build-Cloud-APIs
file: Examples.md
last_updated: 2026-07-28
tags: [nvidia, nim, nemotron, 05-nvidia-build-cloud-apis, examples]
author: Antigravity AI Documentation Engine
---

# NVIDIA AI â€” Examples

## Overview
Detailed technical specification for **Examples** under **05-NVIDIA-build-Cloud-APIs**.

## Model & Feature Specifications
- **Provider Platform**: NVIDIA AI Enterprise & Hardware Computing Cloud (Jensen Huang)
- **Container Standard**: NVIDIA NIM (Inference Microservice) Docker / Helm Packaging (
vcr.io/nim)
- **Supported Core Models**: Nemotron-70B, Llama 3.3 70B, DeepSeek-R1, NV-Embed-v2, NV-Rerank-v1, FLUX.1
- **Inference Acceleration Engine**: TensorRT-LLM (PagedAttention, In-Flight Batching, FP8 Transformer Engine)
- **Safety Framework**: NeMo Guardrails (Colang programmable rule language)
- **API Availability**: NVIDIA API Catalog (integrate.api.nvidia.com/v1), OpenAI SDK compatible
- **Licensing**: NVIDIA AI Enterprise ($4,500 / GPU / year) or build.nvidia.com serverless cloud credits

## Typical Use Cases
1. Deploying a self-hosted, air-gapped enterprise LLM container (NIM Llama 3.3 70B) on private Kubernetes clusters.
2. Building an enterprise RAG search pipeline using NV-Embed-v2 (#1 MTEB rank) + Nemotron-70B + NeMo Guardrails.

## Strengths & Limitations
- **Strengths**: #1 AI computing hardware & CUDA ecosystem in the world, NIM microservice containerization, TensorRT-LLM FP8 speed, NeMo Guardrails safety, NV-Embed-v2 SOTA accuracy.
- **Limitations**: Enterprise NIM production deployments require NVIDIA AI Enterprise licensing for software support.

## Example Request (OpenAI SDK Compatible)
`python
import os
from openai import OpenAI

# Initialize client pointing to NVIDIA API Catalog (build.nvidia.com)
client = OpenAI(
    base_url="https://integrate.api.nvidia.com/v1",
    api_key=os.environ.get("NVIDIA_API_KEY")
)

completion = client.chat.completions.create(
    model="nvidia/llama-3.1-nemotron-70b-instruct",
    messages=[
        {"role": "system", "content": "You are a helpful assistant powered by NVIDIA Nemotron-70B."},
        {"role": "user", "content": "Explain how TensorRT-LLM In-Flight Batching accelerates GPU inference throughput."}
    ],
    temperature=0.5,
    max_tokens=1024
)

print(completion.choices[0].message.content)
`

## Related Documentation & Models
- See official NVIDIA documentation at https://docs.nvidia.com & https://build.nvidia.com
