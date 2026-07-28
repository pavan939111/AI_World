---
title: Command R+ — Capabilities
service: 01-Language-Models
model: Command-R-Plus
section: 03-Models
file: Capabilities.md
last_updated: 2026-07-28
tags: [language-models, command-r-plus, capabilities, benchmarks]
author: Antigravity AI Knowledge Engine
---

# Command R+ — Capabilities

Command R+ is optimized for production Retrieval-Augmented Generation (RAG), multilingual instruction compliance, and multi-step tool integration.

---

## 1. Advanced RAG & Citation Formatting

* **Precision Document Grounding**: Designed to digest external context payloads (e.g. database query inputs, API responses) and generate responses with inline citations referencing source materials.
* **Reduction of Hallucinations**: Grounds output facts directly in provided context blocks. The model refuses to answer if information is not found in the documents, rather than hallucinating facts.

---

## 2. Multi-Step Tool Calling (Agents)

* **Recursive Tool Use**: Capable of executing multi-turn tool calling routines. The model can request data from API 1, read the output, structure a subsequent query to API 2, and then compile the final answer.
* **Syntax Resilience**: Retains strong schema formatting in tool outputs, reducing agentic workflow collapse in production environments.

---

## 3. Multilingual Support & Benchmarks

* **Global Languages Coverage**: Optimized for 10 languages: English, French, Spanish, Italian, German, Portuguese, Japanese, Korean, Arabic, and Chinese.

### Model Benchmarks

Command R+ performance metrics:

| Benchmark Evaluation | Command R+ Score | Target Area Measured |
| :--- | :--- | :--- |
| **MMLU** | 75.7% | Multitask academic knowledge. |
| **GSM8K** | 82.6% | Multi-step mathematical reasoning. |
| **HumanEval** | 67.2% | Python coding syntax generation. |
| **GPQA Diamond** | 35.0% | PhD-level science logic queries. |
