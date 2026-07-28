---
title: Language Models — Meta AI
service: 01-Language-Models
section: 02-Providers
file: Meta-AI.md
last_updated: 2026-07-28
tags: [language-models, llm, providers, meta, llama]
author: Antigravity AI Knowledge Engine
---

# Meta AI Provider Profile

**Meta AI** (a division of Meta Platforms, Inc.) is the primary pioneer of open-weights Large Language Models. By releasing model weights under permissive commercial licenses, Meta catalyzed the open-source developer ecosystem, enabling local execution, custom fine-tuning, and independent hosting.

---

## 1. Core Model Roster (Llama Family)

Meta's model family, **LLaMA** (Large Language Model Meta AI), has evolved through multiple iterations:

* **Llama 3.3 (70B)**: The current production workhorse. It features a 128k context window, a 128k vocabulary tokenizer, and achieves performance competitive with older closed models at a fraction of the hosting scale.
* **Llama 3.2 (Edge & Vision)**: Meta's multimodal and lightweight family. It includes:
  * **11B & 90B Vision Models**: Support image inputs alongside text.
  * **1B & 3B Lightweight Models**: Optimized to run locally on mobile devices and edge hardware.
* **Llama 3.1 (8B, 70B, 405B)**: Introduced the 128k context length, Grouped-Query Attention (GQA), and the massive 405B parameter model designed for synthetic data generation and distillation.
* **Llama 1 & 2 (Legacy)**: The initial open-weights models that established the open-source ecosystem.

---

## 2. Key Developer Features

Meta’s open approach provides developers with capabilities unavailable in closed APIs:

* **Complete Weights Control**: Developers can download the raw weights (`.safetensors` files) and run them locally, on private clouds, or edge hardware, ensuring absolute data privacy.
* **Permissive Licensing**: The Llama 3 license allows free commercial use for products with up to 700 million monthly active users, making it accessible for startups and enterprise platforms alike.
* **Quantization & Local Serving**: Because weights are open, the community compiles them into various quantized formats (e.g., GGUF for local CPU/GPU offloading, AWQ/GPTQ for fast GPU hosting), allowing a 70B model to run on a single workstation or a 3B model to run on a standard laptop.
* **Custom Fine-Tuning**: Open weights enable developers to train Llama models on proprietary data using Parameter-Efficient Fine-Tuning (PEFT) methods like LoRA and QLoRA without sending training data to external API servers.

---

## 3. Deployment Methods

Llama models are hosted using open-source serving architectures rather than proprietary endpoints:

* **Local Inference (Ollama / llama.cpp)**: Allows running Llama models on consumer laptops (macOS/Windows/Linux) using GGUF format:
  ```bash
  ollama run llama3.3
  ```
* **Production Serving (vLLM / TensorRT-LLM)**: Serves Llama models on GPU nodes using continuous batching and PagedAttention, exposing an OpenAI-compatible API layer.
