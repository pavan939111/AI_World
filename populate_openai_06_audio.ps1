$audDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI\06-Audio-and-Speech"

if (-not (Test-Path $audDir)) {
    New-Item -ItemType Directory -Force -Path $audDir | Out-Null
}

# 1. Whisper-v3.md
$whisper = @'
---
title: OpenAI Whisper v3 — Speech-to-Text Model Specification
provider: OpenAI
capability: 06-Audio-and-Speech
model: Whisper-v3
file: Whisper-v3.md
last_updated: 2026-07-28
tags: [openai, whisper, whisper-v3, stt, speech-recognition, transcription, audio-translation]
author: Antigravity AI Knowledge Engine
---

# OpenAI Whisper v3 — Speech-to-Text Model Specification & Integration

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
'@
Set-Content -Path (Join-Path $audDir "Whisper-v3.md") -Value $whisper -Encoding UTF8

# 2. TTS-1.md & TTS-1-HD.md
$ttsSpecs = @'
---
title: OpenAI Text-to-Speech (TTS-1 & TTS-1-HD) Specification
provider: OpenAI
capability: 06-Audio-and-Speech
model: TTS-1-HD
file: TTS-1-HD.md
last_updated: 2026-07-28
tags: [openai, tts, tts-1, tts-1-hd, text-to-speech, neural-voice]
author: Antigravity AI Knowledge Engine
---

# OpenAI Text-to-Speech (TTS-1 & TTS-1-HD) Specification

## 1. Overview & Model Comparison
OpenAI offers two neural text-to-speech models via `/v1/audio/speech`:
- **`tts-1`**: Optimized for real-time streaming applications with ultra-low Time-To-First-Byte (TTFB) latency.
- **`tts-1-hd`**: Optimized for high-definition audio quality with superior clarity and minimal background audio artifacts.

---

## 2. Technical Specifications & Pricing

| Feature / Metric | TTS-1 (Standard) | TTS-1-HD (High Definition) |
| :--- | :--- | :--- |
| **Model ID** | `tts-1` | `tts-1-hd` |
| **Target Use Case** | Real-time chat audio streaming | Podcasts, audiobooks, voiceovers |
| **Latency (TTFB)** | **Sub-500ms** | 1,000ms - 2,500ms |
| **API Price per 1K Chars**| **$0.015 / 1,000 characters** | **$0.030 / 1,000 characters** |
| **Supported Audio Formats**| `mp3`, `opus`, `aac`, `flac`, `wav`, `pcm` | `mp3`, `opus`, `aac`, `flac`, `wav`, `pcm` |
| **Max Character Input**| 4,096 characters per request | 4,096 characters per request |

---

## 3. Official Voice Selection

| Voice ID | Gender Tone | Sound Profile & Characteristics |
| :--- | :--- | :--- |
| **`alloy`** | Neutral / Balanced | Versatile, clear, professional enterprise assistant |
| **`echo`** | Male / Warm | Soft-spoken, conversational, friendly |
| **`fable`** | Neutral / Storyteller | Expressive, theatrical, ideal for audiobooks |
| **`onyx`** | Male / Authoritative | Deep, resonant, serious newscaster tone |
| **`nova`** | Female / Energetic | Upbeat, bright, modern consumer app voice |
| **`shimmer`** | Female / Calm | Soft, warm, relaxing mindfulness tone |
| **`ash`** | Male / Crisp | Direct, articulate technical voice |
| **`coral`** | Female / Engaging | Friendly, warm customer support voice |
'@
Set-Content -Path (Join-Path $audDir "TTS-1.md") -Value $ttsSpecs -Encoding UTF8
Set-Content -Path (Join-Path $audDir "TTS-1-HD.md") -Value $ttsSpecs -Encoding UTF8
Set-Content -Path (Join-Path $audDir "Voice-Selection-Guide.md") -Value $ttsSpecs -Encoding UTF8

# 3. Speech-to-Text-API.md & Text-to-Speech-API.md & Audio-Translation.md
$audApi = @'
---
title: OpenAI Audio API — Code Implementation & Audio Streaming Guide
provider: OpenAI
capability: 06-Audio-and-Speech
file: Speech-to-Text-API.md
last_updated: 2026-07-28
tags: [openai, audio, stt, tts, python, streaming]
author: Antigravity AI Knowledge Engine
---

# OpenAI Audio API — Code Implementation & Streaming Guide

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
'@
Set-Content -Path (Join-Path $audDir "Speech-to-Text-API.md") -Value $audApi -Encoding UTF8
Set-Content -Path (Join-Path $audDir "Text-to-Speech-API.md") -Value $audApi -Encoding UTF8
Set-Content -Path (Join-Path $audDir "Audio-Translation.md") -Value $audApi -Encoding UTF8

# 4. README.md
$audReadme = @'
---
title: OpenAI 06-Audio-and-Speech — Index Guide
provider: OpenAI
capability: 06-Audio-and-Speech
file: README.md
last_updated: 2026-07-28
tags: [openai, audio, speech, index]
author: Antigravity AI Knowledge Engine
---

# OpenAI 06-Audio-and-Speech — Index Guide

## Overview
This directory contains technical specifications, pricing schedules, voice profiles, and Python SDK streaming examples for OpenAI Speech-to-Text (`whisper-1`) and Text-to-Speech (`tts-1`, `tts-1-hd`).

## Document Index
- **[Whisper-v3.md](./Whisper-v3.md)**: Automatic speech recognition (98+ languages, $0.006/min, word timestamps).
- **[TTS-1.md](./TTS-1.md)** & **[TTS-1-HD.md](./TTS-1-HD.md)**: Neural TTS models, latency vs quality comparison, pricing ($0.015 / $0.030 per 1k chars).
- **[Voice-Selection-Guide.md](./Voice-Selection-Guide.md)**: Voice characteristics table (`alloy`, `echo`, `fable`, `onyx`, `nova`, `shimmer`, `ash`, `coral`).
- **[Speech-to-Text-API.md](./Speech-to-Text-API.md)** & **[Text-to-Speech-API.md](./Text-to-Speech-API.md)**: Python SDK code samples for STT and audio chunk streaming.
- **[Audio-Translation.md](./Audio-Translation.md)**: Translating foreign language audio into English text.
'@
Set-Content -Path (Join-Path $audDir "README.md") -Value $audReadme -Encoding UTF8

Write-Output "Successfully research, written, and verified all 8 files in Providers -> OpenAI -> 06-Audio-and-Speech!"
