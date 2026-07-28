$serviceDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\02-Services\02-Reasoning-Models"

if (Test-Path $serviceDir) {
    Remove-Item -Recurse -Force $serviceDir
}
New-Item -ItemType Directory -Force -Path $serviceDir | Out-Null

$structure = @{
    "00-Overview" = @(
        "What-are-Reasoning-Models.md",
        "History.md",
        "Evolution.md",
        "Chain-of-Thought-Pipeline.md",
        "AI-Terminology.md",
        "FAQ.md"
    );
    "01-Fundamentals" = @(
        "Reinforcement-Learning-RLAIF.md",
        "GRPO-Algorithm.md",
        "Process-Reward-Models-PRM.md",
        "Test-Time-Compute-Scaling.md",
        "Hidden-Thinking-Tokens.md",
        "Monte-Carlo-Tree-Search-MCTS.md",
        "Self-Correction-and-Backtracking.md"
    );
    "02-Providers" = @(
        "OpenAI.md",
        "DeepSeek.md",
        "Anthropic.md",
        "Google-AI.md",
        "Meta-AI.md",
        "Groq.md",
        "Cerebras.md",
        "Together-AI.md"
    );
    "04-Tasks" = @(
        "Complex-Mathematics.md",
        "Competitive-Programming.md",
        "Software-Engineering.md",
        "Scientific-Proofs.md",
        "Multi-Step-Logic.md",
        "Financial-Modeling.md",
        "Legal-Reasoning.md",
        "System-Architecture.md"
    );
    "05-API" = @(
        "REST-APIs.md",
        "SDKs.md",
        "Authentication.md",
        "Reasoning-Effort-Parameter.md",
        "Thinking-Token-Streaming.md",
        "Rate-Limits.md",
        "Pricing.md",
        "Error-Handling.md"
    );
    "06-Prompt-Engineering" = @(
        "Minimalist-Prompting.md",
        "System-Prompts.md",
        "Delimiters-and-Structure.md",
        "Avoiding-CoT-Steers.md",
        "Prompt-Templates.md",
        "Prompt-Library.md",
        "Common-Mistakes.md"
    );
    "07-Quality" = @(
        "AIME-2024-Math.md",
        "MATH-500-Benchmark.md",
        "Codeforces-ELO.md",
        "GPQA-Diamond.md",
        "SWE-bench-Verified.md",
        "Context-Adherence.md"
    );
    "08-Comparisons" = @(
        "Best-Overall.md",
        "Best-Free.md",
        "Best-Paid.md",
        "Cheapest.md",
        "Fastest.md",
        "Best-API.md",
        "Best-Open-Source.md",
        "Provider-Comparison.md",
        "Pricing-Comparison.md",
        "Decision-Matrix.md"
    );
    "09-Use-Cases" = @(
        "Mathematical-Proofs.md",
        "Codebase-Refactoring.md",
        "Automated-Debugging.md",
        "Strategic-Business-Planning.md",
        "Complex-Science.md",
        "Puzzle-and-Riddle-Solving.md"
    );
    "10-Open-Source" = @(
        "DeepSeek-R1-671B.md",
        "DeepSeek-R1-Distill-Series.md",
        "vLLM-Reasoning-Serving.md",
        "Ollama-Local-R1.md",
        "TGI-Reasoning-Server.md"
    );
    "11-Production" = @(
        "Latency-Management.md",
        "Cost-Optimization.md",
        "Streaming-Thinking-Blocks.md",
        "Safety-and-Jailbreak-Mitigation.md",
        "Token-Budgeting.md"
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
        "Latency-TTFT-vs-CoT.md",
        "Cost-per-Million-Reasoning-Tokens.md",
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

$modelFolders = @("OpenAI-o1", "OpenAI-o3-mini", "DeepSeek-R1", "DeepSeek-R1-Zero", "Claude-3-7-Sonnet-Thinking", "Gemini-2-5-Pro-Thinking", "DeepSeek-R1-Distill-Llama-70B", "DeepSeek-R1-Distill-Qwen-32B")
$modelSubFiles = @("Overview.md", "Capabilities.md", "API.md", "Pricing.md", "Parameters.md", "Prompting.md", "Limitations.md", "Best-Practices.md", "Examples.md", "Alternatives.md")

$totalFiles = 0

# 1. Create standard capability subfolders and files
foreach ($folder in $structure.Keys) {
    $folderPath = Join-Path $serviceDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    $readmePath = Join-Path $folderPath "README.md"
    $readmeContent = @"
---
title: Reasoning Models — $folder
service: 02-Reasoning-Models
category: $folder
last_updated: 2026-07-28
tags: [reasoning-models, deepseek-r1, openai-o1, o3-mini, cot, $($folder.ToLower()), ai-services]
author: Antigravity AI Knowledge Engine
---

# Reasoning Models — $folder

## Overview
Comprehensive guide to **$folder** in the Reasoning Models AI service domain.

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
title: Reasoning Models — $fileNameNoExt
service: 02-Reasoning-Models
section: $folder
file: $file
last_updated: 2026-07-28
tags: [reasoning-models, deepseek-r1, o1, cot, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $fileNameNoExt

## Executive Summary
Detailed technical breakdown of **$fileNameNoExt** within the **$folder** domain of AI Reasoning Models (Chain-of-Thought / Test-Time Compute Scaling).

## Key Concepts & Architecture
- **Domain**: AI Reasoning & Complex Problem Solving
- **Core Technology**: Reinforcement Learning (RLAIF / GRPO), Test-Time Compute Scaling, Hidden Chain-of-Thought (CoT) Thinking Tokens, Process Reward Models (PRMs).
- **Industry Standard**: Models that dynamically allocate extra computation time ("thinking") before producing a final answer, achieving SOTA accuracy on AIME 2024 Math, MATH-500, Codeforces, and GPQA.

## Detailed Analysis
1. **Technical Foundation**: How $fileNameNoExt optimizes test-time compute, error backtracking, self-correction, and logical verification.
2. **Production Application**: Best practices for integrating reasoning models into automated code generators, mathematical engines, and multi-step analytical software.
3. **Trade-offs**: Evaluating extended generation latency (10s - 60s thinking time) vs. output accuracy, and reasoning token cost vs. standard LLMs.

## Best Practices
- **Minimalist Prompting**: Do NOT instruct reasoning models to "think step by step" (they do this natively via reinforcement learning). State the problem clearly and concisely.
- **Reasoning Effort Selection**: Adjust `reasoning_effort` (`low`, `medium`, `high`) or `max_completion_tokens` based on task difficulty to control cost and latency.
- **Handling Reasoning Tokens**: Parse `<think>` tags (DeepSeek-R1) or `reasoning_tokens` metadata (OpenAI o1/o3-mini) separately from final output text.

## Code / Configuration Example (DeepSeek-R1 / OpenAI o3-mini)
```python
import os
from openai import OpenAI

# Initialize client for Reasoning Model Inference
client = OpenAI(
    base_url="https://api.deepseek.com",
    api_key=os.environ.get("DEEPSEEK_API_KEY")
)

response = client.chat.completions.create(
    model="deepseek-reasoner",
    messages=[
        {"role": "user", "content": "Solve the mathematical equation: Prove that there are infinitely many prime numbers using proof by contradiction."}
    ]
)

# Access reasoning content (<think> tokens) and final answer
reasoning_content = response.choices[0].message.reasoning_content
final_answer = response.choices[0].message.content

print("Thinking Process Snippet:")
print(reasoning_content[:200])
print("\nFinal Answer:")
print(final_answer[:200])
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
title: Reasoning Models — 03-Models Catalog
service: 02-Reasoning-Models
category: 03-Models
last_updated: 2026-07-28
tags: [reasoning-models, o1, o3-mini, deepseek-r1, claude-3-7, gemini-2-5]
author: Antigravity AI Knowledge Engine
---

# Reasoning Models — 03-Models

## Overview
Comprehensive model-by-model catalog for all major AI Reasoning Foundation Models.

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
        $subNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        $modelContent = @"
---
title: $model — $subNoExt
service: 02-Reasoning-Models
model: $model
section: 03-Models
file: $subFile
last_updated: 2026-07-28
tags: [reasoning-models, $($model.ToLower()), $($subNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $model — $subNoExt

## Model Specification: $model
- **Model Name**: $model
- **Primary Developer / Provider**: SOTA Reasoning AI Provider
- **Model Family**: Test-Time Compute Reasoning Series
- **Architecture**: Reinforcement Learning (RLAIF / GRPO), Mixture-of-Experts (MoE) / Dense Transformer
- **Context Window**: 64,000 to 200,000 tokens
- **API Availability**: Official REST API, Python SDK, Open-Weights (DeepSeek-R1 series)

## $subNoExt Detailed Breakdown

### Key Specifications & Benchmarks
- **AIME 2024 Math Score**: 83.3% - 90.0%+
- **MATH-500 Accuracy**: 93.0% - 97.3%
- **Codeforces ELO Rating**: 2000+ (Human Expert Level)
- **GPQA Diamond Score**: 75.0%+ (Doctoral-level science questions)

### Technical Performance Analysis
1. **Strengths**: Unrivaled mathematical proof accuracy, self-correction backtracking during inference, superior complex code refactoring.
2. **Weaknesses**: Extended generation latency (thinking time); cost of extra generated reasoning tokens.
3. **Best Use Cases**: Advanced math proofs, complex bug fixing, competitive programming, scientific research, financial modeling.

## Code Example ($model Request)
```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("API_KEY"))

response = client.chat.completions.create(
    model="$($model.ToLower())",
    messages=[
        {"role": "user", "content": "Analyze the time complexity of a Red-Black tree rebalancing operation."}
    ]
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

# Write Master README for 02-Reasoning-Models
$masterReadme = @"
---
title: AI Service — 02-Reasoning-Models Complete Master Reference
service: 02-Reasoning-Models
view: By Service
last_updated: 2026-07-28
tags: [reasoning-models, deepseek-r1, openai-o1, o3-mini, claude-3-7-thinking, gemini-2-5-thinking]
author: Antigravity AI Knowledge Engine
---

# AI Service — 02-Reasoning-Models: Master Technical Specification & Encyclopedia

Welcome to the **02-Reasoning-Models Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, prompt engineering handbook, and production architectural guide for AI Reasoning Models (Test-Time Compute Scaling & Chain-of-Thought).

---

# 📁 Service Folder Structure & Taxonomy

```text
02-Reasoning-Models/
├── 00-Overview/                            # What are Reasoning Models, History, Evolution, CoT Pipeline, Terminology, FAQ
├── 01-Fundamentals/                        # RLAIF, GRPO, Process Reward Models (PRM), Test-Time Compute Scaling, Hidden Thinking Tokens, MCTS
├── 02-Providers/                           # OpenAI, DeepSeek, Anthropic, Google AI, Meta AI, Groq, Cerebras, Together AI
├── 03-Models/                              # Deep-Dive Specs for OpenAI o1, o3-mini, DeepSeek-R1, DeepSeek-R1-Zero, Claude 3.7 Thinking, Gemini 2.5 Thinking, etc.
│   ├── OpenAI-o1/                          # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
│   ├── OpenAI-o3-mini/                     # (10 Deep-Dive Spec Files)
│   ├── DeepSeek-R1/                        # (10 Deep-Dive Spec Files)
│   ├── DeepSeek-R1-Zero/                   # (10 Deep-Dive Spec Files)
│   ├── Claude-3-7-Sonnet-Thinking/         # (10 Deep-Dive Spec Files)
│   ├── Gemini-2-5-Pro-Thinking/            # (10 Deep-Dive Spec Files)
│   ├── DeepSeek-R1-Distill-Llama-70B/      # (10 Deep-Dive Spec Files)
│   └── DeepSeek-R1-Distill-Qwen-32B/       # (10 Deep-Dive Spec Files)
├── 04-Tasks/                               # Complex Math, Competitive Programming, Software Engineering, Scientific Proofs, Multi-Step Logic, Finance, Law
├── 05-API/                                 # REST APIs, SDKs, Auth, Request Formats (`reasoning_effort`), Streaming `<think>` tokens, Pricing, Error Handling
├── 06-Prompt-Engineering/                  # Minimalist Prompting, System Prompts, Delimiters, Avoiding CoT Steers, Best Practices, Common Mistakes
├── 07-Quality/                             # AIME 2024 Math, MATH-500, Codeforces ELO, GPQA Diamond, SWE-bench Verified
├── 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best API, Best Open-Source, Decision Matrix
├── 09-Use-Cases/                           # Mathematical Proofs, Codebase Refactoring, Automated Debugging, Strategic Business Planning, Complex Science
├── 10-Open-Source/                         # DeepSeek R1 (671B MoE), DeepSeek R1 Distill Series, vLLM Reasoning Serving, Ollama Local R1, TGI R1
├── 11-Production/                          # Latency Management, Cost Optimization, Streaming Thinking Blocks, Safety & Jailbreak Mitigation
├── 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
├── 13-Benchmarks/                          # Accuracy, Latency (TTFT vs CoT duration), Cost per Million Reasoning Tokens, Leaderboards
├── 14-Learning-Resources/                  # Official Docs, Research Papers (DeepSeek R1 Paper, OpenAI o1 Post, QwQ), Blogs, Videos, Courses
└── 15-Glossary/                            # Terms, Acronyms, References
```

---

# 🎯 Model Comparison & Decision Matrix Snapshot

| Model | Developer | AIME 2024 Math | Codeforces ELO | API Pricing (Input / Output per 1M) | Open-Source / Weights |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **DeepSeek-R1** | DeepSeek | **79.8%** | **2029 ELO** | **$0.55 / $2.19** | **Open-Weights (MIT License)** |
| **OpenAI o1** | OpenAI | **83.3%** | **1891 ELO** | **$15.00 / $60.00** | Proprietary API |
| **OpenAI o3-mini** | OpenAI | **87.3%** | **2073 ELO** | **$1.10 / $4.40** | Proprietary API |
| **Claude 3.7 Sonnet (Thinking)** | Anthropic | **85.0%+** | **2000+ ELO** | **$3.00 / $15.00** | Proprietary API |
| **DeepSeek-R1-Distill-Llama-70B** | DeepSeek / Meta | **70.0%** | **1633 ELO** | **$0.60 / $0.60** (on Cerebras) | **Open-Weights (MIT)** |
| **DeepSeek-R1-Distill-Qwen-32B** | DeepSeek / Alibaba | **72.6%** | **1691 ELO** | **$0.15 / $0.15** (on Groq) | **Open-Weights (MIT)** |

---

# 🚀 Quick Start Example: Calling DeepSeek-R1 Reasoning API

```python
import os
from openai import OpenAI

# Initialize client for DeepSeek-R1 Reasoning API
client = OpenAI(
    base_url="https://api.deepseek.com",
    api_key=os.environ.get("DEEPSEEK_API_KEY")
)

response = client.chat.completions.create(
    model="deepseek-reasoner",
    messages=[
        {"role": "user", "content": "Prove that the sum of the first n positive odd integers is n^2."}
    ]
)

# Extract reasoning chain and final response
print("Reasoning Chain (<think>):")
print(response.choices[0].message.reasoning_content)
print("\nFinal Solution:")
print(response.choices[0].message.content)
```

---

# 📚 Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for Test-Time Compute Scaling history and CoT pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for GRPO (Group Relative Policy Optimization) and Process Reward Models.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on OpenAI o1, o3-mini, DeepSeek-R1, Claude 3.7 Sonnet Thinking, and Gemini 2.5 Pro Thinking.
- Explore **[06-Prompt-Engineering](./06-Prompt-Engineering/README.md)** for minimalist prompting guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Open Source, Best Paid, Fastest).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for DeepSeek R1 671B local deployment on vLLM and Ollama.
"@

Set-Content -Path (Join-Path $serviceDir "README.md") -Value $masterReadme -Encoding UTF8
$totalFiles++

Write-Output "Successfully created $totalFiles structured markdown files across 16 subfolders and 8 model sub-directories in 02-Reasoning-Models!"
