---
title: Luma AI — Complete Technical Specification & Provider Reference
provider: Luma AI
view: By Provider
last_updated: 2026-07-28
tags: [luma-ai, dream-machine, genie, photon, 3d-gaussian-splatting, nerf, video-generation]
author: Antigravity AI Documentation Engine
---

# Luma AI — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Luma AI (Luma Labs Inc.)
- **Parent Company**: Luma Labs Inc.
- **Founders**: Amit Jain (CEO, former Apple computer vision lead), Alex Yu (CTO, UC Berkeley vision researcher)
- **Headquarters**: San Francisco, California, USA
- **Year Founded**: 2021
- **Mission**: To build multimodal AI foundation models that bring human creativity into 3D spatial intelligence and high-motion generative video.
- **Valuation & Funding**: $1 Billion+ unicorn valuation following $43M Series B funding round led by Andreessen Horowitz (a16z), Matrix Partners, and Amplify Partners.
- **AI Ecosystem**: Full-stack 3D and video generative AI suite providing Dream Machine 1.6 (high-motion 1080p video synthesis), Photon & Photon Flash image generation, Genie 2.0 (text-to-3D asset generator exporting OBJ/GLTF/USDZ meshes), NeRF & 3D Gaussian Splatting interactive scan capture engine, 3D Camera Controls, and official REST API (`api.lumalabs.ai/v1`).
- **Timeline & Major Milestones**:
  - **2021**: Founded in SF by Amit Jain and Alex Yu to pioneer Neural Radiance Fields (NeRF).
  - **2022**: Released Luma mobile app enabling NeRF 3D spatial captures on iPhone.
  - **November 2023**: Launched Genie 1.0 — the world's first fast text-to-3D asset generator.
  - **June 2024**: Released Dream Machine 1.0 delivering unprecedented high-motion fluid physics in video generation.
  - **August 2024**: Launched Dream Machine 1.5, Photon image model, and official Developer API (`api.lumalabs.ai`).
  - **November 2024**: Released Dream Machine 1.6 and Genie 2.0.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Generative Video** | High-motion 1080p video generation with realistic fluid physics | Yes | Dream Machine 1.6, Dream Machine 1.5 | Active |
| **Photon Image Gen** | High-speed photorealistic image generation | Yes | Photon, Photon Flash | Active |
| **Text-to-3D Assets (Genie)** | Text-to-3D textured mesh generation exporting OBJ, GLTF, USDZ | Yes | Genie 2.0, Genie 1.0 | Active |
| **3D Gaussian Splatting** | Interactive 3D spatial scan capture & WebGL splat rendering | Yes | Luma Captures API | Active |
| **3D Camera Control** | Camera motion paths (Orbit, Crane, Push In, Pull Out, Pan) | Yes | Dream Machine Camera API | Active |
| **Frame Keyframing** | Conditioning video synthesis on First Frame and Last Frame images | Yes | Dream Machine Keyframe API | Active |

---

# 3. Dream Machine & Genie Models

### Model: Dream Machine 1.6
- **Name**: Dream Machine 1.6 (`dream-machine-1.6`)
- **Release Date**: November 2024
- **Output Resolution**: 1080p Full HD (1920x1080)
- **Services Provided by the Model**:
  - **SOTA High-Motion Physics**: Realistic camera tracking, liquid dynamics, explosion physics, and human action movement.
  - **Keyframe Conditioning**: Seamless video interpolation between First Frame and Last Frame input images.
- **Pricing**: $0.320 / generated video clip (5s duration)

### Model: Genie 2.0 (Text-to-3D)
- **Name**: Genie 2.0 (`genie-2.0`)
- **Services Provided by the Model**:
  - **Text-to-3D Mesh Generation**: Generating fully textured 3D game-ready meshes in OBJ, GLTF, and USDZ formats in <10 seconds.

---

# 4. Code Example (Official `lumaai` Python SDK)

```python
import os
import time
from lumaai import LumaAI

# Initialize Luma AI Client
client = LumaAI(api_key=os.environ.get("LUMA_API_KEY"))

# Create Dream Machine Video Generation Task
generation = client.generations.create(
    prompt="A futuristic sports car drifting around a sharp mountain turn, cinematic camera tracking",
    aspect_ratio="16:9",
    loop=False
)

print(f"Generation Task Created! ID: {generation.id}")

# Poll task status until complete
while generation.state not in ["completed", "failed"]:
    time.sleep(5)
    generation = client.generations.get(id=generation.id)
    print(f"Status: {generation.state}")

if generation.state == "completed":
    print(f"Video Generated! Download URL: {generation.assets.video}")
```

---

# 5. Pricing Summary

| Plan Tier / API | Monthly Price / Rate | Quota Included |
| :--- | :--- | :--- |
| **Free Tier** | $0 | 30 generations / month |
| **Standard Plan** | $29.99 / month | 120 generations / month |
| **Pro Plan** | $99.99 / month | 400 generations / month |
| **Premier Plan** | $499.99 / month | 2,000 generations / month |
| **Dream Machine API** | **$0.32 / video** | Pay-as-you-go API credit |
| **Photon Flash API** | **$0.005 / image** | Pay-as-you-go API credit |

---

# 6. Official References

- Official Luma AI API Documentation: [lumalabs.ai/dream-machine/api](https://lumalabs.ai/dream-machine/api)
- Luma Web Creation Platform: [lumalabs.ai/dream-machine](https://lumalabs.ai/dream-machine)
- Official Website: [lumalabs.ai](https://lumalabs.ai)
