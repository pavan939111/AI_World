---
title: GPT-4o — API Reference
service: 01-Language-Models
model: GPT-4o
section: 03-Models
file: API.md
last_updated: 2026-07-28
tags: [language-models, gpt-4o, api, integration]
author: Antigravity AI Knowledge Engine
---

# GPT-4o — API Reference

Direct REST API endpoints and HTTP payload definitions for interacting with GPT-4o.

---

## 1. Chat Completions Endpoint

Generates completions for text, vision, and tool requests.

* **HTTP Method**: `POST`
* **Endpoint URL**: `https://api.openai.com/v1/chat/completions`
* **Authentication**: Bearer Token via HTTP header:
  `Authorization: Bearer OPENAI_API_KEY`

### Standard Request Payload Schema
```json
{
  "model": "gpt-4o",
  "messages": [
    {
      "role": "system",
      "content": "You are a backend helper agent."
    },
    {
      "role": "user",
      "content": "Generate a unique database key pattern."
    }
  ],
  "temperature": 0.3,
  "max_tokens": 150,
  "stream": false
}
```

### Standard Response Payload Schema
```json
{
  "id": "chatcmpl-9A8z...",
  "object": "chat.completion",
  "created": 1715641200,
  "model": "gpt-4o-2024-05-13",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "A recommended pattern is..."
      },
      "logprobs": null,
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 25,
    "completion_tokens": 15,
    "total_tokens": 40,
    "prompt_tokens_details": {
      "cached_tokens": 0
    }
  },
  "system_fingerprint": "fp_c229..."
}
```

---

## 2. Server-Sent Events (SSE) Streaming

By setting `"stream": true` in the request payload, the server returns a stream of events containing incremental token chunks.

* **Response Header**: `Content-Type: text/event-stream`
* **Event Pattern**:
  ```text
  data: {"id":"chatcmpl-...","object":"chat.completion.chunk","choices":[{"index":0,"delta":{"content":"Hello"},"finish_reason":null}]}

  data: {"id":"chatcmpl-...","object":"chat.completion.chunk","choices":[{"index":0,"delta":{"content":"!"},"finish_reason":"stop"}]}

  data: [DONE]
  ```

---

## 3. Common Error Codes & Handling

When API requests fail, the server returns standard JSON error bodies accompanied by HTTP status codes:

* **`401 Unauthorized`**: Invalid API key or configuration header.
* **`429 Too Many Requests`**: Rate limits (TPM/RPM) exceeded, or credit balance is exhausted.
* **`500 Internal Server Error`**: OpenAI internal service issues.

### JSON Error Structure
```json
{
  "error": {
    "message": "Rate limit reached for gpt-4o in organization org-123 on tokens per min (TPM): Limit 150,000, Used 149,850, Requested 200.",
    "type": "tokens",
    "param": null,
    "code": "rate_limit_exceeded"
  }
}
```
* **Handling Strategy**: Implement **exponential backoff with jitter** for all `429` and `5xx` responses to spread retry spikes.
