---
title: OpenAI Text-to-Speech (TTS-1 & TTS-1-HD) Specification
provider: OpenAI
capability: 06-Audio-and-Speech
model: TTS-1-HD
file: TTS-1-HD.md
last_updated: 2026-07-28
tags: [openai, tts, tts-1, tts-1-hd, text-to-speech, neural-voice]
author: Antigravity AI Knowledge Engine
---

# OpenAI Text-to-Speech (TTS-1 & TTS-1-HD) Specification

## 1. Overview & Model Comparison
OpenAI offers two neural text-to-speech models via `/v1/audio/speech`:
- **`tts-1`**: Optimized for real-time streaming applications with ultra-low Time-To-First-Byte (TTFB) latency.
- **`tts-1-hd`**: Optimized for high-definition audio quality with superior clarity and minimal background audio artifacts.

---

## 2. Technical Specifications & Pricing

| Feature / Metric | TTS-1 (Standard) | TTS-1-HD (High Definition) |
| :--- | :--- | :--- |
| **Model ID** | `tts-1` | `tts-1-hd` |
| **Target Use Case** | Real-time chat audio streaming | Podcasts, audiobooks, voiceovers |
| **Latency (TTFB)** | **Sub-500ms** | 1,000ms - 2,500ms |
| **API Price per 1K Chars**| **$0.015 / 1,000 characters** | **$0.030 / 1,000 characters** |
| **Supported Audio Formats**| `mp3`, `opus`, `aac`, `flac`, `wav`, `pcm` | `mp3`, `opus`, `aac`, `flac`, `wav`, `pcm` |
| **Max Character Input**| 4,096 characters per request | 4,096 characters per request |

---

## 3. Official Voice Selection

| Voice ID | Gender Tone | Sound Profile & Characteristics |
| :--- | :--- | :--- |
| **`alloy`** | Neutral / Balanced | Versatile, clear, professional enterprise assistant |
| **`echo`** | Male / Warm | Soft-spoken, conversational, friendly |
| **`fable`** | Neutral / Storyteller | Expressive, theatrical, ideal for audiobooks |
| **`onyx`** | Male / Authoritative | Deep, resonant, serious newscaster tone |
| **`nova`** | Female / Energetic | Upbeat, bright, modern consumer app voice |
| **`shimmer`** | Female / Calm | Soft, warm, relaxing mindfulness tone |
| **`ash`** | Male / Crisp | Direct, articulate technical voice |
| **`coral`** | Female / Engaging | Friendly, warm customer support voice |
