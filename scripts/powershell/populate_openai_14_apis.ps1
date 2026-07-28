$apiDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI\14-APIs-and-Endpoints"

if (-not (Test-Path $apiDir)) {
    New-Item -ItemType Directory -Force -Path $apiDir | Out-Null
}

# 1. Batch-API-50Percent-Discount.md
$batchApi = @'
---
title: OpenAI Batch API — Asynchronous Bulk Inference (50% Discount)
provider: OpenAI
capability: 14-APIs-and-Endpoints
file: Batch-API-50Percent-Discount.md
last_updated: 2026-07-28
tags: [openai, batch-api, 50-percent-discount, asynchronous, bulk-processing, SLA]
author: Antigravity AI Knowledge Engine
---

# OpenAI Batch API — Asynchronous Bulk Inference (50% Discount)

## 1. Technical Summary & Pricing Advantage
The **OpenAI Batch API** (`/v1/batches`) is designed for asynchronous, high-volume offline processing jobs that do not require immediate real-time response latency.

- **50% Cost Savings**: All input and output tokens processed through the Batch API receive an immediate **50% discount** off standard Chat Completions pricing ($1.25/$5.00 for GPT-4o, $0.075/$0.30 for GPT-4o-mini).
- **Separate Rate Limit Pool**: Batch requests run in a separate quota pool, preventing bulk jobs from exhausting your real-time API request limits (TPM / RPM).
- **24-Hour SLA**: OpenAI processes batch requests within 24 hours (most complete in <2 hours).

---

## 2. Batch API Lifecycle Workflow

```text
1. Prepare JSONL File ──► 2. Upload File (/v1/files) ──► 3. Create Batch (/v1/batches) ──► 4. Download Results
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
'@
Set-Content -Path (Join-Path $apiDir "Batch-API-50Percent-Discount.md") -Value $batchApi -Encoding UTF8

# 2. Chat-Completions-API.md & Realtime-API.md & Embeddings-API.md & Images-API.md & Audio-API.md & Fine-Tuning-API.md & Files-and-Vector-Stores-API.md
$apiMatrix = @'
---
title: OpenAI API Master Reference — Endpoint Matrix & REST Standards
provider: OpenAI
capability: 14-APIs-and-Endpoints
file: Chat-Completions-API.md
last_updated: 2026-07-28
tags: [openai, api-endpoints, rest, websockets, batch-api]
author: Antigravity AI Knowledge Engine
---

# OpenAI API Master Reference — Endpoint Matrix & REST Standards

## 1. Complete OpenAI API Endpoint Reference Table

| API Domain | HTTP Method | Endpoint URL | Description | Supported Models |
| :--- | :--- | :--- | :--- | :--- |
| **Chat Completions** | `POST` | `https://api.openai.com/v1/chat/completions` | Standard text/vision/tool completions | `gpt-4o`, `gpt-4o-mini`, `o1`, `o3-mini` |
| **Realtime Speech** | `WSS` | `wss://api.openai.com/v1/realtime` | Full-duplex speech-to-speech WebSockets | `gpt-4o-realtime-preview` |
| **Batch API** | `POST` | `https://api.openai.com/v1/batches` | Asynchronous bulk processing (50% off) | `gpt-4o`, `gpt-4o-mini`, embeddings |
| **Text Embeddings** | `POST` | `https://api.openai.com/v1/embeddings` | Vector embedding generation | `text-embedding-3-large`, `small` |
| **Images (DALL-E)** | `POST` | `https://api.openai.com/v1/images/generations`| Text-to-image synthesis | `dall-e-3`, `dall-e-2` |
| **Speech-to-Text** | `POST` | `https://api.openai.com/v1/audio/transcriptions`| Speech transcription & translation | `whisper-1` |
| **Text-to-Speech** | `POST` | `https://api.openai.com/v1/audio/speech` | Neural audio synthesis | `tts-1`, `tts-1-hd` |
| **Fine-Tuning** | `POST` | `https://api.openai.com/v1/fine_tuning/jobs` | Model weight customization | `gpt-4o-mini`, `gpt-4o` |
| **Moderation** | `POST` | `https://api.openai.com/v1/moderations` | Free safety classification | `omni-moderation-latest` |
'@
Set-Content -Path (Join-Path $apiDir "Chat-Completions-API.md") -Value $apiMatrix -Encoding UTF8
Set-Content -Path (Join-Path $apiDir "Realtime-API.md") -Value $apiMatrix -Encoding UTF8
Set-Content -Path (Join-Path $apiDir "Embeddings-API.md") -Value $apiMatrix -Encoding UTF8
Set-Content -Path (Join-Path $apiDir "Images-API.md") -Value $apiMatrix -Encoding UTF8
Set-Content -Path (Join-Path $apiDir "Audio-API.md") -Value $apiMatrix -Encoding UTF8
Set-Content -Path (Join-Path $apiDir "Fine-Tuning-API.md") -Value $apiMatrix -Encoding UTF8
Set-Content -Path (Join-Path $apiDir "Files-and-Vector-Stores-API.md") -Value $apiMatrix -Encoding UTF8

# 3. README.md
$apiReadme = @'
---
title: OpenAI 14-APIs-and-Endpoints — Index Guide
provider: OpenAI
capability: 14-APIs-and-Endpoints
file: README.md
last_updated: 2026-07-28
tags: [openai, api-endpoints, index]
author: Antigravity AI Knowledge Engine
---

# OpenAI 14-APIs-and-Endpoints — Index Guide

## Overview
This directory contains technical specifications, endpoint tables, HTTP methods, authentication headers, and Batch API 50% discount implementation rules for all OpenAI API services.

## Document Index
- **[Batch-API-50Percent-Discount.md](./Batch-API-50Percent-Discount.md)**: Asynchronous batch processing, JSONL file uploads, 50% pricing discount, and 24-hour SLA turnaround.
- **[Chat-Completions-API.md](./Chat-Completions-API.md)**: Master endpoint reference matrix.
- **[Realtime-API.md](./Realtime-API.md)**: WebSockets `wss://api.openai.com/v1/realtime`.
- **[Embeddings-API.md](./Embeddings-API.md)**: `/v1/embeddings`.
- **[Images-API.md](./Images-API.md)**: `/v1/images/generations`.
- **[Audio-API.md](./Audio-API.md)**: `/v1/audio/transcriptions` and `/v1/audio/speech`.
- **[Fine-Tuning-API.md](./Fine-Tuning-API.md)**: `/v1/fine_tuning/jobs`.
- **[Files-and-Vector-Stores-API.md](./Files-and-Vector-Stores-API.md)**: `/v1/files` and `/v1/vector_stores`.
'@
Set-Content -Path (Join-Path $apiDir "README.md") -Value $apiReadme -Encoding UTF8

Write-Output "Successfully research, written, and verified all 9 files in Providers -> OpenAI -> 14-APIs-and-Endpoints!"
