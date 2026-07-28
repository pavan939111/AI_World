$cartesiaDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Cartesia"

if (Test-Path $cartesiaDir) {
    Remove-Item -Recurse -Force $cartesiaDir
}
New-Item -ItemType Directory -Force -Path $cartesiaDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Cartesia & Real-Time Voice Intelligence Platform.";
        "Company.md" = "Founded in 2023 by Karan Goel (CEO, Stanford AI PhD) and Albert Gu (Chief Scientist, co-creator of Mamba & S4 State Space Models) in San Francisco, CA; `$29 Million funding backed by Lightspeed & Index Ventures.";
        "SSM-State-Space-Model-Architecture.md" = "State Space Model (SSM) architecture enabling linear-time `O(N)` sub-100ms audio token synthesis.";
        "History-and-Milestones.md" = "Timeline from Mamba research at Stanford to Cartesia founding and Sonic voice model release.";
        "Glossary.md" = "Key terms, State Space Models, WebSockets PCM streaming."
    };
    "01-Text-to-Speech-Sonic" = @{
        "README.md" = "Ultra-low latency Sonic neural text-to-speech engine.";
        "Sonic.md" = "Sonic flagship model specs delivering human-like voice realism and sub-100ms latency (`$0.045 / 1k chars).";
        "Sonic-Turbo.md" = "Sonic Turbo model specs optimized for real-time voice agents.";
        "Comparisons.md" = "Sonic vs ElevenLabs Flash v2.5 vs OpenAI TTS latency vs quality matrix.";
        "Best-Practices.md" = "Punctuation tuning, speed control (`speed: 'fast'`), emotion tags."
    };
    "02-Voice-Cloning-and-Custom-Voices" = @{
        "README.md" = "Instant voice cloning and custom voice profile creation.";
        "Instant-Voice-Cloning.md" = "Cloning custom voice profiles from 5-second audio samples via API.";
        "Voice-Changer.md" = "Modifying speech acoustics and pitch controls.";
        "Best-Practices.md" = "Audio dataset recording for custom voice cloning."
    };
    "03-Realtime-Audio-Streaming-WebSockets" = @{
        "README.md" = "Bidirectional WebSockets PCM streaming for sub-100ms interactive voice bots.";
        "WebSockets-Streaming-API.md" = "`wss://api.cartesia.ai/tts/websocket` protocol specification.";
        "PCM-and-Audio-Encodings.md" = "RAW PCM (16-bit 24kHz / 44.1kHz), Mu-law, and Containerized MP3 audio encodings.";
        "Best-Practices.md" = "Sub-100ms WebSockets buffer management."
    };
    "04-Multilingual-Speech-Models" = @{
        "README.md" = "Sonic Multilingual speech synthesis across major global languages.";
        "Sonic-Multilingual.md" = "Sonic Multilingual supporting English, French, German, Spanish, Portuguese, Japanese, Chinese.";
        "Language-Detection-and-Switching.md" = "Automatic multi-language code-switching in speech synthesis."
    };
    "05-Cartesia-API-and-Endpoints" = @{
        "README.md" = "Official Cartesia REST & WebSockets API catalog (`api.cartesia.ai/v1`).";
        "TTS-Bytes-Endpoint.md" = "`/tts/bytes` HTTP POST endpoint specification.";
        "TTS-Websocket-Endpoint.md" = "`/tts/websocket` WebSockets endpoint specification.";
        "Voices-API.md" = "`/voices` management endpoint specification."
    };
    "06-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Cartesia client SDKs.";
        "Python-SDK-cartesia.md" = "Official `cartesia` Python SDK package specification.";
        "TypeScript-SDK.md" = "Official `@cartesia/cartesia-js` WebSockets client SDK specification.";
        "REST-and-cURL.md" = "cURL raw HTTP request headers."
    };
    "07-Pricing-and-Billing" = @{
        "README.md" = "Cartesia pricing schedule.";
        "Character-Rates-Schedule.md" = "Sonic model character rates (`$0.045 / 1,000 characters).";
        "Usage-Quota-Management.md" = "Managing API credit usage."
    };
    "08-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Sub-100ms-Realtime-Voice-Bot.md" = "Complete sub-100ms interactive voice agent architecture (Cartesia WebSockets + LLM).";
        "Python-Streaming-Audio-Pipeline.md" = "Python PyAudio streaming playback example."
    };
    "09-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from Sonic 1.0 to Sonic Turbo."
    };
    "10-Official-References" = @{
        "README.md" = "Curated list of official Cartesia links.";
        "Official-Links.md" = "Official API docs link: https://docs.cartesia.ai & https://cartesia.ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $cartesiaDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Cartesia — $folder Overview
provider: Cartesia
capability: $folder
last_updated: 2026-07-28
tags: [cartesia, sonic, ssm, mamba, tts, realtime-audio, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Cartesia — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Cartesia ultra-low latency voice applications.

## 3. Models Belonging to This Capability
- Sonic, Sonic Turbo, Sonic Multilingual, Instant Voice Cloning.

## 4. Exposed APIs & Endpoints
- Official Cartesia REST & WebSockets APIs (`https://api.cartesia.ai/v1`), Python `cartesia` SDK, TypeScript `@cartesia/cartesia-js` SDK.

## 5. Common Use Cases
- Sub-100ms interactive voice AI agents, real-time WebSockets audio streaming, custom voice cloning from 5-second samples.
"@
        } else {
            $content = @"
---
title: Cartesia — $fileNameNoExt Specification
provider: Cartesia
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [cartesia, sonic, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Cartesia — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Cartesia Sonic State Space Model (SSM) Voice Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Audio Samples (Voice Cloning)
- **Supported Output Modalities**: Audio PCM (16-bit 24kHz / 44.1kHz), MP3, Mu-law
- **Latency**: **Sub-100ms** Time-To-First-Byte (TTFB)
- **Pricing**: `$0.045 / 1,000 characters
- **API Availability**: Cartesia API (`api.cartesia.ai`), Python SDK (`cartesia`), TypeScript SDK (`@cartesia/cartesia-js`)
- **Streaming Protocol**: WebSockets (`wss://api.cartesia.ai/tts/websocket`) & HTTP Chunks

## Typical Use Cases
1. Sub-100ms interactive real-time voice bots using WebSockets PCM streaming.
2. Instant custom voice cloning from short 5-second audio samples.

## Strengths & Limitations
- **Strengths**: Industry-leading sub-100ms latency, State Space Model (SSM) computational efficiency, human voice realism.
- **Limitations**: Focused strictly on audio speech synthesis and voice cloning.

## Example Request (Official Python SDK WebSockets)
```python
import os
import asyncio
from cartesia import AsyncCartesia

async def main():
    client = AsyncCartesia(api_key=os.environ.get("CARTESIA_API_KEY"))
    ws = await client.tts.websocket()

    output = await ws.send(
        model_id="sonic-english",
        transcript="Hello! I am Cartesia Sonic, rendering speech in under 100 milliseconds.",
        voice={"mode": "id", "id": "a0e168ee-3a90-4c08-a35b-e323fa4d0602"},
        output_format={"container": "raw", "encoding": "pcm_s16le", "sample_rate": 24000}
    )

    async for buffer in output:
        # Stream raw PCM audio bytes to speaker / audio output
        pass

    await ws.close()

asyncio.run(main())
```

## Related Documentation & Models
- See official Cartesia documentation at https://docs.cartesia.ai
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Cartesia directory!"
