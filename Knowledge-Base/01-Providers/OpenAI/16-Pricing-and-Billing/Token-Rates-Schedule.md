---
title: OpenAI â€” Token-Rates-Schedule Specification
provider: OpenAI
capability: 16-Pricing-and-Billing
file: Token-Rates-Schedule.md
last_updated: 2026-07-28
tags: [openai, 16-pricing-and-billing, token-rates-schedule]
author: Antigravity AI Documentation Engine
---

# OpenAI â€” Token-Rates-Schedule

## Overview
Detailed technical specification for **Token-Rates-Schedule** under **16-Pricing-and-Billing**.

## Model & Feature Specifications
- **Model Family**: OpenAI Flagship / Specialist Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image, Audio, Video
- **Supported Output Modalities**: Text, JSON Schema, Audio
- **Context Window**: 128,000 to 200,000 tokens
- **Max Output**: 16,384 to 65,536 tokens
- **Pricing**: Standard token pricing schedule
- **API Availability**: OpenAI REST API, WebSockets, Azure OpenAI
- **Streaming Support**: SSE (	ext/event-stream) & WebSockets
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Schema / Pydantic)

## Typical Use Cases
1. Production AI application integration.
2. Enterprise automation pipelines.

## Strengths & Limitations
- **Strengths**: High intelligence, reliability, official SDK support.
- **Limitations**: Rate limit boundaries and token ceilings.

## Example Request
`python
import os
from openai import OpenAI

client = OpenAI()
print("Executing Token-Rates-Schedule query...")
`

## Related Documentation & Models
- See sibling capability files and official OpenAI references.
