---
title: Llama 3.3 70B — Prompting Guide
service: 01-Language-Models
model: Llama-3-3-70B
section: 03-Models
file: Prompting.md
last_updated: 2026-07-28
tags: [language-models, llama-3-3-70b, prompting, template]
author: Antigravity AI Knowledge Engine
---

# Llama 3.3 70B — Prompting Guide

To maximize output quality and instruction following in Llama 3.3 70B, developers should format prompts using Llama 3’s native special chat tokens and templates.

---

## 1. Native Chat Template Structure

Llama 3.3 models use specific tokens to partition system directives, user turns, and assistant replies. If you use raw text inputs (instead of an SDK chat array), formatting must match this pattern:

```text
<|begin_of_text|><|start_header_id|>system<|end_header_id|>

You are a database optimization assistant. Analyze the user's SQL query.<|eot_id|><|start_header_id|>user<|end_header_id|>

SELECT * FROM users WHERE signup_date > '2026-01-01';<|eot_id|><|start_header_id|>assistant<|end_header_id|>
```

### Special Token Definitions
* **`<|begin_of_text|>`**: Declares the start of the sequence.
* **`<|start_header_id|>`** and **`<|end_header_id|>`**: Wraps the role identifier (`system`, `user`, or `assistant`).
* **`<|eot_id|>`**: **End of Turn** indicator. Tells the engine that a participant has finished their message block.

---

## 2. System Instruction Optimization

Llama 3.3 70B is highly sensitive to the `system` context block.
* **Define Constraints Early**: Specify output schemas, disallowed behavior, and rules immediately within the system block.
* **Use Direct Commands**: Use imperative verbs (e.g., "Analyze," "Output," "Translate") rather than passive descriptions.
* **Formatting Indicators**: Instruct the model on how to present code (e.g., "Return code inside standard markdown fences").

---

## 3. Structural Output Parsing

When generating JSON schemas or tables:
* Provide a few-shot markdown example within the prompt to establish structural consistency.
* Llama 3.3 70B is prone to conversational prefixes (e.g., "Sure, here is your JSON:"). Explicitly append: "Return only the raw output block. Do not include conversational greetings or post-explanations." to the end of the user prompt.
