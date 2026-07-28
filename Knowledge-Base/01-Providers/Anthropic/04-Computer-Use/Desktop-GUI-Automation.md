---
title: Anthropic â€” Desktop-GUI-Automation Specification
provider: Anthropic
capability: 04-Computer-Use
file: Desktop-GUI-Automation.md
last_updated: 2026-07-28
tags: [anthropic, claude, 04-computer-use, desktop-gui-automation]
author: Antigravity AI Documentation Engine
---

# Anthropic â€” Desktop-GUI-Automation

## Overview
Detailed technical specification for **Desktop-GUI-Automation** under **04-Computer-Use**.

## Model & Feature Specifications
- **Model Family**: Anthropic Claude 3 / 3.5 / 3.7 Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Vision (JPEG, PNG, WEBP), PDF Documents
- **Supported Output Modalities**: Text, JSON Schema, Function Calls
- **Context Window**: 200,000 tokens
- **Max Output**: 8,192 to 128,000 thinking tokens (Claude 3.7 Sonnet)
- **Pricing**: .00 / 1M input | .00 / 1M output (Sonnet)
- **API Availability**: Anthropic Console API (/v1/messages), AWS Bedrock, GCP Vertex AI
- **Streaming Support**: SSE (	ext/event-stream)
- **Function Calling**: Supported (Tool Use)
- **Prompt Caching**: Supported (cache_control: { type: 'ephemeral' } - 90% discount)

## Typical Use Cases
1. Claude Code CLI agentic coding & refactoring.
2. Computer Use desktop GUI automation.

## Strengths & Limitations
- **Strengths**: Extended hybrid thinking budget up to 128k tokens, 90% prompt caching discount, Model Context Protocol (MCP), native PDF parsing.
- **Limitations**: No native text-to-image API directly inside Messages API.

## Example Request
`python
import os
import anthropic

client = anthropic.Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))
print("Executing Desktop-GUI-Automation query...")
`

## Related Documentation & Models
- See official Anthropic documentation at https://docs.anthropic.com
