---
title: Language Models — Mixture of Experts (MoE)
service: 01-Language-Models
section: 01-Fundamentals
file: MoE-Architecture.md
last_updated: 2026-07-28
tags: [language-models, llm, moe, architecture]
author: Antigravity AI Knowledge Engine
---

# Mixture of Experts (MoE) Architecture

**Sparse Mixture of Experts (MoE)** is a model design architecture that scales a model's total parameters and capacity while maintaining low inference latency and computational cost. It replaces the dense Feed-Forward Network (FFN) layers in a standard Transformer with sparse, routed expert sub-layers.

---

## 1. Core Concepts

A standard Transformer layer processes every token using identical feed-forward weights. A Sparse MoE layer contains:
1. **Multiple Experts ($E_1, E_2, \dots, E_N$)**: A set of independent feed-forward networks (FFNs).
2. **A Gating Network / Router ($G$)**: A parameter layer that determines which expert(s) should process the current token.

```
                  Input Token Representation (x)
                               │
            ┌──────────────────┴──────────────────┐
            ▼                                     ▼
     [Gating Router]                        Direct Path
            │                                     │
    Softmax Routing Weights                       │
  [w1=0.8, w2=0.2, w3..N=0]                       │
            │                                     │
            ├───────────────┬──────────────┐      │
            ▼               ▼              ▼      ▼
        [Expert 1]      [Expert 2]    [Expert 3..N] (Inactive)
            │               │
         Output 1        Output 2
            │               │
            ▼               ▼
        (w1 * Out1) + (w2 * Out2)
                    │
                    ▼
           Routed Layer Output
```

Mathematically, for an input vector $x$ and $N$ experts, the output of the MoE layer is:

$$y = \sum_{i \in \text{TopK}} G(x)_i E_i(x)$$

Where:
* **$G(x)_i$**: The output probability weight from the router for expert $i$, computed using a softmax over the router's linear projections.
* **$\text{TopK}$**: The subset of selected experts (typically $K=1$ or $K=2$).
* **$E_i(x)$**: The computation output from expert $i$.

---

## 2. Active vs. Total Parameters

MoE models leverage sparse execution:

* **Total Parameters**: The combined size of all experts, self-attention, and routing weights. This determines the **memory requirement** for storing the model in GPU VRAM.
* **Active Parameters**: The specific subset of parameters executed for a single token. This determines the **computational cost** (FLOPs) and inference latency.

*Example*: **Mixtral 8x7B**
* **Total Parameters**: ~47 Billion (requires ~96GB of VRAM in FP16).
* **Active Parameters**: ~12.9 Billion per token (runs with the speed and computational latency of a 13B dense model).

---

## 3. Router Challenges & Mitigation

Training sparse MoE architectures introduces unique optimization hurdles:

* **Expert Collapse (Load Imbalance)**: The router tends to converge early on favoring a small subset of experts, leaving other experts under-trained.
  * *Mitigation*: Training runs incorporate an **Auxiliary Load-Balancing Loss** that penalizes the router for uneven routing distributions.
* **Expert Capacity Limit**: During batch training and serving, routers enforce a capacity limit on experts (the maximum number of tokens an expert can accept in a batch). Tokens that exceed this limit are bypassed or routed to secondary experts.

---

## 4. Modern MoE Extensions

Recent architectures have refined MoE routing to maximize efficiency:

* **Fine-Grained Experts (DeepSeek-V3)**: Instead of routing to large experts, the model splits FFN capacity into many smaller experts (e.g., 64 or 128 experts) and routes to a larger subset (e.g., Top-6 or Top-8). This allows finer-grained specialization of weights.
* **Shared Experts**: Keeping one or more FFN experts active for *every* token, alongside the dynamically routed experts. This captures general, baseline language representations and reduces redundancy across the specialized routed experts.
* **Inference Pipeline Offloading**: In consumer hardware setups, inactive experts can be swapped or offloaded dynamically to system RAM or SSDs, though this introduces severe latency bottlenecks due to PCIe bandwidth transfer limits.
