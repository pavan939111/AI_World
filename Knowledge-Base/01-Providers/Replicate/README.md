---
title: Replicate — Complete Technical Specification & Provider Reference
provider: Replicate
view: By Provider
last_updated: 2026-07-28
tags: [replicate, cog, flux, llama, deepseek, predictions, docker, fine-tuning]
author: Antigravity AI Documentation Engine
---

# Replicate — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Replicate Inc.
- **Parent Company**: Replicate Inc.
- **Founders**: Ben Firshman (CEO, former Director of Product at Docker and creator of Fig / Docker Compose), Andreas Jansson (CTO, former Machine Learning Engineer at Spotify)
- **Headquarters**: San Francisco, California, USA
- **Year Founded**: 2019
- **Mission**: To make machine learning models as easy to run, train, and deploy as software dependencies.
- **Valuation & Funding**: $350 Million+ valuation following $50M Series B funding round led by Andreessen Horowitz (a16z), Y Combinator (YC W20), and Nat Friedman.
- **AI Ecosystem**: Comprehensive open-source AI cloud platform providing serverless endpoints for 1,000+ open-source models (FLUX.1 [pro]/[dev]/[schnell], Llama 3.3 70B, DeepSeek-R1, Minimax Video, Whisper, MusicGen), Cog open-source container specification (`cog.yaml`), custom LoRA model fine-tuning API (`/v1/trainings`), per-second GPU hardware billing (Nvidia T4, A100, H100), async Webhooks notifications, and official REST API (`api.replicate.com/v1`).
- **Timeline & Major Milestones**:
  - **2019**: Founded in San Francisco by Ben Firshman and Andreas Jansson.
  - **Winter 2020**: Graduated from Y Combinator (YC W20).
  - **2021**: Released Cog open-source tool for packaging ML models into Docker containers.
  - **February 2023**: Raised $12.5M Series A led by Andreessen Horowitz.
  - **December 2023**: Raised $40M Series B led by a16z.
  - **August 2024**: Hosted FLUX.1 model suite on day one.
  - **January 2025**: Hosted DeepSeek-R1 and DeepSeek-V3 serverless endpoints.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Image Generation Endpoints** | Hosted SOTA image generation models including FLUX.1 and SDXL | Yes | FLUX.1 [pro]/[dev]/[schnell], SDXL | Active |
| **Video & Audio Endpoints** | Hosted generative video clips, speech recognition, and music models | Yes | Minimax Video, Luma Dream Machine, Whisper | Active |
| **Open Language & Reasoning** | Hosted serverless open-source LLMs and reasoning models | Yes | Llama 3.3 70B, DeepSeek-R1, Qwen 2.5 72B | Active |
| **Cog Model Packaging** | Open-source tool packaging ML models into production Docker containers | Yes | Cog CLI (`cog.yaml` & `predict.py`) | Active |
| **Custom Fine-Tuning API** | Fine-tuning custom FLUX.1 LoRAs and SDXL models on Replicate GPUs | Yes | `/v1/trainings` API | Active |
| **Per-Second Hardware Billing** | Pay-as-you-go GPU execution billed down to the millisecond | Yes | Nvidia T4, A100 40GB, H100 80GB | Active |

---

# 3. Model Hosting & Cog Architecture

### Cog Container Specification
- **File**: `cog.yaml`
- **Predictor**: `predict.py`
- **Services Provided by Cog**:
  - **Universal ML Packaging**: Defines CUDA drivers, Python packages, system dependencies, and model weight downloads in a declarative `cog.yaml` file.
  - **One-Command Cloud Push**: `cog push r8.im/username/model-name` automatically builds, optimizes, and deploys the container onto Replicate's cloud GPU infrastructure.

### Model: FLUX.1 [schnell] (Replicate Hosted)
- **Name**: `black-forest-labs/flux-schnell`
- **Pricing**: $0.003 / image (or per-second GPU billing)

---

# 4. Code Example (Official `replicate` Python SDK)

```python
import os
import replicate

# Set Replicate API Token
os.environ["REPLICATE_API_TOKEN"] = "r8_your_api_token_here"

# Execute FLUX.1 [schnell] prediction
output = replicate.run(
    "black-forest-labs/flux-schnell",
    input={
        "prompt": "A futuristic metropolis with flying vehicles at sunset, photorealistic, 8k",
        "aspect_ratio": "16:9",
        "num_outputs": 1
    }
)

print(f"Generated Image URL: {output[0]}")
```

---

# 5. Pricing Summary

| Hardware / Model | Per-Second Billing Rate |
| :--- | :--- |
| **CPU (4-core)** | **$0.000100 / second** |
| **Nvidia T4 GPU** | **$0.000225 / second** |
| **Nvidia A100 (40GB) GPU** | **$0.001150 / second** |
| **Nvidia H100 (80GB) GPU** | **$0.003900 / second** |
| **FLUX.1 [schnell] API** | **$0.003 / image** |
| **FLUX.1 [dev] API** | **$0.025 / image** |
| **FLUX.1 [pro] API** | **$0.050 / image** |

---

# 6. Official References

- Official Replicate Documentation: [replicate.com/docs](https://replicate.com/docs)
- Cog GitHub Repository: [github.com/replicate/cog](https://github.com/replicate/cog)
- Official Website: [replicate.com](https://replicate.com)
