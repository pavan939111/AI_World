---
title: PlayHT â€” PlayHT-2-0-Turbo Specification
provider: PlayHT
capability: 01-Text-to-Speech-Models
file: PlayHT-2-0-Turbo.md
last_updated: 2026-07-28
tags: [playht, tts, 01-text-to-speech-models, playht-2-0-turbo]
author: Antigravity AI Documentation Engine
---

# PlayHT â€” PlayHT-2-0-Turbo

## Overview
Detailed technical specification for **PlayHT-2-0-Turbo** under **01-Text-to-Speech-Models**.

## Model & Feature Specifications
- **Model Family**: PlayHT Conversational Neural Voice Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Audio Samples (Voice Cloning)
- **Supported Output Modalities**: Audio MP3, WAV, PCM (16-bit 24kHz / 44.1kHz), Ogg
- **Latency**: **Sub-300ms** Time-To-First-Byte (TTFB)
- **Pricing**: Standard word and character rate schedule
- **API Availability**: Official PlayHT API (pi.play.ht/api/v2), Python SDK (pyplayht)
- **Authentication**: AUTHORIZATION: Bearer <SECRET_KEY> and X-USER-ID: <USER_ID> headers
- **Streaming Protocol**: WebSockets & HTTP chunked streaming

## Typical Use Cases
1. Production real-time interactive voice bots (PlayHT 2.0 Turbo + WebSockets).
2. Automated web article audio narration widgets.

## Strengths & Limitations
- **Strengths**: Sub-300ms latency, 10-second instant voice cloning, emotional voice expressiveness, web audio player widgets.
- **Limitations**: Requires dual API headers (AUTHORIZATION + X-USER-ID).

## Example Request (Official Python SDK)
`python
import os
from pyplayht import Client, TTSOptions

client = Client(
    user_id=os.environ.get("PLAYHT_USER_ID"),
    api_key=os.environ.get("PLAYHT_API_KEY")
)

options = TTSOptions(voice="s3://voice-cloning-zero-shot/d9abb782-3dd4-4889-a4ee-8d857d90c0ff/samantha/manifest.json")

# Stream audio chunked bytes
for chunk in client.tts("Welcome to PlayHT real-time voice streaming.", options=options):
    pass # Handle raw PCM / MP3 bytes stream
`

## Related Documentation & Models
- See official PlayHT documentation at https://docs.play.ht
