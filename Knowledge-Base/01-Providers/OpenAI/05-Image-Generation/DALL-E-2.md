---
title: OpenAI DALL-E 2 â€” Legacy Image Reference & Inpainting API
provider: OpenAI
capability: 05-Image-Generation
model: DALL-E-2
file: DALL-E-2.md
last_updated: 2026-07-28
tags: [openai, dall-e-2, inpainting, legacy-image-gen]
author: Antigravity AI Knowledge Engine
---

# OpenAI DALL-E 2 â€” Legacy Image Reference & Inpainting API

## 1. Overview & Image Editing API Support
While `dall-e-3` handles text-to-image generation, **`dall-e-2`** remains active for image inpainting/editing (`/v1/images/edits`) and image variations (`/v1/images/variations`).

---

## 2. DALL-E 2 Pricing Schedule

| Resolution | Price per Image | API Endpoint |
| :--- | :--- | :--- |
| **1024x1024** | **$0.020 per image** | `/v1/images/generations`, `/v1/images/edits` |
| **512x512** | **$0.018 per image** | `/v1/images/generations`, `/v1/images/edits` |
| **256x256** | **$0.016 per image** | `/v1/images/generations`, `/v1/images/edits` |
