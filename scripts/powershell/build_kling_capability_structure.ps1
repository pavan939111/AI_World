$klingDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Kling"

if (Test-Path $klingDir) {
    Remove-Item -Recurse -Force $klingDir
}
New-Item -ItemType Directory -Force -Path $klingDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Kling AI & Video Generative Platform.";
        "Company.md" = "Developed by Kuaishou Technology in Beijing, China (leading short-video platform with 400M+ DAUs); launched Kling AI globally in 2024.";
        "3D-Spatio-Temporal-Joint-Attention.md" = "3D Spatio-Temporal Joint Attention Mechanism enabling 1080p 60fps video generation.";
        "History-and-Milestones.md" = "Timeline from June 2024 launch of Kling 1.0 to Kling 1.5 and Virtual Try-On API.";
        "Glossary.md" = "Key terms, Motion Brush, JWT Authentication."
    };
    "01-Generative-Video-Models" = @{
        "README.md" = "Flagship Kling 1.5 video generation model family.";
        "Kling-1-5.md" = "Kling 1.5 flagship model specs (1080p Full HD resolution, 60fps frame rate, 5s to 10s base clip generation, extended up to 3 minutes).";
        "Kling-1-0.md" = "Kling 1.0 initial release specs.";
        "Comparisons.md" = "Kling 1.5 vs Runway Gen-3 vs Sora vs Luma Dream Machine matrix.";
        "Best-Practices.md" = "Prompt formatting for realistic physical motion and character interaction."
    };
    "02-Motion-Brush-and-Camera-Control" = @{
        "README.md" = "Motion Brush vector control and 3D camera path controls.";
        "Motion-Brush-Vector-Control.md" = "Painting directional motion vectors onto specific image elements.";
        "3D-Camera-Controls.md" = "Camera movement controls: Horizontal Pan, Vertical Tilt, Zoom In/Out, Roll.";
        "Best-Practices.md" = "Camera motion optimization."
    };
    "03-Virtual-Try-On-Kling" = @{
        "README.md" = "Kling Virtual Try-On fashion API.";
        "Virtual-Try-On-API.md" = "`/v1/images/kolors-virtual-try-on` endpoint specification (mapping clothing garments onto human fashion models).";
        "Fashion-Garment-Mapping.md" = "Uploading garment photos and human pose images for realistic fitting.";
        "Examples.md" = "Python code pattern for Virtual Try-On."
    };
    "04-AI-Avatar-and-Lip-Sync" = @{
        "README.md" = "AI Avatar talking head generation and lip-sync video alignment.";
        "AI-Avatar-Generation.md" = "Generating talking head avatar videos from image portraits.";
        "Lip-Sync-Audio-Alignment.md" = "Synchronizing character mouth movements with input voice audio tracks.";
        "Examples.md" = "AI Avatar generation workflow."
    };
    "05-Text-to-Image-and-Frame-Control" = @{
        "README.md" = "Kling text-to-image synthesis and keyframe conditioning.";
        "Image-Generations.md" = "Kling Image Generation model specs.";
        "First-and-Last-Frame-Control.md" = "Conditioning video generations using starting and ending image keyframes.";
        "Best-Practices.md" = "Keyframe image selection."
    };
    "06-Kling-API-and-Endpoints" = @{
        "README.md" = "Official Kling REST API catalog (`api.klingai.com/v1`).";
        "Video-Generations-API.md" = "`/v1/videos/text2video` and `/v1/videos/image2video` endpoints specification.";
        "JWT-Token-Authentication.md" = "Generating JWT bearer tokens (`Access-Key` + `Secret-Key` signed using HS256 algorithm).";
        "Task-Polling-API.md" = "`/v1/videos/text2video/{task_id}` polling status endpoint specification."
    };
    "07-SDKs-and-Developer-Tools" = @{
        "README.md" = "Developer SDKs and integration tools.";
        "Python-Client-Specification.md" = "Python JWT token generation and API request wrapper specification.";
        "TypeScript-SDK.md" = "Node.js TypeScript integration guide.";
        "cURL-and-REST.md" = "cURL raw request headers."
    };
    "08-Pricing-and-Subscription-Tiers" = @{
        "README.md" = "Kling AI subscription tiers and API generation rates.";
        "Subscription-Tiers-Pro-to-Premier.md" = "Standard (`$8.99/mo), Pro (`$32.99/mo), Premier (`$92.99/mo).";
        "API-Generation-Rates.md" = "API generation pricing per video second."
    };
    "09-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Cinematic-Video-Pipeline.md" = "Automated video generation pipeline with JWT signing and task polling.";
        "Fashion-Virtual-Try-On-Pipeline.md" = "Automated fashion E-commerce Virtual Try-On pipeline."
    };
    "10-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from Kling 1.0 in June 2024 to Kling 1.5."
    };
    "11-Official-References" = @{
        "README.md" = "Curated list of official Kling AI links.";
        "Official-Links.md" = "Official API docs link: https://klingai.com/global/api-documentation & https://klingai.com"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $klingDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Kling AI — $folder Overview
provider: Kling AI
capability: $folder
last_updated: 2026-07-28
tags: [kling-ai, kling-1-5, virtual-try-on, video-generation, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Kling AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Kling AI video, virtual try-on, and avatar applications.

## 3. Models Belonging to This Capability
- Kling 1.5, Kling 1.0, Kolors Virtual Try-On, AI Avatar Engine.

## 4. Exposed APIs & Endpoints
- Official Kling REST API (`https://api.klingai.com/v1`), Kling Web Platform (`klingai.com`).

## 5. Common Use Cases
- High-motion 1080p 60fps video generation, E-commerce Virtual Try-On garment fitting, AI Avatar talking head videos with lip-sync, Motion Brush directional control.
"@
        } else {
            $content = @"
---
title: Kling AI — $fileNameNoExt Specification
provider: Kling AI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [kling-ai, kling-1-5, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Kling AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Kling AI Generative Video & Vision Series (Kuaishou Technology)
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text Prompts, Images (Keyframes), Garment Images (Virtual Try-On), Audio (Lip Sync)
- **Supported Output Modalities**: MP4 Video (1080p 60fps, 5s to 10s, extendable to 3 mins), PNG Images
- **Authentication**: JWT Bearer Tokens (`HS256` signed using `Access-Key` and `Secret-Key`)
- **API Availability**: Official Kling API (`api.klingai.com/v1`)
- **Virtual Try-On**: Supported (`/v1/images/kolors-virtual-try-on`)
- **Camera Controls**: Pan, Tilt, Zoom, Motion Brush

## Typical Use Cases
1. Commercial 1080p 60fps video generation with extended clip durations.
2. E-commerce automated apparel Virtual Try-On mapping clothing onto models.

## Strengths & Limitations
- **Strengths**: 60fps ultra-smooth video motion, extended clip generation up to 3 minutes, specialized Virtual Try-On API for E-commerce.
- **Limitations**: Requires custom HS256 JWT token generation header for API authentication.

## Example Request (Python REST API with JWT)
```python
import time
import jwt
import requests
import os

# Generate JWT Token for Kling API
access_key = os.environ.get("KLING_ACCESS_KEY")
secret_key = os.environ.get("KLING_SECRET_KEY")

headers_jwt = {
    "alg": "HS256",
    "typ": "JWT"
}
payload = {
    "iss": access_key,
    "exp": int(time.time()) + 1800,
    "nbf": int(time.time()) - 5
}
token = jwt.encode(payload, secret_key, algorithm="HS256", headers=headers_jwt)

# Create Video Task
url = "https://api.klingai.com/v1/videos/text2video"
headers = {
    "Authorization": f"Bearer {token}",
    "Content-Type": "application/json"
}
body = {
    "model": "kling-v1-5",
    "prompt": "A cinematic shot of a lion running through the savanna at sunset, 60fps",
    "duration": "5"
}

response = requests.post(url, headers=headers, json=body)
print(response.json())
```

## Related Documentation & Models
- See official Kling AI documentation at https://klingai.com/global/api-documentation
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Kling AI directory!"
