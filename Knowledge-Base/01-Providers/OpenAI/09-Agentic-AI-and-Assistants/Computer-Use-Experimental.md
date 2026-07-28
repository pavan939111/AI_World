---
title: OpenAI Assistants API â€” Threads, Code Execution & Architecture
provider: OpenAI
capability: 09-Agentic-AI-and-Assistants
file: Threads-and-Messages.md
last_updated: 2026-07-28
tags: [openai, assistants-api, threads, code-interpreter, agent-architecture]
author: Antigravity AI Knowledge Engine
---

# OpenAI Assistants API â€” Threads, Code Execution & Architecture

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
