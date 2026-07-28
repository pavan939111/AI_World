---
title: OpenAI â€” RPM-TPM-RPD-Tables Specification
provider: OpenAI
capability: 17-Rate-Limits-and-Quotas
file: RPM-TPM-RPD-Tables.md
last_updated: 2026-07-28
tags: [openai, 17-rate-limits-and-quotas, rpm-tpm-rpd-tables]
author: Antigravity AI Documentation Engine
---

# OpenAI â€” RPM-TPM-RPD-Tables

## Overview
Detailed technical specification for **RPM-TPM-RPD-Tables** under **17-Rate-Limits-and-Quotas**.

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
print("Executing RPM-TPM-RPD-Tables query...")
`

## Related Documentation & Models
- See sibling capability files and official OpenAI references.
