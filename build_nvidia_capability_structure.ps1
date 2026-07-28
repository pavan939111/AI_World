$nvidiaDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\NVIDIA"

if (Test-Path $nvidiaDir) {
    Remove-Item -Recurse -Force $nvidiaDir
}
New-Item -ItemType Directory -Force -Path $nvidiaDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of NVIDIA AI & Enterprise GPU Acceleration Platform.";
        "Company.md" = "Founded in 1993 by Jensen Huang (CEO), Chris Malachowsky, and Curtis Priem in Santa Clara, CA; `$3.5 Trillion+ market capitalization.";
        "CUDA-and-Tensor-Core-Architecture.md" = "CUDA parallel computing platform, Tensor Core hardware architecture, H100 SXM5, H200, and Blackwell B200 GPUs.";
        "History-and-Milestones.md" = "Timeline from CUDA release in 2006 to DGX-1 (2016), H100 (2022), NIM Microservices (2024), and Blackwell (2024).";
        "Glossary.md" = "Key terms, TensorRT-LLM, NIM Microservices, NeMo Guardrails."
    };
    "01-NVIDIA-NIM-Microservices" = @{
        "README.md" = "Containerized NVIDIA Inference Microservices (NIM) for self-hosted enterprise deployment.";
        "NIM-Container-Architecture.md" = "NIM Docker & Helm chart container packaging with pre-compiled TensorRT-LLM engines.";
        "NIM-Supported-Models.md" = "NIM container catalog: Llama 3.3 70B, Nemotron 70B, DeepSeek-R1, Mixtral 8x22B, FLUX.1.";
        "Kubernetes-Helm-Deployment.md" = "Deploying NIM containers to Kubernetes clusters via Helm.";
        "Best-Practices.md" = "Auto-scaling and GPU memory optimization for NIM microservices."
    };
    "02-Nemotron-and-NV-Embedding-Models" = @{
        "README.md" = "NVIDIA foundational language, reward, and embedding models.";
        "Nemotron-70B.md" = "Llama-3.1-Nemotron-70B-Instruct flagship model specs (trained via MPO - Minimal Preference Optimization).";
        "Nemotron-Reward-Models.md" = "Llama-3.1-Nemotron-70B-Reward alignment model specs.";
        "NV-Embed-v2.md" = "NV-Embed-v2 model specs (#1 ranking dense embedding model on MTEB benchmark).";
        "NV-Rerank-v1.md" = "NV-Rerank-v1 cross-encoder reranking model specs.";
        "Comparisons.md" = "Nemotron-70B vs Llama 3.1 70B vs GPT-4o matrix."
    };
    "03-NeMo-Framework-and-Guardrails" = @{
        "README.md" = "NVIDIA NeMo end-to-end enterprise framework and AI safety guardrails.";
        "NeMo-Guardrails.md" = "NeMo Guardrails programmable safety framework (Colang language for blocking jailbreaks & hallucination).";
        "NeMo-Curator-and-Aligner.md" = "NeMo Curator data preprocessing and NeMo Aligner RLHF model training.";
        "Best-Practices.md" = "Writing Colang guardrail rules for enterprise chat bots."
    };
    "04-TensorRT-LLM-Inference-Engine" = @{
        "README.md" = "TensorRT-LLM open-source library for compiling high-throughput GPU inference engines.";
        "TensorRT-LLM-Compiler.md" = "Compiling LLMs with In-Flight Batching, PagedAttention, FP8, and INT4 AWQ quantization.";
        "FP8-and-INT4-Quantization.md" = "FP8 Transformer Engine execution on H100/H200 GPUs.";
        "Throughput-Benchmarking.md" = "Tokens/sec throughput benchmarks on H100 HGX servers."
    };
    "05-NVIDIA-build-Cloud-APIs" = @{
        "README.md" = "NVIDIA build cloud API catalog (`build.nvidia.com`).";
        "Serverless-Cloud-Endpoints.md" = "Testing and invoking NIM models serverless via `integrate.api.nvidia.com/v1`.";
        "OpenAI-API-Compatibility.md" = "OpenAI REST API compatibility specification (`/chat/completions`, `/embeddings`).";
        "Examples.md" = "Python request to `integrate.api.nvidia.com`."
    };
    "06-Omniverse-and-Cosmos-World-Models" = @{
        "README.md" = "NVIDIA Omniverse 3D simulation and Cosmos physical world models.";
        "Cosmos-World-Models.md" = "NVIDIA Cosmos foundation world models for autonomous robotics and vehicle simulation.";
        "Omniverse-Replicator.md" = "Synthetic 3D data generation in Omniverse for training AI models.";
        "Robotics-Isaac-Sim.md" = "NVIDIA Isaac Sim robotics simulation platform."
    };
    "07-APIs-and-Endpoints" = @{
        "README.md" = "Official NVIDIA API catalog (`integrate.api.nvidia.com/v1`).";
        "Chat-Completions-API.md" = "`/v1/chat/completions` endpoint specification.";
        "Embeddings-API.md" = "`/v1/embeddings` endpoint specification.";
        "Rerank-API.md" = "`/v1/ranking` endpoint specification."
    };
    "08-SDKs-and-Developer-Tools" = @{
        "README.md" = "Developer SDKs, CUDA toolkit, and NGC CLI tools.";
        "Python-OpenAI-SDK-Integration.md" = "Using `openai` Python SDK with `base_url='https://integrate.api.nvidia.com/v1'`.";
        "NGC-CLI.md" = "NVIDIA GPU Cloud (NGC) CLI tool specification.";
        "CUDA-Toolkit.md" = "CUDA Toolkit (nvcc, cuDNN, TensorRT) software stack."
    };
    "09-Pricing-and-Billing" = @{
        "README.md" = "NVIDIA AI Enterprise licensing and build.nvidia.com API credit pricing.";
        "NVIDIA-AI-Enterprise-Licensing.md" = "NVIDIA AI Enterprise license rate (`$4,500 / GPU / year` or `$1.00 / GPU / hour`).";
        "build-nvidia-com-API-Pricing.md" = "build.nvidia.com serverless token rates and free 1,000 credit allocation."
    };
    "10-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Deploying-NIM-Microservice-K8s.md" = "Complete Helm values deployment script for Llama 3.3 70B NIM on Kubernetes.";
        "Enterprise-RAG-NV-Embed-Nemotron.md" = "Enterprise RAG architecture using NV-Embed-v2 + Nemotron-70B + NeMo Guardrails."
    };
    "11-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from CUDA 1.0 in 2006 to TensorRT-LLM, NIM microservices, and Blackwell."
    };
    "12-Official-References" = @{
        "README.md" = "Curated list of official NVIDIA AI links.";
        "Official-Links.md" = "Official API docs link: https://docs.nvidia.com & https://build.nvidia.com"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $nvidiaDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: NVIDIA AI — $folder Overview
provider: NVIDIA
capability: $folder
last_updated: 2026-07-28
tags: [nvidia, nim, nemotron, tensorrt-llm, nemo, cuda, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# NVIDIA AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in NVIDIA enterprise AI applications.

## 3. Models & Microservices Belonging to This Capability
- NVIDIA NIM Microservices, Nemotron-70B, NV-Embed-v2, NV-Rerank-v1, NeMo Guardrails, TensorRT-LLM, Cosmos World Models.

## 4. Exposed APIs & Endpoints
- NVIDIA API Catalog (`https://integrate.api.nvidia.com/v1`), build.nvidia.com, NVIDIA NIM container images (`nvcr.io/nim`).

## 5. Common Use Cases
- Deploying self-hosted enterprise NIM microservices on Kubernetes, TensorRT-LLM FP8/INT4 GPU acceleration, NeMo programmable safety guardrails, NV-Embed-v2 #1 benchmark RAG search.
"@
        } else {
            $content = @"
---
title: NVIDIA AI — $fileNameNoExt Specification
provider: NVIDIA
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [nvidia, nim, nemotron, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# NVIDIA AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Provider Platform**: NVIDIA AI Enterprise & Hardware Computing Cloud (Jensen Huang)
- **Container Standard**: NVIDIA NIM (Inference Microservice) Docker / Helm Packaging (`nvcr.io/nim`)
- **Supported Core Models**: Nemotron-70B, Llama 3.3 70B, DeepSeek-R1, NV-Embed-v2, NV-Rerank-v1, FLUX.1
- **Inference Acceleration Engine**: TensorRT-LLM (PagedAttention, In-Flight Batching, FP8 Transformer Engine)
- **Safety Framework**: NeMo Guardrails (Colang programmable rule language)
- **API Availability**: NVIDIA API Catalog (`integrate.api.nvidia.com/v1`), OpenAI SDK compatible
- **Licensing**: NVIDIA AI Enterprise (`$4,500 / GPU / year`) or build.nvidia.com serverless cloud credits

## Typical Use Cases
1. Deploying a self-hosted, air-gapped enterprise LLM container (NIM Llama 3.3 70B) on private Kubernetes clusters.
2. Building an enterprise RAG search pipeline using NV-Embed-v2 (#1 MTEB rank) + Nemotron-70B + NeMo Guardrails.

## Strengths & Limitations
- **Strengths**: #1 AI computing hardware & CUDA ecosystem in the world, NIM microservice containerization, TensorRT-LLM FP8 speed, NeMo Guardrails safety, NV-Embed-v2 SOTA accuracy.
- **Limitations**: Enterprise NIM production deployments require NVIDIA AI Enterprise licensing for software support.

## Example Request (OpenAI SDK Compatible)
```python
import os
from openai import OpenAI

# Initialize client pointing to NVIDIA API Catalog (build.nvidia.com)
client = OpenAI(
    base_url="https://integrate.api.nvidia.com/v1",
    api_key=os.environ.get("NVIDIA_API_KEY")
)

completion = client.chat.completions.create(
    model="nvidia/llama-3.1-nemotron-70b-instruct",
    messages=[
        {"role": "system", "content": "You are a helpful assistant powered by NVIDIA Nemotron-70B."},
        {"role": "user", "content": "Explain how TensorRT-LLM In-Flight Batching accelerates GPU inference throughput."}
    ],
    temperature=0.5,
    max_tokens=1024
)

print(completion.choices[0].message.content)
```

## Related Documentation & Models
- See official NVIDIA documentation at https://docs.nvidia.com & https://build.nvidia.com
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in NVIDIA AI directory!"
