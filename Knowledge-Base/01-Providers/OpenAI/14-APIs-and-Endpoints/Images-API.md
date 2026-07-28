---
title: OpenAI API Master Reference â€” Endpoint Matrix & REST Standards
provider: OpenAI
capability: 14-APIs-and-Endpoints
file: Chat-Completions-API.md
last_updated: 2026-07-28
tags: [openai, api-endpoints, rest, websockets, batch-api]
author: Antigravity AI Knowledge Engine
---

# OpenAI API Master Reference â€” Endpoint Matrix & REST Standards

## 1. Complete OpenAI API Endpoint Reference Table

| API Domain | HTTP Method | Endpoint URL | Description | Supported Models |
| :--- | :--- | :--- | :--- | :--- |
| **Chat Completions** | `POST` | `https://api.openai.com/v1/chat/completions` | Standard text/vision/tool completions | `gpt-4o`, `gpt-4o-mini`, `o1`, `o3-mini` |
| **Realtime Speech** | `WSS` | `wss://api.openai.com/v1/realtime` | Full-duplex speech-to-speech WebSockets | `gpt-4o-realtime-preview` |
| **Batch API** | `POST` | `https://api.openai.com/v1/batches` | Asynchronous bulk processing (50% off) | `gpt-4o`, `gpt-4o-mini`, embeddings |
| **Text Embeddings** | `POST` | `https://api.openai.com/v1/embeddings` | Vector embedding generation | `text-embedding-3-large`, `small` |
| **Images (DALL-E)** | `POST` | `https://api.openai.com/v1/images/generations`| Text-to-image synthesis | `dall-e-3`, `dall-e-2` |
| **Speech-to-Text** | `POST` | `https://api.openai.com/v1/audio/transcriptions`| Speech transcription & translation | `whisper-1` |
| **Text-to-Speech** | `POST` | `https://api.openai.com/v1/audio/speech` | Neural audio synthesis | `tts-1`, `tts-1-hd` |
| **Fine-Tuning** | `POST` | `https://api.openai.com/v1/fine_tuning/jobs` | Model weight customization | `gpt-4o-mini`, `gpt-4o` |
| **Moderation** | `POST` | `https://api.openai.com/v1/moderations` | Free safety classification | `omni-moderation-latest` |
