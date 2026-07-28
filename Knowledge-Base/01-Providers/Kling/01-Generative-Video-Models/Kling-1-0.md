---
title: Kling AI â€” Kling-1-0 Specification
provider: Kling AI
capability: 01-Generative-Video-Models
file: Kling-1-0.md
last_updated: 2026-07-28
tags: [kling-ai, kling-1-5, 01-generative-video-models, kling-1-0]
author: Antigravity AI Documentation Engine
---

# Kling AI â€” Kling-1-0

## Overview
Detailed technical specification for **Kling-1-0** under **01-Generative-Video-Models**.

## Model & Feature Specifications
- **Model Family**: Kling AI Generative Video & Vision Series (Kuaishou Technology)
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text Prompts, Images (Keyframes), Garment Images (Virtual Try-On), Audio (Lip Sync)
- **Supported Output Modalities**: MP4 Video (1080p 60fps, 5s to 10s, extendable to 3 mins), PNG Images
- **Authentication**: JWT Bearer Tokens (HS256 signed using Access-Key and Secret-Key)
- **API Availability**: Official Kling API (pi.klingai.com/v1)
- **Virtual Try-On**: Supported (/v1/images/kolors-virtual-try-on)
- **Camera Controls**: Pan, Tilt, Zoom, Motion Brush

## Typical Use Cases
1. Commercial 1080p 60fps video generation with extended clip durations.
2. E-commerce automated apparel Virtual Try-On mapping clothing onto models.

## Strengths & Limitations
- **Strengths**: 60fps ultra-smooth video motion, extended clip generation up to 3 minutes, specialized Virtual Try-On API for E-commerce.
- **Limitations**: Requires custom HS256 JWT token generation header for API authentication.

## Example Request (Python REST API with JWT)
`python
import time
import jwt
import requests
import os

# Generate JWT Token for Kling API
access_key = os.environ.get("KLING_ACCESS_KEY")
secret_key = os.environ.get("KLING_SECRET_KEY")

headers_jwt = {
    "alg": "HS256",
    "typ": "JWT"
}
payload = {
    "iss": access_key,
    "exp": int(time.time()) + 1800,
    "nbf": int(time.time()) - 5
}
token = jwt.encode(payload, secret_key, algorithm="HS256", headers=headers_jwt)

# Create Video Task
url = "https://api.klingai.com/v1/videos/text2video"
headers = {
    "Authorization": f"Bearer {token}",
    "Content-Type": "application/json"
}
body = {
    "model": "kling-v1-5",
    "prompt": "A cinematic shot of a lion running through the savanna at sunset, 60fps",
    "duration": "5"
}

response = requests.post(url, headers=headers, json=body)
print(response.json())
`

## Related Documentation & Models
- See official Kling AI documentation at https://klingai.com/global/api-documentation
