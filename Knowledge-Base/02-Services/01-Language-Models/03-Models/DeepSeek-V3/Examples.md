---
title: DeepSeek-V3 — Code Examples
service: 01-Language-Models
model: DeepSeek-V3
section: 03-Models
file: Examples.md
last_updated: 2026-07-28
tags: [language-models, deepseek-v3, examples, code, python, caching]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-V3 — Code Examples

Practical, executable Python examples demonstrating the OpenAI SDK compatibility layer and automatic prefix cache metrics.

---

## Example 1: Standard Completion via OpenAI Client

This script calls the DeepSeek API using the standard `openai` Python SDK by overriding the `base_url` configuration.

```python
import os
from openai import OpenAI

# Initialize client using DeepSeek configurations
client = OpenAI(
    api_key=os.environ.get("DEEPSEEK_API_KEY"),
    base_url="https://api.deepseek.com/v1"
)

response = client.chat.completions.create(
    model="deepseek-chat",
    messages=[
        {
            "role": "system",
            "content": "You are a concise engineering assistant. Summarize code operations."
        },
        {
            "role": "user",
            "content": "What is the computational complexity of sorting an array using quicksort in average vs worst case?"
        }
    ],
    temperature=0.2,
    max_tokens=256
)

print("DeepSeek Response:")
print(response.choices[0].message.content)
```

---

## Example 2: Automatic Cache Verification

This script executes consecutive requests with matching system prompts, printing the token cache hit metrics returned in the usage payload.

```python
import os
import time
from openai import OpenAI

client = OpenAI(
    api_key=os.environ.get("DEEPSEEK_API_KEY"),
    base_url="https://api.deepseek.com/v1"
)

# Large static prompt to write to cache
static_system_prompt = (
    "You are a translation agent. Translate text to German. "
    "Maintain strict adherence to technical terminology. "
    "Here is a reference dictionary: " + ("word " * 1000) # Mock large dictionary
)

def run_query(user_text):
    response = client.chat.completions.create(
        model="deepseek-chat",
        messages=[
            {"role": "system", "content": static_system_prompt},
            {"role": "user", "content": user_text}
        ],
        temperature=0.0
    )
    usage = response.usage
    print(f"\nQuery: '{user_text}'")
    print(f"Total Tokens: {usage.total_tokens}")
    print(f"Prompt Tokens: {usage.prompt_tokens}")
    # Inspect cache details (supported by DeepSeek usage metadata)
    cached_tokens = getattr(usage.prompt_tokens_details, "cached_tokens", 0)
    print(f"Cached Tokens (Cache Hit): {cached_tokens}")
    print(f"Active Output Tokens: {usage.completion_tokens}")

# Run 1: Writes the prompt prefix to the cache (Cache Miss)
print("Executing Query 1 (Cache Write)...")
run_query("Translate: 'Deploy code directly to production.'")

# Wait briefly
time.sleep(2)

# Run 2: Hits the automatic server-side cache (Cache Hit)
print("\nExecuting Query 2 (Cache Hit)...")
run_query("Translate: 'Refactor database index maps.'")
```
