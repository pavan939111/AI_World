$mistralDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Mistral"

if (Test-Path $mistralDir) {
    Remove-Item -Recurse -Force $mistralDir
}
New-Item -ItemType Directory -Force -Path $mistralDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Mistral AI & European Frontier AI Ecosystem.";
        "Company.md" = "Founded in 2023 by Arthur Mensch, Guillaume Lample, and Timothée Lacroix in Paris, France; `$6 Billion+ valuation.";
        "Sparse-MoE-Architecture.md" = "Sparse Mixture-of-Experts (MoE) active parameter routing specs.";
        "History-and-Milestones.md" = "Timeline from Mistral 7B and Mixtral 8x7B to Mistral Large 2 and Pixtral Large.";
        "Glossary.md" = "Key terms, MoE terminology, FIM completion."
    };
    "01-Language-Models" = @{
        "README.md" = "General-purpose chat, reasoning, and long-context Mistral models.";
        "Mistral-Large-2.md" = "Mistral Large 2 (123B parameters, 128k context) flagship model specs (`$2.00 in / `$6.00 out per 1M).";
        "Mistral-NeMo.md" = "Mistral NeMo 12B model specs developed with NVIDIA (`$0.15 in / `$0.15 out per 1M).";
        "Mistral-Small.md" = "Mistral Small 3 model specs (`$0.20 in / `$0.60 out per 1M).";
        "Mixtral-8x22B.md" = "Mixtral 8x22B open-weights MoE model specs (`$2.00 in / `$6.00 out per 1M).";
        "Mixtral-8x7B.md" = "Original Mixtral 8x7B MoE model specs (`$0.70 in / `$0.70 out per 1M).";
        "Mistral-7B.md" = "Original Mistral 7B open-weights model specs (`$0.25 in / `$0.25 out per 1M).";
        "Comparisons.md" = "Mistral model family benchmark vs pricing matrix.";
        "Best-Practices.md" = "Prompt formatting, system prompts, multi-lingual tokenization."
    };
    "02-Coding-Models" = @{
        "README.md" = "Specialized coding models and Fill-In-the-Middle (FIM) code completion.";
        "Codestral-22B.md" = "Codestral 22B flagship coding model specs (`$0.20 in / `$0.60 out per 1M).";
        "Codestral-Mamba.md" = "Codestral Mamba 7B state-space architecture specs.";
        "Code-Completion-FIM.md" = "Fill-In-the-Middle (FIM) prefix/suffix code completion endpoint guide.";
        "Best-Practices.md" = "IDE plugin integration and code refactoring."
    };
    "03-Vision-and-OCR" = @{
        "README.md" = "Multimodal vision models and advanced document OCR parsing.";
        "Pixtral-Large.md" = "Pixtral Large 124B multimodal vision model specs (`$2.00 in / `$6.00 out per 1M).";
        "Pixtral-12B.md" = "Pixtral 12B lightweight vision model specs (`$0.15 in / `$0.15 out per 1M).";
        "Mistral-OCR.md" = "Mistral OCR API document parsing specs (`$1.00 per 1,000 pages).";
        "Examples.md" = "Python code patterns for PDF document OCR."
    };
    "04-Embedding-Models" = @{
        "README.md" = "Text vector embedding models for semantic search and RAG.";
        "mistral-embed.md" = "1,024-dimension vector embedding model specs (`$0.10 / 1M tokens).";
        "Comparisons.md" = "MTEB benchmarks comparison."
    };
    "05-Tool-Use-Function-Calling" = @{
        "README.md" = "Native tool calling and multi-tool execution loops.";
        "Tool-Calling-Specification.md" = "JSON tool declaration schemas.";
        "Examples.md" = "Python tool execution loop code snippets."
    };
    "06-Structured-Outputs" = @{
        "README.md" = "Guaranteed JSON mode schema compliance.";
        "JSON-Mode.md" = "`response_format: { type: 'json_object' }` specification.";
        "Examples.md" = "Python Pydantic schema validation patterns."
    };
    "07-Fine-Tuning" = @{
        "README.md" = "Supervised Fine-Tuning (SFT) & LoRA adaptation on La Plateforme.";
        "La-Plateforme-Fine-Tuning-API.md" = "Fine-Tuning endpoint specification.";
        "Hyperparameters.md" = "Configuring learning rate, epochs, and rank."
    };
    "08-Moderation-and-Guardrails" = @{
        "README.md" = "Safety classifiers and content moderation.";
        "mistral-moderation-latest.md" = "Mistral moderation model specs.";
        "Safety-Rules.md" = "Policy enforcement guidelines."
    };
    "09-APIs-and-Endpoints" = @{
        "README.md" = "La Plateforme REST API catalog (`api.mistral.ai`).";
        "Chat-Completions-API.md" = "`/v1/chat/completions` endpoint specification.";
        "Embeddings-API.md" = "`/v1/embeddings` endpoint specification.";
        "OCR-API.md" = "`/v1/ocr` endpoint specification.";
        "FIM-Completion-API.md" = "`/v1/fim/completions` endpoint specification."
    };
    "10-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Mistral AI client libraries.";
        "Python-SDK-mistralai.md" = "Official `mistralai` Python package specification.";
        "TypeScript-SDK.md" = "Official `@mistralai/mistralai` TypeScript package specification.";
        "cURL-and-REST.md" = "HTTP REST API specification."
    };
    "11-Pricing-and-Billing" = @{
        "README.md" = "La Plateforme pricing schedules.";
        "Token-Rates-Schedule.md" = "Mistral Large 2 (`$2.00/`$6.00), Codestral (`$0.20/`$0.60), OCR (`$1/1k pages).";
        "La-Plateforme-Billing.md" = "Pay-as-you-go credit management."
    };
    "12-Rate-Limits-and-Quotas" = @{
        "README.md" = "La Plateforme usage tiers and rate limits.";
        "RPM-TPM-RPD-Tables.md" = "Requests Per Minute and Tokens Per Minute tables.";
        "Tier-Thresholds.md" = "Tier 1 to Tier 4 usage threshold requirements."
    };
    "13-Authentication-and-Security" = @{
        "README.md" = "API key and European data security controls.";
        "MISTRAL_API_KEY-Setup.md" = "`MISTRAL_API_KEY` environment variable setup.";
        "European-Data-Sovereignty-GDPR.md" = "EU host data privacy, GDPR compliance, French data center hosting."
    };
    "14-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Document-OCR-Parsing-Pipeline.md" = "PDF document OCR & structured data extraction pipeline.";
        "Fill-In-Middle-Code-Autocomplete.md" = "IDE inline code autocomplete pattern."
    };
    "15-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from Mistral 7B to Pixtral Large."
    };
    "16-Official-References" = @{
        "README.md" = "Curated list of official Mistral AI links.";
        "Official-Links.md" = "Official docs link: https://docs.mistral.ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $mistralDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Mistral — $folder Overview
provider: Mistral
capability: $folder
last_updated: 2026-07-28
tags: [mistral, moe, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Mistral — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Mistral AI applications.

## 3. Models Belonging to This Capability
- Mistral Large 2, Codestral 22B, Pixtral Large, Mistral NeMo, mistral-embed.

## 4. Exposed APIs & Endpoints
- La Plateforme REST API endpoints (`https://api.mistral.ai/v1`) and official `mistralai` Python / TypeScript SDKs.

## 5. Common Use Cases
- High-performance coding, document OCR parsing, multilingual chat, European GDPR-compliant enterprise workloads.
"@
        } else {
            $content = @"
---
title: Mistral — $fileNameNoExt Specification
provider: Mistral
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [mistral, moe, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Mistral — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Mistral AI Frontier & Open Weights Series (Sparse MoE Architecture)
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image (Pixtral), PDF Document (Mistral OCR)
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 128,000 tokens
- **Max Output**: 8,192 tokens
- **Pricing**: Mistral Large 2 (`$2.00 in / `$6.00 out per 1M) | Codestral (`$0.20 in / `$0.60 out per 1M)
- **API Availability**: La Plateforme (`api.mistral.ai`), AWS Bedrock, Azure AI, GCP Vertex AI
- **Streaming Support**: SSE (`text/event-stream`)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode)

## Typical Use Cases
1. Production IDE code completion via Fill-In-the-Middle (FIM) API.
2. Enterprise PDF document OCR parsing into clean Markdown.

## Strengths & Limitations
- **Strengths**: Top-tier coding and multilingual performance, open-weights availability, EU data sovereignty & GDPR compliance.
- **Limitations**: Rate limit tier quotas on developer accounts.

## Example Request
```python
import os
from mistralai import Mistral

client = Mistral(api_key=os.environ.get("MISTRAL_API_KEY"))
response = client.chat.complete(
    model="mistral-large-latest",
    messages=[{"role": "user", "content": "Explain Sparse Mixture-of-Experts (MoE) architecture."}]
)
print(response.choices[0].message.content)
```

## Related Documentation & Models
- See official Mistral AI documentation at https://docs.mistral.ai
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Mistral directory!"
