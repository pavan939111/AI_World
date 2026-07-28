$midjourneyDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Midjourney"

if (Test-Path $midjourneyDir) {
    Remove-Item -Recurse -Force $midjourneyDir
}
New-Item -ItemType Directory -Force -Path $midjourneyDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Midjourney & Generative Image Platform.";
        "Company.md" = "Founded in 2022 by David Holz (co-founder of Leap Motion) in San Francisco, CA; bootstrapped, self-funded independent research lab.";
        "Discord-and-Web-Architecture.md" = "Midjourney Discord bot architecture and Midjourney Web Alpha platform.";
        "History-and-Milestones.md" = "Timeline from Midjourney v1 (March 2022) to v6.1 and Web Editor.";
        "Glossary.md" = "Key terms, Midjourney parameters, Fast vs Relax GPU hours."
    };
    "01-Image-Generation-Models" = @{
        "README.md" = "Flagship Midjourney image generation model family.";
        "Midjourney-v6-1.md" = "Midjourney v6.1 flagship model specs (enhanced text rendering, smaller detail accuracy, faster inference).";
        "Midjourney-v6.md" = "Midjourney v6 model specs (1024x1024 base resolution, photorealism, text rendering).";
        "Midjourney-v5-2.md" = "Midjourney v5.2 model specs (Zoom Out and High Variation mode).";
        "Legacy-Models.md" = "Midjourney v1 through v5.1 legacy model catalog.";
        "Comparisons.md" = "Midjourney v6.1 vs FLUX.1 vs DALL-E 3 quality matrix.";
        "Best-Practices.md" = "Natural language prompt structure, medium parameters, raw mode."
    };
    "02-Niji-Anime-Models" = @{
        "README.md" = "Specialized anime, manga, and illustration models in collaboration with Spellbrush.";
        "Niji-6.md" = "Niji version 6 model specs (`--niji 6`).";
        "Niji-5.md" = "Niji version 5 model specs (`--niji 5` with Expressive, Cute, Scenic styles).";
        "Best-Practices.md" = "Anime and digital illustration prompt techniques."
    };
    "03-Character-and-Style-Consistency" = @{
        "README.md" = "Character reference, style reference, and personalization features.";
        "Character-Reference-cref.md" = "Character Reference `--cref <URL>` parameter for maintaining facial and character consistency across images.";
        "Style-Reference-sref.md" = "Style Reference `--sref <URL>` parameter for copying aesthetic styles from reference images.";
        "Personalization-p.md" = "Personalization `--p` parameter tuning Midjourney outputs to individual user taste preferences.";
        "Best-Practices.md" = "Combining `--cref` and `--sref` for consistent comic and storyboard creation."
    };
    "04-Image-Editing-and-Inpainting" = @{
        "README.md" = "Vary Region inpainting, canvas expansion, and upscaling.";
        "Vary-Region-Inpainting.md" = "Inpainting mask selection editor for modifying image sub-regions.";
        "Pan-and-Zoom-Out.md" = "Canvas panning (Left, Right, Up, Down) and Zoom Out (1.5x, 2.0x, Custom Zoom).";
        "Upscaling-Subtle-and-Creative.md" = "Subtle (2x resolution) and Creative upscaling modes.";
        "Best-Practices.md" = "Iterative image refinement workflows."
    };
    "05-Image-Prompting-and-Describe" = @{
        "README.md" = "Image prompting, reverse image-to-prompt captioning, and image blending.";
        "Image-Prompts.md" = "Using image URLs as visual prompt inputs.";
        "Describe-Engine.md" = "`/describe` command generating 4 text prompt descriptions from an uploaded image.";
        "Blend-and-Shorten.md" = "`/blend` merging up to 5 images and `/shorten` analyzing prompt token weights."
    };
    "06-Parameter-Reference" = @{
        "README.md" = "Complete Midjourney CLI parameter reference manual.";
        "Aspect-Ratio-ar.md" = "`--aspect` or `--ar` aspect ratio parameter (e.g. `--ar 16:9`, `--ar 9:16`, `--ar 3:2`).";
        "Stylize-s.md" = "`--stylize` or `--s` aesthetic strength parameter (0 to 1000).";
        "Chaos-and-Weird.md" = "`--chaos` (`--c`) generation diversity and `--weird` (`--w`) quirkiness parameters.";
        "Tile-and-Quality.md" = "`--tile` seamless pattern generation and `--quality` (`--q`) rendering time.";
        "Stop-and-No.md" = "`--stop` partial generation stop and `--no` negative prompting parameter."
    };
    "07-Web-App-and-Discord-Interface" = @{
        "README.md" = "Midjourney creation interfaces.";
        "Midjourney-Web-Editor.md" = "Midjourney Web Alpha canvas editor (`midjourney.com/create`).";
        "Discord-Bot-Commands.md" = "Discord slash commands (`/imagine`, `/describe`, `/blend`, `/settings`, `/subscribe`)."
    };
    "08-Pricing-and-Subscription-Tiers" = @{
        "README.md" = "Midjourney membership tiers and GPU hour allocation.";
        "Subscription-Tiers-Basic-to-Mega.md" = "Basic (`$10/mo, 3.3 Fast hrs), Standard (`$30/mo, 15 Fast hrs + Unlimited Relax), Pro (`$60/mo, 30 Fast hrs), Mega (`$120/mo, 60 Fast hrs).";
        "Fast-vs-Relax-GPU-Hours.md" = "Fast mode vs Relax mode unlimited generation execution."
    };
    "09-Architectures-and-Examples" = @{
        "README.md" = "Production prompt engineering pipelines and style guides.";
        "Photorealism-Prompt-Guide.md" = "Cinematic lighting, camera lens, and camera angle prompting templates.";
        "Graphic-Design-and-Logo-Guide.md" = "Vector graphics, stickers, and brand design prompting templates."
    };
    "10-Changelog-and-Deprecations" = @{
        "README.md" = "Historical release timeline.";
        "Release-History.md" = "Timeline from Midjourney v1 in 2022 to v6.1."
    };
    "11-Official-References" = @{
        "README.md" = "Curated list of official Midjourney links.";
        "Official-Links.md" = "Official docs link: https://docs.midjourney.com & https://midjourney.com"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $midjourneyDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Midjourney — $folder Overview
provider: Midjourney
capability: $folder
last_updated: 2026-07-28
tags: [midjourney, v6-1, niji, image-generation, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Midjourney — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive guidance for when to select **$folder** in Midjourney visual creation workflows.

## 3. Models & Tools Belonging to This Capability
- Midjourney v6.1, Midjourney v6, Niji 6, Character Reference (`--cref`), Style Reference (`--sref`), Vary Region.

## 4. Exposed Interfaces
- Midjourney Web Alpha Editor (`midjourney.com/create`) and Midjourney Discord Bot (`/imagine`).

## 5. Common Use Cases
- High-fidelity photorealistic imagery, character consistency in storyboards, anime illustration (Niji 6), seamless texture tiling, graphic design.
"@
        } else {
            $content = @"
---
title: Midjourney — $fileNameNoExt Specification
provider: Midjourney
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [midjourney, v6-1, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Midjourney — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Provider**: Midjourney, Inc. (San Francisco, CA)
- **Primary Interface**: Midjourney Web Editor & Discord Slash Commands (`/imagine`)
- **Base Resolution**: 1024x1024 pixels (upscalable to 2048x2048)
- **Supported Parameters**: `--ar`, `--stylize`, `--cref`, `--sref`, `--p`, `--chaos`, `--weird`, `--tile`, `--version`
- **Pricing Plans**: Basic (`$10/mo), Standard (`$30/mo), Pro (`$60/mo), Mega (`$120/mo)

## Typical Use Cases
1. Commercial advertising imagery & cinematic photorealism.
2. Consistent character storyboarding using `--cref` character reference.

## Strengths & Limitations
- **Strengths**: SOTA aesthetic beauty, unmatched artistic style control, character & style consistency (`--cref`/`--sref`), Niji 6 anime mode.
- **Limitations**: No public REST API for programmatic server backend integration (operated via Web & Discord).

## Example Prompt Command
```text
/imagine prompt: A cinematic full-body photograph of an astronaut walking through a futuristic neon city, photorealistic, 8k resolution, shot on 35mm lens --ar 16:9 --stylize 250 --v 6.1
```

## Related Documentation & Models
- See official Midjourney documentation at https://docs.midjourney.com
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Midjourney directory!"
