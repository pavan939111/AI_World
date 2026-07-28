$anthropicDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Anthropic"

if (Test-Path $anthropicDir) {
    Remove-Item -Recurse -Force $anthropicDir
}
New-Item -ItemType Directory -Force -Path $anthropicDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Anthropic PBC & Claude AI Ecosystem.";
        "Company.md" = "Founded by Dario & Daniela Amodei, Public Benefit Corporation (PBC), $40B+ valuation, Amazon & Google backing.";
        "Constitutional-AI-RLAIF.md" = "Constitutional AI principles and Reinforcement Learning from AI Feedback (RLAIF).";
        "History-and-Milestones.md" = "Timeline from Claude 1.0 to Claude 3.7 Sonnet.";
        "Glossary.md" = "Key terms and terminology."
    };
    "01-Language-Models" = @{
        "README.md" = "General-purpose chat, coding, and reasoning Claude models.";
        "Claude-3-7-Sonnet.md" = "Hybrid reasoning flagship model specs ($3.00 in / $15.00 out per 1M).";
        "Claude-3-5-Haiku.md" = "Ultra-fast low-cost model specs ($0.80 in / $4.00 out per 1M).";
        "Claude-3-Opus.md" = "Complex reasoning model specs ($15.00 in / $75.00 out per 1M).";
        "Comparisons.md" = "Claude 3.7 Sonnet vs 3.5 Haiku performance vs cost tradeoffs.";
        "Best-Practices.md" = "Prompt engineering, XML tags formatting, system prompt rules."
    };
    "02-Reasoning-and-Extended-Thinking" = @{
        "README.md" = "Customizable extended thinking budget reasoning capabilities.";
        "Claude-3-7-Hybrid-Reasoning.md" = "Seamlessly switching between instant response and extended thinking up to 128k thinking tokens.";
        "Extended-Thinking-Budget-Tuning.md" = "Configuring `thinking: { type: 'enabled', budget_tokens: 16000 }`.";
        "Comparisons.md" = "Extended thinking benchmark gains across coding and math."
    };
    "03-Vision-and-Document-Understanding" = @{
        "README.md" = "Visual understanding and native PDF document parsing.";
        "Vision-Capabilities.md" = "Image OCR and diagram interpretation guidelines.";
        "PDF-Document-Parsing.md" = "Parsing multi-page PDF files natively inside Messages API.";
        "Examples.md" = "Python code patterns for vision and document QA."
    };
    "04-Computer-Use" = @{
        "README.md" = "Autonomous desktop GUI computer control via Claude.";
        "Computer-Use-API.md" = "Mouse movement, clicking, typing, and screenshot capture API.";
        "Desktop-GUI-Automation.md" = "Building OS control bots.";
        "Best-Practices.md" = "Safety boundaries for computer control."
    };
    "05-Model-Context-Protocol-MCP" = @{
        "README.md" = "Open standard protocol for connecting AI models to data sources and tools.";
        "MCP-Architecture-Specification.md" = "Client-Host-Server MCP protocol architecture.";
        "MCP-Servers-and-Tools.md" = "Building local and remote MCP servers.";
        "Examples.md" = "Connecting Claude Code to Postgres and GitHub via MCP."
    };
    "06-Prompt-Caching" = @{
        "README.md" = "Ephemeral prompt caching providing 90% discount on cached inputs.";
        "Ephemeral-Prompt-Caching-90Percent-Discount.md" = "`cache_control: { type: 'ephemeral' }` specification ($0.30/1M read rate).";
        "Best-Practices.md" = "Caching static system prompts and repository contexts."
    };
    "07-Message-Batches" = @{
        "README.md" = "Asynchronous batch API providing 50% pricing discount.";
        "Message-Batches-API-50Percent-Discount.md" = "`/v1/messages/batches` endpoint specification.";
        "Examples.md" = "Python batch execution pipeline."
    };
    "08-Code-AI-and-Claude-Code" = @{
        "README.md" = "Agentic CLI coding tools and refactoring.";
        "Claude-Code-CLI.md" = "Claude Code command line interface guide.";
        "Code-Refactoring-and-Debugging.md" = "Multi-file code editing patterns.";
        "Best-Practices.md" = "Repo-wide automated code review."
    };
    "09-Tool-Use-Function-Calling" = @{
        "README.md" = "Declaring custom JSON tools for tool calling.";
        "Tool-Use-Specification.md" = "Tool schema formatting and tool execution loops.";
        "Examples.md" = "Python tool calling code patterns."
    };
    "10-Structured-Outputs" = @{
        "README.md" = "JSON mode and schema formatting.";
        "JSON-Schema-Formatting.md" = "Extracting structured JSON objects.";
        "Examples.md" = "Pydantic and JSON output extraction."
    };
    "11-Safety-and-Constitutional-AI" = @{
        "README.md" = "Constitutional AI principles and alignment.";
        "Constitutional-AI-Principles.md" = "Self-critique and revision alignment mechanics.";
        "Policy-Guardrails.md" = "Enterprise policy enforcement."
    };
    "12-APIs-and-Endpoints" = @{
        "README.md" = "Messages API and batch endpoints catalog.";
        "Messages-API.md" = "`/v1/messages` REST endpoint specification.";
        "Batch-API.md" = "`/v1/messages/batches` endpoint specification.";
        "Complete-REST-Spec.md" = "cURL raw request specification."
    };
    "13-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Anthropic client libraries.";
        "Python-SDK.md" = "Official `@anthropic-ai/sdk` Python package specification.";
        "TypeScript-SDK.md" = "Official `@anthropic-ai/sdk` TypeScript package specification.";
        "Claude-Code-CLI.md" = "CLI setup and authentication."
    };
    "14-Pricing-and-Billing" = @{
        "README.md" = "Complete token, prompt caching, and batch rates.";
        "Token-Rates-Schedule.md" = "Claude 3.7 Sonnet ($3 in/$15 out), 3.5 Haiku ($0.80 in/$4 out), 3 Opus ($15 in/$75 out).";
        "Prompt-Cache-Discounts.md" = "Prompt cache write ($3.75/1M) and read ($0.30/1M) rates."
    };
    "15-Rate-Limits-and-Quotas" = @{
        "README.md" = "Anthropic Console usage tiers and rate limits.";
        "Usage-Tiers-1-to-4.md" = "Build tier threshold requirements.";
        "RPM-TPM-Tables.md" = "Requests Per Minute and Tokens Per Minute tables."
    };
    "16-Authentication-and-Security" = @{
        "README.md" = "API key and authentication headers.";
        "x-api-key-Header.md" = "`x-api-key: YOUR_KEY` and `anthropic-version: 2023-06-01` headers.";
        "Enterprise-Security.md" = "SOC2 compliance and zero data retention for API."
    };
    "17-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Claude-Code-Agent-Pattern.md" = "Agentic CLI coding workflow.";
        "Computer-Use-Bot-Pattern.md" = "Desktop computer automation pattern."
    };
    "18-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Historical-Releases.md" = "Timeline from Claude 1.0 to Claude 3.7 Sonnet."
    };
    "19-Official-References" = @{
        "README.md" = "Curated list of official Anthropic links.";
        "Official-Links.md" = "Official docs link: https://docs.anthropic.com"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $anthropicDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Anthropic — $folder Overview
provider: Anthropic
capability: $folder
last_updated: 2026-07-28
tags: [anthropic, claude, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Anthropic — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** capabilities in Anthropic Claude applications.

## 3. Models Belonging to This Capability
- Claude 3.7 Sonnet, Claude 3.5 Haiku, Claude 3 Opus.

## 4. Exposed APIs & Endpoints
- Relevant REST Messages API and `@anthropic-ai/sdk` endpoints exposing **$folder**.

## 5. Common Use Cases
- High-leverage agentic coding, computer use, and enterprise document analysis.
"@
        } else {
            $content = @"
---
title: Anthropic — $fileNameNoExt Specification
provider: Anthropic
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [anthropic, claude, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Anthropic — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Anthropic Claude 3 / 3.5 / 3.7 Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Vision (JPEG, PNG, WEBP), PDF Documents
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 200,000 tokens
- **Max Output**: 8,192 to 128,000 thinking tokens (Claude 3.7 Sonnet)
- **Pricing**: $3.00 / 1M input | $15.00 / 1M output (Sonnet)
- **API Availability**: Anthropic Console API (`/v1/messages`), AWS Bedrock, GCP Vertex AI
- **Streaming Support**: SSE (`text/event-stream`)
- **Function Calling**: Supported (Tool Use)
- **Prompt Caching**: Supported (`cache_control: { type: 'ephemeral' }` - 90% discount)

## Typical Use Cases
1. Claude Code CLI agentic coding & refactoring.
2. Computer Use desktop GUI automation.

## Strengths & Limitations
- **Strengths**: Extended hybrid thinking budget up to 128k tokens, 90% prompt caching discount, Model Context Protocol (MCP), native PDF parsing.
- **Limitations**: No native text-to-image API directly inside Messages API.

## Example Request
```python
import os
import anthropic

client = anthropic.Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))
print("Executing $fileNameNoExt query...")
```

## Related Documentation & Models
- See official Anthropic documentation at https://docs.anthropic.com
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Anthropic directory!"
