---
title: Claude 3.7 Sonnet — Prompting Guide
service: 01-Language-Models
model: Claude-3-7-Sonnet
section: 03-Models
file: Prompting.md
last_updated: 2026-07-28
tags: [language-models, claude-3-7-sonnet, prompting, guide, xml]
author: Antigravity AI Knowledge Engine
---

# Claude 3.7 Sonnet — Prompting Guide

This guide details optimization strategies for prompting Claude 3.7 Sonnet, including XML tag formatting, caching control, and setting thinking budgets.

---

## 1. Structural Prompting with XML Tags

Claude models are pre-trained specifically to interpret and organize text using XML tags. Using XML structure separates instructions, data, and examples, improving compliance:

```text
<system>
You are a senior software architect. Analyze the provided codebase files for memory leaks.
</system>

<rules>
- Exclude test files.
- Return output inside the designated <output> tags.
</rules>

<context>
Here is the memory allocator code:
<code_block>
[source code here...]
</code_block>
</context>

<task>
Identify any potential double-free issues in the code.
</task>
```

---

## 2. Managing the Thinking Budget

When using Thinking Mode, select the appropriate `budget_tokens` based on the complexity of the task:

* **Low Budget (1,024 - 2,048 tokens)**:
  * **Use Cases**: Basic code refactoring, identifying simple syntax errors, translating short scripts, or basic mathematical calculations.
  * **Benefits**: Keeps execution latency low while still providing self-correction capability.
* **High Budget (4,096 - 8,192+ tokens)**:
  * **Use Cases**: Verifying complex cryptographic protocols, reverse-engineering files, optimizing database queries with multiple joins, or solving advanced competition math.
  * **Trade-off**: Increases token costs and latency, but maximizes logical reasoning depth.

---

## 3. Explicit Ephemeral Cache Insertion

To utilize prompt caching, place the cache control header at structural breakpoints inside your request payload.

### Caching Layout Strategy
1. **First Segment**: System instructions and tools list. Place the first `cache_control` block here.
2. **Second Segment**: Large background document corpus or codebase files. Place the second `cache_control` block at the end of this segment.
3. **Third Segment**: Conversational history blocks.
4. **Fourth Segment**: The active user query.

```json
"system": [
  {
    "type": "text",
    "text": "You are a legal analysis bot...",
    "cache_control": {"type": "ephemeral"}
  }
]
```
> [!TIP]
> Prompt fragments placed *after* a cache breakpoint will not invalidate the cache of segments preceding it. This allows query-by-query changes to only execute the cheap cached read step on the large background document corpus.
