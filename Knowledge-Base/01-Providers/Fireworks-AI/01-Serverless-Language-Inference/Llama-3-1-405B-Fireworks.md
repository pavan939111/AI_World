---
title: Fireworks AI â€” Llama-3-1-405B-Fireworks Specification
provider: Fireworks AI
capability: 01-Serverless-Language-Inference
file: Llama-3-1-405B-Fireworks.md
last_updated: 2026-07-28
tags: [fireworks-ai, llama, deepseek, 01-serverless-language-inference, llama-3-1-405b-fireworks]
author: Antigravity AI Documentation Engine
---

# Fireworks AI â€” Llama-3-1-405B-Fireworks

## Overview
Detailed technical specification for **Llama-3-1-405B-Fireworks** under **01-Serverless-Language-Inference**.

## Model & Feature Specifications
- **Model Family**: Open-Weights Models hosted on Fireworks AI High-Speed GPU Infrastructure (PyTorch Core Team Roots)
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image (Llama 3.2 Vision & FLUX.1)
- **Supported Output Modalities**: Text, Image, JSON Schema, Function Calls
- **Inference Engine**: FireAttention GPU CUDA kernels enabling 4x lower latency & sub-second Multi-LoRA switching
- **Pricing**: Llama 3.3 70B ($0.90 / 1M tokens) | Llama 3.1 8B ($0.20 / 1M) | DeepSeek-R1 ($8.00 / 1M)
- **API Availability**: Fireworks API (pi.fireworks.ai/inference/v1), Python SDK (ireworks-ai), OpenAI SDK compatible
- **Streaming Support**: SSE (	ext/event-stream)
- **Fine-Tuning**: Serverless LoRA fine-tuning API supported

## Typical Use Cases
1. Production open-source LLM inference with FireAttention sub-second multi-tenant LoRA hot-swapping.
2. High-speed reasoning pipelines serving DeepSeek-R1 chain-of-thought tokens.

## Strengths & Limitations
- **Strengths**: FireAttention CUDA kernel acceleration, sub-second Multi-LoRA adapter switching, 100+ open models, OpenAI SDK drop-in compatibility.
- **Limitations**: Rate limit boundaries based on tier account credit balances.

## Example Request (Official Python SDK)
`python
import os
import fireworks.client

fireworks.client.api_key = os.environ.get("FIREWORKS_API_KEY")

response = fireworks.client.ChatCompletion.create(
    model="accounts/fireworks/models/llama-v3p3-70b-instruct",
    messages=[
        {"role": "system", "content": "You are an expert AI systems architect."},
        {"role": "user", "content": "Explain FireAttention GPU CUDA kernel acceleration and Multi-LoRA hot-swapping."}
    ],
    temperature=0.7,
    max_tokens=1000
)

print(response.choices[0].message.content)
`

## Related Documentation & Models
- See official Fireworks AI documentation at https://docs.fireworks.ai
