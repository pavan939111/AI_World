---
title: Cohere — Complete Technical Specification & Provider Reference
provider: Cohere
view: By Provider
last_updated: 2026-07-28
tags: [cohere, command-r-plus, rerank-v3-5, embed-v3, rag, enterprise-ai]
author: Antigravity AI Documentation Engine
---

# Cohere — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Cohere Inc.
- **Parent Company**: Cohere Inc.
- **Founders**: Aidan Gomez (CEO, co-author of the seminal "Attention Is All You Need" Transformer paper), Ivan Zhang, Nick Frosst
- **Headquarters**: Toronto, Ontario, Canada (Secondary HQs in San Francisco & London)
- **Year Founded**: 2019
- **Mission**: To power enterprise AI application development with private, secure, and customizable foundation models.
- **Valuation & Funding**: $5 Billion+ valuation with $500M+ Series D funding round led by PSP Investments, Cisco, AMD, NVIDIA, and Oracle.
- **AI Ecosystem**: Comprehensive enterprise AI ecosystem providing Command language models (Command R+, Command R), industry-standard semantic reranking models (`rerank-v3.5`), dense vector embedding models (`embed-english-v3.0`, `embed-multilingual-v3.0`), multi-step agentic RAG with inline document citations, and multi-cloud deployment (AWS Bedrock, Azure AI, Oracle Cloud OCI, Private VPC).
- **Timeline & Major Milestones**:
  - **2019**: Founded in Toronto by Aidan Gomez, Ivan Zhang, and Nick Frosst.
  - **2021**: Launched Cohere platform API and Embed v1.
  - **2022**: Released Command model series and Rerank v1.
  - **June 2023**: Partnered with Oracle to embed Cohere LLMs across Oracle Cloud Infrastructure (OCI).
  - **March 2024**: Announced Command R (35B parameters, 128k context) optimized for retrieval-augmented generation.
  - **April 2024**: Released Command R+ (104B parameters) flagship enterprise model.
  - **October 2024**: Released Rerank v3.5 and Embed v3 supporting Int8 & Binary vector quantization.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Language Models** | Enterprise dialogue, multi-step RAG, and long-context tool use | Yes | Command R+, Command R, Command Light | Active |
| **Reranking Models** | Industry-standard semantic rerankers for RAG optimization | Yes | rerank-v3.5, rerank-english-v3.0, rerank-multilingual-v3.0 | Active |
| **Embedding Models** | 1,024-dim dense vector embeddings with Int8 & Binary quantization | Yes | embed-english-v3.0, embed-multilingual-v3.0 | Active |
| **Agentic RAG Engine** | Multi-hop search synthesis with automated inline document citations | Yes | Messages API (`citation_quality`) | Active |
| **Multi-Cloud APIs** | Serverless endpoints deployed across AWS, Azure, OCI, and private VPC | Yes | AWS Bedrock, Azure AI, Oracle OCI | Active |
| **Tool Use** | Function parameter extraction and execution loops | Yes | Messages API (`tools`) | Active |
| **Structured Outputs** | Guaranteed JSON mode response schemas | Yes | `response_format: { type: "json_object" }` | Active |

---

# 3. Language Models

### Model: Command R+
- **Name**: Command R+ (`command-r-plus-08-2024`)
- **Release Date**: April 2024 / Updated August 2024
- **Parameters**: 104 Billion parameters
- **Context Window**: 128,000 tokens
- **Input Modalities**: Text, Web Connectors, Documents
- **Output Modalities**: Text, JSON Schema, Citations, Function Calls
- **Services Provided by the Model**:
  - **Multi-Step Enterprise RAG**: Generating text grounded in enterprise documents with automated inline spans.
  - **Multi-Lingual Business Dialogue**: Fluent across English, French, German, Spanish, Italian, Portuguese, Japanese, Korean, Arabic, Chinese.
  - **Multi-Tool Calling**: Executing complex multi-step tool workflows.
- **Pricing**: $2.50 / 1M input tokens | $10.00 / 1M output tokens

### Model: Rerank v3.5
- **Name**: Rerank v3.5 (`rerank-v3.5`)
- **Services Provided by the Model**:
  - **Semantic Document Reranking**: Sorting retrieved vector search chunks by true semantic relevance to query.
- **Pricing**: $2.00 per 1,000 search units

---

# 4. Code Example (Official `cohere` Python SDK)

```python
import os
import cohere

# Initialize Cohere Client (ClientV2)
co = cohere.ClientV2(api_key=os.environ.get("CO_API_KEY"))

# Execute Chat request with Command R+
response = co.chat(
    model="command-r-plus-08-2024",
    messages=[
        {"role": "system", "content": "You are a helpful enterprise AI assistant."},
        {"role": "user", "content": "Explain two-stage enterprise RAG architecture using Cohere Embed and Rerank."}
    ]
)

print(response.message.content[0].text)
```

---

# 5. Pricing Summary

| Model | Input Rate / 1M | Output Rate / 1M |
| :--- | :--- | :--- |
| **Command R+** | $2.50 | $10.00 |
| **Command R** | $0.15 | $0.60 |
| **Rerank v3.5** | $2.00 / 1k search units | N/A |
| **embed-english-v3.0** | $0.10 | N/A |
| **embed-multilingual-v3.0** | $0.10 | N/A |

---

# 6. Official References

- Official Cohere Documentation: [docs.cohere.com](https://docs.cohere.com)
- Cohere Dashboard Console: [dashboard.cohere.com](https://dashboard.cohere.com)
- Official Website: [cohere.com](https://cohere.com)
