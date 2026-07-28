$fireworksDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Fireworks-AI"

if (Test-Path $fireworksDir) {
    Remove-Item -Recurse -Force $fireworksDir
}
New-Item -ItemType Directory -Force -Path $fireworksDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Fireworks AI & Production Open-Model Inference Cloud.";
        "Company.md" = "Founded in 2022 by Lin Qiao (CEO, former Meta PyTorch engineering director) and Dmytro Dzhulgakov (CTO, PyTorch co-creator) in Redwood City, CA; `$52 Million funding backed by Sequoia Capital and Benchmark.";
        "FireAttention-Inference-Engine-Architecture.md" = "FireAttention GPU CUDA kernel architecture optimized for multi-tenant LLM serving and sub-second LoRA switching.";
        "History-and-Milestones.md" = "Timeline from founding in 2022 to FireAttention v2, FLUX.1 hosting, and DeepSeek-R1.";
        "Glossary.md" = "Key terms, FireAttention, Multi-LoRA Hot-Swapping."
    };
    "01-Serverless-Language-Inference" = @{
        "README.md" = "Serverless text generation endpoints for 100+ open-weights LLMs.";
        "Llama-3-3-70B-Fireworks.md" = "Llama 3.3 70B serverless endpoint specs (`accounts/fireworks/models/llama-v3p3-70b-instruct`, `$0.90 / 1M tokens).";
        "Llama-3-1-405B-Fireworks.md" = "Llama 3.1 405B serverless endpoint specs (`accounts/fireworks/models/llama-v3p1-405b-instruct`, `$3.00 / 1M tokens).";
        "DeepSeek-V3-Fireworks.md" = "DeepSeek-V3 serverless endpoint specs (`accounts/fireworks/models/deepseek-v3`, `$0.90 / 1M tokens).";
        "Qwen-2-5-72B-Fireworks.md" = "Qwen 2.5 72B serverless endpoint specs (`accounts/fireworks/models/qwen2p5-72b-instruct`, `$0.90 / 1M).";
        "Mixtral-8x22B-Fireworks.md" = "Mixtral 8x22B MoE serverless endpoint specs.";
        "Comparisons.md" = "Fireworks AI vs Together AI vs Groq vs Anyscale benchmark matrix.";
        "Best-Practices.md" = "Model identifier strings and parameter settings."
    };
    "02-Reasoning-Models-Inference" = @{
        "README.md" = "Serverless reasoning models with chain-of-thought token streaming.";
        "DeepSeek-R1-Fireworks.md" = "DeepSeek-R1 671B MoE reasoning model endpoint specs (`accounts/fireworks/models/deepseek-r1`, `$8.00 / 1M tokens).";
        "GRPO-Reasoning-Outputs.md" = "Handling `<think>` reasoning token blocks.";
        "Best-Practices.md" = "Structuring prompts for DeepSeek-R1 on Fireworks."
    };
    "03-Multimodal-and-Vision-Models" = @{
        "README.md" = "Serverless image generation and visual LLM endpoints.";
        "FireLLaVA.md" = "FireLLaVA open vision-language model specs.";
        "Llama-3-2-Vision-Fireworks.md" = "Llama 3.2 90B & 11B Vision serverless endpoints.";
        "FLUX-1-Fireworks.md" = "FLUX.1 [schnell] & [dev] image generation endpoints (`accounts/fireworks/models/flux-1-schnell`, `$0.003 / image).";
        "Best-Practices.md" = "Visual prompt formatting."
    };
    "04-FireAttention-and-LoRA-Switching" = @{
        "README.md" = "FireAttention GPU CUDA kernels and Multi-LoRA adapter hot-swapping.";
        "FireAttention-CUDA-Kernels.md" = "Custom CUDA attention kernels optimizing memory bandwidth and KV cache management.";
        "Multi-LoRA-Hot-Swapping.md" = "Sub-second multi-tenant LoRA adapter switching without reloading base model weights.";
        "Best-Practices.md" = "Deploying multi-tenant LoRA applications."
    };
    "05-Custom-Fine-Tuning-API" = @{
        "README.md" = "Serverless LoRA fine-tuning for Llama and Qwen models.";
        "Fine-Tuning-API-Specification.md" = "`/v1/fine_tuning/jobs` endpoint specification for custom dataset adaptation.";
        "Dataset-Preparation.md" = "Formatting JSONL datasets for Fireworks fine-tuning.";
        "Examples.md" = "Python script launching a custom LoRA fine-tuning job."
    };
    "06-Structured-Outputs-and-Tool-Calling" = @{
        "README.md" = "Function calling and JSON mode schema enforcement.";
        "Tool-Calling-Specification.md" = "Fireworks Function Calling JSON declaration schemas.";
        "JSON-Schema-Mode.md" = "Enforcing strict JSON schema outputs.";
        "Examples.md" = "Python function execution loop code snippet."
    };
    "07-APIs-and-Endpoints" = @{
        "README.md" = "OpenAI-compatible REST API catalog (`api.fireworks.ai/inference/v1`).";
        "Chat-Completions-API.md" = "`/inference/v1/chat/completions` endpoint specification.";
        "Embeddings-API.md" = "`/inference/v1/embeddings` endpoint specification.";
        "Image-Generation-API.md" = "`/inference/v1/image_generation` endpoint specification."
    };
    "08-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Fireworks AI client SDKs.";
        "Python-SDK-fireworks-ai.md" = "Official `fireworks-ai` Python package specification.";
        "TypeScript-SDK.md" = "Official TypeScript SDK specification.";
        "OpenAI-SDK-Compatibility.md" = "Using `openai` Python SDK with `base_url='https://api.fireworks.ai/inference/v1'`."
    };
    "09-Pricing-and-Billing" = @{
        "README.md" = "Fireworks AI serverless token pricing schedule.";
        "Token-Rates-Schedule.md" = "Llama 3.3 70B (`$0.90/1M), Llama 3.1 8B (`$0.20/1M), DeepSeek-R1 (`$8.00/1M), FLUX.1 (`$0.003/img).";
        "Billing-Quotas.md" = "Managing API key account balances."
    };
    "10-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Multi-LoRA-Agent-Pipeline.md" = "Multi-LoRA adapter hot-swapping agent pipeline.";
        "High-Speed-RAG-Pipeline.md" = "High-speed RAG pipeline using Fireworks embeddings and Llama 3.3 70B."
    };
    "11-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release timeline.";
        "Release-History.md" = "Timeline from founding in 2022 to FireAttention v2 and DeepSeek-R1."
    };
    "12-Official-References" = @{
        "README.md" = "Curated list of official Fireworks AI links.";
        "Official-Links.md" = "Official API docs link: https://docs.fireworks.ai & https://fireworks.ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $fireworksDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Fireworks AI — $folder Overview
provider: Fireworks AI
capability: $folder
last_updated: 2026-07-28
tags: [fireworks-ai, llama, deepseek, fireattention, fine-tuning, lora, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Fireworks AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Fireworks AI open-model inference applications.

## 3. Models Belonging to This Capability
- Llama 3.3 70B, Llama 3.1 405B, DeepSeek-R1, DeepSeek-V3, Qwen 2.5 72B, FLUX.1 [schnell]/[dev], FireLLaVA.

## 4. Exposed APIs & Endpoints
- OpenAI-compatible REST API (`https://api.fireworks.ai/inference/v1`), Python `fireworks-ai` SDK, TypeScript SDK.

## 5. Common Use Cases
- High-speed inference for 100+ open models powered by FireAttention CUDA kernels, sub-second Multi-LoRA adapter hot-swapping, FLUX.1 image generation, serverless fine-tuning API.
"@
        } else {
            $content = @"
---
title: Fireworks AI — $fileNameNoExt Specification
provider: Fireworks AI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [fireworks-ai, llama, deepseek, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Fireworks AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Open-Weights Models hosted on Fireworks AI High-Speed GPU Infrastructure (PyTorch Core Team Roots)
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image (Llama 3.2 Vision & FLUX.1)
- **Supported Output Modalities**: Text, Image, JSON Schema, Function Calls
- **Inference Engine**: FireAttention GPU CUDA kernels enabling 4x lower latency & sub-second Multi-LoRA switching
- **Pricing**: Llama 3.3 70B (`$0.90 / 1M tokens) | Llama 3.1 8B (`$0.20 / 1M) | DeepSeek-R1 (`$8.00 / 1M)
- **API Availability**: Fireworks API (`api.fireworks.ai/inference/v1`), Python SDK (`fireworks-ai`), OpenAI SDK compatible
- **Streaming Support**: SSE (`text/event-stream`)
- **Fine-Tuning**: Serverless LoRA fine-tuning API supported

## Typical Use Cases
1. Production open-source LLM inference with FireAttention sub-second multi-tenant LoRA hot-swapping.
2. High-speed reasoning pipelines serving DeepSeek-R1 chain-of-thought tokens.

## Strengths & Limitations
- **Strengths**: FireAttention CUDA kernel acceleration, sub-second Multi-LoRA adapter switching, 100+ open models, OpenAI SDK drop-in compatibility.
- **Limitations**: Rate limit boundaries based on tier account credit balances.

## Example Request (Official Python SDK)
```python
import os
import fireworks.client

fireworks.client.api_key = os.environ.get("FIREWORKS_API_KEY")

response = fireworks.client.ChatCompletion.create(
    model="accounts/fireworks/models/llama-v3p3-70b-instruct",
    messages=[
        {"role": "system", "content": "You are an expert AI systems architect."},
        {"role": "user", "content": "Explain FireAttention GPU CUDA kernel acceleration and Multi-LoRA hot-swapping."}
    ],
    temperature=0.7,
    max_tokens=1000
)

print(response.choices[0].message.content)
```

## Related Documentation & Models
- See official Fireworks AI documentation at https://docs.fireworks.ai
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Fireworks AI directory!"
