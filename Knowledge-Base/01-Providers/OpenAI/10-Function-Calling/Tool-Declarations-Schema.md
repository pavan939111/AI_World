---
title: OpenAI Function Calling â€” Tool Declarations & JSON Schema Guide
provider: OpenAI
capability: 10-Function-Calling
file: Tool-Declarations-Schema.md
last_updated: 2026-07-28
tags: [openai, function-calling, json-schema, tools, tool_choice, parallel-tool-calls]
author: Antigravity AI Knowledge Engine
---

# OpenAI Function Calling â€” Tool Declarations & Schema Guide

## 1. Technical Architecture & Tool Choice Modes
OpenAI Function Calling enables models (`gpt-4o`, `gpt-4o-mini`, `o1`, `o3-mini`) to detect when external APIs or database tools must be invoked. Instead of producing unstructured text, the model returns a structured JSON object containing the function name and exact arguments.

### `tool_choice` Parameter Modes
- **`"auto"`** (Default): The model automatically decides whether to output conversational text or invoke one or more tools.
- **`"required"`**: The model is forced to call at least one tool before generating a conversational response.
- **`"none"`**: Disables tool calling entirely, forcing standard text output.
- **`{"type": "function", "function": {"name": "get_stock_price"}}`**: Forces the model to call a specific named function.

---

## 2. Python SDK Implementation (Parallel Function Calling Loop)

```python
import os
import json
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Define Tool Schemas using JSON Schema format
tools = [
    {
        "type": "function",
        "function": {
            "name": "get_weather",
            "description": "Fetch current weather for a location",
            "parameters": {
                "type": "object",
                "properties": {
                    "city": {"type": "string", "description": "City name, e.g. San Francisco"},
                    "units": {"type": "string", "enum": ["celsius", "fahrenheit"]}
                },
                "required": ["city"]
            }
        }
    }
]

# Initial API Request
response = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role": "user", "content": "What is the weather in Tokyo and Paris?"}],
    tools=tools,
    tool_choice="auto"
)

response_message = response.choices[0].message
tool_calls = response_message.tool_calls

if tool_calls:
    print(f"Model Invoked {len(tool_calls)} Parallel Functions:")
    for tool_call in tool_calls:
        func_name = tool_call.function.name
        func_args = json.loads(tool_call.function.arguments)
        print(f"  - Call ID: {tool_call.id} | Function: {func_name} | Args: {func_args}")
```
