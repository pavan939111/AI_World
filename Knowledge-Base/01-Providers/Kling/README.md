---
title: Kling AI — Complete Technical Specification & Provider Reference
provider: Kling AI
view: By Provider
last_updated: 2026-07-28
tags: [kling-ai, kling-1-5, virtual-try-on, video-generation, 60fps, avatar, kuaishou]
author: Antigravity AI Documentation Engine
---

# Kling AI — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Kling AI (Kuaishou Technology AI Lab)
- **Parent Company**: Kuaishou Technology (HKEX: 1024)
- **Founders**: Su Hua & Cheng Yixiao (Founders of Kuaishou Technology); AI research led by Kuaishou AI Lab in Beijing, China
- **Headquarters**: Beijing, China (Global platform operated out of Singapore & Hong Kong)
- **Year Founded**: 2011 (Kuaishou), June 2024 (Kling AI model launch)
- **Mission**: To power global digital content creation with high-motion, long-duration 1080p 60fps generative video foundation models.
- **Market Capitalization**: $25 Billion+ (Kuaishou Technology)
- **AI Ecosystem**: Full-stack generative video platform providing Kling 1.5 (1080p 60fps video generation up to 3 minutes extended duration), Kolors Virtual Try-On API (E-commerce fashion garment fitting), AI Avatar talking head generator, Lip Sync video alignment, Motion Brush directional controls, and official REST API (`api.klingai.com/v1`).
- **Timeline & Major Milestones**:
  - **June 2024**: Released Kling 1.0 globally, surprising the industry by offering 1080p video generation up to 2 minutes in duration.
  - **July 2024**: Launched global Web platform (`klingai.com`).
  - **September 2024**: Released Kling 1.5 with enhanced motion physics, 60fps smoothness, and Kolors Virtual Try-On API.
  - **October 2024**: Released official Developer API with JWT authentication (`api.klingai.com`).

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Generative Video** | 1080p 60fps video generation from text/image inputs, extendable to 3 mins | Yes | Kling 1.5, Kling 1.0 | Active |
| **Virtual Try-On** | Mapping clothing garments onto human fashion models for E-commerce | Yes | Kolors Virtual Try-On (`/v1/images/kolors-virtual-try-on`) | Active |
| **AI Avatar & Lip Sync** | Generating talking head avatar videos with mouth-sync to audio | Yes | AI Avatar Engine | Active |
| **Motion Brush Control** | Painting directional motion vectors onto specific image elements | Yes | Motion Brush | Active |
| **3D Camera Control** | Horizontal Pan, Vertical Tilt, Zoom In/Out 3D camera controls | Yes | Camera Controls API | Active |
| **Text-to-Image** | High-resolution text-to-image synthesis | Yes | Kling Image Generator | Active |

---

# 3. Generative Video & Virtual Try-On Models

### Model: Kling 1.5
- **Name**: Kling 1.5 (`kling-v1-5`)
- **Release Date**: September 2024
- **Output Resolution**: 1080p Full HD (1920x1080) at **60 fps**
- **Clip Durations**: 5s or 10s base clip (extendable up to 3 minutes)
- **Services Provided by the Model**:
  - **3D Spatio-Temporal Joint Attention**: Unmatched high-motion fluid physics and multi-object motion collision.
  - **Extended Video Continuation**: Stitching multiple turns to generate full 3-minute continuous scenes.
- **Pricing**: Pay-as-you-go per video second

### Model: Kolors Virtual Try-On
- **Name**: Kolors Virtual Try-On (`kolors-virtual-try-on`)
- **Services Provided by the Model**:
  - **E-Commerce Fashion Fitting**: Takes a garment photo and a target human model photo, outputting realistic photorealistic fitting imagery with fold texture and lighting retention.

---

# 4. Code Example (Python API with JWT Authentication)

```python
import os
import time
import jwt
import requests

# Step 1: Generate HS256 Signed JWT Token
access_key = os.environ.get("KLING_ACCESS_KEY")
secret_key = os.environ.get("KLING_SECRET_KEY")

headers_jwt = {"alg": "HS256", "typ": "JWT"}
payload = {
    "iss": access_key,
    "exp": int(time.time()) + 1800,
    "nbf": int(time.time()) - 5
}
token = jwt.encode(payload, secret_key, algorithm="HS256", headers=headers_jwt)

# Step 2: Call Text-to-Video API
url = "https://api.klingai.com/v1/videos/text2video"
headers = {
    "Authorization": f"Bearer {token}",
    "Content-Type": "application/json"
}
body = {
    "model": "kling-v1-5",
    "prompt": "A cinematic close-up of a futuristic robot opening its eyes, 1080p, 60fps",
    "duration": "5"
}

response = requests.post(url, headers=headers, json=body)
print(response.json())
```

---

# 5. Pricing Summary

| Plan Tier / API | Pricing | Features Included |
| :--- | :--- | :--- |
| **Free Tier** | $0 | 66 daily credits |
| **Standard Plan** | $8.99 / month | 660 monthly credits + Watermark-free |
| **Pro Plan** | $32.99 / month | 3,000 monthly credits + High-speed queue |
| **Premier Plan** | $92.99 / month | 8,000 monthly credits + Professional API access |
| **Kling API** | Pay-as-you-go | Charged per video second generated |

---

# 6. Official References

- Official Kling AI API Documentation: [klingai.com/global/api-documentation](https://klingai.com/global/api-documentation)
- Kling Web Platform: [klingai.com](https://klingai.com)
