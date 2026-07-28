---
title: Gemini 2.5 Pro — Capabilities
service: 01-Language-Models
model: Gemini-2-5-Pro
section: 03-Models
file: Capabilities.md
last_updated: 2026-07-28
tags: [language-models, gemini-2-5-pro, capabilities, vision, video, benchmarks]
author: Antigravity AI Knowledge Engine
---

# Gemini 2.5 Pro — Capabilities

Gemini 2.5 Pro sets a high bar for long-context ingestion, native media interpretation, and web-grounded text generation.

---

## 1. Native Multimodal Interpretation

* **Video Processing**: Ingests video files directly (up to 1 hour of video). The model samples video frames at up to 1 frame per second natively, retaining visual motion details, timing information, and scene transitions without requiring text transcriptions.
* **Audio Waveform Parsing**: Ingests raw audio waveforms (supporting MP3, WAV, etc., up to 20 hours). It captures vocal inflections, pitch, pauses, background sound effects, and speaker variations directly.
* **Visual Document Analysis**: Demonstrates high accuracy in OCR, complex layout extraction, map coordinate reading, and scientific diagram interpretation.

---

## 2. In-Context Code & Text Ingestion

* **2M Token Limit Capacity**: Allows developers to bypass traditional vector search (RAG) structures for moderate-sized codebases or document collections. You can load:
  * Over 60,000 lines of source code.
  * Over 1.5 Million words of documentation.
  * Dozens of dense research papers or financial books.
  * The model maintains high recall and synthesis capabilities across the entire window.

---

## 3. Cognitive & Technical Benchmarks

Gemini 2.5 Pro ranks highly across key industry evaluations:

| Evaluation Dataset | Score (Gemini 2.5 Pro) | Capabilities Evaluated |
| :--- | :--- | :--- |
| **MMLU** | 90.1% | Multitask general knowledge and academic logic. |
| **MATH** | 80.5% | Multi-step complex mathematical reasoning. |
| **GPQA** | 56.2% | Graduate-level PhD scientific queries. |
| **HumanEval** | 91.2% | Python coding syntax generation. |
| **Video-MME** | 82.3% | Advanced multimodal visual video understanding. |

---

## 4. Google Search Grounding

* **Live Data Access**: Grounding connects the model directly to Google Search. When queried, it generates query terms, scrapes the web results, checks the facts, and appends reference source links to the output.
