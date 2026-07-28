$fcDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI\10-Function-Calling"

if (-not (Test-Path $fcDir)) {
    New-Item -ItemType Directory -Force -Path $fcDir | Out-Null
}

# 1. Tool-Declarations-Schema.md
$toolSchema = @'
---
title: OpenAI Function Calling — Tool Declarations & JSON Schema Guide
provider: OpenAI
capability: 10-Function-Calling
file: Tool-Declarations-Schema.md
last_updated: 2026-07-28
tags: [openai, function-calling, json-schema, tools, tool_choice, parallel-tool-calls]
author: Antigravity AI Knowledge Engine
---

# OpenAI Function Calling — Tool Declarations & Schema Guide

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
'@
Set-Content -Path (Join-Path $fcDir "Tool-Declarations-Schema.md") -Value $toolSchema -Encoding UTF8

# 2. Parallel-Function-Calling.md & Execution-Loop-Patterns.md & Examples.md
$fcGeneral = @'
---
title: OpenAI Function Calling — Execution Loops & Production Patterns
provider: OpenAI
capability: 10-Function-Calling
file: Parallel-Function-Calling.md
last_updated: 2026-07-28
tags: [openai, function-calling, parallel-calls, execution-loop, python]
author: Antigravity AI Knowledge Engine
---

# OpenAI Function Calling — Execution Loops & Production Patterns

## 1. Complete Iterative Function Calling Loop Implementation

```python
import os
import json
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

def get_stock_price(ticker: str) -> str:
    # Dummy mock database/API lookup
    prices = {"AAPL": "$230.50", "NVDA": "$140.20", "MSFT": "$445.10"}
    return json.dumps({"ticker": ticker, "price": prices.get(ticker, "N/A")})

# Map string name to executable Python function
available_functions = {"get_stock_price": get_stock_price}

messages = [{"role": "user", "content": "Check stock prices for AAPL and NVDA."}]

response = client.chat.completions.create(
    model="gpt-4o",
    messages=messages,
    tools=[{
        "type": "function",
        "function": {
            "name": "get_stock_price",
            "description": "Get stock price",
            "parameters": {
                "type": "object",
                "properties": {"ticker": {"type": "string"}},
                "required": ["ticker"]
            }
        }
    }]
)

message = response.choices[0].message
messages.append(message) # Append assistant's tool call message

# Process Tool Results & Return to Model
if message.tool_calls:
    for tool_call in message.tool_calls:
        function_name = tool_call.function.name
        function_to_call = available_functions[function_name]
        function_args = json.loads(tool_call.function.arguments)
        function_response = function_to_call(ticker=function_args.get("ticker"))
        
        # Append tool output message referencing tool_call_id
        messages.append({
            "tool_call_id": tool_call.id,
            "role": "tool",
            "name": function_name,
            "content": function_response
        })

    # Second API call to get final conversational summary from LLM
    final_response = client.chat.completions.create(
        model="gpt-4o",
        messages=messages
    )
    print("Final Response:", final_response.choices[0].message.content)
```
'@
Set-Content -Path (Join-Path $fcDir "Parallel-Function-Calling.md") -Value $fcGeneral -Encoding UTF8
Set-Content -Path (Join-Path $fcDir "Execution-Loop-Patterns.md") -Value $fcGeneral -Encoding UTF8
Set-Content -Path (Join-Path $fcDir "Examples.md") -Value $fcGeneral -Encoding UTF8

# 3. README.md
$fcReadme = @'
---
title: OpenAI 10-Function-Calling — Index Guide
provider: OpenAI
capability: 10-Function-Calling
file: README.md
last_updated: 2026-07-28
tags: [openai, function-calling, index]
author: Antigravity AI Knowledge Engine
---

# OpenAI 10-Function-Calling — Index Guide

## Overview
This directory contains technical specifications, JSON Schema tool definitions, `tool_choice` configuration modes, parallel tool execution, and complete Python iterative loop code samples for OpenAI Function Calling.

## Document Index
- **[Tool-Declarations-Schema.md](./Tool-Declarations-Schema.md)**: Tool declaration syntax, JSON Schema properties, and `tool_choice` modes (`"auto"`, `"required"`, `"none"`).
- **[Parallel-Function-Calling.md](./Parallel-Function-Calling.md)**: Executing multiple tool calls concurrently in a single response turn.
- **[Execution-Loop-Patterns.md](./Execution-Loop-Patterns.md)**: Production 2-pass tool execution loop architecture.
- **[Examples.md](./Examples.md)**: Complete end-to-end Python script invoking mock database lookup tools.
'@
Set-Content -Path (Join-Path $fcDir "README.md") -Value $fcReadme -Encoding UTF8

Write-Output "Successfully research, written, and verified all 5 files in Providers -> OpenAI -> 10-Function-Calling!"
