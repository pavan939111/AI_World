---
title: Vertex AI â€” Gemini-2-5-Pro-Vertex Specification
provider: Vertex AI
capability: 01-Gemini-Enterprise-Foundation-Models
file: Gemini-2-5-Pro-Vertex.md
last_updated: 2026-07-28
tags: [vertex-ai, gemini, 01-gemini-enterprise-foundation-models, gemini-2-5-pro-vertex]
author: Antigravity AI Documentation Engine
---

# Vertex AI â€” Gemini-2-5-Pro-Vertex

## Overview
Detailed technical specification for **Gemini-2-5-Pro-Vertex** under **01-Gemini-Enterprise-Foundation-Models**.

## Model & Feature Specifications
- **Provider Platform**: Google Cloud Vertex AI (Sundar Pichai & Thomas Kurian)
- **Supported Core Models**: Gemini 2.5 Pro, Gemini 2.5 Flash, Imagen 3, Veo 2, Claude 3.7 Sonnet, Llama 3.3 70B
- **Supported Modalities**: Text, Code, Image, Audio, Video (Native MP4 QA), PDF
- **Context Window**: 2,000,000 tokens (Gemini 2.5 Pro)
- **Pricing**: Gemini 2.5 Pro ($1.25 in / $5.00 out per 1M) | Gemini 2.5 Flash ($0.075 in / $0.30 out)
- **API Availability**: Google Cloud Vertex AI API (us-central1-aiplatform.googleapis.com), Python SDK (google-cloud-aiplatform)
- **Authentication**: Google Cloud IAM Service Account OAuth2 Bearer Tokens
- **Compliance**: SOC 2, ISO 27001, HIPAA, FedRAMP High

## Typical Use Cases
1. Enterprise document understanding analyzing 2,000,000 token PDFs or 1-hour video clips on Google Cloud.
2. Grounding Gemini model responses directly against Google Search or enterprise BigQuery data warehouses.

## Strengths & Limitations
- **Strengths**: #1 2M token context window, native MP4 video understanding, Vertex AI Search enterprise datastore connectors, HIPAA & FedRAMP enterprise compliance.
- **Limitations**: Requires Google Cloud Project configuration and GCP IAM authentication.

## Example Request (Official Python SDK)
`python
import os
import vertexai
from vertexai.generative_models import GenerativeModel

# Initialize Vertex AI with GCP Project and Region
vertexai.init(project=os.environ.get("GCP_PROJECT_ID"), location="us-central1")

# Load Gemini 2.5 Pro Model
model = GenerativeModel("gemini-2.5-pro-preview-0506")

response = model.generate_content(
    "Explain how Vertex AI Search & Conversation grounds LLM responses against enterprise BigQuery data."
)

print(response.text)
`

## Related Documentation & Models
- See official Vertex AI documentation at https://cloud.google.com/vertex-ai/docs
