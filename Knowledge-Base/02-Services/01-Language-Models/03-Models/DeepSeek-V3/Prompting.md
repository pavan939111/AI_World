---
title: DeepSeek-V3 — Prompting Guide
service: 01-Language-Models
model: DeepSeek-V3
section: 03-Models
file: Prompting.md
last_updated: 2026-07-28
tags: [language-models, deepseek-v3, prompting, guide]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-V3 — Prompting Guide

To optimize response quality and leverage DeepSeek’s automatic server caching, developers should follow specific prompt layouts.

---

## 1. Structuring Prompts for Automatic Caching

DeepSeek Cloud manages prompt caching automatically at the token boundary, checking for matching string prefixes. To maximize cache hits:

* **Static Block at the Beginning**: Put all static components (system commands, formatting rules, tool schemas, or large context files) at the very start of the prompt array.
* **Keep Dynamic Blocks at the End**: Place active query variables, chat session history, and dynamic content at the end of the prompt array.
* **Avoid Variable Headers**: Do not add dynamic session headers (such as dates, times, or unique transactional IDs) inside the static system prefix block. Any change to the text preceding a block invalidates the cache for all subsequent blocks.

```text
[Static Segment - CACHED]
System: You are an API documentation assistant. Format responses using Markdown.
Context Library: [Static background files...]

[Dynamic Segment - DYNAMIC]
User: Search the context library and extract endpoint parameters for model X.
```

---

## 2. Direct Instruction Guidelines

DeepSeek-V3 responds best to direct, concise system instructions:

* **Avoid Fluff**: Do not pad instructions with conversational phrases. Write direct imperative commands (e.g., "Summarize the text in 3 bullet points" rather than "Please be so kind as to write a summary...").
* **Use Standard Separators**: Use triple backticks (`````) or XML tags to clearly separate data inputs from instructions.
* **Limit Preambles**: Instruct the model to skip introductory text (e.g., "Return only the JSON object. Do not include introductory text or follow-up explanations.").
