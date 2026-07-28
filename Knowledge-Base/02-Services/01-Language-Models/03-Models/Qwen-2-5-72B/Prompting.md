---
title: Qwen 2.5 72B — Prompting Guide
service: 01-Language-Models
model: Qwen-2-5-72B
section: 03-Models
file: Prompting.md
last_updated: 2026-07-28
tags: [language-models, qwen-2-5-72b, prompting, template]
author: Antigravity AI Knowledge Engine
---

# Qwen 2.5 72B — Prompting Guide

Optimizing prompts for Qwen 2.5 72B requires formatting inputs matching Qwen’s native Chat Markup Language (ChatML) templates.

---

## 1. Native ChatML Format Structure

Qwen models utilize custom tokens to delimit conversational turns and roles. If you query raw weight servers without using high-level SDK chat arrays, your text files must conform to the ChatML sequence:

```text
<|im_start|>system
You are a code refactoring assistant. Keep answers concise.<|im_end|>
<|im_start|>user
Refactor the following loop:
for i in range(len(arr)):
    print(arr[i])<|im_end|>
<|im_start|>assistant
```

### ChatML Token Definitions
* **`<|im_start|>`**: Declares the start of an input turn segment. Followed immediately by the role name (`system`, `user`, or `assistant`).
* **`<|im_end|>`**: Declares the end of the turn segment, telling the inference engine that input for that role has completed.

---

## 2. System Instruction Optimization

Qwen 2.5 72B exhibits strong adherence to instructions:
* **State Output Schemes Early**: Detail JSON or markdown formats directly inside the system block.
* **Define Formatting Restraints**: Instruct the model to exclude conversational preambles (e.g., "Return only the code block. Do not include chat explanations.").

---

## 3. Structural Output Prompts

Due to its dense architecture, Qwen 2.5 72B complies well with structured validation rules:
* Include brief, few-shot markdown tables or JSON mock objects inside the user prompt to establish layout consistency.
* Use triple backticks (`````) or XML wrappers to cleanly separate instruction parameters from raw datasets.
