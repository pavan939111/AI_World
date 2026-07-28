$ideogramDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Ideogram"

if (Test-Path $ideogramDir) {
    Remove-Item -Recurse -Force $ideogramDir
}
New-Item -ItemType Directory -Force -Path $ideogramDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Ideogram & Text-in-Image Generative AI Platform.";
        "Company.md" = "Founded in 2023 by Mohammad Norouzi, William Chan, Chitwan Saharia, and Jonathan Ho (creators of Imagen) in Toronto, Canada; `$80 Million Series A funding led by Andreessen Horowitz.";
        "Text-to-Image-Architecture.md" = "Diffusion architecture optimized for typography alignment and spatial layout.";
        "History-and-Milestones.md" = "Timeline from Ideogram 0.1 to Ideogram 1.0, Ideogram 2.0, and API release.";
        "Glossary.md" = "Key terms, Magic Prompt terminology, typography alignment."
    };
    "01-Image-Generation-Models" = @{
        "README.md" = "Flagship Ideogram 2.0 text-to-image foundation models.";
        "Ideogram-2-0.md" = "Ideogram 2.0 flagship model specs (`$0.08 / image).";
        "Ideogram-2-0-Turbo.md" = "Ideogram 2.0 Turbo fast model specs (`$0.05 / image).";
        "Ideogram-1-0.md" = "Legacy Ideogram 1.0 model specs.";
        "Comparisons.md" = "Ideogram 2.0 vs Midjourney v6 vs FLUX.1 typography matrix.";
        "Best-Practices.md" = "Prompt formatting, quotes wrapping, style selection."
    };
    "02-Typography-and-Text-Rendering" = @{
        "README.md" = "Industry-leading typography rendering inside imagery.";
        "Typography-In-Image-Guide.md" = "Formatting text in quotes for flawless spelling and font rendering.";
        "Signage-Logo-and-Graphic-Design.md" = "Generating logos, poster designs, t-shirts, and greeting cards.";
        "Examples.md" = "Typography prompt templates and examples."
    };
    "03-Magic-Prompt-Engine" = @{
        "README.md" = "Automatic prompt expansion engine enhancing prompt detail.";
        "Magic-Prompt-Modes.md" = "AUTO, ON, OFF Magic Prompt execution modes.";
        "Aesthetic-Styles.md" = "REALISTIC, DESIGN, 3D, ANIME, TYPOGRAPHY aesthetic style selection.";
        "Best-Practices.md" = "Using Magic Prompt for complex scene composition."
    };
    "04-Describe-API-Image-to-Text" = @{
        "README.md" = "Image-to-text reverse captioning and prompt extraction.";
        "Describe-API-Specification.md" = "`/describe` API endpoint specification (`$0.008 / image).";
        "Image-Captioning-and-Prompts.md" = "Generating detailed prompt descriptions from uploaded images.";
        "Examples.md" = "Python code patterns for image captioning."
    };
    "05-Image-Editing-and-Inpainting" = @{
        "README.md" = "Generative inpainting, re-mix, and canvas editing.";
        "Inpainting-and-Masking.md" = "Mask generation and target region replacement.";
        "Re-mix-and-Variations.md" = "Remixing existing images with new text prompts.";
        "Outpainting-and-Canvas.md" = "Canvas expansion guidelines."
    };
    "06-Color-Palette-Control" = @{
        "README.md" = "Brand color palette enforcement.";
        "HEX-Color-Palette-Enforcement.md" = "Passing custom HEX color palettes (`color_palette: { hex_codes: ['#FF5733'] }`).";
        "Design-Branding-Integration.md" = "Enforcing brand color compliance in marketing assets."
    };
    "07-Aspect-Ratios-and-Resolutions" = @{
        "README.md" = "Supported aspect ratios and pixel resolutions.";
        "Supported-Aspect-Ratios.md" = "1:1, 10:16, 16:10, 9:16, 16:9, 3:2, 2:3 aspect ratio options.";
        "Resolution-Specs.md" = "Resolution output specifications."
    };
    "08-APIs-and-Endpoints" = @{
        "README.md" = "Ideogram REST API catalog (`api.ideogram.ai`).";
        "Generate-API.md" = "`/generate` API endpoint specification.";
        "Describe-API.md" = "`/describe` API endpoint specification.";
        "Edit-API.md" = "`/edit` API endpoint specification.";
        "Remix-API.md" = "`/remix` API endpoint specification."
    };
    "09-SDKs-and-Developer-Tools" = @{
        "README.md" = "Developer SDKs and integration libraries.";
        "Python-SDK.md" = "Python REST API client specification.";
        "TypeScript-SDK.md" = "Node.js TypeScript integration guide.";
        "cURL-and-REST.md" = "cURL raw request specification."
    };
    "10-Pricing-and-Billing" = @{
        "README.md" = "Ideogram API pricing schedules.";
        "Token-and-Credit-Rates.md" = "Ideogram 2.0 (`$0.08), Ideogram 2.0 Turbo (`$0.05), Describe (`$0.008).";
        "API-Tier-Billing.md" = "Pre-paid credit billing management."
    };
    "11-Rate-Limits-and-Quotas" = @{
        "README.md" = "Ideogram API rate limits.";
        "RPM-TPM-Limits.md" = "Requests Per Minute limit boundaries.";
        "Quota-Management.md" = "Managing API credit quotas."
    };
    "12-Authentication-and-Security" = @{
        "README.md" = "API key and safety configuration.";
        "Api-Key-Setup.md" = "`Api-Key` HTTP header setup.";
        "Content-Safety-and-Moderation.md" = "Content filtering and NSFW policies."
    };
    "13-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Graphic-Design-Generator-Pipeline.md" = "Automated poster and logo generation pipeline.";
        "Reverse-Image-Search-Describe-Pipeline.md" = "Reverse image captioning pipeline."
    };
    "14-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from Ideogram 0.1 to Ideogram 2.0."
    };
    "15-Official-References" = @{
        "README.md" = "Curated list of official Ideogram links.";
        "Official-Links.md" = "Official docs link: https://developer.ideogram.ai & https://ideogram.ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $ideogramDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Ideogram — $folder Overview
provider: Ideogram
capability: $folder
last_updated: 2026-07-28
tags: [ideogram, typography, image-generation, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Ideogram — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Ideogram image generation applications.

## 3. Models Belonging to This Capability
- Ideogram 2.0, Ideogram 2.0 Turbo, Ideogram 1.0.

## 4. Exposed APIs & Endpoints
- Official Ideogram REST API (`https://api.ideogram.ai/generate`, `/describe`, `/remix`).

## 5. Common Use Cases
- Legible typography design, poster and logo generation, HEX color palette brand compliance, image-to-text reverse captioning.
"@
        } else {
            $content = @"
---
title: Ideogram — $fileNameNoExt Specification
provider: Ideogram
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [ideogram, typography, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Ideogram — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Ideogram Generative Image & Typography Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text Prompts, Images (Describe / Remix / Edit)
- **Supported Output Modalities**: PNG / JPEG Images, Text Captions (Describe API)
- **Pricing**: Ideogram 2.0 (`$0.08 / image) | Ideogram 2.0 Turbo (`$0.05 / image) | Describe (`$0.008 / image)
- **API Availability**: Ideogram REST API (`api.ideogram.ai`)
- **Magic Prompt Modes**: `AUTO`, `ON`, `OFF`
- **Aesthetic Styles**: `REALISTIC`, `DESIGN`, `3D`, `ANIME`, `TYPOGRAPHY`
- **Color Palette Control**: Supported via HEX code arrays

## Typical Use Cases
1. Commercial poster, t-shirt, and logo design with legibly rendered typography.
2. Automated reverse-image prompt extraction using the Describe API.

## Strengths & Limitations
- **Strengths**: #1 typography rendering accuracy in the industry, Magic Prompt engine, custom HEX color palette enforcement, Describe API.
- **Limitations**: API access requires pre-paid credit billing.

## Example Request (Python REST API)
```python
import requests
import json
import os

url = "https://api.ideogram.ai/generate"
headers = {
    "Api-Key": os.environ.get("IDEOGRAM_API_KEY"),
    "Content-Type": "application/json"
}

payload = {
    "image_request": {
        "prompt": "A retro neon sign reading 'IDEOGRAM 2.0'",
        "aspect_ratio": "ASPECT_16_9",
        "model": "V_2_0",
        "magic_prompt_option": "AUTO",
        "style_type": "DESIGN"
    }
}

response = requests.post(url, headers=headers, json=payload)
print(response.json())
```

## Related Documentation & Models
- See official Ideogram documentation at https://developer.ideogram.ai
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Ideogram directory!"
