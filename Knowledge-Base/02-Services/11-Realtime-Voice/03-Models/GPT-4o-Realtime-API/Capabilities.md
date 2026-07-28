---
title: GPT-4o-Realtime-API â€” Capabilities
service: 11-Realtime-Voice
model: GPT-4o-Realtime-API
section: 03-Models
file: Capabilities.md
last_updated: 2026-07-28
tags: [realtime-voice, gpt-4o-realtime-api, capabilities]
author: Antigravity AI Knowledge Engine
---

# GPT-4o-Realtime-API â€” Capabilities

## Model Specification: GPT-4o-Realtime-API
- **Model Name**: GPT-4o-Realtime-API
- **Primary Developer / Provider**: SOTA Realtime Voice Provider
- **Model Family**: Speech-to-Speech / Low-Latency Voice Agent Engine
- **Protocols Supported**: WebRTC, WebSockets (wss://), SIP / Telephony
- **Conversational Latency**: Sub-300ms to Sub-500ms End-to-End
- **API Availability**: WebRTC REST/WS APIs, Python & Node SDKs, Open-Source Frameworks (LiveKit / Moshi)

## Capabilities Detailed Breakdown

### Key Specifications & Benchmarks
- **End-to-End Latency**: 250ms - 450ms.
- **Interruption (Barge-In)**: Instant server VAD audio cutoff (<100ms).
- **Function Calling**: Real-time JSON tool execution mid-conversation.

### Technical Performance Analysis
1. **Strengths**: Native full-duplex audio stream, natural laughter & emotional inflection, seamless user interruption, direct Twilio SIP trunking.
2. **Weaknesses**: Minute-based audio token cost for high-volume enterprise call centers.
3. **Best Use Cases**: Inbound/outbound AI phone agents, real-time voice assistants, language tutors, virtual receptionists.

## Code Example (GPT-4o-Realtime-API API Request)
`javascript
// Establish Realtime Session
const ws = new WebSocket("wss://api.provider.ai/v1/realtime");
ws.onopen = () => {
  ws.send(JSON.stringify({
    type: "session.update",
    session: { model: "gpt-4o-realtime-api", voice: "natural_voice_1" }
  }));
};
`

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
