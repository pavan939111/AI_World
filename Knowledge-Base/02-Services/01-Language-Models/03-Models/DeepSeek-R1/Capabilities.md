---
title: DeepSeek-R1 — Capabilities
service: 01-Language-Models
model: DeepSeek-R1
section: 03-Models
file: Capabilities.md
last_updated: 2026-07-28
tags: [language-models, deepseek-r1, capabilities, reasoning, benchmarks]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-R1 — Capabilities

DeepSeek-R1 is engineered for complex logical analysis, competitive programming, and doctoral-level scientific problem-solving.

---

## 1. Reinforcement Learning & GRPO Training

Unlike standard models that rely entirely on supervised fine-tuning (SFT) to match human responses, DeepSeek-R1 is trained through large-scale Reinforcement Learning (RL):

* **Group Relative Policy Optimization (GRPO)**: Bypasses traditional actor-critic setups by generating a group of outputs for each query and evaluating them relative to one another. This saves GPU VRAM resources during training.
* **Cold-Start SFT**: Pre-trained with a small baseline of high-quality reasoning examples to prevent initial formatting collapse.
* **Self-Correction Loops**: The model learns to detect its own logic slips, back up, and re-evaluate parameters internally during generation.

---

## 2. Model Performance Benchmarks

DeepSeek-R1 achieves state-of-the-art results across reasoning benchmarks:

| Benchmark Evaluation | R1 Score | Target Area Measured |
| :--- | :--- | :--- |
| **AIME 2024** | **97.3%** | High-school competition mathematics. |
| **MATH-500** | **97.3%** | Advanced multi-step math problems. |
| **GPQA Diamond** | **62.1%** | PhD-level physics, chemistry, and biology logic. |
| **Codeforces** | **96.3 Percentile**| Competitive programming competitions. |
| **SWE-bench Verified** | **49.2%** | End-to-end repository software engineering. |

---

## 3. Advanced Logical Capabilities

* **Code Synthesis**: Excels in building complex data structures, multi-module scripts, and resolving database locks.
* **Logic Audits**: Highly efficient at identifying subtle logic gaps or security vulnerabilities in source code by dry-running executions within the thinking trace.
