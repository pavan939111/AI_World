---
title: OpenAI — GPT-4o Model Specification & Engineering Guide
provider: OpenAI
capability: 01-Language-Models
file: GPT-4o.md
last_updated: 2026-07-28
tags: [openai, gpt4o, llm, multimodal, vision]
author: Antigravity AI Documentation Engine
---

# OpenAI — GPT-4o Model Specification & Engineering Guide

## 1. Overview
**GPT-4o** ("omni") is OpenAI's flagship omnimodal foundation model. It processes text, visual imagery, document layouts, and audio natively in a unified attention architecture, delivering high intelligence at double the speed of GPT-4 Turbo at half the cost.

---

## 2. Model & Feature Specifications

- **Model Identifier**: `gpt-4o-2024-08-06` / `gpt-4o-2024-11-20`
- **Model Family**: GPT Omnimodal Flagship Series
- **Release Information**: Production Release (May 13, 2024; Updated Aug/Nov 2024)
- **Supported Input Modalities**: Text, Images (JPEG, PNG, WEBP), Audio (via Realtime API)
- **Supported Output Modalities**: Text, JSON Schema, Audio (via Realtime API)
- **Context Window**: 128,000 tokens
- **Max Output Tokens**: 16,384 tokens
- **Pricing**:
  - Input Tokens: $2.50 / 1M tokens
  - Cached Input Tokens: $1.25 / 1M tokens (50% discount on prompts >1,024 tokens)
  - Output Tokens: $10.00 / 1M tokens
  - Batch API Input: $1.25 / 1M tokens (50% discount)
  - Batch API Output: $5.00 / 1M tokens (50% discount)
- **API Availability**: OpenAI REST API (`/v1/chat/completions`), Assistants API v2, Azure OpenAI Service
- **Streaming Support**: Yes — Server-Sent Events (`text/event-stream`)
- **Function Calling**: Yes — Parallel function calls & multi-tool declarations
- **Structured Outputs**: Yes — 100% adherence to user-defined JSON Schemas / Pydantic models (`strict: true`)

---

## 3. Typical Use Cases

1. **Multimodal Customer SaaS Agents**: Combining vision OCR, structured JSON data extraction, and natural dialogue.
2. **Repository Code Audit & Engineering**: Refactoring multi-file codebases and parsing architectural diagrams.
3. **Complex Document Ingestion**: Converting invoices, charts, and blueprints into structured JSON.

---

## 4. Strengths & Limitations

- **Strengths**: Highest intelligence balanced with speed, native multimodal vision, 100% structured JSON output adherence, automatic prompt caching.
- **Limitations**: Output ceiling capped at 16,384 tokens per request turn.

---

## 5. Runnable Python Example

```python
import os
from pydantic import BaseModel
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

class InvoiceData(BaseModel):
    vendor: str
    total_amount: float
    invoice_number: str

completion = client.beta.chat.completions.parse(
    model="gpt-4o-2024-08-06",
    messages=[
        {"role": "system", "content": "Extract structured invoice details."},
        {"role": "user", "content": "Vendor: ACME Corp, Total: $1,250.00, Inv #: 98765"}
    ],
    response_format=InvoiceData
)

data: InvoiceData = completion.choices[0].message.parsed
print(f"Vendor: {data.vendor} | Amount: ${data.total_amount}")
```
