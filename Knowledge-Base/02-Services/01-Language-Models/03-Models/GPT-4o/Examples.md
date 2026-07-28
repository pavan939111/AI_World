---
title: GPT-4o — Code Examples
service: 01-Language-Models
model: GPT-4o
section: 03-Models
file: Examples.md
last_updated: 2026-07-28
tags: [language-models, gpt-4o, examples, code, python, vision]
author: Antigravity AI Knowledge Engine
---

# GPT-4o — Code Examples

Practical, executable Python examples demonstrating vision parsing and structured outputs.

---

## Example 1: Vision Ingestion (OCR & Data Extraction)

This script parses an image file (e.g., an invoice image) and extracts specific structured data.

```python
import os
import base64
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

def encode_image(image_path):
    with open(image_path, "rb") as image_file:
        return base64.b64encode(image_file.read()).decode("utf-8")

# Path to the visual file
image_path = "invoice_sample.jpg"
base64_image = encode_image(image_path)

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {
            "role": "user",
            "content": [
                {
                    "type": "text",
                    "text": "Extract the invoice number, total amount, and due date. Return as JSON."
                },
                {
                    "type": "image_url",
                    "image_url": {
                        "url": f"data:image/jpeg;base64,{base64_image}",
                        "detail": "high"
                    }
                }
            ]
        }
    ],
    response_format={"type": "json_object"}
)

print(response.choices[0].message.content)
```

---

## Example 2: Structured Outputs (Pydantic Validation)

This script uses Pydantic to enforce schema validation on the generated output.

```python
import os
from openai import OpenAI
from pydantic import BaseModel, Field
from typing import List

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Define the target structure
class Step(BaseModel):
    step_number: int
    instruction: str

class Recipe(BaseModel):
    recipe_name: str
    ingredients: List[str]
    steps: List[Step] = Field(description="Sequential cooking instructions")

# API call enforcing the schema
completion = client.beta.chat.completions.parse(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": "You are a recipe generator agent."},
        {"role": "user", "content": "Generate a simple recipe for scrambled eggs."}
    ],
    response_format=Recipe,
)

# Parse response natively as a Pydantic object
recipe = completion.choices[0].message.parsed
print(f"Recipe Name: {recipe.recipe_name}")
for ing in recipe.ingredients:
    print(f"- {ing}")
for step in recipe.steps:
    print(f"{step.step_number}. {step.instruction}")
```
