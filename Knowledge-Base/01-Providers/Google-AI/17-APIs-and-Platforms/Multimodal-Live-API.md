---
title: Google AI â€” Multimodal-Live-API Specification
provider: Google AI
capability: 17-APIs-and-Platforms
file: Multimodal-Live-API.md
last_updated: 2026-07-28
tags: [google, deepmind, 17-apis-and-platforms, multimodal-live-api]
author: Antigravity AI Documentation Engine
---

# Google AI â€” Multimodal-Live-API

## Overview
Detailed technical specification for **Multimodal-Live-API** under **17-APIs-and-Platforms**.

## Model & Feature Specifications
- **Model Family**: Google DeepMind Gemini / Imagen / Veo Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image, Audio (9.5 hrs), Video (1 hr MP4)
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 1,000,000 to 2,000,000 tokens
- **Max Output**: 8,192 tokens
- **Pricing**: Prompts <128k (.25 in / .00 out) | Prompts >128k (.50 in / .00 out)
- **API Availability**: Google AI Studio, Google Cloud Vertex AI
- **Streaming Support**: SSE (	ext/event-stream) & WebSockets
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Schema / Pydantic)

## Typical Use Cases
1. Whole repository code analysis & 1-hour video ingestion.
2. Enterprise Google Search Grounded search bots.

## Strengths & Limitations
- **Strengths**: 2M token context window, native video understanding, search grounding, context caching (75% discount).
- **Limitations**: Configurable safety moderation thresholds.

## Example Request
`python
import os
from google import genai

client = genai.Client()
print("Executing Multimodal-Live-API query...")
`

## Related Documentation & Models
- See sibling capability files and official Google AI Studio references.
