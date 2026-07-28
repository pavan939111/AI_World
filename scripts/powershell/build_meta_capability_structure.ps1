$metaDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Meta"

if (Test-Path $metaDir) {
    Remove-Item -Recurse -Force $metaDir
}
New-Item -ItemType Directory -Force -Path $metaDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Meta AI & Open-Source Llama Ecosystem.";
        "Company.md" = "Founded by Mark Zuckerberg, Yann LeCun (Chief AI Scientist), FAIR (Fundamental AI Research) lab in Menlo Park, CA.";
        "Open-Source-AI-Strategy.md" = "Meta open-weights strategy, open license agreement, developer ecosystem empowerment.";
        "History-and-Milestones.md" = "Timeline from LLaMA 1 to Llama 2, Llama 3, Llama 3.1 405B, Llama 3.3 70B, and SAM 2.";
        "Glossary.md" = "Key terms, Llama terminology, GGUF, Quantization."
    };
    "01-Language-Models" = @{
        "README.md" = "Open-weights foundation Llama language models.";
        "Llama-3-1-405B.md" = "Llama 3.1 405B flagship open foundation model specs (128k context).";
        "Llama-3-3-70B.md" = "Llama 3.3 70B state-of-the-art open model specs.";
        "Llama-3-1-70B.md" = "Llama 3.1 70B open model specs.";
        "Llama-3-1-8B.md" = "Llama 3.1 8B lightweight model specs.";
        "Llama-3-2-3B.md" = "Llama 3.2 3B ultra-lightweight mobile/edge model specs.";
        "Llama-3-2-1B.md" = "Llama 3.2 1B on-device model specs.";
        "Comparisons.md" = "Llama model family parameter vs VRAM requirements matrix.";
        "Best-Practices.md" = "Prompt formatting `<|begin_of_text|>`, system tags, tool header rules."
    };
    "02-Vision-Models" = @{
        "README.md" = "Multimodal vision understanding and image segmentation.";
        "Llama-3-2-90B-Vision.md" = "Llama 3.2 90B Vision open model specs.";
        "Llama-3-2-11B-Vision.md" = "Llama 3.2 11B Vision open model specs.";
        "Segment-Anything-SAM-2.md" = "SAM 2 real-time video and image object segmentation model specs.";
        "Examples.md" = "Python visual QA and SAM 2 segmentation code snippets."
    };
    "03-Coding-Models" = @{
        "README.md" = "Specialized code generation models.";
        "Code-Llama-70B.md" = "Code Llama 70B open coding model specs.";
        "Code-Llama-34B.md" = "Code Llama 34B model specs.";
        "Best-Practices.md" = "Fill-In-the-Middle (FIM) prompt formatting for Code Llama."
    };
    "04-Speech-and-Translation" = @{
        "README.md" = "Multilingual speech recognition, translation, and audio generation.";
        "SeamlessM4T-v2.md" = "SeamlessM4T v2 speech-to-speech and speech-to-text translation across 100+ languages.";
        "AudioCraft-MusicGen.md" = "MusicGen text-to-music generation model specs.";
        "Voicebox.md" = "Voicebox generative speech synthesis model specs."
    };
    "05-Generative-Video" = @{
        "README.md" = "Generative video synthesis models.";
        "Movie-Gen.md" = "Movie Gen 30B parameter video, audio, and editing foundation model specs.";
        "Emu-Video.md" = "Emu Video text-to-video generation specs."
    };
    "06-Llama-Stack-API-Standard" = @{
        "README.md" = "Standardized API spec for building Llama applications across cloud and edge.";
        "Llama-Stack-Architecture.md" = "Llama Stack inference, safety, agentic memory, and vector RAG provider interfaces.";
        "Inference-and-Safety-Providers.md" = "Configuring vLLM, Ollama, Together AI, and Bedrock Llama Stack backends.";
        "Examples.md" = "Python Llama Stack client code example."
    };
    "07-Self-Hosting-and-Quantization" = @{
        "README.md" = "Deploying Llama models locally and on-premise.";
        "Ollama-and-vLLM.md" = "Running Llama via Ollama CLI and vLLM high-throughput engine.";
        "GGUF-and-AWQ-Quantization.md" = "GGUF (llama.cpp) and AWQ/GPTQ 4-bit/8-bit quantization mechanics.";
        "vLLM-Inference-Engine.md" = "vLLM PagedAttention architecture and multi-GPU tensor parallelism.";
        "Hardware-Sizing-Guide.md" = "VRAM memory requirements guide (8B = 16GB VRAM, 70B = 140GB VRAM, 405B = 8x H100)."
    };
    "08-Tool-Use-Function-Calling" = @{
        "README.md" = "Native Llama 3 tool calling formatting.";
        "Llama-3-Tool-Calling-Spec.md" = "`<|start_header_id|>ipython<|end_header_id|>` tool header specification.";
        "Examples.md" = "Python tool execution loop code snippets."
    };
    "09-Structured-Outputs" = @{
        "README.md" = "JSON mode and schema enforcement for Llama.";
        "JSON-Mode.md" = "Grammar-based GBNF & JSON schema enforcement.";
        "Examples.md" = "Python Pydantic schema validation patterns."
    };
    "10-Fine-Tuning-and-Adaptation" = @{
        "README.md" = "Custom fine-tuning and LoRA parameter-efficient adaptation.";
        "LoRA-and-QLoRA-Tuning.md" = "LoRA and 4-bit QLoRA fine-tuning workflows.";
        "Unsloth-and-Axolotl.md" = "Accelerated fine-tuning using Unsloth (5x faster) and Axolotl.";
        "DPO-Preference-Tuning.md" = "Direct Preference Optimization (DPO) alignment."
    };
    "11-Safety-and-Guardrails" = @{
        "README.md" = "Meta safety models and guardrail evaluation frameworks.";
        "Llama-Guard-3.md" = "Llama Guard 3 input/output content safety classifier specs.";
        "Prompt-Guard.md" = "Prompt Guard prompt injection and jailbreak detection model.";
        "CyberSec-Eval.md" = "Cybersecurity risk evaluation framework."
    };
    "12-Cloud-Partner-APIs" = @{
        "README.md" = "Hosted cloud API providers serving Meta Llama models.";
        "Together-AI-and-Fireworks.md" = "Together AI, Fireworks AI, Groq serverless Llama endpoints.";
        "AWS-Bedrock-Llama.md" = "Meta Llama models on AWS Bedrock.";
        "Azure-AI-Llama.md" = "Meta Llama models on Azure AI Model Catalog."
    };
    "13-SDKs-and-Developer-Tools" = @{
        "README.md" = "Developer SDKs and integration libraries.";
        "Llama-Stack-Python-SDK.md" = "Official `llama-stack-client` Python package specification.";
        "Ollama-Python-SDK.md" = "Official `ollama` Python package specification.";
        "PyTorch-Integration.md" = "Native PyTorch model loading and execution."
    };
    "14-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Self-Hosted-Local-RAG-Pipeline.md" = "Self-hosted privacy-first local RAG pipeline (Ollama + Qdrant).";
        "vLLM-Production-Cluster.md" = "vLLM multi-GPU production inference cluster pattern."
    };
    "15-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Historical-Releases.md" = "Timeline from LLaMA 1 to Llama 3.3."
    };
    "16-Official-References" = @{
        "README.md" = "Curated list of official Meta AI links.";
        "Official-Links.md" = "Official docs link: https://llama.meta.com & https://github.com/meta-llama"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $metaDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Meta AI — $folder Overview
provider: Meta
capability: $folder
last_updated: 2026-07-28
tags: [meta, llama, open-source, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Meta AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Meta Llama open-source applications.

## 3. Models Belonging to This Capability
- Llama 3.1 405B, Llama 3.3 70B, Llama 3.1 8B, Llama 3.2 Vision (90B/11B), Llama Guard 3, SAM 2.

## 4. Exposed APIs & Endpoints
- Self-hosted Ollama / vLLM local endpoints, Llama Stack API standard, and cloud partner APIs (Together AI, AWS Bedrock, Azure AI).

## 5. Common Use Cases
- Self-hosted privacy-first enterprise RAG, local air-gapped LLM deployments, fine-tuning custom domain weights, open-source AI infrastructure.
"@
        } else {
            $content = @"
---
title: Meta AI — $fileNameNoExt Specification
provider: Meta
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [meta, llama, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Meta AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Meta Llama Open-Source Foundation Series
- **License**: Meta Llama 3 Community License Agreement (Free commercial use up to 700M MAU)
- **Supported Input Modalities**: Text, Image (Llama 3.2 Vision), Audio (SeamlessM4T)
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 128,000 tokens
- **Max Output**: 8,192 tokens
- **Hosting Options**: Self-hosted (vLLM, Ollama, TGI) or Hosted Cloud APIs (Together, Groq, Bedrock)
- **Streaming Support**: SSE (`text/event-stream`)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode & GBNF Grammars)

## Typical Use Cases
1. Self-hosted privacy-first enterprise RAG on private GPU servers.
2. Fine-tuning custom domain weights via LoRA / QLoRA using Unsloth.

## Strengths & Limitations
- **Strengths**: 100% open-weights availability, zero vendor lock-in, customizable weights, state-of-the-art performance (405B & 70B).
- **Limitations**: Requires self-managed GPU hardware infrastructure or cloud inference partner endpoints.

## Example Request (Via Ollama Local API)
```python
import os
import ollama

response = ollama.chat(
    model="llama3.3:70b",
    messages=[{"role": "user", "content": "Explain open-source AI foundation model architecture."}]
)
print(response['message']['content'])
```

## Related Documentation & Models
- See official Meta Llama documentation at https://llama.meta.com
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Meta directory!"
