---
title: AWS Bedrock â€” Enterprise-RAG-Bedrock-Knowledge-Bases-Claude Specification
provider: AWS Bedrock
capability: 11-Architectures-and-Examples
file: Enterprise-RAG-Bedrock-Knowledge-Bases-Claude.md
last_updated: 2026-07-28
tags: [aws-bedrock, amazon-nova, claude, 11-architectures-and-examples, enterprise-rag-bedrock-knowledge-bases-claude]
author: Antigravity AI Documentation Engine
---

# AWS Bedrock â€” Enterprise-RAG-Bedrock-Knowledge-Bases-Claude

## Overview
Detailed technical specification for **Enterprise-RAG-Bedrock-Knowledge-Bases-Claude** under **11-Architectures-and-Examples**.

## Model & Feature Specifications
- **Provider Platform**: AWS Bedrock Cloud Infrastructure (Andy Jassy, Matt Garman, Swami Sivasubramanian)
- **Supported Core Models**: Amazon Nova Pro / Lite / Micro, Anthropic Claude 3.7 Sonnet, Claude 3.5 Sonnet, Meta Llama 3.3 70B, Mistral Large 2
- **Supported Modalities**: Text, Code, Vision (Images/PDFs), Video, Audio, JSON Tool Use
- **Context Window**: 200,000 tokens (Claude 3.7 Sonnet & Nova Pro)
- **Pricing**: Nova Pro ($0.80 in / $3.20 out per 1M) | Claude 3.7 Sonnet ($3.00 in / $15.00 out)
- **API Abstraction**: Unified Converse API across all models (edrock_runtime.converse())
- **Authentication**: AWS IAM SigV4 Bearer Credentials
- **Compliance**: SOC 1/2/3, ISO 27001, HIPAA Eligible, FedRAMP High, AWS KMS Encryption

## Typical Use Cases
1. Enterprise serverless RAG using Bedrock Knowledge Bases with OpenSearch Serverless vector indexing and Claude 3.7 Sonnet.
2. Autonomous agent execution invoking serverless AWS Lambda functions via Bedrock Action Groups.

## Strengths & Limitations
- **Strengths**: Enterprise AWS VPC & IAM security, unified Converse API, Bedrock Knowledge Bases automated RAG, Bedrock Guardrails PII redaction, Amazon Nova cost efficiency.
- **Limitations**: Cross-region inference profile ARN format required for multi-region resilience (us.anthropic.claude-3-7-sonnet...).

## Example Request (Official Python oto3 SDK)
`python
import os
import boto3

# Initialize AWS Bedrock Runtime Client
bedrock = boto3.client("bedrock-runtime", region_name="us-east-1")

# Invoke Claude 3.7 Sonnet using unified Converse API
response = bedrock.converse(
    modelId="us.anthropic.claude-3-7-sonnet-20250219-v1:0",
    messages=[
        {"role": "user", "content": [{"text": "Explain AWS Bedrock Knowledge Bases OpenSearch Serverless RAG architecture."}]}
    ],
    inferenceConfig={"temperature": 0.7, "maxTokens": 1000}
)

output_text = response['output']['message']['content'][0]['text']
print(output_text)
`

## Related Documentation & Models
- See official AWS Bedrock documentation at https://docs.aws.amazon.com/bedrock
