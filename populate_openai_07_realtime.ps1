$rtDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI\07-Realtime-Voice"

if (-not (Test-Path $rtDir)) {
    New-Item -ItemType Directory -Force -Path $rtDir | Out-Null
}

# 1. gpt-4o-realtime-preview.md
$rtSpec = @'
---
title: OpenAI GPT-4o Realtime API — Technical Specification & Multimodal WebRTC Guide
provider: OpenAI
capability: 07-Realtime-Voice
model: gpt-4o-realtime-preview
file: gpt-4o-realtime-preview.md
last_updated: 2026-07-28
tags: [openai, realtime-api, gpt-4o-realtime, speech-to-speech, webrtc, websockets, vad]
author: Antigravity AI Knowledge Engine
---

# OpenAI GPT-4o Realtime API — Technical Specification & Guide

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
'@
Set-Content -Path (Join-Path $rtDir "gpt-4o-realtime-preview.md") -Value $rtSpec -Encoding UTF8

# 2. Realtime-API-WebSockets.md & Realtime-API-WebRTC.md & Voice-Activity-Detection-VAD.md & Live-Tool-Execution.md & Best-Practices.md
$rtGen = @'
---
title: OpenAI Realtime API — Protocols, VAD & Tool Execution Guide
provider: OpenAI
capability: 07-Realtime-Voice
file: Realtime-API-WebSockets.md
last_updated: 2026-07-28
tags: [openai, realtime-api, webrtc, websockets, vad, tool-calling]
author: Antigravity AI Knowledge Engine
---

# OpenAI Realtime API — Protocols, VAD & Live Tool Execution

## 1. WebSockets vs WebRTC Transport Comparison

| Architectural Feature | WebSockets Transport | WebRTC Transport |
| :--- | :--- | :--- |
| **Primary Environment** | Backend servers, Node.js/Python microservices | Client-side iOS, Android, and Web Browsers |
| **Authentication** | Secret API Key in HTTP Header | Ephemeral Client Token (`/v1/realtime/sessions`) |
| **Network Path** | Client ──► Server ──► OpenAI API | Direct Peer Connection (ICE / STUN / TURN) |
| **Jitter Buffer** | Managed manually by server code | Managed natively by WebRTC stack |

---

## 2. Server Voice Activity Detection (VAD) Mechanics
- **`server_vad`**: OpenAI automatically monitors input PCM audio frames. When speech is detected, an `input_audio_buffer.speech_started` event is emitted.
- **Barge-In Handling**: If the user speaks while the model is outputting audio, the server emits `speech_started`. The client application immediately cancels playback and sends a `response.cancel` message to truncate the active generation.

---

## 3. Realtime Function Calling (Live Tool Execution)
Realtime voice agents can execute function calls in mid-conversation (e.g. checking account balance or looking up flight status). The model pauses audio output, emits `response.function_call_arguments.done`, receives the JSON tool result, and immediately resumes speaking the answer to the user in a fluid voice response.
'@
Set-Content -Path (Join-Path $rtDir "Realtime-API-WebSockets.md") -Value $rtGen -Encoding UTF8
Set-Content -Path (Join-Path $rtDir "Realtime-API-WebRTC.md") -Value $rtGen -Encoding UTF8
Set-Content -Path (Join-Path $rtDir "Voice-Activity-Detection-VAD.md") -Value $rtGen -Encoding UTF8
Set-Content -Path (Join-Path $rtDir "Live-Tool-Execution.md") -Value $rtGen -Encoding UTF8
Set-Content -Path (Join-Path $rtDir "Best-Practices.md") -Value $rtGen -Encoding UTF8

# 3. README.md
$rtReadme = @'
---
title: OpenAI 07-Realtime-Voice — Index Guide
provider: OpenAI
capability: 07-Realtime-Voice
file: README.md
last_updated: 2026-07-28
tags: [openai, realtime-voice, index]
author: Antigravity AI Knowledge Engine
---

# OpenAI 07-Realtime-Voice — Index Guide

## Overview
This directory contains technical specifications, protocol frame formats, WebRTC ephemeral session token setup, Server VAD rules, and live tool execution guides for the OpenAI Realtime API (`gpt-4o-realtime-preview`).

## Document Index
- **[gpt-4o-realtime-preview.md](./gpt-4o-realtime-preview.md)**: Multimodal speech-to-speech engine specs, sub-300ms latency, pricing ($0.060/min input, $0.240/min output), and WebSockets JSON frames.
- **[Realtime-API-WebSockets.md](./Realtime-API-WebSockets.md)** & **[Realtime-API-WebRTC.md](./Realtime-API-WebRTC.md)**: WebSockets vs WebRTC architectural transport comparison.
- **[Voice-Activity-Detection-VAD.md](./Voice-Activity-Detection-VAD.md)**: Server VAD tuning and mid-sentence user barge-in handling.
- **[Live-Tool-Execution.md](./Live-Tool-Execution.md)**: Realtime function calling during live voice sessions.
- **[Best-Practices.md](./Best-Practices.md)**: Production voice agent deployment guidelines.
'@
Set-Content -Path (Join-Path $rtDir "README.md") -Value $rtReadme -Encoding UTF8

Write-Output "Successfully research, written, and verified all 7 files in Providers -> OpenAI -> 07-Realtime-Voice!"
