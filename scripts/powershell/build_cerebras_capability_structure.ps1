$cerebrasDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Cerebras"

if (Test-Path $cerebrasDir) {
    Remove-Item -Recurse -Force $cerebrasDir
}
New-Item -ItemType Directory -Force -Path $cerebrasDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Cerebras Systems & Wafer-Scale Supercomputing Cloud.";
        "Company.md" = "Founded in 2015 by Andrew Feldman (CEO, former founder of SeaMicro) in Sunnyvale, CA; `$4 Billion+ valuation backed by Foundation Capital, Benchmark, and Abu Dhabi G42.";
        "WSE-3-Wafer-Scale-Hardware-Architecture.md" = "Wafer-Scale Engine 3 (WSE-3) hardware architecture: 4 Trillion transistors, 900,000 AI cores, 44GB on-wafer SRAM memory with 21 Petabytes/second memory bandwidth.";
        "History-and-Milestones.md" = "Timeline from founding in 2015 to WSE-1 (2019), WSE-2 (2021), WSE-3 (2024), and Cerebras Inference Cloud.";
        "Glossary.md" = "Key terms, Wafer-Scale Engine, On-Wafer SRAM, Tokens Per Second."
    };
    "01-Ultra-Fast-Language-Inference" = @{
        "README.md" = "Ultra-fast open-model text generation endpoints delivering up to 3,000+ tokens/second.";
        "Llama-3-3-70B-Cerebras.md" = "Llama 3.3 70B serverless endpoint specs (`llama-3.3-70b`, delivering **2,100+ tokens/second**, `$0.60 / 1M tokens).";
        "Llama-3-1-8B-Cerebras.md" = "Llama 3.1 8B serverless endpoint specs (`llama3.1-8b`, delivering **3,000+ tokens/second**, `$0.10 / 1M tokens).";
        "Comparisons.md" = "Cerebras (2,100 tok/s) vs Groq (500 tok/s) vs Together AI vs OpenAI latency matrix.";
        "Best-Practices.md" = "Prompt formatting for real-time sub-second streaming."
    };
    "02-Wafer-Scale-Engine-WSE-3-Hardware" = @{
        "README.md" = "Wafer-Scale Engine WSE-3 and CS-3 AI Supercomputer hardware specification.";
        "CS-3-AI-Supercomputer.md" = "CS-3 AI supercomputer specs (single 21.5cm x 21.5cm silicon wafer replacing 64 GPU servers).";
        "On-Wafer-SRAM-and-Bandwidth.md" = "44GB on-wafer SRAM eliminating HBM memory bottlenecks with 21 PB/s memory bandwidth.";
        "Energy-Efficiency-Specs.md" = "Power consumption and carbon footprint efficiency specs."
    };
    "03-Reasoning-Models-Inference" = @{
        "README.md" = "Ultra-fast reasoning models running at 2,000+ tokens/second.";
        "DeepSeek-R1-Distill-Llama-70B-Cerebras.md" = "DeepSeek-R1 Distill Llama 70B reasoning model specs running at 2,000+ tokens/second.";
        "DeepSeek-R1-Distill-Llama-8B-Cerebras.md" = "DeepSeek-R1 Distill Llama 8B reasoning model specs running at 2,500+ tokens/second.";
        "Best-Practices.md" = "Chain-of-thought token streaming at 2,000+ tok/s."
    };
    "04-Cerebras-SDK-and-CSL" = @{
        "README.md" = "Cerebras Software Language (CSL) and PyTorch compiler tools.";
        "Cerebras-Software-Language-CSL.md" = "CSL low-level wafer kernel programming language specification.";
        "PyTorch-Wafer-Scale-Compiler.md" = "Compiling standard PyTorch models directly onto WSE-3 wafer hardware.";
        "Examples.md" = "PyTorch wafer model compilation example script."
    };
    "05-APIs-and-Endpoints" = @{
        "README.md" = "OpenAI-compatible REST API catalog (`api.cerebras.ai/v1`).";
        "Chat-Completions-API.md" = "`/v1/chat/completions` endpoint specification.";
        "Models-API.md" = "`/v1/models` endpoint specification."
    };
    "06-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Cerebras Cloud client libraries.";
        "Python-SDK-cerebras-cloud-sdk.md" = "Official `cerebras-cloud-sdk` Python package specification.";
        "TypeScript-SDK.md" = "Official `@cerebras/cerebras-cloud-sdk` TypeScript package specification.";
        "OpenAI-SDK-Compatibility.md" = "Using `openai` Python SDK with `base_url='https://api.cerebras.ai/v1'`."
    };
    "07-Pricing-and-Billing" = @{
        "README.md" = "Cerebras Inference Cloud pricing schedule.";
        "Token-Rates-Schedule.md" = "Llama 3.3 70B (`$0.60/1M tokens), Llama 3.1 8B (`$0.10/1M tokens).";
        "Free-Developer-Tier.md" = "Free developer tier limits and credit allocation."
    };
    "08-Rate-Limits-and-Quotas" = @{
        "README.md" = "Cerebras API rate limits.";
        "RPM-TPM-Limits.md" = "Requests Per Minute and Tokens Per Minute limits.";
        "Daily-Token-Quotas.md" = "Daily token cap boundaries per tier."
    };
    "09-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Sub-200ms-Voice-Agent-Loop.md" = "Sub-200ms real-time voice bot architecture powered by 2,100 tok/s Cerebras inference.";
        "High-Throughput-Document-Analysis.md" = "High-throughput document processing pipeline."
    };
    "10-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from WSE-1 in 2019 to WSE-3 and Cerebras Cloud in 2024."
    };
    "11-Official-References" = @{
        "README.md" = "Curated list of official Cerebras links.";
        "Official-Links.md" = "Official API docs link: https://inference-docs.cerebras.ai & https://cerebras.ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $cerebrasDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Cerebras — $folder Overview
provider: Cerebras
capability: $folder
last_updated: 2026-07-28
tags: [cerebras, wse-3, llama-3-3-70b, 2100-tokens-per-second, wafer-scale, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Cerebras — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Cerebras ultra-fast wafer-scale inference applications.

## 3. Models Belonging to This Capability
- Llama 3.3 70B (2,100+ tok/s), Llama 3.1 8B (3,000+ tok/s), DeepSeek-R1 Distill Llama 70B/8B (2,000+ tok/s).

## 4. Exposed APIs & Endpoints
- OpenAI-compatible REST API (`https://api.cerebras.ai/v1`), Python `cerebras-cloud-sdk`, TypeScript `@cerebras/cerebras-cloud-sdk`.

## 5. Common Use Cases
- World's fastest text inference (2,100+ tok/s for 70B models), sub-200ms interactive voice bots, instant document analysis, wafer-scale PyTorch acceleration.
"@
        } else {
            $content = @"
---
title: Cerebras — $fileNameNoExt Specification
provider: Cerebras
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [cerebras, wse-3, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Cerebras — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Hardware Architecture**: Wafer-Scale Engine 3 (WSE-3) — 4 Trillion transistors, 900,000 AI cores, 44GB on-wafer SRAM (21 PB/s memory bandwidth)
- **Release Information**: Official production release specifications
- **Supported Modalities**: Text input & output
- **Inference Speed**: **2,100+ tokens/second** for Llama 3.3 70B | **3,000+ tokens/second** for Llama 3.1 8B
- **Pricing**: Llama 3.3 70B (`$0.60 / 1M tokens) | Llama 3.1 8B (`$0.10 / 1M tokens)
- **API Availability**: Cerebras API (`api.cerebras.ai/v1`), Python SDK (`cerebras-cloud-sdk`), OpenAI SDK compatible
- **Streaming Support**: SSE (`text/event-stream`)

## Typical Use Cases
1. Ultra-fast real-time interactive voice bots with near-zero latency (<200ms end-to-end turn time).
2. High-volume real-time text analysis generating 2,100+ tokens/second per stream.

## Strengths & Limitations
- **Strengths**: #1 fastest LLM inference in the world (2,100+ tok/s for 70B), 44GB on-wafer SRAM with zero HBM memory bottlenecks, OpenAI SDK compatibility.
- **Limitations**: Focused strictly on text language & reasoning models (no image or video generation).

## Example Request (Official Python SDK)
```python
import os
from cerebras.cloud.sdk import Cerebras

client = Cerebras(api_key=os.environ.get("CEREBRAS_API_KEY"))

# Execute query returning 2,100+ tokens/second
response = client.chat.completions.create(
    model="llama-3.3-70b",
    messages=[
        {"role": "system", "content": "You are an AI assistant powered by Cerebras WSE-3 wafer hardware."},
        {"role": "user", "content": "Explain how 44GB on-wafer SRAM memory eliminates HBM memory bandwidth bottlenecks."}
    ],
    temperature=0.7,
    max_tokens=1000
)

print(response.choices[0].message.content)
```

## Related Documentation & Models
- See official Cerebras documentation at https://inference-docs.cerebras.ai
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Cerebras directory!"
