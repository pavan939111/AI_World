---
title: Mistral-Large-2 — Best Practices
service: 01-Language-Models
model: Mistral-Large-2
section: 03-Models
file: Best-Practices.md
last_updated: 2026-07-28
tags: [language-models, mistral-large-2, best-practices, optimization]
author: Antigravity AI Knowledge Engine
---

# Mistral-Large-2 — Production Best Practices

Guidelines and architecture patterns for optimizing weight quantizations, local GPU distribution, and API routing when deploying Mistral-Large-2 in production.

---

## 1. Weight Quantization Strategies

To deploy the dense 123B model locally without massive multi-GPU hardware arrays, developers apply weight quantization:

* **For Cloud serving engines (vLLM / TGI)**:
  * Select **AWQ (Activation-aware Weight Quantization)** in **4-bit** or **8-bit** formats. AWQ preserves activation weights better than standard round-to-nearest quantization, maintaining high coding and translation accuracy.
* **For Local Development Workstations (Ollama / llama.cpp)**:
  * Select the **GGUF** format with **`Q4_K_M`** (4-bit medium) or **`Q8_0`** (8-bit) compression. `Q4_K_M` balances memory VRAM footprint (~75 GB) and generation coherence.

---

## 2. Multi-GPU Tensor Parallelism (TP)

When hosting the dense 123B model using vLLM across multi-GPU nodes:

* **Distribute TP Size**: Set the parameter `tensor_parallel_size` to match the exact number of active GPUs inside the node (e.g. dual H100s require `--tensor-parallel-size 2`).
* **Keep Pipeline Parallelism Low**: Set pipeline parallelism (`pipeline_parallel_size`) to `1` inside single nodes to avoid high inter-node communication latency overheads.
* **vLLM Command Line Example**:
  ```bash
  python -m vllm.entrypoints.openai.api_server \
      --model mistralai/Mistral-Large-Instruct-2407 \
      --tensor-parallel-size 2 \
      --port 8000
  ```

---

## 3. Operations & API Security

* **Sanitize Inputs**: Always sanitize raw user inputs to strip any unescaped special tokens (such as `[INST]` or `[/INST]`) to prevent prompt injection attempts.
* **Enable Reverse Proxy Authorization**: Wrap local serving instances with reverse proxies (e.g., Nginx) to manage SSL certificates and secure API tokens before routing requests to local GPU networks.
