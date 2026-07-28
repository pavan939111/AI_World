---
title: OpenAI Structured Outputs â€” Raw JSON Schema & Pydantic Integration
provider: OpenAI
capability: 11-Structured-Outputs
file: JSON-Schema-Adherence.md
last_updated: 2026-07-28
tags: [openai, structured-outputs, json-schema, pydantic, python, curl]
author: Antigravity AI Knowledge Engine
---

# OpenAI Structured Outputs â€” Raw JSON Schema & Pydantic Integration

## 1. cURL REST Request (Raw `json_schema` payload with `strict: true`)

```bash
curl https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o-mini",
    "messages": [
      {"role": "system", "content": "Extract book metadata."},
      {"role": "user", "content": "The Great Gatsby by F. Scott Fitzgerald, published in 1925."}
    ],
    "response_format": {
      "type": "json_schema",
      "json_schema": {
        "name": "book_schema",
        "strict": true,
        "schema": {
          "type": "object",
          "properties": {
            "title": {"type": "string"},
            "author": {"type": "string"},
            "publication_year": {"type": "integer"}
          },
          "required": ["title", "author", "publication_year"],
          "additionalProperties": false
        }
      }
    }
  }'
```
