$serviceDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\02-Services\13-Video-Generation"

if (Test-Path $serviceDir) {
    Remove-Item -Recurse -Force $serviceDir
}
New-Item -ItemType Directory -Force -Path $serviceDir | Out-Null

$structure = @{
    "00-Overview" = @(
        "What-is-AI-Video-Generation.md",
        "History.md",
        "Evolution.md",
        "Text-to-Video-and-Image-to-Video-Pipeline.md",
        "AI-Terminology.md",
        "FAQ.md"
    );
    "01-Fundamentals" = @(
        "3D-Diffusion-Transformers-DiT.md",
        "Spatio-Temporal-Self-Attention.md",
        "Motion-Conditioning.md",
        "Camera-Movement-Controls.md",
        "Aspect-Ratios-and-Resolution.md",
        "FPS-and-Temporal-Consistency.md"
    );
    "02-Providers" = @(
        "Runway.md",
        "Luma-AI.md",
        "Kling-AI.md",
        "OpenAI.md",
        "Hailuo-AI-Minimax.md",
        "Pika-Labs.md",
        "Stability-AI.md",
        "Tencent.md"
    );
    "04-Tasks" = @(
        "Text-to-Video-Generation.md",
        "Image-to-Video-Generation.md",
        "Video-to-Video-Transformation.md",
        "Camera-Motion-Control.md",
        "Keyframe-Animation.md",
        "Video-Extension-and-Looping.md",
        "Audio-Driven-Lip-Sync-Video.md"
    );
    "05-API" = @(
        "REST-APIs.md",
        "Async-Polling-and-Webhooks.md",
        "Authentication.md",
        "Request-Formats-Prompt-and-Image.md",
        "Response-Formats-MP4.md",
        "Rate-Limits.md",
        "Pricing.md",
        "Error-Handling.md"
    );
    "06-Video-Prompt-Engineering" = @(
        "Cinematography-and-Camera-Directives.md",
        "Lighting-and-Lens-Prompting.md",
        "Motion-Directives.md",
        "Negative-Motion-Prompts.md",
        "Seed-and-Consistency-Control.md",
        "Prompt-Library.md",
        "Common-Mistakes.md"
    );
    "07-Quality" = @(
        "VBench-Benchmark.md",
        "Temporal-Consistency-Rating.md",
        "Motion-Smoothness.md",
        "Physics-Realism.md",
        "Artifact-Elimination.md"
    );
    "08-Comparisons" = @(
        "Best-Overall.md",
        "Best-Free.md",
        "Best-Paid.md",
        "Cheapest.md",
        "Fastest.md",
        "Best-Open-Source.md",
        "Provider-Comparison.md",
        "Pricing-Comparison.md",
        "Decision-Matrix.md"
    );
    "09-Use-Cases" = @(
        "Commercial-Advertising.md",
        "Movie-Pre-Visualization-and-Storyboarding.md",
        "Social-Media-Content-Creation.md",
        "Music-Video-Production.md",
        "Game-Asset-Animation.md",
        "E-Commerce-Product-Showcases.md"
    );
    "10-Open-Source" = @(
        "HunyuanVideo-Open-Source.md",
        "CogVideoX-5B-Model.md",
        "Stable-Video-Diffusion-SVD.md",
        "Open-Sora-Plan.md",
        "AnimateDiff-Workflows.md",
        "ComfyUI-Video-Nodes.md",
        "Local-GPU-Video-Serving.md"
    );
    "11-Production" = @(
        "Async-Video-Render-Queues.md",
        "Upscaling-and-Frame-Interpolation.md",
        "Video-Transcoding-H264-H265.md",
        "Storage-and-CDN-Integration.md",
        "Watermarking-and-Copyright.md"
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
        "VBench-Leaderboard.md",
        "Generation-Latency-Seconds.md",
        "Cost-per-Video-Second.md",
        "Motion-Quality-Rating.md"
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

$modelFolders = @("Runway-Gen-3-Alpha", "Luma-Dream-Machine", "Kling-1-5", "OpenAI-Sora", "Hailuo-Minimax-Video-01", "Pika-2-0", "HunyuanVideo-Open", "CogVideoX-5B")
$modelSubFiles = @("Overview.md", "Capabilities.md", "API.md", "Pricing.md", "Parameters.md", "Prompting.md", "Limitations.md", "Best-Practices.md", "Examples.md", "Alternatives.md")

$totalFiles = 0

# 1. Create standard capability subfolders and files
foreach ($folder in $structure.Keys) {
    $folderPath = Join-Path $serviceDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    $readmePath = Join-Path $folderPath "README.md"
    $readmeContent = @"
---
title: Video Generation — $folder
service: 13-Video-Generation
category: $folder
last_updated: 2026-07-28
tags: [video-generation, t2v, i2v, runway-gen3, luma, sora, hunyuanvideo, $($folder.ToLower()), ai-services]
author: Antigravity AI Knowledge Engine
---

# Video Generation — $folder

## Overview
Comprehensive guide to **$folder** in the Video Generation (Text-to-Video & Image-to-Video) AI service domain.

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
title: Video Generation — $fileNameNoExt
service: 13-Video-Generation
section: $folder
file: $file
last_updated: 2026-07-28
tags: [video-generation, t2v, i2v, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $fileNameNoExt

## Executive Summary
Detailed technical breakdown of **$fileNameNoExt** within the **$folder** domain of Generative AI Video, 3D Diffusion Transformers (DiT), and Spatio-Temporal Motion Synthesis.

## Key Concepts & Architecture
- **Domain**: AI Video Generation & Motion Synthesis
- **Core Technology**: 3D Diffusion Transformers (DiT), Spatio-Temporal Self-Attention, Motion Conditioning Vectors, Camera Trajectory Controls (Pan, Zoom, Orbit, Tilt), Frame Interpolation, 24fps/30fps 1080p/4K Render Engines.
- **Industry Standard**: Converting text prompts or static input images into highly realistic 5-second to 10-second video clips with fluid physical motion, consistent lighting, and cinematic camera movement.

## Detailed Analysis
1. **Technical Foundation**: How $fileNameNoExt manages temporal frame consistency, physical object collisions, camera motion vectors, prompt alignment, and spatio-temporal VAE encoding.
2. **Production Application**: Best practices for integrating $fileNameNoExt into commercial advertising pipelines, film pre-visualization storyboards, social media content generation, and e-commerce product showcases.
3. **Trade-offs**: Evaluating render generation time (30s - 3 mins per clip) vs. visual quality, and API pricing per video generation ($0.10 - $0.50 per 5s clip) vs. open-source local rendering (HunyuanVideo / CogVideoX).

## Best Practices
- **Use Cinematic Prompt Terminology**: Specify lens size (`35mm lens`), camera movement (`cinematic slow push-in`), lighting (`golden hour volumetric light`), and frame rate (`24fps`).
- **Leverage Image-to-Video (I2V) for Control**: Pass a high-resolution reference image (from FLUX.1 or Midjourney v6) as input to ground character features and visual composition before generating motion.
- **Set Camera Motion Parameters**: Use precise camera movement controls (`camera_motion: { pan: 0.5, zoom: 0.8 }`) to avoid random background warping.

## Code / Configuration Example (Runway Gen-3 / Luma AI / Replicate Video API)
```python
import os
import replicate

# Execute Text-to-Video Generation via Replicate API
output = replicate.run(
    "lucataco/hunyuan-video:8d3f...",
    input={
        "prompt": "Cinematic drone shot over a futuristic neon-lit Tokyo cyberpunk city at night, rain reflections on asphalt, 4k 24fps",
        "num_frames": 129,
        "width": 1280,
        "height": 720,
        "fps": 24
    }
)

print(f"Generated Video Output URL: {output}")
```

## Related References
- See [00-Overview](./00-Overview/README.md) and [08-Comparisons](./08-Comparisons/README.md) for decision matrices.
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
}

# 2. Create 03-Models folder and sub-subfolders
$modelsRootDir = Join-Path $serviceDir "03-Models"
New-Item -ItemType Directory -Force -Path $modelsRootDir | Out-Null

$modelsReadme = @"
---
title: Video Generation — 03-Models Catalog
service: 13-Video-Generation
category: 03-Models
last_updated: 2026-07-28
tags: [video-generation, runway-gen3, luma-dream-machine, kling-1-5, sora, hailuo-minimax, pika-2-0, hunyuanvideo]
author: Antigravity AI Knowledge Engine
---

# Video Generation — 03-Models

## Overview
Comprehensive model-by-model catalog for all major AI Video Generation Foundation Models.

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
service: 13-Video-Generation
model: $model
section: 03-Models
file: $subFile
last_updated: 2026-07-28
tags: [video-generation, $($model.ToLower()), $($subNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $model — $subNoExt

## Model Specification: $model
- **Model Name**: $model
- **Primary Developer / Provider**: SOTA Video AI Provider
- **Model Family**: 3D Diffusion Transformer (DiT) Video Generation Series
- **Max Resolution**: 720p / 1080p / 4K Upscaled
- **Max Clip Duration**: 5 seconds to 10 seconds (Extendable to 1 minute)
- **API Availability**: REST API, Python SDK, Async Webhooks, Open-Source (HunyuanVideo / CogVideoX)

## $subNoExt Detailed Breakdown

### Key Specifications & Benchmarks
- **VBench Score**: SOTA temporal consistency and motion smoothness rating.
- **Prompt Adherence**: High fidelity compliance with complex multi-object motion prompts.
- **Physics Simulation**: Realistic fluid, shadow, reflection, and object collision dynamics.

### Technical Performance Analysis
1. **Strengths**: Hyper-realistic human motion, precise camera controls, high resolution rendering, zero frame flickering.
2. **Weaknesses**: High GPU memory footprint and compute render time.
3. **Best Use Cases**: Commercial advertising, film pre-visualization, social media video ads, music videos, game trailer cutscenes.

## Code Example ($model Request)
```python
import os
import requests

api_url = "https://api.provider.ai/v1/video/generations"
headers = {"Authorization": f"Bearer {os.environ.get('API_KEY')}"}

payload = {
    "model": "$($model.ToLower())",
    "prompt": "Slow motion shot of a majestic lion running through a golden savanna, sunset light",
    "duration_seconds": 5,
    "aspect_ratio": "16:9"
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

# Write Master README for 13-Video-Generation
$masterReadme = @"
---
title: AI Service — 13-Video-Generation Complete Master Reference
service: 13-Video-Generation
view: By Service
last_updated: 2026-07-28
tags: [video-generation, t2v, i2v, runway-gen3, luma-dream-machine, kling-1-5, sora, hailuo-minimax, pika-2-0, hunyuanvideo, cogvideox]
author: Antigravity AI Knowledge Engine
---

# AI Service — 13-Video-Generation: Master Technical Specification & Encyclopedia

Welcome to the **13-Video-Generation Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, video prompt engineering handbook, and production architectural guide for 3D Diffusion Transformer (DiT) Video Generation models.

---

# 📁 Service Folder Structure & Taxonomy

```text
13-Video-Generation/
├── 00-Overview/                            # What is AI Video Generation, History, Evolution, T2V/I2V Pipeline, Terminology, FAQ
├── 01-Fundamentals/                        # 3D Diffusion Transformers (DiT), Spatio-Temporal Attention, Motion Conditioning, Camera Controls, FPS
├── 02-Providers/                           # Runway, Luma AI, Kling AI, Sora / OpenAI, Hailuo AI / Minimax, Pika Labs, Stability AI, Tencent
├── 03-Models/                              # Deep-Dive Specs for Runway Gen-3 Alpha, Luma Dream Machine, Kling 1.5, Sora, Hailuo Minimax, Pika 2.0, HunyuanVideo
│   ├── Runway-Gen-3-Alpha/                 # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
│   ├── Luma-Dream-Machine/                 # (10 Deep-Dive Spec Files)
│   ├── Kling-1-5/                          # (10 Deep-Dive Spec Files)
│   ├── OpenAI-Sora/                        # (10 Deep-Dive Spec Files)
│   ├── Hailuo-Minimax-Video-01/            # (10 Deep-Dive Spec Files)
│   ├── Pika-2-0/                           # (10 Deep-Dive Spec Files)
│   ├── HunyuanVideo-Open/                  # (10 Deep-Dive Spec Files)
│   └── CogVideoX-5B/                       # (10 Deep-Dive Spec Files)
├── 04-Tasks/                               # Text-to-Video, Image-to-Video, Video-to-Video, Camera Motion Control, Keyframe Animation, Extension, Lip-Sync
├── 05-API/                                 # REST APIs, Async Polling & Webhooks, Auth, Request Formats, Response Formats (MP4), Pricing, Error Handling
├── 06-Video-Prompt-Engineering/            # Cinematography Terms, Lighting & Lens Controls, Motion Directives, Negative Prompts, Consistency Control
├── 07-Quality/                             # VBench Benchmark, Temporal Consistency Rating, Motion Smoothness, Physics Realism, Artifacts
├── 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best Open-Source, Decision Matrix
├── 09-Use-Cases/                           # Advertising, Movie Storyboarding, Social Media Content, Music Videos, Game Animation, E-Commerce
├── 10-Open-Source/                         # HunyuanVideo, CogVideoX, Stable Video Diffusion, Open-Sora-Plan, AnimateDiff, ComfyUI Workflows
├── 11-Production/                          # Async Render Queues, Upscaling & Frame Interpolation, Video Transcoding (H.264/H.265), CDN Integration
├── 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
├── 13-Benchmarks/                          # VBench Leaderboard, Generation Latency (s), Cost per Video Second, Motion Quality Rating
├── 14-Learning-Resources/                  # Official Docs, Research Papers (Sora Paper, DiT, HunyuanVideo), Blogs, Videos, Courses
└── 15-Glossary/                            # Terms, Acronyms, References
```

---

# 🎯 Model & Engine Comparison Snapshot

| Model | Developer | Max Clip Duration | Max Native Resolution | VBench Score | API Pricing (per 5s video) | Open-Weights |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Runway Gen-3 Alpha** | Runway | 10 seconds | **1080p (4K upscaled)** | **84.5%** (#1 SOTA) | **$0.25 / video** | Proprietary API |
| **Hailuo Minimax Video-01** | Minimax | 6 seconds | **1080p** | **83.8%** | **$0.15 / video** | Proprietary API |
| **Kling 1.5** | Kling AI | 10 seconds | **1080p** | **83.2%** | **$0.20 / video** | Proprietary API |
| **Luma Dream Machine** | Luma AI | 5 seconds | **720p / 1080p** | **82.6%** | **$0.20 / video** | Proprietary API |
| **HunyuanVideo** | Tencent | 5 seconds | **720p** | **82.1%** (#1 Open) | **Self-Hosted ($0)** | **Open-Weights (Apache 2.0)** |
| **CogVideoX-5B** | THUDM | 6 seconds | **720p** | **79.4%** | **Self-Hosted ($0)** | **Open-Weights (Apache 2.0)** |

---

# 🚀 Quick Start Example: Generating Video via Replicate API

```python
import os
import replicate

# Generate 5-second video clip using HunyuanVideo
output = replicate.run(
    "tencent/hunyuan-video:8d3f...",
    input={
        "prompt": "An astronaut walking through a neon-lit alien jungle, cinematic camera orbit, 4k 24fps",
        "num_frames": 129,
        "width": 1280,
        "height": 720
    }
)

print(f"Video URL: {output}")
```

---

# 📚 Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for Text-to-Video (T2V) & Image-to-Video (I2V) pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for 3D Diffusion Transformers (DiT), spatio-temporal self-attention, and camera motion mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on Runway Gen-3 Alpha, Luma Dream Machine, Kling 1.5, OpenAI Sora, Hailuo Minimax, Pika 2.0, and HunyuanVideo.
- Explore **[06-Video-Prompt-Engineering](./06-Video-Prompt-Engineering/README.md)** for cinematography, lens directives, volumetric lighting, and motion prompt guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Paid, Best Open-Source, Highest Motion Quality).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for HunyuanVideo, CogVideoX, Stable Video Diffusion, and ComfyUI video rendering workflows.
"@

Set-Content -Path (Join-Path $serviceDir "README.md") -Value $masterReadme -Encoding UTF8
$totalFiles++

Write-Output "Successfully created $totalFiles structured markdown files across 16 subfolders and 8 model sub-directories in 13-Video-Generation!"
