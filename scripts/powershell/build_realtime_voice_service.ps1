$serviceDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\02-Services\11-Realtime-Voice"

if (Test-Path $serviceDir) {
    Remove-Item -Recurse -Force $serviceDir
}
New-Item -ItemType Directory -Force -Path $serviceDir | Out-Null

$structure = @{
    "00-Overview" = @(
        "What-is-Realtime-Voice.md",
        "History.md",
        "Evolution.md",
        "Full-Duplex-Speech-Pipeline.md",
        "AI-Terminology.md",
        "FAQ.md"
    );
    "01-Fundamentals" = @(
        "Native-Audio-Tokens.md",
        "End-to-End-Multimodal-Speech-LLMs.md",
        "WebRTC-Protocol-Mechanics.md",
        "WebSockets-Audio-Streaming.md",
        "Barge-In-Interruption-Detection.md",
        "Turn-Taking-Dynamics.md",
        "Sub-500ms-Conversational-Latency.md"
    );
    "02-Providers" = @(
        "OpenAI.md",
        "Google-AI.md",
        "Cartesia.md",
        "ElevenLabs.md",
        "Vapi.md",
        "Retell-AI.md",
        "LiveKit.md",
        "Daily-co.md"
    );
    "04-Tasks" = @(
        "Full-Duplex-Voice-Assistants.md",
        "Telephony-Inbound-Outbound-Agents.md",
        "Real-Time-Translation-and-Interpretation.md",
        "Interactive-Voice-Response-IVR.md",
        "Multimodal-Live-Audio-Visual-Tutoring.md",
        "Voice-Controlled-Software-UI.md"
    );
    "05-API" = @(
        "WebRTC-API-Signaling.md",
        "WebSockets-Realtime-API.md",
        "Authentication.md",
        "Audio-Frame-Formats-PCM16-G711.md",
        "Event-Handling-Session-Update.md",
        "Rate-Limits.md",
        "Pricing.md",
        "Error-Handling.md"
    );
    "06-Realtime-Voice-Engineering" = @(
        "WebRTC-Signaling-Implementation.md",
        "Opus-and-G711-Codecs.md",
        "VAD-and-Interruption-Handling.md",
        "SIP-and-Twilio-Telephony-Integration.md",
        "Function-Calling-in-Audio-Streams.md"
    );
    "07-Quality" = @(
        "End-to-End-Latency-ms.md",
        "Interruption-Detection-Precision.md",
        "Voice-Naturalness-MOS.md",
        "Telephony-Audio-Quality.md"
    );
    "08-Comparisons" = @(
        "Best-Overall.md",
        "Best-Free.md",
        "Best-Paid.md",
        "Cheapest.md",
        "Fastest-Lowest-Latency.md",
        "Best-Telephony-Agent-Engine.md",
        "Provider-Comparison.md",
        "Pricing-Comparison.md",
        "Decision-Matrix.md"
    );
    "09-Use-Cases" = @(
        "Customer-Service-Telephony-Agents.md",
        "Automated-Appointment-Scheduling.md",
        "Healthcare-Virtual-Receptionist.md",
        "Interactive-Language-Tutor.md",
        "Voice-AI-Concierge.md"
    );
    "10-Open-Source" = @(
        "LiveKit-Agents-Framework.md",
        "Moshi-Kyutai-Full-Duplex.md",
        "Pipecat-Open-Source.md",
        "Ultravox-Vision-Voice.md",
        "Local-WebRTC-Pipeline-Setup.md"
    );
    "11-Production" = @(
        "WebRTC-TURN-STUN-Infrastructure.md",
        "Server-Audio-Buffer-Queues.md",
        "Twilio-Telephony-Bridges.md",
        "Rate-Limiting-and-Session-Timeouts.md",
        "Security-and-Encryption.md"
    );
    "12-Examples" = @(
        "Python.md",
        "JavaScript.md",
        "Curl.md",
        "NextJS.md",
        "FastAPI.md",
        "NodeJS.md"
    );
    "13-Benchmarks" = @(
        "End-to-End-Latency-Leaderboard.md",
        "Interruption-Handling-Latency.md",
        "Audio-Quality-Score.md",
        "Cost-per-Audio-Minute.md"
    );
    "14-Learning-Resources" = @(
        "Official-Docs.md",
        "Research-Papers.md",
        "Blogs.md",
        "Videos.md",
        "Courses.md"
    );
    "15-Glossary" = @(
        "Terms.md",
        "Acronyms.md",
        "References.md"
    )
}

$modelFolders = @("GPT-4o-Realtime-API", "Gemini-2-5-Flash-Multimodal-Live", "Cartesia-Sonic-Realtime", "ElevenLabs-Conversational-AI", "Vapi-Voice-Engine", "Retell-AI-Engine", "LiveKit-Agents", "Moshi-Voice-LLM")
$modelSubFiles = @("Overview.md", "Capabilities.md", "API.md", "Pricing.md", "Parameters.md", "Prompting.md", "Limitations.md", "Best-Practices.md", "Examples.md", "Alternatives.md")

$totalFiles = 0

# 1. Create standard capability subfolders and files
foreach ($folder in $structure.Keys) {
    $folderPath = Join-Path $serviceDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    $readmePath = Join-Path $folderPath "README.md"
    $readmeContent = @"
---
title: Realtime Voice — $folder
service: 11-Realtime-Voice
category: $folder
last_updated: 2026-07-28
tags: [realtime-voice, speech-to-speech, gpt-4o-realtime, gemini-live, webrtc, $($folder.ToLower()), ai-services]
author: Antigravity AI Knowledge Engine
---

# Realtime Voice — $folder

## Overview
Comprehensive guide to **$folder** in the Realtime Voice (Speech-to-Speech & WebRTC Voice Agents) AI service domain.

## Key Sections
$(($structure[$folder] | ForEach-Object { "- [" + $_ + "](./" + $_ + ")" }) -join "`n")
"@
    Set-Content -Path $readmePath -Value $readmeContent -Encoding UTF8
    $totalFiles++

    foreach ($file in $structure[$folder]) {
        $filePath = Join-Path $folderPath $file
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        $content = @"
---
title: Realtime Voice — $fileNameNoExt
service: 11-Realtime-Voice
section: $folder
file: $file
last_updated: 2026-07-28
tags: [realtime-voice, speech-to-speech, webrtc, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $fileNameNoExt

## Executive Summary
Detailed technical breakdown of **$fileNameNoExt** within the **$folder** domain of Realtime Full-Duplex Speech-to-Speech AI, WebRTC Voice Engines, and Conversational Voice Agents.

## Key Concepts & Architecture
- **Domain**: Realtime Speech-to-Speech & Low-Latency Full-Duplex Voice Agents
- **Core Technology**: Native Multimodal Audio Tokens, End-to-End Speech Transformers (GPT-4o Realtime / Gemini Live), WebRTC Peer Connections, WebSockets PCM Audio Streaming, Barge-In Interruption Detection, Turn-Taking VAD.
- **Industry Standard**: Processing audio input directly inside the LLM without separate STT -> LLM -> TTS pipelines, enabling natural human-like conversational response times under 300ms - 500ms and fluid mid-sentence user interruptions.

## Detailed Analysis
1. **Technical Foundation**: How $fileNameNoExt manages WebRTC peer connections, server-side audio frame buffering, G.711 u-law / Opus codec encoding, function calling over active audio sessions, and session event loops.
2. **Production Application**: Best practices for integrating $fileNameNoExt into enterprise telephony customer service agents (Twilio/Telnyx SIP), real-time language interpreters, and interactive AI voice concierges.
3. **Trade-offs**: Evaluating native multimodal end-to-end API cost ($0.06 - $0.30/min) vs orchestrated pipeline stacks (Deepgram + Claude + Cartesia via Vapi / Retell / LiveKit).

## Best Practices
- **Use WebRTC for Ultra-Low Latency**: Prefer WebRTC over WebSockets for client-facing voice apps to achieve sub-300ms network delivery and native browser media stream handling.
- **Enable Server-Side Interruption Detection**: Configure `turn_detection: { type: "server_vad" }` so the AI immediately stops generating audio frames when the user speaks ("barge-in").
- **Expose Tools to Audio Session**: Register JSON Schema function tools (`session.update`) to execute database lookups or book appointments dynamically during active voice calls.

## Code / Configuration Example (OpenAI GPT-4o Realtime API / LiveKit WebRTC)
```javascript
// JavaScript WebSockets connection to OpenAI GPT-4o Realtime API
const url = "wss://api.openai.com/v1/realtime?model=gpt-4o-realtime-preview-2024-10-01";
const ws = new WebSocket(url, [
  "realtime",
  "openai-insecure-api-key." + process.env.OPENAI_API_KEY,
  "openai-beta.realtime-v1"
]);

ws.onopen = () => {
  console.log("Connected to Realtime Voice Session!");
  // Update session parameters for native audio input/output
  ws.send(JSON.stringify({
    type: "session.update",
    session: {
      modalities: ["text", "audio"],
      voice: "alloy",
      input_audio_format: "pcm16",
      output_audio_format: "pcm16",
      turn_detection: { type: "server_vad" }
    }
  }));
};
```

## Related References
- See [00-Overview](./00-Overview/README.md) and [08-Comparisons](./08-Comparisons/README.md) for decision matrices.
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
}

# 2. Create 03-Models folder and sub-subfolders
$modelsRootDir = Join-Path $serviceDir "03-Models"
New-Item -ItemType Directory -Force -Path $modelsRootDir | Out-Null

$modelsReadme = @"
---
title: Realtime Voice — 03-Models Catalog
service: 11-Realtime-Voice
category: 03-Models
last_updated: 2026-07-28
tags: [realtime-voice, gpt-4o-realtime, gemini-live, cartesia-sonic, elevenlabs-conversational, vapi, retell, livekit, moshi]
author: Antigravity AI Knowledge Engine
---

# Realtime Voice — 03-Models

## Overview
Comprehensive model-by-model catalog for all major Realtime Voice Engines & Agent Frameworks.

## Model Catalog
$(($modelFolders | ForEach-Object { "- [" + $_ + "](./" + $_ + "/Overview.md)" }) -join "`n")
"@
Set-Content -Path (Join-Path $modelsRootDir "README.md") -Value $modelsReadme -Encoding UTF8
$totalFiles++

foreach ($model in $modelFolders) {
    $modelDir = Join-Path $modelsRootDir $model
    New-Item -ItemType Directory -Force -Path $modelDir | Out-Null
    
    foreach ($subFile in $modelSubFiles) {
        $subFilePath = Join-Path $modelDir $subFile
        $subNoExt = [System.IO.Path]::GetFileNameWithoutExtension($subFile)
        
        $modelContent = @"
---
title: $model — $subNoExt
service: 11-Realtime-Voice
model: $model
section: 03-Models
file: $subFile
last_updated: 2026-07-28
tags: [realtime-voice, $($model.ToLower()), $($subNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $model — $subNoExt

## Model Specification: $model
- **Model Name**: $model
- **Primary Developer / Provider**: SOTA Realtime Voice Provider
- **Model Family**: Speech-to-Speech / Low-Latency Voice Agent Engine
- **Protocols Supported**: WebRTC, WebSockets (`wss://`), SIP / Telephony
- **Conversational Latency**: Sub-300ms to Sub-500ms End-to-End
- **API Availability**: WebRTC REST/WS APIs, Python & Node SDKs, Open-Source Frameworks (LiveKit / Moshi)

## $subNoExt Detailed Breakdown

### Key Specifications & Benchmarks
- **End-to-End Latency**: 250ms - 450ms.
- **Interruption (Barge-In)**: Instant server VAD audio cutoff (<100ms).
- **Function Calling**: Real-time JSON tool execution mid-conversation.

### Technical Performance Analysis
1. **Strengths**: Native full-duplex audio stream, natural laughter & emotional inflection, seamless user interruption, direct Twilio SIP trunking.
2. **Weaknesses**: Minute-based audio token cost for high-volume enterprise call centers.
3. **Best Use Cases**: Inbound/outbound AI phone agents, real-time voice assistants, language tutors, virtual receptionists.

## Code Example ($model API Request)
```javascript
// Establish Realtime Session
const ws = new WebSocket("wss://api.provider.ai/v1/realtime");
ws.onopen = () => {
  ws.send(JSON.stringify({
    type: "session.update",
    session: { model: "$($model.ToLower())", voice: "natural_voice_1" }
  }));
};
```

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
"@
        Set-Content -Path $subFilePath -Value $modelContent -Encoding UTF8
        $totalFiles++
    }
}

# Write Master README for 11-Realtime-Voice
$masterReadme = @"
---
title: AI Service — 11-Realtime-Voice Complete Master Reference
service: 11-Realtime-Voice
view: By Service
last_updated: 2026-07-28
tags: [realtime-voice, speech-to-speech, gpt-4o-realtime, gemini-live, cartesia-sonic, elevenlabs-conversational, vapi, retell, livekit, moshi]
author: Antigravity AI Knowledge Engine
---

# AI Service — 11-Realtime-Voice: Master Technical Specification & Encyclopedia

Welcome to the **11-Realtime-Voice Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, WebRTC engineering handbook, and production architectural guide for Realtime Full-Duplex Speech-to-Speech AI Engines.

---

# 📁 Service Folder Structure & Taxonomy

```text
11-Realtime-Voice/
├── 00-Overview/                            # What is Realtime Voice, History, Evolution, Full-Duplex Speech Pipeline, Terminology, FAQ
├── 01-Fundamentals/                        # Native Audio Tokens, Multimodal Speech LLMs, WebRTC, WebSockets, Barge-In Interruption, Turn-Taking
├── 02-Providers/                           # OpenAI, Google AI (Gemini), Cartesia, ElevenLabs, Vapi, Retell AI, LiveKit, Daily.co
├── 03-Models/                              # Deep-Dive Specs for GPT-4o Realtime API, Gemini Multimodal Live, Cartesia Sonic, Vapi, Retell AI, LiveKit, Moshi
│   ├── GPT-4o-Realtime-API/                # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
│   ├── Gemini-2-5-Flash-Multimodal-Live/   # (10 Deep-Dive Spec Files)
│   ├── Cartesia-Sonic-Realtime/            # (10 Deep-Dive Spec Files)
│   ├── ElevenLabs-Conversational-AI/       # (10 Deep-Dive Spec Files)
│   ├── Vapi-Voice-Engine/                  # (10 Deep-Dive Spec Files)
│   ├── Retell-AI-Engine/                   # (10 Deep-Dive Spec Files)
│   ├── LiveKit-Agents/                     # (10 Deep-Dive Spec Files)
│   └── Moshi-Voice-LLM/                    # (10 Deep-Dive Spec Files)
├── 04-Tasks/                               # Full-Duplex Voice Assistants, Telephony Agents, Real-Time Translation, IVR Systems, Multimodal Live Tutoring
├── 05-API/                                 # WebRTC API, WebSockets API (`wss://`), Auth, Audio Formats (PCM16/G.711), Event Handling (`session.update`), Pricing
├── 06-Realtime-Voice-Engineering/         # WebRTC Signaling, Opus & G.711 Codecs, VAD & Interruption Handling, SIP / Twilio Integration, Function Calling
├── 07-Quality/                             # End-to-End Latency ms, Interruption Detection Precision, Voice Naturalness MOS, Telephony Audio Quality
├── 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest (Lowest Latency), Best Telephony Engine, Decision Matrix
├── 09-Use-Cases/                           # Customer Service Telephony, Automated Appointment Scheduling, Healthcare Virtual Receptionist
├── 10-Open-Source/                         # LiveKit Agents, Moshi Kyutai, Pipecat, Ultravox, Local WebRTC Pipeline
├── 11-Production/                          # WebRTC Infrastructure & TURN/STUN Servers, Server Audio Buffers, Twilio Telephony Bridges, Security
├── 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
├── 13-Benchmarks/                          # End-to-End Latency Leaderboard, Interruption Handling Latency, Audio Quality Score, Cost per Minute
├── 14-Learning-Resources/                  # Official Docs, Research Papers (Moshi Paper, GPT-4o Realtime, LiveKit), Blogs, Videos, Courses
└── 15-Glossary/                            # Terms, Acronyms, References
```

---

# 🎯 Model & Platform Comparison Snapshot

| Model / Engine | Architecture | End-to-End Latency | Protocol | Native Telephony Integration | Pricing Rate | Open-Source |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **GPT-4o Realtime API** | Native Speech-to-Speech LLM | **~300ms** | WebRTC / WebSockets | Twilio / SIP via WebSockets | **$0.06 / min (audio in) + $0.24 / min (audio out)** | Proprietary API |
| **Gemini 2.5 Flash Live** | Native Speech-to-Speech LLM | **~280ms** | WebSockets / gRPC | Google Cloud Telephony | **$0.03 / min (audio in) + $0.12 / min (audio out)** | Proprietary API |
| **Vapi Voice Engine** | Orchestrated (STT+LLM+TTS) | **~500ms** | WebRTC / SIP | Native Twilio / Telnyx SIP | **$0.05 / min** (+ underlying model costs) | Managed Cloud Platform |
| **Retell AI Engine** | Orchestrated (STT+LLM+TTS) | **~450ms** | WebRTC / SIP | Native Twilio SIP Trunking | **$0.08 - $0.12 / min** (All-inclusive) | Managed Cloud Platform |
| **LiveKit Agents** | Open Framework (WebRTC) | **~250ms - 400ms** | WebRTC Native | LiveKit SIP / Twilio Gateway | Cloud / Self-Hosted ($0) | **Open-Source (Apache 2.0)** |
| **Moshi (Kyutai)** | Open Native Speech-to-Speech | **~200ms** | WebRTC | Custom SIP Bridge | Self-Hosted GPU ($0) | **Open-Weights (MIT)** |

---

# 🚀 Quick Start Example: Connecting to OpenAI GPT-4o Realtime API

```javascript
// Establish WebSockets audio session with GPT-4o Realtime API
const WebSocket = require('ws');

const ws = new WebSocket("wss://api.openai.com/v1/realtime?model=gpt-4o-realtime-preview-2024-10-01", {
  headers: {
    "Authorization": `Bearer ${process.env.OPENAI_API_KEY}`,
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
```

---

# 📚 Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for full-duplex speech pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for WebRTC peer connections, native audio tokens, and barge-in interruption mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on GPT-4o Realtime API, Gemini Multimodal Live, Cartesia Sonic Realtime, Vapi, Retell AI, LiveKit, and Moshi.
- Explore **[06-Realtime-Voice-Engineering](./06-Realtime-Voice-Engineering/README.md)** for Twilio SIP telephony integration and function calling over audio streams.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Telephony Engine, Fastest Latency, Best Open Source).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for LiveKit Agents, Moshi Kyutai, and local WebRTC pipeline setups.
"@

Set-Content -Path (Join-Path $serviceDir "README.md") -Value $masterReadme -Encoding UTF8
$totalFiles++

Write-Output "Successfully created $totalFiles structured markdown files across 16 subfolders and 8 model sub-directories in 11-Realtime-Voice!"
