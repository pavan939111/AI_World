---
title: Language Models — Logits & Sampling (Temperature, Top-P, Top-K)
service: 01-Language-Models
section: 01-Fundamentals
file: Temperature-and-Top-P.md
last_updated: 2026-07-28
tags: [language-models, llm, temperature, sampling, logits]
author: Antigravity AI Knowledge Engine
---

# Logits & Sampling: Temperature, Top-P, and Top-K

Large Language Models do not generate text directly. Instead, they output raw, unnormalized scores called **logits** for every token in their vocabulary. Sampling parameters determine how these logits are processed to select the next token.

---

## 1. Convert Logits to Probabilities

For a model with vocabulary size $V$, the output of the final layer is a vector of logits $Z = (z_1, z_2, \dots, z_V)$. Applying the standard **Softmax** function maps these logits to a probability distribution where values sum to 1:

$$p_i = \frac{e^{z_i}}{\sum_{j=1}^V e^{z_j}}$$

---

## 2. Temperature Tuning

**Temperature ($T$)** scales the logits before the Softmax function is applied, modifying the shape of the probability distribution:

$$p_i = \frac{e^{z_i / T}}{\sum_{j=1}^V e^{z_j / T}}$$

```
         Low Temperature (T = 0.2)            High Temperature (T = 1.0)
         
          Probability                           Probability
             ▲                                     ▲
             │    █                                │    █
             │    █                                │    █  █
             │    █  █                             │    █  █  █  █
             │    █  █  .  .                       │    █  █  █  █  █  █
             └────────────────►                    └─────────────────►
                   Tokens                                Tokens
             (Highly Deterministic)                    (Creative / Diverse)
```

* **$T \to 0$ (Greedy Decoding / Temperature = 0)**: The probability of the most likely token approaches 1, while all others approach 0. Generation becomes deterministic and reproducible.
* **Low Temperature ($0 < T < 0.5$)**: Concentrates probability mass on the top options. It reduces mistakes and hallucinations, making it ideal for code generation, mathematical reasoning, and factual Q&A.
* **High Temperature ($T > 0.7$)**: Flattens the probability distribution, making less probable tokens more likely to be selected. This increases diversity and creativity but elevates the risk of incoherent text or factual hallucinations.

---

## 3. Sampling Techniques: Top-K and Top-P

To prevent the model from selecting highly improbable "long-tail" tokens (which leads to gibberish), decoding libraries apply filtering before sampling.

### A. Top-K Sampling
* **Mechanism**: Restricts the selection pool to the $K$ tokens with the highest probabilities. For example, if $K=50$, only the top 50 candidates are considered, and the remaining tokens are discarded.
* **Limitation**: A fixed $K$ is rigid. If the top token has a probability of 99%, Top-K still samples from the remaining 49 options, even though they are extremely unlikely.

### B. Top-P (Nucleus Sampling)
* **Mechanism**: Dynamically scales the selection pool. It selects the smallest set of tokens whose cumulative probability exceeds the threshold $p$ (e.g., $p=0.9$ or $90\%$).
* **Benefit**: If the model is highly confident (e.g., the top token has $p=0.95$), the pool shrinks to a single token. If the model is uncertain, the pool expands to include dozens of tokens, ensuring natural variation.

---

## 4. Parameter Settings Guide

| Task Category | Temperature ($T$) | Top-P ($p$) | Rationale |
| :--- | :--- | :--- | :--- |
| **Code Generation & Math** | `0.0` (or `0.1`) | `0.9` | Prefers exact syntax and logical consistency; avoids random variations. |
| **Factual Q&A / RAG** | `0.2` | `0.9` | Maximizes alignment with retrieved context, minimizing hallucination. |
| **Summarization & Translation**| `0.3` - `0.5` | `0.9` | Balances natural sentence structure with alignment to source text. |
| **Creative Writing & Chatbots**| `0.7` - `0.9` | `0.95` | Encourages stylistic variation, conversational tone, and vocabulary diversity. |

> [!NOTE]
> It is recommended to adjust either Temperature or Top-P, but not both simultaneously, as their interactions can make output behavior unpredictable.
