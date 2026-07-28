---
title: DeepSeek-V3 — API Reference
service: 01-Language-Models
model: DeepSeek-V3
section: 03-Models
file: API.md
last_updated: 2026-07-28
tags: [language-models, deepseek-v3, api, endpoint]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-V3 — API Reference

Direct REST API endpoints, HTTP headers, and payload structures for DeepSeek-V3.

---

## 1. Chat Completions Endpoint

DeepSeek Cloud supports the standard OpenAI Chat Completions API schema, allowing developers to switch models by replacing the target base URL and API key.

* **HTTP Method**: `POST`
* **Endpoint URL**: `https://api.deepseek.com/v1/chat/completions`
* **Headers Required**:
  * `Authorization`: `Bearer DEEPSEEK_API_KEY`
  * `Content-Type`: `application/json`

### Request Payload Example
```json
{
  "model": "deepseek-chat",
  "messages": [
    {
      "role": "user",
      "content": "Explain Multi-head Latent Attention compression."
    }
  ],
  "temperature": 0.7,
  "max_tokens": 1024,
  "stream": false
}
```

### Response Payload Structure
```json
{
  "id": "chatcmpl-01...",
  "object": "chat.completion",
  "created": 1785239582,
  "model": "deepseek-chat",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "Multi-head Latent Attention (MLA) works by..."
      },
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 15,
    "completion_tokens": 30,
    "total_tokens": 45,
    "prompt_tokens_details": {
      "cached_tokens": 0
    }
  }
}
```

---

## 2. Server-Sent Events (SSE) Streaming

Setting `"stream": true` returns incremental data chunks:

* **Event Headers**: `Content-Type: text/event-stream`
* **Data Chunk Schema**: Matches the standard OpenAI chunk pattern, returning token fragments in `choices[0].delta.content`.
* **Terminator**: `data: [DONE]`
