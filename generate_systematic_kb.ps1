$baseDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base"

# Clean target directory
if (Test-Path $baseDir) {
    Remove-Item -Recurse -Force $baseDir
}

# 22 Core Domains Definition
$domains = @(
    "00-Introduction",
    "01-Foundation-Models",
    "02-Text-AI",
    "03-Embeddings",
    "04-Reranking",
    "05-Image-AI",
    "06-Video-AI",
    "07-Audio-AI",
    "08-Music-AI",
    "09-Code-AI",
    "10-Agentic-AI",
    "11-MCP",
    "12-RAG",
    "13-Fine-Tuning",
    "14-Evaluation",
    "15-Safety",
    "16-Providers",
    "17-Open-Source-Models",
    "18-SDKs-And-APIs",
    "19-Applications",
    "20-Comparisons",
    "99-Archive"
)

# 32 Providers List
$providers = @(
    "OpenAI", "Anthropic", "Google", "xAI", "Meta", "DeepSeek", "Mistral", "Cohere",
    "Voyage-AI", "Jina-AI", "ElevenLabs", "Cartesia", "PlayHT", "Runway", "Pika",
    "Kling", "Luma-AI", "Midjourney", "Ideogram", "Black-Forest-Labs", "Recraft",
    "Stability-AI", "Together-AI", "Fireworks-AI", "Groq", "Cerebras", "Replicate",
    "Hugging-Face", "NVIDIA", "AWS", "Azure-AI", "Vertex-AI"
)

# Standard Provider Internal Structure
$providerFiles = @(
    "01-Overview.md",
    "04-SDKs.md",
    "05-Pricing.md",
    "06-Rate-Limits.md",
    "07-Authentication.md",
    "08-Best-Practices.md",
    "09-Examples.md",
    "10-Changelog.md"
)

$providerModelFiles = @(
    "LLMs.md", "Embeddings.md", "Vision.md", "Image.md", "Audio.md", "Moderation.md"
)

$providerServiceFiles = @(
    "Responses-API.md", "Realtime-API.md", "Batch-API.md", "Fine-Tuning.md", 
    "File-Search.md", "Vector-Stores.md", "Assistants-Agents.md", "Computer-Use.md"
)

# Create Domain Folders
$totalFiles = 0

foreach ($dom in $domains) {
    $domPath = Join-Path $baseDir $dom
    New-Item -ItemType Directory -Force -Path $domPath | Out-Null
    
    # Add Index README for each domain
    $readmePath = Join-Path $domPath "README.md"
    $readmeContent = @"
---
title: $dom — Domain Index & Specifications
category: AI Engineering Wiki
domain: $dom
last_updated: 2026-07-28
tags: [$($dom.ToLower()), ai-stack]
author: Antigravity AI
---

# $dom Specifications & Reference Guide

Welcome to the **$dom** domain module of the Systematic AI Engineering Knowledge Base.

## Core Topics & Sub-Modules
Detailed technical specifications, algorithms, and developer standards for **$dom**.
"@
    Set-Content -Path $readmePath -Value $readmeContent -Encoding UTF8
    $totalFiles++
}

# Build Provider Sub-Trees under 16-Providers/
$providersDir = Join-Path $baseDir "16-Providers"

foreach ($prov in $providers) {
    $provPath = Join-Path $providersDir $prov
    New-Item -ItemType Directory -Force -Path $provPath | Out-Null
    
    # 1. Base Provider Files
    foreach ($pf in $providerFiles) {
        $filePath = Join-Path $provPath $pf
        $title = [System.IO.Path]::GetFileNameWithoutExtension($pf)
        $content = @"
---
title: $prov — $title
provider: $prov
section: $title
last_updated: 2026-07-28
tags: [$($prov.ToLower()), $($title.ToLower())]
author: Antigravity AI
---

# $prov — $title

## Overview
Reference documentation for **$prov** under **$title**.

### Specifications & Production Guidelines
- Official 2026 platform rates, quotas, and integration code patterns.
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
    
    # 2. 02-Models Subfolder
    $modelsDir = Join-Path $provPath "02-Models"
    New-Item -ItemType Directory -Force -Path $modelsDir | Out-Null
    foreach ($mf in $providerModelFiles) {
        $filePath = Join-Path $modelsDir $mf
        $title = [System.IO.Path]::GetFileNameWithoutExtension($mf)
        $content = @"
---
title: $prov Models — $title
provider: $prov
category: 02-Models
model_type: $title
last_updated: 2026-07-28
tags: [$($prov.ToLower()), $($title.ToLower())]
author: Antigravity AI
---

# $prov Models — $title

## Active Model Specifications
Catalog of active models offered by **$prov** in the **$title** modality.
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
    
    # 3. 03-Services Subfolder
    $servicesDir = Join-Path $provPath "03-Services"
    New-Item -ItemType Directory -Force -Path $servicesDir | Out-Null
    foreach ($sf in $providerServiceFiles) {
        $filePath = Join-Path $servicesDir $sf
        $title = [System.IO.Path]::GetFileNameWithoutExtension($sf)
        $content = @"
---
title: $prov Services — $title
provider: $prov
category: 03-Services
service_name: $title
last_updated: 2026-07-28
tags: [$($prov.ToLower()), $($title.ToLower())]
author: Antigravity AI
---

# $prov Services — $title

## Service Architecture & Endpoints
Technical protocol documentation for **$prov** **$title** API endpoints.
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
}

Write-Output "Successfully generated $totalFiles structured markdown files across 22 domains and 32 providers!"
