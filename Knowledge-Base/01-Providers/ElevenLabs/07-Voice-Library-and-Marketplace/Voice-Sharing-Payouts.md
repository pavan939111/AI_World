---
title: ElevenLabs â€” Voice-Sharing-Payouts Specification
provider: ElevenLabs
capability: 07-Voice-Library-and-Marketplace
file: Voice-Sharing-Payouts.md
last_updated: 2026-07-28
tags: [elevenlabs, tts, 07-voice-library-and-marketplace, voice-sharing-payouts]
author: Antigravity AI Documentation Engine
---

# ElevenLabs â€” Voice-Sharing-Payouts

## Overview
Detailed technical specification for **Voice-Sharing-Payouts** under **07-Voice-Library-and-Marketplace**.

## Model & Feature Specifications
- **Model Family**: ElevenLabs Neural Audio & Voice Synthesis Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Audio (Speech-to-Speech & Voice Cloning), Video (Dubbing)
- **Supported Output Modalities**: Audio MP3 / PCM (24kHz 16-bit), Subtitles / Timestamps
- **Latency**: 75ms (Eleven Flash v2.5) to 250ms (Multilingual v2)
- **Languages Supported**: 32 languages (Multilingual v2)
- **Pricing**: Flash v2.5 ($0.015 / 1k chars) | Multilingual v2 ($0.30 / 1k chars)
- **API Availability**: ElevenLabs API (pi.elevenlabs.io), Official Python/TypeScript SDKs
- **Streaming Support**: HTTP chunked streaming & WebSockets
- **Voice Customization**: Stability, Clarity, Exaggeration, Style Exaggeration sliders

## Typical Use Cases
1. Production sub-200ms interactive voice bots (Eleven Flash v2.5 + WebSockets).
2. Automated multi-speaker video dubbing and translation across 29 languages.

## Strengths & Limitations
- **Strengths**: Industry-leading human voice realism, 75ms ultra-low latency, instant and professional voice cloning, multi-speaker video dubbing.
- **Limitations**: Character billing consumption quotas based on plan tier.

## Example Request (Official Python SDK)
`python
import os
from elevenlabs.client import ElevenLabs

client = ElevenLabs(api_key=os.environ.get("ELEVENLABS_API_KEY"))

audio_stream = client.generate(
    text="Welcome to the AI Tools Encyclopedia.",
    voice="JBFqnCBsd6RMkjVDRZzb", # Rachel
    model="eleven_flash_v2_5",
    stream=True
)

for chunk in audio_stream:
    if isinstance(chunk, bytes):
        pass # Play or buffer audio PCM/MP3 bytes
`

## Related Documentation & Models
- See official ElevenLabs documentation at https://elevenlabs.io/docs
