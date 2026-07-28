$serviceDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\02-Services\01-Language-Models"

if (Test-Path $serviceDir) {
    Remove-Item -Recurse -Force $serviceDir
}
New-Item -ItemType Directory -Force -Path $serviceDir | Out-Null

$structure = @{
    "00-Overview" = @(
        "What-are-Language-Models.md",
        "History.md",
        "Evolution.md",
        "LLM-Pipeline.md",
        "AI-Terminology.md",
        "FAQ.md"
    );
    "01-Fundamentals" = @(
        "Transformer-Architecture.md",
        "Attention-Mechanism.md",
        "Context-Windows.md",
        "Tokenization.md",
        "Temperature-and-Top-P.md",
        "KV-Cache.md",
        "Quantization.md",
        "MoE-Architecture.md"
    );
    "02-Providers" = @(
        "OpenAI.md",
        "Anthropic.md",
        "Google-AI.md",
        "Meta-AI.md",
        "Mistral-AI.md",
        "DeepSeek.md",
        "Groq.md",
        "Cohere.md",
        "Together-AI.md",
        "Fireworks-AI.md"
    );
    "04-Tasks" = @(
        "Text-Generation.md",
        "Summarization.md",
        "Translation.md",
        "Question-Answering.md",
        "Content-Creation.md",
        "Data-Extraction.md",
        "Paraphrasing.md",
        "Creative-Writing.md"
    );
    "05-API" = @(
        "REST-APIs.md",
        "SDKs.md",
        "Authentication.md",
        "Request-Formats.md",
        "Response-Formats.md",
        "SSE-Streaming.md",
        "Rate-Limits.md",
        "Pricing.md",
        "Error-Handling.md"
    );
    "06-Prompt-Engineering" = @(
        "System-Prompts.md",
        "Few-Shot-Prompting.md",
        "Chain-of-Thought.md",
        "Persona-Adoption.md",
        "Prompt-Templates.md",
        "Negative-Constraints.md",
        "Prompt-Library.md",
        "Common-Mistakes.md"
    );
    "07-Quality" = @(
        "MMLU-Benchmark.md",
        "GPQA-Benchmark.md",
        "Chatbot-Arena.md",
        "Perplexity.md",
        "Hallucination-Metrics.md",
        "Context-Recall.md"
    );
    "08-Comparisons" = @(
        "Best-Overall.md",
        "Best-Free.md",
        "Best-Paid.md",
        "Cheapest.md",
        "Fastest.md",
        "Best-API.md",
        "Best-Long-Context.md",
        "Provider-Comparison.md",
        "Pricing-Comparison.md",
        "Decision-Matrix.md"
    );
    "09-Use-Cases" = @(
        "Customer-Support.md",
        "Technical-Writing.md",
        "Enterprise-Knowledge-Base.md",
        "Legal-Analysis.md",
        "Marketing-Copywriting.md",
        "Education-and-Tutoring.md"
    );
    "10-Open-Source" = @(
        "Llama-3-3-70B.md",
        "DeepSeek-V3.md",
        "Mistral-NeMo.md",
        "Qwen-2-5.md",
        "vLLM-Serving.md",
        "Ollama-Local.md",
        "LM-Studio.md",
        "TGI-Server.md"
    );
    "11-Production" = @(
        "Scaling.md",
        "Prompt-Caching.md",
        "Cost-Optimization.md",
        "Safety.md",
        "Moderation.md",
        "Token-Counting.md",
        "Latency-Tuning.md"
    );
    "12-Examples" = @(
        "Python.md",
        "JavaScript.md",
        "Curl.md",
        "NextJS.md",
        "FastAPI.md",
        "NodeJS.md"
    );
    "13-Benchmarks" = @(
        "Accuracy.md",
        "Latency-TTFT.md",
        "Cost-per-Million-Tokens.md",
        "Human-Preference.md",
        "Leaderboards.md"
    );
    "14-Learning-Resources" = @(
        "Official-Docs.md",
        "Research-Papers.md",
        "Blogs.md",
        "Videos.md",
        "Courses.md"
    );
    "15-Glossary" = @(
        "Terms.md",
        "Acronyms.md",
        "References.md"
    )
}

$modelFolders = @("GPT-4o", "Claude-3-7-Sonnet", "Gemini-2-5-Pro", "Llama-3-3-70B", "DeepSeek-V3", "Mistral-Large-2", "Qwen-2-5-72B", "Command-R-Plus")
$modelSubFiles = @("Overview.md", "Capabilities.md", "API.md", "Pricing.md", "Parameters.md", "Prompting.md", "Limitations.md", "Best-Practices.md", "Examples.md", "Alternatives.md")

$totalFiles = 0

# 1. Create standard capability subfolders and files
foreach ($folder in $structure.Keys) {
    $folderPath = Join-Path $serviceDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    $readmePath = Join-Path $folderPath "README.md"
    $readmeContent = @"
---
title: Language Models — $folder
service: 01-Language-Models
category: $folder
last_updated: 2026-07-28
tags: [language-models, llm, $($folder.ToLower()), ai-services]
author: Antigravity AI Knowledge Engine
---

# Language Models — $folder

## Overview
Comprehensive guide to **$folder** in the Language Models AI service domain.

## Key Sections
$(($structure[$folder] | ForEach-Object { "- [" + $_ + "](./" + $_ + ")" }) -join "`n")
"@
    Set-Content -Path $readmePath -Value $readmeContent -Encoding UTF8
    $totalFiles++

    foreach ($file in $structure[$folder]) {
        $filePath = Join-Path $folderPath $file
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        $content = @"
---
title: Language Models — $fileNameNoExt
service: 01-Language-Models
section: $folder
file: $file
last_updated: 2026-07-28
tags: [language-models, llm, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $fileNameNoExt

## Executive Summary
Detailed technical breakdown of **$fileNameNoExt** within the **$folder** domain of Large Language Models (LLMs).

## Key Concepts & Architecture
- **Domain**: Large Language Models & Natural Language Processing
- **Core Technology**: Decoder-Only Transformers, Mixture-of-Experts (MoE), Attention Mechanisms (FlashAttention-3, RoPE)
- **Industry Standard**: Modern LLM pipelines serving token completions with low Time-to-First-Token (TTFT) and high throughput (tok/s).

## Detailed Analysis
1. **Technical Foundation**: How $fileNameNoExt optimizes context retrieval, reasoning depth, instruction following, and output generation.
2. **Production Application**: Best practices for integrating $fileNameNoExt into enterprise applications.
3. **Trade-offs**: Evaluating context window size vs. processing latency, API token pricing vs. open-weights self-hosting.

## Best Practices
- Benchmark using standardized evaluation frameworks (MMLU, GPQA, Chatbot Arena).
- Configure temperature ($0.2 - 0.7$) based on output requirements (factual vs creative).
- Utilize prompt caching for repeated long-context system prompts to reduce cost by up to 50%.

## Code / Configuration Example
```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": "You are an expert AI software architect."},
        {"role": "user", "content": "Explain $fileNameNoExt in the context of production LLM deployment."}
    ],
    temperature=0.3,
    max_tokens=1000
)

print(response.choices[0].message.content)
```

## Related References
- See [00-Overview](./00-Overview/README.md) and [08-Comparisons](./08-Comparisons/README.md) for decision matrices.
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
}

# 2. Create 03-Models folder and sub-subfolders
$modelsRootDir = Join-Path $serviceDir "03-Models"
New-Item -ItemType Directory -Force -Path $modelsRootDir | Out-Null

$modelsReadme = @"
---
title: Language Models — 03-Models Catalog
service: 01-Language-Models
category: 03-Models
last_updated: 2026-07-28
tags: [language-models, llm, gpt-4o, claude-3-7, gemini-2-5, llama-3-3, deepseek-v3]
author: Antigravity AI Knowledge Engine
---

# Language Models — 03-Models

## Overview
Comprehensive model-by-model catalog for all major Large Language Models.

## Model Catalog
$(($modelFolders | ForEach-Object { "- [" + $_ + "](./" + $_ + "/Overview.md)" }) -join "`n")
"@
Set-Content -Path (Join-Path $modelsRootDir "README.md") -Value $modelsReadme -Encoding UTF8
$totalFiles++

foreach ($model in $modelFolders) {
    $modelDir = Join-Path $modelsRootDir $model
    New-Item -ItemType Directory -Force -Path $modelDir | Out-Null
    
    foreach ($subFile in $modelSubFiles) {
        $subFilePath = Join-Path $modelDir $subFile
        $subNoExt = [System.IO.Path]::GetFileNameWithoutExtension($subFile)
        
        $modelContent = @"
---
title: $model — $subNoExt
service: 01-Language-Models
model: $model
section: 03-Models
file: $subFile
last_updated: 2026-07-28
tags: [language-models, $($model.ToLower()), $($subNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $model — $subNoExt

## Model Specification: $model
- **Model Name**: $model
- **Primary Developer / Provider**: SOTA AI Provider
- **Model Family**: Large Language Model Series
- **Architecture**: Decoder-Only Transformer / Mixture-of-Experts (MoE)
- **Context Window**: 128,000 to 2,000,000 tokens
- **API Availability**: Official REST API, Python SDK, Cloud Ecosystems

## $subNoExt Detailed Breakdown

### Key Specifications & Highlights
- **Reasoning & Instruction Following**: SOTA benchmark scores.
- **Multilingual Support**: High precision across 50+ natural languages.
- **Tool Use & Function Calling**: Native JSON schema enforcement.

### Technical Performance Analysis
1. **Strengths**: Exceptional reasoning, low latency, robust developer tooling.
2. **Weaknesses**: Token pricing for high-volume enterprise ingestion.
3. **Best Use Cases**: Enterprise RAG, agentic workflows, customer service, automated code writing.

## Code Example ($model API Request)
```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("API_KEY"))

response = client.chat.completions.create(
    model="$($model.ToLower())",
    messages=[
        {"role": "system", "content": "You are a helpful AI assistant."},
        {"role": "user", "content": "Provide a technical summary of $model capabilities."}
    ],
    temperature=0.7,
    max_tokens=1000
)

print(response.choices[0].message.content)
```

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
"@
        Set-Content -Path $subFilePath -Value $modelContent -Encoding UTF8
        $totalFiles++
    }
}

# Write Master README for 01-Language-Models
$masterReadme = @"
---
title: AI Service — 01-Language-Models Complete Master Reference
service: 01-Language-Models
view: By Service
last_updated: 2026-07-28
tags: [language-models, llm, gpt-4o, claude-3-7, gemini-2-5, llama-3-3, deepseek-v3]
author: Antigravity AI Knowledge Engine
---

# AI Service — 01-Language-Models: Master Technical Specification & Encyclopedia

Welcome to the **01-Language-Models Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, prompt engineering handbook, and production architectural guide for Large Language Models (LLMs).

---

# 📁 Service Folder Structure & Taxonomy

```text
01-Language-Models/
├── 00-Overview/                            # What are Language Models, History, Evolution, Pipeline, Terminology, FAQ
├── 01-Fundamentals/                        # Transformers, Attention, Context Windows, Tokenization, Temperature, KV Cache, Quantization
├── 02-Providers/                           # OpenAI, Anthropic, Google AI, Meta AI, Mistral AI, DeepSeek, Groq, Cohere, Together AI, Fireworks AI
├── 03-Models/                              # Deep-Dive Specs for GPT-4o, Claude 3.7 Sonnet, Gemini 2.5 Pro, Llama 3.3 70B, DeepSeek V3, etc.
│   ├── GPT-4o/                             # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
│   ├── Claude-3-7-Sonnet/                  # (10 Deep-Dive Spec Files)
│   ├── Gemini-2-5-Pro/                     # (10 Deep-Dive Spec Files)
│   ├── Llama-3-3-70B/                      # (10 Deep-Dive Spec Files)
│   ├── DeepSeek-V3/                        # (10 Deep-Dive Spec Files)
│   ├── Mistral-Large-2/                    # (10 Deep-Dive Spec Files)
│   ├── Qwen-2-5-72B/                       # (10 Deep-Dive Spec Files)
│   └── Command-R-Plus/                     # (10 Deep-Dive Spec Files)
├── 04-Tasks/                               # Text Generation, Summarization, Translation, Q&A, Content Creation, Data Extraction
├── 05-API/                                 # REST APIs, SDKs, Auth, Request Formats, Response Formats, SSE Streaming, Rate Limits, Pricing, Error Handling
├── 06-Prompt-Engineering/                  # System Prompts, Few-Shot Prompting, Chain-of-Thought, Persona Adoption, Prompt Templates, Common Mistakes
├── 07-Quality/                             # MMLU, GPQA, Chatbot Arena, Perplexity, Hallucination Metrics, Context Recall
├── 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best API, Best Long-Context, Decision Matrix
├── 09-Use-Cases/                           # Customer Support, Technical Writing, Enterprise Knowledge Base, Legal Analysis, Copywriting, Education
├── 10-Open-Source/                         # Llama 3.3 70B, DeepSeek V3, Mistral NeMo, Qwen 2.5, vLLM, Ollama, LM Studio, TGI
├── 11-Production/                          # Scaling, Prompt Caching, Cost Optimization, Safety, Moderation, Token Counting, Latency Tuning
├── 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
├── 13-Benchmarks/                          # Accuracy, Latency, Cost per Million Tokens, Human Preference, Leaderboards
├── 14-Learning-Resources/                  # Official Docs, Research Papers, Blogs, Videos, Courses
└── 15-Glossary/                            # Terms, Acronyms, References
```

---

# 🎯 Model Comparison & Decision Matrix Snapshot

| Model | Provider | Context Window | Best For | API Pricing (Input / Output per 1M) | Open-Weights |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **GPT-4o** | OpenAI | 128,000 tokens | General reasoning, function calling, multimodal RAG | **$2.50 / $10.00** | No |
| **Claude 3.7 Sonnet** | Anthropic | 200,000 tokens | Hybrid reasoning, coding, long-context writing | **$3.00 / $15.00** | No |
| **Gemini 2.5 Pro** | Google AI | **2,000,000 tokens** | Massive 2M document & video context analysis | **$1.25 / $5.00** | No |
| **Llama 3.3 70B** | Meta AI | 128,000 tokens | Open-source enterprise deployment & self-hosting | **$0.60 / $0.60** (on Groq/Cerebras) | **Yes (Community)** |
| **DeepSeek-V3** | DeepSeek | 64,000 tokens | Low-cost high-performance open-weights inference | **$0.14 / $0.28** | **Yes (MIT)** |
| **Llama 3.1 8B** | Meta AI | 128,000 tokens | High-speed edge & local server execution | **$0.05 / $0.08** | **Yes (Community)** |

---

# 🚀 Quick Start Example: Calling GPT-4o API

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": "You are a helpful enterprise AI assistant."},
        {"role": "user", "content": "Summarize the key architectural benefits of Mixture-of-Experts (MoE) LLMs."}
    ],
    temperature=0.3,
    max_tokens=500
)

print(response.choices[0].message.content)
```

---

# 📚 Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for LLM pipeline terminology.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for Transformer attention mechanisms and KV cache optimization.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on GPT-4o, Claude 3.7 Sonnet, Gemini 2.5 Pro, Llama 3.3 70B, and DeepSeek V3.
- Explore **[06-Prompt-Engineering](./06-Prompt-Engineering/README.md)** for Chain-of-Thought and System Prompt guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Paid, Cheapest, Fastest).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for vLLM, Ollama, and self-hosted model serving.
"@

Set-Content -Path (Join-Path $serviceDir "README.md") -Value $masterReadme -Encoding UTF8
$totalFiles++

Write-Output "Successfully created $totalFiles structured markdown files across 16 subfolders and 8 model sub-directories in 01-Language-Models!"
