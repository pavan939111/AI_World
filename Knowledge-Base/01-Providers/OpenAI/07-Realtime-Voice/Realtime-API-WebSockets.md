---
title: OpenAI Realtime API â€” Protocols, VAD & Tool Execution Guide
provider: OpenAI
capability: 07-Realtime-Voice
file: Realtime-API-WebSockets.md
last_updated: 2026-07-28
tags: [openai, realtime-api, webrtc, websockets, vad, tool-calling]
author: Antigravity AI Knowledge Engine
---

# OpenAI Realtime API â€” Protocols, VAD & Live Tool Execution

## 1. WebSockets vs WebRTC Transport Comparison

| Architectural Feature | WebSockets Transport | WebRTC Transport |
| :--- | :--- | :--- |
| **Primary Environment** | Backend servers, Node.js/Python microservices | Client-side iOS, Android, and Web Browsers |
| **Authentication** | Secret API Key in HTTP Header | Ephemeral Client Token (`/v1/realtime/sessions`) |
| **Network Path** | Client â”€â”€â–º Server â”€â”€â–º OpenAI API | Direct Peer Connection (ICE / STUN / TURN) |
| **Jitter Buffer** | Managed manually by server code | Managed natively by WebRTC stack |

---

## 2. Server Voice Activity Detection (VAD) Mechanics
- **`server_vad`**: OpenAI automatically monitors input PCM audio frames. When speech is detected, an `input_audio_buffer.speech_started` event is emitted.
- **Barge-In Handling**: If the user speaks while the model is outputting audio, the server emits `speech_started`. The client application immediately cancels playback and sends a `response.cancel` message to truncate the active generation.

---

## 3. Realtime Function Calling (Live Tool Execution)
Realtime voice agents can execute function calls in mid-conversation (e.g. checking account balance or looking up flight status). The model pauses audio output, emits `response.function_call_arguments.done`, receives the JSON tool result, and immediately resumes speaking the answer to the user in a fluid voice response.
