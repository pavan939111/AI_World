---
title: OpenAI Audio API â€” Code Implementation & Audio Streaming Guide
provider: OpenAI
capability: 06-Audio-and-Speech
file: Speech-to-Text-API.md
last_updated: 2026-07-28
tags: [openai, audio, stt, tts, python, streaming]
author: Antigravity AI Knowledge Engine
---

# OpenAI Audio API â€” Code Implementation & Streaming Guide

## 1. Python SDK Implementation (Text-to-Speech Chunk Streaming)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Stream audio chunk directly to a local MP3 file
response = client.audio.speech.create(
    model="tts-1",
    voice="nova",
    input="Welcome to OpenAI voice synthesis. Audio streaming reduces playback latency significantly.",
    response_format="mp3"
)

response.stream_to_file("output_speech.mp3")
print("Audio saved successfully.")
```

## 2. Audio Translation API (`/v1/audio/translations`)
Translates foreign language audio (e.g. Spanish, German, Japanese) directly into English text:
```python
with open("foreign_audio.mp3", "rb") as audio:
    translation = client.audio.translations.create(
        model="whisper-1",
        file=audio
    )
print("English Translation:", translation.text)
```
