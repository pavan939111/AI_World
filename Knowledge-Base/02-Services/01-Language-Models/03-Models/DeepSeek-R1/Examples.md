---
title: DeepSeek-R1 — Code Examples
service: 01-Language-Models
model: DeepSeek-R1
section: 03-Models
file: Examples.md
last_updated: 2026-07-28
tags: [language-models, deepseek-r1, examples, code, python, reasoning, streaming]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-R1 — Code Examples

Practical, executable Python examples demonstrating how to query DeepSeek-R1, extract the thinking trace, and handle real-time chunk streams.

---

## Example 1: Extracting the Reasoning Trace

This script queries the `deepseek-reasoner` model and separates the model's internal thinking process from the final answer.

```python
import os
from openai import OpenAI

client = OpenAI(
    api_key=os.environ.get("DEEPSEEK_API_KEY"),
    base_url="https://api.deepseek.com/v1"
)

# Standard reasoning request
response = client.chat.completions.create(
    model="deepseek-reasoner",
    messages=[
        {
            "role": "user",
            "content": "Verify if there is a logical flaw: 'All dogs are animals. Some animals are cats. Therefore, some dogs are cats.'"
        }
    ],
    temperature=0.6
)

# Access reasoning content trace
reasoning_trace = response.choices[0].message.reasoning_content
# Access final response text
final_answer = response.choices[0].message.content

print("--- Reasoning Trace ---")
print(reasoning_trace)

print("\n--- Final Output ---")
print(final_answer)
```

---

## Example 2: Streaming Reasoning & Answer Deltas

This script handles a streamed connection, writing thinking tokens in a block before printing standard answer tokens as they arrive.

```python
import os
import sys
from openai import OpenAI

client = OpenAI(
    api_key=os.environ.get("DEEPSEEK_API_KEY"),
    base_url="https://api.deepseek.com/v1"
)

response = client.chat.completions.create(
    model="deepseek-reasoner",
    messages=[
        {"role": "user", "content": "Write a Python script executing binary search."}
    ],
    stream=True
)

print("Streaming Reasoning Trace:")
sys.stdout.flush()

in_reasoning = True

for chunk in response:
    choice = chunk.choices[0]
    
    # Check for thinking token delta
    reasoning_delta = getattr(choice.delta, "reasoning_content", None)
    if reasoning_delta:
        sys.stdout.write(reasoning_delta)
        sys.stdout.flush()
        
    # Check for content token delta (indicates transition to final answer)
    content_delta = getattr(choice.delta, "content", None)
    if content_delta:
        if in_reasoning:
            print("\n\n--- Transitioning to Final Answer ---\n")
            in_reasoning = False
        sys.stdout.write(content_delta)
        sys.stdout.flush()

print("\n\nStream complete.")
```
