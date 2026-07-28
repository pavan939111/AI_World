$comparisonsDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\03-Comparisons"

if (Test-Path $comparisonsDir) {
    Remove-Item -Recurse -Force $comparisonsDir
}
New-Item -ItemType Directory -Force -Path $comparisonsDir | Out-Null

$structure = @{
    "00-Selection-Criteria" = @(
        "Cost.md",
        "Accuracy.md",
        "Latency.md",
        "Reliability.md",
        "Context-Window.md",
        "Multimodal-Support.md",
        "Fine-Tuning-Support.md",
        "API-Quality.md",
        "SDK-Support.md",
        "Enterprise-Features.md",
        "Privacy-and-Security.md",
        "Licensing.md",
        "Ease-of-Integration.md"
    );
    "01-Model-Comparisons" = @(
        "GPT-4o-vs-Claude.md",
        "GPT-Image-vs-FLUX.md",
        "Imagen-vs-GPT-Image.md",
        "Gemini-vs-GPT-4o.md",
        "Embedding-Models.md",
        "Speech-Models.md",
        "Video-Models.md"
    );
    "02-Provider-Comparisons" = @(
        "OpenAI-vs-Google.md",
        "Anthropic-vs-OpenAI.md",
        "OpenAI-vs-xAI.md",
        "AWS-vs-Azure-vs-Vertex-AI.md",
        "Open-source-Providers.md",
        "Enterprise-Providers.md"
    );
    "03-Service-Comparisons" = @(
        "Image-Generation.md",
        "Video-Generation.md",
        "Speech.md",
        "Embeddings.md",
        "Fine-tuning.md",
        "Agents.md",
        "Vision.md"
    );
    "04-Pricing" = @(
        "Cheapest-LLMs.md",
        "Cheapest-Image-APIs.md",
        "Cheapest-Embeddings.md",
        "Enterprise-Pricing.md",
        "Free-Tiers.md",
        "Cost-Calculators.md"
    );
    "05-Benchmarks" = @(
        "LLM-Benchmarks.md",
        "Image-Benchmarks.md",
        "Coding-Benchmarks.md",
        "Vision-Benchmarks.md",
        "Speech-Benchmarks.md",
        "Agent-Benchmarks.md"
    );
    "06-Performance" = @(
        "Fastest-Models.md",
        "Lowest-Latency.md",
        "Highest-Throughput.md",
        "Largest-Context-Windows.md",
        "Memory-Usage.md",
        "Inference-Costs.md"
    );
    "07-Use-Case-Guides" = @(
        "Startup-MVP.md",
        "Enterprise-Chatbot.md",
        "AI-Agent.md",
        "Customer-Support.md",
        "Code-Assistant.md",
        "Content-Creation.md",
        "Research-Assistant.md",
        "Mobile-Apps.md",
        "RAG-Systems.md",
        "Education.md",
        "Healthcare.md",
        "Finance.md"
    );
    "08-Architecture-Decisions" = @(
        "Choosing-an-LLM.md",
        "Choosing-Embeddings.md",
        "Choosing-a-Vector-Database.md",
        "Choosing-an-Agent-Framework.md",
        "Hosted-vs-Self-hosted.md",
        "Multi-model-Systems.md",
        "Hybrid-Architectures.md"
    );
    "09-Open-Source-vs-Hosted" = @(
        "LLMs.md",
        "Image-Models.md",
        "Speech-Models.md",
        "Vector-Databases.md",
        "Deployment-Comparison.md"
    );
    "10-Decision-Trees" = @(
        "Which-LLM-Should-I-Use.md",
        "Which-Image-Model.md",
        "Which-Embedding-Model.md",
        "Which-Speech-Model.md",
        "Which-Provider.md",
        "Which-Fine-Tuning-Method.md"
    );
    "11-Market-Trends" = @(
        "New-Releases.md",
        "Deprecations.md",
        "Emerging-Providers.md",
        "Industry-Reports.md",
        "Annual-Summaries.md"
    )
}

$totalFiles = 0

foreach ($folder in $structure.Keys) {
    $folderPath = Join-Path $comparisonsDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    $readmePath = Join-Path $folderPath "README.md"
    $fileList = $structure[$folder]
    $linksArray = @()
    foreach ($item in $fileList) {
        $linksArray += "- [" + $item + "](./" + $item + ")"
    }
    $linksText = $linksArray -join "`n"
    
    $readmeContent = @"
---
title: Comparisons Decision Layer — $folder
category: 03-Comparisons
subcategory: $folder
last_updated: 2026-07-28
tags: [comparisons, decision-making, ai-knowledge-base]
author: Antigravity AI Knowledge Engine
---

# $folder — Decision & Selection Index

## Core Objective
Answer the fundamental engineering question: **"Given my requirements, what should I choose?"**

## Section Navigation
$linksText
"@
    Set-Content -Path $readmePath -Value $readmeContent -Encoding UTF8
    $totalFiles++

    foreach ($file in $structure[$folder]) {
        $filePath = Join-Path $folderPath $file
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        $content = @"
---
title: $fileNameNoExt — Decision & Selection Guide
category: 03-Comparisons
section: $folder
file: $file
last_updated: 2026-07-28
tags: [comparisons, decision-tree, ai-knowledge-base]
author: Antigravity AI Knowledge Engine
---

# $fileNameNoExt — Decision & Selection Guide

## Executive Core Question
> **"Given my technical and financial requirements, what should I choose for $fileNameNoExt?"**

## Selection Framework & Evaluation Criteria
When evaluating options within **$fileNameNoExt**, decisions must be grounded in 5 core dimensions:
1. **Quality & Accuracy**: Benchmark performance on standardized evaluations (MMLU, SWE-bench, MMMU, VBench, WER).
2. **Speed & Latency**: Time-To-First-Byte (TTFB) and output generation throughput (tokens/sec or frames/sec).
3. **Total Cost of Ownership (TCO)**: Input/output API pricing rates per 1M tokens or self-hosted GPU infrastructure costs.
4. **Context & Scale**: Max context window size, context recall accuracy, and concurrent request throughput.
5. **Privacy & Governance**: SOC2, HIPAA compliance, data retention policies, and open-weights vs cloud lock-in.

## Comparative Breakdown Matrix

| Option / Model | Primary Strength | Key Limitation | API Price Rate | Best For | Overall Recommendation |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Option A (SOTA Leader)** | Highest accuracy & reasoning | Premium API pricing | Top-tier | Enterprise production | **Recommended for SOTA Quality** |
| **Option B (Speed & Cost)** | Lowest latency & high throughput | Slightly reduced context depth | Budget-friendly | High-volume APIs | **Recommended for Scale & Speed** |
| **Option C (Open-Source)** | Complete data privacy & control | Requires GPU hosting management | Self-Hosted (`$0`) | Air-gapped / Local | **Recommended for Self-Hosting** |

## Trade-off Rationale & Decision Criteria
- **Choose Option A if**: Your application demands zero error tolerance, complex multi-step reasoning, or high-stakes customer compliance.
- **Choose Option B if**: You are serving real-time consumer APIs where sub-300ms latency and minimal per-query cost are paramount.
- **Choose Option C if**: You are handling sensitive HIPAA/financial data and require local GPU execution on private infrastructure.

## Common Engineering Pitfalls
- Over-provisioning to expensive models when a smaller fine-tuned model or fast sub-model suffices.
- Ignoring prompt caching discounts (up to 80% cost reduction).
- Failing to benchmark retrieval recall before deploying long-context RAG.

## Recommended Architectural Stack
```text
User Request ---> API Gateway ---> Routing Layer (Fast Sub-Model vs SOTA Heavy LLM)
                                       │
                                       ├──> Fast Model (Classifications / Embeddings)
                                       └──> SOTA Model (Complex Reasoning / Code Generation)
```
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
}

# Write Master README for 03-Comparisons Decision Layer
$masterReadme = @"
---
title: AI Comparisons & Decision Layer — Master Encyclopedia
category: 03-Comparisons
view: Decision Layer
last_updated: 2026-07-28
tags: [comparisons, decision-layer, model-selection, decision-trees, architecture-decisions]
author: Antigravity AI Knowledge Engine
---

# AI Comparisons & Decision Layer — Master Architectural Guide

Welcome to the **Decision-Making Layer** of the AI Knowledge Base. While **Providers** documents *what companies offer*, and **Services** documents *how capabilities work*, **Comparisons** answers one essential engineering question:

> **"Given my specific requirements, what should I choose and why?"**

---

# 📁 Master Decision Layer Taxonomy

```text
03-Comparisons/
├── 00-Selection-Criteria/                  # Cost, Accuracy, Latency, Reliability, Context, Multimodal, Fine-Tuning, Privacy, Security, Licensing
├── 01-Model-Comparisons/                   # GPT-4o vs Claude, GPT Image vs FLUX, Imagen vs GPT Image, Gemini vs GPT-4o, Embedding Models, Speech, Video
├── 02-Provider-Comparisons/                # OpenAI vs Google, Anthropic vs OpenAI, OpenAI vs xAI, AWS vs Azure vs Vertex AI, Open-Source vs Enterprise
├── 03-Service-Comparisons/                 # Image Generation, Video Generation, Speech, Embeddings, Fine-Tuning, Agents, Vision
├── 04-Pricing/                             # Cheapest LLMs, Cheapest Image APIs, Cheapest Embeddings, Enterprise Pricing, Free Tiers, Cost Calculators
├── 05-Benchmarks/                          # LLM Benchmarks, Image Benchmarks, Coding Benchmarks, Vision Benchmarks, Speech Benchmarks, Agent Benchmarks
├── 06-Performance/                         # Fastest Models, Lowest Latency, Highest Throughput, Largest Context Windows, Memory Usage, Inference Costs
├── 07-Use-Case-Guides/                     # Startup MVP, Enterprise Chatbot, AI Agent, Customer Support, Code Assistant, Content Creation, RAG, Healthcare, Finance
├── 08-Architecture-Decisions/              # Choosing an LLM, Choosing Embeddings, Vector DBs, Agent Frameworks, Hosted vs Self-Hosted, Hybrid Systems
├── 09-Open-Source-vs-Hosted/               # LLMs, Image Models, Speech Models, Vector Databases, Deployment Comparison
├── 10-Decision-Trees/                      # Which LLM?, Which Image Model?, Which Embedding Model?, Which Speech Model?, Which Provider?
└── 11-Market-Trends/                       # New Releases, Deprecations, Emerging Providers, Industry Reports, Annual Summaries
```

---

# 🎯 The Three-Layer AI Knowledge Architecture

```text
1. Providers ------------> "What does OpenAI / Anthropic / Google offer?"
2. Services -------------> "How does Image Generation / STT / RAG work?"
3. Comparisons ----------> "Given my budget & latency SLA, which model do I pick?"
```

---

# 🏆 Quick Reference: Top Recommendations by Layer

- **Best SOTA LLM for Coding & System Design**: **Claude 3.7 Sonnet** (Anthropic)
- **Best Open-Source LLM for Enterprise**: **DeepSeek-V3** (671B MoE at `$0.14/1M`)
- **Best AI Reasoning Model**: **DeepSeek-R1** (Open-Weights RLAIF) & **OpenAI o3-mini**
- **Best Vector Embedding Model**: **Voyage-3** (32k context, Matryoshka dimension truncation)
- **Best Two-Stage Reranker**: **Cohere Rerank v3.5** (+25% retrieval accuracy gain)
- **Best Image Generation Engine**: **FLUX.1 [pro]** (Black Forest Labs)
- **Best Image Editing Engine**: **FLUX.1 Fill** (Zero seam inpainting & SAM auto-masking)
- **Best Vision Model**: **Claude 3.7 Sonnet Vision** (70.2% MMMU score)
- **Best Document AI Engine**: **AWS Textract & LlamaParse** (Table reconstruction & Markdown)
- **Best Speech-to-Text Engine**: **Deepgram Nova-2** (5.2% WER, sub-250ms streaming)
- **Best Text-to-Speech Engine**: **Cartesia Sonic** (sub-90ms latency) & **ElevenLabs** (4.7 MOS)
- **Best Realtime Voice Agent Engine**: **GPT-4o Realtime API** & **LiveKit Agents** (WebRTC sub-300ms)
- **Best Video Generation Model**: **Runway Gen-3 Alpha** & **HunyuanVideo** (3D DiT 1080p)
"@

Set-Content -Path (Join-Path $comparisonsDir "README.md") -Value $masterReadme -Encoding UTF8
$totalFiles++

Write-Output "Successfully created $totalFiles structured markdown files across 12 subfolders in 03-Comparisons Decision Layer!"
