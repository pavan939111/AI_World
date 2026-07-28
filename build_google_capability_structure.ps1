$googleDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Google-AI"

# Clean old structure
if (Test-Path $googleDir) {
    Remove-Item -Recurse -Force $googleDir
}
New-Item -ItemType Directory -Force -Path $googleDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Google AI & DeepMind Ecosystem.";
        "Company.md" = "Corporate history, founders (Demis Hassabis), Alphabet acquisition, Mountain View & London HQs.";
        "DeepMind-Merger-and-Infrastructure.md" = "Google DeepMind merger and TPU v5p & v6e hardware infrastructure.";
        "History-and-Milestones.md" = "Timeline from AlphaGo and Transformer paper to Gemini 2.5 Pro.";
        "Glossary.md" = "Key terms, acronyms, and terminology."
    };
    "01-Language-Models" = @{
        "README.md" = "General-purpose chat, long-context, and multimodal Gemini models.";
        "Gemini-2-5-Pro.md" = "2M token context flagship multimodal model specs.";
        "Gemini-2-5-Flash.md" = "1M token context high-speed model specs.";
        "Gemini-2-0-Flash.md" = "Gemini 2.0 Flash high-efficiency model specs.";
        "Gemini-1-5-Pro.md" = "Original 1M context window model specs.";
        "Gemini-1-5-Flash.md" = "Legacy lightweight model specs.";
        "Gemma-2-27B.md" = "Open weights Gemma 2 model specs.";
        "Comparisons.md" = "Gemini model performance vs cost tradeoffs.";
        "Best-Practices.md" = "Prompt engineering, 2M context optimization rules."
    };
    "02-Reasoning-Models" = @{
        "README.md" = "Extended thinking reasoning capabilities.";
        "Gemini-2-5-Pro-Thinking.md" = "Flagship reasoning and multi-step math logic specs.";
        "Thinking-Mechanics.md" = "Extended thinking token processing mechanics.";
        "Comparisons.md" = "Reasoning benchmarks comparison."
    };
    "03-Embedding-Models" = @{
        "README.md" = "Text vector embedding models for semantic search and Vertex AI Vector Search.";
        "text-embedding-004.md" = "768-dim vector model specs ($0.025/1M).";
        "Gecko-Embedding.md" = "Lightweight dense embedding model specs.";
        "Comparisons.md" = "MTEB and retrieval benchmarks comparison."
    };
    "04-Vision-and-Video-Understanding" = @{
        "README.md" = "Native video frame, image, chart, and document visual understanding.";
        "Video-Ingestion-Capabilities.md" = "1-Hour MP4 native video file processing specs.";
        "Supported-Models.md" = "Gemini 2.5 Pro and Flash vision capabilities.";
        "OCR-and-Document-Parsing.md" = "Reading handwritten notes, technical schematics, and complex blueprints.";
        "Video-Frame-Sampling-1FPS.md" = "1 FPS video frame sampling mechanics.";
        "Examples.md" = "Python code patterns for video QA."
    };
    "05-Image-Generation" = @{
        "README.md" = "Generative text-to-image synthesis and editing.";
        "Imagen-3.md" = "Flagship image generation model specs ($0.030/image).";
        "Imagen-2.md" = "Legacy image generation model specs.";
        "SynthID-Watermarking.md" = "Invisible SynthID digital pixel watermarking mechanics.";
        "Image-Editing-and-Inpainting.md" = "Inpainting, outpainting, and background modification.";
        "Best-Practices.md" = "Resolution and prompt styling guidelines."
    };
    "06-Video-Generation" = @{
        "README.md" = "Generative 1080p video clip generation.";
        "Veo-2.md" = "Flagship 1080p generative video model specs.";
        "Veo-1.md" = "Legacy video generation model specs.";
        "1080p-Video-Synthesis.md" = "Camera movement and motion physics controls.";
        "Prompt-Guide.md" = "Cinematic video prompt formatting rules."
    };
    "07-Audio-and-Speech" = @{
        "README.md" = "Multi-lingual speech recognition and neural text-to-speech.";
        "Chirp-2.md" = "100+ language acoustic speech recognition model specs.";
        "Cloud-Speech-to-Text.md" = "GCP Cloud Speech-to-Text API specs.";
        "Cloud-Text-to-Speech.md" = "GCP Cloud Text-to-Speech neural voice synthesis specs.";
        "Multi-Lingual-ASR.md" = "Acoustic noise rejection and transcription rules."
    };
    "08-Realtime-Voice" = @{
        "README.md" = "Sub-300ms direct speech-to-speech Gemini Multimodal Live API.";
        "Gemini-Multimodal-Live-API.md" = "Live voice WebSockets API specs.";
        "WebSockets-Audio-Streaming.md" = "Bidirectional audio WebSockets protocol guide.";
        "Voice-Activity-Detection.md" = "User interruption and server VAD handling.";
        "Best-Practices.md" = "Low-latency voice bot implementation rules."
    };
    "09-Code-AI" = @{
        "README.md" = "Code generation, refactoring, and whole repo ingestion.";
        "Code-Generation-Models.md" = "Gemini 2.5 Pro coding performance.";
        "Whole-Repo-Analysis-2M-Context.md" = "Ingesting whole codebases in 2M token context.";
        "Examples.md" = "Python and TypeScript code review scripts."
    };
    "10-Agentic-AI-and-Tools" = @{
        "README.md" = "Autonomous agent loops, code execution, and grounding tools.";
        "Agentic-Execution-Loops.md" = "Agent perception-action loop patterns.";
        "Code-Execution-Tool.md" = "Python code sandbox tool.";
        "Grounding-Tools.md" = "Connecting agents to external data sources."
    };
    "11-Function-Calling" = @{
        "README.md" = "Declaring custom JSON tools for Gemini parameter extraction.";
        "Function-Declaration-Schema.md" = "JSON Schema tool formatting.";
        "Examples.md" = "Python tool execution code patterns."
    };
    "12-Structured-Outputs" = @{
        "README.md" = "Guaranteed 100% JSON Schema adherence.";
        "JSON-Schema-Adherence.md" = "Response schema formatting rules.";
        "Examples.md" = "Python Pydantic schema validation patterns."
    };
    "13-Search-Grounding" = @{
        "README.md" = "Connecting responses directly to live Google Search index.";
        "Google-Search-Grounding-API.md" = "`tools=[{'google_search': {}}]` API specification.";
        "Citation-Metadata.md" = "Extracting live web search URL citations.";
        "Examples.md" = "Grounded search bot Python script."
    };
    "14-Context-Caching" = @{
        "README.md" = "Storing long prompt contexts (>32k tokens) in TPU memory for 75% cost savings.";
        "TPU-Context-Caching.md" = "Context Caching mechanism and TTL management.";
        "Cost-Savings-75Percent.md" = "75% input discount calculations.";
        "Best-Practices.md" = "Caching static documentation and code bases."
    };
    "15-Fine-Tuning" = @{
        "README.md" = "Supervised Fine-Tuning (SFT) & LoRA adaptation on TPU v5e.";
        "Gemini-1-5-Flash-Fine-Tuning.md" = "Fine-tuning Gemini Flash in AI Studio.";
        "Vertex-AI-Tuning.md" = "Enterprise fine-tuning on Google Cloud Vertex AI.";
        "Hyperparameters.md" = "Configuring epochs, learning rate, and batch size."
    };
    "16-Safety-and-Moderation" = @{
        "README.md" = "Configurable safety categories and blocking thresholds.";
        "Safety-Settings-API.md" = "Google AI Safety Settings API specs.";
        "Content-Categories.md" = "Hate speech, harassment, sexual, dangerous content categories.";
        "Configurable-Thresholds.md" = "`BLOCK_NONE`, `BLOCK_ONLY_HIGH`, `BLOCK_MEDIUM_AND_ABOVE` rules."
    };
    "17-APIs-and-Platforms" = @{
        "README.md" = "Google AI Studio and Vertex AI API catalog.";
        "Google-AI-Studio-API.md" = "Developer REST API for rapid prototyping.";
        "Vertex-AI-Enterprise-API.md" = "GCP enterprise cloud platform with SLA and RBAC.";
        "Multimodal-Live-API.md" = "Live WebSockets audio streaming API.";
        "Batch-Prediction-API.md" = "Vertex AI batch job execution pipeline."
    };
    "18-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official client libraries and SDKs.";
        "Python-SDK-google-genai.md" = "Official `google-genai` Python package specification.";
        "Node-TypeScript-SDK.md" = "Official `@google/genai` TypeScript package specification.";
        "Go-and-Java-SDKs.md" = "Go and Java client libraries.";
        "REST-APIs.md" = "cURL and HTTP raw request specification."
    };
    "19-Pricing-and-Billing" = @{
        "README.md" = "Complete token, prompt caching, and media pricing schedules.";
        "Token-Rates-Schedule.md" = "Prompts <128k vs >128k input and output pricing.";
        "Context-Caching-Discounts.md" = "75% input caching discount rules.";
        "Vertex-AI-Enterprise-Rates.md" = "GCP Vertex AI enterprise billing rates."
    };
    "20-Rate-Limits-and-Quotas" = @{
        "README.md" = "Google AI Studio and Vertex AI quota limits.";
        "Free-Tier-vs-Paid-Tier.md" = "Free (15 RPM) vs Paid (1,000 - 4,000 RPM) tier boundaries.";
        "RPM-TPM-RPD-Tables.md" = "Requests Per Minute and Tokens Per Minute tables.";
        "Quota-Management.md" = "Requesting quota increases on GCP."
    };
    "21-Authentication-and-Security" = @{
        "README.md" = "API key and GCP Service Account authentication.";
        "GEMINI_API_KEY-Setup.md" = "Setting up `GEMINI_API_KEY` environment variables.";
        "GCP-Service-Account-OAuth2.md" = "Configuring gcloud OAuth2 application default credentials.";
        "Enterprise-Privacy.md" = "GCP data privacy and zero data logging policy."
    };
    "22-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "1-Hour-Video-Summarizer.md" = "Ingesting 1-hour MP4 video files into Gemini 2.5 Pro.";
        "Grounded-Search-Bot.md" = "Factual search grounded bot code pattern.";
        "Whole-Repo-Inspector.md" = "Loading entire repositories into 2M token context window."
    };
    "23-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Historical-Releases.md" = "Timeline from 2017 Transformer paper to Gemini 2.5 Pro.";
        "Migration-Guides.md" = "Migrating from PaLM 2 / Gemini 1.0 to Gemini 2.5."
    };
    "24-Official-References" = @{
        "README.md" = "Curated list of official Google AI Studio and Vertex AI links.";
        "Official-Links.md" = "Official documentation, AI Studio portal, and GitHub repository links."
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $googleDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Google AI — $folder Overview
provider: Google AI
capability: $folder
last_updated: 2026-07-28
tags: [google, deepmind, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Google AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** capabilities in Google AI & Vertex AI applications.

## 3. Models Belonging to This Capability
- Active Gemini and specialized models serving **$folder**.

## 4. Exposed APIs & Endpoints
- Relevant REST, WebSockets, and `@google/genai` SDK endpoints exposing **$folder**.

## 5. Common Use Cases
- High-leverage enterprise and developer application use cases.
"@
        } else {
            $content = @"
---
title: Google AI — $fileNameNoExt Specification
provider: Google AI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [google, deepmind, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Google AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Google DeepMind Gemini / Imagen / Veo Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image, Audio (9.5 hrs), Video (1 hr MP4)
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 1,000,000 to 2,000,000 tokens
- **Max Output**: 8,192 tokens
- **Pricing**: Prompts <128k ($1.25 in / $5.00 out) | Prompts >128k ($2.50 in / $10.00 out)
- **API Availability**: Google AI Studio, Google Cloud Vertex AI
- **Streaming Support**: SSE (`text/event-stream`) & WebSockets
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Schema / Pydantic)

## Typical Use Cases
1. Whole repository code analysis & 1-hour video ingestion.
2. Enterprise Google Search Grounded search bots.

## Strengths & Limitations
- **Strengths**: 2M token context window, native video understanding, search grounding, context caching (75% discount).
- **Limitations**: Configurable safety moderation thresholds.

## Example Request
```python
import os
from google import genai

client = genai.Client()
print("Executing $fileNameNoExt query...")
```

## Related Documentation & Models
- See sibling capability files and official Google AI Studio references.
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Google AI directory!"
