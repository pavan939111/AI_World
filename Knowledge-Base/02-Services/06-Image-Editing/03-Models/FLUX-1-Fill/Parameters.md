---
title: FLUX-1-Fill â€” Parameters
service: 06-Image-Editing
model: FLUX-1-Fill
section: 03-Models
file: Parameters.md
last_updated: 2026-07-28
tags: [image-editing, flux-1-fill, parameters]
author: Antigravity AI Knowledge Engine
---

# FLUX-1-Fill â€” Parameters

## Model Specification: FLUX-1-Fill
- **Model Name**: FLUX-1-Fill
- **Primary Developer / Provider**: SOTA Generative Vision AI Provider
- **Model Family**: Image Editing & Inpainting Series
- **Architecture**: Inpainting Diffusion / Flow Matching / Structural ControlNet
- **Input Requirements**: Source Image + Mask Image + Text Prompt
- **API Availability**: REST API, Python SDK, Web Interface, Open-Weights (FLUX Fill / ControlNet)

## Parameters Detailed Breakdown

### Key Specifications & Features
- **Inpainting Seamlessness**: Zero visible seam artifacts at mask boundaries.
- **Lighting & Reflection Retention**: Matches source image environmental reflections and shadows.
- **Outpainting Canvas Expansion**: Generative background extension up to 2x canvas width/height.

### Technical Performance Analysis
1. **Strengths**: SOTA object insertion/replacement, precise edge alignment, retention of unmasked pixels.
2. **Weaknesses**: Requires accurate mask generation for optimal results.
3. **Best Use Cases**: E-commerce catalog background replacement, virtual staging, graphic retouching, photo object removal.

## Code Example (FLUX-1-Fill Request)
`python
import os
import requests

api_url = "https://api.provider.ai/v1/images/edits"
headers = {
    "Authorization": f"Bearer {os.environ.get('API_KEY')}"
}

files = {
    "image": open("base_photo.png", "rb"),
    "mask": open("edit_mask.png", "rb")
}
data = {
    "model": "flux-1-fill",
    "prompt": "Replace yellow armchair with a modern grey velvet armchair, photorealistic"
}

response = requests.post(api_url, headers=headers, files=files, data=data)
print(response.json())
`

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
