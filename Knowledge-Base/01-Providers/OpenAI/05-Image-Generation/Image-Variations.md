---
title: OpenAI Images API â€” Technical Guide & Code Examples
provider: OpenAI
capability: 05-Image-Generation
file: Images-API.md
last_updated: 2026-07-28
tags: [openai, images-api, dall-e-3, inpainting, python]
author: Antigravity AI Knowledge Engine
---

# OpenAI Images API â€” Technical Guide & Code Examples

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
