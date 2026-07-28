---
title: Groq â€” High-Throughput-Agent-Loops Specification
provider: Groq
capability: 14-Architectures-and-Examples
file: High-Throughput-Agent-Loops.md
last_updated: 2026-07-28
tags: [groq, lpu, 14-architectures-and-examples, high-throughput-agent-loops]
author: Antigravity AI Documentation Engine
---

# Groq â€” High-Throughput-Agent-Loops

## Overview
Detailed technical specification for **High-Throughput-Agent-Loops** under **14-Architectures-and-Examples**.

## Model & Feature Specifications
- **Hardware Acceleration**: Groq LPU (Language Processing Unit) Inference Engine
- **Inference Speed**: 300 to 500+ Tokens Per Second
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Audio (Whisper), Image (Llama 3.2 Vision)
- **Supported Output Modalities**: Text, JSON Schema, Tool Calls
- **Context Window**: 128,000 tokens
- **Max Output**: 8,192 tokens
- **Pricing**: Llama 3.3 70B ($0.59 in / $0.79 out per 1M tokens) | Llama 3.1 8B ($0.05 in / $0.08 out per 1M)
- **API Availability**: Groq Cloud Console (pi.groq.com), OpenAI-compatible client SDKs
- **Streaming Support**: SSE (	ext/event-stream)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode)

## Typical Use Cases
1. Sub-200ms conversational voice pipelines.
2. High-speed multi-agent simulation loops.

## Strengths & Limitations
- **Strengths**: Fastest LLM inference speed in the world (300-500+ tok/s), 100% OpenAI API compatibility, ultra-low cost.
- **Limitations**: Rate limits on free developer accounts.

## Example Request
`python
import os
from groq import Groq

client = Groq(api_key=os.environ.get("GROQ_API_KEY"))
completion = client.chat.completions.create(
    model="llama-3.3-70b-versatile",
    messages=[{"role": "user", "content": "Explain LPU hardware architecture."}]
)
print(completion.choices[0].message.content)
`

## Related Documentation & Models
- See official Groq documentation at https://console.groq.com/docs
