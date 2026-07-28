---
title: Language Models — Model Quantization
service: 01-Language-Models
section: 01-Fundamentals
file: Quantization.md
last_updated: 2026-07-28
tags: [language-models, llm, quantization, optimization]
author: Antigravity AI Knowledge Engine
---

# Model Quantization

**Quantization** is the process of compressing neural network weights and activations by mapping continuous, high-precision floating-point numbers (e.g., 32-bit or 16-bit floats) to low-precision representation formats (e.g., 8-bit or 4-bit integers). This is a critical optimization for serving large models on limited GPU/CPU hardware.

---

## 1. Mathematical Formulation

Quantization maps a real-world value $x \in [\alpha, \beta]$ to a quantized integer value $q$ within a target range $[q_{\text{min}}, q_{\text{max}}]$ (such as $[-128, 127]$ for signed 8-bit integers).

The standard linear quantization mapping is defined as:

$$q = \text{clamp}\left( \text{round}\left( \frac{x}{S} \right) + Z, \ q_{\text{min}}, \ q_{\text{max}} \right)$$

And the dequantization reconstruction to estimate the original value is:

$$\tilde{x} = S \cdot (q - Z)$$

Where:
* **$S$ (Scale)**: A positive floating-point scale factor determining step size:
  $$S = \frac{\beta - \alpha}{q_{\text{max}} - q_{\text{min}}}$$
* **$Z$ (Zero-Point)**: An integer aligning the value $0.0$ in the floating-point space, ensuring zero-padding does not introduce distortion:
  $$Z = \text{round}\left( \frac{-\alpha}{S} \right) + q_{\text{min}}$$

---

## 2. Quantization Approaches

### A. Post-Training Quantization (PTQ)
* **Concept**: The model is quantized after training has completed. It requires a small calibration dataset to measure activation ranges and calculate optimal scales ($S$).
* **Pros**: Low compute requirement; takes minutes to complete.
* **Cons**: Can cause accuracy degradation, especially in smaller models (<10B parameters) or at ultra-low bit widths (<4-bit).

### B. Quantization-Aware Training (QAT)
* **Concept**: Simulates quantization error during the training process using straight-through estimators.
* **Pros**: Preserves accuracy extremely well, even down to 4-bit or 3-bit limits.
* **Cons**: Extremely compute-intensive; requires retraining or fine-tuning the model.

---

## 3. The Outlier Weights Challenge

As LLMs scale past 6.7B parameters, specific "outlier features" emerge. These are a small fraction (around 1%) of activation channels that exhibit extremely high values (up to 100x average activations).
* **Impact**: If linear quantization is applied globally across a layer, these outliers scale the range $[\alpha, \beta]$ excessively. This squeezes the remaining 99% of normal weights into a tiny subset of quantized bins, destroying model intelligence.
* **Mitigation**:
  * **SmoothQuant**: Migrates the quantization difficulty from activations to weights by applying a scaling factor, balancing weights and activations before quantization.
  * **AWQ (Activation-aware Weight Quantization)**: Identifies the 1% of channels that are most important to model accuracy and skips quantizing them (or quantizes them at higher precision), quantizing only the remaining 99%.

---

## 4. Popular Formats & Serving Frameworks

Different quantization formats are optimized for different hardware configurations:

| Quantization Format | Target Hardware | Precision Formats | Primary Use Case |
| :--- | :--- | :--- | :--- |
| **GGUF (llama.cpp)** | CPU, Apple Silicon, consumer GPUs | Q4_K_M, Q5_K_M, Q8_0 | Local execution. Offloads layers dynamically from CPU RAM to GPU VRAM. |
| **AWQ (Activation-aware)** | Modern NVIDIA GPUs (RTX, A100, H100) | INT4, INT8, FP8 | High-throughput enterprise serving engines (vLLM, TensorRT-LLM). |
| **GPTQ (One-shot PTQ)** | NVIDIA GPUs | INT4, INT8 | Local or cloud GPU serving with minimal degradation. |
| **EXL2 (ExLlamaV2)** | NVIDIA consumer GPUs | Variable bit rates (e.g., 3.5-bit to 5-bit) | Ultra-fast local GPU generation for consumer cards. |
