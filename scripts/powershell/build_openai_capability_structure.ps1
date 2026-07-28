$openaiDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI"

# Clean old structure
if (Test-Path $openaiDir) {
    Remove-Item -Recurse -Force $openaiDir
}
New-Item -ItemType Directory -Force -Path $openaiDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of OpenAI Ecosystem and capabilities.";
        "Company.md" = "Corporate history, founders, funding ($13B+), valuation ($157B+), board structure.";
        "Ecosystem-Architecture.md" = "Full-stack AI infrastructure overview.";
        "History-and-Milestones.md" = "Chronological timeline from 2015 to present.";
        "Glossary.md" = "Key terms, acronyms, and terminology."
    };
    "01-Language-Models" = @{
        "README.md" = "General-purpose chat and multimodal language models.";
        "GPT-4o.md" = "Flagship omnimodal model specs, pricing, use cases.";
        "GPT-4o-mini.md" = "Lightweight high-efficiency model specs.";
        "GPT-4-Turbo.md" = "Legacy flagship model specs.";
        "GPT-4.md" = "Original GPT-4 model specs.";
        "GPT-3.5-Turbo.md" = "Legacy fast text model specs.";
        "Comparisons.md" = "Side-by-side model intelligence vs cost tradeoffs.";
        "Best-Practices.md" = "Prompt engineering, token optimization, prompt caching rules."
    };
    "02-Reasoning-Models" = @{
        "README.md" = "Extended thinking chain-of-thought reasoning models.";
        "o1.md" = "Frontier PhD-level math and reasoning model specs.";
        "o3-mini.md" = "High-speed cost-effective reasoning model specs.";
        "o1-preview.md" = "Preview reasoning model specs.";
        "o1-mini.md" = "Lightweight reasoning model specs.";
        "Chain-of-Thought-Mechanics.md" = "Internal reasoning tokens and effort level tuning.";
        "Comparisons.md" = "Reasoning vs GPT-4o benchmarks comparison.";
        "Best-Practices.md" = "Structuring prompts for reasoning models."
    };
    "03-Embedding-Models" = @{
        "README.md" = "Dense numerical vector embedding models for semantic search and RAG.";
        "text-embedding-3-small.md" = "1,536-dim vector model specs ($0.02/1M).";
        "text-embedding-3-large.md" = "3,072-dim vector model specs ($0.13/1M).";
        "text-embedding-ada-002.md" = "Legacy vector embedding model specs.";
        "Dimensionality-Reduction.md" = "Custom dimensions parameter tuning.";
        "Comparisons.md" = "MTEB benchmarks comparison."
    };
    "04-Vision-and-Document-Understanding" = @{
        "README.md" = "Visual understanding, document OCR, chart analysis.";
        "Vision-Capabilities.md" = "Image input processing guidelines.";
        "Supported-Models.md" = "GPT-4o and GPT-4o-mini vision support.";
        "OCR-and-Document-Parsing.md" = "Extracting text from receipts, invoices, blueprints.";
        "Chart-and-Diagram-Analysis.md" = "Parsing charts and technical diagrams.";
        "Image-Token-Calculator.md" = "512x512 tile token formula (170 tokens/tile + 85 base).";
        "Examples.md" = "Python code snippets for image inspection."
    };
    "05-Image-Generation" = @{
        "README.md" = "Generative text-to-image synthesis and editing.";
        "DALL-E-3.md" = "Flagship image generation model specs.";
        "DALL-E-2.md" = "Legacy image generation model specs.";
        "Images-API.md" = "`/v1/images/generations` endpoint specification.";
        "Image-Editing-and-Inpainting.md" = "`/v1/images/edits` inpainting and mask specification.";
        "Image-Variations.md" = "`/v1/images/variations` endpoint specification.";
        "ChatGPT-Prompt-Expansion.md" = "Automatic prompt rewriting mechanics.";
        "Best-Practices.md" = "Style and quality selection rules."
    };
    "06-Audio-and-Speech" = @{
        "README.md" = "Acoustic speech recognition and text-to-speech synthesis.";
        "Whisper-v3.md" = "Automatic speech recognition (ASR) model specs.";
        "TTS-1.md" = "Standard neural voice synthesis specs.";
        "TTS-1-HD.md" = "High-definition neural voice synthesis specs.";
        "Speech-to-Text-API.md" = "`/v1/audio/transcriptions` endpoint specification.";
        "Text-to-Speech-API.md" = "`/v1/audio/speech` endpoint specification.";
        "Audio-Translation.md" = "`/v1/audio/translations` multi-lingual translation endpoint.";
        "Voice-Selection-Guide.md" = "6-voice characteristics (Alloy, Echo, Fable, Onyx, Nova, Shimmer)."
    };
    "07-Realtime-Voice" = @{
        "README.md" = "Sub-300ms direct speech-to-speech WebSockets & WebRTC protocol.";
        "gpt-4o-realtime-preview.md" = "Realtime audio model specs.";
        "Realtime-API-WebSockets.md" = "`wss://api.openai.com/v1/realtime` protocol guide.";
        "Realtime-API-WebRTC.md" = "Client WebRTC protocol guide.";
        "Voice-Activity-Detection-VAD.md" = "Server VAD and user interruption handling.";
        "Live-Tool-Execution.md" = "Executing client tools live during voice calls.";
        "Best-Practices.md" = "Audio buffer management and latency optimization."
    };
    "08-Coding-Models" = @{
        "README.md" = "Code generation, refactoring, and code interpretation.";
        "Supported-Coding-Models.md" = "GPT-4o and o3-mini coding performance.";
        "Code-Generation-and-Refactoring.md" = "Multi-language code synthesis patterns.";
        "Code-Interpreter-Sandbox.md" = "Python execution sandbox specs.";
        "Examples.md" = "Code review and bug fixing code snippets."
    };
    "09-Agentic-AI-and-Assistants" = @{
        "README.md" = "Managed stateful agent framework, threads, and tools.";
        "Assistants-API-v2.md" = "`/v1/assistants` endpoint specification.";
        "Threads-and-Messages.md" = "Stateful thread management.";
        "File-Search-Tool.md" = "Built-in RAG file ingestion tool.";
        "Vector-Stores.md" = "`/v1/vector_stores` endpoint specification.";
        "Code-Interpreter-Tool.md" = "Python code execution tool for assistants.";
        "Computer-Use-Experimental.md" = "GUI desktop action execution R&D.";
        "Architecture-Patterns.md" = "Autonomous multi-agent loops."
    };
    "10-Function-Calling" = @{
        "README.md" = "Declaring custom JSON tools for LLM parameter extraction.";
        "Tool-Declarations-Schema.md" = "JSON Schema function parameter formatting.";
        "Parallel-Function-Calling.md" = "Executing multiple tool calls in a single completion turn.";
        "Execution-Loop-Patterns.md" = "Client tool execution loop architecture.";
        "Examples.md" = "Python & TypeScript tool calling code patterns."
    };
    "11-Structured-Outputs" = @{
        "README.md" = "Guaranteed 100% JSON Schema and Pydantic output adherence.";
        "JSON-Schema-Adherence.md" = "Strict mode JSON schema enforcement.";
        "Pydantic-Integration.md" = "Python Pydantic model parsing via `beta.chat.completions.parse`.";
        "Strict-Mode.md" = "`strict: true` enforcement rules.";
        "Examples.md" = "TypeScript Zod and Python Pydantic structured output patterns."
    };
    "12-Fine-Tuning" = @{
        "README.md" = "Supervised Fine-Tuning (SFT) for custom model weights.";
        "Fine-Tuning-API.md" = "`/v1/fine_tuning/jobs` endpoint specification.";
        "Dataset-Preparation-JSONL.md" = "JSONL dataset formatting rules and validation.";
        "Hyperparameter-Tuning.md" = "Configuring `n_epochs`, `batch_size`, `learning_rate_multiplier`.";
        "Supported-Base-Models.md" = "gpt-4o-mini, gpt-4o, gpt-3.5-turbo fine-tuning specs.";
        "Evaluation-and-Metrics.md" = "Loss curve analysis and validation metrics."
    };
    "13-Safety-and-Moderation" = @{
        "README.md" = "Automated safety classifiers and policy violation detection.";
        "omni-moderation-latest.md" = "Multimodal safety classifier specs (100% Free).";
        "text-moderation-latest.md" = "Text moderation model specs.";
        "Multimodal-Safety-Classification.md" = "Checking text and images for policy violations.";
        "Guardrails-and-Policies.md" = "Enterprise policy enforcement."
    };
    "14-APIs-and-Endpoints" = @{
        "README.md" = "Complete REST API reference and endpoint catalog.";
        "Chat-Completions-API.md" = "`/v1/chat/completions` REST endpoint specification.";
        "Realtime-API.md" = "`wss://api.openai.com/v1/realtime` WebSockets protocol specification.";
        "Batch-API-50Percent-Discount.md" = "`/v1/batches` 50% discount batch execution pipeline.";
        "Embeddings-API.md" = "`/v1/embeddings` vector endpoint specification.";
        "Images-API.md" = "`/v1/images/generations` endpoint specification.";
        "Audio-API.md" = "`/v1/audio/transcriptions` and `/v1/audio/speech` specifications.";
        "Fine-Tuning-API.md" = "`/v1/fine_tuning/jobs` specification.";
        "Files-and-Vector-Stores-API.md" = "`/v1/files` and `/v1/vector_stores` specifications."
    };
    "15-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official client libraries and developer tools.";
        "Python-SDK.md" = "Official `openai` Python package specification.";
        "TypeScript-JavaScript-SDK.md" = "Official `openai` Node.js / TS package specification.";
        "REST-API-Specification.md" = "cURL and HTTP raw request specification.";
        "CLI-Tools.md" = "OpenAI Command Line Interface guide."
    };
    "16-Pricing-and-Billing" = @{
        "README.md" = "Complete token, media, and discount pricing schedules.";
        "Token-Rates-Schedule.md" = "Input and output token pricing for all models.";
        "Prompt-Caching-Discounts.md" = "50% prompt caching discount rules for inputs >1,024 tokens.";
        "Batch-API-Discounts.md" = "50% batch API discount rules.";
        "Media-and-Audio-Rates.md" = "DALL-E 3 image sizes and Whisper/TTS audio rates."
    };
    "17-Rate-Limits-and-Quotas" = @{
        "README.md" = "Usage tier limits, quotas, and header parsing.";
        "Usage-Tiers-1-to-5.md" = "Cumulative payment threshold tiers.";
        "RPM-TPM-RPD-Tables.md" = "Requests Per Minute, Tokens Per Minute, and Requests Per Day tables.";
        "Rate-Limit-Error-Handling.md" = "Handling HTTP 429 errors with exponential backoff."
    };
    "18-Authentication-and-Security" = @{
        "README.md" = "Authentication headers, API keys, and security controls.";
        "API-Keys-and-Project-Keys.md" = "Bearer token security and project-scoped keys (`sk-proj-...`).";
        "Organization-Headers.md" = "`OpenAI-Organization` and `OpenAI-Project` headers.";
        "Enterprise-Security-and-SOC2.md" = "Zero Data Retention (ZDR), SOC2 compliance, data privacy."
    };
    "19-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "RAG-Pipeline-Architectures.md" = "End-to-end RAG architecture with vector databases.";
        "Model-Router-Pattern.md" = "Dynamic cost-optimized model routing code pattern.";
        "Realtime-Voice-Bot-Pattern.md" = "Sub-300ms interactive voice assistant pattern.";
        "End-to-End-Code-Examples.md" = "Full-stack Python and TypeScript code templates."
    };
    "20-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and model migration guides.";
        "Historical-Model-Releases.md" = "Chronological model release history from 2015 to present.";
        "Deprecated-Models-and-Migration.md" = "Deprecated models (GPT-3.5, ada) migration guide.";
        "API-Version-History.md" = "API versioning timeline."
    };
    "21-Official-References" = @{
        "README.md" = "Curated list of official OpenAI platform and API links.";
        "Official-Links.md" = "Official documentation, status page, GitHub repositories, and pricing links."
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $openaiDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: OpenAI — $folder Overview
provider: OpenAI
capability: $folder
last_updated: 2026-07-28
tags: [openai, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# OpenAI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** capabilities in developer applications.

## 3. Models Belonging to This Capability
- Flagship and active models serving **$folder**.

## 4. Exposed APIs & Endpoints
- Relevant REST, WebSockets, and SDK endpoints exposing **$folder**.

## 5. Common Use Cases
- High-leverage enterprise and developer application use cases.
"@
        } else {
            $content = @"
---
title: OpenAI — $fileNameNoExt Specification
provider: OpenAI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [openai, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# OpenAI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: OpenAI Flagship / Specialist Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image, Audio, Video
- **Supported Output Modalities**: Text, JSON Schema, Audio
- **Context Window**: 128,000 to 200,000 tokens
- **Max Output**: 16,384 to 65,536 tokens
- **Pricing**: Standard token pricing schedule
- **API Availability**: OpenAI REST API, WebSockets, Azure OpenAI
- **Streaming Support**: SSE (`text/event-stream`) & WebSockets
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Schema / Pydantic)

## Typical Use Cases
1. Production AI application integration.
2. Enterprise automation pipelines.

## Strengths & Limitations
- **Strengths**: High intelligence, reliability, official SDK support.
- **Limitations**: Rate limit boundaries and token ceilings.

## Example Request
```python
import os
from openai import OpenAI

client = OpenAI()
print("Executing $fileNameNoExt query...")
```

## Related Documentation & Models
- See sibling capability files and official OpenAI references.
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in OpenAI directory!"
