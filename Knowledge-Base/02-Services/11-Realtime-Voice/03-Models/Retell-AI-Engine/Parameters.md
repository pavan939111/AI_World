---
title: Retell-AI-Engine â€” Parameters
service: 11-Realtime-Voice
model: Retell-AI-Engine
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [realtime-voice, retell-ai-engine, parameters]
author: Antigravity AI Knowledge Engine
---

# Retell-AI-Engine â€” Parameters

## Model Specification: Retell-AI-Engine
- **Model Name**: Retell-AI-Engine
- **Primary Developer / Provider**: SOTA Realtime Voice Provider
- **Model Family**: Speech-to-Speech / Low-Latency Voice Agent Engine
- **Protocols Supported**: WebRTC, WebSockets (wss://), SIP / Telephony
- **Conversational Latency**: Sub-300ms to Sub-500ms End-to-End
- **API Availability**: WebRTC REST/WS APIs, Python & Node SDKs, Open-Source Frameworks (LiveKit / Moshi)

## Parameters Detailed Breakdown

### Key Specifications & Benchmarks
- **End-to-End Latency**: 250ms - 450ms.
- **Interruption (Barge-In)**: Instant server VAD audio cutoff (<100ms).
- **Function Calling**: Real-time JSON tool execution mid-conversation.

### Technical Performance Analysis
1. **Strengths**: Native full-duplex audio stream, natural laughter & emotional inflection, seamless user interruption, direct Twilio SIP trunking.
2. **Weaknesses**: Minute-based audio token cost for high-volume enterprise call centers.
3. **Best Use Cases**: Inbound/outbound AI phone agents, real-time voice assistants, language tutors, virtual receptionists.

## Code Example (Retell-AI-Engine API Request)
`javascript
// Establish Realtime Session
const ws = new WebSocket("wss://api.provider.ai/v1/realtime");
ws.onopen = () => {
  ws.send(JSON.stringify({
    type: "session.update",
    session: { model: "retell-ai-engine", voice: "natural_voice_1" }
  }));
};
`

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
