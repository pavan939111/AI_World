---
title: OpenAI GPT-4o Realtime API â€” Technical Specification & Multimodal WebRTC Guide
provider: OpenAI
capability: 07-Realtime-Voice
model: gpt-4o-realtime-preview
file: gpt-4o-realtime-preview.md
last_updated: 2026-07-28
tags: [openai, realtime-api, gpt-4o-realtime, speech-to-speech, webrtc, websockets, vad]
author: Antigravity AI Knowledge Engine
---

# OpenAI GPT-4o Realtime API â€” Technical Specification & Guide

## 1. Summary & Architecture
**`gpt-4o-realtime-preview`** is OpenAI's native multimodal speech-to-speech engine. Unlike traditional conversational voice pipelines that chain separate Speech-to-Text (Whisper), LLM (GPT-4o), and Text-to-Speech (TTS) models together, the Realtime API processes and generates raw PCM16 audio streams natively within a single neural network.

This direct audio tokenization achieves conversational latency **under 300 milliseconds** and enables native mid-sentence user interruption ("barge-in").

---

## 2. Technical Specifications & Pricing

| Parameter | Specification | Notes / Details |
| :--- | :--- | :--- |
| **Model ID** | `gpt-4o-realtime-preview`, `gpt-4o-realtime-preview-2024-12-17` | Production endpoint |
| **Connection Protocols**| **WebSockets** (`wss://api.openai.com/v1/realtime`) & **WebRTC** | Peer-to-peer WebRTC for mobile/web browsers |
| **Audio Format** | PCM16 at 24kHz (mono), G.711 u-law, G.711 a-law | Native raw PCM stream |
| **Audio Input Cost** | **$0.060 per minute** ($100 per 1M audio tokens) | ~1,000 audio tokens per minute |
| **Audio Output Cost**| **$0.240 per minute** ($200 per 1M audio tokens) | ~2,000 audio tokens per minute |
| **Text Input/Output Cost**| $5.00 / $20.00 per 1M text tokens | Text tokens processed concurrently |
| **Voice Activity (VAD)**| **Server VAD** (Automatic truncation) or Manual | Detects speech end & triggers completion |
| **Interruption (Barge-In)**| Supported natively (`response.cancel`) | Instantly halts output when user speaks |

---

## 3. WebSockets Connection Protocol (`wss://api.openai.com/v1/realtime`)

Developers initiate a WebSocket session by passing `model=gpt-4o-realtime-preview` in the connection URL and sending JSON event frames:

```json
// Client -> Server: Configure Session
{
  "type": "session.update",
  "session": {
    "modalities": ["text", "audio"],
    "instructions": "You are a helpful customer support agent for Nova Bank.",
    "voice": "alloy",
    "input_audio_format": "pcm16",
    "output_audio_format": "pcm16",
    "turn_detection": {
      "type": "server_vad",
      "threshold": 0.5,
      "prefix_padding_ms": 300,
      "silence_duration_ms": 500
    }
  }
}
```

```json
// Client -> Server: Append Raw Audio Chunk (Base64 PCM16)
{
  "type": "input_audio_buffer.append",
  "audio": "UklGRiQAAABXQVZFZm10..."
}
```
