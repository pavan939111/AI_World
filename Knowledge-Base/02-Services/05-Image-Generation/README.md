---
title: AI Service — 05-Image-Generation Complete Master Reference
service: 05-Image-Generation
view: By Service
last_updated: 2026-07-28
tags: [image-generation, ai-service, flux, dall-e-3, midjourney, imagen-3, ideogram, recraft, sd3, sdxl]
author: Antigravity AI Knowledge Engine
---

# AI Service — 05-Image-Generation: Master Technical Specification & Encyclopedia

Welcome to the **05-Image-Generation Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, prompt engineering handbook, and production architectural guide for text-to-image, image-to-image, and generative vision models.

---

# 📁 Service Folder Structure & Taxonomy

```text
05-Image-Generation/
├── 00-Overview/                            # What is Image Generation, History, Evolution, Pipeline, Terminology, FAQ
├── 01-Fundamentals/                        # Diffusion Models, Transformers, Latent Space, Text Encoders, Sampling, Guidance Scale, Aspect Ratios
├── 02-Providers/                           # OpenAI, Google, Black Forest Labs, Ideogram, Midjourney, Recraft, Stability AI, Adobe, Runway, Others
├── 03-Models/                              # Deep-Dive Specs for DALL-E-3, Imagen-3, FLUX-1, Ideogram-v2, Midjourney-v6, Recraft-v3, SD3, SDXL
│   ├── DALL-E-3/                           # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
│   ├── Imagen-3/                           # (10 Deep-Dive Spec Files)
│   ├── FLUX-1/                             # (10 Deep-Dive Spec Files)
│   ├── Ideogram-v2/                        # (10 Deep-Dive Spec Files)
│   ├── Midjourney-v6/                      # (10 Deep-Dive Spec Files)
│   ├── Recraft-v3/                         # (10 Deep-Dive Spec Files)
│   ├── Stable-Diffusion-3/                 # (10 Deep-Dive Spec Files)
│   └── SDXL/                               # (10 Deep-Dive Spec Files)
├── 04-Tasks/                               # Text-to-Image, Image-to-Image, Editing, Inpainting, Outpainting, Upscaling, Product Photos, Logos, UI Design
├── 05-API/                                 # REST APIs, SDKs, Auth, Request Formats, Response Formats, Streaming, Rate Limits, Pricing, Error Handling
├── 06-Prompt-Engineering/                  # Basics, Structure, Subject, Camera, Lighting, Style, Composition, Colors, Negative Prompts, Templates, Mistakes
├── 07-Quality/                             # Resolution, Aspect Ratio, Image Quality, Color Accuracy, Typography, Hands, Faces, Benchmarks
├── 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best API, Best Typography, Best Realism, Decision Matrix
├── 09-Use-Cases/                           # Marketing, Social Media, E-commerce, Branding, UI/UX, Game Assets, Architecture, Fashion
├── 10-Open-Source/                         # Stable Diffusion, FLUX Dev, ComfyUI, Automatic1111, Forge, InvokeAI, SwarmUI
├── 11-Production/                          # Scaling, Caching, Cost Optimization, Safety, Moderation, Watermarking, Storage, CDN
├── 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
├── 13-Benchmarks/                          # Quality, Speed, Cost, Human Preference, Leaderboards
├── 14-Learning-Resources/                  # Official Docs, Research Papers, Blogs, Videos, Courses
└── 15-Glossary/                            # Terms, Acronyms, References
```

---

# 🎯 Model Comparison & Decision Matrix Snapshot

| Model | Provider | Primary Strength | Best For | API Price Rate | Free Tier / Open Weights |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **FLUX.1 [schnell]** | Black Forest Labs | Ultra-fast 1-4 step generation & SOTA photorealism | High-speed production APIs & local GPUs | **$0.003 / image** | **Open-Weights (Apache 2.0)** |
| **FLUX.1 [pro]** | Black Forest Labs | SOTA prompt adherence & human anatomy | Enterprise quality & commercial design | **$0.050 / image** | API Only |
| **Ideogram v2** | Ideogram | #1 Legible typography & vector graphic design | Logos, poster design, graphic text | **$0.080 / image** | 10 Free credits/day |
| **Recraft v3** | Recraft | Native SVG vector export & brand style consistency | UI design, icons, brand design systems | **$0.040 / image** | 50 Free credits/day |
| **Midjourney v6.1** | Midjourney | Cinematic aesthetics & photorealistic portraiture | High-end visual art & editorial photography | **$10 - $60 / mo** | Web / Discord Subscription |
| **DALL-E 3** | OpenAI | ChatGPT conversational prompt rewriting | Everyday image creation & prompt simplicity | **$0.040 / image** | ChatGPT Free / Plus |
| **Imagen 3** | Google AI | Exceptional photorealism & safety moderation | Enterprise GCP integration & marketing | **$0.030 / image** | Vertex AI / Gemini Free |
| **Stable Diffusion 3.5** | Stability AI | Open weights customizable via LoRA fine-tuning | Custom local GPU workflows & game assets | Self-Hosted GPU | **Open-Weights (Community)** |

---

# 🚀 Quick Start Example: Generating Images via FLUX.1 API

```python
import os
import requests

# Call FLUX.1 [schnell] via Replicate API
api_url = "https://api.replicate.com/v1/predictions"
headers = {
    "Authorization": f"Token {os.environ.get('REPLICATE_API_TOKEN')}",
    "Content-Type": "application/json"
}
payload = {
    "version": "black-forest-labs/flux-schnell",
    "input": {
        "prompt": "A modern minimalist living room with floor-to-ceiling windows overlooking a rainy Tokyo skyline at night, warm interior lighting, photorealistic, 8k resolution",
        "aspect_ratio": "16:9"
    }
}

response = requests.post(api_url, headers=headers, json=payload)
print("Prediction Status:", response.json().get("status"))
```

---

# 📚 Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for history and pipeline terminology.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for diffusion and DiT architecture math.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on DALL-E 3, FLUX, Imagen, Midjourney, Ideogram, and Recraft.
- Explore **[06-Prompt-Engineering](./06-Prompt-Engineering/README.md)** for camera, lighting, and composition prompting guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for complete decision matrices (Best Free, Best Paid, Fastest, Cheapest).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for ComfyUI, Automatic1111, and local GPU deployment.
