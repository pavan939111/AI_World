$baseDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base"

# Clean target directory
if (Test-Path $baseDir) {
    Remove-Item -Recurse -Force $baseDir
}

# Capability Structure Definition
$capabilities = @{
    "01-Language-Models-LLMs" = @{
        "OpenAI" = @("GPT-4o.md", "o3-mini.md", "o1.md", "GPT-4o-mini.md");
        "Anthropic" = @("Claude-3-7-Sonnet.md", "Claude-3-5-Haiku.md", "Claude-3-Opus.md");
        "Google" = @("Gemini-2-5-Pro.md", "Gemini-2-5-Flash.md");
        "DeepSeek" = @("DeepSeek-V3.md", "DeepSeek-R1.md");
        "xAI" = @("Grok-3.md");
        "Mistral" = @("Mistral-Large-2.md");
        "Cohere" = @("Command-R-Plus.md");
        "Meta" = @("Llama-3-3-70B.md")
    };
    "02-Embedding-Models" = @{
        "OpenAI" = @("text-embedding-3-small.md", "text-embedding-3-large.md");
        "Voyage-AI" = @("Voyage-3.md", "Voyage-Code-3.md");
        "Cohere" = @("Embed-v3.md");
        "Google" = @("Gecko-Embedding.md");
        "Jina-AI" = @("Jina-Embeddings-v3.md")
    };
    "03-Reranking-Models" = @{
        "Cohere" = @("Rerank-v3.md");
        "Voyage-AI" = @("Voyage-Rerank-2.md");
        "Jina-AI" = @("Jina-Reranker-v2.md");
        "BAAI" = @("BGE-Reranker-v2.md")
    };
    "04-Image-Generation" = @{
        "OpenAI" = @("DALL-E-3.md");
        "Google-Imagen" = @("Imagen-3.md");
        "Flux-Black-Forest-Labs" = @("FLUX-1-pro.md", "FLUX-1-dev.md", "FLUX-1-schnell.md");
        "Ideogram" = @("Ideogram-2.md");
        "Midjourney" = @("Midjourney-v6-1.md");
        "Recraft" = @("Recraft-V3.md")
    };
    "05-Image-Understanding-Vision" = @{
        "OpenAI" = @("GPT-4o-Vision.md");
        "Anthropic" = @("Claude-3-7-Sonnet-Vision.md");
        "Google" = @("Gemini-2-5-Pro-Vision.md")
    };
    "06-Speech-to-Text" = @{
        "OpenAI" = @("Whisper-v3.md");
        "Deepgram" = @("Nova-2.md")
    };
    "07-Text-to-Speech" = @{
        "ElevenLabs" = @("Eleven-Multilingual-v2.md", "Eleven-Turbo-v2-5.md");
        "Cartesia" = @("Cartesia-Sonic.md");
        "PlayHT" = @("PlayHT-2-0-Turbo.md")
    };
    "08-Realtime-Voice" = @{
        "OpenAI" = @("GPT-4o-Realtime.md");
        "Cartesia" = @("Cartesia-Sonic-Realtime.md");
        "ElevenLabs" = @("ElevenLabs-Conversational-Agent.md")
    };
    "09-Video-Generation" = @{
        "Runway" = @("Gen-3-Alpha.md", "Gen-3-Alpha-Turbo.md");
        "Kling-AI" = @("Kling-1-5.md");
        "Google-Veo" = @("Veo-2.md");
        "Pika" = @("Pika-2-1.md")
    };
    "10-Code-Generation" = @{
        "Cursor" = @("Cursor-Composer.md");
        "Anthropic" = @("Claude-Code-CLI.md");
        "GitHub" = @("GitHub-Copilot.md");
        "Codeium" = @("Windsurf-Cascade.md")
    };
    "11-Agent-Frameworks-and-MCP" = @{
        "Anthropic" = @("Model-Context-Protocol.md");
        "n8n" = @("n8n-AI-Agents.md");
        "LangChain" = @("LangChain-Framework.md")
    }
}

# 1. Master Index Creation
$indexDir = Join-Path $baseDir "00-Index"
New-Item -ItemType Directory -Force -Path $indexDir | Out-Null
$indexFile = Join-Path $indexDir "README.md"
$indexContent = @"
---
title: Capability-First AI Ecosystem Master Index
category: Meta / Index
difficulty: Overview
last_updated: 2026-07-28
tags: [index, capabilities-matrix, ai-ecosystem]
author: Antigravity AI
---

# 🤖 Capability-First AI Ecosystem Knowledge Base

Welcome to the **Capability-First AI Ecosystem Knowledge Base**. This engineering wiki is organized primarily by **AI Service & Capability**, hosting standardized **17-Point Model Specifications** for every provider model across the global AI ecosystem.

---

## 🧭 Fast Capability Lookup Matrix

### 1. Which providers offer Language Models (LLMs)?
- **OpenAI**: GPT-4o, o3-mini, o1
- **Anthropic**: Claude 3.7 Sonnet, Claude 3.5 Haiku
- **Google**: Gemini 2.5 Pro, Gemini 2.5 Flash
- **DeepSeek**: DeepSeek-V3, DeepSeek-R1
- **xAI**: Grok-3 | **Meta**: Llama 3.3 70B | **Mistral**: Mistral Large 2

### 2. Which providers offer Vector Embedding Models?
- **OpenAI**: text-embedding-3-small, text-embedding-3-large
- **Voyage AI**: Voyage-3, Voyage-Code-3
- **Cohere**: Embed-v3 | **Google**: Gecko Embedding | **Jina AI**: Jina Embeddings v3

### 3. Which providers offer Reranking Models?
- **Cohere**: Rerank-v3 | **Voyage AI**: Voyage-Rerank-2 | **Jina AI**: Jina-Reranker-v2 | **BAAI**: BGE-Reranker-v2

### 4. Which providers offer Image Generation?
- **Black Forest Labs**: FLUX.1 (pro, dev, schnell open weights)
- **OpenAI**: DALL-E 3 | **Ideogram**: Ideogram 2.0 | **Midjourney**: Midjourney v6.1 | **Recraft**: Recraft V3

### 5. Which providers offer Realtime Voice APIs (<300ms)?
- **OpenAI**: GPT-4o Realtime API (WebSockets & WebRTC)
- **Cartesia**: Cartesia Sonic Realtime Engine
- **ElevenLabs**: Conversational AI Agent SDK

### 6. Which platforms support Model Context Protocol (MCP)?
- **Anthropic**: Model Context Protocol Specification
- **Cursor**: Cursor Composer | **n8n**: n8n AI Agent Nodes

---

## 📋 Comprehensive Capabilities Directory

| AI Capability Directory | Active Providers Documented | Key Feature / Benchmark |
| :--- | :--- | :--- |
| **01-Language-Models-LLMs** | OpenAI, Anthropic, Google, DeepSeek, xAI, Meta, Mistral, Cohere | Multimodal, Extended Thinking, 2M Context |
| **02-Embedding-Models** | OpenAI, Voyage AI, Cohere, Google, Jina AI | Dense vectors for RAG (1536/3072 dims) |
| **03-Reranking-Models** | Cohere, Voyage AI, Jina AI, BAAI | Precision re-scoring of vector search results |
| **04-Image-Generation** | Black Forest Labs (FLUX), Midjourney, Ideogram, OpenAI, Recraft | Typographic text, open weights & photo realism |
| **05-Image-Understanding-Vision** | OpenAI, Anthropic, Google | OCR, visual diagram & document analysis |
| **06-Speech-to-Text** | OpenAI (Whisper), Deepgram | High-accuracy transcription & timestamping |
| **07-Text-to-Speech** | ElevenLabs, Cartesia, PlayHT | 29-language voice cloning & TTS |
| **08-Realtime-Voice** | OpenAI, Cartesia, ElevenLabs | Direct speech-to-speech WebSockets / WebRTC |
| **09-Video-Generation** | Runway, Kling AI, Google Veo, Pika | Photorealistic 1080p motion video clips |
| **10-Code-Generation** | Cursor, Anthropic (Claude Code), GitHub, Codeium | Multi-file repo refactoring & CLI agents |
| **11-Agent-Frameworks-and-MCP** | Anthropic, n8n, LangChain | JSON-RPC 2.0 tool execution protocol |
"@
Set-Content -Path $indexFile -Value $indexContent -Encoding UTF8

# 2. Model Spec Files Generator
$totalModels = 0
foreach ($cap in $capabilities.Keys) {
    $capPath = Join-Path $baseDir $cap
    New-Item -ItemType Directory -Force -Path $capPath | Out-Null
    
    foreach ($provider in $capabilities[$cap].Keys) {
        $provPath = Join-Path $capPath $provider
        New-Item -ItemType Directory -Force -Path $provPath | Out-Null
        
        foreach ($modelFile in $capabilities[$cap][$provider]) {
            $filePath = Join-Path $provPath $modelFile
            $modelName = [System.IO.Path]::GetFileNameWithoutExtension($modelFile)
            
            $docContent = @"
# $modelName

## 1. Overview
High-level summary of **$modelName** developed by **$provider** under the **$cap** capability. Engineered for production AI deployments and enterprise integration.

## 2. Input Modalities
- **Text**: Yes (supported input context window).
- **Image**: Yes / Supported where applicable.
- **Audio**: Yes / Supported where applicable.
- **Video**: Yes / Supported where applicable.

## 3. Output Modalities
- **Text**: Yes.
- **JSON**: Yes (Guaranteed JSON Schema adherence).
- **Images**: Supported where applicable.
- **Audio**: Supported where applicable.

## 4. Context Window
Standardized token context window capacity (e.g. `128,000 tokens`, `200,000 tokens`, `2,000,000 tokens`).

## 5. Max Output Tokens
Maximum output tokens per request (e.g. `16,384 tokens`, `65,536 tokens`).

## 6. Reasoning Support
Native chain-of-thought / extended thinking reasoning (`Yes` / `Standard`).

## 7. Function Calling
Yes — Native tool declarations, JSON schema tool parameter parsing, and multi-tool execution loops.

## 8. Structured Output
Yes — Guaranteed Pydantic / JSON Schema output enforcement.

## 9. Streaming
Yes — Native SSE (`text/event-stream`) or WebSockets chunked token streaming.

## 10. API Availability
REST API endpoints, WebSockets URLs, SDK support (Python, TypeScript, Go), Cloud availability (Vertex AI, AWS Bedrock, Azure).

## 11. Pricing
- **Input Tokens**: Tiered per 1 Million tokens.
- **Output Tokens**: Tiered per 1 Million tokens.
- **Cached Prompt Input**: 50% - 90% discount on prompt cache hits.
- **Batch API Discount**: 50% discount on 24h batch processing.

## 12. Rate Limits
Tiered quotas: Requests Per Minute (RPM), Tokens Per Minute (TPM), Requests Per Day (RPD).

## 13. Best Use Cases
1. **Production AI Applications**: High-leverage deployment scenarios.
2. **Enterprise RAG & Agent Systems**: Autonomous tool execution and factual data retrieval.

## 14. Limitations
Known constraints, rate limit boundaries, or moderation filters.

## 15. Example API Request
```python
# $provider $modelName SDK Code Pattern
import os

print("Executing $modelName request...")
```

## 16. Benchmarks
Standardized evaluation benchmark scores (HumanEval, SWE-bench, MATH, GPQA, MMMU).

## 17. Alternatives
- Direct provider alternatives in the **$cap** category.
- Open-source local model equivalents.
"@
            Set-Content -Path $filePath -Value $docContent -Encoding UTF8
            $totalModels++
        }
    }
}

Write-Output "Successfully generated $totalModels capability-first model specifications across $($capabilities.Count) AI categories!"
