---
title: AI Service â€” 10-Text-to-Speech Complete Master Reference
service: 10-Text-to-Speech
view: By Service
last_updated: 2026-07-28
tags: [text-to-speech, tts, elevenlabs, cartesia-sonic, playht, openai-tts, google-neural2, bark]
author: Antigravity AI Knowledge Engine
---

# AI Service â€” 10-Text-to-Speech: Master Technical Specification & Encyclopedia

Welcome to the **10-Text-to-Speech Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, speech engineering handbook, and production architectural guide for Neural Text-to-Speech (TTS) engines.

---

# ðŸ“ Service Folder Structure & Taxonomy

`	ext
10-Text-to-Speech/
â”œâ”€â”€ 00-Overview/                            # What is Text-to-Speech, History, Evolution, Generative Speech Pipeline, Terminology, FAQ
â”œâ”€â”€ 01-Fundamentals/                        # Neural Vocoders, Audio Transformers, State Space Models (SSM), Spectrograms, Pitch & Emotion, SSML
â”œâ”€â”€ 02-Providers/                           # ElevenLabs, Cartesia, PlayHT, OpenAI, Google Cloud, AWS Polly, Azure Speech, Open-Source
â”œâ”€â”€ 03-Models/                              # Deep-Dive Specs for ElevenLabs Multilingual v2, ElevenLabs Turbo v2.5, Cartesia Sonic, PlayHT Play3.0, etc.
â”‚   â”œâ”€â”€ ElevenLabs-Eleven-Multilingual-v2/  # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
â”‚   â”œâ”€â”€ ElevenLabs-Turbo-v2-5/              # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Cartesia-Sonic/                     # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ PlayHT-Play3-0-Mini/                # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ OpenAI-tts-1-hd/                    # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Google-Neural2-TTS/                 # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Azure-Neural-TTS/                   # (10 Deep-Dive Spec Files)
â”‚   â””â”€â”€ Bark-Voice-Generator/               # (10 Deep-Dive Spec Files)
â”œâ”€â”€ 04-Tasks/                               # Audiobook Generation, Podcast Synthesis, Realtime Voice Response, Video Voiceover, E-Learning, Accessibility
â”œâ”€â”€ 05-API/                                 # REST APIs, WebSockets APIs, Auth, Request Formats, Response Formats (MP3/WAV/PCM), Pricing, Error Handling
â”œâ”€â”€ 06-Speech-Engineering-and-SSML/         # SSML Tags (Break, Prosody, Emphasis), Phoneme Dictionaries, Emotion Parameters, Audio Format Conversion
â”œâ”€â”€ 07-Quality/                             # Mean Opinion Score (MOS), Naturalness & Intelligibility, Pronunciation Accuracy, TTFB Latency (ms)
â”œâ”€â”€ 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest (Sub-100ms Latency), Best Emotional Quality, Decision Matrix
â”œâ”€â”€ 09-Use-Cases/                           # Audiobook Publishing, Interactive AI Assistants, E-Commerce Product Narration, Gaming NPC Dialogue
â”œâ”€â”€ 10-Open-Source/                         # Bark, StyleTTS2, Coqui TTS, Piper TTS, XTTS v2, Local GPU Serving
â”œâ”€â”€ 11-Production/                          # WebSockets Streaming Connections, Chunked Text Synthesis, Buffer Management, Audio Caching, CDN Delivery
â”œâ”€â”€ 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
â”œâ”€â”€ 13-Benchmarks/                          # MOS Quality Leaderboard, TTFB Latency ms Leaderboard, Cost per 1M Characters, Audio Quality Rating
â”œâ”€â”€ 14-Learning-Resources/                  # Official Docs, Research Papers (FastSpeech, Tacotron, VITS, Bark), Blogs, Videos, Courses
â””â”€â”€ 15-Glossary/                            # Terms, Acronyms, References
`

---

# ðŸŽ¯ Model Comparison & Decision Matrix Snapshot

| Model / Engine | Provider | MOS Quality Score | TTFB Latency (ms) | WebSockets Streaming | API Pricing (per 1M characters) | Open-Weights |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Cartesia Sonic** | Cartesia | **4.6 MOS** | **<90ms** (#1 Lowest Latency) | **Yes (wss://)** | **.00 / 1M chars** | Proprietary API |
| **ElevenLabs Turbo v2.5** | ElevenLabs | **4.7 MOS** (#1 Emotional) | **<250ms** | **Yes (wss://)** | **.00 / 1M chars** | Proprietary API |
| **PlayHT Play3.0 Mini** | PlayHT | **4.5 MOS** | **<300ms** | **Yes (wss://)** | **.00 / 1M chars** | Proprietary API |
| **OpenAI tts-1-hd** | OpenAI | **4.5 MOS** | ~1,200ms (Batch) | REST Only | **.00 / 1M chars** | Proprietary API |
| **Google Neural2** | Google Cloud | **4.3 MOS** | ~400ms | Yes | **.00 / 1M chars** | Proprietary API |
| **Bark Voice Generator** | Suno (Open) | **4.1 MOS** | Local GPU | Local Processing | **Self-Hosted ()** | **Open-Weights (MIT)** |

---

# ðŸš€ Quick Start Example: Calling OpenAI TTS API in Python

`python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

response = client.audio.speech.create(
    model="tts-1-hd",
    voice="onyx",
    input="The future of voice AI lies in sub-100 millisecond real-time neural speech synthesis."
)

response.stream_to_file("speech_output.mp3")
print("Saved speech to speech_output.mp3!")
`

---

# ðŸ“š Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for generative speech pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for Neural Vocoders, Audio Transformers, and State Space Models (SSM).
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on ElevenLabs Multilingual v2, ElevenLabs Turbo v2.5, Cartesia Sonic, PlayHT Play3.0, and OpenAI tts-1-hd.
- Explore **[06-Speech-Engineering-and-SSML](./06-Speech-Engineering-and-SSML/README.md)** for SSML break, prosody, and emotion tag guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Paid, Fastest Latency, Best Emotional Quality).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for Bark, StyleTTS2, XTTS v2, and local GPU TTS serving setups.
