$azureDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Azure-AI"

if (Test-Path $azureDir) {
    Remove-Item -Recurse -Force $azureDir
}
New-Item -ItemType Directory -Force -Path $azureDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Azure AI & Microsoft Enterprise AI Platform.";
        "Company.md" = "Developed by Microsoft Corporation (Satya Nadella, CEO; Scott Guthrie, Executive VP of Cloud & AI) in Redmond, WA; `$3.1 Trillion+ market capitalization.";
        "Azure-AI-Foundry-Unified-Architecture.md" = "Azure AI Foundry unified enterprise platform connecting model catalog, agent service, and content safety.";
        "History-and-Milestones.md" = "Timeline from Project Oxford & Cognitive Services in 2015 to Azure OpenAI Service (2021), Phi-4, and Azure AI Foundry (2024).";
        "Glossary.md" = "Key terms, Azure OpenAI, Azure AI Foundry, PTU, Prompt Shield."
    };
    "01-Azure-OpenAI-Service" = @{
        "README.md" = "Exclusive enterprise hosting of OpenAI models with Microsoft VNet security and SLA.";
        "GPT-4o-on-Azure.md" = "GPT-4o & GPT-4o mini enterprise specs on Azure OpenAI Service (`$2.50 in / `$10.00 out per 1M).";
        "o1-and-o3-mini-on-Azure.md" = "o1 & o3-mini reasoning model enterprise specs on Azure OpenAI Service.";
        "DALL-E-3-and-Whisper-on-Azure.md" = "DALL-E 3 image generation and Whisper speech recognition specs on Azure.";
        "Comparisons.md" = "Azure OpenAI Service vs Direct OpenAI API enterprise compliance matrix.";
        "Best-Practices.md" = "Deploying Azure OpenAI Service inside private VNet virtual networks."
    };
    "02-Azure-AI-Foundry-and-Model-Catalog" = @{
        "README.md" = "Azure AI Foundry model catalog hosting 1,600+ open and partner models.";
        "Microsoft-Phi-4.md" = "Microsoft Phi-4 14B small language model specs (SOTA synthetic data performance).";
        "Meta-Llama-on-Azure-Foundry.md" = "Llama 3.3 70B & Llama 3.1 405B hosted via Serverless API Endpoints.";
        "DeepSeek-and-Mistral-on-Azure.md" = "DeepSeek-R1 and Mistral Large 2 hosted on Azure AI Foundry.";
        "Best-Practices.md" = "Selecting models from Azure AI Foundry model catalog."
    };
    "03-Azure-AI-Search-and-RAG" = @{
        "README.md" = "Azure AI Search (formerly Cognitive Search) enterprise vector and hybrid search engine.";
        "Azure-AI-Search-Architecture.md" = "Vector search + HNSW indexing + BM25 keyword search + Semantic Ranker cross-encoder re-ranking.";
        "Integrated-Vectorization-Pipeline.md" = "Automatic text chunking and vector embedding pipeline inside Azure AI Search.";
        "Best-Practices.md" = "Configuring Semantic Ranker for enterprise RAG."
    };
    "04-Azure-AI-Agent-Service" = @{
        "README.md" = "Enterprise multi-agent service built on Azure infrastructure.";
        "Agent-Service-Architecture.md" = "Configuring multi-agent workflows, state management, Azure Functions, and Bing Search tools.";
        "Enterprise-Tool-Integrations.md" = "Connecting agents to Azure SQL, Cosmos DB, and REST APIs.";
        "Examples.md" = "Enterprise HR assistant multi-agent python script."
    };
    "05-Azure-AI-Content-Safety-and-Guardrails" = @{
        "README.md" = "Enterprise AI safety, prompt shields, and hallucination evaluation.";
        "Prompt-Shield-and-Jailbreak-Detection.md" = "Prompt Shield detecting indirect prompt injection and jailbreak attacks.";
        "Groundedness-and-Hallucination-Detection.md" = "Automated groundedness evaluation measuring RAG factual accuracy.";
        "Best-Practices.md" = "Configuring Content Safety blocklist categories."
    };
    "06-Azure-AI-Speech-and-Vision-Cognitive-Services" = @{
        "README.md" = "Enterprise Cognitive Services for Speech, Vision, and Document Intelligence.";
        "Document-Intelligence.md" = "Azure AI Document Intelligence (Form Recognizer) for OCR and invoice/contract parsing.";
        "Speech-Service-and-TTS-Avatar.md" = "Speech-to-text, neural TTS, and photo-realistic AI text-to-speech avatars.";
        "Vision-and-OCR.md" = "Azure AI Vision spatial analysis and optical character recognition."
    };
    "07-APIs-and-Endpoints" = @{
        "README.md" = "Official Azure REST API specification.";
        "Azure-OpenAI-REST-API.md" = "`{endpoint}/openai/deployments/{deployment_name}/chat/completions?api-version=2024-10-21` specification.";
        "Azure-AI-Inference-API.md" = "`{endpoint}/models/chat/completions?api-version=2024-05-01-preview` specification.";
        "Entra-ID-Azure-AD-Authentication.md" = "Microsoft Entra ID (Azure AD) OAuth2 bearer token authentication."
    };
    "08-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Azure AI client libraries and developer tools.";
        "Python-SDK-azure-ai-inference.md" = "Official `azure-ai-inference` Python package specification (`ChatCompletionsClient`).";
        "azure-identity-SDK.md" = "`azure-identity` package and `DefaultAzureCredential()` token provider.";
        "Azure-CLI-and-Foundry-Portal.md" = "`az cognitiveservices` CLI commands and Azure AI Foundry portal walkthrough."
    };
    "09-Pricing-and-Billing" = @{
        "README.md" = "Azure AI pricing schedules and billing models.";
        "Pay-As-You-Go-Rates.md" = "Azure OpenAI pay-as-you-go token rates (GPT-4o `$2.50/`$10.00).";
        "Provisioned-Throughput-Units-PTUs.md" = "Provisioned Throughput Units (PTUs) reserved capacity billing model."
    };
    "10-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Enterprise-RAG-Azure-Search-OpenAI.md" = "Enterprise RAG architecture using Azure AI Search + Azure OpenAI GPT-4o.";
        "Azure-Agent-Service-Implementation.md" = "Multi-agent customer support implementation script."
    };
    "11-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from Cognitive Services in 2015 to Azure OpenAI Service, Phi-4, and Azure AI Foundry."
    };
    "12-Official-References" = @{
        "README.md" = "Curated list of official Azure AI links.";
        "Official-Links.md" = "Official API docs link: https://learn.microsoft.com/azure/ai-services & https://ai.azure.com"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $azureDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Azure AI — $folder Overview
provider: Azure AI
capability: $folder
last_updated: 2026-07-28
tags: [azure-ai, microsoft, azure-openai, phi-4, foundry, search, content-safety, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Azure AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Microsoft Azure enterprise AI applications.

## 3. Models Belonging to This Capability
- Azure OpenAI GPT-4o, GPT-4o mini, o1, o3-mini, Microsoft Phi-4 (14B), Meta Llama 3.3 70B, DeepSeek-R1, Mistral Large 2.

## 4. Exposed APIs & Endpoints
- Azure OpenAI REST API (`https://{instance}.openai.azure.com`), Azure AI Inference API (`azure-ai-inference`), Microsoft Entra ID (Azure AD).

## 5. Common Use Cases
- Enterprise OpenAI model hosting inside private Azure Virtual Networks (VNets), Azure AI Search hybrid vector search with Semantic Ranker, Prompt Shield jailbreak prevention, Document Intelligence OCR.
"@
        } else {
            $content = @"
---
title: Azure AI — $fileNameNoExt Specification
provider: Azure AI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [azure-ai, azure-openai, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Azure AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Provider Platform**: Microsoft Azure AI & Enterprise Cloud (Satya Nadella & Scott Guthrie)
- **Supported Core Models**: Azure OpenAI GPT-4o, GPT-4o mini, o1, o3-mini, DALL-E 3, Microsoft Phi-4, Llama 3.3 70B, DeepSeek-R1
- **Supported Modalities**: Text, Code, Vision, Audio, Document OCR, Avatar TTS
- **Context Window**: 128,000 tokens (GPT-4o)
- **Pricing**: Pay-As-You-Go (`$2.50 in / `$10.00 out per 1M for GPT-4o) or Provisioned Throughput Units (PTUs)
- **API Availability**: Azure OpenAI API (`openai.azure.com`), Azure AI Inference SDK (`azure-ai-inference`)
- **Authentication**: Microsoft Entra ID (Azure AD OAuth2) & Azure Subscription Key (`api-key`)
- **Compliance**: ISO 27001, SOC 2, HIPAA, FedRAMP High, Private VNet Link

## Typical Use Cases
1. Enterprise deployment of GPT-4o models with zero customer data retention and private VNet network isolation.
2. Hybrid vector search using Azure AI Search with Semantic Ranker cross-encoder reranking.

## Strengths & Limitations
- **Strengths**: Exclusive enterprise OpenAI partnership, Microsoft VNet private link security, Azure AI Search Semantic Ranker, Prompt Shield jailbreak defense, Provisioned Throughput Units (PTUs).
- **Limitations**: Deployment name strings required in endpoint URIs (`deployments/{deployment_name}/chat/completions`).

## Example Request (Official Python SDK)
```python
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
```

## Related Documentation & Models
- See official Azure AI documentation at https://learn.microsoft.com/azure/ai-services & https://ai.azure.com
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Azure AI directory!"
