---
title: OpenAI Whisper v3 â€” Speech-to-Text Model Specification
provider: OpenAI
capability: 06-Audio-and-Speech
model: Whisper-v3
file: Whisper-v3.md
last_updated: 2026-07-28
tags: [openai, whisper, whisper-v3, stt, speech-recognition, transcription, audio-translation]
author: Antigravity AI Knowledge Engine
---

# OpenAI Whisper v3 â€” Speech-to-Text Model Specification & Integration

## 1. Summary & Architecture
**Whisper Large v3** is OpenAI's state-of-the-art automatic speech recognition (ASR) foundation model. Trained on 680,000 hours of multilingual and multitask supervised web audio data, Whisper performs robust multilingual speech transcription, language identification, and translation into English.

Whisper is available both as a cloud API (`/v1/audio/transcriptions`) and as open-source model weights (MIT License) for local self-hosting.

---

## 2. Technical Specifications & Pricing

| Parameter | Specification | Notes / Details |
| :--- | :--- | :--- |
| **Model ID** | `whisper-1` | Cloud API endpoint |
| **Supported File Formats**| `.mp3`, `.mp4`, `.mpeg`, `.mpga`, `.m4a`, `.wav`, `.webm` | Max file upload limit: **25 MB** |
| **Multilingual Support** | **98+ Languages** | Auto language detection |
| **API Pricing** | **$0.006 per minute** ($0.36 per hour) | Rounded to nearest second |
| **Open-Source Weights** | Available on GitHub / Hugging Face | MIT License (Local GPU self-hosting) |
| **Response Formats** | `json`, `text`, `srt`, `verbose_json`, `vtt` | Subtitle file output support |

---

## 3. Python SDK Example (Transcription with Timestamps)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

with open("podcast_interview.mp3", "rb") as audio_file:
    transcript = client.audio.transcriptions.create(
        model="whisper-1",
        file=audio_file,
        response_format="verbose_json",
        timestamp_granularities=["word", "segment"]
    )

print("Transcription Text:")
print(transcript.text)

# Inspect word-level timestamps
for word_info in transcript.words[:5]:
    print(f"Word: {word_info['word']} | Start: {word_info['start']}s | End: {word_info['end']}s")
```
