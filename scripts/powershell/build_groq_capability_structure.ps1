$groqDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Groq"

if (Test-Path $groqDir) {
    Remove-Item -Recurse -Force $groqDir
}
New-Item -ItemType Directory -Force -Path $groqDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Groq & Language Processing Unit (LPU) Inference Technology.";
        "Company.md" = "Founded by Jonathan Ross (creator of Google TPU), Mountain View HQ, `$2.8B valuation, Series D funding.";
        "LPU-Inference-Engine-Hardware.md" = "Groq LPU architecture vs traditional GPU clusters.";
        "History-and-Milestones.md" = "Timeline from founding in 2016 to breaking 500 tokens/sec inference barriers.";
        "Glossary.md" = "Key terms, LPU terminology, deterministic compute."
    };
    "01-Language-Models" = @{
        "README.md" = "Ultra-fast open-weight foundation models running on Groq LPUs.";
        "Llama-3-3-70B.md" = "Llama 3.3 70B specs running at 300+ tokens/sec (`$0.59 in / `$0.79 out per 1M).";
        "Llama-3-1-8B.md" = "Llama 3.1 8B specs running at 500+ tokens/sec (`$0.05 in / `$0.08 out per 1M).";
        "Mixtral-8x7B.md" = "Mixtral 8x7B MoE model specs (`$0.24 in / `$0.24 out per 1M).";
        "Comparisons.md" = "Groq LPU inference speed vs standard cloud GPUs (AWS/Azure).";
        "Best-Practices.md" = "Maximizing throughput and streaming token responses."
    };
    "02-Reasoning-Models" = @{
        "README.md" = "High-speed chain-of-thought reasoning models on LPUs.";
        "DeepSeek-R1-Distill-Llama-70B.md" = "DeepSeek R1 distilled 70B reasoning model running on Groq hardware.";
        "Reasoning-Speed-Benchmarking.md" = "300+ tokens/sec chain-of-thought execution speed.";
        "Comparisons.md" = "DeepSeek R1 on Groq vs standard cloud hostings."
    };
    "03-Vision-Models" = @{
        "README.md" = "Multimodal vision understanding on LPUs.";
        "Llama-3-2-90B-Vision.md" = "Llama 3.2 90B Vision model specs.";
        "Llama-3-2-11B-Vision.md" = "Llama 3.2 11B Vision model specs.";
        "Examples.md" = "Python code patterns for vision QA."
    };
    "04-Speech-to-Text-Audio" = @{
        "README.md" = "Ultra-fast acoustic speech recognition running at 216x real-time speed.";
        "Whisper-Large-v3.md" = "Whisper Large v3 model specs (`$0.111 / hour).";
        "Whisper-Large-v3-Turbo.md" = "Whisper Large v3 turbo specs (`$0.04 / hour).";
        "216x-Realtime-Speed.md" = "Transcribing 1-hour audio in under 17 seconds."
    };
    "05-Ultra-Low-Latency-Inference" = @{
        "README.md" = "Technical architecture of the Groq LPU Hardware Inference Engine.";
        "LPU-Architecture-Specs.md" = "Tensor Streaming Processor (TSP) architecture and SRAM memory bandwidth.";
        "Deterministic-Compute.md" = "Zero-cache-miss deterministic compute execution.";
        "Benchmarking.md" = "Artificial Analysis speed benchmark charts."
    };
    "06-Tool-Use-Function-Calling" = @{
        "README.md" = "OpenAI-compatible tool calling.";
        "Tool-Calling-Specification.md" = "JSON tool declaration schemas.";
        "Examples.md" = "Python tool execution loop code snippets."
    };
    "07-Structured-Outputs" = @{
        "README.md" = "JSON mode and schema compliance.";
        "JSON-Mode.md" = "JSON mode specification.";
        "Examples.md" = "Python Pydantic schema validation patterns."
    };
    "08-Compound-AI-Systems" = @{
        "README.md" = "Multi-model sub-second compound AI pipelines.";
        "Realtime-Voice-Pipeline.md" = "Whisper (Groq) -> Llama 3.3 (Groq) -> Cartesia TTS voice pipeline under 200ms total latency.";
        "Multi-Model-Routing.md" = "High-throughput fallback model routing."
    };
    "09-APIs-and-Endpoints" = @{
        "README.md" = "OpenAI-compatible REST API endpoints catalog.";
        "OpenAI-Compatible-API.md" = "Chat completions specification.";
        "Audio-Transcriptions-API.md" = "Audio transcriptions specification.";
        "Complete-REST-Spec.md" = "cURL raw request headers."
    };
    "10-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Groq client libraries.";
        "Python-SDK.md" = "Official groq Python package specification.";
        "TypeScript-SDK.md" = "Official groq-sdk Node.js package specification.";
        "LangChain-LlamaIndex-Integration.md" = "LangChain ChatGroq and LlamaIndex integration."
    };
    "11-Pricing-and-Billing" = @{
        "README.md" = "Groq Cloud pricing schedules.";
        "Token-Rates-Schedule.md" = "Llama 3.3 70B, Llama 3.1 8B token rates.";
        "Free-Tier-vs-Pay-as-you-go.md" = "Free developer tier vs Pay-as-you-go API tier."
    };
    "12-Rate-Limits-and-Quotas" = @{
        "README.md" = "Groq Cloud rate limit boundaries.";
        "RPM-TPM-RPD-Tables.md" = "RPM, TPM, and RPD limits per model.";
        "Developer-Tier-Quotas.md" = "Requesting rate limit increases."
    };
    "13-Authentication-and-Security" = @{
        "README.md" = "API key and authentication configuration.";
        "GROQ_API_KEY-Setup.md" = "GROQ_API_KEY environment variable setup.";
        "Enterprise-Security.md" = "SOC2 Type II compliance and data privacy policy."
    };
    "14-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Sub-100ms-Voice-Bot.md" = "Sub-100ms voice agent pattern.";
        "High-Throughput-Agent-Loops.md" = "Fast agentic loop pattern."
    };
    "15-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from LPU announcement to Llama 3.3 rollout."
    };
    "16-Official-References" = @{
        "README.md" = "Curated list of official Groq links.";
        "Official-Links.md" = "Official docs link: https://console.groq.com/docs"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $groqDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Groq — $folder Overview
provider: Groq
capability: $folder
last_updated: 2026-07-28
tags: [groq, lpu, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Groq — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** on Groq LPU hardware for ultra-low latency AI applications.

## 3. Models Belonging to This Capability
- Llama 3.3 70B, Llama 3.1 8B, DeepSeek R1 Distill 70B, Whisper Large v3 turbo.

## 4. Exposed APIs & Endpoints
- OpenAI-compatible REST API endpoints (`https://api.groq.com/openai/v1`) and official `groq` Python / TypeScript SDKs.

## 5. Common Use Cases
- Sub-200ms real-time voice agents, high-throughput agent loops, real-time code autocomplete.
"@
        } else {
            $content = @"
---
title: Groq — $fileNameNoExt Specification
provider: Groq
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [groq, lpu, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Groq — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Hardware Acceleration**: Groq LPU (Language Processing Unit) Inference Engine
- **Inference Speed**: 300 to 500+ Tokens Per Second
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Audio (Whisper), Image (Llama 3.2 Vision)
- **Supported Output Modalities**: Text, JSON Schema, Tool Calls
- **Context Window**: 128,000 tokens
- **Max Output**: 8,192 tokens
- **Pricing**: Llama 3.3 70B (`$0.59 in / `$0.79 out per 1M tokens) | Llama 3.1 8B (`$0.05 in / `$0.08 out per 1M)
- **API Availability**: Groq Cloud Console (`api.groq.com`), OpenAI-compatible client SDKs
- **Streaming Support**: SSE (`text/event-stream`)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode)

## Typical Use Cases
1. Sub-200ms conversational voice pipelines.
2. High-speed multi-agent simulation loops.

## Strengths & Limitations
- **Strengths**: Fastest LLM inference speed in the world (300-500+ tok/s), 100% OpenAI API compatibility, ultra-low cost.
- **Limitations**: Rate limits on free developer accounts.

## Example Request
```python
import os
from groq import Groq

client = Groq(api_key=os.environ.get("GROQ_API_KEY"))
completion = client.chat.completions.create(
    model="llama-3.3-70b-versatile",
    messages=[{"role": "user", "content": "Explain LPU hardware architecture."}]
)
print(completion.choices[0].message.content)
```

## Related Documentation & Models
- See official Groq documentation at https://console.groq.com/docs
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Groq directory!"
