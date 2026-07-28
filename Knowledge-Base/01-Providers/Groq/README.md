---
title: Groq — Complete Technical Specification & Provider Reference
provider: Groq
view: By Provider
last_updated: 2026-07-28
tags: [groq, lpu, llama-3-3-70b, deepseek-r1, whisper-large-v3, ultra-fast-inference]
author: Antigravity AI Documentation Engine
---

# Groq — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Groq, Inc.
- **Parent Company**: Groq, Inc.
- **Founders**: Jonathan Ross (CEO, former co-creator of Google's Tensor Processing Unit - TPU)
- **Headquarters**: Mountain View, California, USA
- **Year Founded**: 2016
- **Mission**: To provide real-time AI inference at the speed of thought.
- **Valuation & Funding**: $2.8 Billion+ valuation following $640M Series D funding round led by BlackRock Private Equity Partners.
- **AI Ecosystem**: Ultra-high-speed AI hardware inference platform powered by custom **Language Processing Unit (LPU™)** hardware chips delivering 300 to 500+ tokens per second on open-weight foundation models (Llama 3.3 70B, Llama 3.1 8B, DeepSeek R1 Distill 70B, Whisper Large v3 turbo).
- **Timeline & Major Milestones**:
  - **2016**: Founded by Jonathan Ross after designing Google's TPU.
  - **2020**: Released Tensor Streaming Processor (TSP) single-core deterministic architecture.
  - **2023**: Rebranded TSP to **Language Processing Unit (LPU)** for LLM acceleration.
  - **February 2024**: Broke global LLM speed records delivering 500+ tokens/sec on Llama 2 70B.
  - **August 2024**: Raised $640M Series D at $2.8B valuation; launched Groq Cloud API.
  - **January 2025**: Integrated DeepSeek R1 reasoning models running at 300+ tokens/sec on LPUs.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Language Models** | Ultra-high-speed open-weight LLM inference (300-500+ tok/s) | Yes | Llama 3.3 70B, Llama 3.1 8B, Mixtral 8x7B | Active |
| **Reasoning Models** | High-speed chain-of-thought reasoning on LPU hardware | Yes | DeepSeek-R1-Distill-Llama-70B | Active |
| **Vision Models** | Multimodal image understanding and OCR on LPU hardware | Yes | Llama 3.2 90B Vision, Llama 3.2 11B Vision | Active |
| **Speech-to-Text** | Audio transcription running at **216x real-time speed** | Yes | Whisper Large v3, Whisper Large v3 turbo | Active |
| **OpenAI Compatible API** | Drop-in endpoint replacement for `/v1/chat/completions` | Yes | `api.groq.com/openai/v1` | Active |
| **Tool Use** | High-speed tool parameter extraction and agent loop execution | Yes | Supported across Llama 3.3 & 3.1 models | Active |
| **Structured Outputs** | Guaranteed JSON mode response schemas | Yes | `response_format: { type: "json_object" }` | Active |

---

# 3. Language Models

### Model: Llama 3.3 70B Versatile
- **Name**: Llama 3.3 70B (`llama-3.3-70b-versatile`)
- **Release Date**: December 2024
- **Family**: Meta Llama 3.3 Series on Groq LPU
- **Context Window**: 128,000 tokens
- **Inference Speed**: **300+ Tokens Per Second**
- **Pricing**: $0.59 / 1M input tokens | $0.79 / 1M output tokens
- **API Availability**: Groq Cloud Console (`api.groq.com`), Python (`groq`), Node.js (`groq-sdk`)
- **Services Provided by the Model**:
  - **300+ tok/s Real-time Completions**: Near-instantaneous response generation for production SaaS.
  - **OpenAI API Compatibility**: Works seamlessly with existing OpenAI SDK code by changing `base_url`.
  - **Tool Calling & Function Execution**: Sub-second multi-tool invocation loops.
  - **Structured JSON Mode**: Schema compliance.

---

# 4. Audio Models

### Speech-to-Text: Whisper Large v3 Turbo
- **Inference Speed**: **216x Real-time Speed** (Transcribes a 1-hour audio file in under 17 seconds).
- **Pricing**: $0.040 / hour of audio
- **Services Provided by the Model**:
  - **Ultra-Fast Speech Recognition**: Low-cost, instant transcription across 98 languages.

---

# 5. SDKs & Code Example

```python
import os
from groq import Groq

client = Groq(api_key=os.environ.get("GROQ_API_KEY"))

completion = client.chat.completions.create(
    model="llama-3.3-70b-versatile",
    messages=[
        {"role": "system", "content": "You are a helpful AI assistant running on Groq LPUs."},
        {"role": "user", "content": "Explain why Groq LPU hardware is faster than GPUs."}
    ]
)

print(completion.choices[0].message.content)
```

---

# 6. Pricing Summary

| Model | Input Rate / 1M | Output Rate / 1M |
| :--- | :--- | :--- |
| **Llama 3.3 70B** | $0.59 | $0.79 |
| **Llama 3.1 8B** | $0.05 | $0.08 |
| **DeepSeek R1 Distill 70B** | $0.75 | $0.99 |
| **Whisper Large v3 Turbo** | $0.040 / hour | N/A |

---

# 7. Official References

- Official Groq Documentation: [console.groq.com/docs](https://console.groq.com/docs)
- Groq Cloud Console: [console.groq.com](https://console.groq.com)
- Artificial Analysis Benchmarks: [artificialanalysis.ai/providers/groq](https://artificialanalysis.ai/providers/groq)
