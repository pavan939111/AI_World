---
title: Runway — Complete Technical Specification & Provider Reference
provider: Runway
view: By Provider
last_updated: 2026-07-28
tags: [runway, gen-3-alpha, gen-3-alpha-turbo, act-one, video-generation, motion-brush]
author: Antigravity AI Documentation Engine
---

# Runway — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Runway AI, Inc.
- **Parent Company**: Runway AI, Inc.
- **Founders**: Cristóbal Valenzuela (CEO), Anastasis Germanidis (CTO), Alejandro Matamala (Design Director)
- **Headquarters**: New York, NY, USA
- **Year Founded**: 2018
- **Mission**: To build multimodal AI systems and World Models that power the next era of human art and storytelling.
- **Valuation & Funding**: $1.5 Billion+ valuation following $141M Series C extension funding round backed by Google, NVIDIA, and Salesforce Ventures.
- **AI Ecosystem**: Comprehensive generative video platform providing Gen-3 Alpha (1080p photorealistic video synthesis), Gen-3 Alpha Turbo (7x faster inference), Act-One facial performance capture, Motion Brush vector motion control, 3D Camera Controls (Pan, Tilt, Zoom, Roll), Lip Sync video alignment, and official Runway API (`api.dev.runwayml.com/v1`).
- **Timeline & Major Milestones**:
  - **2018**: Founded in NYC by NYU Tisch ITP researchers Cristóbal Valenzuela, Anastasis Germanidis, and Alejandro Matamala.
  - **2022**: Co-created Stable Diffusion (v1.4) in collaboration with LMU Munich.
  - **February 2023**: Launched Gen-1 video-to-video diffusion model.
  - **March 2023**: Released Gen-2 text-to-video foundation model.
  - **June 2024**: Released Gen-3 Alpha setting world records for temporal video coherence and 1080p photorealism.
  - **August 2024**: Launched Gen-3 Alpha Turbo and official Developer API (`api.dev.runwayml.com`).
  - **October 2024**: Released Act-One facial performance capture.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Generative Video** | SOTA 1080p text-to-video and image-to-video synthesis | Yes | Gen-3 Alpha, Gen-3 Alpha Turbo | Active |
| **Act-One Performance Capture** | Driving 3D/2D animated character faces from webcam video inputs | Yes | Act-One Engine | Active |
| **Motion Brush Control** | Painting directional motion vectors onto specific image sub-regions | Yes | Motion Brush | Active |
| **3D Camera Control** | Precise camera movement (Pan, Tilt, Zoom, Roll, Truck) | Yes | Camera Controls API | Active |
| **Video-to-Video Stylization** | Motion-guided video transformations and visual style transfer | Yes | Gen-1 / Gen-3 Video-to-Video | Active |
| **Lip Sync Video Alignment** | Synchronizing character mouth movements with input audio tracks | Yes | Lip Sync Engine | Active |

---

# 3. Generative Video Models

### Model: Gen-3 Alpha
- **Name**: Gen-3 Alpha (`gen3a`)
- **Release Date**: June 2024
- **Output Resolution**: 1080p Full HD (1920x1080)
- **Clip Durations**: 5 seconds or 10 seconds
- **Services Provided by the Model**:
  - **High-Fidelity Temporal Coherence**: Flawless camera motion and human physical movements.
  - **Keyframe Conditioning**: Generating video starting from First Frame or ending at Last Frame input images.
- **Pricing**: $0.10 / second generated video ($1.00 per 10s clip)

### Model: Gen-3 Alpha Turbo
- **Name**: Gen-3 Alpha Turbo (`gen3a_turbo`)
- **Release Date**: August 2024
- **Services Provided by the Model**:
  - **7x Faster Inference Speed**: High-speed real-time video generation.
- **Pricing**: **$0.05 / second generated video** ($0.50 per 10s clip)

---

# 4. Code Example (Official `runwayml` Python SDK)

```python
import os
import time
from runwayml import RunwayML

# Initialize Runway Client
client = RunwayML(api_key=os.environ.get("RUNWAYML_API_SECRET"))

# Launch Image-to-Video Task
task = client.image_to_video.create(
    model="gen3a_turbo",
    prompt_image="https://example.com/input_keyframe.png",
    prompt_text="Cinematic camera pan right across a vibrant sci-fi metropolis at sunset",
    duration=5,
    ratio="16:9"
)

print(f"Task Launched! Task ID: {task.id}")

# Poll task status until complete
while task.status not in ["SUCCEEDED", "FAILED"]:
    time.sleep(10)
    task = client.tasks.retrieve(task.id)
    print(f"Task Status: {task.status}")

if task.status == "SUCCEEDED":
    print(f"Video Generated! Output URL: {task.output[0]}")
```

---

# 5. Pricing Summary

| Plan Tier / API | Pricing | Includes |
| :--- | :--- | :--- |
| **Standard Plan** | $12 / month | 625 credits / month |
| **Pro Plan** | $28 / month | 2,250 credits / month |
| **Unlimited Plan** | $76 / month | Unlimited Relax Mode video generation |
| **Gen-3 Alpha Turbo API** | **$0.05 / second** | $0.25 (5s) \| $0.50 (10s) |
| **Gen-3 Alpha API** | $0.10 / second | $0.50 (5s) \| $1.00 (10s) |

---

# 6. Official References

- Official Runway Developer API Docs: [docs.dev.runwayml.com](https://docs.dev.runwayml.com)
- Runway Web Application: [runwayml.com](https://runwayml.com)
