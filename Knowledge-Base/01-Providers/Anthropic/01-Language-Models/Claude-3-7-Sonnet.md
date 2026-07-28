---
title: Anthropic — Claude 3.7 Sonnet Model Specification & Hybrid Reasoning Guide
provider: Anthropic
capability: 01-Language-Models
file: Claude-3-7-Sonnet.md
last_updated: 2026-07-28
tags: [anthropic, claude-3-7-sonnet, hybrid-reasoning, mcp, computer-use]
author: Antigravity AI Documentation Engine
---

# Anthropic — Claude 3.7 Sonnet Model Specification & Hybrid Reasoning Guide

## 1. Overview
**Claude 3.7 Sonnet** is Anthropic's flagship foundation model introducing **Hybrid Reasoning**. It allows developers to dynamically toggle between instant, low-latency completions and extended chain-of-thought thinking with customizable reasoning token budgets up to 128,000 tokens.

---

## 2. Model & Feature Specifications

- **Model Identifier**: `claude-3-7-sonnet-20250219`
- **Model Family**: Anthropic Claude 3.7 Series
- **Release Date**: February 19, 2025
- **Supported Input Modalities**: Text, Vision (JPEG, PNG, WEBP), Native PDF Documents
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 200,000 tokens
- **Max Thinking Budget**: Up to 128,000 tokens (`thinking: { type: 'enabled', budget_tokens: 16000 }`)
- **Pricing**:
  - Input Tokens: $3.00 / 1M tokens
  - Cache Write Rate: $3.75 / 1M tokens
  - Cache Read Rate: $0.30 / 1M tokens (90% discount!)
  - Output Tokens: $15.00 / 1M tokens
- **API Availability**: Anthropic Console API (`/v1/messages`), AWS Bedrock, GCP Vertex AI
- **Streaming Support**: Yes — Server-Sent Events (`text/event-stream`)
- **Computer Use API**: Supported
- **Model Context Protocol (MCP)**: Supported

---

## 3. Extended Thinking Code Example

```python
import os
import anthropic

client = anthropic.Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))

response = client.messages.create(
    model="claude-3-7-sonnet-20250219",
    max_tokens=20000,
    thinking={
        "type": "enabled",
        "budget_tokens": 16000  # Custom extended thinking token budget
    },
    messages=[
        {"role": "user", "content": "Prove whether there are infinitely many prime numbers of the form 4n + 3."}
    ]
)

for block in response.content:
    if block.type == "thinking":
        print("Internal Chain-of-Thought:")
        print(block.thinking)
    elif block.type == "text":
        print("\nFinal Solution:")
        print(block.text)
```
