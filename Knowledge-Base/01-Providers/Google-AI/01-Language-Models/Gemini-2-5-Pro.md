---
title: Google AI — Gemini 2.5 Pro Specification & Engineering Guide
provider: Google AI
capability: 01-Language-Models
file: Gemini-2-5-Pro.md
last_updated: 2026-07-28
tags: [google, deepmind, gemini-2-5-pro, 2m-context, video-ingestion]
author: Antigravity AI Documentation Engine
---

# Google AI — Gemini 2.5 Pro Specification & Engineering Guide

## 1. Overview
**Gemini 2.5 Pro** is Google DeepMind's flagship long-context multimodal model featuring a groundbreaking **2,000,000 token context window** and native MP4/MOV video file ingestion up to 1 hour long.

---

## 2. Model & Feature Specifications

- **Model Identifier**: `gemini-2.5-pro`
- **Model Family**: DeepMind Multimodal Long-Context Flagship
- **Release Date**: February 2025
- **Supported Input Modalities**: Text, Images, Audio (up to 9.5 hrs), Video (up to 1 hr MP4)
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 2,000,000 tokens
- **Max Output Tokens**: 8,192 tokens
- **Pricing**:
  - Prompts < 128k: $1.25 / 1M input tokens | $5.00 / 1M output tokens
  - Prompts > 128k: $2.50 / 1M input tokens | $10.00 / 1M output tokens
  - Context Caching: $0.3125 / 1M cached input tokens (75% discount)
- **API Availability**: Google AI Studio (`@google/genai`), Google Cloud Vertex AI
- **Google Search Grounding**: Yes — `tools=[{"google_search": {}}]`
- **Context Caching**: Yes — Automatically caches prompts >32,768 tokens in TPU memory

---

## 3. Runnable Python Example

```python
import os
from google import genai

client = genai.Client(api_key=os.environ.get("GEMINI_API_KEY"))

response = client.models.generate_content(
    model="gemini-2.5-pro",
    contents="Summarize the core architectural innovations of Gemini 2.5 Pro.",
    config={"tools": [{"google_search": {}}]}
)

print(response.text)
```
