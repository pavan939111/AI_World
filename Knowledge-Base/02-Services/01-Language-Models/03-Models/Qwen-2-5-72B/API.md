---
title: Qwen 2.5 72B — API Reference
service: 01-Language-Models
model: Qwen-2-5-72B
section: 03-Models
file: API.md
last_updated: 2026-07-28
tags: [language-models, qwen-2-5-72b, api, endpoint]
author: Antigravity AI Knowledge Engine
---

# Qwen 2.5 72B — API Reference

API specifications, endpoint routes, and integration payload examples for Qwen 2.5 72B.

---

## 1. OpenAI SDK Compatibility Route

Most third-party providers (Together, Fireworks, local vLLM deployments) serve Qwen 2.5 72B using the OpenAI completions schema.

* **HTTP Method**: `POST`
* **Route Endpoint**: `/v1/chat/completions`

### Request Payload Example
```json
{
  "model": "Qwen/Qwen2.5-72B-Instruct",
  "messages": [
    {
      "role": "user",
      "content": "Explain CJK token compression efficiencies."
    }
  ],
  "temperature": 0.4,
  "max_tokens": 512
}
```

### Response Payload Structure
```json
{
  "id": "chatcmpl-qwen-123",
  "object": "chat.completion",
  "created": 1785239582,
  "model": "Qwen/Qwen2.5-72B-Instruct",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "Tokenizer vocabularies of 151k support..."
      },
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 15,
    "completion_tokens": 20,
    "total_tokens": 35
  }
}
```

---

## 2. Alibaba DashScope Native API

When querying Alibaba's official DashScope engine, developers can use the direct endpoint:

* **Endpoint URL**: `https://dashscope.aliyuncs.com/api/v1/services/aipost/text-generation/generation`
* **Headers**:
  * `Authorization`: `Bearer DASHSCOPE_API_KEY`
  * `Content-Type`: `application/json`

---

## 3. Streaming Event Format (SSE)

Setting `"stream": true` yields chunked updates using Server-Sent Events (SSE):

* **Event Headers**: `Content-Type: text/event-stream`
* **SSE Data Frame**: Returns incremental token blocks inside `choices[0].delta.content` matching standard streaming architectures.
* **Terminator**: `data: [DONE]`
