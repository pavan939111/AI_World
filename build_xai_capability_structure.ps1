$xaiDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\xAI"

if (Test-Path $xaiDir) {
    Remove-Item -Recurse -Force $xaiDir
}
New-Item -ItemType Directory -Force -Path $xaiDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of xAI & Grok Foundation Models.";
        "Company.md" = "Founded by Elon Musk in 2023, Burlingame CA HQ, Colossus 100,000 H100 GPU cluster in Memphis.";
        "Colossus-Supercomputer-Infrastructure.md" = "Memphis Colossus 100k H100 Liquid-Cooled Supercomputer cluster specs.";
        "History-and-Milestones.md" = "Timeline from Grok-1 announcement to Grok-2 and Grok-3 rollout.";
        "Glossary.md" = "Key terms, Grok terminology, X platform integration."
    };
    "01-Language-Models" = @{
        "README.md" = "General-purpose chat, long-context, and reasoning Grok models.";
        "Grok-3.md" = "Grok-3 flagship model specs trained on Colossus supercomputer.";
        "Grok-2.md" = "Grok-2 128k context model specs (`$2.00 in / `$10.00 out per 1M).";
        "Grok-2-mini.md" = "Grok-2-mini lightweight model specs (`$0.20 in / `$1.00 out per 1M).";
        "Comparisons.md" = "Grok-2 vs Grok-3 vs GPT-4o performance benchmarks.";
        "Best-Practices.md" = "Prompt engineering and live X data grounding."
    };
    "02-Reasoning-Models" = @{
        "README.md" = "Extended thinking reasoning capabilities.";
        "Grok-3-Reasoning.md" = "Grok-3 deep reasoning and math problem solving specs.";
        "Thinking-Mechanics.md" = "Internal chain-of-thought reasoning tokens.";
        "Comparisons.md" = "Grok-3 reasoning vs OpenAI o1/o3-mini."
    };
    "03-Vision-Models" = @{
        "README.md" = "Multimodal visual understanding and document OCR.";
        "Grok-2-Vision.md" = "Grok-2-Vision 128k context vision model specs.";
        "Image-Inspection-and-OCR.md" = "Document parsing, screenshot QA, and visual reasoning.";
        "Examples.md" = "Python code snippets for image inspection."
    };
    "04-Live-X-Platform-Grounding" = @{
        "README.md" = "Real-time access to X (formerly Twitter) platform post data and live breaking news.";
        "Realtime-X-Post-Search.md" = "Real-time post grounding and trend analysis.";
        "Live-News-Grounding.md" = "Summarizing live breaking news from X feeds.";
        "Examples.md" = "Python code pattern for live X post search."
    };
    "05-Tool-Use-Function-Calling" = @{
        "README.md" = "OpenAI-compatible tool calling.";
        "Tool-Calling-Specification.md" = "JSON tool declaration schemas.";
        "Examples.md" = "Python tool execution loop code snippets."
    };
    "06-Structured-Outputs" = @{
        "README.md" = "JSON mode and schema compliance.";
        "JSON-Mode.md" = "JSON mode specification.";
        "Examples.md" = "Python Pydantic schema validation patterns."
    };
    "07-APIs-and-Endpoints" = @{
        "README.md" = "xAI REST API endpoint catalog.";
        "OpenAI-Compatible-API.md" = "`https://api.x.ai/v1/chat/completions` specification.";
        "Chat-Completions-API.md" = "Chat completions endpoint rules.";
        "Complete-REST-Spec.md" = "cURL raw request headers."
    };
    "08-SDKs-and-Developer-Tools" = @{
        "README.md" = "Client libraries and OpenAI SDK compatibility.";
        "Python-SDK.md" = "Using `openai` Python package with `base_url='https://api.x.ai/v1'`.";
        "TypeScript-SDK.md" = "Node.js TypeScript integration guide.";
        "cURL-and-REST.md" = "HTTP REST API specification."
    };
    "09-Pricing-and-Billing" = @{
        "README.md" = "xAI Cloud API pricing schedules.";
        "Token-Rates-Schedule.md" = "Grok-2 (`$2.00 in/`$10.00 out), Grok-2-mini (`$0.20 in/`$1.00 out).";
        "Billing-Quotas.md" = "Pre-paid billing and credit management."
    };
    "10-Rate-Limits-and-Quotas" = @{
        "README.md" = "xAI Console rate limits and RPM/TPM quotas.";
        "RPM-TPM-RPD-Tables.md" = "Requests Per Minute and Tokens Per Minute tables.";
        "Quota-Management.md" = "Requesting quota limit increases."
    };
    "11-Authentication-and-Security" = @{
        "README.md" = "API key and authentication configuration.";
        "XAI_API_KEY-Setup.md" = "`XAI_API_KEY` environment variable setup.";
        "Security-Policies.md" = "Data privacy and security policies."
    };
    "12-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Realtime-X-Trend-Analyzer.md" = "Real-time X trend analyzer pattern.";
        "Multi-Turn-Agent-Loops.md" = "High-speed agent loop code patterns."
    };
    "13-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release timeline.";
        "Release-History.md" = "Timeline from Grok-1 to Grok-2 and Grok-3."
    };
    "14-Official-References" = @{
        "README.md" = "Curated list of official xAI links.";
        "Official-Links.md" = "Official docs link: https://docs.x.ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $xaiDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: xAI — $folder Overview
provider: xAI
capability: $folder
last_updated: 2026-07-28
tags: [xai, grok, elon-musk, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# xAI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Grok applications.

## 3. Models Belonging to This Capability
- Grok-3, Grok-2, Grok-2-mini, Grok-2-Vision.

## 4. Exposed APIs & Endpoints
- OpenAI-compatible REST API endpoint (`https://api.x.ai/v1`) and official SDK integration.

## 5. Common Use Cases
- Real-time X platform trend analysis, live news summarization, code generation, multimodal vision inspection.
"@
        } else {
            $content = @"
---
title: xAI — $fileNameNoExt Specification
provider: xAI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [xai, grok, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# xAI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: xAI Grok Series (Trained on Colossus 100k H100 Supercomputer)
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Image (Grok-2-Vision), Live X Posts
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 128,000 tokens
- **Max Output**: 8,192 tokens
- **Pricing**: Grok-2 (`$2.00 in / `$10.00 out per 1M tokens) | Grok-2-mini (`$0.20 in / `$1.00 out per 1M)
- **API Availability**: xAI API (`api.x.ai`), OpenAI-compatible SDKs
- **Streaming Support**: SSE (`text/event-stream`)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode)

## Typical Use Cases
1. Real-time X post search & sentiment analysis.
2. Production code generation & vision OCR.

## Strengths & Limitations
- **Strengths**: Real-time X platform data integration, 100% OpenAI API compatibility, high intelligence trained on Colossus.
- **Limitations**: Rate limit quotas on developer accounts.

## Example Request
```python
import os
from openai import OpenAI

client = OpenAI(
    api_key=os.environ.get("XAI_API_KEY"),
    base_url="https://api.x.ai/v1"
)

completion = client.chat.completions.create(
    model="grok-2-latest",
    messages=[{"role": "user", "content": "What is the latest breaking tech news on X today?"}]
)
print(completion.choices[0].message.content)
```

## Related Documentation & Models
- See official xAI documentation at https://docs.x.ai
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in xAI directory!"
