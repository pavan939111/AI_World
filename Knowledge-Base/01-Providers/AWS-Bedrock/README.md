---
title: AWS Bedrock (Amazon Web Services) — Complete Technical Specification & Provider Reference
provider: AWS Bedrock
view: By Provider
last_updated: 2026-07-28
tags: [aws-bedrock, amazon, nova, claude-3-7, knowledge-bases, agents, guardrails, converse-api, boto3]
author: Antigravity AI Documentation Engine
---

# AWS Bedrock (Amazon Web Services) — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Amazon Web Services Inc. (Amazon.com Inc.)
- **Parent Company**: Amazon.com Inc.
- **Founders**: Andy Jassy (President & CEO of Amazon.com), Matt Garman (CEO of AWS), Swami Sivasubramanian (Vice President of AI and Data at AWS)
- **Headquarters**: Seattle, Washington, USA
- **Year Founded**: 2006 (Amazon Web Services), April 2023 (AWS Bedrock launch)
- **Mission**: To provide the easiest way to build and scale generative AI applications with top foundation models on cloud-native AWS infrastructure.
- **Market Capitalization**: $1.9 Trillion+ (Amazon.com Inc.)
- **AI Ecosystem**: Comprehensive managed generative AI cloud platform providing Amazon Nova models (Nova Pro, Nova Lite, Nova Micro), Amazon Titan, exclusive cloud partner hosting of Anthropic Claude 3.7 Sonnet, Claude 3.5 Sonnet, Meta Llama 3.3 70B, Mistral Large 2, Cohere Command R+, Bedrock Knowledge Bases (automated OpenSearch Serverless vector indexing and RAG), Bedrock Agents & Action Groups (integrated with serverless AWS Lambda), Bedrock Guardrails (PII redaction and contextual grounding checks), unified `Converse` API, AWS Trainium & Inferentia custom fine-tuning, and official AWS Bedrock REST API (`bedrock-runtime.{region}.amazonaws.com`).
- **Timeline & Major Milestones**:
  - **April 2023**: Announced AWS Bedrock in preview.
  - **September 2023**: Announced General Availability (GA) of AWS Bedrock.
  - **November 2023**: Launched Bedrock Knowledge Bases and Bedrock Guardrails at AWS re:Invent 2023.
  - **May 2024**: Introduced unified `Converse` API across all Bedrock models.
  - **December 2024**: Released Amazon Nova model family (Nova Pro, Lite, Micro) at AWS re:Invent 2024.
  - **February 2025**: Hosted Anthropic Claude 3.7 Sonnet on day one with cross-region inference profiles.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models / Tools | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Amazon Nova & Titan Models** | Amazon proprietary multimodal & text foundation models | Yes | Nova Pro, Nova Lite, Nova Micro, Titan Image v2 | Active |
| **Anthropic Claude on Bedrock** | Managed cloud hosting of Anthropic Claude models with AWS VPC security | Yes | Claude 3.7 Sonnet, Claude 3.5 Sonnet, Claude 3.5 Haiku | Active |
| **Third-Party Foundation Models** | Serverless hosting for partner models | Yes | Meta Llama 3.3 70B, Mistral Large 2, Cohere Command R+ | Active |
| **Bedrock Knowledge Bases** | Automated managed RAG pipelines with OpenSearch Serverless | Yes | Bedrock Knowledge Bases API | Active |
| **Bedrock Agents & Action Groups** | Multi-step autonomous agent execution integrated with AWS Lambda | Yes | Bedrock Agents API | Active |
| **Bedrock Guardrails** | Enterprise AI safety, PII redaction, & hallucination evaluation | Yes | Bedrock Guardrails API | Active |
| **Converse API Abstraction** | Unified multi-turn chat & tool use API across all Bedrock models | Yes | `bedrock_runtime.converse()` | Active |

---

# 3. Amazon Nova & Anthropic Claude Models

### Model: Amazon Nova Pro
- **Name**: Amazon Nova Pro (`amazon.nova-pro-v1:0`)
- **Release Date**: December 2024
- **Input Modalities**: Text, Images, Documents (PDFs), Video
- **Services Provided by the Model**:
  - **Multimodal Enterprise Reasoning**: Frontier accuracy on text, visual document understanding, and video analysis at a fraction of standard LLM pricing.
- **Pricing**: $0.80 / 1M input tokens | $3.20 / 1M output tokens

### Model: Anthropic Claude 3.7 Sonnet (AWS Bedrock)
- **Name**: Claude 3.7 Sonnet (`us.anthropic.claude-3-7-sonnet-20250219-v1:0`)
- **Release Date**: February 2025
- **Services Provided by the Model**:
  - **Hybrid Reasoning Model**: Combines instant response capabilities with extended chain-of-thought thinking tokens.
- **Pricing**: $3.00 / 1M input tokens | $15.00 / 1M output tokens

---

# 4. Code Example (Official `boto3` Python SDK)

```python
import os
import boto3

# Initialize AWS Bedrock Runtime Client
bedrock = boto3.client("bedrock-runtime", region_name="us-east-1")

# Call Claude 3.7 Sonnet using unified Converse API
response = bedrock.converse(
    modelId="us.anthropic.claude-3-7-sonnet-20250219-v1:0",
    messages=[
        {"role": "user", "content": [{"text": "Explain AWS Bedrock Knowledge Bases OpenSearch Serverless RAG architecture."}]}
    ],
    inferenceConfig={"temperature": 0.7, "maxTokens": 1000}
)

print("Generated Response:")
print(response['output']['message']['content'][0]['text'])
```

---

# 5. Pricing Summary

| Model / Service | Input Price / 1M Tokens | Output Price / 1M Tokens |
| :--- | :--- | :--- |
| **Amazon Nova Micro** | **$0.035** | **$0.140** |
| **Amazon Nova Lite** | **$0.060** | **$0.240** |
| **Amazon Nova Pro** | **$0.800** | **$3.200** |
| **Claude 3.7 Sonnet** | **$3.000** | **$15.000** |
| **Llama 3.3 70B** | **$0.720** | **$0.720** |

---

# 6. Official References

- Official AWS Bedrock Documentation: [docs.aws.amazon.com/bedrock](https://docs.aws.amazon.com/bedrock)
- AWS Bedrock Console: [console.aws.amazon.com/bedrock](https://console.aws.amazon.com/bedrock)
- Official Website: [aws.amazon.com/bedrock](https://aws.amazon.com/bedrock)
