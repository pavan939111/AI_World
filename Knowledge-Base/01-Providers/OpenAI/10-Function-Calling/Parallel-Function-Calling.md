---
title: OpenAI Function Calling â€” Execution Loops & Production Patterns
provider: OpenAI
capability: 10-Function-Calling
file: Parallel-Function-Calling.md
last_updated: 2026-07-28
tags: [openai, function-calling, parallel-calls, execution-loop, python]
author: Antigravity AI Knowledge Engine
---

# OpenAI Function Calling â€” Execution Loops & Production Patterns

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
