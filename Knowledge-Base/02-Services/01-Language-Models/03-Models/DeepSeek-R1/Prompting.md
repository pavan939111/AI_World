---
title: DeepSeek-R1 — Prompting Guide
service: 01-Language-Models
model: DeepSeek-R1
section: 03-Models
file: Prompting.md
last_updated: 2026-07-28
tags: [language-models, deepseek-r1, prompting, guide]
author: Antigravity AI Knowledge Engine
---

# DeepSeek-R1 — Prompting Guide

Prompting a reasoning model like DeepSeek-R1 requires different strategies compared to standard text models.

---

## 1. Avoid Chain-of-Thought System Prompts

Standard models benefit from instructions like "think step-by-step" or "provide a detailed explanation of your reasoning."

> [!IMPORTANT]
> **Do not add "think step-by-step" or "explain your reasoning" to DeepSeek-R1 prompts.**
> R1 is trained via Reinforcement Learning to generate its own reasoning path automatically. Adding redundant instructions can confuse the alignment layers, resulting in repetitive, verbose thinking loops.

---

## 2. Managing Output Schemas (XML over JSON)

If your application requires structured configurations:
* **Avoid Raw JSON Objects**: Because R1 outputs a thinking trace, forcing JSON format settings via parameter values can break output formatting if the model writes the trace inside the JSON structure.
* **The XML Solution**: Instruct the model to return the final answer inside custom XML tag markers (e.g. `<final_answer>...</final_answer>`). This allows the model to think freely in plain text before outputting structured parameters within clean wrappers:

```text
[System Instructions]
Determine the computational complexity of the user's function.
Write the final complexity inside the designated <complexity_format> tags.

[User Query]
function calculate(n) {
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      console.log(i + j);
    }
  }
}
```

---

## 3. Directing the System Directives

Keep system rules direct and clean:
* Clearly separate instructions, background files, and queries using standard dividers (e.g., `---` or XML tags).
* Do not restrict length within the thinking trace; focus constraints strictly on the final visible completion format.
