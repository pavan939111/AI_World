---
title: Llama 3.3 70B — Code Examples
service: 01-Language-Models
model: Llama-3-3-70B
section: 03-Models
file: Examples.md
last_updated: 2026-07-28
tags: [language-models, llama-3-3-70b, examples, code, python, local, cloud]
author: Antigravity AI Knowledge Engine
---

# Llama 3.3 70B — Code Examples

Practical, executable Python examples demonstrating local serving via Ollama and serverless routing using Together AI.

---

## Example 1: Local Inference via Ollama Client

This script initiates a chat sequence on a locally hosted Ollama service. Make sure Ollama is installed and the model is running (`ollama run llama3.3`).

```python
import ollama

# Initialize standard local sequence
client = ollama.Client(host="http://localhost:11434")

response = client.chat(
    model="llama3.3",
    messages=[
        {
            "role": "system",
            "content": "You are a clean code assistant. Analyze syntax for potential issues."
        },
        {
            "role": "user",
            "content": "Identify the logic issue: `list_a = [1, 2]; list_b = list_a; list_b.append(3)`"
        }
    ],
    options={
        "temperature": 0.2,
        "num_predict": 512
    }
)

print("Ollama Response:")
print(response["message"]["content"])
```

---

## Example 2: Cloud Inference via Together AI

This script uses the Together AI API endpoint to execute queries serverless. Requires installing the `together` SDK (`pip install together`).

```python
import os
from together import Together

# Initialize client with API key
client = Together(api_key=os.environ.get("TOGETHER_API_KEY"))

response = client.chat.completions.create(
    model="meta-llama/Llama-3.3-70B-Instruct-Turbo",
    messages=[
        {
            "role": "system",
            "content": "You are an automated translation agent. Translate user text to French."
        },
        {
            "role": "user",
            "content": "The deployment completed successfully and the services are online."
        }
    ],
    temperature=0.3,
    max_tokens=256
)

print("Together AI Response:")
print(response.choices[0].message.content)
```
