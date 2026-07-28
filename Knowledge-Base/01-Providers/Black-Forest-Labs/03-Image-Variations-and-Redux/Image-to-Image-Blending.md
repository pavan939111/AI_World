---
title: Black Forest Labs â€” Image-to-Image-Blending Specification
provider: Black Forest Labs
capability: 03-Image-Variations-and-Redux
file: Image-to-Image-Blending.md
last_updated: 2026-07-28
tags: [black-forest-labs, flux, 03-image-variations-and-redux, image-to-image-blending]
author: Antigravity AI Documentation Engine
---

# Black Forest Labs â€” Image-to-Image-Blending

## Overview
Detailed technical specification for **Image-to-Image-Blending** under **03-Image-Variations-and-Redux**.

## Model & Feature Specifications
- **Model Family**: FLUX.1 Generative Image Series (Rectified Flow Transformer Architecture)
- **Parameters**: 12 Billion parameters
- **Supported Input Modalities**: Text Prompts, Images (Fill/Redux), Control Masks / Edge Maps
- **Supported Output Modalities**: PNG / JPEG Images (up to 2048x2048 resolution)
- **Inference Steps**: 1-4 steps (schnell), 28-50 steps (dev/pro)
- **Pricing**: FLUX.1 [pro] ($0.05 / image) | FLUX.1 [dev] ($0.025 / image) | FLUX.1 [schnell] ($0.003 / image)
- **API Availability**: BFL API (pi.bfl.ml), Replicate, Fal.ai, HuggingFace Diffusers, ComfyUI
- **Typography Support**: State-of-the-art text rendering inside imagery
- **Anatomy Realism**: State-of-the-art hands, faces, and human anatomy generation

## Typical Use Cases
1. Production commercial graphic design with legibly rendered typography.
2. Self-hosted high-resolution image synthesis using 4-bit NF4/GGUF quantization in ComfyUI.

## Strengths & Limitations
- **Strengths**: Highest image prompt adherence and photorealism in the industry, legibly renders text in quotes, open-weights availability ([dev] & [schnell]).
- **Limitations**: FLUX.1 [pro] is closed-source API only.

## Example Request (HuggingFace Diffusers)
`python
import torch
from diffusers import FluxPipeline

pipe = FluxPipeline.from_pretrained("black-forest-labs/FLUX.1-schnell", torch_dtype=torch.bfloat16)
pipe.enable_model_cpu_offload()

image = pipe(
    "A vibrant neon sign on a brick wall reading 'FLUX AI WORLD'",
    guidance_scale=0.0,
    num_inference_steps=4,
    max_sequence_length=256
).images[0]

image.save("flux_output.png")
`

## Related Documentation & Models
- See official Black Forest Labs documentation at https://docs.bfl.ml
