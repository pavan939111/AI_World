---
title: Cartesia-Sonic-Realtime â€” Prompting
service: 11-Realtime-Voice
model: Cartesia-Sonic-Realtime
section: 03-Models
file: Prompting.md
last_updated: 2026-07-28
tags: [realtime-voice, cartesia-sonic-realtime, prompting]
author: Antigravity AI Knowledge Engine
---

# Cartesia-Sonic-Realtime â€” Prompting

## Model Specification: Cartesia-Sonic-Realtime
- **Model Name**: Cartesia-Sonic-Realtime
- **Primary Developer / Provider**: SOTA Realtime Voice Provider
- **Model Family**: Speech-to-Speech / Low-Latency Voice Agent Engine
- **Protocols Supported**: WebRTC, WebSockets (wss://), SIP / Telephony
- **Conversational Latency**: Sub-300ms to Sub-500ms End-to-End
- **API Availability**: WebRTC REST/WS APIs, Python & Node SDKs, Open-Source Frameworks (LiveKit / Moshi)

## Prompting Detailed Breakdown

### Key Specifications & Benchmarks
- **End-to-End Latency**: 250ms - 450ms.
- **Interruption (Barge-In)**: Instant server VAD audio cutoff (<100ms).
- **Function Calling**: Real-time JSON tool execution mid-conversation.

### Technical Performance Analysis
1. **Strengths**: Native full-duplex audio stream, natural laughter & emotional inflection, seamless user interruption, direct Twilio SIP trunking.
2. **Weaknesses**: Minute-based audio token cost for high-volume enterprise call centers.
3. **Best Use Cases**: Inbound/outbound AI phone agents, real-time voice assistants, language tutors, virtual receptionists.

## Code Example (Cartesia-Sonic-Realtime API Request)
`javascript
// Establish Realtime Session
const ws = new WebSocket("wss://api.provider.ai/v1/realtime");
ws.onopen = () => {
  ws.send(JSON.stringify({
    type: "session.update",
    session: { model: "cartesia-sonic-realtime", voice: "natural_voice_1" }
  }));
};
`

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
