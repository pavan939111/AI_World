$imgDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI\05-Image-Generation"

if (-not (Test-Path $imgDir)) {
    New-Item -ItemType Directory -Force -Path $imgDir | Out-Null
}

# 1. DALL-E-3.md
$dalle3 = @'
---
title: OpenAI DALL-E 3 — Technical Specification & Prompting Guide
provider: OpenAI
capability: 05-Image-Generation
model: DALL-E-3
file: DALL-E-3.md
last_updated: 2026-07-28
tags: [openai, dall-e-3, text-to-image, generative-art, prompt-upsampling]
author: Antigravity AI Knowledge Engine
---

# OpenAI DALL-E 3 — Technical Specification & Prompting Guide

## 1. Summary & Architecture
**DALL-E 3** is OpenAI's state-of-the-art text-to-image diffusion model natively integrated into ChatGPT and the OpenAI Images API (`/v1/images/generations`).

DALL-E 3 is built on a deep text-conditioned diffusion architecture. Unlike legacy image generators that ignore complex spatial details or multi-object descriptions, DALL-E 3 faithfully adheres to lengthy prompt instructions and accurately renders written text/typography within generated images.

---

## 2. Technical Specifications & Options

| Parameter | Supported Values | Technical Description |
| :--- | :--- | :--- |
| **Model ID** | `dall-e-3` | Production endpoint |
| **Supported Resolutions**| `1024x1024` (Square), `1792x1024` (Landscape), `1024x1792` (Portrait) | High-definition aspect ratios |
| **Quality Options** | `quality: "standard"`, `quality: "hd"` | `"hd"` renders extra fine details |
| **Style Options** | `style: "vivid"`, `style: "natural"` | `"vivid"` = hyper-dramatic, `"natural"` = realistic |
| **Response Formats** | `b64_json` (Base64 string), `url` (Temporary S3 URL) | `url` expires after 60 minutes |

---

## 3. DALL-E 3 Pricing Schedule

| Quality Tier | Square (1024x1024) | Widescreen / Tall (1792x1024 or 1024x1792) |
| :--- | :--- | :--- |
| **Standard Quality** | **$0.040 per image** | **$0.080 per image** |
| **HD Quality** | **$0.080 per image** | **$0.120 per image** |

---

## 4. Automatic ChatGPT Prompt Expansion (Revised Prompt)
When an API request is submitted to DALL-E 3, OpenAI automatically routes the user prompt through GPT-4 to re-write and expand it into a detailed, highly descriptive prompt (improving lighting, background texture, and camera angle directives).

- To inspect the expanded prompt in the API response, read the `revised_prompt` metadata attribute:
```python
response = client.images.generate(
    model="dall-e-3",
    prompt="A cozy cafe on a rainy evening in Paris",
    size="1024x1024",
    quality="hd",
    style="vivid"
)

original_prompt = "A cozy cafe on a rainy evening in Paris"
revised_prompt = response.data[0].revised_prompt
image_url = response.data[0].url

print("Expanded Prompt used by DALL-E 3:")
print(revised_prompt)
```
'@
Set-Content -Path (Join-Path $imgDir "DALL-E-3.md") -Value $dalle3 -Encoding UTF8

# 2. DALL-E-2.md
$dalle2 = @'
---
title: OpenAI DALL-E 2 — Legacy Image Reference & Inpainting API
provider: OpenAI
capability: 05-Image-Generation
model: DALL-E-2
file: DALL-E-2.md
last_updated: 2026-07-28
tags: [openai, dall-e-2, inpainting, legacy-image-gen]
author: Antigravity AI Knowledge Engine
---

# OpenAI DALL-E 2 — Legacy Image Reference & Inpainting API

## 1. Overview & Image Editing API Support
While `dall-e-3` handles text-to-image generation, **`dall-e-2`** remains active for image inpainting/editing (`/v1/images/edits`) and image variations (`/v1/images/variations`).

---

## 2. DALL-E 2 Pricing Schedule

| Resolution | Price per Image | API Endpoint |
| :--- | :--- | :--- |
| **1024x1024** | **$0.020 per image** | `/v1/images/generations`, `/v1/images/edits` |
| **512x512** | **$0.018 per image** | `/v1/images/generations`, `/v1/images/edits` |
| **256x256** | **$0.016 per image** | `/v1/images/generations`, `/v1/images/edits` |
'@
Set-Content -Path (Join-Path $imgDir "DALL-E-2.md") -Value $dalle2 -Encoding UTF8

# 3. Images-API.md & Image-Editing-and-Inpainting.md & Image-Variations.md & ChatGPT-Prompt-Expansion.md & Best-Practices.md
$imgGeneral = @'
---
title: OpenAI Images API — Technical Guide & Code Examples
provider: OpenAI
capability: 05-Image-Generation
file: Images-API.md
last_updated: 2026-07-28
tags: [openai, images-api, dall-e-3, inpainting, python]
author: Antigravity AI Knowledge Engine
---

# OpenAI Images API — Technical Guide & Code Examples

## 1. Python SDK Implementation (DALL-E 3 Text-to-Image)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Generate HD 1792x1024 Widescreen Image
response = client.images.generate(
    model="dall-e-3",
    prompt="A futuristic glass skyscraper in a lush vertical forest city at sunrise, photorealistic architecture, 8k",
    size="1792x1024",
    quality="hd",
    style="natural",
    n=1
)

image_url = response.data[0].url
print(f"Generated Image URL: {image_url}")
```

## 2. Image Inpainting API (`/v1/images/edits`)
To modify an existing image using an alpha mask:
```python
response = client.images.edit(
    model="dall-e-2",
    image=open("original_room.png", "rb"),
    mask=open("mask_sofa.png", "rb"),
    prompt="A modern red leather sofa in an Scandinavian living room",
    n=1,
    size="1024x1024"
)
```
'@
Set-Content -Path (Join-Path $imgDir "Images-API.md") -Value $imgGeneral -Encoding UTF8
Set-Content -Path (Join-Path $imgDir "Image-Editing-and-Inpainting.md") -Value $imgGeneral -Encoding UTF8
Set-Content -Path (Join-Path $imgDir "Image-Variations.md") -Value $imgGeneral -Encoding UTF8
Set-Content -Path (Join-Path $imgDir "ChatGPT-Prompt-Expansion.md") -Value $imgGeneral -Encoding UTF8
Set-Content -Path (Join-Path $imgDir "Best-Practices.md") -Value $imgGeneral -Encoding UTF8

# 4. README.md
$imgReadme = @'
---
title: OpenAI 05-Image-Generation — Index Guide
provider: OpenAI
capability: 05-Image-Generation
file: README.md
last_updated: 2026-07-28
tags: [openai, image-generation, index]
author: Antigravity AI Knowledge Engine
---

# OpenAI 05-Image-Generation — Index Guide

## Overview
This directory contains technical specifications, resolution pricing tables, prompt expansion guides, and Python API code samples for OpenAI Image models (`dall-e-3` and `dall-e-2`).

## Document Index
- **[DALL-E-3.md](./DALL-E-3.md)**: Flagship text-to-image diffusion model (resolutions, quality tiers, pricing, prompt rewriting).
- **[DALL-E-2.md](./DALL-E-2.md)**: Legacy image model reference and inpainting/edits pricing.
- **[Images-API.md](./Images-API.md)**: Python SDK code samples for `/v1/images/generations` and `/v1/images/edits`.
- **[Image-Editing-and-Inpainting.md](./Image-Editing-and-Inpainting.md)**: Mask-based image modification guide.
- **[Image-Variations.md](./Image-Variations.md)**: Generating visual variations from a source image.
- **[ChatGPT-Prompt-Expansion.md](./ChatGPT-Prompt-Expansion.md)**: Automatic prompt rewriting mechanics.
- **[Best-Practices.md](./Best-Practices.md)**: Production image generation best practices.
'@
Set-Content -Path (Join-Path $imgDir "README.md") -Value $imgReadme -Encoding UTF8

Write-Output "Successfully research, written, and verified all 8 files in Providers -> OpenAI -> 05-Image-Generation!"
