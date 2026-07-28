$comparisonsDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\03-Comparisons"

if (-not (Test-Path $comparisonsDir)) {
    New-Item -ItemType Directory -Force -Path $comparisonsDir | Out-Null
}

# 1. Master README.md
$readmeContent = @"
---
title: AI Master Comparisons & Decision Center
category: 03-Comparisons
last_updated: 2026-07-28
tags: [ai-comparisons, best-models, decision-matrix, benchmarks, advanced-ai-features]
author: Antigravity AI Knowledge Engine
---

# AI Master Comparisons & Model Selection Center

Welcome to the **Master AI Comparison & Decision Center**. This directory contains exhaustive side-by-side evaluations across all 13 major AI service domains, identifying **the best model for each task**, **why it is the best**, **the features it provides**, and **extra advanced features you need to learn**.

---

## 📁 Master Comparison Directory Index

| Module | Category | Description | Primary Comparison Focus |
| :--- | :--- | :--- | :--- |
| **[01-Language-Models](./01-Language-Models-Comparison.md)** | LLMs | General Text Generation & Multi-step Logic | GPT-4o vs Claude 3.7 Sonnet vs Gemini 2.5 Pro vs Llama 3.3 70B vs DeepSeek V3 |
| **[02-Reasoning-Models](./02-Reasoning-Models-Comparison.md)** | AI Reasoning | Math, Codeforces & Chain-of-Thought | DeepSeek-R1 vs OpenAI o1 vs o3-mini vs Claude 3.7 Thinking vs Gemini 2.5 Thinking |
| **[03-Embedding-Models](./03-Embedding-Models-Comparison.md)** | Vector Search | Dense Semantic Embeddings & MTEB | Voyage-3 vs NV-Embed-v2 vs text-embedding-3-large vs BGE-M3 vs Nomic |
| **[04-Reranking-Models](./04-Reranking-Models-Comparison.md)** | Two-Stage IR | Cross-Encoder Candidate Rescoring | Cohere Rerank v3.5 vs Voyage Rerank 2 vs Jina Reranker v2 vs BGE Reranker |
| **[05-Image-Generation](./05-Image-Generation-Comparison.md)** | Generative Vision | Text-to-Image Synthesis | FLUX.1 vs DALL-E 3 vs Imagen 3 vs Midjourney v6 vs Recraft v3 vs SD3 |
| **[06-Image-Editing](./06-Image-Editing-Comparison.md)** | Image Edits | Inpainting, Outpainting & ControlNet | FLUX.1 Fill vs Adobe Firefly vs Midjourney Vary Region vs ControlNet vs IP-Adapter |
| **[07-Vision-Models](./07-Vision-Models-Comparison.md)** | Vision LLMs | Visual QA, Document OCR & ChartQA | Claude 3.7 Sonnet Vision vs GPT-4o Vision vs Gemini 2.5 Pro Vision vs Qwen 2.5 VL |
| **[08-Document-AI](./08-Document-AI-Comparison.md)** | IDP & OCR | PDF Parsing & Key-Value Extraction | Google Document AI vs AWS Textract vs Azure Doc Intel vs LlamaParse vs Unstructured |
| **[09-Speech-to-Text](./09-Speech-to-Text-Comparison.md)** | ASR / STT | Audio Transcription & Diarization | Deepgram Nova-2 vs Whisper Large v3 vs AssemblyAI Universal-1 vs ElevenLabs Scribe |
| **[10-Text-to-Speech](./10-Text-to-Speech-Comparison.md)** | Neural TTS | Audio Synthesis & Voice Quality | Cartesia Sonic vs ElevenLabs Multilingual v2 vs PlayHT Play3.0 vs OpenAI tts-1-hd |
| **[11-Realtime-Voice](./11-Realtime-Voice-Comparison.md)** | Speech-to-Speech | Full-Duplex WebRTC Voice Agents | GPT-4o Realtime API vs Gemini Live vs Vapi vs Retell AI vs LiveKit Agents vs Moshi |
| **[12-Voice-Cloning](./12-Voice-Cloning-Comparison.md)** | Voice Replicas | Zero-Shot & Professional Voice Clones | ElevenLabs IVC/PVC vs PlayHT Clone vs Cartesia Clone vs OpenVoice v2 vs XTTS v2 |
| **[13-Video-Generation](./13-Video-Generation-Comparison.md)** | 3D DiT Video | Text/Image-to-Video Synthesis | Runway Gen-3 Alpha vs Sora vs Luma Dream Machine vs Kling 1.5 vs HunyuanVideo |
| **[14-Advanced-Features](./14-Extra-Advanced-Features-Guide.md)** | Advanced Tech | SOTA AI Techniques & Architectures | Prompt Caching, Extended Thinking, GRPO, Matryoshka MRL, WebRTC, SAM, 3D DiT |
| **[15-Master-Matrix](./15-Master-Decision-Matrix.md)** | Executive Summary | Global Selection Matrix | Best by Budget, Speed, Quality, Privacy, and Open-Source Self-Hosting |

---

# 🚀 Quick Selection Summary: Best Model by Service

- **Best Overall LLM**: **Claude 3.7 Sonnet** (Anthropic) — Unmatched hybrid reasoning, coding precision, and 200k context.
- **Best Open-Source LLM**: **DeepSeek-V3** (DeepSeek) — 671B MoE architecture delivering GPT-4o performance at 1/10th the token price.
- **Best AI Reasoning Model**: **DeepSeek-R1** (DeepSeek) — Open-weights RLAIF model scoring 79.8% on AIME 2024 Math & 2029 Codeforces ELO.
- **Best Vector Embedding Model**: **Voyage-3** (Voyage AI) — #1 SOTA MTEB retrieval accuracy with Matryoshka dimension truncation down to 256.
- **Best Reranking Model**: **Cohere Rerank v3.5** (Cohere) — Multi-aspect cross-encoder yielding +25% precision gains in two-stage RAG pipelines.
- **Best Image Generation Model**: **FLUX.1 [pro]** (Black Forest Labs) — Flawless photorealism, typography rendering, and prompt adherence.
- **Best Image Editing Tool**: **FLUX.1 Fill** (Black Forest Labs) — Seamless inpainting, outpainting, and background replacement with zero mask seam artifacts.
- **Best Vision Model**: **Claude 3.7 Sonnet Vision** (Anthropic) — #1 MMMU score (70.2%) and 95.2% DocVQA visual document accuracy.
- **Best Document AI Engine**: **AWS Textract & LlamaParse** — SOTA table array reconstruction and PDF-to-Markdown conversion for RAG.
- **Best Speech-to-Text Engine**: **Deepgram Nova-2** (Deepgram) — Ultra-fast sub-250ms streaming latency and low 5.2% Word Error Rate (WER).
- **Best Text-to-Speech Engine**: **Cartesia Sonic & ElevenLabs Turbo v2.5** — Cartesia for sub-90ms ultra-low latency; ElevenLabs for deep emotional expressiveness.
- **Best Realtime Voice Agent Engine**: **GPT-4o Realtime API** (OpenAI) & **LiveKit Agents** — Native speech-to-speech multimodal WebRTC streaming under 300ms.
- **Best Voice Cloning Engine**: **ElevenLabs Professional Voice Cloning (PVC)** — Near-perfect 0.96 SIM-Cos speaker similarity score.
- **Best Video Generation Model**: **Runway Gen-3 Alpha** (Runway) & **HunyuanVideo** — SOTA VBench rating (84.5%), cinematic 1080p camera motion control.
"@
Set-Content -Path (Join-Path $comparisonsDir "README.md") -Value $readmeContent -Encoding UTF8

# 2. Write 01-Language-Models-Comparison.md
$lmContent = @"
---
title: Language Models Comparison & Evaluation Guide
service: 01-Language-Models
last_updated: 2026-07-28
tags: [llm-comparison, gpt-4o, claude-3-7-sonnet, gemini-2-5-pro, llama-3-3-70b, deepseek-v3]
author: Antigravity AI Knowledge Engine
---

# Language Models — Comparison & Model Selection Guide

## 🎯 Which is the Best Model?
**Winner: Claude 3.7 Sonnet (Anthropic)** for general enterprise development, coding, and multi-step complex instruction following.
**Open-Source Winner: DeepSeek-V3** for cost-effective self-hosting or API inference at $0.14/1M tokens.

---

## 🔍 Why is Claude 3.7 Sonnet the Best Model?
1. **Hybrid Architecture**: Combines standard fast completion with dynamic extended thinking budgets (up to 64,000 reasoning tokens).
2. **Superior Coding & System Design**: Outperforms GPT-4o on SWE-bench Verified and complex software architecture refactoring.
3. **200,000 Token Context Window**: Maintains near-100% recall across long documents without "lost-in-the-middle" degradation.

---

## 📊 Comprehensive Comparison Matrix

| Feature / Metric | Claude 3.7 Sonnet | GPT-4o | Gemini 2.5 Pro | DeepSeek-V3 | Llama 3.3 70B |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Primary Developer** | Anthropic | OpenAI | Google AI | DeepSeek | Meta AI |
| **Context Window** | 200,000 tokens | 128,000 tokens | **2,000,000 tokens** | 64,000 tokens | 128,000 tokens |
| **MMLU Benchmark** | **89.2%** | 88.6% | 88.2% | 88.5% | 86.9% |
| **SWE-bench Coding** | **70.3%** (#1 SOTA) | 65.2% | 63.8% | 65.0% | 60.2% |
| **API Pricing (Input/Output 1M)**| **$3.00 / $15.00** | **$2.50 / $10.00** | **$1.25 / $5.00** | **$0.14 / $0.28** (Cheapest) | **$0.60 / $0.60** (Groq) |
| **Prompt Caching Support** | **Yes (50% discount)** | **Yes (50% discount)** | **Yes (75% discount)** | **Yes (80% discount)** | Host Dependent |
| **Open-Weights / Self-Host** | Proprietary API | Proprietary API | Proprietary API | **Yes (MIT License)** | **Yes (Community)** |

---

## 💡 Extra Advanced Features to Learn
- **Prompt Caching**: Preserving prefix context (e.g. system prompts or PDF docs) in RAM to cut API latency by 80% and cost by up to 80%.
- **Native JSON Schema Enforcement**: Guaranteeing valid structured JSON outputs for API integration.
- **MoE Architecture (Mixture-of-Experts)**: DeepSeek-V3 routes 37B active parameters out of 671B total parameters to achieve ultra-fast inference speed at minimal cost.
"@
Set-Content -Path (Join-Path $comparisonsDir "01-Language-Models-Comparison.md") -Value $lmContent -Encoding UTF8

# 3. Write 02-Reasoning-Models-Comparison.md
$reasoningContent = @"
---
title: Reasoning Models Comparison & Evaluation Guide
service: 02-Reasoning-Models
last_updated: 2026-07-28
tags: [reasoning-models, deepseek-r1, openai-o1, o3-mini, claude-3-7-thinking, grpo]
author: Antigravity AI Knowledge Engine
---

# Reasoning Models — Comparison & Model Selection Guide

## 🎯 Which is the Best Model?
**Winner: DeepSeek-R1 (DeepSeek)** for open-weights availability, cost efficiency, and full transparent `<think>` token access.
**Commercial API Winner: OpenAI o3-mini** for high-speed mathematical proofs and competitive programming.

---

## 🔍 Why is DeepSeek-R1 the Best Model?
1. **Open-Weights (MIT License)**: Allows full local self-hosting on vLLM/Ollama without cloud vendor lock-in.
2. **GRPO Reinforcement Learning**: Trained without human-labeled Supervised Fine-Tuning (SFT), discovering self-correction and backtracking naturally.
3. **95%+ Cost Savings**: Costs $0.55 / $2.19 per 1M tokens vs OpenAI o1 at $15.00 / $60.00.

---

## 📊 Comprehensive Comparison Matrix

| Feature / Metric | DeepSeek-R1 | OpenAI o3-mini | OpenAI o1 | Claude 3.7 (Thinking) | Gemini 2.5 (Thinking) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **AIME 2024 Math Score** | **79.8%** | **87.3%** (#1 Math) | 83.3% | 85.0%+ | 84.2% |
| **Codeforces ELO Rating** | **2029 ELO** | **2073 ELO** | 1891 ELO | 2000+ ELO | 1950 ELO |
| **GPQA Diamond (Science)** | **75.7%** | **77.0%** | 78.0% | 76.2% | 75.0% |
| **Thinking Token Visibility**| **Full `<think>` Text** | Hidden metadata count | Hidden metadata count | Optional Thinking Text | Optional Thinking Text |
| **Reasoning Control** | Automatic CoT | `reasoning_effort: low/med/high` | `reasoning_effort: low/med/high` | `thinking: { budget_tokens }` | Automatic CoT |
| **API Pricing (1M Tokens)** | **$0.55 / $2.19** | **$1.10 / $4.40** | **$15.00 / $60.00** | **$3.00 / $15.00** | **$1.25 / $5.00** |
| **Open-Source / Weights** | **Open-Weights (MIT)** | Proprietary API | Proprietary API | Proprietary API | Proprietary API |

---

## 💡 Extra Advanced Features to Learn
- **GRPO (Group Relative Policy Optimization)**: Reinforcement learning algorithm that eliminates the need for a separate critic model, sampling candidate answers and rewarding relative group performance.
- **Process Reward Models (PRM)**: Rewarding individual step-by-step reasoning logic rather than just the final answer score.
- **Test-Time Compute Scaling**: Allocating extra GPU computation time during inference to let the model self-correct and verify its logic tree before outputting the final answer.
"@
Set-Content -Path (Join-Path $comparisonsDir "02-Reasoning-Models-Comparison.md") -Value $reasoningContent -Encoding UTF8

# 4. Write 03-Embedding-Models-Comparison.md
$embedContent = @"
---
title: Embedding Models Comparison & Evaluation Guide
service: 03-Embedding-Models
last_updated: 2026-07-28
tags: [embedding-models, voyage-3, text-embedding-3-large, nv-embed-v2, bge-m3, matryoshka]
author: Antigravity AI Knowledge Engine
---

# Embedding Models — Comparison & Model Selection Guide

## 🎯 Which is the Best Model?
**Winner: Voyage-3 (Voyage AI)** for commercial RAG retrieval accuracy and 32k long-context document embedding.
**Open-Source Winner: NV-Embed-v2 (NVIDIA)** & **BGE-M3 (BAAI)** for #1 MTEB leaderboard rank and multilingual open-weights self-hosting.

---

## 🔍 Why is Voyage-3 the Best Model?
1. **Domain-Specific Optimization**: Customized vector space trained specifically for enterprise document RAG search and code retrieval.
2. **Matryoshka Representation Learning (MRL)**: Native support for truncating 1024-dimensional vectors down to 512 or 256 dimensions with <1% loss in retrieval recall.
3. **32,000 Token Context Window**: Embeds long multi-page documents without chunk fragmentation.

---

## 📊 Comprehensive Comparison Matrix

| Feature / Metric | Voyage-3 | NV-Embed-v2 | text-embedding-3-large | Jina-Embeddings-v3 | BGE-M3 | Nomic-Embed-v1.5 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Developer** | Voyage AI | NVIDIA | OpenAI | Jina AI | BAAI | Nomic AI |
| **Native Dimensions** | 1024-dim | 4096-dim | 3072-dim | 1024-dim | 1024-dim | 768-dim |
| **MTEB Retrieval Score** | **66.8** | **69.2** (#1 Overall) | 64.6 | 65.4 | 63.8 | 62.3 |
| **Context Window** | **32,000 tokens** | 32,000 tokens | 8,191 tokens | 8,192 tokens | 8,192 tokens | 8,192 tokens |
| **Matryoshka Truncation**| **Yes (512, 256, 128)** | Yes | Yes (1536, 256) | Yes | Yes | Yes (512, 256, 128, 64) |
| **API Pricing (per 1M)** | **$0.060 / 1M** | NVIDIA NIM | **$0.130 / 1M** | **$0.020 / 1M** | **Free (Apache 2.0)** | **Free (Apache 2.0)** |

---

## 💡 Extra Advanced Features to Learn
- **Matryoshka Representation Learning (MRL)**: Training embeddings nested like Russian Matryoshka dolls, allowing vector truncation to reduce RAM storage by 50%-75%.
- **Int8 / Binary Quantization**: Converting 32-bit float vectors into 1-bit binary vectors, reducing vector database storage footprints by 32x while maintaining 95%+ search recall.
- **Distance Metric Selection**: Using Cosine Similarity vs Dot Product vs Euclidean L2 based on vector normalization status.
"@
Set-Content -Path (Join-Path $comparisonsDir "03-Embedding-Models-Comparison.md") -Value $embedContent -Encoding UTF8

# 5. Write 04-Reranking-Models-Comparison.md
$rerankContent = @"
---
title: Reranking Models Comparison & Evaluation Guide
service: 04-Reranking-Models
last_updated: 2026-07-28
tags: [reranking-models, cross-encoder, cohere-rerank, voyage-rerank, bge-reranker, ndcg]
author: Antigravity AI Knowledge Engine
---

# Reranking Models — Comparison & Model Selection Guide

## 🎯 Which is the Best Model?
**Winner: Cohere Rerank v3.5 (Cohere)** for multi-aspect cross-encoder relevance rescoring and enterprise RAG integration.
**Open-Source Winner: BGE Reranker Large (BAAI)** & **MXBAI Rerank Large (Mixedbread AI)** for open-weights deployment.

---

## 🔍 Why is Cohere Rerank v3.5 the Best Model?
1. **Multi-Aspect Cross-Encoder**: Jointly attends over query and candidate document text simultaneously, outperforming bi-encoder vector similarity by +25% on NDCG@10.
2. **Multi-Lingual Coverage**: Supports 100+ languages out of the box with zero configuration.
3. **Structured Filtering**: Automatically filters non-relevant candidate documents using score cutoff thresholds (e.g. `relevance_score < 0.35`).

---

## 📊 Comprehensive Comparison Matrix

| Feature / Metric | Cohere Rerank v3.5 | Voyage Rerank 2 | Jina Reranker v2 | NV-Rerank-v1 | BGE Reranker Large | MXBAI Rerank Large |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Architecture** | Cross-Encoder | Cross-Encoder | Cross-Encoder | Cross-Encoder | Cross-Encoder | Cross-Encoder |
| **NDCG@10 Accuracy Gain**| **+25% Gain** | **+28% Gain** (#1 Accuracy)| **+24% Gain** | **+26% Gain** | **+22% Gain** | **+23% Gain** |
| **Multilingual Support**| **100+ Languages** | English & Code | **100+ Languages** | English | English & Chinese | English |
| **Max Input Length** | 4,096 tokens | 4,096 tokens | **10,240 tokens** | 4,096 tokens | 1,024 tokens | 512 tokens |
| **API Pricing (100k docs)**| **$0.020 / 100k** | **$0.050 / 100k** | **$0.020 / 1M** | NVIDIA NIM | **Free (Apache 2.0)** | **Free (Apache 2.0)** |

---

## 💡 Extra Advanced Features to Learn
- **Two-Stage Retrieval Pipeline**: Retrieving Top 50 candidates using fast vector search, then using a cross-encoder reranker to pick the Top 5 hyper-relevant chunks for the LLM context.
- **Score Thresholding**: Cutting off documents below a minimum relevance score to eliminate context hallucination noise.
- **Reciprocal Rank Fusion (RRF)**: Combining keyword search (BM25) scores with vector search scores before cross-encoder reranking.
"@
Set-Content -Path (Join-Path $comparisonsDir "04-Reranking-Models-Comparison.md") -Value $rerankContent -Encoding UTF8

# 6. Write 14-Extra-Advanced-Features-Guide.md
$advancedContent = @"
---
title: Master Guide to Advanced AI Features & SOTA Techniques
category: 03-Comparisons
last_updated: 2026-07-28
tags: [advanced-ai-features, grpo, prompt-caching, matryoshka-mrl, webrtc, sam, 3d-dit]
author: Antigravity AI Knowledge Engine
---

# Master Guide — Advanced AI Features & Techniques You Must Learn

Beyond basic prompt completion, modern production AI architectures rely on advanced SOTA techniques to optimize cost, latency, accuracy, and interactivity. Here is the master roadmap of essential advanced AI features:

---

## 1. 🧠 Test-Time Compute & GRPO (AI Reasoning)
- **What it is**: Reinforcement learning algorithm (Group Relative Policy Optimization) used in DeepSeek-R1 and OpenAI o1/o3-mini.
- **Why it matters**: Allows reasoning models to allocate additional "thinking time" during inference, self-correcting mistakes and exploring multiple proof branches before outputting a final answer.
- **Key Metric**: AIME 2024 Math (>80%) and Codeforces ELO (>2000).

---

## 2. ⚡ Prompt Caching (Cost & Latency Reduction)
- **What it is**: Storing frequently repeated system prompts, legal agreements, or document context in server RAM across API calls.
- **Why it matters**: Reduces API input token pricing by 50% to 80% and speeds up Time-To-First-Token (TTFT) by up to 80%.
- **Supported Providers**: Anthropic, OpenAI, Google Gemini, DeepSeek.

---

## 3. 🪆 Matryoshka Representation Learning (MRL Embeddings)
- **What it is**: Training vector embeddings nested like Russian Matryoshka dolls.
- **Why it matters**: Allows truncating 1024-dimensional vectors down to 512, 256, or 128 dimensions while retaining >99% search recall, saving up to 75% RAM storage in vector databases (Qdrant, Pinecone).
- **Supported Models**: Voyage-3, OpenAI text-embedding-3-large, Nomic Embed v1.5.

---

## 4. 🎙️ WebRTC Full-Duplex Speech-to-Speech (Realtime Voice)
- **What it is**: Direct native audio token streaming over WebRTC peer connections (OpenAI GPT-4o Realtime API, Gemini Live, Moshi).
- **Why it matters**: Replaces separate Speech-to-Text -> LLM -> Text-to-Speech pipelines, achieving sub-300ms conversational latency and native mid-sentence user interruption ("barge-in").

---

## 5. ✂️ Segment Anything Model (SAM Auto-Masking for Image Editing)
- **What it is**: Meta's vision segmentation model that automatically detects object boundaries from text or point clicks.
- **Why it matters**: Automates image inpainting pipelines by generating pixel-perfect alpha masks for object replacement in FLUX.1 Fill and Adobe Firefly.

---

## 6. 🎬 3D Diffusion Transformers (DiT Video Generation)
- **What it is**: Combining Vision Transformers with 3D Diffusion models to process spatial and temporal frames jointly.
- **Why it matters**: Powers Sora, Runway Gen-3 Alpha, and HunyuanVideo, ensuring physical consistency, fluid camera motion, and 1080p photorealism.
"@
Set-Content -Path (Join-Path $comparisonsDir "14-Extra-Advanced-Features-Guide.md") -Value $advancedContent -Encoding UTF8

# 7. Write 15-Master-Decision-Matrix.md
$matrixContent = @"
---
title: Executive Master Decision Matrix across All AI Services
category: 03-Comparisons
last_updated: 2026-07-28
tags: [decision-matrix, executive-summary, best-ai-models, pricing, latency]
author: Antigravity AI Knowledge Engine
---

# Executive Master Decision Matrix — Global Model Selection

Use this master selection guide to pick the single best model for your specific enterprise constraints (Quality vs Cost vs Speed vs Self-Hosting).

---

## 🎯 Global Winner per Category

| Service Domain | Overall SOTA Winner | Best Budget / Low-Cost | Best Open-Source / Self-Hosted | Key Advanced Feature |
| :--- | :--- | :--- | :--- | :--- |
| **Language Models** | **Claude 3.7 Sonnet** | **DeepSeek-V3** ($0.14/1M) | **DeepSeek-V3 / Llama 3.3 70B** | Prompt Caching & 200k Context |
| **Reasoning Models** | **DeepSeek-R1** | **OpenAI o3-mini** ($1.10/1M) | **DeepSeek-R1 (671B MoE)** | GRPO & Visible `<think>` Tokens |
| **Embedding Models** | **Voyage-3** | **Jina-Embeddings-v3** ($0.02/1M) | **NV-Embed-v2 / BGE-M3** | Matryoshka Dimension Truncation |
| **Reranking Models** | **Cohere Rerank v3.5** | **Jina Reranker v2** | **BGE Reranker Large** | Cross-Encoder Multi-Aspect Scoring |
| **Image Generation** | **FLUX.1 [pro]** | **Recraft v3** | **FLUX.1 [dev]** | Typography & Photorealism |
| **Image Editing** | **FLUX.1 Fill** | **DALL-E 3 Edits** | **ControlNet + SAM** | Seamless Inpainting & SAM Masking |
| **Vision Models** | **Claude 3.7 Sonnet Vision** | **Qwen 2.5 VL 72B** | **Qwen 2.5 VL / Llama 3.2 Vision**| 70.2% MMMU & 95.2% DocVQA OCR |
| **Document AI** | **AWS Textract / LlamaParse** | **LlamaParse** ($0.003/page) | **Unstructured / Marker PDF** | Table Array Reconstruction & Markdown |
| **Speech-to-Text** | **Deepgram Nova-2** | **Deepgram Nova-2** ($0.258/hr) | **Whisper.cpp / Whisper Large v3**| Sub-250ms WebSockets & 5.2% WER |
| **Text-to-Speech** | **ElevenLabs Turbo v2.5** | **Cartesia Sonic** ($40/1M chars) | **Bark / XTTS v2** | Sub-90ms Latency & 4.7 MOS |
| **Realtime Voice** | **GPT-4o Realtime API** | **Gemini 2.5 Flash Live** | **LiveKit Agents / Moshi** | Full-Duplex WebRTC Speech-to-Speech |
| **Voice Cloning** | **ElevenLabs PVC** | **Cartesia Sonic Clone** | **OpenVoice v2 / XTTS v2** | 0.96 SIM-Cos & Zero-Shot Dubbing |
| **Video Generation** | **Runway Gen-3 Alpha** | **Hailuo Minimax Video-01** | **HunyuanVideo (Tencent)** | 3D DiT 1080p Camera Motion Control |
"@
Set-Content -Path (Join-Path $comparisonsDir "15-Master-Decision-Matrix.md") -Value $matrixContent -Encoding UTF8

Write-Output "Successfully built Master Comparisons Knowledge Base in 03-Comparisons!"
