---
title: Language Models — Tokenization
service: 01-Language-Models
section: 01-Fundamentals
file: Tokenization.md
last_updated: 2026-07-28
tags: [language-models, llm, tokenization, vocabulary]
author: Antigravity AI Knowledge Engine
---

# Tokenization

**Tokenization** is the process of translating raw text strings into a sequence of integer IDs (tokens) that a neural network can process. It is the first step in the LLM ingestion pipeline and the final step in the output generation pipeline.

---

## 1. Subword Tokenization Algorithms

To balance vocabulary size with the ability to represent unseen words, modern LLMs use **subword tokenization**. Rather than mapping entire words or individual characters, they split text into common subword combinations.

### A. Byte-Pair Encoding (BPE)
* **Mechanism**: 
  1. Starts with a base vocabulary of individual characters and byte values.
  2. Iteratively identifies the most frequent pair of adjacent bytes in the training corpus.
  3. Merges the pair to form a new subword token.
  4. Repeats this process until the target vocabulary size is reached.
* **Examples**: GPT series (tiktoken), Llama series, Mistral.

### B. WordPiece
* **Mechanism**: Similar to BPE, but instead of choosing the most frequent byte pair, it selects merges that maximize the likelihood of the training data according to a unigram language model.
* **Examples**: BERT, RoBERTa.

### C. Unigram
* **Mechanism**: 
  1. Starts with a very large vocabulary of subwords and words.
  2. Iteratively removes subwords that contribute the least to the overall training corpus likelihood.
  3. Repeats until it matches the target vocabulary size.
* **Examples**: T5, SentencePiece.

---

## 2. Vocabulary Size Trade-offs

The total number of unique tokens a model can recognize is its **Vocabulary Size ($V$)**. Choosing $V$ involves a key performance trade-off:

| Vocabulary Size | Impact on Embedding / Logits Layers | Sequence Length / Efficiency | Typical Usage |
| :--- | :--- | :--- | :--- |
| **Small Vocab (e.g., 32,000)** | Small GPU memory footprint; fast logits calculation. | Words are split into more subwords, increasing context token counts for a given text. | Llama 1 & 2, Mistral 7B |
| **Large Vocab (e.g., 128,000 - 256,000)** | Large embedding matrix; slower output projection layer. | Compresses text into fewer tokens, saving context window space and increasing throughput. | Llama 3 (128k), Gemma (256k) |

---

## 3. Tokenizer Anomalies & Performance Pitfalls

Tokenizers operate independently of the neural network's semantic layers, introducing several system quirks:

* **The Non-English Penalty**: BPE tokenizers are often trained predominantly on English text. Non-English languages (especially those with non-Latin scripts, like Hindi, Chinese, or Arabic) are split into much smaller fragments. A single concept that takes 1 token in English might take 4–6 tokens in another language, increasing latency and API costs.
* **"SolidGoldMagikarp" (Glitch Tokens)**: Tokens that appeared in the pre-training dataset (like username strings or Reddit handles) but were filtered out or never appeared in the instruction-tuning data. Because they have never been trained with assistant patterns, passing them in prompts can cause models to hallucinate or generate gibberish.
* **Code & White Spaces**: Writing code requires precise indentation. If a tokenizer represents 4 spaces as 4 separate tokens instead of a single merged "4-space" token, code generation becomes slower and consumes more context window space. Modern tokenizers optimize this by merging consecutive whitespace characters.
* **Numbers & Arithmetic**: If a tokenizer splits numbers unpredictably (e.g., representing "9831" as `["98", "31"]` in one context and `["9", "831"]` in another), the model's ability to learn arithmetic representations is severely degraded.
