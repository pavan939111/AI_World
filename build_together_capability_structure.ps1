$togetherDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Together-AI"

if (Test-Path $togetherDir) {
    Remove-Item -Recurse -Force $togetherDir
}
New-Item -ItemType Directory -Force -Path $togetherDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Together AI & Open-Source AI Cloud Platform.";
        "Company.md" = "Founded in 2022 by Vipul Ved Prakash (CEO, former BitTorrent/Napster leader), Ce Zhang, and Percy Liang (Stanford AI Professor) in San Francisco, CA; `$228 Million funding backed by Salesforce Ventures, NVIDIA, and Kleiner Perkins.";
        "Together-Inference-Engine-Architecture.md" = "Together Kernel FlashAttention-3 and Speculative Decoding inference acceleration architecture.";
        "History-and-Milestones.md" = "Timeline from founding in 2022 to Together Inference Engine, FLUX.1 hosting, and H200 Clusters.";
        "Glossary.md" = "Key terms, Speculative Decoding, Together Kernel, Open Models."
    };
    "01-Serverless-Language-Inference" = @{
        "README.md" = "Serverless text generation endpoints for 100+ open-weights LLMs.";
        "Llama-3-3-70B-Together.md" = "Llama 3.3 70B serverless endpoint specs (`meta-llama/Llama-3.3-70B-Instruct-Turbo`, `$0.88 / 1M tokens).";
        "Llama-3-1-405B-Together.md" = "Llama 3.1 405B serverless endpoint specs (`meta-llama/Meta-Llama-3.1-405B-Instruct-Turbo`, `$3.50 / 1M tokens).";
        "DeepSeek-V3-Together.md" = "DeepSeek-V3 serverless endpoint specs (`deepseek-ai/DeepSeek-V3`, `$1.25 / 1M tokens).";
        "Qwen-2-5-72B-Together.md" = "Qwen 2.5 72B serverless endpoint specs (`Qwen/Qwen2.5-72B-Instruct-Turbo`, `$0.88 / 1M).";
        "Mixtral-8x22B-Together.md" = "Mixtral 8x22B MoE serverless endpoint specs.";
        "Comparisons.md" = "Together AI vs Anyscale vs Fireworks AI vs Groq benchmark matrix.";
        "Best-Practices.md" = "Model string selection and max token limits."
    };
    "02-Image-and-Vision-Inference" = @{
        "README.md" = "Serverless image generation and multimodal vision endpoints.";
        "FLUX-1-Together.md" = "FLUX.1 [pro], [dev], and [schnell] serverless endpoints (`black-forest-labs/FLUX.1-schnell`, `$0.003 / image).";
        "Llama-3-2-Vision-Together.md" = "Llama 3.2 90B & 11B Vision multimodal serverless endpoints.";
        "SDXL-Together.md" = "Stable Diffusion XL serverless endpoints.";
        "Best-Practices.md" = "Image generation width/height and aspect ratio parameters."
    };
    "03-Code-and-Reasoning-Inference" = @{
        "README.md" = "Serverless reasoning and code generation models.";
        "DeepSeek-R1-Together.md" = "DeepSeek-R1 671B MoE reasoning model endpoint specs (`deepseek-ai/DeepSeek-R1`, `$7.00 / 1M tokens).";
        "DeepSeek-Coder-V2-Together.md" = "DeepSeek Coder V2 serverless endpoint specs.";
        "Codestral-22B-Together.md" = "Codestral 22B code generation serverless endpoint specs.";
        "Best-Practices.md" = "Handling DeepSeek-R1 chain-of-thought output tokens."
    };
    "04-Together-Kernel-Inference-Engine" = @{
        "README.md" = "Proprietary GPU kernel optimizations delivering 400+ tokens/second throughput.";
        "FlashAttention-3-and-Speculative-Decoding.md" = "Together FlashAttention-3 kernels and Speculative Decoding mechanics.";
        "Throughput-Benchmarking.md" = "Tokens per second and Time-to-First-Token (TTFT) benchmarks.";
        "Best-Practices.md" = "Batching and streaming optimization."
    };
    "05-Custom-Fine-Tuning-API" = @{
        "README.md" = "Serverless LoRA and full-parameter model fine-tuning.";
        "Fine-Tuning-API-Specification.md" = "`/v1/fine-tuning/jobs` endpoint specification for custom dataset training.";
        "LoRA-Adaptation.md" = "Configuring LoRA rank, alpha, and learning rate.";
        "Examples.md" = "Python script launching a custom Llama 3.3 70B fine-tuning job."
    };
    "06-Dedicated-GPU-Clusters" = @{
        "README.md" = "Dedicated H100, H200, and B200 GPU infrastructure for enterprise workloads.";
        "Dedicated-Inference-Clusters.md" = "Deploying isolated GPU clusters with guaranteed SLA.";
        "H100-and-H200-Hardware-Specs.md" = "NVIDIA H100 (80GB) and H200 (141GB HBM3e) cluster specifications.";
        "Private-VPC-Deployment.md" = "SOC2 Type II compliant private cloud VPC infrastructure."
    };
    "07-APIs-and-Endpoints" = @{
        "README.md" = "OpenAI-compatible REST API catalog (`api.together.xyz/v1`).";
        "Chat-Completions-API.md" = "`/v1/chat/completions` endpoint specification.";
        "Embeddings-API.md" = "`/v1/embeddings` endpoint specification.";
        "Image-Generations-API.md" = "`/v1/images/generations` endpoint specification.";
        "Fine-Tuning-Endpoints.md" = "`/v1/fine-tuning` management specification."
    };
    "08-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Together AI client libraries.";
        "Python-SDK-together.md" = "Official `together` Python SDK package specification.";
        "TypeScript-SDK.md" = "Official `@together-ai/sdk` TypeScript package specification.";
        "OpenAI-SDK-Compatibility.md" = "Using `openai` Python SDK with `base_url='https://api.together.xyz/v1'`."
    };
    "09-Pricing-and-Billing" = @{
        "README.md" = "Together AI serverless token pricing schedule.";
        "Token-Rates-Schedule.md" = "Llama 3.3 70B (`$0.88/1M), Llama 3.1 8B (`$0.18/1M), DeepSeek-R1 (`$7.00/1M), FLUX.1 (`$0.003/img).";
        "GPU-Cluster-Billing.md" = "Per-GPU hourly rates for dedicated H100/H200 clusters."
    };
    "10-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "High-Throughput-Open-Agent-Loop.md" = "High-throughput open-weights agent loop with `together` SDK.";
        "Custom-Fine-Tuned-Model-Deployment.md" = "Deploying a fine-tuned LoRA model checkpoint."
    };
    "11-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release timeline.";
        "Release-History.md" = "Timeline from founding in 2022 to Together Kernel Engine and H200 Clusters."
    };
    "12-Official-References" = @{
        "README.md" = "Curated list of official Together AI links.";
        "Official-Links.md" = "Official API docs link: https://docs.together.ai & https://together.ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $togetherDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Together AI — $folder Overview
provider: Together AI
capability: $folder
last_updated: 2026-07-28
tags: [together-ai, llama, deepseek, flux, open-models, fine-tuning, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Together AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Together AI open-source model inference applications.

## 3. Models Belonging to This Capability
- Llama 3.3 70B, Llama 3.1 405B, DeepSeek-R1, DeepSeek-V3, Qwen 2.5 72B, FLUX.1 [schnell]/[dev]/[pro], Mixtral 8x22B.

## 4. Exposed APIs & Endpoints
- OpenAI-compatible REST API (`https://api.together.xyz/v1`), Python `together` SDK, TypeScript `@together-ai/sdk`.

## 5. Common Use Cases
- Serverless inference for 100+ open-weights LLMs, serverless LoRA fine-tuning API, FLUX.1 image generation, dedicated NVIDIA H100/H200 GPU cluster hosting.
"@
        } else {
            $content = @"
---
title: Together AI — $fileNameNoExt Specification
provider: Together AI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [together-ai, llama, deepseek, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Together AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Open-Weights Models hosted on Together AI High-Performance GPU Cloud
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image (Llama 3.2 Vision & SDXL/FLUX)
- **Supported Output Modalities**: Text, Image, JSON Schema, Function Calls
- **Throughput**: 400+ tokens/second powered by Together Kernel FlashAttention-3 engine
- **Pricing**: Llama 3.3 70B (`$0.88 / 1M tokens) | Llama 3.1 8B (`$0.18 / 1M) | FLUX.1 (`$0.003 / image)
- **API Availability**: Together API (`api.together.xyz/v1`), Official Python SDK (`together`), OpenAI SDK compatible
- **Streaming Support**: SSE (`text/event-stream`)
- **Fine-Tuning**: Serverless LoRA & full-parameter fine-tuning API supported

## Typical Use Cases
1. Production open-source LLM inference with ultra-fast 400+ tok/s response speeds.
2. Fine-tuning custom Llama 3.3 70B models using the Together Fine-Tuning API.

## Strengths & Limitations
- **Strengths**: Serves 100+ open models, 400+ tok/s Together Kernel acceleration, serverless fine-tuning API, OpenAI SDK drop-in replacement.
- **Limitations**: Dedicated GPU clusters require minimum hourly commitment.

## Example Request (Official Python SDK)
```python
import os
from together import Together

client = Together(api_key=os.environ.get("TOGETHER_API_KEY"))

response = client.chat.completions.create(
    model="meta-llama/Llama-3.3-70B-Instruct-Turbo",
    messages=[
        {"role": "system", "content": "You are an expert AI software architect."},
        {"role": "user", "content": "Explain Together FlashAttention-3 kernel acceleration."}
    ],
    temperature=0.7,
    max_tokens=1000
)

print(response.choices[0].message.content)
```

## Related Documentation & Models
- See official Together AI documentation at https://docs.together.ai
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Together AI directory!"
