---
title: Language Models — Groq
service: 01-Language-Models
section: 02-Providers
file: Groq.md
last_updated: 2026-07-28
tags: [language-models, llm, providers, groq, lpu]
author: Antigravity AI Knowledge Engine
---

# Groq Provider Profile

**Groq** is a specialized hardware and cloud platform company that focuses on ultra-low-latency inference serving of open-weights Large Language Models. Rather than relying on standard graphics processors (GPUs), Groq designed a custom chip called the **Language Processing Unit (LPU)**.

---

## 1. Core Platform Capabilities

Groq does not train custom foundation models; instead, it compiles and hosts popular open-weights models, offering generation speeds:

* **Supported Model Catalog**:
  * **Llama 3.3 (70B)** and **Llama 3.1 (8B)**.
  * **DeepSeek-R1** and **DeepSeek-V3**.
  * **Mixtral 8x7B** (sparse MoE).
  * **Gemma 2 (9B / 27B)**.
* **Speed Performance**: Exceeds GPU serving speeds. Groq commonly delivers **300 to 800+ Tokens Per Second (TPS)** depending on the model size, with Time-to-First-Token (TTFT) latency under 50 milliseconds.

---

## 2. Hardware Architecture (LPU vs. GPU)

Groq's performance gains stem from their unique chip design:

* **SRAM vs. HBM**: Modern GPUs use High Bandwidth Memory (HBM) which acts as a cache bottleneck during text generation. Groq LPUs bypass HBM entirely and use **Static Random-Access Memory (SRAM)** distributed directly across the chip.
* **Memory Bandwidth**: SRAM access is orders of magnitude faster than HBM, eliminating the memory bandwidth constraint of autoregressive generation.
* **Deterministic Execution**: The LPU has no dynamic instruction cache, branch predictors, or hardware schedulers. Execution paths and timing are completely controlled by the compiler at compile-time, ensuring deterministic execution time.
* **Scale Limitation**: SRAM is significantly more expensive and less dense than HBM. A single LPU only holds ~230MB of memory. To host a 70B parameter model, Groq must link hundreds of LPU chips together in a large network array, which increases hardware cost and limits maximum context windows (usually capped at 8k to 32k).

---

## 3. Integration Standards

Groq provides an OpenAI-compatible API interface, allowing developers to switch their existing OpenAI pipelines to Groq's low-latency servers by changing the client configuration.

### Integration Example (Python SDK)
```python
import os
from openai import OpenAI

# Initialize the OpenAI client pointing to Groq's endpoint
client = OpenAI(
    base_url="https://api.groq.com/openai/v1",
    api_key=os.environ.get("GROQ_API_KEY")
)

response = client.chat.completions.create(
    model="llama-3.3-70b-versatile",
    messages=[
        {"role": "user", "content": "Analyze this code for race conditions."}
    ],
    temperature=0.2
)

print(response.choices[0].message.content)
```

* **Use Case Fit**: Groq is ideal for real-time applications such as interactive voice agents, conversational autocomplete, agentic tool-use loops, and real-time structured data extraction where generation speed is critical.
