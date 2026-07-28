---
title: Runway â€” Voice-Generation Specification
provider: Runway
capability: 06-Audio-and-Voice-Synthesis
file: Voice-Generation.md
last_updated: 2026-07-28
tags: [runway, gen-3-alpha, 06-audio-and-voice-synthesis, voice-generation]
author: Antigravity AI Documentation Engine
---

# Runway â€” Voice-Generation

## Overview
Detailed technical specification for **Voice-Generation** under **06-Audio-and-Voice-Synthesis**.

## Model & Feature Specifications
- **Model Family**: Runway Gen-3 Alpha Generative Video Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text Prompts, Images (First/Last Frame Keyframes), Driving Video (Act-One)
- **Supported Output Modalities**: MP4 Video (1080p, 5s or 10s duration)
- **Pricing**: Gen-3 Alpha Turbo API ($0.05 / second generated, e.g. $0.25 for 5s, $0.50 for 10s)
- **API Availability**: Official Runway API (pi.dev.runwayml.com/v1), Python SDK (@runwayml/sdk), Web App
- **Camera Controls**: Pan, Tilt, Zoom, Roll, Motion Brush
- **Lip Sync**: Supported via API & Web

## Typical Use Cases
1. Commercial 1080p video generation with precise camera motion.
2. Character performance animation driven by webcam video via Act-One.

## Strengths & Limitations
- **Strengths**: Industry SOTA temporal video consistency, Act-One facial performance capture, 3D camera controls, fast inference (Gen-3 Alpha Turbo).
- **Limitations**: Max clip duration capped at 10 seconds per API call.

## Example Request (Official Python SDK)
`python
import os
import time
from runwayml import RunwayML

client = RunwayML(api_key=os.environ.get("RUNWAYML_API_SECRET"))

# Create Image-to-Video Task
task = client.image_to_video.create(
    model="gen3a_turbo",
    prompt_image="https://example.com/character.jpg",
    prompt_text="A cinematic camera pan right across a futuristic sci-fi city",
    duration=5,
    ratio="16:9"
)

print(f"Task Launched! Task ID: {task.id}")

# Poll Task Status
while task.status not in ["SUCCEEDED", "FAILED"]:
    time.sleep(10)
    task = client.tasks.retrieve(task.id)
    print(f"Task Status: {task.status}")

if task.status == "SUCCEEDED":
    print(f"Video Generated Successfully! URL: {task.output[0]}")
`

## Related Documentation & Models
- See official Runway documentation at https://docs.dev.runwayml.com
