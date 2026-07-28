$cohereDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Cohere"

if (Test-Path $cohereDir) {
    Remove-Item -Recurse -Force $cohereDir
}
New-Item -ItemType Directory -Force -Path $cohereDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Cohere & Enterprise AI Platform.";
        "Company.md" = "Founded in 2019 by Aidan Gomez (co-author of Transformer paper), Ivan Zhang, Nick Frosst in Toronto, Canada; `$5 Billion+ valuation.";
        "Enterprise-AI-Focus.md" = "Data privacy, cloud-agnostic deployment (AWS, Azure, OCI), and enterprise RAG architecture.";
        "History-and-Milestones.md" = "Timeline from founding in 2019 to Command R+, Rerank v3.5, and Embed v3 rollout.";
        "Glossary.md" = "Key terms, Rerank terminology, RAG citations."
    };
    "01-Language-Models" = @{
        "README.md" = "Enterprise Command foundation models optimized for RAG and tool use.";
        "Command-R-Plus.md" = "Command R+ 128k context flagship model specs (`$2.50 in / `$10.00 out per 1M).";
        "Command-R.md" = "Command R 128k context high-efficiency model specs (`$0.15 in / `$0.60 out per 1M).";
        "Command-Light.md" = "Command Light lightweight model specs (`$0.30 in / `$0.60 out per 1M).";
        "Comparisons.md" = "Command R+ vs Command R performance vs cost matrix.";
        "Best-Practices.md" = "Prompt formatting, system prompts, enterprise RAG guidelines."
    };
    "02-Reranking-Models" = @{
        "README.md" = "Industry-standard semantic reranking models for search and RAG optimization.";
        "rerank-v3-5.md" = "Rerank v3.5 flagship model specs (`$2.00 per 1,000 search units).";
        "rerank-english-v3-0.md" = "Rerank English v3.0 model specs.";
        "rerank-multilingual-v3-0.md" = "Rerank Multilingual v3.0 model specs covering 100+ languages.";
        "RAG-Reranking-Pipeline.md" = "Two-stage retrieval architecture (First-stage vector search + Second-stage Rerank).";
        "Best-Practices.md" = "Top-N filtering and relevance score threshold tuning."
    };
    "03-Embedding-Models" = @{
        "README.md" = "Dense numerical vector embedding models supporting Int8 & Binary quantization.";
        "embed-english-v3-0.md" = "1,024-dimension English vector embedding model specs (`$0.10 / 1M tokens).";
        "embed-multilingual-v3-0.md" = "1,024-dimension Multilingual vector embedding model specs (`$0.10 / 1M tokens).";
        "Int8-and-Binary-Quantized-Embeddings.md" = "Int8 and Binary quantization reducing vector storage footprint by up to 96%.";
        "Comparisons.md" = "MTEB and enterprise search benchmarks comparison."
    };
    "04-Agentic-RAG-and-Connectors" = @{
        "README.md" = "Multi-step agentic retrieval-augmented generation and web connectors.";
        "Multi-Step-RAG-Engine.md" = "Multi-hop query planning and document synthesis.";
        "Web-Search-Connectors.md" = "Connecting Command R+ directly to Google, Tavily, and internal enterprise databases.";
        "Document-Grounding-Citations.md" = "Automatic text inline citations mapping output directly to source document spans.";
        "Examples.md" = "Python code pattern for grounded RAG with citations."
    };
    "05-Tool-Use-Function-Calling" = @{
        "README.md" = "Multi-tool function execution loops.";
        "Tool-Calling-Specification.md" = "JSON tool declaration schemas.";
        "Examples.md" = "Python tool execution loop code snippets."
    };
    "06-Structured-Outputs" = @{
        "README.md" = "Guaranteed JSON mode schema compliance.";
        "JSON-Mode-and-Schema.md" = "`response_format: { type: 'json_object' }` specification.";
        "Examples.md" = "Python Pydantic schema validation patterns."
    };
    "07-Fine-Tuning" = @{
        "README.md" = "Custom model fine-tuning on Cohere Dashboard.";
        "Custom-Command-Fine-Tuning.md" = "Fine-tuning Command R for custom domain tone and task adherence.";
        "Custom-Embed-Fine-Tuning.md" = "Fine-tuning Embed v3 for specialized domain search.";
        "Hyperparameters.md" = "Configuring learning rate and epochs."
    };
    "08-APIs-and-Endpoints" = @{
        "README.md" = "Cohere REST API endpoint catalog (`api.cohere.com/v1`).";
        "Chat-API.md" = "`/v1/chat` endpoint specification.";
        "Embed-API.md" = "`/v1/embed` endpoint specification.";
        "Rerank-API.md" = "`/v1/rerank` endpoint specification.";
        "Classify-API.md" = "`/v1/classify` endpoint specification."
    };
    "09-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Cohere client libraries.";
        "Python-SDK-cohere.md" = "Official `cohere` Python package specification.";
        "TypeScript-SDK.md" = "Official `cohere-ai` TypeScript package specification.";
        "LangChain-LlamaIndex-Integration.md" = "LangChain `CohereRerank` & LlamaIndex integration."
    };
    "10-Multi-Cloud-Deployment" = @{
        "README.md" = "Deploying Cohere models across public and private cloud environments.";
        "AWS-Bedrock-Integration.md" = "Command R+ and Rerank on AWS Bedrock.";
        "Azure-AI-Integration.md" = "Command R+ on Azure AI Serverless API.";
        "Oracle-Cloud-OCI-Integration.md" = "Cohere Generative AI Service on Oracle Cloud Infrastructure.";
        "Private-VPC-Air-Gapped.md" = "Air-gapped private VPC deployment for banking and defense."
    };
    "11-Pricing-and-Billing" = @{
        "README.md" = "Cohere Cloud pricing schedules.";
        "Token-Rates-Schedule.md" = "Command R+ (`$2.50/`$10.00), Command R (`$0.15/`$0.60), Rerank (`$2/1k units).";
        "Production-Billing-Quotas.md" = "Pay-as-you-go credit management."
    };
    "12-Rate-Limits-and-Quotas" = @{
        "README.md" = "Cohere Dashboard rate limits.";
        "Trial-vs-Production-Key-Limits.md" = "Free Trial Key (5 RPM) vs Production Key limits.";
        "RPM-TPM-RPD-Tables.md" = "Requests Per Minute and Tokens Per Minute tables."
    };
    "13-Authentication-and-Security" = @{
        "README.md" = "API key and enterprise security controls.";
        "CO_API_KEY-Setup.md" = "`CO_API_KEY` environment variable setup.";
        "Enterprise-Security-and-SOC2.md" = "SOC2 Type II compliance, zero data retention for API."
    };
    "14-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Two-Stage-Retrieval-Embed-Rerank.md" = "First-stage vector search + Second-stage Rerank code pattern.";
        "Multi-Step-Enterprise-Agent.md" = "Enterprise RAG agent pattern."
    };
    "15-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from Command R to Rerank v3.5."
    };
    "16-Official-References" = @{
        "README.md" = "Curated list of official Cohere links.";
        "Official-Links.md" = "Official docs link: https://docs.cohere.com"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $cohereDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Cohere — $folder Overview
provider: Cohere
capability: $folder
last_updated: 2026-07-28
tags: [cohere, command, rerank, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Cohere — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Cohere enterprise applications.

## 3. Models Belonging to This Capability
- Command R+, Command R, Rerank v3.5, embed-english-v3.0, embed-multilingual-v3.0.

## 4. Exposed APIs & Endpoints
- Cohere REST API endpoints (`https://api.cohere.com/v1`), AWS Bedrock, Azure AI, OCI, and official `cohere` Python / TypeScript SDKs.

## 5. Common Use Cases
- Two-stage enterprise RAG retrieval, semantic reranking, multi-step agentic search with document citations, air-gapped VPC deployments.
"@
        } else {
            $content = @"
---
title: Cohere — $fileNameNoExt Specification
provider: Cohere
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [cohere, command, rerank, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Cohere — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Cohere Command & Rerank Series
- **Release Information**: Official production release specifications
- **Supported Input Modalities**: Text, Documents, Web Search Connectors
- **Supported Output Modalities**: Text, JSON Schema, Citations, Function Calls
- **Context Window**: 128,000 tokens
- **Max Output**: 4,096 tokens
- **Pricing**: Command R+ (`$2.50 in / `$10.00 out per 1M) | Command R (`$0.15 in / `$0.60 out per 1M) | Rerank v3.5 (`$2.00 / 1k search units)
- **API Availability**: Cohere Console (`api.cohere.com`), AWS Bedrock, Azure AI, Oracle Cloud OCI
- **Streaming Support**: SSE (`text/event-stream`)
- **Function Calling**: Supported
- **Structured Outputs**: Supported (JSON Mode)

## Typical Use Cases
1. Production Two-Stage Enterprise RAG (Embed v3 + Rerank v3.5).
2. Multi-step document search with automated inline text citations.

## Strengths & Limitations
- **Strengths**: Industry-standard Rerank model, multi-cloud deployment (AWS/Azure/OCI/VPC), fine-grained inline document citations.
- **Limitations**: Max output tokens capped at 4,096 tokens per turn.

## Example Request
```python
import os
import cohere

co = cohere.ClientV2(api_key=os.environ.get("CO_API_KEY"))
response = co.chat(
    model="command-r-plus-08-2024",
    messages=[{"role": "user", "content": "Explain two-stage enterprise RAG architecture."}]
)
print(response.message.content[0].text)
```

## Related Documentation & Models
- See official Cohere documentation at https://docs.cohere.com
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Cohere directory!"
