---
title: Language Models — AI Terminology
service: 01-Language-Models
section: 00-Overview
file: AI-Terminology.md
last_updated: 2026-07-28
tags: [language-models, llm, terminology, glossary]
author: Antigravity AI Knowledge Engine
---

# AI & LLM Terminology

A glossary of key concepts, technical terms, and metrics used in the development, optimization, and deployment of Large Language Models (LLMs).

---

## 1. Core Model & Data Concepts

* **Token / Tokenization**: The process of breaking down text into smaller units (characters, subwords, or words) that can be processed by a neural network. On average, 1 token corresponds to approximately 0.75 English words.
* **Context Window (Context Length)**: The maximum number of tokens a model can process in a single request (combining the system prompt, user prompt, history, and generated output). Exceeding this limit causes the model to lose track of earlier parts of the conversation.
* **Parameters**: The internal variables (weights and biases) of the neural network that are adjusted during training. Parameter count (e.g., 8B, 70B) is a key indicator of model capacity.
* **Active vs. Total Parameters**: In Mixture-of-Experts (MoE) architectures, the total parameters represent all weights within the model, while the active parameters represent the subset of weights executed for any single token.

---

## 2. Generation & Decoding Parameters

* **Temperature**: A hyperparameter that scales the logits (raw outputs) of the model's prediction head before applying the softmax function. Lower values (e.g., 0.1 - 0.3) force the model to pick highly probable tokens, making outputs deterministic and factual. Higher values (e.g., 0.7 - 1.0) increase diversity, making outputs more creative.
* **Top-P (Nucleus Sampling)**: A decoding technique that selects from the smallest subset of tokens whose cumulative probability exceeds the threshold $p$ (e.g., $p=0.9$).
* **Top-K**: A decoding technique that limits the candidate pool to the $k$ most probable next tokens.
* **Hallucination**: A phenomenon where a model generates text that is grammatically correct but factually incorrect, nonsensical, or ungrounded in the source context.

---

## 3. Training & Adaptation Techniques

* **Supervised Fine-Tuning (SFT)**: The process of training a pre-trained base model on instruction-following datasets to align its outputs with an assistant behavior.
* **Reinforcement Learning from Human Feedback (RLHF)**: An alignment method that uses human feedback rankings to optimize a model's policy, steering it toward safe and helpful outputs.
* **LoRA (Low-Rank Adaptation)**: A Parameter-Efficient Fine-Tuning (PEFT) method that freezes pre-trained model weights and injects small, trainable rank decomposition matrices, reducing GPU memory requirements during training by up to 90%.
* **QLoRA (Quantized LoRA)**: An extension of LoRA where the base model is quantized (typically to 4-bit) before adding the LoRA adapters, allowing fine-tuning of large models on consumer-grade GPUs.

---

## 4. Inference & Serving Metrics

* **KV Cache (Key-Value Cache)**: A GPU memory buffer that stores key and value states of attention layers for previously processed tokens, avoiding redundant computations and reducing output generation time.
* **Time to First Token (TTFT)**: The time elapsed between sending a prompt to the model and receiving the first output token. A key latency metric in user experience.
* **Time Per Output Token (TPOT)**: The average time taken to generate each subsequent token after the first token has been produced. Equivalent to the inverse of Tokens Per Second (TPS).
* **Quantization**: Compressing a model's weights from higher precision floating-point types (like FP16) to lower precision types (like FP8 or INT4) to save memory and increase throughput.
* **Retrieval-Augmented Generation (RAG)**: A framework that connects an LLM to external data sources (e.g., vector databases) to retrieve relevant context before generation, reducing hallucinations and providing access to real-time or private information.
