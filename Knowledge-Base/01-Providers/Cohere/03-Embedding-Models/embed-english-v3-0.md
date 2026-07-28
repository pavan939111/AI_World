---
title: Cohere â€” embed-english-v3-0 Specification
provider: Cohere
capability: 03-Embedding-Models
file: embed-english-v3-0.md
last_updated: 2026-07-28
tags: [cohere, command, rerank, 03-embedding-models, embed-english-v3-0]
author: Antigravity AI Documentation Engine
---

# Cohere â€” embed-english-v3-0

## Overview
Detailed technical specification for **embed-english-v3-0** under **03-Embedding-Models**.

## Model & Feature Specifications
- **Model Family**: Cohere Command & Rerank Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Documents, Web Search Connectors
- **Supported Output Modalities**: Text, JSON Schema, Citations, Function Calls
- **Context Window**: 128,000 tokens
- **Max Output**: 4,096 tokens
- **Pricing**: Command R+ ($2.50 in / $10.00 out per 1M) | Command R ($0.15 in / $0.60 out per 1M) | Rerank v3.5 ($2.00 / 1k search units)
- **API Availability**: Cohere Console (pi.cohere.com), AWS Bedrock, Azure AI, Oracle Cloud OCI
- **Streaming Support**: SSE (	ext/event-stream)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode)

## Typical Use Cases
1. Production Two-Stage Enterprise RAG (Embed v3 + Rerank v3.5).
2. Multi-step document search with automated inline text citations.

## Strengths & Limitations
- **Strengths**: Industry-standard Rerank model, multi-cloud deployment (AWS/Azure/OCI/VPC), fine-grained inline document citations.
- **Limitations**: Max output tokens capped at 4,096 tokens per turn.

## Example Request
`python
import os
import cohere

co = cohere.ClientV2(api_key=os.environ.get("CO_API_KEY"))
response = co.chat(
    model="command-r-plus-08-2024",
    messages=[{"role": "user", "content": "Explain two-stage enterprise RAG architecture."}]
)
print(response.message.content[0].text)
`

## Related Documentation & Models
- See official Cohere documentation at https://docs.cohere.com
