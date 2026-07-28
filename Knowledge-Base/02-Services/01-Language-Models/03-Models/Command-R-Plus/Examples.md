---
title: Command R+ — Code Examples
service: 01-Language-Models
model: Command-R-Plus
section: 03-Models
file: Examples.md
last_updated: 2026-07-28
tags: [language-models, command-r-plus, examples, code, python, RAG]
author: Antigravity AI Knowledge Engine
---

# Command R+ — Code Examples

Practical, executable Python examples demonstrating how to make standard chat requests and configure grounded RAG completions using the official `cohere` SDK (`pip install cohere`).

---

## Example 1: Standard Chat Completion

This script demonstrates a basic prompt call to Command R+.

```python
import os
import cohere

# Initialize client using environment credentials
co = cohere.Client(api_key=os.environ.get("COHERE_API_KEY"))

response = co.chat(
    model="command-r-plus",
    message="What are the main architectural features of the Command R+ model?",
    temperature=0.3
)

print("Response text output:")
print(response.text)
```

---

## Example 2: In-Context RAG Query with Inline Citations

This script passes document chunks to the completions engine, returning grounded answers containing mapped citation pointers.

```python
import os
import cohere

co = cohere.Client(api_key=os.environ.get("COHERE_API_KEY"))

# Define document list payload
documents = [
    {
        "id": "ref_1",
        "title": "Quantum Computing Basics",
        "snippet": "Qubits represent information using superposition states."
    },
    {
        "id": "ref_2",
        "title": "Quantum Coherence",
        "snippet": "Maintaining state coherence requires keeping temperatures below 20 Millikelvin."
    }
]

response = co.chat(
    model="command-r-plus",
    message="How do qubits represent data and what temperature is required to maintain coherence?",
    documents=documents,
    temperature=0.0  # Lock randomness to optimize citation lookup
)

print("--- Answer Text ---")
print(response.text)

print("\n--- Inline Citations ---")
for citation in response.citations:
    print(f"CITED TEXT: '{citation.text}'")
    print(f"Indices: {citation.start} to {citation.end}")
    print(f"Source Documents: {citation.document_ids}")
    print("-" * 30)
```
