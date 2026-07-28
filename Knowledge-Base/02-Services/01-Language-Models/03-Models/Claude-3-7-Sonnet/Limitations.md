---
title: Claude 3.7 Sonnet — Limitations
service: 01-Language-Models
model: Claude-3-7-Sonnet
section: 03-Models
file: Limitations.md
last_updated: 2026-07-28
tags: [language-models, claude-3-7-sonnet, limitations, safety]
author: Antigravity AI Knowledge Engine
---

# Claude 3.7 Sonnet — Technical Limitations & Safety Guardrails

A guide mapping the operational limits, latency trade-offs, and alignment parameters of Claude 3.7 Sonnet.

---

## 1. Core Technical Limitations

* **Knowledge Cutoff**: The model's static training dataset contains information up to **October 2024**.
* **Reasoning Latency Trade-Off**: Running the model in Thinking Mode increases Time-to-First-Token (TTFT) and overall generation latency, as the model must write out hundreds or thousands of internal thinking tokens before generating the final response.
* **Computer Use Limitations**: When using GUI automation tools:
  * Struggles with highly dynamic visual frames (such as video playback or fast-scrolling pages).
  * Struggles with complex drag-and-drop actions or multi-key shortcut combinations.
  * Capturing visual frames at high frequencies consumes significant API token quotas.
* **Math / Code Compilation Slips**: While highly capable, the model can still introduce logical compilation errors or math calculations slips in deep reasoning paths when the thinking budget is set too low.

---

## 2. API Quotas & Token Caps

* **Max Output Limits**: Standard text completions are strictly capped at **8,192 tokens**. This limit is extended to **16,384 tokens** when `thinking` is enabled (accommodating the combined thinking trace and visible output).
* **Concurrent Caching Limits**: Developers can only set a maximum of **4 cache breakpoints** in a single API request, limiting how granularly they can divide prompt caching segments.

---

## 3. Alignment Refusals & Safety Guardrails

* **Strict Safety Boundaries**: Anthropic aligns models using Constitutional AI. If user inputs touch on prohibited categories (e.g., self-harm, cyberattacks, malware generation, hate speech), the model returns a standardized refusal message.
* **Over-Refusal Behavior**: In some contexts, the model's safety filters exhibit "over-refusal," rejecting benign queries that share vocabulary with sensitive topics (e.g., refusing to analyze a secure codebase because it contains functions named `kill` or `attack`).
