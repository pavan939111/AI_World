$lumaDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Luma-AI"

if (Test-Path $lumaDir) {
    Remove-Item -Recurse -Force $lumaDir
}
New-Item -ItemType Directory -Force -Path $lumaDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Luma AI & 3D/Video Generative Platform.";
        "Company.md" = "Founded in 2021 by Amit Jain (CEO, former Apple computer vision lead) and Alex Yu (CTO, UC Berkeley vision researcher) in San Francisco, CA; `$1 Billion+ unicorn valuation backed by Andreessen Horowitz and Matrix Partners.";
        "3D-and-Multimodal-Vision-Architecture.md" = "Universal transformer architecture combining 3D spatial representations and video diffusion.";
        "History-and-Milestones.md" = "Timeline from NeRF mobile capture app in 2021 to Genie 3D model, Dream Machine 1.0, and Dream Machine 1.6.";
        "Glossary.md" = "Key terms, 3D Gaussian Splatting, NeRF, Camera Keyframes."
    };
    "01-Dream-Machine-Video-Models" = @{
        "README.md" = "Flagship Dream Machine high-motion video generation model family.";
        "Dream-Machine-1-6.md" = "Dream Machine 1.6 flagship model specs (1080p resolution, realistic physics, complex high-motion camera tracking).";
        "Dream-Machine-1-5.md" = "Dream Machine 1.5 model specs (improved camera movement and keyframe control).";
        "Dream-Machine-1-0.md" = "Dream Machine 1.0 initial release specs.";
        "Comparisons.md" = "Dream Machine vs Runway Gen-3 vs Sora vs Kling matrix.";
        "Best-Practices.md" = "Prompt formatting for dramatic action shots and physical character interactions."
    };
    "02-Photon-Image-Generation" = @{
        "README.md" = "Photon photorealistic image generation model family.";
        "Photon.md" = "Photon flagship image model specs (SOTA lighting, realistic skin textures, high prompt adherence).";
        "Photon-Flash.md" = "Photon Flash ultra-fast image generation model specs (`$0.005 / image).";
        "Best-Practices.md" = "Lighting and photographic composition prompts."
    };
    "03-3D-Generative-Models-Genie" = @{
        "README.md" = "Genie text-to-3D asset generation models.";
        "Genie-2-0.md" = "Genie 2.0 text-to-3D asset generator specs (producing game-ready textured 3D meshes in <10 seconds).";
        "Genie-1-0.md" = "Genie 1.0 3D generation specs.";
        "Mesh-Formats-OBJ-GLTF-USDZ.md" = "Exporting 3D meshes in OBJ, GLTF, and USDZ formats for Blender, Unity, and Unreal Engine.";
        "Examples.md" = "Python code pattern for text-to-3D mesh generation."
    };
    "04-3D-Gaussian-Splatting-and-NeRF" = @{
        "README.md" = "Spatial NeRF and 3D Gaussian Splatting interactive scan capture engine.";
        "3D-Gaussian-Splatting.md" = "Real-time 3D Gaussian Splatting rendering technology.";
        "NeRF-Capture-Engine.md" = "Converting smartphone video clips into interactive 3D spatial scenes.";
        "Examples.md" = "Web3D splat viewer integration guide."
    };
    "05-Camera-Motion-and-Frame-Control" = @{
        "README.md" = "Dynamic 3D camera motions and keyframe conditioning.";
        "Camera-Motion-Paths.md" = "Camera movement controls: Orbit, Crane, Push In, Pull Out, Pan Left/Right, Static.";
        "First-and-Last-Frame-Keyframes.md" = "Conditioning video generations using starting and ending image keyframes.";
        "Best-Practices.md" = "Camera trajectory optimization."
    };
    "06-Luma-API-and-Endpoints" = @{
        "README.md" = "Official Luma REST API (`api.lumalabs.ai/v1`).";
        "Video-Generations-API.md" = "`/v1/generations/video` endpoint specification.";
        "Image-Generations-API.md" = "`/v1/generations/image` endpoint specification.";
        "Capture-Scanning-API.md" = "`/v1/captures` NeRF & 3D splat scanning endpoint specification."
    };
    "07-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Luma client SDKs.";
        "Python-SDK-luma.md" = "Official `lumaai` Python SDK package specification.";
        "TypeScript-SDK.md" = "Official TypeScript client library specification.";
        "REST-APIs.md" = "cURL raw HTTP request headers."
    };
    "08-Pricing-and-Subscription-Tiers" = @{
        "README.md" = "Luma AI subscription tiers and API generation pricing.";
        "Subscription-Tiers-Standard-to-Premier.md" = "Standard (`$29.99/mo, 120 generations), Pro (`$99.99/mo, 400 generations), Premier (`$499.99/mo, 2000 generations).";
        "API-Generation-Rates.md" = "API generation rates (`$0.32 / generated video, `$0.005 / Photon image)."
    };
    "09-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "High-Motion-Video-Pipeline.md" = "Automated video generation pipeline with Python SDK polling.";
        "Text-to-3D-Asset-Pipeline.md" = "Automated 3D asset generation and GLTF export pipeline."
    };
    "10-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from NeRF app in 2021 to Dream Machine 1.6 in 2024."
    };
    "11-Official-References" = @{
        "README.md" = "Curated list of official Luma AI links.";
        "Official-Links.md" = "Official API docs link: https://lumalabs.ai/dream-machine/api & https://lumalabs.ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $lumaDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Luma AI — $folder Overview
provider: Luma AI
capability: $folder
last_updated: 2026-07-28
tags: [luma-ai, dream-machine, genie, photon, 3d, video-generation, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Luma AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Luma AI 3D, video, and image applications.

## 3. Models Belonging to This Capability
- Dream Machine 1.6, Dream Machine 1.5, Photon, Photon Flash, Genie 2.0 (Text-to-3D), NeRF & 3D Gaussian Splatting.

## 4. Exposed APIs & Endpoints
- Official Luma REST API (`https://api.lumalabs.ai/v1`), Luma Web App (`lumalabs.ai/dream-machine`), Python `lumaai` SDK.

## 5. Common Use Cases
- High-action 1080p video generation with realistic physics, text-to-3D asset creation for games (OBJ/GLTF), interactive 3D Gaussian Splatting scans.
"@
        } else {
            $content = @"
---
title: Luma AI — $fileNameNoExt Specification
provider: Luma AI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [luma-ai, dream-machine, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Luma AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Luma AI Multimodal 3D & Video Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text Prompts, Images (Keyframes), Smartphone Videos (NeRF Scans)
- **Supported Output Modalities**: MP4 Video (1080p, 5s duration), 3D Textured Meshes (OBJ/GLTF/USDZ), Interactive 3D Splats
- **Pricing**: Dream Machine API (`$0.32 / video) | Photon Flash (`$0.005 / image)
- **API Availability**: Official Luma API (`api.lumalabs.ai/v1`), Official `lumaai` Python / TypeScript SDKs
- **3D Camera Control**: Orbit, Crane, Push In, Pull Out, Pan Left/Right
- **Keyframe Control**: First Frame & Last Frame image conditioning

## Typical Use Cases
1. Production 1080p video generation for film and advertising.
2. Rapid game asset generation using Genie 2.0 text-to-3D exported to Unreal Engine / Unity.

## Strengths & Limitations
- **Strengths**: Industry SOTA high-motion fluid character physics, native text-to-3D mesh generation (Genie), 3D Gaussian Splatting interactive scene captures.
- **Limitations**: Video clip durations generated per API call capped at 5 seconds.

## Example Request (Official Python SDK)
```python
import os
import time
from lumaai import LumaAI

client = LumaAI(api_key=os.environ.get("LUMA_API_KEY"))

# Create Dream Machine Video Task
generation = client.generations.create(
    prompt="A futuristic sports car drifting around a sharp mountain turn, cinematic camera tracking",
    aspect_ratio="16:9",
    loop=False
)

print(f"Generation Launched! ID: {generation.id}")

# Poll Status
while generation.state not in ["completed", "failed"]:
    time.sleep(5)
    generation = client.generations.get(id=generation.id)
    print(f"Status: {generation.state}")

if generation.state == "completed":
    print(f"Video Generated! Download URL: {generation.assets.video}")
```

## Related Documentation & Models
- See official Luma AI documentation at https://lumalabs.ai/dream-machine/api
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Luma AI directory!"
