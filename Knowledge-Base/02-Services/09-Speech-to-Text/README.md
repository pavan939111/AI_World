---
title: AI Service â€” 09-Speech-to-Text Complete Master Reference
service: 09-Speech-to-Text
view: By Service
last_updated: 2026-07-28
tags: [speech-to-text, stt, asr, whisper-large-v3, deepgram-nova-2, assemblyai-universal-1, elevenlabs-scribe, chirp-2, whisper-cpp]
author: Antigravity AI Knowledge Engine
---

# AI Service â€” 09-Speech-to-Text: Master Technical Specification & Encyclopedia

Welcome to the **09-Speech-to-Text Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, audio engineering handbook, and production architectural guide for Automatic Speech Recognition (ASR) engines.

---

# ðŸ“ Service Folder Structure & Taxonomy

`	ext
09-Speech-to-Text/
â”œâ”€â”€ 00-Overview/                            # What is Speech-to-Text, History, Evolution, Audio Processing Pipeline, Terminology, FAQ
â”œâ”€â”€ 01-Fundamentals/                        # Acoustic Models, Spectrograms, CTC, Transformers, Word Error Rate (WER), Diarization, Timestamps
â”œâ”€â”€ 02-Providers/                           # OpenAI, Deepgram, ElevenLabs, AssemblyAI, Google Cloud, AWS Transcribe, Azure Speech, Open-Source
â”œâ”€â”€ 03-Models/                              # Deep-Dive Specs for Whisper Large v3, Deepgram Nova-2, AssemblyAI Universal-1, ElevenLabs Scribe, etc.
â”‚   â”œâ”€â”€ Whisper-Large-v3/                   # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
â”‚   â”œâ”€â”€ Whisper-Large-v3-Turbo/             # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Deepgram-Nova-2/                    # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ AssemblyAI-Universal-1/             # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ ElevenLabs-Scribe/                  # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Google-Chirp-2/                     # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Azure-Fast-Transcription/           # (10 Deep-Dive Spec Files)
â”‚   â””â”€â”€ Whisper-cpp/                        # (10 Deep-Dive Spec Files)
â”œâ”€â”€ 04-Tasks/                               # Batch Audio Transcription, Realtime Streaming (wss://), Diarization, Translation, Audio Intelligence
â”œâ”€â”€ 05-API/                                 # REST APIs, WebSockets APIs, Auth, Request Formats (WAV/MP3), Response Formats, Pricing, Error Handling
â”œâ”€â”€ 06-Audio-Engineering-and-Preprocessing/ # Resampling 16kHz PCM, Noise Suppression, VAD (Voice Activity Detection), Channel Separation, Chunking
â”œâ”€â”€ 07-Quality/                             # Word Error Rate (WER), Sub-Word Timestamp Accuracy %, Speaker Diarization Precision, Noise Robustness
â”œâ”€â”€ 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest (Lowest Latency), Best Realtime Streaming, Decision Matrix
â”œâ”€â”€ 09-Use-Cases/                           # Call Center Analytics, Subtitles & Closed Captioning, Voice Assistant Input, Medical Dictation
â”œâ”€â”€ 10-Open-Source/                         # Whisper Large v3, Whisper.cpp, Faster-Whisper, Insanely-Fast-Whisper, SpeechBrain, Local GPU Serving
â”œâ”€â”€ 11-Production/                          # WebSockets Connection Pooling, High-Throughput Batch Transcribing, Realtime Buffer Management, PII Redaction
â”œâ”€â”€ 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
â”œâ”€â”€ 13-Benchmarks/                          # WER Benchmark Scores, Real-Time Factor (RTF), Streaming Latency (ms), Cost per Hour of Audio
â”œâ”€â”€ 14-Learning-Resources/                  # Official Docs, Research Papers (Whisper Paper, CTC, Conformer), Blogs, Videos, Courses
â””â”€â”€ 15-Glossary/                            # Terms, Acronyms, References
`

---

# ðŸŽ¯ Model Comparison & Decision Matrix Snapshot

| Engine / Model | Provider | Word Error Rate (WER) | Real-Time Latency | API Pricing (per hour of audio) | WebSockets Streaming | Free / Open-Weights |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Deepgram Nova-2** | Deepgram | **5.2% WER** (#1 Speed/Acc) | **<250ms** (Sub-second) | **.258 / hour** (.0043/min) | **Yes (wss://)** | 200 Free Credit $ |
| **Whisper Large v3** | OpenAI | **6.1% WER** | ~2.0s (Batch) | **.360 / hour** (.006/min) | REST Only | **Open-Weights (MIT)** |
| **AssemblyAI Universal-1**| AssemblyAI | **5.8% WER** | ~1.5s (Batch) | **.370 / hour** (.0062/min) | Yes | 100 Free Hours |
| **ElevenLabs Scribe** | ElevenLabs | **5.4% WER** (Precise) | ~1.0s (Batch) | **.480 / hour** | REST Only | 10k Free Characters/mo |
| **Google Chirp 2** | Google Cloud | **6.4% WER** | ~1.2s (Batch) | **.960 / hour** (.016/min) | Yes | GCP  Credits |
| **Whisper.cpp** | Open-Source | **6.3% WER** | Local C++ Hardware | **Self-Hosted ()** | Local C++ Stream | **Open-Source (MIT)** |

---

# ðŸš€ Quick Start Example: Transcribing Audio via OpenAI Whisper API

`python
import os
import requests

api_url = "https://api.openai.com/v1/audio/transcriptions"
headers = {"Authorization": f"Bearer {os.environ.get('OPENAI_API_KEY')}"}

files = {"file": ("podcast_audio.mp3", open("podcast_audio.mp3", "rb"), "audio/mpeg")}
data = {"model": "whisper-1", "response_format": "json"}

response = requests.post(api_url, headers=headers, files=files, data=data)
print("Transcript:", response.json().get("text"))
`

---

# ðŸ“š Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for audio processing pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for Mel-Spectrograms, CTC, and Word Error Rate (WER) mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on Whisper Large v3, Deepgram Nova-2, AssemblyAI Universal-1, ElevenLabs Scribe, and Whisper.cpp.
- Explore **[06-Audio-Engineering-and-Preprocessing](./06-Audio-Engineering-and-Preprocessing/README.md)** for 16kHz PCM resampling and Voice Activity Detection (VAD) scripts.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Paid, Fastest Latency, Best Realtime Streaming).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for Whisper.cpp, Faster-Whisper, and local GPU ASR serving setups.
