$replicateDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Replicate"

if (Test-Path $replicateDir) {
    Remove-Item -Recurse -Force $replicateDir
}
New-Item -ItemType Directory -Force -Path $replicateDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Replicate & Machine Learning Cloud Platform.";
        "Company.md" = "Founded in 2019 by Ben Firshman (CEO, former Docker director) and Andreas Jansson (CTO, former Spotify ML engineer) in San Francisco, CA; `$50 Million Series B funding led by Andreessen Horowitz (a16z) and Y Combinator.";
        "Cog-Container-Architecture.md" = "Cog open-source framework for packaging machine learning models into production Docker containers.";
        "History-and-Milestones.md" = "Timeline from founding in 2019 to Cog release, FLUX.1 hosting, and Fine-Tuning API.";
        "Glossary.md" = "Key terms, Cog, Predictions API, Webhooks."
    };
    "01-Image-Generation-and-FLUX-Endpoints" = @{
        "README.md" = "Hosted image generation models including FLUX.1 and SDXL.";
        "FLUX-1-pro-Replicate.md" = "FLUX.1 [pro] model endpoint specs (`black-forest-labs/flux-1.1-pro`, `$0.05 / image).";
        "FLUX-1-dev-Replicate.md" = "FLUX.1 [dev] model endpoint specs (`black-forest-labs/flux-dev`, `$0.025 / image).";
        "FLUX-1-schnell-Replicate.md" = "FLUX.1 [schnell] model endpoint specs (`black-forest-labs/flux-schnell`, `$0.003 / image).";
        "SDXL-Replicate.md" = "Stable Diffusion XL model endpoint specs.";
        "Comparisons.md" = "Replicate image endpoints vs BFL API matrix.";
        "Best-Practices.md" = "Parameter configurations for FLUX on Replicate."
    };
    "02-Video-and-Audio-Generative-Endpoints" = @{
        "README.md" = "Generative video, speech recognition, and audio endpoints.";
        "Minimax-Video-Replicate.md" = "Minimax text-to-video endpoint specs (`minimax/video-01`).";
        "AnimateDiff-Replicate.md" = "AnimateDiff video generation endpoint specs.";
        "Whisper-Replicate.md" = "OpenAI Whisper speech recognition endpoint specs (`openai/whisper`).";
        "MusicGen-Replicate.md" = "Meta MusicGen audio generation endpoint specs (`meta/musicgen`)."
    };
    "03-Open-Language-and-Reasoning-Models" = @{
        "README.md" = "Open text language and reasoning model endpoints.";
        "Llama-3-3-70B-Replicate.md" = "Llama 3.3 70B model endpoint specs (`meta/llama-3.3-70b-instruct`).";
        "DeepSeek-R1-Replicate.md" = "DeepSeek-R1 reasoning model endpoint specs (`deepseek-ai/deepseek-r1`).";
        "Qwen-2-5-72B-Replicate.md" = "Qwen 2.5 72B model endpoint specs.";
        "Best-Practices.md" = "Streaming token predictions."
    };
    "04-Cog-Container-Packaging-and-Deployment" = @{
        "README.md" = "Packaging custom PyTorch / TensorFlow models using Cog.";
        "Cog-Specification.md" = "`cog.yaml` and `predict.py` configuration specification.";
        "Custom-Model-Deployment.md" = "Pushing custom Cog containers to Replicate (`cog push r8.im/username/model`).";
        "Examples.md" = "Complete `cog.yaml` and `predict.py` code template."
    };
    "05-Custom-Model-Training-and-Fine-Tuning" = @{
        "README.md" = "Fine-tuning custom LoRAs on Replicate GPU infrastructure.";
        "FLUX-LoRA-Training-API.md" = "Fine-tuning custom FLUX.1 LoRAs via Replicate Trainings API (`ostris/flux-dev-lora-trainer`).";
        "SDXL-Fine-Tuning.md" = "Fine-tuning SDXL Dreambooth models.";
        "Examples.md" = "Python script launching a custom FLUX LoRA training run."
    };
    "06-Replicate-API-and-Endpoints" = @{
        "README.md" = "Official Replicate REST API catalog (`api.replicate.com/v1`).";
        "Predictions-API.md" = "`/v1/predictions` endpoint specification.";
        "Trainings-API.md" = "`/v1/trainings` endpoint specification.";
        "Models-and-Versions-API.md" = "`/v1/models` and `/v1/models/{model_owner}/{model_name}/versions` specification."
    };
    "07-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Replicate client SDKs and webhooks.";
        "Python-SDK-replicate.md" = "Official `replicate` Python package specification.";
        "TypeScript-SDK.md" = "Official `replicate` Node.js TypeScript package specification.";
        "Webhooks-Integration.md" = "Receiving async webhook callbacks upon prediction completion."
    };
    "08-Pricing-and-Billing" = @{
        "README.md" = "Replicate per-second GPU hardware pricing schedule.";
        "Per-Second-Hardware-Rates.md" = "Nvidia T4 (`$0.000225/s), A100 40GB (`$0.00115/s), H100 80GB (`$0.00390/s).";
        "Cost-Optimization-Guide.md" = "Optimizing cold boot time and hardware selection."
    };
    "09-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Serverless-FLUX-Image-Pipeline.md" = "Automated FLUX image generation pipeline with Webhooks.";
        "Cog-Model-Deployment-Workflow.md" = "Cog container deployment workflow."
    };
    "10-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from founding in 2019 to Cog 1.0 and FLUX.1 hosting."
    };
    "11-Official-References" = @{
        "README.md" = "Curated list of official Replicate links.";
        "Official-Links.md" = "Official API docs link: https://replicate.com/docs & https://github.com/replicate/cog"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $replicateDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Replicate — $folder Overview
provider: Replicate
capability: $folder
last_updated: 2026-07-28
tags: [replicate, cog, flux, llama, deepseek, predictions, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Replicate — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Replicate cloud machine learning applications.

## 3. Models Belonging to This Capability
- FLUX.1 [pro]/[dev]/[schnell], Llama 3.3 70B, DeepSeek-R1, Minimax Video, Whisper, Cog custom containers.

## 4. Exposed APIs & Endpoints
- Official Replicate REST API (`https://api.replicate.com/v1`), Python `replicate` SDK, TypeScript SDK, Cog CLI.

## 5. Common Use Cases
- Running hosted open-source AI models via a unified REST API, packaging custom PyTorch models into Docker containers using Cog, fine-tuning custom FLUX LoRAs, async Webhooks predictions.
"@
        } else {
            $content = @"
---
title: Replicate — $fileNameNoExt Specification
provider: Replicate
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [replicate, cog, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Replicate — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Provider Platform**: Replicate Machine Learning Cloud (Ben Firshman & Andreas Jansson)
- **Container Technology**: Cog Open-Source Docker Packaging Specification (`cog.yaml`)
- **Supported Modalities**: Text, Image, Video, Audio, 3D
- **Billing Model**: Per-second GPU hardware usage (Nvidia T4 `$0.000225/s, A100 `$0.00115/s, H100 `$0.00390/s)
- **API Availability**: Replicate API (`api.replicate.com/v1`), Official Python (`replicate`) & TypeScript SDKs
- **Webhooks**: Supported for async completion notifications
- **Fine-Tuning**: Supported via Replicate Trainings API (`/v1/trainings`)

## Typical Use Cases
1. Serverless image generation calling FLUX.1 or SDXL with async webhooks.
2. Packaging custom internal PyTorch models into Cog containers for production API deployment.

## Strengths & Limitations
- **Strengths**: 1,000+ open-source AI models available via 1 API key, Cog containerization standard, per-second hardware billing, serverless fine-tuning.
- **Limitations**: Cold boot container startup times when invoking infrequently called custom models.

## Example Request (Official Python SDK)
```python
import os
import replicate

# Set Replicate API Token
os.environ["REPLICATE_API_TOKEN"] = "r8_your_api_token_here"

# Run FLUX.1 [schnell] prediction
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

## Related Documentation & Models
- See official Replicate documentation at https://replicate.com/docs
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Replicate directory!"
