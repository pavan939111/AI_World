---
title: Language Models — DeepSeek
service: 01-Language-Models
section: 02-Providers
file: DeepSeek.md
last_updated: 2026-07-28
tags: [language-models, llm, providers, deepseek, moe]
author: Antigravity AI Knowledge Engine
---

# DeepSeek Provider Profile

**DeepSeek** is a Chinese artificial intelligence research organization (founded by High-Flyer Quant, a quantitative trading firm) that focuses on developing highly optimized, low-cost, and high-performance open-weights models. DeepSeek is renowned for introducing several algorithmic innovations that drastically reduce training and inference costs.

---

## 1. Core Model Roster

DeepSeek's model catalog covers two primary categories:

* **DeepSeek-V3 (671B sparse MoE)**: Their flagship general-intelligence model. It consists of 671 Billion total parameters, with 37 Billion active parameters per token. It matches proprietary models on several benchmarks while costing significantly less to host and query.
* **DeepSeek-R1**: A reasoning model trained using large-scale Reinforcement Learning (RL) that outputs a detailed internal chain of thought (`<think>...</think>`). It achieves performance matching OpenAI's reasoning models on mathematics, science, and coding competitions.
* **DeepSeek-Coder-V2**: An open-source code-specialized model that matches or outperforms GPT-4 on coding benchmarks.

---

## 2. Key Algorithmic Breakthroughs

DeepSeek has achieved extreme cost efficiency by redesigning core Transformer layers:

* **Multi-head Latent Attention (MLA)**: A major improvement over standard Grouped-Query Attention (GQA). MLA compresses the Key-Value (KV) cache into a low-dimensional latent space during inference, reducing the KV cache memory footprint by up to **93%**, allowing for massive batch sizes and high-speed serving.
* **DeepSeekMoE (Shared & Fine-Grained Experts)**:
  * **Fine-Grained Experts**: Splits experts into smaller subnetworks (e.g., 64 experts), enabling more precise token routing.
  * **Shared Experts**: Keeps specific experts active for *every* token to capture general baseline knowledge, reducing routing redundancy.
* **FP8 Precision Training**: DeepSeek co-designed an FP8 (8-bit floating-point) training and inference framework. By performing matrix multiplications in FP8 instead of FP16, they reduce GPU memory transfers, accelerating training speeds.
* **DualPipe Parallelism**: An optimized pipeline parallelism scheduling algorithm that overlaps communication and computation phases during training, eliminating training bubbles and maximizing GPU utilization.

---

## 3. Pricing & Integration

* **Cost Disruption**: DeepSeek API pricing disrupted the industry by offering input and output tokens at a fraction of the cost of other providers (e.g., $0.14 per 1M input tokens and $0.28 per 1M output tokens).
* **API Compatibility**: DeepSeek's API platform (`api.deepseek.com`) implements a standard OpenAI-compatible endpoints layer, enabling developers to switch models simply by changing the `base_url` and `api_key` in their OpenAI SDK config.
