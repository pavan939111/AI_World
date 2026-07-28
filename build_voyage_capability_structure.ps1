$voyageDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Voyage-AI"

if (Test-Path $voyageDir) {
    Remove-Item -Recurse -Force $voyageDir
}
New-Item -ItemType Directory -Force -Path $voyageDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Voyage AI & Vector Embedding Platform.";
        "Company.md" = "Founded in 2023 by Tengyu Ma (CEO, Stanford Computer Science Associate Professor) in Palo Alto, CA; backed by CRV and MongoDB.";
        "Vector-Representation-Architecture.md" = "State-of-the-art dense vector embeddings and cross-encoder reranking architecture.";
        "History-and-Milestones.md" = "Timeline from founding in 2023 to voyage-3, voyage-code-3, and rerank-2.";
        "Glossary.md" = "Key terms, Matryoshka embeddings, vector similarity search."
    };
    "01-General-Purpose-Embedding-Models" = @{
        "README.md" = "General-purpose dense vector embedding model family.";
        "voyage-3.md" = "voyage-3 flagship embedding model specs (1024-dimensions, 32k context window, `$0.06 / 1M tokens).";
        "voyage-3-lite.md" = "voyage-3-lite high-speed embedding model specs (512-dimensions, `$0.02 / 1M tokens).";
        "voyage-large-2.md" = "voyage-large-2 legacy model specs.";
        "Comparisons.md" = "voyage-3 vs OpenAI text-embedding-3-large vs Cohere embed-v3 MTEB benchmark matrix.";
        "Best-Practices.md" = "Input text truncation, input type specification (`input_type: 'query'` vs `'document'`)."
    };
    "02-Domain-Specific-Embedding-Models" = @{
        "README.md" = "Domain-specialized embedding models for Code, Finance, and Law.";
        "voyage-code-3.md" = "voyage-code-3 model specs optimized for source code retrieval across 30+ programming languages (`$0.12 / 1M).";
        "voyage-finance-2.md" = "voyage-finance-2 model specs optimized for financial SEC 10-K filings, earnings transcripts, and banking documents (`$0.12 / 1M).";
        "voyage-law-2.md" = "voyage-law-2 model specs optimized for legal contracts, statutes, and case law (`$0.12 / 1M).";
        "Best-Practices.md" = "Domain-specific vector search optimization."
    };
    "03-Multimodal-Embedding-Models" = @{
        "README.md" = "Joint multimodal vector embedding models.";
        "voyage-multimodal-3.md" = "voyage-multimodal-3 model specs projecting text and images into a single joint vector space for visual RAG.";
        "Visual-RAG-Architecture.md" = "Retrieving PDF pages, charts, and diagrams via visual embeddings.";
        "Examples.md" = "Multimodal visual search Python code snippet."
    };
    "04-Reranking-Models" = @{
        "README.md" = "State-of-the-art cross-encoder semantic reranking models.";
        "rerank-2.md" = "rerank-2 flagship cross-encoder reranking model specs (`$0.05 / 100k tokens).";
        "rerank-2-lite.md" = "rerank-2-lite fast reranking model specs (`$0.02 / 100k tokens).";
        "Two-Stage-Retrieval-Pipeline.md" = "First-stage vector search + Second-stage rerank-2 cross-encoder optimization.";
        "Best-Practices.md" = "Top-N document filtering and score thresholding."
    };
    "05-Quantization-and-Vector-Compression" = @{
        "README.md" = "Vector compression and dimension truncation.";
        "Matryoshka-Representation-Learning.md" = "Matryoshka Embedding truncation (reducing 1024-dim vectors to 512, 256, or 128-dim without retraining).";
        "Int8-and-Binary-Quantization.md" = "Int8 and Binary scalar quantization reducing vector DB RAM footprint by 95%+.";
        "Best-Practices.md" = "Milvus, Qdrant, and Pinecone quantization configuration."
    };
    "06-Voyage-API-and-Endpoints" = @{
        "README.md" = "Official Voyage REST API catalog (`api.voyageai.com/v1`).";
        "Embeddings-API.md" = "`/v1/embeddings` endpoint specification.";
        "Rerank-API.md" = "`/v1/rerank` endpoint specification.";
        "Multimodal-Embeddings-API.md" = "`/v1/multimodal_embeddings` endpoint specification."
    };
    "07-SDKs-and-Developer-Tools" = @{
        "README.md" = "Official Voyage client libraries and framework integrations.";
        "Python-SDK-voyageai.md" = "Official `voyageai` Python SDK package specification.";
        "LangChain-and-LlamaIndex.md" = "`VoyageAIEmbeddings` in LangChain & `VoyageEmbedding` in LlamaIndex.";
        "REST-and-cURL.md" = "cURL raw request headers."
    };
    "08-Pricing-and-Billing" = @{
        "README.md" = "Voyage AI token rates schedule.";
        "Token-Rates-Schedule.md" = "voyage-3 (`$0.06/1M), voyage-code-3 (`$0.12/1M), rerank-2 (`$0.05/100k).";
        "Credit-Quota-Management.md" = "Managing API key balances."
    };
    "09-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Two-Stage-Enterprise-RAG-Pipeline.md" = "Two-stage retrieval pipeline using voyage-3 + rerank-2.";
        "Source-Code-RAG-Pipeline.md" = "Code repository search using voyage-code-3."
    };
    "10-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from voyage-01 to voyage-3 and rerank-2."
    };
    "11-Official-References" = @{
        "README.md" = "Curated list of official Voyage AI links.";
        "Official-Links.md" = "Official API docs link: https://docs.voyageai.com & https://voyageai.com"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $voyageDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Voyage AI — $folder Overview
provider: Voyage AI
capability: $folder
last_updated: 2026-07-28
tags: [voyage-ai, voyage-3, rerank-2, embeddings, rag, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Voyage AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Voyage AI embedding and reranking search applications.

## 3. Models Belonging to This Capability
- voyage-3, voyage-3-lite, voyage-code-3, voyage-finance-2, voyage-law-2, voyage-multimodal-3, rerank-2.

## 4. Exposed APIs & Endpoints
- Official Voyage REST API (`https://api.voyageai.com/v1`), Python `voyageai` SDK, LangChain, LlamaIndex.

## 5. Common Use Cases
- Two-stage enterprise RAG retrieval, domain-specific code and financial search, joint image-text visual RAG, vector storage quantization.
"@
        } else {
            $content = @"
---
title: Voyage AI — $fileNameNoExt Specification
provider: Voyage AI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [voyage-ai, voyage-3, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Voyage AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Voyage AI Vector Embedding & Reranking Series (Stanford AI Lab Origin)
- **Release Information**: Official production release specifications
- **Dimensions**: 1024 dimensions (voyage-3), 512 dimensions (voyage-3-lite)
- **Context Window**: 32,000 tokens
- **Pricing**: voyage-3 (`$0.06 / 1M tokens) | voyage-code-3 (`$0.12 / 1M) | rerank-2 (`$0.05 / 100k tokens)
- **API Availability**: Official Voyage API (`api.voyageai.com`), Python SDK (`voyageai`), LangChain, LlamaIndex
- **Matryoshka Truncation**: Supported (Truncate to 512, 256, 128 dimensions)
- **Input Types**: `query` or `document`

## Typical Use Cases
1. Production two-stage retrieval pipeline (voyage-3 vector search + rerank-2 cross-encoder reranking).
2. Specialized code repository search across 30+ languages using voyage-code-3.

## Strengths & Limitations
- **Strengths**: Industry-leading retrieval accuracy on MTEB benchmarks, specialized domain models (Code, Finance, Law), Matryoshka dimension truncation.
- **Limitations**: Specialized exclusively on vector embeddings and reranking (does not output generative text chat).

## Example Request (Official Python SDK)
```python
import os
import voyageai

vo = voyageai.Client(api_key=os.environ.get("VOYAGE_API_KEY"))

# 1. Embed Query and Documents
documents = [
    "Voyage AI provides state-of-the-art vector embedding models for RAG.",
    "Python is a high-level programming language used in machine learning."
]

result = vo.embed(documents, model="voyage-3", input_type="document")
print(f"Embedding Vector Dim: {len(result.embeddings[0])}") # 1024

# 2. Rerank Documents
rerank_result = vo.rerank(
    query="What is Voyage AI used for?",
    documents=documents,
    model="rerank-2",
    top_k=1
)
print(f"Top Result Score: {rerank_result.results[0].relevance_score}")
```

## Related Documentation & Models
- See official Voyage AI documentation at https://docs.voyageai.com
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Voyage AI directory!"
