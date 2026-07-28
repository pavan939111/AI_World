---
title: Deepgram-Nova-2 â€” API
service: 09-Speech-to-Text
model: Deepgram-Nova-2
section: 03-Models
file: API.md
last_updated: 2026-07-28
tags: [speech-to-text, deepgram-nova-2, api]
author: Antigravity AI Knowledge Engine
---

# Deepgram-Nova-2 â€” API

## Model Specification: Deepgram-Nova-2
- **Model Name**: Deepgram-Nova-2
- **Primary Developer / Provider**: SOTA Speech Recognition Provider
- **Model Family**: Automatic Speech Recognition (ASR) Series
- **Architecture**: Encoder-Decoder Transformer / Conformer / CTC
- **Supported Audio Inputs**: WAV, MP3, PCM, FLAC, OGG, WebM
- **API Availability**: REST API, WebSockets Realtime (wss://), Open-Source (Whisper / Whisper.cpp)

## API Detailed Breakdown

### Key Specifications & Benchmarks
- **Word Error Rate (WER)**: Industry-leading low WER (<5.0% on clean speech).
- **Streaming Latency**: Sub-300ms real-time WebSockets streaming latency (Deepgram / Nova-2).
- **Multi-Speaker Diarization**: High precision speaker identification tags.

### Technical Performance Analysis
1. **Strengths**: Robust noise tolerance, sub-word timestamp accuracy, high multilingual translation capability.
2. **Weaknesses**: Hallucinations on long silent blocks (standard Whisper); resolved via VAD preprocessing.
3. **Best Use Cases**: Real-time voice agents, call center analytics, meeting transcription, video subtitle generation.

## Code Example (Deepgram-Nova-2 API Request)
`python
import os
import requests

api_url = "https://api.provider.ai/v1/listen"
headers = {
    "Authorization": f"Bearer {os.environ.get('API_KEY')}",
    "Content-Type": "audio/wav"
}

with open("audio_sample.wav", "rb") as audio:
    response = requests.post(api_url, headers=headers, data=audio.read())

print(response.json())
`

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
