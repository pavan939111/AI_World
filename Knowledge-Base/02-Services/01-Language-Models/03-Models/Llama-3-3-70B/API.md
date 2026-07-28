---
title: Llama 3.3 70B — API Reference
service: 01-Language-Models
model: Llama-3-3-70B
section: 03-Models
file: API.md
last_updated: 2026-07-28
tags: [language-models, llama-3-3-70b, api, endpoint]
author: Antigravity AI Knowledge Engine
---

# Llama 3.3 70B — API Reference

Configuration parameters and endpoint structures for Llama 3.3 70B.

---

## 1. OpenAI Compatibility Layer

Most inference hosting engines (vLLM, Ollama, Groq, Together) expose a REST API that matches OpenAI's schema. This allows developers to use the standard `openai` SDK library simply by overriding the `base_url` configurations.

* **HTTP Method**: `POST`
* **Route Path**: `/v1/chat/completions`
* **Base URL Example (vLLM)**: `http://localhost:8000/v1`

### Request Payload Schema
```json
{
  "model": "meta-llama/Llama-3.3-70B-Instruct",
  "messages": [
    {
      "role": "system",
      "content": "You are a factual dictionary bot."
    },
    {
      "role": "user",
      "content": "Define 'GQA'."
    }
  ],
  "temperature": 0.6,
  "max_tokens": 512
}
```

### Response Payload Structure
```json
{
  "id": "chatcmpl-123",
  "object": "chat.completion",
  "created": 1785239582,
  "model": "meta-llama/Llama-3.3-70B-Instruct",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "GQA stands for Grouped-Query Attention..."
      },
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 20,
    "completion_tokens": 15,
    "total_tokens": 35
  }
}
```

---

## 2. Server-Sent Events (SSE) Streaming

Passing `"stream": true` yields chunked response payloads:

* **Event Headers**: `Content-Type: text/event-stream`
* **Data Chunk Payload**:
```json
data: {"id":"chatcmpl-123","object":"chat.completion.chunk","created":1785239582,"model":"meta-llama/Llama-3.3-70B-Instruct","choices":[{"index":0,"delta":{"content":"GQA"},"finish_reason":null}]}
```
* **Terminator**: `data: [DONE]`
