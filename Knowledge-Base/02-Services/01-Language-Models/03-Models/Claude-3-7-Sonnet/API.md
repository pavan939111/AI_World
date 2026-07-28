---
title: Claude 3.7 Sonnet — API Reference
service: 01-Language-Models
model: Claude-3-7-Sonnet
section: 03-Models
file: API.md
last_updated: 2026-07-28
tags: [language-models, claude-3-7-sonnet, api, endpoint]
author: Antigravity AI Knowledge Engine
---

# Claude 3.7 Sonnet — API Reference

Direct REST API endpoints, HTTP header configurations, and payload definitions for Claude 3.7 Sonnet.

---

## 1. Messages Endpoint

Generates assistant responses for conversational prompts, vision ingestion, or tool schemas.

* **HTTP Method**: `POST`
* **Endpoint URL**: `https://api.anthropic.com/v1/messages`
* **Headers Required**:
  * `x-api-key`: `ANTHROPIC_API_KEY`
  * `anthropic-version`: `2023-06-01`
  * `content-type`: `application/json`

### Request Payload Schema (Standard Mode)
```json
{
  "model": "claude-3-7-sonnet-20250219",
  "max_tokens": 1024,
  "messages": [
    {
      "role": "user",
      "content": "Generate a visual wireframe coordinate map."
    }
  ]
}
```

### Response Payload Schema
```json
{
  "id": "msg_013Z...",
  "type": "message",
  "role": "assistant",
  "content": [
    {
      "type": "text",
      "text": "Here is the coordinate map..."
    }
  ],
  "model": "claude-3-7-sonnet-20250219",
  "stop_reason": "end_turn",
  "stop_sequence": null,
  "usage": {
    "input_tokens": 15,
    "output_tokens": 30
  }
}
```

---

## 2. Event-Stream Streaming

Setting `"stream": true` returns incremental content chunks using Server-Sent Events (SSE).

* **Header**: `Content-Type: text/event-stream`
* **Response Events Structure**:
  * `message_start`: Returns message metadata.
  * `content_block_start`: Defines the start of a content block (e.g. `thinking` block or `text` block).
  * `content_block_delta`: Returns incremental token chunks. When `thinking` is active, delta returns thinking chunks before returning standard text.
  * `message_stop`: Declares execution completion.

---

## 3. Error Classification

Anthropic APIs report issues using standard HTTP status codes accompanied by JSON error bodies:

* **`400 Bad Request`**: Invalid parameter configuration (e.g., setting a temperature of 0.5 when thinking is enabled).
* **`403 Forbidden`**: Blocked country or invalid keys.
* **`429 Rate Limit Exceeded`**: Token or request limit hit.
* **`529 Service Overloaded`**: Anthropic servers are overloaded.

### JSON Error Structure
```json
{
  "type": "error",
  "error": {
    "type": "overloaded_error",
    "message": "Anthropic API is temporarily overloaded. Please try again later."
  }
}
```
