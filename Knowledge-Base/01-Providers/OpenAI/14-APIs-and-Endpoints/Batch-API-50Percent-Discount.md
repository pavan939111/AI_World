---
title: OpenAI Batch API â€” Asynchronous Bulk Inference (50% Discount)
provider: OpenAI
capability: 14-APIs-and-Endpoints
file: Batch-API-50Percent-Discount.md
last_updated: 2026-07-28
tags: [openai, batch-api, 50-percent-discount, asynchronous, bulk-processing, SLA]
author: Antigravity AI Knowledge Engine
---

# OpenAI Batch API â€” Asynchronous Bulk Inference (50% Discount)

## 1. Technical Summary & Pricing Advantage
The **OpenAI Batch API** (`/v1/batches`) is designed for asynchronous, high-volume offline processing jobs that do not require immediate real-time response latency.

- **50% Cost Savings**: All input and output tokens processed through the Batch API receive an immediate **50% discount** off standard Chat Completions pricing ($1.25/$5.00 for GPT-4o, $0.075/$0.30 for GPT-4o-mini).
- **Separate Rate Limit Pool**: Batch requests run in a separate quota pool, preventing bulk jobs from exhausting your real-time API request limits (TPM / RPM).
- **24-Hour SLA**: OpenAI processes batch requests within 24 hours (most complete in <2 hours).

---

## 2. Batch API Lifecycle Workflow

```text
1. Prepare JSONL File â”€â”€â–º 2. Upload File (/v1/files) â”€â”€â–º 3. Create Batch (/v1/batches) â”€â”€â–º 4. Download Results
   (custom_id per line)       purpose: "batch"               completion check loop            output_file_id
```

### JSONL Input Payload Format (`batch_input.jsonl`)
```json
{"custom_id": "request-001", "method": "POST", "url": "/v1/chat/completions", "body": {"model": "gpt-4o-mini", "messages": [{"role": "user", "content": "Classify: 'Great product!'"}]}}
{"custom_id": "request-002", "method": "POST", "url": "/v1/chat/completions", "body": {"model": "gpt-4o-mini", "messages": [{"role": "user", "content": "Classify: 'Terrible service.'"}]}}
```

---

## 3. Python SDK Implementation (Launching a Batch Job)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# 1. Upload Batch JSONL File
batch_file = client.files.create(
    file=open("batch_input.jsonl", "rb"),
    purpose="batch"
)

# 2. Create Batch Job
batch_job = client.batches.create(
    input_file_id=batch_file.id,
    endpoint="/v1/chat/completions",
    completion_window="24h"
)

print(f"Batch Job Created ID: {batch_job.id} | Status: {batch_job.status}")
```
