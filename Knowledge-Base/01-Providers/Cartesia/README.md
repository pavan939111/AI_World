---
title: Cartesia — Complete Technical Specification & Provider Reference
provider: Cartesia
view: By Provider
last_updated: 2026-07-28
tags: [cartesia, sonic, ssm, mamba, tts, voice-cloning, websockets, realtime-audio]
author: Antigravity AI Documentation Engine
---

# Cartesia — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Cartesia AI Inc.
- **Parent Company**: Cartesia AI Inc.
- **Founders**: Karan Goel (CEO, Stanford CS PhD candidate), Albert Gu (Chief Scientist, Assistant Professor at CMU and co-creator of Mamba & S4 State Space Models)
- **Headquarters**: San Francisco, California, USA
- **Year Founded**: 2023
- **Mission**: To build real-time spatial and voice intelligence foundation models powered by State Space Model (SSM) architectures.
- **Valuation & Funding**: $29 Million funding round led by Lightspeed Venture Partners, Index Ventures, and Nat Friedman.
- **AI Ecosystem**: Ultra-low latency voice synthesis platform powered by State Space Models (SSM) providing Sonic (sub-100ms TTS engine), Sonic Turbo, Sonic Multilingual (7 languages), Instant Voice Cloning from 5-second samples, bidirectional WebSockets PCM audio streaming, and official REST/WebSockets API (`api.cartesia.ai/v1`).
- **Timeline & Major Milestones**:
  - **2023**: Founded in San Francisco by Karan Goel and Albert Gu following their breakthrough research on Mamba and S4 State Space Models at Stanford/CMU.
  - **May 2024**: Announced $29M funding round led by Lightspeed and Index.
  - **June 2024**: Launched Sonic — the world's fastest sub-100ms neural text-to-speech engine.
  - **September 2024**: Released WebSockets streaming SDKs (`@cartesia/cartesia-js` and `cartesia` Python package).
  - **November 2024**: Released Sonic Multilingual and Instant Voice Cloning API.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Text-to-Speech (Sonic)** | Sub-100ms ultra-low latency neural speech synthesis engine | Yes | Sonic, Sonic Turbo | Active |
| **Voice Cloning** | Instant custom voice profile creation from 5-second audio samples | Yes | `/voices/clone` | Active |
| **WebSockets Streaming** | Bidirectional low-latency PCM audio streaming for voice agents | Yes | `wss://api.cartesia.ai/tts/websocket` | Active |
| **Multilingual Speech** | Sonic synthesis across English, French, German, Spanish, etc. | Yes | Sonic Multilingual | Active |
| **State Space Model (SSM)** | Linear-time `O(N)` Mamba neural network architecture | Yes | Sonic Engine Architecture | Active |

---

# 3. Text-to-Speech Models

### Model: Sonic
- **Name**: Sonic (`sonic-english`, `sonic-multilingual`)
- **Release Date**: June 2024
- **Latency**: **Sub-100ms** Time-To-First-Byte (TTFB)
- **Architecture**: State Space Model (SSM) audio decoder
- **Services Provided by the Model**:
  - **Sub-100ms Interactive Voice Synthesis**: Engine built specifically for ultra-low latency conversational AI voice bots.
  - **Natural Intonation & Emotion**: Expressive human acoustics without robotic artifacts.
- **Pricing**: $0.045 / 1,000 characters

### Model: Sonic Turbo
- **Name**: Sonic Turbo (`sonic-turbo`)
- **Services Provided by the Model**:
  - **High-Throughput Streaming**: Streamlined audio frame generation for high-concurrency voice channels.
- **Pricing**: $0.045 / 1,000 characters

---

# 4. Code Example (Official `cartesia` Python SDK WebSockets)

```python
import os
import asyncio
from cartesia import AsyncCartesia

async def main():
    # Initialize Cartesia Client
    client = AsyncCartesia(api_key=os.environ.get("CARTESIA_API_KEY"))
    ws = await client.tts.websocket()

    # Stream real-time PCM audio
    output = await ws.send(
        model_id="sonic-english",
        transcript="Hello! I am Cartesia Sonic, rendering voice speech in under 100 milliseconds.",
        voice={"mode": "id", "id": "a0e168ee-3a90-4c08-a35b-e323fa4d0602"},
        output_format={"container": "raw", "encoding": "pcm_s16le", "sample_rate": 24000}
    )

    async for buffer in output:
        # Send raw PCM audio buffer to audio output or web client
        pass

    await ws.close()

asyncio.run(main())
```

---

# 5. Pricing Summary

| Endpoint / Model | Pricing Rate |
| :--- | :--- |
| **Sonic TTS API** | **$0.045 / 1,000 characters** |
| **Sonic Turbo API** | **$0.045 / 1,000 characters** |
| **Instant Voice Cloning** | Included in character billing |

---

# 6. Official References

- Official Cartesia API Documentation: [docs.cartesia.ai](https://docs.cartesia.ai)
- Official Platform Console: [play.cartesia.ai](https://play.cartesia.ai)
- Official Website: [cartesia.ai](https://cartesia.ai)
