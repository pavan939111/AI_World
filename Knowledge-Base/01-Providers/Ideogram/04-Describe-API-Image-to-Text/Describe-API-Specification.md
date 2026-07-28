---
title: Ideogram â€” Describe-API-Specification Specification
provider: Ideogram
capability: 04-Describe-API-Image-to-Text
file: Describe-API-Specification.md
last_updated: 2026-07-28
tags: [ideogram, typography, 04-describe-api-image-to-text, describe-api-specification]
author: Antigravity AI Documentation Engine
---

# Ideogram â€” Describe-API-Specification

## Overview
Detailed technical specification for **Describe-API-Specification** under **04-Describe-API-Image-to-Text**.

## Model & Feature Specifications
- **Model Family**: Ideogram Generative Image & Typography Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text Prompts, Images (Describe / Remix / Edit)
- **Supported Output Modalities**: PNG / JPEG Images, Text Captions (Describe API)
- **Pricing**: Ideogram 2.0 ($0.08 / image) | Ideogram 2.0 Turbo ($0.05 / image) | Describe ($0.008 / image)
- **API Availability**: Ideogram REST API (pi.ideogram.ai)
- **Magic Prompt Modes**: AUTO, ON, OFF
- **Aesthetic Styles**: REALISTIC, DESIGN, 3D, ANIME, TYPOGRAPHY
- **Color Palette Control**: Supported via HEX code arrays

## Typical Use Cases
1. Commercial poster, t-shirt, and logo design with legibly rendered typography.
2. Automated reverse-image prompt extraction using the Describe API.

## Strengths & Limitations
- **Strengths**: #1 typography rendering accuracy in the industry, Magic Prompt engine, custom HEX color palette enforcement, Describe API.
- **Limitations**: API access requires pre-paid credit billing.

## Example Request (Python REST API)
`python
import requests
import json
import os

url = "https://api.ideogram.ai/generate"
headers = {
    "Api-Key": os.environ.get("IDEOGRAM_API_KEY"),
    "Content-Type": "application/json"
}

payload = {
    "image_request": {
        "prompt": "A retro neon sign reading 'IDEOGRAM 2.0'",
        "aspect_ratio": "ASPECT_16_9",
        "model": "V_2_0",
        "magic_prompt_option": "AUTO",
        "style_type": "DESIGN"
    }
}

response = requests.post(url, headers=headers, json=payload)
print(response.json())
`

## Related Documentation & Models
- See official Ideogram documentation at https://developer.ideogram.ai
