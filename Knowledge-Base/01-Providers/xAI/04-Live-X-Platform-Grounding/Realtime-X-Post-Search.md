---
title: xAI â€” Realtime-X-Post-Search Specification
provider: xAI
capability: 04-Live-X-Platform-Grounding
file: Realtime-X-Post-Search.md
last_updated: 2026-07-28
tags: [xai, grok, 04-live-x-platform-grounding, realtime-x-post-search]
author: Antigravity AI Documentation Engine
---

# xAI â€” Realtime-X-Post-Search

## Overview
Detailed technical specification for **Realtime-X-Post-Search** under **04-Live-X-Platform-Grounding**.

## Model & Feature Specifications
- **Model Family**: xAI Grok Series (Trained on Colossus 100k H100 Supercomputer)
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image (Grok-2-Vision), Live X Posts
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 128,000 tokens
- **Max Output**: 8,192 tokens
- **Pricing**: Grok-2 ($2.00 in / $10.00 out per 1M tokens) | Grok-2-mini ($0.20 in / $1.00 out per 1M)
- **API Availability**: xAI API (pi.x.ai), OpenAI-compatible SDKs
- **Streaming Support**: SSE (	ext/event-stream)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode)

## Typical Use Cases
1. Real-time X post search & sentiment analysis.
2. Production code generation & vision OCR.

## Strengths & Limitations
- **Strengths**: Real-time X platform data integration, 100% OpenAI API compatibility, high intelligence trained on Colossus.
- **Limitations**: Rate limit quotas on developer accounts.

## Example Request
`python
import os
from openai import OpenAI

client = OpenAI(
    api_key=os.environ.get("XAI_API_KEY"),
    base_url="https://api.x.ai/v1"
)

completion = client.chat.completions.create(
    model="grok-2-latest",
    messages=[{"role": "user", "content": "What is the latest breaking tech news on X today?"}]
)
print(completion.choices[0].message.content)
`

## Related Documentation & Models
- See official xAI documentation at https://docs.x.ai
