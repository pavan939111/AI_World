---
title: Google AI — Search Grounding API & Live Citation Engine
provider: Google AI
capability: 13-Search-Grounding
file: Google-Search-Grounding-API.md
last_updated: 2026-07-28
tags: [google, search-grounding, google-search, citations, real-time]
author: Antigravity AI Documentation Engine
---

# Google AI — Search Grounding API & Live Citation Engine

## 1. Overview
Google Search Grounding connects Gemini models directly to Google's live web search index. This eliminates hallucinations for current news, live stock prices, and real-time events by appending verified URL citations to model outputs.

---

## 2. Python Code Pattern

```python
import os
from google import genai

client = genai.Client(api_key=os.environ.get("GEMINI_API_KEY"))

response = client.models.generate_content(
    model="gemini-2.5-flash",
    contents="What are the current tech headlines today?",
    config={"tools": [{"google_search": {}}]}
)

print("Grounded Output:")
print(response.text)

# Inspect Grounding Metadata URL Citations
if response.candidates[0].grounding_metadata:
    print("\nSearch Sources & Citations:")
    for chunk in response.candidates[0].grounding_metadata.grounding_chunks:
        print(f"- {chunk.web.title}: {chunk.web.uri}")
```
