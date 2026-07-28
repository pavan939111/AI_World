---
title: GPT-4o — Prompting Guide
service: 01-Language-Models
model: GPT-4o
section: 03-Models
file: Prompting.md
last_updated: 2026-07-28
tags: [language-models, gpt-4o, prompting, guide]
author: Antigravity AI Knowledge Engine
---

# GPT-4o — Prompting Guide

GPT-4o is highly responsive to detailed system configurations, structural guidelines, and contextual grounding. This guide covers the most effective prompting strategies for GPT-4o.

---

## 1. System Prompt Configurations

The **System Prompt** sets the operational parameters, style, role, and safety rules for the model before interaction begins.
* **Role Inhabitation**: Explicitly assign a professional persona (e.g., "You are a database tuning specialist...").
* **Output Guidelines**: Define formatting requirements early (e.g., "Always return code inside markdown blocks; return brief textual explanations...").
* **Behavior Boundaries**: Establish strict safety constraints (e.g., "If the requested information is not present in the provided document, reply with 'Not found'. Do not hallucinate...").

---

## 2. Structural Prompting Patterns

### A. Few-Shot In-Context Learning
Few-shot prompting shows the model concrete examples of the desired input-output format, which is more effective than textual instructions alone.

```text
[System Prompt]
You extract customer names and email addresses from unformatted text, returning them as comma-separated values.

[User Prompt]
Text: "Hi, this is Alice Smith (asmith@email.com). Send me the invoice."
Output: Alice Smith, asmith@email.com

Text: "We need to contact support manager Bob Jones at bjones@office.org."
Output: Bob Jones, bjones@office.org

Text: "Let sales director Charlie Green know (cgreen@sales.co) that we approved the deal."
Output:
```

### B. Chain-of-Thought (CoT) Prompting
For complex logic, mathematical calculations, or multi-step reasoning, instruct the model to display its step-by-step thinking. This reduces cognitive shortcutting errors:

```text
[User Prompt]
If a server cluster handles 500 requests per second with a 15ms latency per request on average, and we add an index that cuts latency by 30% but adds 5% query overhead, what is the new average latency and throughput?

Let's think step-by-step:
1. Calculate the initial latency.
2. Apply the index latency reduction.
3. Apply the query overhead multiplier.
4. Synthesize the final metrics.
```

---

## 3. Formatting & Dividers

* **Delimiter Ingestion**: Use standard delimiters (such as triple backticks ` ``` `, XML tags `<document>`, or horizontal lines `---`) to separate instructions from input text payloads. This prevents the model from treating input payload details as instructions.
* **XML Tags**: Use XML tags to structure prompts (e.g., `<guidelines>`, `<context>`, `<task>`), which improves parsing accuracy when working with long contexts.
