---
title: Reasoning Models — Test-Time Compute Scaling
service: 02-Reasoning-Models
section: 01-Fundamentals
file: Test-Time-Compute-Scaling.md
last_updated: 2026-07-28
tags: [reasoning-models, test-time-compute, scaling-laws, inference, budget]
author: Antigravity AI Knowledge Engine
---

# Test-Time Compute Scaling

**Test-Time Compute Scaling** refers to scaling the computational resources allocated to a model *during inference* (generation time) to solve complex problems, rather than only scaling parameters during training.

---

## 1. Shift in AI Scaling Laws

Traditional scaling laws (e.g. Kaplan et al., Chinchilla scaling laws) established that model performance scales predictably with the number of parameters, dataset size, and training compute. Reasoning models introduce a new dimension:

* **Training Scaling Limits**: Pre-training models on public web data is hitting quality ceilings (data scarcity and hardware power constraints).
* **Inference scaling**: By scaling computation at inference time (generating more reasoning tokens, running search trees, or utilizing voting ensembles), models continue to show significant accuracy improvements, bypassing training scaling caps.

---

## 2. Exploration Strategies in Search Space

During inference, models scale compute using several core strategies:

### A. Sequential Chain-of-Thought Scaling
* **Mechanism**: Autoregressively generating longer sequences of intermediate reasoning tokens. The model evaluates its own premises sequentially.

### B. Best-of-N Sampling & Voting (Ensembles)
* **Mechanism**: Generating $N$ independent completions for a single prompt and selecting the final response based on voting consensus (e.g. majority vote on mathematical answers).

### C. Tree Search Decoding (MCTS)
* **Mechanism**: Running tree search algorithms (like Monte Carlo Tree Search) during inference to generate, evaluate, and prune reasoning steps, navigating only the highest-value logical branches.

---

## 3. Compute Economics: Offline vs. Online

Scaling test-time compute shifts the financial and environmental costs of AI:

* **Standard LLMs**: Heavy offline pre-training cost (millions of dollars in GPU training clusters), but very cheap inference API calls.
* **Reasoning Models**: Shift costs toward **online inference**. Every reasoning prompt requires generating thousands of thinking tokens, increasing API per-request hosting costs and energy usage.
* **Production Management**: Developers manage this using parameters like `reasoning_effort` (low, medium, high) to set a maximum thinking budget based on task priority.
