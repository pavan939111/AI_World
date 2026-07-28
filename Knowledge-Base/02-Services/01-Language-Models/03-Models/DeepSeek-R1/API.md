---
title: DeepSeek-R1 — API Reference
service: 01-Language-Models
model: DeepSeek-R1
section: 03-Models
file: API.md
last_updated: 2026-07-28
tags: [language-models, deepseek-r1, api, endpoint]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-R1 — API Reference

Direct REST API endpoints and HTTP response structures for the DeepSeek-R1 reasoning model.

---

## 1. Reasoner completions Endpoint

To access the reasoning model pipeline on DeepSeek Cloud, developers target the Completions API using the model identifier **`deepseek-reasoner`**:

* **HTTP Method**: `POST`
* **Endpoint URL**: `https://api.deepseek.com/v1/chat/completions`
* **Headers Required**:
  * `Authorization`: `Bearer DEEPSEEK_API_KEY`
  * `Content-Type`: `application/json`

### Request Payload Example
```json
{
  "model": "deepseek-reasoner",
  "messages": [
    {
      "role": "user",
      "content": "Verify if 9.11 is larger than 9.9."
    }
  ],
  "temperature": 0.6
}
```

### Response Payload Structure
The API returns a dedicated property, **`reasoning_content`**, inside the message object containing the model's chain-of-thought trace:

```json
{
  "id": "chatcmpl-02...",
  "object": "chat.completion",
  "created": 1785239582,
  "model": "deepseek-reasoner",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "No, 9.9 is larger than 9.11...",
        "reasoning_content": "The user is asking to compare 9.11 and 9.9. Let's look at the decimal places. 9.9 can be written as 9.90. Comparing 9.90 and 9.11, 90 is greater than 11. Therefore, 9.9 is larger."
      },
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 15,
    "completion_tokens": 80,
    "total_tokens": 95
  }
}
```

---

## 2. Server-Sent Events (SSE) Streaming

When streaming (`"stream": true`), R1 returns reasoning content before returning the final completion content:

* **Inference Phase 1 (Thinking)**: The stream returns chunks with delta updates inside the `choices[0].delta.reasoning_content` parameter. The `content` parameter remains empty or null.
* **Inference Phase 2 (Answering)**: Once thinking is complete, the stream stops outputting `reasoning_content` and begins outputting standard answer tokens inside the `choices[0].delta.content` parameter.
