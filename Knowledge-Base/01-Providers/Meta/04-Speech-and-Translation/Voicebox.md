---
title: Meta AI â€” Voicebox Specification
provider: Meta
capability: 04-Speech-and-Translation
file: Voicebox.md
last_updated: 2026-07-28
tags: [meta, llama, 04-speech-and-translation, voicebox]
author: Antigravity AI Documentation Engine
---

# Meta AI â€” Voicebox

## Overview
Detailed technical specification for **Voicebox** under **04-Speech-and-Translation**.

## Model & Feature Specifications
- **Model Family**: Meta Llama Open-Source Foundation Series
- **License**: Meta Llama 3 Community License Agreement (Free commercial use up to 700M MAU)
- **Supported Input Modalities**: Text, Image (Llama 3.2 Vision), Audio (SeamlessM4T)
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 128,000 tokens
- **Max Output**: 8,192 tokens
- **Hosting Options**: Self-hosted (vLLM, Ollama, TGI) or Hosted Cloud APIs (Together, Groq, Bedrock)
- **Streaming Support**: SSE (	ext/event-stream)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode & GBNF Grammars)

## Typical Use Cases
1. Self-hosted privacy-first enterprise RAG on private GPU servers.
2. Fine-tuning custom domain weights via LoRA / QLoRA using Unsloth.

## Strengths & Limitations
- **Strengths**: 100% open-weights availability, zero vendor lock-in, customizable weights, state-of-the-art performance (405B & 70B).
- **Limitations**: Requires self-managed GPU hardware infrastructure or cloud inference partner endpoints.

## Example Request (Via Ollama Local API)
`python
import os
import ollama

response = ollama.chat(
    model="llama3.3:70b",
    messages=[{"role": "user", "content": "Explain open-source AI foundation model architecture."}]
)
print(response['message']['content'])
`

## Related Documentation & Models
- See official Meta Llama documentation at https://llama.meta.com
