---
title: Mistral-Large-2 — Code Examples
service: 01-Language-Models
model: Mistral-Large-2
section: 03-Models
file: Examples.md
last_updated: 2026-07-28
tags: [language-models, mistral-large-2, examples, code, python, tools]
author: Antigravity AI Knowledge Engine
---

# Mistral-Large-2 — Code Examples

Practical, executable Python examples demonstrating the official Mistral AI SDK and structured tool calling.

---

## Example 1: Standard Completion via Mistral SDK

This script queries the latest version of Mistral Large using the `mistralai` Python package (`pip install mistralai`).

```python
import os
from mistralai import Mistral

# Initialize the client with API key
client = Mistral(api_key=os.environ.get("MISTRAL_API_KEY"))

response = client.chat.complete(
    model="mistral-large-latest",
    messages=[
        {
            "role": "user",
            "content": "Verify the computational cost difference between self-attention and sliding window attention."
        }
    ],
    temperature=0.3,
    max_tokens=512
)

print("Mistral Large Response:")
print(response.choices[0].message.content)
```

---

## Example 2: Structured Tool (Function) Calling

This script configures a tool schema to allow the model to query an external pricing calculator function.

```python
import os
import json
from mistralai import Mistral

client = Mistral(api_key=os.environ.get("MISTRAL_API_KEY"))

# Define the mock tool function details
def get_gpu_hosting_price(gpu_name: str, quantity: int) -> str:
    prices = {"A100": 2.20, "H100": 4.70}
    unit_price = prices.get(gpu_name.upper(), 1.50)
    return json.dumps({"gpu": gpu_name, "total_hourly_rate": unit_price * quantity})

# Define the tool mapping schema
tools = [
    {
        "type": "function",
        "function": {
            "name": "get_gpu_hosting_price",
            "description": "Calculate the hourly VRAM server hosting cost.",
            "parameters": {
                "type": "object",
                "properties": {
                    "gpu_name": {
                        "type": "string",
                        "description": "The GPU model, e.g., A100 or H100."
                    },
                    "quantity": {
                        "type": "integer",
                        "description": "The number of GPUs requested."
                    }
                },
                "required": ["gpu_name", "quantity"]
            }
        }
    }
]

response = client.chat.complete(
    model="mistral-large-latest",
    messages=[
        {"role": "user", "content": "How much does it cost hourly to run 4x A100 GPUs?"}
    ],
    tools=tools,
    tool_choice="any"  # Force the model to choose a tool call
)

tool_call = response.choices[0].message.tool_calls[0]
function_name = tool_call.function.name
function_args = json.loads(tool_call.function.arguments)

print(f"Model chose tool: {function_name}")
print(f"Arguments parsed: {function_args}")

# Simulate execution of local function
if function_name == "get_gpu_hosting_price":
    result = get_gpu_hosting_price(**function_args)
    print(f"Function output: {result}")
```
