$openaiDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI"

# 1. 02-Reasoning-Models/o1-and-o3-mini.md
$o1Content = @'
---
title: OpenAI o1 & o3-mini — Technical Specification & AI Reasoning Guide
provider: OpenAI
capability: 02-Reasoning-Models
model: o1-and-o3-mini
file: o1-and-o3-mini.md
last_updated: 2026-07-28
tags: [openai, o1, o3-mini, reasoning-models, test-time-compute, cot, math, codeforces]
author: Antigravity AI Knowledge Engine
---

# OpenAI o1 & o3-mini — Technical Specification & AI Reasoning Guide

## 1. Model Summary & Reinforcement Learning Architecture
**OpenAI o1** and **o3-mini** are specialized AI reasoning models trained using Large-Scale Reinforcement Learning (RL) to execute **Test-Time Compute Scaling**.

Unlike standard autoregressive LLMs (like GPT-4o) that attempt to predict the next token immediately, o1 and o3-mini generate a hidden **Chain-of-Thought (CoT)** reasoning trace before producing their final response. During this thinking phase, the model self-corrects, backtracks, breaks complex problems down into sub-steps, and evaluates alternative solution branches.

---

## 2. Technical Specifications & Limits

| Parameter | OpenAI o1 | OpenAI o3-mini |
| :--- | :--- | :--- |
| **Model ID** | `o1`, `o1-2024-12-17` | `o3-mini`, `o3-mini-2025-01-31` |
| **Primary Focus** | Complex reasoning, scientific proofs, legal analysis | Fast competitive coding, math, low-latency reasoning |
| **Context Window** | **200,000 tokens** | **200,000 tokens** |
| **Max Output Tokens** | **100,000 tokens** (includes thinking trace) | **65,536 tokens** (includes thinking trace) |
| **Reasoning Control** | `reasoning_effort`: `low`, `medium`, `high` | `reasoning_effort`: `low`, `medium`, `high` |
| **API Pricing (1M)** | **$15.00 Input / $60.00 Output** | **$1.10 Input / $4.40 Output** (93% cheaper) |
| **Vision Support** | Yes (`o1` supports text & vision) | Text & Code focused |
| **Function Calling** | Supported | Supported |
| **Structured Outputs**| Supported | Supported |

---

## 3. Benchmark Performance Scores

| Benchmark | Task Domain | OpenAI o1 | OpenAI o3-mini (High Effort) | GPT-4o (Standard) |
| :--- | :--- | :--- | :--- | :--- |
| **AIME 2024 Math** | USA High School Math Olympiad | **83.3%** | **87.3%** (#1 Math) | 13.4% |
| **Codeforces ELO** | Competitive Programming Rating | **1891 ELO** | **2073 ELO** (Human Expert Level) | 808 ELO |
| **GPQA Diamond** | Doctoral-level Chemistry/Physics/Bio | **78.0%** | **77.0%** | 53.6% |
| **MATH-500** | Advanced High School Competition Math | **94.8%** | **97.3%** | 76.6% |
| **SWE-bench Verified** | Real-World GitHub Software Bugs | **48.9%** | **49.2%** | 38.8% |

---

## 4. Production Integration Example (Python SDK with Reasoning Effort Control)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Execute complex math proof using o3-mini with high reasoning effort
response = client.chat.completions.create(
    model="o3-mini",
    messages=[
        {"role": "user", "content": "Prove that the square root of 2 is irrational using proof by contradiction. Detail every logical step."}
    ],
    reasoning_effort="high"
)

# Extract final answer
final_answer = response.choices[0].message.content
print("Final Proof Output:")
print(final_answer)

# Check token usage metrics (showing hidden reasoning tokens consumed)
usage = response.usage
print(f"\nPrompt Tokens: {usage.prompt_tokens}")
print(f"Completion Tokens: {usage.completion_tokens}")
print(f"Hidden Reasoning Tokens: {usage.completion_tokens_details.reasoning_tokens}")
```

---

## 5. Critical Prompt Engineering Rules for Reasoning Models
1. **Minimalist Prompting**: Do **NOT** include system prompt instructions like "Think step by step" or "Show your work". The model automatically performs CoT reasoning internally; adding CoT steers can degrade performance.
2. **Use Clear Delimiters**: Structure complex inputs using XML tags (`<context>`, `<code_snippet>`, `<constraints>`) to help the reasoning engine isolate variables.
3. **Control `reasoning_effort`**: Use `reasoning_effort="low"` for rapid coding queries to minimize cost and latency; use `reasoning_effort="high"` for complex math proofs or deep security audits.
'@

$dir02 = Join-Path $openaiDir "02-Reasoning-Models"
New-Item -ItemType Directory -Force -Path $dir02 | Out-Null
Set-Content -Path (Join-Path $dir02 "o1-and-o3-mini.md") -Value $o1Content -Encoding UTF8

# 2. 03-Embedding-Models/text-embedding-3.md
$embedContent = @'
---
title: OpenAI Text Embeddings — Technical Specification & Vector Search Guide
provider: OpenAI
capability: 03-Embedding-Models
model: text-embedding-3-large
file: text-embedding-3.md
last_updated: 2026-07-28
tags: [openai, embeddings, vector-search, text-embedding-3-large, text-embedding-3-small, matryoshka]
author: Antigravity AI Knowledge Engine
---

# OpenAI Text Embeddings — Technical Specification & Vector Search Guide

## 1. Summary & Matryoshka Dimension Truncation
OpenAI offers two primary vector embedding models: **`text-embedding-3-small`** and **`text-embedding-3-large`**.

These models utilize **Matryoshka Representation Learning (MRL)**, which allows developers to truncate vector dimensions (e.g. reducing 3072-dimensional vectors to 1536 or 256 dimensions) via the `dimensions` parameter without sacrificing significant semantic search accuracy.

---

## 2. Technical Specifications & Pricing

| Model ID | Native Dimensions | Max Context | MTEB Retrieval Score | API Pricing (per 1M Tokens) | Truncation Support |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **`text-embedding-3-large`**| **3,072 dimensions** | **8,191 tokens** | **64.6** | **$0.130 / 1M** | Yes (1536, 1024, 512, 256) |
| **`text-embedding-3-small`**| **1,536 dimensions** | **8,191 tokens** | **62.3** | **$0.020 / 1M** | Yes (512, 256) |
| `text-embedding-ada-002` (Legacy)| 1,536 dimensions | 8,191 tokens | 61.0 | $0.100 / 1M | No |

---

## 3. Python Integration Example (Dimension Truncation)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

text_to_embed = "Vector embeddings project semantic meaning into high-dimensional geometric space."

# Generate truncated 256-dimensional vector embedding
response = client.embeddings.create(
    model="text-embedding-3-large",
    input=text_to_embed,
    dimensions=256
)

embedding_vector = response.data[0].embedding
print(f"Generated Vector Dimension: {len(embedding_vector)}") # 256
print(f"Sample Vector Values: {embedding_vector[:5]}")
```
'@

$dir03 = Join-Path $openaiDir "03-Embedding-Models"
New-Item -ItemType Directory -Force -Path $dir03 | Out-Null
Set-Content -Path (Join-Path $dir03 "text-embedding-3.md") -Value $embedContent -Encoding UTF8

Write-Output "Successfully updated OpenAI o1/o3-mini and Text Embeddings documentation with real technical research!"
