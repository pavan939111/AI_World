---
title: Language Models — Mistral AI
service: 01-Language-Models
section: 02-Providers
file: Mistral-AI.md
last_updated: 2026-07-28
tags: [language-models, llm, providers, mistral, mixtral]
author: Antigravity AI Knowledge Engine
---

# Mistral AI Provider Profile

**Mistral AI** is a French artificial intelligence company founded in 2023 by former researchers from Meta and Google DeepMind. Mistral is recognized for its commitment to open-weights models and its pioneer commercialization of sparse Mixture-of-Experts (MoE) architectures.

---

## 1. Core Model Roster

Mistral AI provides both open-weights models and closed commercial models:

### A. Open-Weights Models
* **Mistral 7B**: A highly optimized 7-billion parameter dense model that outperformed larger legacy models (like Llama 1 33B) upon release.
* **Mixtral 8x7B (sparse MoE)**: A landmark Mixture-of-Experts model containing 8 experts. It routes 2 experts per token, executing 12.9B active parameters from a 47B total parameter pool.
* **Mixtral 8x22B**: A larger sparse MoE model with 141B total parameters and 39B active parameters, featuring native function calling and a 64k context window.
* **Codestral**: A model specifically optimized for code generation and autocomplete tasks, supporting over 80 programming languages.

### B. Proprietary Commercial Models
* **Mistral Large 2**: The flagship model, offering advanced reasoning, multi-language support, coding proficiency, and function calling. It is served via their platform API and available on Azure.
* **Mistral Nemo**: A 12B parameter model co-developed with NVIDIA, optimized for multilingual tasks and featuring a 128k context window.

---

## 2. Key Developer Features

* **Double Licensing Model**: Mistral releases its small and MoE models (like Mistral 7B and Mixtral 8x7B) under the Apache 2.0 license, allowing unrestricted commercial use. Larger models (like Mistral Large 2 or Codestral) are released under the Mistral Research License for non-commercial use, requiring commercial licensing agreements for enterprise applications.
* **La Plateforme API**: Mistral's cloud serving API (`api.mistral.ai`) offers low-latency access to their full model catalog, supporting structured output format configurations, function calling, and system prompt formatting.
* **Local Serving**: Mistral's models are fully supported by local inference engines like vLLM, llama.cpp, and Ollama, making them popular for self-hosted enterprise setups that require data isolation.
