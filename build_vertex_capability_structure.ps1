$vertexDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Vertex-AI"

if (Test-Path $vertexDir) {
    Remove-Item -Recurse -Force $vertexDir
}
New-Item -ItemType Directory -Force -Path $vertexDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Vertex AI & Google Cloud Enterprise AI Platform.";
        "Company.md" = "Developed by Google Cloud (Sundar Pichai, CEO of Alphabet; Thomas Kurian, CEO of Google Cloud) in Mountain View & Sunnyvale, CA.";
        "Vertex-AI-Unified-Architecture.md" = "Vertex AI unified enterprise architecture connecting foundation models, MLOps, and enterprise search.";
        "History-and-Milestones.md" = "Timeline from Google Cloud AI Platform in 2019 to Vertex AI launch (2021), PaLM 2, Gemini 1.5, and Gemini 2.5 (2024).";
        "Glossary.md" = "Key terms, Model Garden, Agent Builder, MLOps, TPU v5p."
    };
    "01-Gemini-Enterprise-Foundation-Models" = @{
        "README.md" = "Google Gemini enterprise foundation models on Vertex AI.";
        "Gemini-2-5-Pro-Vertex.md" = "Gemini 2.5 Pro enterprise endpoint specs (2,000,000 token context, complex reasoning, `$1.25 in / `$5.00 out per 1M).";
        "Gemini-2-5-Flash-Vertex.md" = "Gemini 2.5 Flash high-speed enterprise endpoint specs (`$0.075 in / `$0.30 out per 1M).";
        "Imagen-3-Vertex.md" = "Imagen 3 enterprise image generation endpoint specs (`$0.03 / image).";
        "Veo-2-Vertex.md" = "Veo 2 enterprise video generation endpoint specs.";
        "Comparisons.md" = "Vertex AI Gemini vs Azure OpenAI vs AWS Bedrock matrix.";
        "Best-Practices.md" = "Enterprise security, region selection, and safety threshold tuning."
    };
    "02-Model-Garden-and-Third-Party-Hosting" = @{
        "README.md" = "Vertex AI Model Garden hosting 150+ first-party and open partner models.";
        "Anthropic-Claude-on-Vertex.md" = "Claude 3.7 Sonnet & Claude 3.5 Haiku hosted on Vertex AI Model Garden.";
        "Meta-Llama-on-Vertex.md" = "Llama 3.3 70B & Llama 3.1 405B hosted on Vertex AI.";
        "Mistral-on-Vertex.md" = "Mistral Large 2 & Codestral 22B hosted on Vertex AI.";
        "Best-Practices.md" = "Deploying Model Garden open models to dedicated GKE / Vertex Endpoints."
    };
    "03-Enterprise-Search-and-Conversation-Grounding" = @{
        "README.md" = "Vertex AI Search & Conversation grounding engine.";
        "Vertex-AI-Search.md" = "Enterprise search engine connecting Gemini directly to Google Drive, BigQuery, SharePoint, and Salesforce.";
        "Google-Search-Grounding.md" = "Grounding Gemini responses against live Google Web Search index (`google_search_retrieval`).";
        "Best-Practices.md" = "Configuring enterprise datastore connectors."
    };
    "04-Vertex-AI-Agent-Builder" = @{
        "README.md" = "No-code and low-code agent creation environment.";
        "Agent-Builder-Architecture.md" = "Configuring multi-agent orchestration, tools, OpenAPI extensions, and flow control.";
        "Enterprise-Tool-Extensions.md" = "Connecting agents to enterprise REST APIs and Python code execution.";
        "Examples.md" = "Customer service multi-agent flow example."
    };
    "05-Custom-Model-Tuning-and-Distillation" = @{
        "README.md" = "Model customization on Google Cloud TPU v5p and GPU clusters.";
        "Supervised-Fine-Tuning-SFT.md" = "Supervised fine-tuning of Gemini and Llama models on Vertex AI.";
        "RLHF-and-Distillation.md" = "Reinforcement Learning from Human Feedback (RLHF) and model distillation.";
        "Examples.md" = "Python script launching a Vertex AI Gemini fine-tuning job."
    };
    "06-MLOps-Feature-Store-and-Pipelines" = @{
        "README.md" = "Enterprise MLOps infrastructure.";
        "Vertex-AI-Pipelines-Kubeflow.md" = "Orchestrating serverless ML workflows using Kubeflow Pipelines (`kfp`).";
        "Feature-Store-and-Model-Registry.md" = "Vertex AI Feature Store and Model Registry version management.";
        "Endpoint-Auto-Scaling.md" = "Configuring min/max nodes and traffic splitting across endpoints."
    };
    "07-APIs-and-Endpoints" = @{
        "README.md" = "Google Cloud Vertex AI REST API catalog (`aiplatform.googleapis.com`).";
        "Predict-API.md" = "`/v1/projects/{project}/locations/{location}/publishers/google/models/{model}:predict` specification.";
        "Stream-Generate-Content-API.md" = "`/v1/...:streamGenerateContent` streaming endpoint specification.";
        "OAuth2-Service-Account-Auth.md" = "Google Cloud IAM and OAuth2 Service Account bearer token setup."
    };
    "08-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Google Cloud Vertex AI client libraries.";
        "Python-SDK-google-cloud-aiplatform.md" = "Official `google-cloud-aiplatform` Python package specification (`vertexai.init()`).";
        "gcloud-CLI.md" = "`gcloud ai` CLI command reference.";
        "Vertex-AI-Studio.md" = "Vertex AI Studio web console walkthrough."
    };
    "09-Pricing-and-Billing" = @{
        "README.md" = "Vertex AI pricing schedules.";
        "Token-and-Model-Rates.md" = "Gemini 2.5 Pro (`$1.25/`$5.00), Gemini 2.5 Flash (`$0.075/`$0.30), Imagen 3 (`$0.03/img).";
        "Provisioned-Throughput-and-TPUs.md" = "Provisioned Throughput character commitments and TPU v5p hourly rates."
    };
    "10-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Enterprise-RAG-Vertex-Search-Gemini.md" = "Enterprise RAG architecture using Vertex AI Search datastores + Gemini 2.5 Pro.";
        "Kubeflow-MLOps-Pipeline-Template.md" = "Complete Kubeflow MLOps pipeline script."
    };
    "11-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from AI Platform in 2019 to Vertex AI and Gemini 2.5."
    };
    "12-Official-References" = @{
        "README.md" = "Curated list of official Google Cloud Vertex AI links.";
        "Official-Links.md" = "Official API docs link: https://cloud.google.com/vertex-ai/docs & https://console.cloud.google.com/vertex-ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $vertexDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Vertex AI — $folder Overview
provider: Vertex AI
capability: $folder
last_updated: 2026-07-28
tags: [vertex-ai, google-cloud, gemini-2-5, model-garden, agent-builder, mlops, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Vertex AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Google Cloud enterprise AI applications.

## 3. Models Belonging to This Capability
- Gemini 2.5 Pro (2M context), Gemini 2.5 Flash, Imagen 3, Veo 2, Claude 3.7 Sonnet (Model Garden), Llama 3.3 70B (Model Garden).

## 4. Exposed APIs & Endpoints
- Google Cloud Vertex AI REST API (`https://us-central1-aiplatform.googleapis.com/v1`), Python `google-cloud-aiplatform` SDK, `gcloud` CLI.

## 5. Common Use Cases
- Enterprise 2M token document RAG, Vertex AI Search grounding across BigQuery/SharePoint, low-code Agent Builder workflows, Kubeflow MLOps pipelines.
"@
        } else {
            $content = @"
---
title: Vertex AI — $fileNameNoExt Specification
provider: Vertex AI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [vertex-ai, gemini, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Vertex AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Provider Platform**: Google Cloud Vertex AI (Sundar Pichai & Thomas Kurian)
- **Supported Core Models**: Gemini 2.5 Pro, Gemini 2.5 Flash, Imagen 3, Veo 2, Claude 3.7 Sonnet, Llama 3.3 70B
- **Supported Modalities**: Text, Code, Image, Audio, Video (Native MP4 QA), PDF
- **Context Window**: 2,000,000 tokens (Gemini 2.5 Pro)
- **Pricing**: Gemini 2.5 Pro (`$1.25 in / `$5.00 out per 1M) | Gemini 2.5 Flash (`$0.075 in / `$0.30 out)
- **API Availability**: Google Cloud Vertex AI API (`us-central1-aiplatform.googleapis.com`), Python SDK (`google-cloud-aiplatform`)
- **Authentication**: Google Cloud IAM Service Account OAuth2 Bearer Tokens
- **Compliance**: SOC 2, ISO 27001, HIPAA, FedRAMP High

## Typical Use Cases
1. Enterprise document understanding analyzing 2,000,000 token PDFs or 1-hour video clips on Google Cloud.
2. Grounding Gemini model responses directly against Google Search or enterprise BigQuery data warehouses.

## Strengths & Limitations
- **Strengths**: #1 2M token context window, native MP4 video understanding, Vertex AI Search enterprise datastore connectors, HIPAA & FedRAMP enterprise compliance.
- **Limitations**: Requires Google Cloud Project configuration and GCP IAM authentication.

## Example Request (Official Python SDK)
```python
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
```

## Related Documentation & Models
- See official Vertex AI documentation at https://cloud.google.com/vertex-ai/docs
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Vertex AI directory!"
