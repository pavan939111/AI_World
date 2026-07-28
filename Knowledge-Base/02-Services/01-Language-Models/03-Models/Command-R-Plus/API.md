---
title: Command R+ — API Reference
service: 01-Language-Models
model: Command-R-Plus
section: 03-Models
file: API.md
last_updated: 2026-07-28
tags: [language-models, command-r-plus, api, endpoint]
author: Antigravity AI Knowledge Engine
---

# Command R+ — API Reference

REST API endpoints, JSON request bodies, and grounded citation response schemas for Command R+.

---

## 1. Chat completions Endpoint (Cohere Native)

Unlike OpenAI endpoints, Cohere's native API exposes the `/v1/chat` route to manage multi-lingual conversations and grounding parameters:

* **HTTP Method**: `POST`
* **Endpoint URL**: `https://api.cohere.ai/v1/chat`
* **Headers**:
  * `Authorization`: `Bearer COHERE_API_KEY`
  * `Content-Type`: `application/json`

### Request Payload Example (with In-Context Documents)
```json
{
  "model": "command-r-plus",
  "message": "What is the platform completions rate limit?",
  "documents": [
    {
      "id": "doc_1",
      "title": "API Rates",
      "snippet": "The platform rate limit is 10,000 completions per hour."
    }
  ]
}
```

### Grounded Response Payload Structure
The response includes a dedicated **`citations`** array, mapping generated text indexes back to the document source IDs:

```json
{
  "text": "The platform completions rate limit is 10,000 requests hourly.",
  "generation_id": "gen-...",
  "citations": [
    {
      "start": 0,
      "end": 62,
      "text": "The platform completions rate limit is 10,000 requests hourly.",
      "document_ids": [
        "doc_1"
      ]
    }
  ],
  "documents": [
    {
      "id": "doc_1",
      "title": "API Rates",
      "snippet": "The platform rate limit is 10,000 completions per hour."
    }
  ],
  "meta": {
    "api_version": {
      "version": "1"
    },
    "billed_tokens": {
      "input_tokens": 35,
      "output_tokens": 15
    }
  }
}
```

---

## 2. Server-Sent Events (SSE) Streaming

Set `"stream": true` to receive real-time updates. The SSE data frames return chunk events mapping:

* **Inference Events (`text-generation`)**: Stream incremental answer token updates.
* **Metadata Events (`stream-end`)**: Returns the final compiled citation array and token count details.
