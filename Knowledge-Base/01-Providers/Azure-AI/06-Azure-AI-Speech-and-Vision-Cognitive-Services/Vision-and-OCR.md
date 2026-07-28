---
title: Azure AI â€” Vision-and-OCR Specification
provider: Azure AI
capability: 06-Azure-AI-Speech-and-Vision-Cognitive-Services
file: Vision-and-OCR.md
last_updated: 2026-07-28
tags: [azure-ai, azure-openai, 06-azure-ai-speech-and-vision-cognitive-services, vision-and-ocr]
author: Antigravity AI Documentation Engine
---

# Azure AI â€” Vision-and-OCR

## Overview
Detailed technical specification for **Vision-and-OCR** under **06-Azure-AI-Speech-and-Vision-Cognitive-Services**.

## Model & Feature Specifications
- **Provider Platform**: Microsoft Azure AI & Enterprise Cloud (Satya Nadella & Scott Guthrie)
- **Supported Core Models**: Azure OpenAI GPT-4o, GPT-4o mini, o1, o3-mini, DALL-E 3, Microsoft Phi-4, Llama 3.3 70B, DeepSeek-R1
- **Supported Modalities**: Text, Code, Vision, Audio, Document OCR, Avatar TTS
- **Context Window**: 128,000 tokens (GPT-4o)
- **Pricing**: Pay-As-You-Go ($2.50 in / $10.00 out per 1M for GPT-4o) or Provisioned Throughput Units (PTUs)
- **API Availability**: Azure OpenAI API (openai.azure.com), Azure AI Inference SDK (zure-ai-inference)
- **Authentication**: Microsoft Entra ID (Azure AD OAuth2) & Azure Subscription Key (pi-key)
- **Compliance**: ISO 27001, SOC 2, HIPAA, FedRAMP High, Private VNet Link

## Typical Use Cases
1. Enterprise deployment of GPT-4o models with zero customer data retention and private VNet network isolation.
2. Hybrid vector search using Azure AI Search with Semantic Ranker cross-encoder reranking.

## Strengths & Limitations
- **Strengths**: Exclusive enterprise OpenAI partnership, Microsoft VNet private link security, Azure AI Search Semantic Ranker, Prompt Shield jailbreak defense, Provisioned Throughput Units (PTUs).
- **Limitations**: Deployment name strings required in endpoint URIs (deployments/{deployment_name}/chat/completions).

## Example Request (Official Python SDK)
`python
import os
from azure.ai.inference import ChatCompletionsClient
from azure.core.credentials import AzureKeyCredential

# Initialize Azure AI Inference Client
client = ChatCompletionsClient(
    endpoint=os.environ.get("AZURE_AI_ENDPOINT"),
    credential=AzureKeyCredential(os.environ.get("AZURE_AI_KEY"))
)

response = client.complete(
    messages=[
        {"role": "system", "content": "You are a helpful assistant powered by Azure AI."},
        {"role": "user", "content": "Explain Azure AI Search Semantic Ranker hybrid search."}
    ],
    model="gpt-4o",
    temperature=0.7,
    max_tokens=1000
)

print(response.choices[0].message.content)
`

## Related Documentation & Models
- See official Azure AI documentation at https://learn.microsoft.com/azure/ai-services & https://ai.azure.com
