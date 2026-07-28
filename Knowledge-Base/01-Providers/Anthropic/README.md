---
title: Anthropic — Complete Technical Specification & Provider Reference
provider: Anthropic
view: By Provider
last_updated: 2026-07-28
tags: [anthropic, claude, claude-3-7-sonnet, mcp, computer-use, prompt-caching]
author: Antigravity AI Documentation Engine
---

# Anthropic — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Anthropic PBC
- **Parent Company**: Anthropic PBC (Public Benefit Corporation)
- **Founders**: Dario Amodei (CEO), Daniela Amodei (President), Tom Brown, Chris Olah, Sam McCandlish, Jack Clark, Jared Kaplan
- **Headquarters**: San Francisco, California, USA
- **Year Founded**: 2021 (Founded by former OpenAI research executives)
- **Mission**: To build reliable, interpretable, and steerable AI systems that benefit humanity.
- **Valuation & Funding**: $40 Billion+ valuation with $4B+ from Amazon and $2B+ from Google.
- **AI Ecosystem**: Full-stack enterprise intelligence ecosystem providing foundation models (Claude 3.7 Sonnet, Claude 3.5 Haiku, Claude 3 Opus), Claude Code CLI agent developer platform, Model Context Protocol (MCP), Computer Use API, and Constitutional AI alignment framework.
- **Timeline & Major Milestones**:
  - **2021**: Founded as a Public Benefit Corporation in San Francisco.
  - **March 2023**: Launched Claude 1.0.
  - **July 2023**: Released Claude 2.0 with a 100,000 token context window.
  - **March 2024**: Announced Claude 3 Model Family (Opus, Sonnet, Haiku) introducing a 200,000 token context window.
  - **June 2024**: Released Claude 3.5 Sonnet setting new industry benchmarks in coding and reasoning.
  - **October 2024**: Released Computer Use API and Ephemeral Prompt Caching (90% discount).
  - **November 2024**: Open-sourced Model Context Protocol (MCP).
  - **February 2025**: Released Claude 3.7 Sonnet introducing hybrid reasoning with customizable extended thinking budgets up to 128,000 tokens.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Language Models** | Frontier reasoning, code generation, and long-context dialogue | Yes | Claude 3.7 Sonnet, Claude 3.5 Haiku, Claude 3 Opus | Active |
| **Extended Thinking** | Hybrid reasoning allowing custom thinking budgets up to 128k tokens | Yes | Claude 3.7 Sonnet | Active |
| **Vision Understanding** | Image inspection, screenshot parsing, OCR, and diagram analysis | Yes | Claude 3.7 Sonnet, Claude 3.5 Haiku | Active |
| **PDF Document Parsing** | Native multi-page PDF document ingestion inside Messages API | Yes | Claude 3.7 Sonnet | Active |
| **Computer Use** | Autonomous desktop GUI navigation (clicking, typing, screenshot QA) | Yes | Claude 3.7 Sonnet | Active |
| **MCP Protocol** | Open standard connecting LLMs to local/remote tools & data stores | Yes | Model Context Protocol (MCP) | Active |
| **Prompt Caching** | Storing static system prompts for a **90% discount** on cached inputs | Yes | Messages API (`cache_control`) | Active |
| **Message Batches** | Asynchronous batch job execution with a **50% pricing discount** | Yes | `/v1/messages/batches` | Active |
| **Claude Code CLI** | Agentic CLI coding assistant for multi-file repo refactoring | Yes | Claude Code CLI Tool | Active |
| **Tool Use** | Parameter extraction and structured function execution loops | Yes | Messages API (`tools`) | Active |
| **Constitutional AI** | Safety alignment via RLAIF and explicit constitutional principles | Yes | All Claude Models | Active |

---

# 3. Language Models

### Model: Claude 3.7 Sonnet
- **Name**: Claude 3.7 Sonnet (`claude-3-7-sonnet-20250219`)
- **Release Date**: February 19, 2025
- **Family**: Hybrid Reasoning & Coding Flagship
- **Context Window**: 200,000 tokens
- **Input Modalities**: Text, Vision (JPEG, PNG, WEBP), PDF Documents
- **Output Modalities**: Text, JSON Schema, Function Calls
- **Services Provided by the Model**:
  - **Customizable Extended Thinking**: Seamlessly toggle between instant responses and extended thinking up to 128,000 reasoning tokens (`thinking: { type: 'enabled', budget_tokens: 16000 }`).
  - **Claude Code CLI Integration**: Powering autonomous multi-file codebase refactoring and debugging.
  - **Computer Use API**: Controlling desktop OS GUIs (clicking, typing, taking screenshots).
  - **Ephemeral Prompt Caching**: 90% discount on cached inputs ($0.30 / 1M read rate).
  - **Message Batches**: 50% discount on 24-hour asynchronous batch queries.
  - **Native PDF Document Ingestion**: Ingesting complex multi-page PDF files directly into prompt messages.
- **Best Use Cases**: Agentic software development, complex legal contract analysis, PhD-level math reasoning, desktop GUI automation.
- **Strengths**: #1 coding benchmark performance, customizable thinking budget, 90% prompt caching savings, native MCP support.
- **Limitations**: Max output tokens capped at 8,192 for standard completions (extended thinking can scale to 128k).
- **Pricing**: $3.00 / 1M input tokens | $15.00 / 1M output tokens ($0.30 / 1M cached input read).
- **Availability**: Anthropic Console API (`/v1/messages`), AWS Bedrock, GCP Vertex AI.

### Model: Claude 3.5 Haiku
- **Name**: Claude 3.5 Haiku (`claude-3-5-haiku-20241022`)
- **Release Date**: October 2024
- **Family**: High-Speed Cost-Effective Multimodal
- **Context Window**: 200,000 tokens
- **Input Modalities**: Text, Vision
- **Output Modalities**: Text, JSON Schema
- **Services Provided by the Model**:
  - **High-Throughput Low Latency Execution**: Fast text and vision inference for production APIs.
  - **Prompt Caching & Message Batches**: 90% input cache discount and 50% batch discount.
- **Best Use Cases**: High-volume classification, simple chat, fast summary generation, content filtering.
- **Pricing**: $0.80 / 1M input tokens | $4.00 / 1M output tokens ($0.08 / 1M cached input read).

---

# 4. Model Context Protocol (MCP)

The **Model Context Protocol (MCP)** is an open standard created by Anthropic that standardizes how applications provide context and tools to LLMs. MCP replaces fragmented custom integrations with a clean Client-Host-Server architecture.

```python
# MCP Server Tool Execution Example via Anthropic SDK
import anthropic

client = anthropic.Anthropic()
response = client.messages.create(
    model="claude-3-7-sonnet-20250219",
    max_tokens=4096,
    messages=[{"role": "user", "content": "Fetch active user count from DB."}],
    tools=[{
        "name": "query_postgres",
        "description": "Execute read-only SQL query on Postgres database",
        "input_schema": {
            "type": "object",
            "properties": {"sql": {"type": "string"}},
            "required": ["sql"]
        }
    }]
)
```

---

# 5. Ephemeral Prompt Caching (90% Discount)

Anthropic supports **Ephemeral Prompt Caching** on system prompts, tools, and user messages.

- **Cache Lifetime**: 5 minutes (refreshed automatically on each hit).
- **Minimum Cache Length**: 1,024 tokens (Claude 3.7 Sonnet) / 2,048 tokens (Claude 3.5 Haiku).
- **Cost**:
  - Cache Write: $3.75 / 1M tokens (+25% premium)
  - Cache Read: **$0.30 / 1M tokens (90% discount!)**

```python
# Python Prompt Caching Example
response = client.messages.create(
    model="claude-3-7-sonnet-20250219",
    max_tokens=4096,
    system=[
        {
            "type": "text",
            "text": "Large static system prompt with codebase context...",
            "cache_control": {"type": "ephemeral"}  # Enables 90% discount on cache hits
        }
    ],
    messages=[{"role": "user", "content": "Refactor function X."}]
)
```

---

# 6. Pricing Summary

| Model | Input Rate / 1M | Cache Read Rate / 1M (90% Off) | Output Rate / 1M |
| :--- | :--- | :--- | :--- |
| **Claude 3.7 Sonnet** | $3.00 | $0.30 | $15.00 |
| **Claude 3.5 Haiku** | $0.80 | $0.08 | $4.00 |
| **Claude 3 Opus** | $15.00 | $1.50 | $75.00 |

---

# 7. Authentication

All requests to the Anthropic Messages API require the secret key in the `x-api-key` header and the API version header:

```http
x-api-key: sk-ant-api03-...
anthropic-version: 2023-06-01
content-type: application/json
```

---

# 8. Official References

- Official Anthropic Documentation: [docs.anthropic.com](https://docs.anthropic.com)
- Model Context Protocol (MCP) Specification: [modelcontextprotocol.io](https://modelcontextprotocol.io)
- Anthropic Console: [console.anthropic.com](https://console.anthropic.com)
