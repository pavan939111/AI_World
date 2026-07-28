---
title: Claude 3.7 Sonnet — Code Examples
service: 01-Language-Models
model: Claude-3-7-Sonnet
section: 03-Models
file: Examples.md
last_updated: 2026-07-28
tags: [language-models, claude-3-7-sonnet, examples, code, python, reasoning]
author: Antigravity AI Knowledge Engine
---

# Claude 3.7 Sonnet — Code Examples

Practical, executable Python examples showing how to configure Thinking Mode and utilize XML prompt structures.

---

## Example 1: Enabling Thinking Mode (Reasoning)

This script configures a thinking budget, forcing the model to allocate reasoning tokens, and prints out the final answer.

```python
import os
import anthropic

client = anthropic.Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))

# API call configuring thinking budget
response = client.messages.create(
    model="claude-3-7-sonnet-20250219",
    max_tokens=4096,  # Must be larger than thinking budget
    temperature=1.0,  # Required to be exactly 1.0 when thinking is enabled
    thinking={
        "type": "enabled",
        "budget_tokens": 2048  # Allocates 2048 tokens for internal reasoning
    },
    messages=[
        {
            "role": "user",
            "content": "Verify if there is a race condition in a multi-threaded Python increment operation: `x += 1`"
        }
    ]
)

# Output final response
print("Response Output:")
print(response.content[0].text)
```

---

## Example 2: XML Structured Prompts for Code Review

This script passes code inside XML tags, guiding the model to evaluate the structure and return results inside designated output wrappers.

```python
import os
import anthropic

client = anthropic.Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))

# Structured XML Prompt
prompt = """
<instructions>
Review the provided Go source code file. Identify any issues with unclosed database connections.
</instructions>

<code_file>
package main

import (
    "database/sql"
    _ "github.com/lib/pq"
)

func getUserEmail(db *sql.DB, userId int) (string, error) {
    rows, err := db.Query("SELECT email FROM users WHERE id = $1", userId)
    if err != nil {
        return "", err
    }
    // Note: missing defer rows.Close() here
    
    var email string
    for rows.Next() {
        err = rows.Scan(&email)
        if err != nil {
            return "", err
        }
    }
    return email, nil
}
</code_file>

Please structure your review inside <review_output> tags.
"""

response = client.messages.create(
    model="claude-3-7-sonnet-20250219",
    max_tokens=1024,
    messages=[
        {"role": "user", "content": prompt}
    ]
)

print(response.content[0].text)
```
