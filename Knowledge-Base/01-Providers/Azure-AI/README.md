---
title: Azure AI (Microsoft) — Complete Technical Specification & Provider Reference
provider: Azure AI
view: By Provider
last_updated: 2026-07-28
tags: [azure-ai, microsoft, azure-openai, phi-4, foundry, search, content-safety, ptu, entrad-id]
author: Antigravity AI Documentation Engine
---

# Azure AI (Microsoft) — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Microsoft Corporation (Azure Cloud & AI Division)
- **Parent Company**: Microsoft Corporation
- **Founders**: Satya Nadella (Chairman & CEO of Microsoft), Scott Guthrie (Executive Vice President of Cloud & AI)
- **Headquarters**: Redmond, Washington, USA
- **Year Founded**: 1975 (Microsoft), 2010 (Microsoft Azure), 2021 (Azure OpenAI Service launch)
- **Mission**: To empower every person and every organization on the planet to achieve more through enterprise cloud AI infrastructure.
- **Market Capitalization**: $3.1 Trillion+ (Microsoft Corporation)
- **AI Ecosystem**: Full-stack enterprise cloud AI platform providing Azure OpenAI Service (exclusive enterprise hosting of GPT-4o, GPT-4o mini, o1, o3-mini, DALL-E 3, Whisper with Microsoft enterprise SLA & private VNet isolation), Azure AI Foundry (hosting 1,600+ open and partner models including Phi-4, Llama 3.3 70B, DeepSeek-R1), Azure AI Search (formerly Cognitive Search with HNSW vector indexing & Semantic Ranker), Azure AI Agent Service, Azure AI Content Safety (Prompt Shield jailbreak defense), Document Intelligence, Provisioned Throughput Units (PTUs), Microsoft Entra ID authentication, and official Azure REST API (`{endpoint}/openai/deployments/{deployment}/chat/completions?api-version=2024-10-21`).
- **Timeline & Major Milestones**:
  - **2015**: Launched Microsoft Cognitive Services (Project Oxford).
  - **2019**: Invested initial $1 Billion into OpenAI, securing exclusive cloud partnership rights.
  - **November 2021**: Announced preview of Azure OpenAI Service.
  - **January 2023**: Announced general availability of Azure OpenAI Service and extended multi-billion dollar investment in OpenAI.
  - **November 2023**: Launched Azure AI Studio (now Azure AI Foundry).
  - **December 2024**: Released Microsoft Phi-4 (14B small language model) and Azure AI Agent Service.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models / Tools | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Azure OpenAI Service** | Enterprise hosting of OpenAI models with zero data retention & VNet link | Yes | GPT-4o, GPT-4o mini, o1, o3-mini, DALL-E 3 | Active |
| **Azure AI Foundry Catalog** | Managed hosting for 1,600+ models with unified developer console | Yes | Phi-4 (14B), Llama 3.3 70B, DeepSeek-R1 | Active |
| **Azure AI Search** | Enterprise vector & hybrid search with Semantic Ranker cross-encoder | Yes | HNSW Vector Indexing, Semantic Ranker | Active |
| **Azure AI Agent Service** | Enterprise multi-agent service connecting LLMs to Azure Functions & tools | Yes | Azure Agent Service SDK | Active |
| **Content Safety & Guardrails** | Prompt Shield jailbreak prevention and groundedness evaluation | Yes | Azure Content Safety API | Active |
| **Cognitive Services** | Enterprise Speech, Vision OCR, and Document Intelligence (Form Recognizer) | Yes | Document Intelligence, Speech Avatar | Active |

---

# 3. Azure OpenAI & Foundational Models

### Service: Azure OpenAI Service
- **Name**: Azure OpenAI Service (`azure-openai`)
- **Supported Models**: GPT-4o, GPT-4o mini, o1, o3-mini, DALL-E 3, Whisper
- **Services Provided by the Service**:
  - **Enterprise Security & Privacy**: Customer data is NEVER used to train OpenAI models. Full support for Private Endpoints, Customer-Managed Keys (CMK), and Managed Identities.
  - **Provisioned Throughput Units (PTUs)**: Guaranteed reserved throughput for predictable enterprise workloads.
- **Pricing**: Pay-As-You-Go ($2.50 in / $10.00 out per 1M for GPT-4o) or PTU reservation.

### Model: Microsoft Phi-4
- **Name**: Phi-4 (`microsoft/phi-4`)
- **Release Date**: December 2024
- **Parameters**: 14 Billion parameters
- **Services Provided by the Model**:
  - **SOTA Small Language Model**: Outperforms models twice its size on STEM and reasoning benchmarks using high-quality synthetic training datasets.

---

# 4. Code Example (Official `azure-ai-inference` Python SDK)

```python
import os
from azure.ai.inference import ChatCompletionsClient
from azure.core.credentials import AzureKeyCredential

# Initialize Azure AI Inference Client
client = ChatCompletionsClient(
    endpoint=os.environ.get("AZURE_AI_ENDPOINT"),
    credential=AzureKeyCredential(os.environ.get("AZURE_AI_KEY"))
)

# Execute query using Azure OpenAI GPT-4o deployment
response = client.complete(
    messages=[
        {"role": "system", "content": "You are an expert enterprise Azure AI architect."},
        {"role": "user", "content": "Explain how Azure AI Search Semantic Ranker improves hybrid vector retrieval."}
    ],
    model="gpt-4o",
    temperature=0.7,
    max_tokens=1000
)

print("Generated Response:")
print(response.choices[0].message.content)
```

---

# 5. Pricing Summary

| Service / Model | Pay-As-You-Go Token Rate (per 1M) |
| :--- | :--- |
| **GPT-4o (Azure OpenAI)** | **$2.50 Input / $10.00 Output** |
| **GPT-4o mini (Azure OpenAI)** | **$0.15 Input / $0.60 Output** |
| **Phi-4 14B (Azure Foundry)** | **$0.15 Input / $0.60 Output** |
| **Azure AI Search (Standard Tier)** | **$0.34 / hour + $0.001 / 1k Semantic Queries** |

---

# 6. Official References

- Official Azure AI Documentation: [learn.microsoft.com/azure/ai-services](https://learn.microsoft.com/azure/ai-services)
- Azure AI Foundry Console: [ai.azure.com](https://ai.azure.com)
- Official Website: [azure.microsoft.com/solutions/ai](https://azure.microsoft.com/solutions/ai)
