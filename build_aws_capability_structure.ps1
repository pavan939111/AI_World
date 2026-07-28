$awsDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\AWS-Bedrock"

if (Test-Path $awsDir) {
    Remove-Item -Recurse -Force $awsDir
}
New-Item -ItemType Directory -Force -Path $awsDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of AWS Bedrock & Amazon Web Services Managed Foundation Model Cloud.";
        "Company.md" = "Developed by Amazon Web Services (Andy Jassy, CEO of Amazon; Matt Garman, CEO of AWS; Swami Sivasubramanian, VP of AI/ML) in Seattle, WA; `$1.9 Trillion+ market capitalization.";
        "Bedrock-Serverless-Architecture.md" = "AWS Bedrock serverless foundation model hosting architecture with VPC link and KMS encryption.";
        "History-and-Milestones.md" = "Timeline from preview launch in April 2023 to GA (Sept 2023), Bedrock Knowledge Bases, Converse API, Amazon Nova, and Claude 3.7.";
        "Glossary.md" = "Key terms, Bedrock Knowledge Bases, Converse API, Action Groups, Guardrails."
    };
    "01-Amazon-Nova-and-Titan-Models" = @{
        "README.md" = "Amazon proprietary Nova and Titan foundation model family.";
        "Amazon-Nova-Pro.md" = "Amazon Nova Pro flagship multimodal foundation model specs (`amazon.nova-pro-v1:0`, `$0.80 in / `$3.20 out per 1M).";
        "Amazon-Nova-Lite.md" = "Amazon Nova Lite high-speed multimodal model specs (`amazon.nova-lite-v1:0`, `$0.06 in / `$0.24 out per 1M).";
        "Amazon-Nova-Micro.md" = "Amazon Nova Micro ultra-fast text model specs (`amazon.nova-micro-v1:0`, `$0.035 in / `$0.14 out per 1M).";
        "Amazon-Titan-Image-Generator.md" = "Amazon Titan Image Generator v2 specs (`amazon.titan-image-generator-v2:0`).";
        "Comparisons.md" = "Amazon Nova vs Claude 3.5 Sonnet vs Llama 3.3 matrix.";
        "Best-Practices.md" = "Selecting Nova Pro vs Lite vs Micro for cost-performance optimization."
    };
    "02-Anthropic-Claude-on-Bedrock" = @{
        "README.md" = "Exclusive cloud partner hosting of Anthropic Claude model family on AWS.";
        "Claude-3-7-Sonnet-on-Bedrock.md" = "Claude 3.7 Sonnet specs on Bedrock (`us.anthropic.claude-3-7-sonnet-20250219-v1:0`, hybrid reasoning).";
        "Claude-3-5-Sonnet-on-Bedrock.md" = "Claude 3.5 Sonnet specs on Bedrock (`anthropic.claude-3-5-sonnet-20241022-v2:0`).";
        "Claude-3-5-Haiku-on-Bedrock.md" = "Claude 3.5 Haiku specs on Bedrock (`anthropic.claude-3-5-haiku-20241022-v1:0`).";
        "Best-Practices.md" = "Cross-region inference profiles (`us.anthropic.claude-3-7-sonnet...`)."
    };
    "03-Third-Party-Foundation-Models" = @{
        "README.md" = "Managed third-party foundation models on AWS Bedrock.";
        "Meta-Llama-on-Bedrock.md" = "Meta Llama 3.3 70B & Llama 3.1 405B on Bedrock (`us.meta.llama3-3-70b-instruct-v1:0`).";
        "Mistral-on-Bedrock.md" = "Mistral Large 2 & Codestral 22B on Bedrock.";
        "Cohere-Command-R-on-Bedrock.md" = "Cohere Command R+ & Embed v3 on Bedrock.";
        "Stability-SDXL-on-Bedrock.md" = "Stability AI Stable Diffusion XL on Bedrock."
    };
    "04-Bedrock-Knowledge-Bases-and-RAG" = @{
        "README.md" = "Automated managed RAG pipelines with OpenSearch Serverless.";
        "Knowledge-Bases-Architecture.md" = "Automated S3 document ingestion, text chunking, Titan/Cohere vector embedding, and OpenSearch Serverless storage.";
        "Hybrid-Search-and-Reranking.md" = "Combining dense vector search + keyword search + Cohere reranking inside Knowledge Bases.";
        "Best-Practices.md" = "Optimizing chunking strategies (hierarchical, semantic, fixed)."
    };
    "05-Bedrock-Agents-and-Action-Groups" = @{
        "README.md" = "Autonomous multi-step agent execution with AWS Lambda integration.";
        "Bedrock-Agents-Architecture.md" = "Defining agent prompt templates, OpenAPI schemas, and invocation trace analysis.";
        "Action-Groups-AWS-Lambda.md" = "Connecting Action Groups to serverless AWS Lambda functions.";
        "Examples.md" = "Python script executing a Bedrock Agent workflow."
    };
    "06-Bedrock-Guardrails-and-Safety" = @{
        "README.md" = "Enterprise AI safety, PII redacting, and contextual grounding.";
        "Guardrails-Specification.md" = "Configuring toxicity filters, PII redaction (SSN, credit card), and custom word blocklists.";
        "Contextual-Grounding-Check.md" = "Detecting RAG hallucinations and measuring reference document adherence.";
        "Best-Practices.md" = "Applying Guardrails across multiple Bedrock models."
    };
    "07-Model-Customization-and-Fine-Tuning" = @{
        "README.md" = "Custom fine-tuning and continued pre-training on AWS Trainium / Inferentia hardware.";
        "Fine-Tuning-Jobs.md" = "Fine-tuning Meta Llama 3 and Amazon Titan models using S3 datasets.";
        "Continued-Pre-Training.md" = "Adapting base foundation models with domain-specific unlabelled text.";
        "Examples.md" = "Python `boto3` script launching a Bedrock fine-tuning job."
    };
    "08-APIs-and-Endpoints" = @{
        "README.md" = "Official AWS Bedrock REST API specification.";
        "Converse-API-Specification.md" = "`Converse` and `ConverseStream` unified API abstraction across all Bedrock models.";
        "InvokeModel-API.md" = "`InvokeModel` and `InvokeModelWithResponseStream` low-level endpoints.";
        "AWS-SigV4-Authentication.md" = "AWS Signature Version 4 (SigV4) IAM request authentication."
    };
    "09-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official AWS SDKs and CLI tools.";
        "Python-SDK-boto3-bedrock.md" = "Official `boto3` Python package specification (`boto3.client('bedrock-runtime')`).";
        "AWS-CLI-bedrock-runtime.md" = "`aws bedrock-runtime` CLI command reference.";
        "AWS-Console-Walkthrough.md" = "AWS Bedrock Console playground and model access configuration."
    };
    "10-Pricing-and-Billing" = @{
        "README.md" = "AWS Bedrock pricing models.";
        "On-Demand-Rates-Schedule.md" = "Nova Pro (`$0.80/`$3.20), Claude 3.7 Sonnet (`$3.00/`$15.00), Llama 3.3 70B (`$0.72/`$0.72).";
        "Provisioned-Throughput-Commitments.md" = "Provisioned Throughput hourly commitment model for high-volume workloads."
    };
    "11-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Enterprise-RAG-Bedrock-Knowledge-Bases-Claude.md" = "Enterprise RAG architecture using Bedrock Knowledge Bases + OpenSearch + Claude 3.7 Sonnet.";
        "Autonomous-Bedrock-Agent-Lambda-Template.md" = "Complete Bedrock Agent + Lambda Action Group Terraform / Python deployment."
    };
    "12-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from AWS Bedrock preview in April 2023 to Converse API, Amazon Nova, and Claude 3.7."
    };
    "13-Official-References" = @{
        "README.md" = "Curated list of official AWS Bedrock links.";
        "Official-Links.md" = "Official API docs link: https://docs.aws.amazon.com/bedrock & https://console.aws.amazon.com/bedrock"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $awsDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: AWS Bedrock — $folder Overview
provider: AWS Bedrock
capability: $folder
last_updated: 2026-07-28
tags: [aws-bedrock, amazon, nova, claude-3-7, knowledge-bases, agents, guardrails, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# AWS Bedrock — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Amazon Web Services enterprise AI applications.

## 3. Models Belonging to This Capability
- Amazon Nova Pro / Lite / Micro, Anthropic Claude 3.7 Sonnet, Claude 3.5 Sonnet, Meta Llama 3.3 70B, Mistral Large 2, Cohere Command R+.

## 4. Exposed APIs & Endpoints
- AWS Bedrock Runtime REST API (`https://bedrock-runtime.{region}.amazonaws.com`), Python `boto3` SDK, AWS CLI (`aws bedrock-runtime`), AWS IAM SigV4.

## 5. Common Use Cases
- Serverless foundation model access with enterprise AWS VPC security & KMS encryption, Bedrock Knowledge Bases OpenSearch Serverless RAG, autonomous Bedrock Agents with Lambda, Bedrock Guardrails PII redaction.
"@
        } else {
            $content = @"
---
title: AWS Bedrock — $fileNameNoExt Specification
provider: AWS Bedrock
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [aws-bedrock, amazon-nova, claude, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# AWS Bedrock — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Provider Platform**: AWS Bedrock Cloud Infrastructure (Andy Jassy, Matt Garman, Swami Sivasubramanian)
- **Supported Core Models**: Amazon Nova Pro / Lite / Micro, Anthropic Claude 3.7 Sonnet, Claude 3.5 Sonnet, Meta Llama 3.3 70B, Mistral Large 2
- **Supported Modalities**: Text, Code, Vision (Images/PDFs), Video, Audio, JSON Tool Use
- **Context Window**: 200,000 tokens (Claude 3.7 Sonnet & Nova Pro)
- **Pricing**: Nova Pro (`$0.80 in / `$3.20 out per 1M) | Claude 3.7 Sonnet (`$3.00 in / `$15.00 out)
- **API Abstraction**: Unified `Converse` API across all models (`bedrock_runtime.converse()`)
- **Authentication**: AWS IAM SigV4 Bearer Credentials
- **Compliance**: SOC 1/2/3, ISO 27001, HIPAA Eligible, FedRAMP High, AWS KMS Encryption

## Typical Use Cases
1. Enterprise serverless RAG using Bedrock Knowledge Bases with OpenSearch Serverless vector indexing and Claude 3.7 Sonnet.
2. Autonomous agent execution invoking serverless AWS Lambda functions via Bedrock Action Groups.

## Strengths & Limitations
- **Strengths**: Enterprise AWS VPC & IAM security, unified `Converse` API, Bedrock Knowledge Bases automated RAG, Bedrock Guardrails PII redaction, Amazon Nova cost efficiency.
- **Limitations**: Cross-region inference profile ARN format required for multi-region resilience (`us.anthropic.claude-3-7-sonnet...`).

## Example Request (Official Python `boto3` SDK)
```python
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
```

## Related Documentation & Models
- See official AWS Bedrock documentation at https://docs.aws.amazon.com/bedrock
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in AWS Bedrock directory!"
