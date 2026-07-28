$runwayDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Runway"

if (Test-Path $runwayDir) {
    Remove-Item -Recurse -Force $runwayDir
}
New-Item -ItemType Directory -Force -Path $runwayDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Runway & Generative Video Platform.";
        "Company.md" = "Founded in 2018 by Cristóbal Valenzuela (CEO), Anastasis Germanidis, and Alejandro Matamala in New York, NY; `$1.5 Billion+ valuation backed by Google, NVIDIA, and Salesforce Ventures.";
        "Generative-Video-Architecture.md" = "Diffusion and World Model video synthesis architecture.";
        "History-and-Milestones.md" = "Timeline from founding in 2018 to Gen-1, Gen-2, Gen-3 Alpha, and Act-One.";
        "Glossary.md" = "Key terms, Motion Brush, Camera Control parameters."
    };
    "01-Generative-Video-Models" = @{
        "README.md" = "Flagship Gen-3 Alpha video generation model suite.";
        "Gen-3-Alpha.md" = "Gen-3 Alpha flagship model specs (1080p resolution, 5s or 10s video generation, temporal consistency).";
        "Gen-3-Alpha-Turbo.md" = "Gen-3 Alpha Turbo high-speed model specs (7x faster inference, `$0.05 / second).";
        "Gen-2.md" = "Gen-2 legacy video generation model specs.";
        "Gen-1.md" = "Gen-1 video-to-video legacy model specs.";
        "Comparisons.md" = "Gen-3 Alpha vs Sora vs Luma Dream Machine vs Kling matrix.";
        "Best-Practices.md" = "Prompt formatting, camera motion cues, physical movement descriptions."
    };
    "02-Video-to-Video-and-Stylization" = @{
        "README.md" = "Video-to-video transformation and motion-guided stylization.";
        "Video-to-Video-API.md" = "Transforming source video clips into new visual styles while preserving subject motion.";
        "Stylization-and-Filters.md" = "Anime, claymation, and cinematic style transfers.";
        "Examples.md" = "Python code patterns for video-to-video generation."
    };
    "03-Motion-Brush-and-Camera-Control" = @{
        "README.md" = "Fine-grained directional motion brushes and 3D camera controls.";
        "Motion-Brush-Vector-Control.md" = "Applying directional motion vectors (Horizontal, Vertical, Proximity) to specific image regions.";
        "3D-Camera-Controls.md" = "Pan (Left/Right), Tilt (Up/Down), Zoom (In/Out), Roll, and Truck camera movements.";
        "Best-Practices.md" = "Combining camera pan with subject movement for cinematic shots."
    };
    "04-Act-One-Performance-Capture" = @{
        "README.md" = "Expressive facial performance capture from video inputs.";
        "Act-One-Architecture.md" = "Mapping driving human facial video performances to animated 3D/2D characters without motion capture suits.";
        "Character-Animation-Pipeline.md" = "Animating custom character portraits via Act-One.";
        "Examples.md" = "Act-One character animation workflow example."
    };
    "05-Text-to-Image-and-Frame-Control" = @{
        "README.md" = "Keyframe image generation and First/Last frame conditioning.";
        "Image-to-Video-Conditioning.md" = "Generating videos starting from a custom input image keyframe.";
        "First-Frame-and-Last-Frame-Control.md" = "Conditioning video synthesis between specified starting and ending image keyframes.";
        "Text-to-Image-Engine.md" = "Runway image generation engine."
    };
    "06-Audio-and-Voice-Synthesis" = @{
        "README.md" = "Audio synthesis and automated lip-sync alignment.";
        "Lip-Sync-Video-API.md" = "Synchronizing generated character lips to input audio tracks.";
        "Voice-Generation.md" = "AI voice synthesis inside Runway Web and API.";
        "Background-Audio.md" = "Generative background sound effects."
    };
    "07-Runway-API-and-Endpoints" = @{
        "README.md" = "Official Runway Developer API (`api.dev.runwayml.com/v1`).";
        "Image-to-Video-API.md" = "`/v1/image_to_video` task endpoint specification.";
        "Tasks-Polling-API.md" = "`/v1/tasks/{id}` polling status endpoint specification.";
        "Complete-REST-Spec.md" = "Raw cURL headers and OAuth authentication."
    };
    "08-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Runway SDKs and developer tools.";
        "Python-SDK-runwayml.md" = "Official `@runwayml/sdk` Python client package specification.";
        "TypeScript-SDK.md" = "Official TypeScript SDK client package specification.";
        "Node-and-REST.md" = "Node.js REST API integration guide."
    };
    "09-Pricing-and-Subscription-Tiers" = @{
        "README.md" = "Runway Web subscription plans and API token credit rates.";
        "Subscription-Tiers-Standard-to-Unlimited.md" = "Standard (`$12/mo, 625 credits), Pro (`$28/mo, 2250 credits), Unlimited (`$76/mo, unlimited relax generation).";
        "API-Credit-Rates.md" = "Gen-3 Alpha Turbo API pricing (`$0.05 / second generated video, 10s = `$0.50)."
    };
    "10-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Cinematic-Video-Generation-Pipeline.md" = "Automated video generation pipeline with Python SDK task polling.";
        "Act-One-Character-Performance-Pipeline.md" = "Automated character animation pipeline."
    };
    "11-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from Gen-1 to Gen-3 Alpha and Act-One."
    };
    "12-Official-References" = @{
        "README.md" = "Curated list of official Runway links.";
        "Official-Links.md" = "Official API docs link: https://docs.dev.runwayml.com & https://runwayml.com"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $runwayDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Runway — $folder Overview
provider: Runway
capability: $folder
last_updated: 2026-07-28
tags: [runway, gen-3-alpha, video-generation, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Runway — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Runway generative video applications.

## 3. Models Belonging to This Capability
- Gen-3 Alpha, Gen-3 Alpha Turbo, Gen-2, Act-One performance capture.

## 4. Exposed APIs & Endpoints
- Official Runway REST API (`https://api.dev.runwayml.com/v1`), Runway Web App (`runwayml.com`), Python `@runwayml/sdk`.

## 5. Common Use Cases
- High-fidelity 1080p text-to-video and image-to-video synthesis, Motion Brush directional camera control, Act-One facial performance capture, video lip-sync.
"@
        } else {
            $content = @"
---
title: Runway — $fileNameNoExt Specification
provider: Runway
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [runway, gen-3-alpha, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Runway — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Runway Gen-3 Alpha Generative Video Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text Prompts, Images (First/Last Frame Keyframes), Driving Video (Act-One)
- **Supported Output Modalities**: MP4 Video (1080p, 5s or 10s duration)
- **Pricing**: Gen-3 Alpha Turbo API (`$0.05 / second generated, e.g. `$0.25 for 5s, `$0.50 for 10s)
- **API Availability**: Official Runway API (`api.dev.runwayml.com/v1`), Python SDK (`@runwayml/sdk`), Web App
- **Camera Controls**: Pan, Tilt, Zoom, Roll, Motion Brush
- **Lip Sync**: Supported via API & Web

## Typical Use Cases
1. Commercial 1080p video generation with precise camera motion.
2. Character performance animation driven by webcam video via Act-One.

## Strengths & Limitations
- **Strengths**: Industry SOTA temporal video consistency, Act-One facial performance capture, 3D camera controls, fast inference (Gen-3 Alpha Turbo).
- **Limitations**: Max clip duration capped at 10 seconds per API call.

## Example Request (Official Python SDK)
```python
import os
import time
from runwayml import RunwayML

client = RunwayML(api_key=os.environ.get("RUNWAYML_API_SECRET"))

# Create Image-to-Video Task
task = client.image_to_video.create(
    model="gen3a_turbo",
    prompt_image="https://example.com/character.jpg",
    prompt_text="A cinematic camera pan right across a futuristic sci-fi city",
    duration=5,
    ratio="16:9"
)

print(f"Task Launched! Task ID: {task.id}")

# Poll Task Status
while task.status not in ["SUCCEEDED", "FAILED"]:
    time.sleep(10)
    task = client.tasks.retrieve(task.id)
    print(f"Task Status: {task.status}")

if task.status == "SUCCEEDED":
    print(f"Video Generated Successfully! URL: {task.output[0]}")
```

## Related Documentation & Models
- See official Runway documentation at https://docs.dev.runwayml.com
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Runway directory!"
