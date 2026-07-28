---
title: Ideogram — Complete Technical Specification & Provider Reference
provider: Ideogram
view: By Provider
last_updated: 2026-07-28
tags: [ideogram, ideogram-2-0, typography, image-generation, magic-prompt, describe-api]
author: Antigravity AI Documentation Engine
---

# Ideogram — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Ideogram Inc.
- **Parent Company**: Ideogram Inc.
- **Founders**: Mohammad Norouzi (CEO, former Google Brain senior research scientist), William Chan, Chitwan Saharia, Jonathan Ho (co-creators of Imagen and Latent Diffusion Models at Google Brain)
- **Headquarters**: Toronto, Ontario, Canada
- **Year Founded**: 2023
- **Mission**: To empower human creativity through state-of-the-art generative image foundation models that excel in typography and spatial design alignment.
- **Valuation & Funding**: $80 Million Series A funding round led by Andreessen Horowitz (a16z), with participation from Index Ventures, Redpoint Ventures, and SV Angel.
- **AI Ecosystem**: Full-stack generative image platform providing Ideogram 2.0, Ideogram 2.0 Turbo, Magic Prompt automatic prompt expansion engine, Describe API (image-to-text prompt reverse engineering), inpainting/re-mix editing, custom HEX color palette compliance, and official REST API (`api.ideogram.ai`).
- **Timeline & Major Milestones**:
  - **August 2023**: Founded in Toronto by former Google Brain diffusion researchers and released Ideogram 0.1.
  - **February 2024**: Announced $80M Series A led by Andreessen Horowitz and launched Ideogram 1.0.
  - **August 2024**: Released Ideogram 2.0 and Ideogram 2.0 Turbo setting new industry benchmarks for typography and graphic design.
  - **October 2024**: Released official Ideogram API (`api.ideogram.ai`) and Describe API.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Image Generation** | SOTA text-to-image synthesis with industry-leading typography | Yes | Ideogram 2.0, Ideogram 2.0 Turbo | Active |
| **Typography Rendering** | Legible multi-word font rendering inside signs, t-shirts, and logos | Yes | All Ideogram Models | Active |
| **Magic Prompt Engine** | Automatic LLM prompt expansion & aesthetic styling (Realistic, Design, 3D, Anime) | Yes | `magic_prompt_option: "AUTO"` | Active |
| **Describe API** | Image-to-text reverse captioning generating rich prompt descriptions | Yes | `/describe` API Endpoint | Active |
| **Color Palette Control** | Brand color enforcement using custom arrays of HEX color codes | Yes | `color_palette: { hex_codes: [...] }` | Active |
| **Image Editing & Remix** | Inpainting target regions and remixing existing generated images | Yes | `/edit` and `/remix` Endpoints | Active |

---

# 3. Image Generation Models

### Model: Ideogram 2.0
- **Name**: Ideogram 2.0 (`V_2_0`)
- **Release Date**: August 2024
- **Services Provided by the Model**:
  - **Commercial SOTA Graphic Design & Typography**: Flawlessly renders text in quotes inside poster designs, logos, and greeting cards.
  - **Aesthetic Styles**: `DESIGN`, `REALISTIC`, `3D`, `ANIME`, `TYPOGRAPHY`.
- **Pricing**: $0.080 / image

### Model: Ideogram 2.0 Turbo
- **Name**: Ideogram 2.0 Turbo (`V_2_0_TURBO`)
- **Services Provided by the Model**:
  - **High-Speed Low Cost Image Synthesis**: Near-instantaneous response generation at lower cost.
- **Pricing**: $0.050 / image

---

# 4. Code Example (Python REST API)

```python
import os
import requests

url = "https://api.ideogram.ai/generate"
headers = {
    "Api-Key": os.environ.get("IDEOGRAM_API_KEY"),
    "Content-Type": "application/json"
}

payload = {
    "image_request": {
        "prompt": "A retro neon sign on a dark brick wall reading 'IDEOGRAM 2.0'",
        "aspect_ratio": "ASPECT_16_9",
        "model": "V_2_0",
        "magic_prompt_option": "AUTO",
        "style_type": "DESIGN"
    }
}

response = requests.post(url, headers=headers, json=payload)
print(response.json())
```

---

# 5. Pricing Summary

| Endpoint | Price / Request |
| :--- | :--- |
| **Ideogram 2.0 Generate** | $0.080 / image |
| **Ideogram 2.0 Turbo Generate** | $0.050 / image |
| **Describe API (Image-to-Text)** | $0.008 / image |

---

# 6. Official References

- Official Ideogram Developer Portal: [developer.ideogram.ai](https://developer.ideogram.ai)
- Ideogram Web Platform: [ideogram.ai](https://ideogram.ai)
