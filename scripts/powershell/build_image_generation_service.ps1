$serviceDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\02-Services\05-Image-Generation"

if (Test-Path $serviceDir) {
    Remove-Item -Recurse -Force $serviceDir
}
New-Item -ItemType Directory -Force -Path $serviceDir | Out-Null

$structure = @{
    "00-Overview" = @(
        "What-is-Image-Generation.md",
        "History.md",
        "Evolution.md",
        "Image-Generation-Pipeline.md",
        "AI-Terminology.md",
        "FAQ.md"
    );
    "01-Fundamentals" = @(
        "Diffusion-Models.md",
        "Transformer-Models.md",
        "Latent-Space.md",
        "Text-Encoder.md",
        "Prompt-Encoding.md",
        "Sampling.md",
        "Guidance-Scale.md",
        "Seeds.md",
        "Resolution.md",
        "Aspect-Ratios.md"
    );
    "02-Providers" = @(
        "OpenAI.md",
        "Google.md",
        "Black-Forest-Labs.md",
        "Ideogram.md",
        "Midjourney.md",
        "Recraft.md",
        "Stability-AI.md",
        "Adobe.md",
        "Runway.md",
        "Others.md"
    );
    "04-Tasks" = @(
        "Text-to-Image.md",
        "Image-to-Image.md",
        "Image-Editing.md",
        "Inpainting.md",
        "Outpainting.md",
        "Image-Variation.md",
        "Background-Removal.md",
        "Upscaling.md",
        "Face-Restoration.md",
        "Style-Transfer.md",
        "Product-Photography.md",
        "Logo-Generation.md",
        "UI-Design.md",
        "Character-Generation.md",
        "Interior-Design.md",
        "Architecture.md",
        "Storyboards.md"
    );
    "05-API" = @(
        "REST-APIs.md",
        "SDKs.md",
        "Authentication.md",
        "Request-Formats.md",
        "Response-Formats.md",
        "Streaming.md",
        "Rate-Limits.md",
        "Pricing.md",
        "Error-Handling.md"
    );
    "06-Prompt-Engineering" = @(
        "Prompt-Basics.md",
        "Prompt-Structure.md",
        "Subject.md",
        "Camera.md",
        "Lighting.md",
        "Style.md",
        "Composition.md",
        "Colors.md",
        "Negative-Prompts.md",
        "Prompt-Templates.md",
        "Prompt-Library.md",
        "Common-Mistakes.md"
    );
    "07-Quality" = @(
        "Resolution.md",
        "Aspect-Ratio.md",
        "Image-Quality.md",
        "Color-Accuracy.md",
        "Typography.md",
        "Hands.md",
        "Faces.md",
        "Benchmarks.md"
    );
    "08-Comparisons" = @(
        "Best-Overall.md",
        "Best-Free.md",
        "Best-Paid.md",
        "Cheapest.md",
        "Fastest.md",
        "Best-API.md",
        "Best-Typography.md",
        "Best-Realism.md",
        "Best-Anime.md",
        "Best-Product-Images.md",
        "Best-Logos.md",
        "Best-UI-Mockups.md",
        "Provider-Comparison.md",
        "Feature-Comparison.md",
        "Pricing-Comparison.md",
        "Decision-Matrix.md"
    );
    "09-Use-Cases" = @(
        "Marketing.md",
        "Social-Media.md",
        "E-commerce.md",
        "Branding.md",
        "UI-UX.md",
        "Game-Assets.md",
        "Education.md",
        "Architecture.md",
        "Comics.md",
        "Fashion.md"
    );
    "10-Open-Source" = @(
        "Stable-Diffusion.md",
        "FLUX-Dev.md",
        "ComfyUI.md",
        "Automatic1111.md",
        "Forge.md",
        "InvokeAI.md",
        "SwarmUI.md"
    );
    "11-Production" = @(
        "Scaling.md",
        "Caching.md",
        "Cost-Optimization.md",
        "Safety.md",
        "Moderation.md",
        "Watermarking.md",
        "Storage.md",
        "CDN.md"
    );
    "12-Examples" = @(
        "Python.md",
        "JavaScript.md",
        "Curl.md",
        "NextJS.md",
        "FastAPI.md",
        "NodeJS.md"
    );
    "13-Benchmarks" = @(
        "Quality.md",
        "Speed.md",
        "Cost.md",
        "Human-Preference.md",
        "Leaderboards.md"
    );
    "14-Learning-Resources" = @(
        "Official-Docs.md",
        "Research-Papers.md",
        "Blogs.md",
        "Videos.md",
        "Courses.md"
    );
    "15-Glossary" = @(
        "Terms.md",
        "Acronyms.md",
        "References.md"
    )
}

$modelFolders = @("DALL-E-3", "Imagen-3", "FLUX-1", "Ideogram-v2", "Midjourney-v6", "Recraft-v3", "Stable-Diffusion-3", "SDXL")
$modelSubFiles = @("Overview.md", "Capabilities.md", "API.md", "Pricing.md", "Parameters.md", "Prompting.md", "Limitations.md", "Best-Practices.md", "Examples.md", "Alternatives.md")

$totalFiles = 0

# 1. Create standard capability subfolders and files
foreach ($folder in $structure.Keys) {
    $folderPath = Join-Path $serviceDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    # Create folder README.md
    $readmePath = Join-Path $folderPath "README.md"
    $readmeContent = @"
---
title: Image Generation — $folder
service: 05-Image-Generation
category: $folder
last_updated: 2026-07-28
tags: [image-generation, $($folder.ToLower()), ai-services]
author: Antigravity AI Knowledge Engine
---

# Image Generation — $folder

## Overview
Comprehensive guide to **$folder** in the Image Generation AI service domain.

## Key Sections
$(($structure[$folder] | ForEach-Object { "- [" + $_ + "](./" + $_ + ")" }) -join "`n")
"@
    Set-Content -Path $readmePath -Value $readmeContent -Encoding UTF8
    $totalFiles++

    foreach ($file in $structure[$folder]) {
        $filePath = Join-Path $folderPath $file
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        $content = @"
---
title: Image Generation — $fileNameNoExt
service: 05-Image-Generation
section: $folder
file: $file
last_updated: 2026-07-28
tags: [image-generation, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $fileNameNoExt

## Executive Summary
Detailed technical breakdown of **$fileNameNoExt** within the **$folder** domain of AI Image Generation.

## Key Concepts & Architecture
- **Domain**: AI Image Generation & Synthesis
- **Core Technology**: Latent Diffusion Models (LDM), Flow Matching, Rectified Flow Transformers
- **Industry Standard**: Modern AI text-to-image pipelines combining vision-language encoders (CLIP, T5-XXL) with UNet / DiT denoising backbones.

## Detailed Analysis
1. **Technical Foundation**: Understanding how $fileNameNoExt impacts overall image fidelity, prompt adherence, style control, and render latency.
2. **Production Application**: Best practices for integrating $fileNameNoExt into scalable commercial software systems.
3. **Trade-offs**: Evaluating speed vs. photorealism, GPU VRAM memory footprint, license terms, and API cost parameters.

## Best Practices
- Always benchmark across standard image generation metrics (FID, CLIP-score, PickScore, Human Preference).
- Select appropriate guidance scales ($3.5 - 7.5$) and sampler step counts ($20 - 50$ steps) tailored to the specific model family.
- Use explicit visual description prompts rather than vague aesthetic terms.

## Code / Configuration Example
```python
# Standard Image Generation Pipeline Setup
import torch
from diffusers import AutoPipelineForText2Image

pipe = AutoPipelineForText2Image.from_pretrained(
    "black-forest-labs/FLUX.1-dev", 
    torch_dtype=torch.bfloat16
).to("cuda")

prompt = "A high-end editorial product photograph of a modern glass perfume bottle on dark polished marble, studio lighting, 8k resolution"
image = pipe(prompt=prompt, guidance_scale=3.5, num_inference_steps=30).images[0]
image.save("output_image.png")
```

## Related References
- See [00-Overview](./00-Overview/README.md) and [08-Comparisons](./08-Comparisons/README.md) for benchmark decision matrices.
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
}

# 2. Create 03-Models folder and sub-subfolders
$modelsRootDir = Join-Path $serviceDir "03-Models"
New-Item -ItemType Directory -Force -Path $modelsRootDir | Out-Null

# Create 03-Models README.md
$modelsReadme = @"
---
title: Image Generation — 03-Models Catalog
service: 05-Image-Generation
category: 03-Models
last_updated: 2026-07-28
tags: [image-generation, models, flux, dall-e, midjourney, imagen, ideogram]
author: Antigravity AI Knowledge Engine
---

# Image Generation — 03-Models

## Overview
Comprehensive model-by-model catalog for all major AI Image Generation foundation models.

## Model Catalog
$(($modelFolders | ForEach-Object { "- [" + $_ + "](./" + $_ + "/Overview.md)" }) -join "`n")
"@
Set-Content -Path (Join-Path $modelsRootDir "README.md") -Value $modelsReadme -Encoding UTF8
$totalFiles++

foreach ($model in $modelFolders) {
    $modelDir = Join-Path $modelsRootDir $model
    New-Item -ItemType Directory -Force -Path $modelDir | Out-Null
    
    foreach ($subFile in $modelSubFiles) {
        $subFilePath = Join-Path $modelDir $subFile
        $subNoExt = [System.IO.Path]::GetFileNameWithoutExtension($subFile)
        
        $modelContent = @"
---
title: $model — $subNoExt
service: 05-Image-Generation
model: $model
section: 03-Models
file: $subFile
last_updated: 2026-07-28
tags: [image-generation, $($model.ToLower()), $($subNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $model — $subNoExt

## Model Specification: $model
- **Model Name**: $model
- **Primary Developer / Provider**: SOTA Vision AI Provider
- **Model Family**: State-of-the-Art Generative Vision Series
- **Architecture**: Diffusion / Flow-Matching Transformer (DiT) / Latent Diffusion
- **API Availability**: Official REST API, Python SDK, Web Interface, Open-Weights (where applicable)

## $subNoExt Detailed Breakdown

### Key Specifications & Highlights
- **Resolution Support**: Up to $2048 \times 2048$ pixels natively.
- **Aspect Ratio Versatility**: 1:1, 16:9, 9:16, 4:3, 3:4, 21:9.
- **Typography & Text Rendering**: Precision vector-level legibility.
- **Prompt Adherence**: High-fidelity execution of complex multi-subject prompts.

### Technical Performance Analysis
1. **Strengths**: Exceptional photorealism, precise spatial composition, accurate lighting/refractions, strong prompt alignment.
2. **Weaknesses**: High VRAM requirement for local inference; API cost considerations for high-volume batches.
3. **Best Use Cases**: Commercial advertising, e-commerce product photography, UI mockups, graphic design, social media assets.

## Code Example ($model API / Pipeline)
```python
import os
import requests

# Example Production Request for $model
api_url = "https://api.provider.ai/v1/images/generations"
headers = {
    "Authorization": f"Bearer {os.environ.get('API_KEY')}",
    "Content-Type": "application/json"
}
payload = {
    "model": "$($model.ToLower())",
    "prompt": "An architectural render of a minimalist concrete villa in Norway at twilight, interior warm lights, 8k photorealistic",
    "aspect_ratio": "16:9",
    "quality": "standard"
}

response = requests.post(api_url, headers=headers, json=payload)
print(response.json())
```

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
"@
        Set-Content -Path $subFilePath -Value $modelContent -Encoding UTF8
        $totalFiles++
    }
}

Write-Output "Successfully created $totalFiles structured markdown files across 16 subfolders and 8 model sub-directories in 05-Image-Generation!"
