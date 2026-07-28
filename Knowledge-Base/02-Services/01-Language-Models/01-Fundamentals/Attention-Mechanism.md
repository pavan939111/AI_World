---
title: Language Models — Attention Mechanism
service: 01-Language-Models
section: 01-Fundamentals
file: Attention-Mechanism.md
last_updated: 2026-07-28
tags: [language-models, llm, attention, self-attention]
author: Antigravity AI Knowledge Engine
---

# The Attention Mechanism

The **Self-Attention Mechanism** is the operational core of the Transformer. It allows a model to weigh the relevance of different tokens in a sequence dynamically, capturing contextual relationships regardless of their distance.

---

## 1. Mathematical Formulation

Self-attention maps an input representation into three vectors: **Queries ($Q$)**, **Keys ($K$)**, and **Values ($V$)**.
* **Queries ($Q$)**: Represent what the current token is looking for.
* **Keys ($K$)**: Represent what information the other tokens hold.
* **Values ($V$)**: Represent the actual content of the tokens.

For a sequence of input embeddings $X$, the projection matrices $W_Q, W_K, W_V$ compute:
$$Q = XW_Q, \quad K = XW_K, \quad V = XW_V$$

The attention weights are calculated using **Scaled Dot-Product Attention**:

$$\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V$$

* **Dot-Product ($QK^T$)**: Computes similarity scores between query and key vectors.
* **Scaling Factor ($1/\sqrt{d_k}$)**: Prevents dot-products from growing excessively large for high vector dimensions ($d_k$), which would push the Softmax function into regions with extremely small gradients.
* **Softmax**: Converts scores into a probability distribution summing to 1.
* **Multiplying by $V$**: Mixes the value vectors based on the attention weights.

---

## 2. Multi-Head Attention (MHA)

Rather than performing attention once, **Multi-Head Attention (MHA)** splits the queries, keys, and values into $h$ subspaces. This allows the model to attend to information from different representation subspaces at different positions simultaneously.

$$\text{MHA}(Q, K, V) = \text{Concat}(\text{head}_1, \dots, \text{head}_h)W^O$$
$$\text{where} \quad \text{head}_i = \text{Attention}(QW_i^Q, KW_i^K, VW_i^V)$$

---

## 3. Attention Variants: MHA vs. MQA vs. GQA

As models scaled, storing key-value (KV) states in memory during inference (KV cache) became a major performance bottleneck. This led to alternative attention configurations:

| Attention Type | Description | Memory Footprint | Relative Throughput |
| :--- | :--- | :--- | :--- |
| **Multi-Head Attention (MHA)** | Each query head has its own key and value head. | High | Standard |
| **Multi-Query Attention (MQA)** | All query heads share a single key head and a single value head. | Very Low | High |
| **Grouped-Query Attention (GQA)** | Query heads are grouped, and each group shares one key and one value head. | Low (Balanced) | High |

```
   MHA (Multi-Head)            MQA (Multi-Query)            GQA (Grouped-Query)
   
  Q Q Q Q  K K K K  V V V V        Q Q Q Q  K  V            Q Q Q Q  K K  V V
  │ │ │ │  │ │ │ │  │ │ │ │        │ │ │ │  │  │            ├───┤───┤  │ │  │ │
  H1 H2 H3 H4 (KV Per Head)        All Share One KV          G1   G2  (Shared KV)
```

GQA (used in Llama 3 and Mistral) achieves a middle ground: it matches the performance quality of MHA while matching the high throughput and memory efficiency of MQA.

---

## 4. Causal Masking (Decoder-Only)

In generative tasks, a token should not attend to subsequent tokens. This is enforced by applying a causal mask to the attention matrix before softmax. The mask sets all positions where $j > i$ (future tokens) to $-\infty$:

$$M_{ij} = \begin{cases} 0 & j \le i \\ -\infty & j > i \end{cases}$$
$$\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}} + M\right)V$$

---

## 5. FlashAttention

Standard attention is bounded by memory transfers (it is memory-bandwidth bound). It reads $Q, K, V$ from High Bandwidth Memory (HBM) to GPU SRAM, computes attention weights, writes them back to HBM, and reads them again to multiply by $V$.

**FlashAttention** (Dao et al.) restructures the attention computation by:
* **Tiling**: Loading input blocks into fast SRAM.
* **Recomputation**: Recomputing the attention matrix during the backward pass instead of storing it, avoiding large memory reads/writes.
* **Speedup**: Achieves 2x to 4x execution speedups and scales memory linearly ($O(N)$) with sequence length instead of quadratically ($O(N^2)$).
