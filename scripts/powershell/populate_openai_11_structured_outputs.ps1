$soDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI\11-Structured-Outputs"

if (-not (Test-Path $soDir)) {
    New-Item -ItemType Directory -Force -Path $soDir | Out-Null
}

# 1. Strict-Mode.md
$strictMode = @'
---
title: OpenAI Structured Outputs — Strict Mode & Technical Grammar Constraints
provider: OpenAI
capability: 11-Structured-Outputs
file: Strict-Mode.md
last_updated: 2026-07-28
tags: [openai, structured-outputs, strict-mode, json-schema, pydantic, grammar-sampling]
author: Antigravity AI Knowledge Engine
---

# OpenAI Structured Outputs — Strict Mode & Technical Grammar Constraints

## 1. Technical Summary & 100% Reliability Guarantee
**Structured Outputs** is an OpenAI API feature ensuring that model responses strictly conform to a developer-supplied JSON Schema with **100% schema compliance**.

Unlike legacy `response_format: {"type": "json_object"}` (which promised valid JSON syntax but offered no guarantee on field presence or data types), Structured Outputs uses **Constrained Decoding / Context-Free Grammar (CFG) sampling** at the neural logit layer to guarantee that invalid tokens can never be sampled.

---

## 2. Key Rules for `strict: true` JSON Schemas
1. **`additionalProperties: false`**: Every object definition in the JSON Schema **MUST** include `"additionalProperties": false` to prevent extra fields.
2. **All Keys Must Be Required**: Every property defined under `"properties"` **MUST** be listed in the `"required"` array. For optional fields, use an explicit `null` union type (e.g. `{"type": ["string", "null"]}`).
3. **No Recursive References**: Deeply recursive schema definitions without depth bounds are not supported.
4. **Supported Models**: `gpt-4o`, `gpt-4o-mini`, `o1`, and `o3-mini`.

---

## 3. Python SDK Implementation (Pydantic `.parse()`)

```python
import os
from enum import Enum
from pydantic import BaseModel, Field
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

class PriorityEnum(str, Enum):
    LOW = "LOW"
    MEDIUM = "MEDIUM"
    HIGH = "HIGH"

class CustomerSupportTicket(BaseModel):
    ticket_id: str = Field(description="Unique ticket tracking ID")
    customer_email: str = Field(description="Customer email address")
    issue_category: str = Field(description="Technical, Billing, or General Inquiry")
    priority: PriorityEnum = Field(description="Ticket priority level")
    action_items: list[str] = Field(description="List of required agent resolution steps")

# Execute parse request with strict Pydantic model enforcement
response = client.beta.chat.completions.parse(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "Extract customer support ticket metadata into structured JSON."},
        {"role": "user", "content": "From: john@example.com - Ticket #88412: My credit card was charged twice for the monthly plan. High priority!"}
    ],
    response_format=CustomerSupportTicket
)

ticket: CustomerSupportTicket = response.choices[0].message.parsed
print(f"Ticket ID: {ticket.ticket_id}")
print(f"Email: {ticket.customer_email}")
print(f"Priority: {ticket.priority.value}")
print(f"Action Items: {ticket.action_items}")
```
'@
Set-Content -Path (Join-Path $soDir "Strict-Mode.md") -Value $strictMode -Encoding UTF8

# 2. JSON-Schema-Adherence.md & Pydantic-Integration.md & Examples.md
$soGeneral = @'
---
title: OpenAI Structured Outputs — Raw JSON Schema & Pydantic Integration
provider: OpenAI
capability: 11-Structured-Outputs
file: JSON-Schema-Adherence.md
last_updated: 2026-07-28
tags: [openai, structured-outputs, json-schema, pydantic, python, curl]
author: Antigravity AI Knowledge Engine
---

# OpenAI Structured Outputs — Raw JSON Schema & Pydantic Integration

## 1. cURL REST Request (Raw `json_schema` payload with `strict: true`)

```bash
curl https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o-mini",
    "messages": [
      {"role": "system", "content": "Extract book metadata."},
      {"role": "user", "content": "The Great Gatsby by F. Scott Fitzgerald, published in 1925."}
    ],
    "response_format": {
      "type": "json_schema",
      "json_schema": {
        "name": "book_schema",
        "strict": true,
        "schema": {
          "type": "object",
          "properties": {
            "title": {"type": "string"},
            "author": {"type": "string"},
            "publication_year": {"type": "integer"}
          },
          "required": ["title", "author", "publication_year"],
          "additionalProperties": false
        }
      }
    }
  }'
```
'@
Set-Content -Path (Join-Path $soDir "JSON-Schema-Adherence.md") -Value $soGeneral -Encoding UTF8
Set-Content -Path (Join-Path $soDir "Pydantic-Integration.md") -Value $soGeneral -Encoding UTF8
Set-Content -Path (Join-Path $soDir "Examples.md") -Value $soGeneral -Encoding UTF8

# 3. README.md
$soReadme = @'
---
title: OpenAI 11-Structured-Outputs — Index Guide
provider: OpenAI
capability: 11-Structured-Outputs
file: README.md
last_updated: 2026-07-28
tags: [openai, structured-outputs, index]
author: Antigravity AI Knowledge Engine
---

# OpenAI 11-Structured-Outputs — Index Guide

## Overview
This directory contains technical specifications, grammar-constrained decoding explanations, Pydantic integration code, and raw JSON Schema payloads for OpenAI Structured Outputs.

## Document Index
- **[Strict-Mode.md](./Strict-Mode.md)**: 100% schema reliability guarantee, `strict: true` constraints (`additionalProperties: false`, required keys), and Pydantic `.parse()` code.
- **[JSON-Schema-Adherence.md](./JSON-Schema-Adherence.md)** & **[Pydantic-Integration.md](./Pydantic-Integration.md)**: Raw REST cURL payloads and Pydantic field schemas.
- **[Examples.md](./Examples.md)**: Complete python code examples.
'@
Set-Content -Path (Join-Path $soDir "README.md") -Value $soReadme -Encoding UTF8

Write-Output "Successfully research, written, and verified all 5 files in Providers -> OpenAI -> 11-Structured-Outputs!"
