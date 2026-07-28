---
title: Gemini 2.5 Pro — API Reference
service: 01-Language-Models
model: Gemini-2-5-Pro
section: 03-Models
file: API.md
last_updated: 2026-07-28
tags: [language-models, gemini-2-5-pro, api, endpoint]
author: Antigravity AI Knowledge Engine
---

# Gemini 2.5 Pro — API Reference

Direct REST API endpoints and HTTP payload schemas for interacting with Gemini 2.5 Pro.

---

## 1. Google AI Studio Endpoints

* **HTTP Method**: `POST`
* **URL Structure**:
  `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-pro:generateContent?key=YOUR_API_KEY`
* **Headers**: `Content-Type: application/json`

### Direct Request Payload Example
```json
{
  "contents": [
    {
      "parts": [
        {
          "text": "Summarize the key findings in this document."
        }
      ]
    }
  ],
  "generationConfig": {
    "temperature": 0.2,
    "maxOutputTokens": 1000
  }
}
```

### Standard Response Payload
```json
{
  "candidates": [
    {
      "content": {
        "parts": [
          {
            "text": "The document details..."
          }
        ],
        "role": "model"
      },
      "finishReason": "STOP",
      "safetyRatings": [
        {
          "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
          "probability": "NEGLIGIBLE"
        }
      ]
    }
  ],
  "usageMetadata": {
    "promptTokenCount": 15,
    "candidatesTokenCount": 20,
    "totalTokenCount": 35
  }
}
```

---

## 2. Search Grounding Response Metadata

When grounding is enabled, the API includes grounding metadata maps within the response candidates:

```json
"groundingMetadata": {
  "webSearchQueries": [
    "Company X quarterly financial results"
  ],
  "groundingChunks": [
    {
      "web": {
        "uri": "https://example.com/finance",
        "title": "Company X Financial Release"
      }
    }
  ]
}
```

---

## 3. Vertex AI Cloud Configuration

For Google Cloud deployments, the API shifts to the regional Vertex endpoints:

* **URL Structure**:
  `https://{REGION}-aiplatform.googleapis.com/v1/projects/{PROJECT_ID}/locations/{REGION}/publishers/google/models/gemini-2.5-pro:generateContent`
* **Authentication**: Requires OAuth 2.0 Bearer tokens managed via Google Cloud IAM permissions, rather than static API keys.
