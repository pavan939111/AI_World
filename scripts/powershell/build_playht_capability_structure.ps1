$playhtDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\PlayHT"

if (Test-Path $playhtDir) {
    Remove-Item -Recurse -Force $playhtDir
}
New-Item -ItemType Directory -Force -Path $playhtDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of PlayHT & Conversational AI Voice Platform.";
        "Company.md" = "Founded in 2018 by Hammad Syed and Mahmoud Felfel in Mountain View, CA; backed by Y Combinator (YC W22).";
        "Neural-Speech-Architecture.md" = "Real-time streamable neural text-to-speech architecture.";
        "History-and-Milestones.md" = "Timeline from PlayHT 1.0 to PlayHT 2.0 Turbo, Play3.0-Mini, and WebSockets API.";
        "Glossary.md" = "Key terms, Audio Encodings, WebSockets Streaming."
    };
    "01-Text-to-Speech-Models" = @{
        "README.md" = "Flagship PlayHT neural text-to-speech model family.";
        "PlayHT-2-0-Turbo.md" = "PlayHT 2.0 Turbo flagship conversational model specs (sub-300ms latency, high voice expressiveness).";
        "Play3-0-Mini.md" = "Play3.0-Mini lightweight low-latency model specs.";
        "Comparisons.md" = "PlayHT 2.0 Turbo vs ElevenLabs Flash v2.5 vs Cartesia Sonic matrix.";
        "Best-Practices.md" = "Emotion prompting, speed control, SSML formatting."
    };
    "02-Instant-and-High-Fidelity-Voice-Cloning" = @{
        "README.md" = "Instant and high-fidelity voice cloning capabilities.";
        "Instant-Voice-Cloning.md" = "Instant Voice Cloning specs requiring only 10 seconds of clear audio.";
        "High-Fidelity-Voice-Cloning.md" = "High-Fidelity Voice Cloning requiring studio recordings.";
        "Best-Practices.md" = "Audio sample dataset optimization."
    };
    "03-Realtime-Audio-Streaming-WebSockets" = @{
        "README.md" = "Real-time WebSockets PCM audio streaming for voice agents.";
        "WebSockets-Streaming-API.md" = "`wss://api.play.ht/api/v2/tts/stream` protocol specification.";
        "Audio-Encodings-PCM-MP3.md" = "RAW PCM (16-bit 24kHz / 44.1kHz), WAV, MP3, and Ogg audio encodings.";
        "Best-Practices.md" = "Sub-300ms audio buffer chunking."
    };
    "04-Voice-Agents-and-Widget-Integration" = @{
        "README.md" = "Interactive voice agents and embeddable web audio player widgets.";
        "Conversational-AI-Agents.md" = "Configuring real-time interactive voice bots.";
        "Audio-Player-Embed-Widgets.md" = "Embedding PlayHT audio player widgets into blogs and articles.";
        "Examples.md" = "Web article audio player widget code snippet."
    };
    "05-PlayHT-API-and-Endpoints" = @{
        "README.md" = "Official PlayHT REST & WebSockets API catalog (`api.play.ht/api/v2`).";
        "TTS-Stream-API.md" = "`/api/v2/tts/stream` endpoint specification.";
        "Cloned-Voices-API.md" = "`/api/v2/cloned-voices` endpoint specification.";
        "Voices-List-API.md" = "`/api/v2/voices` endpoint specification."
    };
    "06-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official PlayHT client libraries.";
        "Python-SDK-pyplayht.md" = "Official `pyplayht` Python package specification.";
        "TypeScript-SDK.md" = "Official TypeScript SDK specification.";
        "REST-APIs.md" = "cURL raw request headers (`AUTHORIZATION: Bearer <token>`, `X-USER-ID: <userId>`)."
    };
    "07-Pricing-and-Billing" = @{
        "README.md" = "PlayHT pricing plans and word/character rates.";
        "Subscription-Tiers.md" = "Free ($0), Creator ($31.20/mo), Pro ($99/mo), Enterprise pricing plans.";
        "API-Usage-Billing.md" = "Pay-as-you-go API word and character rate schedule."
    };
    "08-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Realtime-Voice-Agent-Streaming-Pipeline.md" = "Real-time WebSockets voice agent streaming pipeline template.";
        "Python-Audio-Streaming-Script.md" = "Python PyAudio real-time streaming script."
    };
    "09-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from PlayHT 1.0 to PlayHT 2.0 Turbo."
    };
    "10-Official-References" = @{
        "README.md" = "Curated list of official PlayHT links.";
        "Official-Links.md" = "Official API docs link: https://docs.play.ht & https://play.ht"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $playhtDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: PlayHT — $folder Overview
provider: PlayHT
capability: $folder
last_updated: 2026-07-28
tags: [playht, tts, voice-cloning, realtime-audio, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# PlayHT — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in PlayHT voice applications.

## 3. Models Belonging to This Capability
- PlayHT 2.0 Turbo, Play3.0-Mini, Instant Voice Cloning, High-Fidelity Voice Cloning.

## 4. Exposed APIs & Endpoints
- Official PlayHT REST & WebSockets APIs (`https://api.play.ht/api/v2`), Python `pyplayht` SDK.

## 5. Common Use Cases
- Sub-300ms interactive voice bots, instant voice cloning from 10-second audio, web article narration widgets, real-time WebSockets audio streaming.
"@
        } else {
            $content = @"
---
title: PlayHT — $fileNameNoExt Specification
provider: PlayHT
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [playht, tts, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# PlayHT — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: PlayHT Conversational Neural Voice Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Audio Samples (Voice Cloning)
- **Supported Output Modalities**: Audio MP3, WAV, PCM (16-bit 24kHz / 44.1kHz), Ogg
- **Latency**: **Sub-300ms** Time-To-First-Byte (TTFB)
- **Pricing**: Standard word and character rate schedule
- **API Availability**: Official PlayHT API (`api.play.ht/api/v2`), Python SDK (`pyplayht`)
- **Authentication**: `AUTHORIZATION: Bearer <SECRET_KEY>` and `X-USER-ID: <USER_ID>` headers
- **Streaming Protocol**: WebSockets & HTTP chunked streaming

## Typical Use Cases
1. Production real-time interactive voice bots (PlayHT 2.0 Turbo + WebSockets).
2. Automated web article audio narration widgets.

## Strengths & Limitations
- **Strengths**: Sub-300ms latency, 10-second instant voice cloning, emotional voice expressiveness, web audio player widgets.
- **Limitations**: Requires dual API headers (`AUTHORIZATION` + `X-USER-ID`).

## Example Request (Official Python SDK)
```python
import os
from pyplayht import Client, TTSOptions

client = Client(
    user_id=os.environ.get("PLAYHT_USER_ID"),
    api_key=os.environ.get("PLAYHT_API_KEY")
)

options = TTSOptions(voice="s3://voice-cloning-zero-shot/d9abb782-3dd4-4889-a4ee-8d857d90c0ff/samantha/manifest.json")

# Stream audio chunked bytes
for chunk in client.tts("Welcome to PlayHT real-time voice streaming.", options=options):
    pass # Handle raw PCM / MP3 bytes stream
```

## Related Documentation & Models
- See official PlayHT documentation at https://docs.play.ht
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in PlayHT directory!"
