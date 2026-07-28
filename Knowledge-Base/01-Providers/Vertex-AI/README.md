---
title: Vertex AI (Google Cloud) — Complete Technical Specification & Provider Reference
provider: Vertex AI
view: By Provider
last_updated: 2026-07-28
tags: [vertex-ai, google-cloud, gemini-2-5, model-garden, agent-builder, search, mlops, tpu]
author: Antigravity AI Documentation Engine
---

# Vertex AI (Google Cloud) — Complete Technical Specification & Provider Reference

# 1. Company Overview

- **Company**: Google Cloud (Alphabet Inc.)
- **Parent Company**: Alphabet Inc.
- **Founders**: Sundar Pichai (CEO of Alphabet Inc.), Thomas Kurian (CEO of Google Cloud)
- **Headquarters**: Sunnyvale, California, USA / Mountain View, CA
- **Year Founded**: 2008 (Google Cloud), May 2021 (Vertex AI launch)
- **Mission**: To empower enterprises to build, train, deploy, and scale state-of-the-art generative AI applications on Google Cloud infrastructure.
- **Market Capitalization**: $2.0 Trillion+ (Alphabet Inc.)
- **AI Ecosystem**: Full-stack enterprise unified AI platform providing Gemini 2.5 Pro (2M token context window), Gemini 2.5 Flash, Imagen 3, Veo 2, Vertex Model Garden (hosting 150+ models including Claude 3.7 Sonnet, Llama 3.3 70B, Mistral Large 2), Vertex AI Search & Conversation (grounding against BigQuery, SharePoint, Salesforce, Google Drive), Vertex AI Agent Builder, Supervised Fine-Tuning & Model Distillation on Google TPU v5p clusters, Kubeflow MLOps Pipelines, and official Google Cloud REST API (`us-central1-aiplatform.googleapis.com/v1`).
- **Timeline & Major Milestones**:
  - **May 2021**: Announced Vertex AI unifying AutoML and AI Platform into a single enterprise GCP console.
  - **March 2023**: Launched Generative AI support on Vertex AI and Model Garden.
  - **December 2023**: Integrated Gemini 1.0 models into Vertex AI.
  - **February 2024**: Introduced Gemini 1.5 Pro featuring 1,000,000 token context.
  - **May 2024**: Expanded Gemini 1.5 Pro to 2,000,000 token context window and launched Vertex AI Agent Builder.
  - **December 2024**: Released Gemini 2.5 Pro and Gemini 2.5 Flash on Vertex AI.

---

# 2. AI Services Overview

| Service | Description | API Available | Main Models / Tools | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Gemini Enterprise Models** | SOTA 2M context LLMs with multimodal audio, video, & document QA | Yes | Gemini 2.5 Pro, Gemini 2.5 Flash, Imagen 3, Veo 2 | Active |
| **Model Garden** | Managed hosting for 150+ third-party & open models on GCP | Yes | Claude 3.7 Sonnet, Llama 3.3 70B, Mistral Large 2 | Active |
| **Vertex AI Search & Grounding** | Enterprise datastore connectors and live Google Web Search grounding | Yes | `google_search_retrieval`, Datastore Connectors | Active |
| **Vertex AI Agent Builder** | Low-code environment building multi-agent workflows & REST tools | Yes | Agent Builder Console | Active |
| **Model Tuning & Distillation** | SFT fine-tuning and model distillation on Google TPU v5p clusters | Yes | Vertex Fine-Tuning API | Active |
| **MLOps & Kubeflow Pipelines** | Serverless ML workflow orchestration, Feature Store, Model Registry | Yes | Kubeflow Pipelines (`kfp`), Feature Store | Active |

---

# 3. Gemini Enterprise Models

### Model: Gemini 2.5 Pro (Vertex AI)
- **Name**: Gemini 2.5 Pro (`gemini-2.5-pro-preview-0506`)
- **Release Date**: December 2024
- **Context Window**: **2,000,000 tokens**
- **Input Modalities**: Text, Code, Images, Audio, Video (Native MP4 QA), PDF Documents
- **Services Provided by the Model**:
  - **2M Token Context Window**: Analyzing entire codebases, 2,000-page PDF contracts, or 1-hour video clips in a single prompt.
  - **Native Multimodal Audio & Video QA**: Direct audio waveform and video frame analysis without external transcription.
- **Pricing**: $1.25 / 1M input tokens | $5.00 / 1M output tokens

### Model: Gemini 2.5 Flash (Vertex AI)
- **Name**: Gemini 2.5 Flash (`gemini-2.5-flash-preview-0506`)
- **Pricing**: $0.075 / 1M input tokens | $0.30 / 1M output tokens

---

# 4. Code Example (Official `google-cloud-aiplatform` Python SDK)

```python
import os
import vertexai
from vertexai.generative_models import GenerativeModel

# Initialize Vertex AI with GCP Project ID and Region
vertexai.init(project=os.environ.get("GCP_PROJECT_ID"), location="us-central1")

# Load Gemini 2.5 Pro Model
model = GenerativeModel("gemini-2.5-pro-preview-0506")

# Execute 2M context query
response = model.generate_content(
    "Explain how Vertex AI Search & Conversation grounds LLM responses against enterprise BigQuery data warehouses."
)

print("Generated Response:")
print(response.text)
```

---

# 5. Pricing Summary

| Model / Service | Input Price / 1M Tokens | Output Price / 1M Tokens |
| :--- | :--- | :--- |
| **Gemini 2.5 Flash** | **$0.075** | **$0.30** |
| **Gemini 2.5 Pro** | **$1.25** | **$5.00** |
| **Imagen 3** | **$0.030 / image** | N/A |
| **Vertex AI Search** | **$2.00 / 1,000 queries** | N/A |

---

# 6. Official References

- Official Vertex AI Documentation: [cloud.google.com/vertex-ai/docs](https://cloud.google.com/vertex-ai/docs)
- Vertex AI GCP Console: [console.cloud.google.com/vertex-ai](https://console.cloud.google.com/vertex-ai)
- Official Website: [cloud.google.com/vertex-ai](https://cloud.google.com/vertex-ai)
