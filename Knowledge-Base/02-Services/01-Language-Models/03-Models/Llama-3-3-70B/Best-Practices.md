---
title: Llama 3.3 70B — Best Practices
service: 01-Language-Models
model: Llama-3-3-70B
section: 03-Models
file: Best-Practices.md
last_updated: 2026-07-28
tags: [language-models, llama-3-3-70b, best-practices, optimization]
author: Antigravity AI Knowledge Engine
---

# Llama 3.3 70B — Production Best Practices

Guidelines and architecture patterns for optimizing speed, memory efficiency, and local security when deploying Llama 3.3 70B in production.

---

## 1. Weight Quantization Strategies

To deploy Llama 3.3 70B without enterprise-grade hardware, developers must apply quantization compression:

* **For Server Deployment (vLLM / TGI)**:
  * Use **AWQ (Activation-aware Weight Quantization)** or **GPTQ** in **4-bit** or **8-bit** configurations. AWQ preserves activation weights better than standard round-to-nearest quantization, maintaining high coding and math capabilities.
* **For Local Development / Workstations (Ollama / llama.cpp)**:
  * Use the **GGUF** format with **`Q4_K_M`** (4-bit medium) or **`Q8_0`** (8-bit) compression. `Q4_K_M` uses 4-bit quantization for attention matrices and 5-bit for feed-forward layers, balancing VRAM compression and output quality.

---

## 2. Multi-GPU Tensor Parallelism (TP)

When hosting the 70B model using vLLM across multiple GPUs:

* **Set Tensor Parallelism**: Configure the parameter `tensor_parallel_size` to match the number of active GPUs.
* **Avoid Pipeline Parallelism**: Keep pipeline parallelism (`pipeline_parallel_size`) at `1` unless the model cannot fit within a single node. Tensor Parallelism splits layers horizontally within the same node, reducing latency compared to inter-node pipeline splitting.
* **Run Commands (vLLM Example)**:
  ```bash
  python -m vllm.entrypoints.openai.api_server \
      --model meta-llama/Llama-3.3-70B-Instruct \
      --tensor-parallel-size 2 \
      --port 8000
  ```

---

## 3. Operations & API Security

* **Sanitize Inputs**: Always sanitize user inputs to prevent prompt injection attacks (such as overriding system prompts using custom `<|start_header_id|>` markers).
* **Enable Secure Boundaries**: If hosting endpoints publicly, wrap local API servers (like vLLM or Ollama) with reverse proxies (e.g., Nginx) to handle SSL certificates and API token authentication.
