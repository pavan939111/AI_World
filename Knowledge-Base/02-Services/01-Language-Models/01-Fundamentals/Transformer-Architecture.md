---
title: Language Models — Transformer Architecture
service: 01-Language-Models
section: 01-Fundamentals
file: Transformer-Architecture.md
last_updated: 2026-07-28
tags: [language-models, llm, transformer, architecture]
author: Antigravity AI Knowledge Engine
---

# Transformer Architecture

The **Transformer** (introduced by Vaswani et al. in 2017) is the core architecture powering almost all modern Large Language Models. By replacing sequential recurrence (RNNs/LSTMs) with a parallelized self-attention mechanism, the Transformer enabled models to capture dependencies across long contexts and train efficiently on massive datasets.

---

## 1. Architectural Styles

Depending on how attention is masked, Transformers are divided into three primary configurations:

1. **Encoder-Only (Bidirectional)**:
   * Processes the entire input sequence simultaneously (no masking).
   * Generates contextual representations of tokens.
   * *Examples*: BERT, RoBERTa.
2. **Decoder-Only (Causal/Autoregressive)**:
   * Masks future tokens using causal masking, allowing attention only to past and current tokens.
   * Generates text token-by-token autoregressively.
   * *Examples*: GPT-4o, Claude 3.7 Sonnet, Gemini 2.5, Llama 3.3.
3. **Encoder-Decoder (Seq2Seq)**:
   * A bidirectional encoder processes input, and a causal decoder generates output while attending to encoder states.
   * *Examples*: T5, BART.

---

## 2. Key Components of a Decoder-Only Layer

A modern decoder-only Transformer model consists of a stack of $N$ identical layers. Each layer contains the following sub-components:

```
Input Token IDs
      │
      ▼
[Input Embeddings + Positional Embeddings]
      │
      ├─────────────────────────┐
      ▼ (Residual)              │
[Layer Normalization / RMSNorm] │
      │                         │
      ▼                         │
[Causal Self-Attention]         │
      │                         │
      ▼                         │
[Dropout / Projection]          │
      │                         │
      ▼                         │
      + <───────────────────────┘ (Residual Addition)
      │
      ├─────────────────────────┐
      ▼ (Residual)              │
[Layer Normalization / RMSNorm] │
      │                         │
      ▼                         │
[Feed-Forward Network (SwiGLU)] │
      │                         │
      ▼                         │
[Dropout / Projection]          │
      │                         │
      ▼                         │
      + <───────────────────────┘ (Residual Addition)
      │
      ▼
To Next Transformer Layer (or Output Head)
```

### A. Input Embeddings & Positional Embeddings
Because Transformers process tokens in parallel, they have no built-in sense of order.
* **Input Embeddings**: Map token IDs to continuous vectors of dimension $d_{\text{model}}$.
* **Positional Embeddings**: Vectors containing position information are added to or injected into the token embeddings. Modern models use relative embeddings (such as Rotary Position Embeddings - RoPE) rather than Vaswani's absolute sinusoidal embeddings.

### B. Layer Normalization & RMSNorm
Normalization stabilizes training by keeping activations at a consistent scale.
* **Pre-LN vs. Post-LN**: Original Transformers used Post-LN (normalizing after residual additions). Modern LLMs use Pre-LN (normalizing before entering attention/FFN blocks), which improves training stability.
* **RMSNorm (Root Mean Square Normalization)**: Many modern models (e.g., Llama) replace standard LayerNorm with RMSNorm. It scales inputs based on their root mean square, reducing computation by omitting the mean calculation step:
  $$\text{RMSNorm}(x_i) = \frac{x_i}{\sqrt{\frac{1}{d} \sum_{j=1}^d x_j^2 + \epsilon}} \gamma_i$$

### C. Multi-Head Causal Attention
Allows tokens to selectively attend to other tokens in their history. Causal masking (setting future token attention weights to $-\infty$ before softmax) prevents the model from looking ahead.

### D. Feed-Forward Networks & SwiGLU
The output of the attention block is passed to a Feed-Forward Network (FFN) that operates on each token position independently.
* **SwiGLU Activation**: Modern models replace standard ReLU or GELU activations with SwiGLU (Swish Gated Linear Unit). It multiplies two linear projections, one of which is gated with a Swish/SiLU function:
  $$\text{SwiGLU}(x) = \left( xW_1 \cdot \text{swish}(xW_2) \right) W_3$$

### E. Residual Connections
Skip connections add the input of a sub-layer directly to its output ($x + \text{SubLayer}(x)$). This allows gradients to flow directly back through the network, preventing vanishing gradients in deep models.
