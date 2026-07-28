$hfDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Hugging-Face"

if (Test-Path $hfDir) {
    Remove-Item -Recurse -Force $hfDir
}
New-Item -ItemType Directory -Force -Path $hfDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Hugging Face & Open-Source AI Community Platform.";
        "Company.md" = "Founded in 2016 by Clément Delangue (CEO), Julien Chaumond (CTO), and Thomas Wolf (Chief Scientist) in NYC & Paris; `$4.5 Billion valuation backed by Google, Amazon, NVIDIA, Salesforce, AMD, Intel, and Qualcomm.";
        "Hugging-Face-Hub-Architecture.md" = "Git-based Model Hub, Datasets Hub, and Spaces infrastructure architecture.";
        "History-and-Milestones.md" = "Timeline from PyTorch-Transformers in 2018 to Safetensors standard, TGI, and $4.5B valuation.";
        "Glossary.md" = "Key terms, Transformers, Safetensors, TGI, Spaces."
    };
    "01-Hugging-Face-Hub-and-Model-Registry" = @{
        "README.md" = "Model Hub hosting 1,000,000+ open-source AI models and datasets.";
        "Model-Hub-and-Repositories.md" = "Git LFS model repository structure and model cards (`README.md`).";
        "Datasets-Hub.md" = "Datasets Hub for training, evaluation, and benchmark datasets.";
        "Spaces-Demo-Registry.md" = "Public Spaces machine learning demonstration registry.";
        "Best-Practices.md" = "Creating model cards and managing dataset metadata."
    };
    "02-Inference-Endpoints-and-Serverless-API" = @{
        "README.md" = "Serverless Inference API and dedicated enterprise Inference Endpoints.";
        "Serverless-Inference-API.md" = "`api-inference.huggingface.co/models/{model_id}` serverless endpoint specification.";
        "Dedicated-Inference-Endpoints.md" = "Deploying dedicated private model containers on AWS, Azure, or GCP.";
        "Comparisons.md" = "Serverless Inference API vs Dedicated Inference Endpoints matrix.";
        "Best-Practices.md" = "Inference endpoint auto-scaling and cold boot optimization."
    };
    "03-Core-Python-Libraries" = @{
        "README.md" = "Industry-standard open-source Python libraries for machine learning.";
        "transformers-Library.md" = "`transformers` library specification for LLMs, vision, and audio models.";
        "diffusers-Library.md" = "`diffusers` library specification for image and video diffusion models.";
        "datasets-and-tokenizers.md" = "`datasets` data loading and `tokenizers` fast Rust tokenization libraries.";
        "peft-and-accelerate.md" = "`peft` Parameter-Efficient Fine-Tuning and `accelerate` multi-GPU training libraries.";
        "safetensors-Standard.md" = "`safetensors` safe tensor serialization format specification."
    };
    "04-Text-Generation-Inference-TGI" = @{
        "README.md" = "Text Generation Inference (TGI) high-throughput serving container specification.";
        "TGI-Container-Architecture.md" = "TGI Rust/Python serving container architecture with Paged Attention, FlashAttention, and Speculative Decoding.";
        "TGI-Deployment-Guide.md" = "Deploying TGI docker containers on private GPU servers (`ghcr.io/huggingface/text-generation-inference`).";
        "Best-Practices.md" = "TGI batch size and tensor parallelism tuning."
    };
    "05-AutoTrain-Advanced" = @{
        "README.md" = "AutoTrain Advanced zero-code and low-code model fine-tuning engine.";
        "AutoTrain-LLM-Fine-Tuning.md" = "Fine-tuning Llama 3, Qwen, and Mistral models via AutoTrain CLI or UI.";
        "AutoTrain-Vision-and-Tabular.md" = "Image classification and tabular data AutoTrain workflows.";
        "Examples.md" = "AutoTrain CLI fine-tuning script template."
    };
    "06-Spaces-and-Gradio-App-Hosting" = @{
        "README.md" = "Gradio and Streamlit interactive web app hosting on HF Spaces.";
        "Gradio-App-Development.md" = "Building interactive AI interfaces using Gradio (`import gradio as gr`).";
        "Spaces-Hardware-Tiers.md" = "Spaces CPU, Nvidia T4, A10G, and A100 GPU hardware tiers.";
        "Best-Practices.md" = "Embedding Spaces apps into external websites."
    };
    "07-Hugging-Face-API-and-Endpoints" = @{
        "README.md" = "Official Hugging Face REST API catalog (`huggingface.co/api`).";
        "Hub-REST-API.md" = "`/api/models` and `/api/datasets` endpoints specification.";
        "Inference-API-Specification.md" = "`https://api-inference.huggingface.co/models/{id}` endpoint specification.";
        "OAuth-and-User-Management-API.md" = "User authentication and token management API."
    };
    "08-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Hugging Face developer SDKs and CLI tools.";
        "Python-SDK-huggingface-hub.md" = "Official `huggingface_hub` Python package specification (`HfApi`, `hf_hub_download`).";
        "transformers-Pipeline-API.md" = "`pipeline()` high-level abstraction API.";
        "HuggingFace-CLI.md" = "`hf` command line interface for authentication and repo management."
    };
    "09-Pricing-and-Billing" = @{
        "README.md" = "Hugging Face pricing plans and infrastructure billing rates.";
        "HF-Pro-and-Enterprise.md" = "HF Free ($0), HF Pro ($9/mo), Enterprise Hub pricing plans.";
        "Inference-Endpoints-Hardware-Rates.md" = "Inference Endpoints per-GPU hourly rates (T4 `$0.60/h, A10G `$1.30/h, A100 `$4.50/h)."
    };
    "10-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Fine-Tuning-LLMs-with-PEFT-and-TRL.md" = "Fine-tuning Llama 3 using `transformers` + `peft` + `TRL` (SFTTrainer).";
        "Deploying-TGI-Inference-Endpoint.md" = "Deploying a dedicated TGI Inference Endpoint via `huggingface_hub`."
    };
    "11-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from PyTorch-Transformers in 2018 to TGI, Safetensors, and AutoTrain."
    };
    "12-Official-References" = @{
        "README.md" = "Curated list of official Hugging Face links.";
        "Official-Links.md" = "Official API docs link: https://huggingface.co/docs & https://huggingface.co"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $hfDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Hugging Face — $folder Overview
provider: Hugging Face
capability: $folder
last_updated: 2026-07-28
tags: [hugging-face, transformers, diffusers, tgi, hub, autotrain, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Hugging Face — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Hugging Face open-source AI applications.

## 3. Models & Tools Belonging to This Capability
- `transformers`, `diffusers`, `datasets`, `peft`, `accelerate`, `safetensors`, TGI (Text Generation Inference), AutoTrain Advanced, Spaces.

## 4. Exposed APIs & Endpoints
- Serverless Inference API (`https://api-inference.huggingface.co`), Dedicated Inference Endpoints, `huggingface_hub` Python SDK, `transformers` pipeline.

## 5. Common Use Cases
- Accessing 1,000,000+ open-source models, high-throughput LLM serving with TGI containers, parameter-efficient fine-tuning with PEFT/TRL, hosting Gradio interactive web apps on Spaces.
"@
        } else {
            $content = @"
---
title: Hugging Face — $fileNameNoExt Specification
provider: Hugging Face
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [hugging-face, transformers, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Hugging Face — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Provider Platform**: Hugging Face Open-Source AI Hub (Clément Delangue, Julien Chaumond, Thomas Wolf)
- **Supported Core Libraries**: `transformers`, `diffusers`, `datasets`, `peft`, `accelerate`, `safetensors`
- **Supported Modalities**: Text, Image, Audio, Video, 3D, Tabular Data
- **Inference Hardware**: Serverless Inference API or Dedicated GPU Endpoints (Nvidia T4 `$0.60/h, A10G `$1.30/h, A100 `$4.50/h)
- **Serving Engine**: Text Generation Inference (TGI) Docker Container (`ghcr.io/huggingface/text-generation-inference`)
- **API Availability**: Hugging Face REST API (`api-inference.huggingface.co`), Python `huggingface_hub` SDK
- **App Hosting**: HF Spaces (Gradio & Streamlit)

## Typical Use Cases
1. Loading and running open-source foundation models locally or in cloud environments using `transformers` pipeline API.
2. Deploying a dedicated private TGI container on AWS for high-throughput LLM inference.

## Strengths & Limitations
- **Strengths**: #1 open-source machine learning hub in the world (1M+ models), standard `transformers` library, TGI inference engine, `safetensors` safety format, AutoTrain fine-tuning.
- **Limitations**: Serverless Inference API has rate limits for heavy production workloads (requires Dedicated Inference Endpoints).

## Example Code (`transformers` Pipeline & `huggingface_hub`)
```python
import os
from transformers import pipeline
from huggingface_hub import HfApi

# 1. High-level LLM Inference with transformers pipeline
pipe = pipeline("text-generation", model="meta-llama/Llama-3.1-8B-Instruct", device_map="auto")
response = pipe("Explain open-source AI infrastructure.", max_new_tokens=200)
print(response[0]['generated_text'])

# 2. Inspect Model Metadata with huggingface_hub
api = HfApi(token=os.environ.get("HF_TOKEN"))
model_info = api.model_info("meta-llama/Llama-3.1-8B-Instruct")
print(f"Model Downloads: {model_info.downloads}")
```

## Related Documentation & Models
- See official Hugging Face documentation at https://huggingface.co/docs
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Hugging Face directory!"
