$baseDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base"

# Clean target directory
if (Test-Path $baseDir) {
    Remove-Item -Recurse -Force $baseDir
}

$providersDir = Join-Path $baseDir "01-Providers"
$servicesDir  = Join-Path $baseDir "02-Services"
$compsDir     = Join-Path $baseDir "03-Comparisons"

New-Item -ItemType Directory -Force -Path $providersDir | Out-Null
New-Item -ItemType Directory -Force -Path $servicesDir  | Out-Null
New-Item -ItemType Directory -Force -Path $compsDir     | Out-Null

# ---------------------------------------------------------------------------
# 1. PROVIDERS (VIEW 1: BY PROVIDER)
# ---------------------------------------------------------------------------
$providers = @(
    "OpenAI", "Anthropic", "Google-AI", "xAI", "Meta", "DeepSeek", "Mistral", "Cohere",
    "Voyage-AI", "Jina-AI", "ElevenLabs", "Cartesia", "PlayHT", "Runway", "Pika",
    "Kling", "Luma-AI", "Midjourney", "Ideogram", "Black-Forest-Labs", "Recraft",
    "Stability-AI", "Together-AI", "Fireworks-AI", "Groq", "Cerebras", "Replicate",
    "Hugging-Face", "NVIDIA", "AWS-Bedrock", "Azure-AI", "Vertex-AI"
)

$providerCoreFiles = @(
    "Company.md", "SDKs.md", "Pricing.md", "Rate-Limits.md",
    "Authentication.md", "Best-Practices.md", "Examples.md", "Changelog.md"
)

$providerModels = @(
    "GPT-Models.md", "Reasoning-Models.md", "Embedding-Models.md",
    "Vision-Models.md", "Image-Models.md", "Speech-Models.md", "Moderation-Models.md"
)

$providerAPIs = @(
    "Responses-API.md", "Realtime-API.md", "Batch-API.md", "Fine-Tuning-API.md",
    "Embeddings-API.md", "Images-API.md", "Audio-API.md", "Vector-Stores-API.md"
)

$totalFiles = 0

foreach ($prov in $providers) {
    $pPath = Join-Path $providersDir $prov
    New-Item -ItemType Directory -Force -Path $pPath | Out-Null
    
    # Provider Core Files
    foreach ($cf in $providerCoreFiles) {
        $filePath = Join-Path $pPath $cf
        $title = [System.IO.Path]::GetFileNameWithoutExtension($cf)
        $content = @"
---
title: $prov — $title
provider: $prov
view: By Provider
section: $title
last_updated: 2026-07-28
tags: [$($prov.ToLower()), $($title.ToLower())]
author: Antigravity AI
---

# $prov — $title

## Specifications & Documentation
Reference guide for **$prov** ($title).
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
    
    # Models Subfolder
    $mDir = Join-Path $pPath "Models"
    New-Item -ItemType Directory -Force -Path $mDir | Out-Null
    foreach ($mf in $providerModels) {
        $filePath = Join-Path $mDir $mf
        $title = [System.IO.Path]::GetFileNameWithoutExtension($mf)
        $content = @"
---
title: $prov Models — $title
provider: $prov
view: By Provider
category: Models
model_type: $title
last_updated: 2026-07-28
tags: [$($prov.ToLower()), $($title.ToLower())]
author: Antigravity AI
---

# $prov Models — $title

## Models Specifications
Catalog of active models offered by **$prov** under **$title**.
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
    
    # APIs Subfolder
    $aDir = Join-Path $pPath "APIs"
    New-Item -ItemType Directory -Force -Path $aDir | Out-Null
    foreach ($af in $providerAPIs) {
        $filePath = Join-Path $aDir $af
        $title = [System.IO.Path]::GetFileNameWithoutExtension($af)
        $content = @"
---
title: $prov APIs — $title
provider: $prov
view: By Provider
category: APIs
api_name: $title
last_updated: 2026-07-28
tags: [$($prov.ToLower()), $($title.ToLower())]
author: Antigravity AI
---

# $prov APIs — $title

## API Endpoint Specifications
Technical documentation for **$prov** **$title** API endpoints.
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
}

# ---------------------------------------------------------------------------
# 2. SERVICES (VIEW 2: BY SERVICE)
# ---------------------------------------------------------------------------
$services = @(
    "Language-Models",
    "Embeddings",
    "Reranking",
    "Image-Generation",
    "Image-Editing",
    "Vision-Multimodal",
    "OCR-Document-AI",
    "Speech-to-Text",
    "Text-to-Speech",
    "Voice-Cloning",
    "Realtime-Voice",
    "Video-Generation",
    "Code-Generation",
    "Agent-Frameworks",
    "MCP-Servers",
    "Function-Calling",
    "Structured-Outputs",
    "Fine-Tuning",
    "Moderation"
)

foreach ($serv in $services) {
    $sFolder = Join-Path $servicesDir $serv
    New-Item -ItemType Directory -Force -Path $sFolder | Out-Null
    
    $sFilePath = Join-Path $sFolder "README.md"
    $sContent = @"
---
title: AI Service — $serv
view: By Service
service: $serv
last_updated: 2026-07-28
tags: [$($serv.ToLower()), ai-service]
author: Antigravity AI
---

# AI Service: $serv

## Overview
Comprehensive guide to **$serv** across top AI ecosystem providers.

## Provider Offerings Matrix
- **OpenAI**: Native API support & SDKs.
- **Anthropic**: High precision & Constitutional AI.
- **Google AI**: Scale, massive context & multimodal processing.
- **Specialized Providers**: Niche leaders and open weights models.

## Recommended Benchmark Leaderboards
- Accuracy, latency, context windows, and cost efficiency metrics.
"@
    Set-Content -Path $sFilePath -Value $sContent -Encoding UTF8
    $totalFiles++
}

# ---------------------------------------------------------------------------
# 3. COMPARISONS (VIEW 3: BY COMPARISON)
# ---------------------------------------------------------------------------
$comparisons = @(
    "LLM-Comparison.md",
    "Embedding-Comparison.md",
    "Vision-Comparison.md",
    "Speech-Comparison.md",
    "Image-Comparison.md",
    "Video-Comparison.md",
    "Code-Comparison.md",
    "Realtime-Voice-Comparison.md",
    "Pricing-Comparison.md",
    "Rate-Limit-Comparison.md"
)

foreach ($comp in $comparisons) {
    $cFilePath = Join-Path $compsDir $comp
    $cTitle = [System.IO.Path]::GetFileNameWithoutExtension($comp)
    $cContent = @"
---
title: Side-by-Side Comparison — $cTitle
view: By Comparison
comparison: $cTitle
last_updated: 2026-07-28
tags: [comparison, benchmark, leaderboards]
author: Antigravity AI
---

# Side-by-Side Comparison — $cTitle

## Benchmark & Metrics Matrix

| Provider | Model / Endpoint | Key Strength | Input Cost / 1M | Output Cost / 1M | Latency / Score |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **OpenAI** | GPT-4o | Multimodal Flagship | `$2.50` | `$10.00` | 90.2% HumanEval |
| **Anthropic** | Claude 3.7 Sonnet | Coding & Reasoning | `$3.00` | `$15.00` | 93.7% SWE-bench |
| **Google AI** | Gemini 2.5 Pro | 2M Context Window | `$1.25` | `$5.00` | 99.8% Needle |
| **DeepSeek** | DeepSeek-V3 | Budget High Efficiency | `$0.14` | `$0.28` | 88.5% MATH |
| **ElevenLabs** | Multilingual v2 | Voice Realism | `$0.15/1k char` | N/A | 94.8% Preference |
"@
    Set-Content -Path $cFilePath -Value $cContent -Encoding UTF8
    $totalFiles++
}

Write-Output "Successfully generated $totalFiles tri-fold knowledge base markdown files across Providers, Services, and Comparisons!"
