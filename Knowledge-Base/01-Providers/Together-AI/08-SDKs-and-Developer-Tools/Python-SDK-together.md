---
title: Together AI â€” Python-SDK-together Specification
provider: Together AI
capability: 08-SDKs-and-Developer-Tools
file: Python-SDK-together.md
last_updated: 2026-07-28
tags: [together-ai, llama, deepseek, 08-sdks-and-developer-tools, python-sdk-together]
author: Antigravity AI Documentation Engine
---

# Together AI â€” Python-SDK-together

## Overview
Detailed technical specification for **Python-SDK-together** under **08-SDKs-and-Developer-Tools**.

## Model & Feature Specifications
- **Model Family**: Open-Weights Models hosted on Together AI High-Performance GPU Cloud
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image (Llama 3.2 Vision & SDXL/FLUX)
- **Supported Output Modalities**: Text, Image, JSON Schema, Function Calls
- **Throughput**: 400+ tokens/second powered by Together Kernel FlashAttention-3 engine
- **Pricing**: Llama 3.3 70B ($0.88 / 1M tokens) | Llama 3.1 8B ($0.18 / 1M) | FLUX.1 ($0.003 / image)
- **API Availability**: Together API (pi.together.xyz/v1), Official Python SDK (	ogether), OpenAI SDK compatible
- **Streaming Support**: SSE (	ext/event-stream)
- **Fine-Tuning**: Serverless LoRA & full-parameter fine-tuning API supported

## Typical Use Cases
1. Production open-source LLM inference with ultra-fast 400+ tok/s response speeds.
2. Fine-tuning custom Llama 3.3 70B models using the Together Fine-Tuning API.

## Strengths & Limitations
- **Strengths**: Serves 100+ open models, 400+ tok/s Together Kernel acceleration, serverless fine-tuning API, OpenAI SDK drop-in replacement.
- **Limitations**: Dedicated GPU clusters require minimum hourly commitment.

## Example Request (Official Python SDK)
`python
import os
from together import Together

client = Together(api_key=os.environ.get("TOGETHER_API_KEY"))

response = client.chat.completions.create(
    model="meta-llama/Llama-3.3-70B-Instruct-Turbo",
    messages=[
        {"role": "system", "content": "You are an expert AI software architect."},
        {"role": "user", "content": "Explain Together FlashAttention-3 kernel acceleration."}
    ],
    temperature=0.7,
    max_tokens=1000
)

print(response.choices[0].message.content)
`

## Related Documentation & Models
- See official Together AI documentation at https://docs.together.ai
