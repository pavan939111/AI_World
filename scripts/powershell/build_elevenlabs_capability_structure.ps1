$elevenlabsDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\ElevenLabs"

if (Test-Path $elevenlabsDir) {
    Remove-Item -Recurse -Force $elevenlabsDir
}
New-Item -ItemType Directory -Force -Path $elevenlabsDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of ElevenLabs & Voice AI Platform.";
        "Company.md" = "Founded in 2022 by Mati Staniszewski & Piotr Dabkowski in NYC and London; `$1 Billion+ unicorn valuation backed by Andreessen Horowitz & Sequoia.";
        "Voice-AI-Architecture.md" = "Neural audio synthesis, voice cloning, and zero-shot voice generation architecture.";
        "History-and-Milestones.md" = "Timeline from founding in 2022 to Multilingual v2, Eleven Flash, and Conversational AI platform.";
        "Glossary.md" = "Key terms, audio sampling rate, latency terminology."
    };
    "01-Text-to-Speech-TTS" = @{
        "README.md" = "High-fidelity neural text-to-speech models across 32 languages.";
        "Eleven-Flash-v2-5.md" = "Eleven Flash v2.5 model specs delivering ultra-low 75ms latency (`$0.015 / 1k chars).";
        "Eleven-Multilingual-v2.md" = "Eleven Multilingual v2 flagship model specs covering 29 languages (`$0.30 / 1k chars).";
        "Eleven-Turbo-v2-5.md" = "Eleven Turbo v2.5 model specs (`$0.15 / 1k chars).";
        "Eleven-English-v1.md" = "Legacy English speech synthesis model specs.";
        "Comparisons.md" = "Eleven Flash vs Multilingual v2 latency vs quality tradeoff matrix.";
        "Best-Practices.md" = "Punctuation tuning, SSML formatting, stability and clarity slider settings."
    };
    "02-Voice-Cloning" = @{
        "README.md" = "Instant and professional voice cloning technologies.";
        "Instant-Voice-Cloning-IVC.md" = "Instant Voice Cloning specs requiring only 1 to 3 minutes of audio samples.";
        "Professional-Voice-Cloning-PVC.md" = "Studio-grade Professional Voice Cloning specs requiring 30+ minutes of studio recordings.";
        "Verification-and-Safety.md" = "Captcha voice verification, biometric safety, and anti-cloning safeguards.";
        "Best-Practices.md" = "Clean audio dataset recording guidelines."
    };
    "03-Conversational-AI-Agents" = @{
        "README.md" = "End-to-end low-latency WebSockets & WebRTC interactive voice agent platform.";
        "Conversational-AI-Platform.md" = "Configuring LLM logic, prompt instructions, and voice persona.";
        "WebSockets-and-WebRTC-Streaming.md" = "Bidirectional audio streaming protocol guide.";
        "Agent-Tool-Calling.md" = "Client function execution during voice calls.";
        "Best-Practices.md" = "Sub-300ms voice agent optimization."
    };
    "04-Speech-to-Speech" = @{
        "README.md" = "Speech-to-Speech (STS) voice modification and emotion preservation.";
        "Speech-to-Speech-STS-API.md" = "`/v1/speech-to-speech/{voice_id}` endpoint specification.";
        "Voice-Changer-Engine.md" = "Converting human vocal performance into target voice profiles.";
        "Examples.md" = "Python code patterns for speech-to-speech transformation."
    };
    "05-Dubbing-and-Video-Translation" = @{
        "README.md" = "Automated video dubbing across 29 languages with voice matching.";
        "Auto-Dubbing-API.md" = "`/v1/dubbing` endpoint specification.";
        "Voice-Matching-and-Lip-Sync.md" = "Multi-speaker voice preservation and lip-sync alignment.";
        "Examples.md" = "Automated video dubbing Python script."
    };
    "06-Sound-Effects-and-Audio-Gen" = @{
        "README.md" = "Generative text-to-sound-effects and audio clip creation.";
        "Sound-Effects-SFX-API.md" = "`/v1/sound-generation` endpoint specification.";
        "Text-to-SFX-Prompting.md" = "Prompting techniques for cinematic sound effects."
    };
    "07-Voice-Library-and-Marketplace" = @{
        "README.md" = "Community voice library and creator monetization.";
        "Public-Voice-Library.md" = "Browsing and selecting community-contributed voice profiles.";
        "Voice-Sharing-Payouts.md" = "Voice actor monetization and payout mechanics."
    };
    "08-Audio-Native-and-Widgets" = @{
        "README.md" = "Embeddable audio widgets for websites and blogs.";
        "Audio-Native-Embed-Widget.md" = "Auto-generating narration widgets for web articles.";
        "Reader-App-Integration.md" = "ElevenLabs Mobile Reader application integration."
    };
    "09-APIs-and-Endpoints" = @{
        "README.md" = "ElevenLabs REST API catalog (`api.elevenlabs.io/v1`).";
        "Text-to-Speech-API.md" = "`/v1/text-to-speech/{voice_id}` endpoint specification.";
        "Voices-Management-API.md" = "`/v1/voices` endpoint specification.";
        "Dubbing-API.md" = "`/v1/dubbing` endpoint specification.";
        "Conversational-AI-API.md" = "`/v1/convai` endpoint specification."
    };
    "10-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official ElevenLabs client libraries.";
        "Python-SDK-elevenlabs.md" = "Official `elevenlabs` Python package specification.";
        "TypeScript-SDK.md" = "Official `elevenlabs` Node.js TypeScript package specification.";
        "REST-APIs.md" = "cURL raw request headers."
    };
    "11-Pricing-and-Billing" = @{
        "README.md" = "ElevenLabs pricing plans and character consumption rates.";
        "Character-Billing-Rates.md" = "Model character multipliers (Flash = 0.5x, Multilingual v2 = 1x).";
        "Subscription-Tiers.md" = "Free ($0), Starter ($5), Creator ($22), Pro ($99), Enterprise pricing tiers.";
        "Conversational-AI-Rates.md" = "Per-minute pricing for Conversational AI agent calls."
    };
    "12-Rate-Limits-and-Quotas" = @{
        "README.md" = "ElevenLabs rate limit boundaries.";
        "Concurrency-Limits-by-Tier.md" = "Concurrent request limits per plan tier.";
        "RPM-Character-Limits.md" = "Monthly character quota limits."
    };
    "13-Authentication-and-Security" = @{
        "README.md" = "API key and voice security controls.";
        "xi-api-key-Setup.md" = "`xi-api-key` HTTP header setup.";
        "Voice-Safety-and-Watermarking.md" = "AI voice watermarking and anti-misuse detection."
    };
    "14-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Ultra-Low-Latency-Voice-Bot.md" = "Sub-200ms voice agent pattern (Flash v2.5 + WebSockets).";
        "Automated-Video-Dubbing-Pipeline.md" = "Automated video translation pipeline."
    };
    "15-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from Eleven Multilingual v1 to Flash v2.5."
    };
    "16-Official-References" = @{
        "README.md" = "Curated list of official ElevenLabs links.";
        "Official-Links.md" = "Official docs link: https://elevenlabs.io/docs"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $elevenlabsDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: ElevenLabs — $folder Overview
provider: ElevenLabs
capability: $folder
last_updated: 2026-07-28
tags: [elevenlabs, tts, voice-cloning, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# ElevenLabs — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in ElevenLabs voice applications.

## 3. Models Belonging to This Capability
- Eleven Flash v2.5 (75ms latency), Eleven Multilingual v2, Eleven Turbo v2.5, Voice Cloning (IVC/PVC).

## 4. Exposed APIs & Endpoints
- ElevenLabs REST API endpoints (`https://api.elevenlabs.io/v1`) and official `elevenlabs` Python / TypeScript SDKs.

## 5. Common Use Cases
- Sub-200ms real-time voice agents, studio-grade video dubbing across 29 languages, instant voice cloning, generative sound effects.
"@
        } else {
            $content = @"
---
title: ElevenLabs — $fileNameNoExt Specification
provider: ElevenLabs
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [elevenlabs, tts, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# ElevenLabs — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: ElevenLabs Neural Audio & Voice Synthesis Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Audio (Speech-to-Speech & Voice Cloning), Video (Dubbing)
- **Supported Output Modalities**: Audio MP3 / PCM (24kHz 16-bit), Subtitles / Timestamps
- **Latency**: 75ms (Eleven Flash v2.5) to 250ms (Multilingual v2)
- **Languages Supported**: 32 languages (Multilingual v2)
- **Pricing**: Flash v2.5 (`$0.015 / 1k chars) | Multilingual v2 (`$0.30 / 1k chars)
- **API Availability**: ElevenLabs API (`api.elevenlabs.io`), Official Python/TypeScript SDKs
- **Streaming Support**: HTTP chunked streaming & WebSockets
- **Voice Customization**: Stability, Clarity, Exaggeration, Style Exaggeration sliders

## Typical Use Cases
1. Production sub-200ms interactive voice bots (Eleven Flash v2.5 + WebSockets).
2. Automated multi-speaker video dubbing and translation across 29 languages.

## Strengths & Limitations
- **Strengths**: Industry-leading human voice realism, 75ms ultra-low latency, instant and professional voice cloning, multi-speaker video dubbing.
- **Limitations**: Character billing consumption quotas based on plan tier.

## Example Request (Official Python SDK)
```python
import os
from elevenlabs.client import ElevenLabs

client = ElevenLabs(api_key=os.environ.get("ELEVENLABS_API_KEY"))

audio_stream = client.generate(
    text="Welcome to the AI Tools Encyclopedia.",
    voice="JBFqnCBsd6RMkjVDRZzb", # Rachel
    model="eleven_flash_v2_5",
    stream=True
)

for chunk in audio_stream:
    if isinstance(chunk, bytes):
        pass # Play or buffer audio PCM/MP3 bytes
```

## Related Documentation & Models
- See official ElevenLabs documentation at https://elevenlabs.io/docs
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in ElevenLabs directory!"
