---
title: OpenAI Vision API â€” OCR, Document & Chart Analysis Guide
provider: OpenAI
capability: 04-Vision-and-Document-Understanding
file: OCR-and-Document-Parsing.md
last_updated: 2026-07-28
tags: [openai, vision, ocr, docvqa, chartqa, pydantic]
author: Antigravity AI Knowledge Engine
---

# OpenAI Vision API â€” OCR, Document & Chart Analysis Guide

## 1. Python SDK Implementation (DocVQA Invoice Extraction)

```python
import os
import base64
from pydantic import BaseModel, Field
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

class InvoiceData(BaseModel):
    vendor_name: str = Field(description="Name of vendor issuing invoice")
    total_amount: float = Field(description="Total invoice balance due")
    line_items: list[str] = Field(description="List of purchased products/services")

with open("invoice.png", "rb") as f:
    b64 = base64.b64encode(f.read()).decode("utf-8")

response = client.beta.chat.completions.parse(
    model="gpt-4o",
    messages=[
        {
            "role": "user",
            "content": [
                {"type": "text", "text": "Extract invoice fields into valid JSON format."},
                {"type": "image_url", "image_url": {"url": f"data:image/png;base64,{b64}", "detail": "high"}}
            ]
        }
    ],
    response_format=InvoiceData
)

invoice: InvoiceData = response.choices[0].message.parsed
print(f"Vendor: {invoice.vendor_name} | Total: ${invoice.total_amount}")
```
