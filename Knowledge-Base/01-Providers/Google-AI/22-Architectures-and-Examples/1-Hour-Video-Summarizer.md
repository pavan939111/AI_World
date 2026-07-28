---
title: Google AI â€” 1-Hour-Video-Summarizer Specification
provider: Google AI
capability: 22-Architectures-and-Examples
file: 1-Hour-Video-Summarizer.md
last_updated: 2026-07-28
tags: [google, deepmind, 22-architectures-and-examples, 1-hour-video-summarizer]
author: Antigravity AI Documentation Engine
---

# Google AI â€” 1-Hour-Video-Summarizer

## Overview
Detailed technical specification for **1-Hour-Video-Summarizer** under **22-Architectures-and-Examples**.

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
print("Executing 1-Hour-Video-Summarizer query...")
`

## Related Documentation & Models
- See sibling capability files and official Google AI Studio references.
