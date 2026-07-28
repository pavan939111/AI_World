---
title: OpenAI Assistants API â€” File Search Tool & Vector Stores Guide
provider: OpenAI
capability: 09-Agentic-AI-and-Assistants
file: File-Search-Tool.md
last_updated: 2026-07-28
tags: [openai, file-search, vector-stores, rag, document-indexing]
author: Antigravity AI Knowledge Engine
---

# OpenAI Assistants API â€” File Search Tool & Vector Stores

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
