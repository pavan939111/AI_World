---
title: OpenAI DALL-E 3 â€” Technical Specification & Prompting Guide
provider: OpenAI
capability: 05-Image-Generation
model: DALL-E-3
file: DALL-E-3.md
last_updated: 2026-07-28
tags: [openai, dall-e-3, text-to-image, generative-art, prompt-upsampling]
author: Antigravity AI Knowledge Engine
---

# OpenAI DALL-E 3 â€” Technical Specification & Prompting Guide

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
