---
title: Mistral-Large-2 — Prompting Guide
service: 01-Language-Models
model: Mistral-Large-2
section: 03-Models
file: Prompting.md
last_updated: 2026-07-28
tags: [language-models, mistral-large-2, prompting, guide]
author: Antigravity AI Knowledge Engine
---

# Mistral-Large-2 — Prompting Guide

To maximize output quality and instruction following in Mistral-Large-2, developers format prompts matching Mistral’s native chat markup template structures.

---

## 1. Native Chat Template Structure

Mistral models utilize structural block tokens to define instruction boundaries. If you query raw local weight servers (such as llama.cpp or vLLM) directly, inputs should be formatted matching this sequence:

```text
<s>[INST] You are a database optimization assistant. Analyze the user's SQL query. [/INST] Understood. Please provide the query.</s>[INST] SELECT * FROM users WHERE active = true; [/INST]
```

### Special Token Definitions
* **`<s>`**: Declares the start of the entire text sequence.
* **`</s>`**: Declares the end of the text sequence.
* **`[INST]`** and **`[/INST]`**: Wraps the instructions block. Content inside the inst tags tells the model what execution rules to follow. Anything outside represents the model's generated conversational replies.

---

## 2. System Directives Formatting

* **Enforce Clean Role Blocks**: Clearly define system constraints inside the instruction block.
* **Avoid Wordiness**: Write direct imperative instructions. (e.g., "Refactor the function using list comprehension" rather than "Could you rewrite the code?").
* **Structural Separators**: Use triple backticks (`````) or XML tags to isolate dynamic code variables from static instruction directives.
