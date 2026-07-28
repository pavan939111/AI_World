---
title: Mistral AI — Complete Technical Specification & Provider Reference
provider: Mistral
view: By Provider
last_updated: 2026-07-28
tags: [mistral, moe, mistral-large-2, codestral, pixtral, mistral-ocr]
author: Antigravity AI Documentation Engine
---

# Mistral AI — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Mistral AI SAS
- **Parent Company**: Mistral AI SAS
- **Founders**: Arthur Mensch (CEO, former DeepMind researcher), Guillaume Lample (CTO, former Meta AI FAIR researcher), Timothée Lacroix (CTO, former Meta AI FAIR researcher)
- **Headquarters**: Paris, France
- **Year Founded**: April 2023
- **Mission**: To make frontier AI open, accessible, and customizable while maintaining European data sovereignty.
- **Valuation & Funding**: $6 Billion+ valuation following $640 Million Series B funding round led by General Catalyst.
- **AI Ecosystem**: Full-stack European AI ecosystem providing open-weights and commercial Sparse Mixture-of-Experts (MoE) foundation models (Mistral Large 2, Mistral NeMo, Codestral, Pixtral Large), document OCR parsing (Mistral OCR), vector embeddings (`mistral-embed`), and La Plateforme developer cloud (`api.mistral.ai`).
- **Timeline & Major Milestones**:
  - **April 2023**: Founded in Paris by Arthur Mensch, Guillaume Lample, and Timothée Lacroix.
  - **September 2023**: Released Mistral 7B open-weights model via torrent, outperforming Llama 2 13B.
  - **December 2023**: Released Mixtral 8x7B introducing open-weights Sparse MoE architecture.
  - **February 2024**: Launched La Plateforme cloud API and Mistral Large.
  - **May 2024**: Announced Codestral 22B specialized coding model and Codestral Mamba.
  - **July 2024**: Released Mistral Large 2 (123B parameters, 128k context) and Mistral NeMo (12B).
  - **September 2024**: Released Pixtral 12B multimodal vision model.
  - **November 2024**: Released Pixtral Large (124B vision) and Mistral OCR document parser.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Language Models** | Frontier reasoning, multilingual chat, and 128k long-context dialogue | Yes | Mistral Large 2, Mistral NeMo, Mixtral 8x22B | Active |
| **Coding Models** | Code generation, multi-file refactoring, and Fill-In-Middle (FIM) | Yes | Codestral 22B, Codestral Mamba | Active |
| **Vision Models** | Multimodal visual understanding, chart analysis, screenshot OCR | Yes | Pixtral Large, Pixtral 12B | Active |
| **Document OCR** | High-precision PDF document OCR converting pages into Markdown | Yes | Mistral OCR API (`/v1/ocr`) | Active |
| **Embeddings** | 1,024-dimensional dense vector embeddings for RAG search | Yes | `mistral-embed` | Active |
| **Fine-tuning** | Supervised Fine-Tuning (SFT) & LoRA adaptation on La Plateforme | Yes | `/v1/fine_tuning/jobs` | Active |
| **Tool Use** | Parameter extraction and structured function execution loops | Yes | La Plateforme Messages API | Active |
| **Structured Outputs** | Guaranteed JSON mode schema compliance | Yes | `response_format: { type: "json_object" }` | Active |

---

# 3. Language Models

### Model: Mistral Large 2
- **Name**: Mistral Large 2 (`mistral-large-latest`, `mistral-large-2407`)
- **Release Date**: July 2024
- **Parameters**: 123 Billion parameters
- **Context Window**: 128,000 tokens
- **Input Modalities**: Text
- **Output Modalities**: Text, JSON Schema, Function Calls
- **Services Provided by the Model**:
  - **Frontier Multilingual Dialogue**: Fluent across 80+ human languages (English, French, German, Spanish, Italian, Japanese, Arabic, Chinese).
  - **Multi-Tool Function Calling**: Executing complex multi-tool workflows.
  - **Code Generation & Math**: Competes directly with GPT-4o and Claude 3.5 Sonnet on HumanEval and GSM8K.
- **Pricing**: $2.00 / 1M input tokens | $6.00 / 1M output tokens

### Model: Codestral 22B
- **Name**: Codestral 22B (`codestral-latest`)
- **Release Date**: May 2024
- **Context Window**: 32,000 tokens
- **Services Provided by the Model**:
  - **Fill-In-the-Middle (FIM) API**: `/v1/fim/completions` endpoint for real-time IDE code completion.
  - **80+ Programming Languages**: Python, TypeScript, C++, Rust, Go, Java, SQL.
- **Pricing**: $0.20 / 1M input tokens | $0.60 / 1M output tokens

---

# 4. Code Example (Official `mistralai` Python SDK)

```python
import os
from mistralai import Mistral

# Initialize Mistral client
client = Mistral(api_key=os.environ.get("MISTRAL_API_KEY"))

# Complete chat request
response = client.chat.complete(
    model="mistral-large-latest",
    messages=[
        {"role": "system", "content": "You are a helpful European AI assistant."},
        {"role": "user", "content": "Explain the architectural advantages of Sparse Mixture-of-Experts (MoE)."}
    ]
)

print(response.choices[0].message.content)
```

---

# 5. Pricing Summary

| Model | Input Rate / 1M | Output Rate / 1M |
| :--- | :--- | :--- |
| **Mistral Large 2** | $2.00 | $6.00 |
| **Codestral 22B** | $0.20 | $0.60 |
| **Pixtral Large (Vision)** | $2.00 | $6.00 |
| **Mistral NeMo** | $0.15 | $0.15 |
| **mistral-embed** | $0.10 | N/A |
| **Mistral OCR API** | $1.00 / 1,000 pages | N/A |

---

# 6. Official References

- Official Mistral AI Documentation: [docs.mistral.ai](https://docs.mistral.ai)
- La Plateforme Console: [console.mistral.ai](https://console.mistral.ai)
- Official Website: [mistral.ai](https://mistral.ai)
