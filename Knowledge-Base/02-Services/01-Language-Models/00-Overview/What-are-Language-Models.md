---
title: Language Models — What are Language Models?
service: 01-Language-Models
section: 00-Overview
file: What-are-Language-Models.md
last_updated: 2026-07-28
tags: [language-models, llm, fundamentals, overview]
author: Antigravity AI Knowledge Engine
---

# What are Language Models?

A **Language Model (LM)** is a probabilistic model designed to predict the likelihood of a sequence of words or tokens. At its core, it models the joint probability distribution of natural language text, allowing computers to generate, analyze, translate, and comprehend human language.

---

## 1. Mathematical Foundation

Mathematically, a language model computes the probability of a sequence of $n$ tokens $W = (w_1, w_2, \dots, w_n)$. Using the probability chain rule, the joint probability of the sequence is expressed as the product of conditional probabilities:

$$P(w_1, w_2, \dots, w_n) = \prod_{i=1}^n P(w_i \mid w_1, w_2, \dots, w_{i-1})$$

In generative models (autoregressive language models), the objective is to predict the probability of the next token $w_i$ given the preceding context $w_1, \dots, w_{i-1}$:

$$P(w_i \mid w_{1}, w_{2}, \dots, w_{i-1})$$

---

## 2. From Statistical to Neural Language Models

The paradigm of language modeling has evolved significantly over recent decades:

### Statistical Language Models (SLMs)
* **Mechanism**: Relied on count-based statistics from large text corpora.
* **N-gram Models**: Evaluated the probability of a word based on a fixed history of $N-1$ words (e.g., bigrams, trigrams).
* **Limitations**: Suffered from the **curse of dimensionality** and struggled with long-range dependencies, as $N$ could rarely exceed 5 due to exponential memory requirements.

### Neural Language Models (NLMs)
* **Mechanism**: Utilize continuous vector representations (word embeddings) and neural networks to project text into low-dimensional semantic spaces.
* **Key Architectures**: 
  * Recurrent Neural Networks (RNNs) and LSTMs introduced variable-length memory.
  * Transformers eliminated sequential execution, introducing parallel self-attention mechanisms.
* **Advantages**: Generalize well to unseen sequences by leveraging semantic similarity in vector space and capturing long-range dependencies across thousands of tokens.

---

## 3. Major Architectural Families

Modern Large Language Models (LLMs) are predominantly based on the **Transformer** architecture and are grouped into three primary configurations:

| Architecture Family | Key Characteristic | Typical Objectives | Prominent Examples |
| :--- | :--- | :--- | :--- |
| **Encoder-Only** | Bidirectional attention (reads left-to-right and right-to-left simultaneously) | Masked Language Modeling (predicting hidden tokens within a sentence) | BERT, RoBERTa |
| **Decoder-Only** | Causal/Autoregressive attention (reads left-to-right, masking future tokens) | Next-token prediction | GPT-4o, Claude 3.7 Sonnet, Gemini 2.5, Llama 3.3 |
| **Encoder-Decoder** | Separate encoder reads input sequence; decoder autoregressively generates output | Sequence-to-sequence translation, summarization | T5, BART |

---

## 4. Key Properties of Large Language Models

As neural language models scaled from millions to billions of parameters, they developed key emergent characteristics:

* **Emergent Abilities**: Behaviors or performance improvements that manifest abruptly at certain scale thresholds (e.g., multi-step logical reasoning, arithmetic, translation).
* **In-Context Learning (ICL)**: The ability of a model to perform a task simply by observing examples provided in its prompt context (few-shot prompting) without any update to its underlying weights.
* **Instruction Following**: Through alignment processes (like RLHF and SFT), models transition from simple next-token completion engines into interactive, goal-oriented assistants capable of following explicit guidelines.
* **Generality**: A single model can handle coding, creative writing, structured data extraction, translation, and logical reasoning, replacing the need for multiple task-specific NLP pipelines.
