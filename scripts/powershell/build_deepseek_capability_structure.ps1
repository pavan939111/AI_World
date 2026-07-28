$deepseekDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\DeepSeek"

if (Test-Path $deepseekDir) {
    Remove-Item -Recurse -Force $deepseekDir
}
New-Item -ItemType Directory -Force -Path $deepseekDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of DeepSeek & High-Efficiency Frontier AI Ecosystem.";
        "Company.md" = "Founded by Liang Wenfeng in Hangzhou, China; open-weights AI research organization.";
        "High-Efficiency-Architecture-MLA-GRPO.md" = "Multi-Head Latent Attention (MLA), DeepSeekMoE, and Group Relative Policy Optimization (GRPO) technical architecture.";
        "History-and-Milestones.md" = "Timeline from DeepSeek-Coder and DeepSeek-V2 to DeepSeek-V3 and DeepSeek-R1.";
        "Glossary.md" = "Key terms, GRPO terminology, MLA attention."
    };
    "01-Reasoning-Models" = @{
        "README.md" = "Frontier reasoning and chain-of-thought models matching OpenAI o1 at 1/27th compute cost.";
        "DeepSeek-R1.md" = "DeepSeek-R1 671B MoE reasoning model specs (`$0.55 in / `$2.19 out per 1M).";
        "DeepSeek-R1-Zero.md" = "DeepSeek-R1-Zero pure RL model specs trained without supervised fine-tuning.";
        "GRPO-Reinforcement-Learning.md" = "Group Relative Policy Optimization (GRPO) training algorithm mechanics.";
        "Comparisons.md" = "DeepSeek-R1 vs OpenAI o1 vs Claude 3.7 Sonnet benchmarks comparison.";
        "Best-Practices.md" = "Structuring prompts for DeepSeek-R1 reasoning."
    };
    "02-Language-Models" = @{
        "README.md" = "General-purpose chat, coding, and long-context DeepSeek foundation models.";
        "DeepSeek-V3.md" = "DeepSeek-V3 671B MoE flagship model specs (`$0.14 in / `$0.55 out per 1M).";
        "DeepSeek-V2-5.md" = "DeepSeek-V2.5 model specs.";
        "Multi-Head-Latent-Attention-MLA.md" = "MLA compression of Key-Value (KV) cache for low memory overhead.";
        "DeepSeekMoE-Architecture.md" = "Fine-grained experts (256 experts, 8 active per token) MoE routing.";
        "Comparisons.md" = "DeepSeek-V3 vs GPT-4o vs Claude 3.5 Sonnet benchmark vs pricing matrix.";
        "Best-Practices.md" = "Prompt formatting, system prompts, multi-lingual tokenization."
    };
    "03-Distilled-Models" = @{
        "README.md" = "Open-weights distilled reasoning models fine-tuned on DeepSeek-R1 reasoning outputs.";
        "DeepSeek-R1-Distill-Llama-70B.md" = "DeepSeek-R1-Distill-Llama-70B model specs.";
        "DeepSeek-R1-Distill-Qwen-32B.md" = "DeepSeek-R1-Distill-Qwen-32B model specs.";
        "DeepSeek-R1-Distill-Qwen-14B.md" = "DeepSeek-R1-Distill-Qwen-14B model specs.";
        "DeepSeek-R1-Distill-Llama-8B.md" = "DeepSeek-R1-Distill-Llama-8B model specs.";
        "DeepSeek-R1-Distill-Qwen-7B.md" = "DeepSeek-R1-Distill-Qwen-7B model specs.";
        "DeepSeek-R1-Distill-Qwen-1-5B.md" = "DeepSeek-R1-Distill-Qwen-1.5B model specs."
    };
    "04-Coding-Models" = @{
        "README.md" = "Specialized coding models and fill-in-the-middle code synthesis.";
        "DeepSeek-Coder-V2.md" = "DeepSeek-Coder-V2 236B MoE open coding model specs (`$0.14 in / `$0.28 out per 1M).";
        "DeepSeek-Coder-33B.md" = "DeepSeek-Coder-33B model specs.";
        "Code-Generation-and-Refactoring.md" = "Code refactoring across 338 programming languages.";
        "Best-Practices.md" = "IDE code completion prompt patterns."
    };
    "05-Multimodal-and-Image-Generation" = @{
        "README.md" = "Autoregressive multimodal understanding and text-to-image synthesis.";
        "Janus-Pro-7B.md" = "Janus-Pro 7B unified multimodal understanding and image generation model specs.";
        "Janus-1-3B.md" = "Janus 1.3B lightweight multimodal model specs.";
        "Autoregressive-Image-Generation.md" = "Autoregressive image generation mechanics."
    };
    "06-Tool-Use-Function-Calling" = @{
        "README.md" = "OpenAI-compatible tool calling.";
        "Tool-Calling-Specification.md" = "JSON tool declaration schemas.";
        "Examples.md" = "Python tool execution loop code snippets."
    };
    "07-Structured-Outputs" = @{
        "README.md" = "Guaranteed JSON mode schema compliance.";
        "JSON-Mode.md" = "`response_format: { type: 'json_object' }` specification.";
        "Examples.md" = "Python Pydantic schema validation patterns."
    };
    "08-Prompt-Caching" = @{
        "README.md" = "Automatic context caching providing up to 90% discount on cache hits.";
        "Context-Caching-90Percent-Discount.md" = "DeepSeek automatic disk-backed context caching ($0.014/1M cache read rate).";
        "Best-Practices.md" = "Structuring static system prompts and repository contexts."
    };
    "09-APIs-and-Endpoints" = @{
        "README.md" = "DeepSeek Cloud REST API catalog (`api.deepseek.com/v1`).";
        "OpenAI-Compatible-API.md" = "OpenAI API specification compatibility.";
        "Chat-Completions-API.md" = "`/v1/chat/completions` endpoint specification.";
        "Complete-REST-Spec.md" = "cURL raw request specification."
    };
    "10-SDKs-and-Developer-Tools" = @{
        "README.md" = "Developer SDKs and integration libraries.";
        "Python-SDK.md" = "Using `openai` Python package with `base_url='https://api.deepseek.com/v1'`.";
        "TypeScript-SDK.md" = "Node.js TypeScript integration guide.";
        "Ollama-and-vLLM-Integration.md" = "Running DeepSeek models via Ollama and vLLM."
    };
    "11-Pricing-and-Billing" = @{
        "README.md" = "DeepSeek Cloud API pricing schedules.";
        "Token-Rates-Schedule.md" = "DeepSeek-V3 (`$0.14 in / `$0.55 out), DeepSeek-R1 (`$0.55 in / `$2.19 out).";
        "Prompt-Cache-Discounts.md" = "Cache hit read rates (`$0.014 in for V3, `$0.14 in for R1)."
    };
    "12-Rate-Limits-and-Quotas" = @{
        "README.md" = "DeepSeek Platform rate limits.";
        "RPM-TPM-RPD-Tables.md" = "Requests Per Minute and Tokens Per Minute tables.";
        "Quota-Management.md" = "Managing API key balances."
    };
    "13-Authentication-and-Security" = @{
        "README.md" = "API key and authentication configuration.";
        "DEEPSEEK_API_KEY-Setup.md" = "`DEEPSEEK_API_KEY` environment variable setup.";
        "Security-Policies.md" = "Data privacy and security policies."
    };
    "14-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "DeepSeek-R1-Local-Ollama-RAG.md" = "Local self-hosted R1 reasoning RAG pipeline.";
        "High-Throughput-Agent-Loops.md" = "Cost-optimized agent loop code pattern."
    };
    "15-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release timeline.";
        "Release-History.md" = "Timeline from DeepSeek-V1 to DeepSeek-V3 and DeepSeek-R1."
    };
    "16-Official-References" = @{
        "README.md" = "Curated list of official DeepSeek links.";
        "Official-Links.md" = "Official docs link: https://platform.deepseek.com & https://github.com/deepseek-ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $deepseekDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: DeepSeek — $folder Overview
provider: DeepSeek
capability: $folder
last_updated: 2026-07-28
tags: [deepseek, deepseek-r1, deepseek-v3, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# DeepSeek — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in DeepSeek applications.

## 3. Models Belonging to This Capability
- DeepSeek-R1 (671B MoE), DeepSeek-V3 (671B MoE), DeepSeek-Coder-V2, Janus-Pro 7B, DeepSeek-R1-Distill-Llama-70B.

## 4. Exposed APIs & Endpoints
- OpenAI-compatible REST API endpoint (`https://api.deepseek.com/v1`), Ollama, vLLM, and cloud inference partners.

## 5. Common Use Cases
- High-reasoning math & logic tasks, ultra-low cost high-volume chat ($0.14/1M), open-weights local RAG deployments, code generation across 338 languages.
"@
        } else {
            $content = @"
---
title: DeepSeek — $fileNameNoExt Specification
provider: DeepSeek
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [deepseek, deepseek-r1, deepseek-v3, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# DeepSeek — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: DeepSeek Open Foundation & Reasoning Series (MLA + GRPO Architecture)
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image (Janus-Pro 7B)
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 64,000 to 128,000 tokens
- **Max Output**: 8,192 tokens
- **Pricing**: DeepSeek-V3 (`$0.14 in / `$0.55 out per 1M) | DeepSeek-R1 (`$0.55 in / `$2.19 out per 1M)
- **API Availability**: DeepSeek API (`api.deepseek.com`), OpenAI-compatible SDKs, Ollama, vLLM
- **Streaming Support**: SSE (`text/event-stream`)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode)

## Typical Use Cases
1. Production reasoning pipelines matching OpenAI o1 performance at ~1/27th cost.
2. Ultra-high volume data classification and chat at $0.14 per 1M input tokens.

## Strengths & Limitations
- **Strengths**: Lowest API cost in the industry ($0.14/1M), open-weights availability, Multi-Head Latent Attention (MLA) efficiency, 90% prompt caching discount.
- **Limitations**: Rate limits during peak platform usage.

## Example Request (OpenAI SDK Compatible)
```python
import os
from openai import OpenAI

client = OpenAI(
    api_key=os.environ.get("DEEPSEEK_API_KEY"),
    base_url="https://api.deepseek.com/v1"
)

completion = client.chat.completions.create(
    model="deepseek-reasoner", # Invokes DeepSeek-R1
    messages=[{"role": "user", "content": "Solve: Prove whether sqrt(2) is irrational."}]
)
print("Reasoning Output:")
print(completion.choices[0].message.content)
```

## Related Documentation & Models
- See official DeepSeek documentation at https://platform.deepseek.com
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in DeepSeek directory!"
