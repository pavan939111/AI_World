---
title: PlayHT — Complete Technical Specification & Provider Reference
provider: PlayHT
view: By Provider
last_updated: 2026-07-28
tags: [playht, playht-2-0-turbo, tts, voice-cloning, websockets, audio-widgets]
author: Antigravity AI Documentation Engine
---

# PlayHT — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: PlayHT (Play.ht Inc.)
- **Parent Company**: Play.ht Inc.
- **Founders**: Hammad Syed (CEO), Mahmoud Felfel (CTO)
- **Headquarters**: Mountain View, California, USA
- **Year Founded**: 2018
- **Mission**: To power real-time conversational AI applications with ultra-realistic human voices and instant voice cloning.
- **Valuation & Funding**: $10 Million+ funding round backed by Y Combinator (YC W22), SV Angel, and prominent AI angel investors.
- **AI Ecosystem**: Full-stack conversational voice platform providing PlayHT 2.0 Turbo (sub-300ms latency TTS engine), Play3.0-Mini, Instant Voice Cloning from 10-second audio, high-fidelity voice cloning, real-time WebSockets PCM streaming, embeddable web audio player widgets, and official REST API (`api.play.ht/api/v2`).
- **Timeline & Major Milestones**:
  - **2018**: Founded by Hammad Syed and Mahmoud Felfel as an audio narration tool for blogs.
  - **Winter 2022**: Graduated from Y Combinator (YC W22).
  - **May 2023**: Launched PlayHT 2.0 conversational voice engine with emotional expressiveness.
  - **January 2024**: Released Instant Voice Cloning requiring only 10 seconds of clear sample audio.
  - **August 2024**: Released PlayHT 2.0 Turbo and WebSockets audio streaming API (`api.play.ht`).

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Text-to-Speech (TTS)** | High-fidelity neural speech synthesis with sub-300ms latency | Yes | PlayHT 2.0 Turbo, Play3.0-Mini | Active |
| **Instant Voice Cloning** | Creating custom voice profiles from 10-second audio samples | Yes | `/api/v2/cloned-voices/instant` | Active |
| **High-Fidelity Voice Cloning** | Studio-grade custom voice creation from longer audio recordings | Yes | `/api/v2/cloned-voices` | Active |
| **WebSockets Streaming** | Real-time PCM audio streaming protocol for interactive voice bots | Yes | `wss://api.play.ht/api/v2/tts/stream` | Active |
| **Web Audio Widgets** | Embeddable narration player widgets for web articles and blogs | Yes | PlayHT Embed Player Widget | Active |

---

# 3. Text-to-Speech Models

### Model: PlayHT 2.0 Turbo
- **Name**: PlayHT 2.0 Turbo (`PlayHT2.0-turbo`)
- **Release Date**: August 2024
- **Latency**: **Sub-300ms** Time-To-First-Byte (TTFB)
- **Services Provided by the Model**:
  - **Conversational Voice Realism**: Rich natural inflections, emotion prompting, and human vocal nuances.
  - **Real-Time Streaming**: Engineered for live WebSockets voice agent integration.

### Model: Play3.0-Mini
- **Name**: Play3.0-Mini (`Play3.0-mini`)
- **Services Provided by the Model**:
  - **Lightweight Low-Latency Speech**: Fast synthesis optimized for high-concurrency telephony systems.

---

# 4. Code Example (Official `pyplayht` Python SDK)

```python
import os
from pyplayht import Client, TTSOptions

# Initialize PlayHT Client using User ID and Secret API Key
client = Client(
    user_id=os.environ.get("PLAYHT_USER_ID"),
    api_key=os.environ.get("PLAYHT_API_KEY")
)

options = TTSOptions(voice="s3://voice-cloning-zero-shot/d9abb782-3dd4-4889-a4ee-8d857d90c0ff/samantha/manifest.json")

# Stream audio chunked bytes
print("Streaming PlayHT real-time audio...")
for chunk in client.tts("Welcome to PlayHT real-time voice streaming.", options=options):
    pass # Send raw audio chunk to speaker or network socket
```

---

# 5. Pricing Summary

| Plan Tier | Monthly Price | Word Quota Included | API Access |
| :--- | :--- | :--- | :--- |
| **Free** | $0 | 12,500 words / lifetime | Non-commercial |
| **Creator** | $31.20 / month | 3,000,000 words / year | Standard API |
| **Pro** | $99.00 / month | 6,000,000 words / year | Full API & High Concurrency |
| **Enterprise** | Custom | Custom Volume | Dedicated Cluster & Support |

---

# 6. Official References

- Official PlayHT API Documentation: [docs.play.ht](https://docs.play.ht)
- PlayHT Web Dashboard: [play.ht/studio](https://play.ht/studio)
- Official Website: [play.ht](https://play.ht)
