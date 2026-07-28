---
title: Cerebras Systems — Complete Technical Specification & Provider Reference
provider: Cerebras
view: By Provider
last_updated: 2026-07-28
tags: [cerebras, wse-3, cs-3, llama-3-3-70b, 2100-tokens-per-second, wafer-scale, hardware-acceleration]
author: Antigravity AI Documentation Engine
---

# Cerebras Systems — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Cerebras Systems Inc.
- **Parent Company**: Cerebras Systems Inc.
- **Founders**: Andrew Feldman (CEO & Founder, former founder & CEO of SeaMicro acquired by AMD), Gary Lauterbach (CTO), Michael James, Sean Lie, Jean-Philippe Fricker
- **Headquarters**: Sunnyvale, California, USA (R&D facilities in San Diego, Toronto, and Tokyo)
- **Year Founded**: 2015
- **Mission**: To solve the biggest challenges in AI computing by building wafer-scale processors and ultra-fast inference supercomputers.
- **Valuation & Funding**: $4 Billion+ valuation following $715M in funding led by Foundation Capital, Benchmark, Alpha Wave Global, Altimeter Capital, and Abu Dhabi G42.
- **AI Ecosystem**: Wafer-scale AI hardware and ultra-fast inference cloud platform powered by the **Wafer-Scale Engine 3 (WSE-3)** — a single 21.5cm x 21.5cm silicon wafer packed with 4 Trillion transistors, 900,000 AI cores, and 44GB of on-wafer SRAM delivering **2,100+ tokens/second** for Llama 3.3 70B and 3,000+ tokens/second for Llama 3.1 8B, alongside Cerebras Software Language (CSL), PyTorch Wafer Compiler, and official REST API (`api.cerebras.ai/v1`).
- **Timeline & Major Milestones**:
  - **2015**: Founded in Sunnyvale by Andrew Feldman and Gary Lauterbach.
  - **2019**: Introduced WSE-1 — the world's first wafer-scale chip (1.2 Trillion transistors).
  - **2021**: Introduced WSE-2 (2.6 Trillion transistors, 850,000 cores).
  - **March 2024**: Unveiled WSE-3 and CS-3 AI Supercomputer (4 Trillion transistors, 900,000 cores).
  - **August 2024**: Launched Cerebras Inference Cloud, achieving world records by running Llama 3.1 70B at 1,800+ tokens/second.
  - **December 2024**: Released Llama 3.3 70B on Cerebras Cloud running at **2,100+ tokens/second**.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Ultra-Fast Language LLMs** | World's fastest text generation (2,100+ tok/s for 70B models) powered by WSE-3 | Yes | Llama 3.3 70B, Llama 3.1 8B | Active |
| **Reasoning Models** | Extended chain-of-thought reasoning models running at 2,000+ tok/s | Yes | DeepSeek-R1 Distill Llama 70B/8B | Active |
| **WSE-3 Hardware Engine** | Wafer-Scale Engine (4 Trillion transistors, 44GB SRAM, 21 PB/s bandwidth) | Yes | CS-3 AI Supercomputer | Active |
| **PyTorch Wafer Compiler** | Compiling PyTorch models directly to run on wafer hardware without modification | Yes | Cerebras CSL & PyTorch SDK | Active |
| **OpenAI Compatible API** | Drop-in REST API compatibility with `/v1/chat/completions` | Yes | `api.cerebras.ai/v1` | Active |

---

# 3. Ultra-Fast Language & Reasoning Models

### Model: Llama 3.3 70B (Cerebras Wafer Accelerated)
- **Name**: Llama 3.3 70B (`llama-3.3-70b`)
- **Release Date**: December 2024
- **Parameters**: 70 Billion parameters
- **Context Window**: 128,000 tokens
- **Inference Speed**: **2,100+ tokens / second**
- **Services Provided by the Model**:
  - **World-Record Response Speed**: Generates a full 1,000-word response in less than 0.5 seconds.
  - **Real-Time Voice Agent Engine**: Enables near-zero latency (<200ms end-to-end turn time) conversational agents.
- **Pricing**: $0.60 / 1,000,000 input & output tokens

### Model: Llama 3.1 8B
- **Name**: Llama 3.1 8B (`llama3.1-8b`)
- **Inference Speed**: **3,000+ tokens / second**
- **Pricing**: $0.10 / 1,000,000 input & output tokens

---

# 4. Code Example (Official `cerebras-cloud-sdk` Python SDK)

```python
import os
from cerebras.cloud.sdk import Cerebras

# Initialize Cerebras Client
client = Cerebras(api_key=os.environ.get("CEREBRAS_API_KEY"))

# Execute ultra-fast query generating 2,100+ tokens/second
response = client.chat.completions.create(
    model="llama-3.3-70b",
    messages=[
        {"role": "system", "content": "You are a helpful AI assistant powered by Cerebras WSE-3 wafer hardware."},
        {"role": "user", "content": "Explain how 44GB on-wafer SRAM memory eliminates HBM memory bandwidth bottlenecks."}
    ],
    temperature=0.7,
    max_tokens=1000
)

print(response.choices[0].message.content)
```

---

# 5. Pricing Summary

| Model | Speed (Tokens / Sec) | Input & Output Price / 1M Tokens |
| :--- | :--- | :--- |
| **Llama 3.1 8B** | **3,000+ tok/s** | **$0.10 / 1M tokens** |
| **Llama 3.3 70B** | **2,100+ tok/s** | **$0.60 / 1M tokens** |
| **DeepSeek-R1 Distill 70B** | **2,000+ tok/s** | **$0.60 / 1M tokens** |

---

# 6. Official References

- Official Cerebras API Documentation: [inference-docs.cerebras.ai](https://inference-docs.cerebras.ai)
- Cerebras Cloud Developer Dashboard: [cloud.cerebras.ai](https://cloud.cerebras.ai)
- Official Website: [cerebras.ai](https://cerebras.ai)
