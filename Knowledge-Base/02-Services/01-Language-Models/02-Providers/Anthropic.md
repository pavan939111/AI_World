---
title: Language Models — Anthropic
service: 01-Language-Models
section: 02-Providers
file: Anthropic.md
last_updated: 2026-07-28
tags: [language-models, llm, providers, anthropic, claude]
author: Antigravity AI Knowledge Engine
---

# Anthropic Provider Profile

**Anthropic** is an AI safety and research company founded in 2021 by former OpenAI researchers (including Dario and Daniela Amodei). Anthropic is known for its focus on structural AI alignment, safety research (introducing **Constitutional AI**), and long-context capabilities.

---

## 1. Core Model Roster (Claude Family)

Anthropic’s model family, **Claude**, is categorized into three capability tiers:

* **Claude 3.7 Sonnet**: The state-of-the-art model. It features a hybrid reasoning execution engine, allowing developers to configure the model to run in either "standard mode" (fast generation) or "thinking mode" (allocating test-time compute to run deliberate reasoning steps before outputting).
* **Claude 3.5 Sonnet**: Previous flagship model, highly regarded for coding, system architecture, logic, and long-form writing.
* **Claude 3.5 Haiku**: Extremely fast and cost-effective text model, providing low-latency performance matching older large models (like Claude 3 Opus).
* **Claude 3 Opus**: A larger, older model designed for highly complex cognitive tasks.

---

## 2. Key Developer Features

Anthropic's Developer Console (`console.anthropic.com`) offers several distinct capabilities:

* **Manual Prompt Caching**: Unlike OpenAI's automatic caching, Anthropic allows developers to explicitly set breakpoints (`"cache_control": {"type": "ephemeral"}`) in their system prompts, document injections, or chat histories. This supports caching up to 4 separate segments, offering up to a 90% cost reduction on input tokens and up to a 2x reduction in latency.
* **Computer Use**: A feature of Claude 3.5/3.7 Sonnet that enables the model to interact directly with OS environments. Claude can take screenshots, click buttons, type keys, and run shell commands in an agentic loop, translating natural language requests into computer GUI interactions.
* **XML Tag Optimization**: Anthropic models are trained to utilize XML tags (e.g., `<thinking>`, `<context>`, `<output>`) to structure information. Using XML tags in prompts reduces formatting errors and improves compliance with complex instructions.

---

## 3. Integration Standards

Anthropic uses its own API structure, though third-party services often map it to standard formats.

### Request Payload Example (`/v1/messages`)
```json
{
  "model": "claude-3-7-sonnet-20250219",
  "max_tokens": 1024,
  "system": [
    {
      "type": "text",
      "text": "You are a software tester. Analyze the code blocks using XML tags.",
      "cache_control": {"type": "ephemeral"}
    }
  ],
  "messages": [
    {
      "role": "user",
      "content": "Verify the sorting algorithm in this python script: [script contents...]"
    }
  ],
  "thinking": {
    "type": "enabled",
    "budget_tokens": 1024
  }
}
```
* **Constitutional AI**: Unlike standard RLHF which relies on human evaluation, Anthropic's alignment training aligns models using a written "constitution" (a set of safety principles), making the alignment process transparent and steerable.
