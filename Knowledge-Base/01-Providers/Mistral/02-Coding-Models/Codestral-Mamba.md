---
title: Mistral â€” Codestral-Mamba Specification
provider: Mistral
capability: 02-Coding-Models
file: Codestral-Mamba.md
last_updated: 2026-07-28
tags: [mistral, moe, 02-coding-models, codestral-mamba]
author: Antigravity AI Documentation Engine
---

# Mistral â€” Codestral-Mamba

## Overview
Detailed technical specification for **Codestral-Mamba** under **02-Coding-Models**.

## Model & Feature Specifications
- **Model Family**: Mistral AI Frontier & Open Weights Series (Sparse MoE Architecture)
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image (Pixtral), PDF Document (Mistral OCR)
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 128,000 tokens
- **Max Output**: 8,192 tokens
- **Pricing**: Mistral Large 2 ($2.00 in / $6.00 out per 1M) | Codestral ($0.20 in / $0.60 out per 1M)
- **API Availability**: La Plateforme (pi.mistral.ai), AWS Bedrock, Azure AI, GCP Vertex AI
- **Streaming Support**: SSE (	ext/event-stream)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode)

## Typical Use Cases
1. Production IDE code completion via Fill-In-the-Middle (FIM) API.
2. Enterprise PDF document OCR parsing into clean Markdown.

## Strengths & Limitations
- **Strengths**: Top-tier coding and multilingual performance, open-weights availability, EU data sovereignty & GDPR compliance.
- **Limitations**: Rate limit tier quotas on developer accounts.

## Example Request
`python
import os
from mistralai import Mistral

client = Mistral(api_key=os.environ.get("MISTRAL_API_KEY"))
response = client.chat.complete(
    model="mistral-large-latest",
    messages=[{"role": "user", "content": "Explain Sparse Mixture-of-Experts (MoE) architecture."}]
)
print(response.choices[0].message.content)
`

## Related Documentation & Models
- See official Mistral AI documentation at https://docs.mistral.ai
