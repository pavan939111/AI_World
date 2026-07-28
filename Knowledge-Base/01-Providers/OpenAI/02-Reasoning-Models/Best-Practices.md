---
title: OpenAI Reasoning Models â€” Production Best Practices & Guidelines
provider: OpenAI
capability: 02-Reasoning-Models
file: Best-Practices.md
last_updated: 2026-07-28
tags: [openai, reasoning-models, best-practices, prompt-engineering, reasoning-effort]
author: Antigravity AI Knowledge Engine
---

# OpenAI Reasoning Models â€” Production Best Practices & Guidelines

## 1. Golden Prompt Engineering Rules for Reasoning Models
1. **Avoid Prompting CoT**: Do **NOT** use phrases like "Think step-by-step", "Explain your reasoning", or "Show your scratchpad". The model automatically manages internal CoT.
2. **Use Clear Delimiters**: Wrap inputs in XML tags (`<problem>`, `<constraints>`, `<reference_code>`) to cleanly separate prompt sections.
3. **Use Developer Messages**: Use `"role": "developer"` (or `"role": "system"`) to define behavior guidelines without interfering with reasoning traces.
