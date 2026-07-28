---
title: AI Service â€” 06-Image-Editing Complete Master Reference
service: 06-Image-Editing
view: By Service
last_updated: 2026-07-28
tags: [image-editing, inpainting, outpainting, controlnet, flux-fill, firefly, midjourney-vary-region, sam]
author: Antigravity AI Knowledge Engine
---

# AI Service â€” 06-Image-Editing: Master Technical Specification & Encyclopedia

Welcome to the **06-Image-Editing Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, mask engineering handbook, and production architectural guide for AI Inpainting, Outpainting, ControlNet structural conditioning, and Generative Editing.

---

# ðŸ“ Service Folder Structure & Taxonomy

`	ext
06-Image-Editing/
â”œâ”€â”€ 00-Overview/                            # What is AI Image Editing, History, Evolution, Generative Editing Pipeline, Terminology, FAQ
â”œâ”€â”€ 01-Fundamentals/                        # Inpainting, Outpainting, ControlNet, IP-Adapter, Masking & Segmentation, Reference Conditioning, VAE
â”œâ”€â”€ 02-Providers/                           # Black Forest Labs, Midjourney, OpenAI, Adobe Firefly, Runway, Ideogram, Recraft, Stability AI
â”œâ”€â”€ 03-Models/                              # Deep-Dive Specs for FLUX-1-Fill, Midjourney Vary Region, Adobe Firefly Generative Fill, DALL-E 3 Edits, ControlNet, IP-Adapter
â”‚   â”œâ”€â”€ FLUX-1-Fill/                        # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
â”‚   â”œâ”€â”€ Midjourney-Vary-Region/             # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Adobe-Firefly-Generative-Fill/      # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ DALL-E-3-Edits/                     # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Runway-Inpainting/                  # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ ControlNet-Canny-Depth/             # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ IP-Adapter/                         # (10 Deep-Dive Spec Files)
â”‚   â””â”€â”€ SDXL-Inpainting/                    # (10 Deep-Dive Spec Files)
â”œâ”€â”€ 04-Tasks/                               # Inpainting, Outpainting, Background Replacement, Object Removal, Face Swapping, Style Transfer, Upscaling
â”œâ”€â”€ 05-API/                                 # REST APIs, SDKs, Auth, Request Formats (Image + Mask), Rate Limits, Pricing, Error Handling
â”œâ”€â”€ 06-Mask-and-Control-Engineering/        # Bounding Box Masking, Segment Anything Model (SAM), Canny Edge Masks, Depth Maps, OpenPose
â”œâ”€â”€ 07-Quality/                             # Mask Seam Blending, Color Consistency, Spatial Alignment, Resolution Maintenance, Benchmarks
â”œâ”€â”€ 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best Photoshop Plugin, Decision Matrix
â”œâ”€â”€ 09-Use-Cases/                           # E-Commerce Retouching, Real Estate Virtual Staging, Fashion Editing, Advertising
â”œâ”€â”€ 10-Open-Source/                         # FLUX Fill Dev, ControlNet, IP-Adapter, SAM, ComfyUI Editing Workflows, Automatic1111 Inpaint
â”œâ”€â”€ 11-Production/                          # Mask Preprocessing, High-Resolution Tiling, Batch Processing, CDN & Storage Integration
â”œâ”€â”€ 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
â”œâ”€â”€ 13-Benchmarks/                          # Editing Precision Score, Processing Latency (s), Cost per Edit, Human Preference Rating
â”œâ”€â”€ 14-Learning-Resources/                  # Official Docs, Research Papers (ControlNet, SAM, IP-Adapter), Blogs, Videos, Courses
â””â”€â”€ 15-Glossary/                            # Terms, Acronyms, References
`

---

# ðŸŽ¯ Model Comparison & Decision Matrix Snapshot

| Model / Tool | Developer | Primary Capability | Best For | API Pricing (per edit) | Free / Open-Weights |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **FLUX.1 Fill [pro]** | Black Forest Labs | SOTA inpainting, outpainting & text insertion | Enterprise product retouching & precision edits | **.050 / edit** | API Only |
| **Adobe Firefly Generative Fill** | Adobe | Photorealistic Photoshop canvas expand & object replace | Commercial photo editing & graphic design | **Included in Photoshop** | Web Free Tier (25 credits) |
| **Midjourney Vary Region** | Midjourney | In-browser & Discord brush inpainting | Creative artwork modification & character variations | **Included in Sub** | Web / Discord Sub |
| **ControlNet (Canny/Depth)** | Open-Source | Structural edge & depth map image conditioning | Architectural renders & pose-guided edits | Self-Hosted GPU | **Open-Weights (Apache 2.0)** |
| **IP-Adapter** | Open-Source | Image prompt style and structure transfer | Style consistency & face/composition cloning | Self-Hosted GPU | **Open-Weights (Apache 2.0)** |
| **DALL-E 3 Edits** | OpenAI | Conversational chat image inpainting | Simple object replacement via text | **.040 / edit** | ChatGPT Plus |

---

# ðŸš€ Quick Start Example: Inpainting with FLUX.1 Fill via Python

`python
import os
import replicate

# Execute inpainting edit replacing masked region
output = replicate.run(
    "black-forest-labs/flux-fill-pro",
    input={
        "image": "https://example.com/living_room.jpg",
        "mask": "https://example.com/chair_mask.png",
        "prompt": "A modern minimalist Scandinavian lounge chair in oak wood and white fabric",
        "output_format": "png"
    }
)

print(f"Edited Image URL: {output}")
`

---

# ðŸ“š Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for generative editing pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for Inpainting vs Outpainting vs ControlNet mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on FLUX.1 Fill, Midjourney Vary Region, Adobe Firefly, DALL-E 3 Edits, ControlNet, and IP-Adapter.
- Explore **[06-Mask-and-Control-Engineering](./06-Mask-and-Control-Engineering/README.md)** for Segment Anything Model (SAM) auto-masking scripts.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Photoshop Plugin, Best API).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for ComfyUI inpainting workflows and local ControlNet setups.
