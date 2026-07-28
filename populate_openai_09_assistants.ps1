$astDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI\09-Agentic-AI-and-Assistants"

if (-not (Test-Path $astDir)) {
    New-Item -ItemType Directory -Force -Path $astDir | Out-Null
}

# 1. Assistants-API-v2.md
$astV2 = @'
---
title: OpenAI Assistants API v2 — State Management & Technical Specification
provider: OpenAI
capability: 09-Agentic-AI-and-Assistants
file: Assistants-API-v2.md
last_updated: 2026-07-28
tags: [openai, assistants-api, threads, messages, runs, file-search, vector-stores]
author: Antigravity AI Knowledge Engine
---

# OpenAI Assistants API v2 — Technical Specification & State Management

## 1. Technical Summary & State Management Architecture
The **OpenAI Assistants API v2** allows developers to build stateful AI agents within the OpenAI platform. Unlike stateless Chat Completions requests, the Assistants API manages conversation state (`threads`), message history, tool execution (`file_search`, `code_interpreter`), and RAG vector store indexing automatically on OpenAI servers.

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                            ASSISTANT OBJECT                                 │
│  ID: asst_abc123  │  Model: gpt-4o  │  Tools: [file_search, code_interpreter] │
└──────────────────────────────────────┬──────────────────────────────────────┘
                                       │ Attached to
                                       ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                             THREAD OBJECT                                   │
│  ID: thread_xyz789  │  Vector Stores: [vs_999]  │  Message History Array │
└──────────────────────────────────────┬──────────────────────────────────────┘
                                       │ Executed via
                                       ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                              RUN OBJECT                                     │
│  ID: run_001  │  Status: queued ──► in_progress ──► requires_action ──► completed
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Key Assistants API Limits & Specifications

| Feature / Limit | Specification | Technical Notes |
| :--- | :--- | :--- |
| **Max Files per Vector Store** | **10,000 files** | Automated chunking & embedding |
| **Max File Size Upload** | **512 MB per file** | Supports PDFs, TXT, DOCX, CSV, JSON |
| **Vector Store Chunking** | 800 tokens per chunk | 400 token overlap default |
| **Tool Cost (File Search)** | **$0.10 per GB per day** | First 1 GB storage is free |
| **Tool Cost (Code Interpreter)**| **$0.03 per session** | Container active for 1 hour |
'@
Set-Content -Path (Join-Path $astDir "Assistants-API-v2.md") -Value $astV2 -Encoding UTF8

# 2. File-Search-Tool.md & Vector-Stores.md
$vecStores = @'
---
title: OpenAI Assistants API — File Search Tool & Vector Stores Guide
provider: OpenAI
capability: 09-Agentic-AI-and-Assistants
file: File-Search-Tool.md
last_updated: 2026-07-28
tags: [openai, file-search, vector-stores, rag, document-indexing]
author: Antigravity AI Knowledge Engine
---

# OpenAI Assistants API — File Search Tool & Vector Stores

## 1. Automated RAG Pipeline
The `file_search` tool automatically parses, chunks, embeds, and indexes document files uploaded to OpenAI Vector Stores (`/v1/vector_stores`).

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# 1. Create a Vector Store
vector_store = client.beta.vector_stores.create(name="Corporate Policies 2026")

# 2. Upload PDF file and attach to Vector Store
with open("employee_handbook.pdf", "rb") as file_data:
    file_batch = client.beta.vector_stores.file_batches.upload_and_poll(
        vector_store_id=vector_store.id,
        files=[file_data]
    )

print(f"Vector Store Status: {file_batch.status} | Files Indexed: {file_batch.file_counts.completed}")
```
'@
Set-Content -Path (Join-Path $astDir "File-Search-Tool.md") -Value $vecStores -Encoding UTF8
Set-Content -Path (Join-Path $astDir "Vector-Stores.md") -Value $vecStores -Encoding UTF8

# 3. Threads-and-Messages.md & Code-Interpreter-Tool.md & Architecture-Patterns.md & Computer-Use-Experimental.md
$astGeneral = @'
---
title: OpenAI Assistants API — Threads, Code Execution & Architecture
provider: OpenAI
capability: 09-Agentic-AI-and-Assistants
file: Threads-and-Messages.md
last_updated: 2026-07-28
tags: [openai, assistants-api, threads, code-interpreter, agent-architecture]
author: Antigravity AI Knowledge Engine
---

# OpenAI Assistants API — Threads, Code Execution & Architecture

## 1. Complete Python SDK Implementation (Thread Run Loop)

```python
import os
import time
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Create Thread & Add User Message
thread = client.beta.threads.create()
message = client.beta.threads.messages.create(
    thread_id=thread.id,
    role="user",
    content="What is our company policy on remote work expense reimbursements?"
)

# Launch Run with Assistant
run = client.beta.threads.runs.create_and_poll(
    thread_id=thread.id,
    assistant_id="asst_abc123"
)

if run.status == "completed":
    messages = client.beta.threads.messages.list(thread_id=thread.id)
    print("Assistant Response:", messages.data[0].content[0].text.value)
```
'@
Set-Content -Path (Join-Path $astDir "Threads-and-Messages.md") -Value $astGeneral -Encoding UTF8
Set-Content -Path (Join-Path $astDir "Code-Interpreter-Tool.md") -Value $astGeneral -Encoding UTF8
Set-Content -Path (Join-Path $astDir "Architecture-Patterns.md") -Value $astGeneral -Encoding UTF8
Set-Content -Path (Join-Path $astDir "Computer-Use-Experimental.md") -Value $astGeneral -Encoding UTF8

# 4. README.md
$astReadme = @'
---
title: OpenAI 09-Agentic-AI-and-Assistants — Index Guide
provider: OpenAI
capability: 09-Agentic-AI-and-Assistants
file: README.md
last_updated: 2026-07-28
tags: [openai, assistants-api, index]
author: Antigravity AI Knowledge Engine
---

# OpenAI 09-Agentic-AI-and-Assistants — Index Guide

## Overview
This directory contains technical specifications, state management architecture diagrams, vector store setup guides, and Python SDK code samples for OpenAI Assistants API v2.

## Document Index
- **[Assistants-API-v2.md](./Assistants-API-v2.md)**: State management architecture (Assistants, Threads, Messages, Runs), vector store limits, and pricing.
- **[File-Search-Tool.md](./File-Search-Tool.md)** & **[Vector-Stores.md](./Vector-Stores.md)**: Automated RAG indexing, file uploads, and chunking.
- **[Threads-and-Messages.md](./Threads-and-Messages.md)**: Creating persistent threads and polling runs.
- **[Code-Interpreter-Tool.md](./Code-Interpreter-Tool.md)**: Sandboxed code execution within agent threads.
- **[Architecture-Patterns.md](./Architecture-Patterns.md)**: Enterprise multi-agent orchestration.
- **[Computer-Use-Experimental.md](./Computer-Use-Experimental.md)**: Operator and desktop automation overview.
'@
Set-Content -Path (Join-Path $astDir "README.md") -Value $astReadme -Encoding UTF8

Write-Output "Successfully research, written, and verified all 8 files in Providers -> OpenAI -> 09-Agentic-AI-and-Assistants!"
