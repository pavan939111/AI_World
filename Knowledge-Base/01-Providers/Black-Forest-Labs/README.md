---
title: Black Forest Labs (FLUX) — Complete Technical Specification & Provider Reference
provider: Black Forest Labs
view: By Provider
last_updated: 2026-07-28
tags: [black-forest-labs, flux, flux-1-pro, flux-1-dev, flux-1-schnell, image-generation, rectified-flow]
author: Antigravity AI Documentation Engine
---

# Black Forest Labs (FLUX) — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Black Forest Labs GmbH
- **Parent Company**: Black Forest Labs GmbH
- **Founders**: Robin Rombach (CEO), Andreas Blattmann, Dominik Lorenz (co-creators of Stable Diffusion and Latent Diffusion Models at LMU Munich & Stability AI)
- **Headquarters**: Freiburg im Breisgau, Baden-Württemberg, Germany
- **Year Founded**: 2024
- **Mission**: To build state-of-the-art generative media foundation models for images and video that push the boundaries of visual creativity.
- **Valuation & Funding**: $31 Million Series Seed funding round led by Andreessen Horowitz, with participation from General Catalyst, M12 (Microsoft's Venture Fund), and Nat Friedman.
- **AI Ecosystem**: Full-stack generative image foundation model suite powered by a 12 Billion parameter **Rectified Flow Transformer** architecture providing FLUX.1 [pro], FLUX.1 [dev], FLUX.1 [schnell], FLUX.1 [fill] (inpainting), FLUX.1 [redux] (variations), FLUX.1 [canny] / [depth] structural control, and official BFL API (`api.bfl.ml`).
- **Timeline & Major Milestones**:
  - **2024**: Founded in Freiburg, Germany by Robin Rombach, Andreas Blattmann, and Dominik Lorenz after leaving Stability AI.
  - **August 2024**: Released FLUX.1 model suite ([pro], [dev], [schnell]) setting new world records for open and commercial image generation.
  - **September 2024**: Integrated FLUX.1 into Replicate, Fal.ai, and Poe platform.
  - **October 2024**: Released FLUX.1 [fill] (inpainting/outpainting) and FLUX.1 [redux] (variations).
  - **November 2024**: Released FLUX.1 [canny] and FLUX.1 [depth] structural control models.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Image Generation** | State-of-the-art text-to-image synthesis with legibly rendered typography | Yes | FLUX.1 [pro], FLUX.1 [dev], FLUX.1 [schnell] | Active |
| **Image Editing & Inpainting** | Generative object replacement and outpainting canvas expansion | Yes | FLUX.1 [fill-pro], FLUX.1 [fill-dev] | Active |
| **Image Variations (Redux)** | Concept blending and multi-image variation generation | Yes | FLUX.1 [redux-pro], FLUX.1 [redux-dev] | Active |
| **Structural Control** | Depth map and Canny edge structural image guidance | Yes | FLUX.1 [canny], FLUX.1 [depth] | Active |
| **Typography Rendering** | Precise text rendering inside generated signs, logos, and t-shirts | Yes | All FLUX.1 Models | Active |
| **Open-Weights Local Models** | Open-weights 12B models for local GPU execution and ComfyUI | Yes (Open Weights) | FLUX.1 [dev], FLUX.1 [schnell] | Active |

---

# 3. Image Generation Models

### Model: FLUX.1 [pro]
- **Name**: FLUX.1 [pro] (`flux-pro`)
- **Release Date**: August 2024
- **Parameters**: 12 Billion parameters
- **Architecture**: Rectified Flow Transformer with Parallel Multimodal Diffusion blocks
- **Services Provided by the Model**:
  - **Commercial SOTA Image Synthesis**: Maximum photorealism, skin texture accuracy, and human hand anatomy.
  - **Legible Typography Rendering**: Renders multi-word quotes and text inside imagery without garbled letters.
- **Pricing**: $0.050 / image

### Model: FLUX.1 [dev]
- **Name**: FLUX.1 [dev] (`flux-dev`)
- **Parameters**: 12 Billion parameters
- **License**: Non-commercial open weights (Commercial via API)
- **Pricing**: $0.025 / image (API) or Free for non-commercial local self-hosting.

### Model: FLUX.1 [schnell]
- **Name**: FLUX.1 [schnell] (`flux-schnell`)
- **Inference Steps**: 1 to 4 steps
- **License**: **Apache 2.0 (Free open-weights commercial use)**
- **Pricing**: $0.003 / image (API) or Free for local self-hosting.

---

# 4. Code Example (HuggingFace `diffusers`)

```python
import torch
from diffusers import FluxPipeline

# Load FLUX.1 [schnell] pipeline
pipe = FluxPipeline.from_pretrained(
    "black-forest-labs/FLUX.1-schnell",
    torch_dtype=torch.bfloat16
)
pipe.enable_model_cpu_offload()

# Generate image with legibly rendered text
prompt = "A high-resolution photograph of a coffee mug sitting on a wooden desk with text reading 'BLACK FOREST LABS'."
image = pipe(
    prompt,
    guidance_scale=0.0,
    num_inference_steps=4,
    max_sequence_length=256
).images[0]

image.save("flux_output.png")
```

---

# 5. Pricing Summary

| Model | API Pricing / Image | License / Self-Hosting |
| :--- | :--- | :--- |
| **FLUX.1 [pro]** | $0.050 | Closed-source API only |
| **FLUX.1 [dev]** | $0.025 | Non-commercial open weights |
| **FLUX.1 [schnell]** | $0.003 | **Apache 2.0 Free Commercial** |
| **FLUX.1 [fill-pro]** | $0.050 | Closed-source API only |

---

# 6. Official References

- Official Black Forest Labs Documentation: [docs.bfl.ml](https://docs.bfl.ml)
- Black Forest Labs Portal: [api.bfl.ml](https://api.bfl.ml)
- Official Website: [blackforestlabs.ai](https://blackforestlabs.ai)
