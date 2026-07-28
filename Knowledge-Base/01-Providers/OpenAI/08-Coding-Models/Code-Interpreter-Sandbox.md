---
title: OpenAI Assistants API â€” Code Interpreter Container Sandbox
provider: OpenAI
capability: 08-Coding-Models
file: Code-Interpreter-Sandbox.md
last_updated: 2026-07-28
tags: [openai, code-interpreter, sandbox, python, assistant-api, data-analysis]
author: Antigravity AI Knowledge Engine
---

# OpenAI Assistants API â€” Code Interpreter Container Sandbox

## 1. Technical Architecture & Security
OpenAI's **Code Interpreter** tool executes Python code in a sandboxed, isolated Linux container environment.

- **Environment**: Sandboxed Debian Linux container with pre-installed data science packages (`pandas`, `numpy`, `matplotlib`, `scipy`, `sympy`, `scikit-learn`, `docx`, `pdfplumber`).
- **File System**: Ephemeral virtual disk supporting file uploads (CSVs, Excel, PDFs) and output generation (PNG charts, exported CSVs, downloadable PDFs).
- **Execution Limits**: Max 30 seconds CPU time per script execution block; internet access is disabled for network security.

---

## 2. Python SDK Implementation (Data Plotting via Code Interpreter)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Create Assistant with Code Interpreter enabled
assistant = client.beta.assistants.create(
    name="Data Science Analyst",
    instructions="Write Python code to analyze data and generate clear charts.",
    tools=[{"type": "code_interpreter"}],
    model="gpt-4o"
)

print(f"Assistant Created ID: {assistant.id}")
```
