---
title: Qwen 2.5 72B — Code Examples
service: 01-Language-Models
model: Qwen-2-5-72B
section: 03-Models
file: Examples.md
last_updated: 2026-07-28
tags: [language-models, qwen-2-5-72b, examples, code, python, local, cloud]
author: Antigravity AI Knowledge Engine
---

# Qwen 2.5 72B — Code Examples

Practical, executable Python examples demonstrating local serving using Ollama and serverless routing using Together AI.

---

## Example 1: Local Inference via Ollama Client

This script initiates a chat sequence on a locally hosted Ollama service. Ensure Ollama is installed and the model is running (`ollama run qwen2.5:72b`).

```python
import ollama

# Initialize standard local client configuration
client = ollama.Client(host="http://localhost:11434")

response = client.chat(
    model="qwen2.5:72b",
    messages=[
        {
            "role": "system",
            "content": "You are a concise engineering assistant. Analyze syntax logic."
        },
        {
            "role": "user",
            "content": "Explain the benefit of SwiGLU activation functions over standard ReLU."
        }
    ],
    options={
        "temperature": 0.2,
        "num_predict": 512
    }
)

print("Ollama Qwen Response:")
print(response["message"]["content"])
```

---

## Example 2: Serverless Cloud Queries via Together AI

This script uses Together AI's API endpoints to execute completions using the `together` SDK (`pip install together`).

```python
import os
from together import Together

# Initialize client using Together credentials
client = Together(api_key=os.environ.get("TOGETHER_API_KEY"))

response = client.chat.completions.create(
    model="Qwen/Qwen2.5-72B-Instruct",
    messages=[
        {
            "role": "system",
            "content": "You are a translation assistant. Translate the text to Japanese."
        },
        {
            "role": "user",
            "content": "The application build completed successfully. Running sanity checks."
        }
    ],
    temperature=0.3,
    max_tokens=256
)

print("Together AI Qwen Response:")
print(response.choices[0].message.content)
```
