---
title: Cartesia â€” Sonic Specification
provider: Cartesia
capability: 01-Text-to-Speech-Sonic
file: Sonic.md
last_updated: 2026-07-28
tags: [cartesia, sonic, 01-text-to-speech-sonic, sonic]
author: Antigravity AI Documentation Engine
---

# Cartesia â€” Sonic

## Overview
Detailed technical specification for **Sonic** under **01-Text-to-Speech-Sonic**.

## Model & Feature Specifications
- **Model Family**: Cartesia Sonic State Space Model (SSM) Voice Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Audio Samples (Voice Cloning)
- **Supported Output Modalities**: Audio PCM (16-bit 24kHz / 44.1kHz), MP3, Mu-law
- **Latency**: **Sub-100ms** Time-To-First-Byte (TTFB)
- **Pricing**: $0.045 / 1,000 characters
- **API Availability**: Cartesia API (pi.cartesia.ai), Python SDK (cartesia), TypeScript SDK (@cartesia/cartesia-js)
- **Streaming Protocol**: WebSockets (wss://api.cartesia.ai/tts/websocket) & HTTP Chunks

## Typical Use Cases
1. Sub-100ms interactive real-time voice bots using WebSockets PCM streaming.
2. Instant custom voice cloning from short 5-second audio samples.

## Strengths & Limitations
- **Strengths**: Industry-leading sub-100ms latency, State Space Model (SSM) computational efficiency, human voice realism.
- **Limitations**: Focused strictly on audio speech synthesis and voice cloning.

## Example Request (Official Python SDK WebSockets)
`python
import os
import asyncio
from cartesia import AsyncCartesia

async def main():
    client = AsyncCartesia(api_key=os.environ.get("CARTESIA_API_KEY"))
    ws = await client.tts.websocket()

    output = await ws.send(
        model_id="sonic-english",
        transcript="Hello! I am Cartesia Sonic, rendering speech in under 100 milliseconds.",
        voice={"mode": "id", "id": "a0e168ee-3a90-4c08-a35b-e323fa4d0602"},
        output_format={"container": "raw", "encoding": "pcm_s16le", "sample_rate": 24000}
    )

    async for buffer in output:
        # Stream raw PCM audio bytes to speaker / audio output
        pass

    await ws.close()

asyncio.run(main())
`

## Related Documentation & Models
- See official Cartesia documentation at https://docs.cartesia.ai
