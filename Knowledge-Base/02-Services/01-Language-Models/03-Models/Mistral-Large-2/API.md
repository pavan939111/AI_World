---
title: Mistral-Large-2 — API Reference
service: 01-Language-Models
model: Mistral-Large-2
section: 03-Models
file: API.md
last_updated: 2026-07-28
tags: [language-models, mistral-large-2, api, endpoint]
author: Antigravity AI Knowledge Engine
---

# Mistral-Large-2 — API Reference

Direct REST API endpoints and HTTP request schemas for Mistral-Large-2.

---

## 1. Chat completions Endpoint

Mistral AI’s platform exposes REST endpoints that mirror standard OpenAI schemas:

* **HTTP Method**: `POST`
* **Endpoint URL**: `https://api.mistral.ai/v1/chat/completions`
* **Headers**:
  * `Authorization`: `Bearer MISTRAL_API_KEY`
  * `Content-Type`: `application/json`

### Request Payload Example
```json
{
  "model": "mistral-large-latest",
  "messages": [
    {
      "role": "user",
      "content": "Explain the role of the sliding window in context layers."
    }
  ],
  "temperature": 0.3,
  "max_tokens": 1024
}
```

### Response Payload Structure
```json
{
  "id": "chat-01...",
  "object": "chat.completion",
  "created": 1785239582,
  "model": "mistral-large-latest",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "The sliding window attention mechanism works by..."
      },
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 15,
    "completion_tokens": 25,
    "total_tokens": 40
  }
}
```

---

## 2. Server-Sent Events (SSE) Streaming

Setting `"stream": true` begins chunked token delivery:

* **Event Headers**: `Content-Type: text/event-stream`
* **Streaming Chunks Payload**: Yields standard OpenAI-style data maps inside `choices[0].delta.content`.
* **Terminator**: `data: [DONE]`
