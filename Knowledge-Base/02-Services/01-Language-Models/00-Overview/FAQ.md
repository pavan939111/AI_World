---
title: Language Models — FAQ
service: 01-Language-Models
section: 00-Overview
file: FAQ.md
last_updated: 2026-07-28
tags: [language-models, llm, faq, guide]
author: Antigravity AI Knowledge Engine
---

# Frequently Asked Questions (FAQ)

An answers guide addressing common questions regarding Large Language Models (LLMs), covering design, training, inference, and real-world deployment trade-offs.

---

### Q1: What makes a language model "large"?
**A**: There is no rigid threshold, but modern models are generally considered "large" once they contain billions of parameters (typically beginning at 1B to 7B parameters) and are trained on hundreds of billions or trillions of tokens. At this scale, models demonstrate **emergent abilities**—such as multi-step logical reasoning, math, and code synthesis—that are absent in smaller models (like BERT or GPT-1).

### Q2: Do LLMs actually "understand" language, or are they just predicting the next word?
**A**: From a mechanical standpoint, LLMs are statistical engines optimized for next-token prediction. However, to achieve high accuracy in prediction across varied contexts, models construct complex internal representations of concepts, relationships, grammar, and reasoning patterns. While they do not possess subjective consciousness or intent, they exhibit functional, semantic, and logical reasoning capabilities.

### Q3: What is the difference between open-weights and closed/API-based models?
**A**:
* **Closed/API Models** (e.g., GPT-4o, Claude 3.7 Sonnet):
  * **Pros**: Hosted by providers (no infrastructure management), state-of-the-art reasoning, continuous updates, pay-per-token pricing.
  * **Cons**: Potential API downtime, concerns over data privacy, risk of model changes/deprecations, and token cost accumulation at high volumes.
* **Open-Weights Models** (e.g., Llama 3.3, DeepSeek-V3, Qwen 2.5):
  * **Pros**: Complete control over model weights, hostable locally or on private clouds (high security/data privacy), custom fine-tuning capability, and flat hosting costs.
  * **Cons**: Requires hosting infrastructure (GPUs), high setup and maintenance costs, and requires engineering expertise for serving optimization.

### Q4: Why is context window limit important, and what happens when it is exceeded?
**A**: The context window defines the memory limit of a model in a single inference call. If the history, system prompt, and user query exceed this limit:
* In older systems, the API returns an error or rejects the request.
* In conversational systems, the application must drop earlier tokens (sliding window memory), causing the model to "forget" details from the beginning of the conversation.
* Processing massive contexts increases GPU memory consumption (as KV cache scales linearly or quadratically with context length) and increases time to first token (TTFT).

### Q5: How can hallucinations be prevented in production LLM applications?
**A**: While hallucinations cannot be completely eliminated, they can be minimized using:
1. **Retrieval-Augmented Generation (RAG)**: Providing the model with verified, ground-truth context documents from a vector database before asking it to write an answer.
2. **System Prompts**: Instructing the model to only use the provided context and respond with "I don't know" if the answer is not present.
3. **Structured Outputs**: Forcing the model to output valid JSON conforming to a specific schema (using tools like instructor or JsonSchema parameters).
4. **Low Temperature**: Setting `temperature = 0.0` or `0.1` to enforce deterministic, fact-based token selection.

### Q6: Why are GPUs required for running and training LLMs?
**A**: Language models are based on the Transformer architecture, which relies on matrix multiplications. While a CPU has a few powerful cores optimized for sequential tasks, a GPU contains thousands of smaller cores designed for massive parallel processing. This parallel processing capability allows GPUs to perform the billions of matrix operations required for training and inference in parallel, reducing training times from decades to days, and inference times from minutes to milliseconds.
