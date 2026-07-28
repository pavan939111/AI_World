---
title: OpenAI Coding Models â€” Refactoring, System Design & Code Snippets
provider: OpenAI
capability: 08-Coding-Models
file: Code-Generation-and-Refactoring.md
last_updated: 2026-07-28
tags: [openai, coding, refactoring, python, typescript, system-design]
author: Antigravity AI Knowledge Engine
---

# OpenAI Coding Models â€” Refactoring, System Design & Code Snippets

## 1. Python SDK Implementation (Multi-File Refactoring with Pydantic)

```python
import os
from pydantic import BaseModel, Field
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

class CodeRefactorResult(BaseModel):
    refactored_code: str = Field(description="Clean, PEP8-compliant refactored Python code")
    complexity_improvement: str = Field(description="Summary of time/space complexity reduction")
    unit_tests: str = Field(description="Pytest unit tests verifying correctness")

response = client.beta.chat.completions.parse(
    model="o3-mini",
    messages=[
        {"role": "user", "content": "Refactor this legacy O(N^2) bubble sort into an optimal O(N log N) mergesort: [5, 2, 8, 1, 9]"}
    ],
    response_format=CodeRefactorResult
)

result: CodeRefactorResult = response.choices[0].message.parsed
print("Refactored Code:")
print(result.refactored_code)
print("\nUnit Tests:")
print(result.unit_tests)
```
