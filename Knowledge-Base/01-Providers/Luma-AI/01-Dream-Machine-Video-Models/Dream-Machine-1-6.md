---
title: Luma AI â€” Dream-Machine-1-6 Specification
provider: Luma AI
capability: 01-Dream-Machine-Video-Models
file: Dream-Machine-1-6.md
last_updated: 2026-07-28
tags: [luma-ai, dream-machine, 01-dream-machine-video-models, dream-machine-1-6]
author: Antigravity AI Documentation Engine
---

# Luma AI â€” Dream-Machine-1-6

## Overview
Detailed technical specification for **Dream-Machine-1-6** under **01-Dream-Machine-Video-Models**.

## Model & Feature Specifications
- **Model Family**: Luma AI Multimodal 3D & Video Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text Prompts, Images (Keyframes), Smartphone Videos (NeRF Scans)
- **Supported Output Modalities**: MP4 Video (1080p, 5s duration), 3D Textured Meshes (OBJ/GLTF/USDZ), Interactive 3D Splats
- **Pricing**: Dream Machine API ($0.32 / video) | Photon Flash ($0.005 / image)
- **API Availability**: Official Luma API (pi.lumalabs.ai/v1), Official lumaai Python / TypeScript SDKs
- **3D Camera Control**: Orbit, Crane, Push In, Pull Out, Pan Left/Right
- **Keyframe Control**: First Frame & Last Frame image conditioning

## Typical Use Cases
1. Production 1080p video generation for film and advertising.
2. Rapid game asset generation using Genie 2.0 text-to-3D exported to Unreal Engine / Unity.

## Strengths & Limitations
- **Strengths**: Industry SOTA high-motion fluid character physics, native text-to-3D mesh generation (Genie), 3D Gaussian Splatting interactive scene captures.
- **Limitations**: Video clip durations generated per API call capped at 5 seconds.

## Example Request (Official Python SDK)
`python
import os
import time
from lumaai import LumaAI

client = LumaAI(api_key=os.environ.get("LUMA_API_KEY"))

# Create Dream Machine Video Task
generation = client.generations.create(
    prompt="A futuristic sports car drifting around a sharp mountain turn, cinematic camera tracking",
    aspect_ratio="16:9",
    loop=False
)

print(f"Generation Launched! ID: {generation.id}")

# Poll Status
while generation.state not in ["completed", "failed"]:
    time.sleep(5)
    generation = client.generations.get(id=generation.id)
    print(f"Status: {generation.state}")

if generation.state == "completed":
    print(f"Video Generated! Download URL: {generation.assets.video}")
`

## Related Documentation & Models
- See official Luma AI documentation at https://lumalabs.ai/dream-machine/api
