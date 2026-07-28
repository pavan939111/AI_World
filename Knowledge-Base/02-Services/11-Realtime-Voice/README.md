---
title: AI Service â€” 11-Realtime-Voice Complete Master Reference
service: 11-Realtime-Voice
view: By Service
last_updated: 2026-07-28
tags: [realtime-voice, speech-to-speech, gpt-4o-realtime, gemini-live, cartesia-sonic, elevenlabs-conversational, vapi, retell, livekit, moshi]
author: Antigravity AI Knowledge Engine
---

# AI Service â€” 11-Realtime-Voice: Master Technical Specification & Encyclopedia

Welcome to the **11-Realtime-Voice Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, WebRTC engineering handbook, and production architectural guide for Realtime Full-Duplex Speech-to-Speech AI Engines.

---

# ðŸ“ Service Folder Structure & Taxonomy

`	ext
11-Realtime-Voice/
â”œâ”€â”€ 00-Overview/                            # What is Realtime Voice, History, Evolution, Full-Duplex Speech Pipeline, Terminology, FAQ
â”œâ”€â”€ 01-Fundamentals/                        # Native Audio Tokens, Multimodal Speech LLMs, WebRTC, WebSockets, Barge-In Interruption, Turn-Taking
â”œâ”€â”€ 02-Providers/                           # OpenAI, Google AI (Gemini), Cartesia, ElevenLabs, Vapi, Retell AI, LiveKit, Daily.co
â”œâ”€â”€ 03-Models/                              # Deep-Dive Specs for GPT-4o Realtime API, Gemini Multimodal Live, Cartesia Sonic, Vapi, Retell AI, LiveKit, Moshi
â”‚   â”œâ”€â”€ GPT-4o-Realtime-API/                # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
â”‚   â”œâ”€â”€ Gemini-2-5-Flash-Multimodal-Live/   # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Cartesia-Sonic-Realtime/            # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ ElevenLabs-Conversational-AI/       # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Vapi-Voice-Engine/                  # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Retell-AI-Engine/                   # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ LiveKit-Agents/                     # (10 Deep-Dive Spec Files)
â”‚   â””â”€â”€ Moshi-Voice-LLM/                    # (10 Deep-Dive Spec Files)
â”œâ”€â”€ 04-Tasks/                               # Full-Duplex Voice Assistants, Telephony Agents, Real-Time Translation, IVR Systems, Multimodal Live Tutoring
â”œâ”€â”€ 05-API/                                 # WebRTC API, WebSockets API (wss://), Auth, Audio Formats (PCM16/G.711), Event Handling (session.update), Pricing
â”œâ”€â”€ 06-Realtime-Voice-Engineering/         # WebRTC Signaling, Opus & G.711 Codecs, VAD & Interruption Handling, SIP / Twilio Integration, Function Calling
â”œâ”€â”€ 07-Quality/                             # End-to-End Latency ms, Interruption Detection Precision, Voice Naturalness MOS, Telephony Audio Quality
â”œâ”€â”€ 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest (Lowest Latency), Best Telephony Engine, Decision Matrix
â”œâ”€â”€ 09-Use-Cases/                           # Customer Service Telephony, Automated Appointment Scheduling, Healthcare Virtual Receptionist
â”œâ”€â”€ 10-Open-Source/                         # LiveKit Agents, Moshi Kyutai, Pipecat, Ultravox, Local WebRTC Pipeline
â”œâ”€â”€ 11-Production/                          # WebRTC Infrastructure & TURN/STUN Servers, Server Audio Buffers, Twilio Telephony Bridges, Security
â”œâ”€â”€ 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
â”œâ”€â”€ 13-Benchmarks/                          # End-to-End Latency Leaderboard, Interruption Handling Latency, Audio Quality Score, Cost per Minute
â”œâ”€â”€ 14-Learning-Resources/                  # Official Docs, Research Papers (Moshi Paper, GPT-4o Realtime, LiveKit), Blogs, Videos, Courses
â””â”€â”€ 15-Glossary/                            # Terms, Acronyms, References
`

---

# ðŸŽ¯ Model & Platform Comparison Snapshot

| Model / Engine | Architecture | End-to-End Latency | Protocol | Native Telephony Integration | Pricing Rate | Open-Source |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **GPT-4o Realtime API** | Native Speech-to-Speech LLM | **~300ms** | WebRTC / WebSockets | Twilio / SIP via WebSockets | **.06 / min (audio in) + .24 / min (audio out)** | Proprietary API |
| **Gemini 2.5 Flash Live** | Native Speech-to-Speech LLM | **~280ms** | WebSockets / gRPC | Google Cloud Telephony | **.03 / min (audio in) + .12 / min (audio out)** | Proprietary API |
| **Vapi Voice Engine** | Orchestrated (STT+LLM+TTS) | **~500ms** | WebRTC / SIP | Native Twilio / Telnyx SIP | **.05 / min** (+ underlying model costs) | Managed Cloud Platform |
| **Retell AI Engine** | Orchestrated (STT+LLM+TTS) | **~450ms** | WebRTC / SIP | Native Twilio SIP Trunking | **.08 - .12 / min** (All-inclusive) | Managed Cloud Platform |
| **LiveKit Agents** | Open Framework (WebRTC) | **~250ms - 400ms** | WebRTC Native | LiveKit SIP / Twilio Gateway | Cloud / Self-Hosted () | **Open-Source (Apache 2.0)** |
| **Moshi (Kyutai)** | Open Native Speech-to-Speech | **~200ms** | WebRTC | Custom SIP Bridge | Self-Hosted GPU () | **Open-Weights (MIT)** |

---

# ðŸš€ Quick Start Example: Connecting to OpenAI GPT-4o Realtime API

`javascript
// Establish WebSockets audio session with GPT-4o Realtime API
const WebSocket = require('ws');

const ws = new WebSocket("wss://api.openai.com/v1/realtime?model=gpt-4o-realtime-preview-2024-10-01", {
  headers: {
    "Authorization": Bearer ,
    "OpenAI-Beta": "realtime=v1"
  }
});

ws.on('open', () => {
  console.log("Realtime Audio Connection Established!");
  ws.send(JSON.stringify({
    type: "session.update",
    session: {
      modalities: ["audio", "text"],
      voice: "alloy",
      instructions: "You are a helpful real-time customer support voice assistant."
    }
  }));
});
`

---

# ðŸ“š Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for full-duplex speech pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for WebRTC peer connections, native audio tokens, and barge-in interruption mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on GPT-4o Realtime API, Gemini Multimodal Live, Cartesia Sonic Realtime, Vapi, Retell AI, LiveKit, and Moshi.
- Explore **[06-Realtime-Voice-Engineering](./06-Realtime-Voice-Engineering/README.md)** for Twilio SIP telephony integration and function calling over audio streams.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Telephony Engine, Fastest Latency, Best Open Source).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for LiveKit Agents, Moshi Kyutai, and local WebRTC pipeline setups.
