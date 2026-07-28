---
title: OpenAI 07-Realtime-Voice â€” Index Guide
provider: OpenAI
capability: 07-Realtime-Voice
file: README.md
last_updated: 2026-07-28
tags: [openai, realtime-voice, index]
author: Antigravity AI Knowledge Engine
---

# OpenAI 07-Realtime-Voice â€” Index Guide

## Overview
This directory contains technical specifications, protocol frame formats, WebRTC ephemeral session token setup, Server VAD rules, and live tool execution guides for the OpenAI Realtime API (`gpt-4o-realtime-preview`).

## Document Index
- **[gpt-4o-realtime-preview.md](./gpt-4o-realtime-preview.md)**: Multimodal speech-to-speech engine specs, sub-300ms latency, pricing ($0.060/min input, $0.240/min output), and WebSockets JSON frames.
- **[Realtime-API-WebSockets.md](./Realtime-API-WebSockets.md)** & **[Realtime-API-WebRTC.md](./Realtime-API-WebRTC.md)**: WebSockets vs WebRTC architectural transport comparison.
- **[Voice-Activity-Detection-VAD.md](./Voice-Activity-Detection-VAD.md)**: Server VAD tuning and mid-sentence user barge-in handling.
- **[Live-Tool-Execution.md](./Live-Tool-Execution.md)**: Realtime function calling during live voice sessions.
- **[Best-Practices.md](./Best-Practices.md)**: Production voice agent deployment guidelines.
