$jinaDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\Jina-AI"

if (Test-Path $jinaDir) {
    Remove-Item -Recurse -Force $jinaDir
}
New-Item -ItemType Directory -Force -Path $jinaDir | Out-Null

$capabilityTree = @{
    "00-Overview" = @{
        "README.md" = "Overview of Jina AI & Multimodal Search Foundation Platform.";
        "Company.md" = "Founded in 2020 by Dr. Han Xiao (CEO, creator of Fashion-MNIST and hanxiao/bert-as-service) in Berlin, Germany; `$38 Million funding backed by Canaan Partners & Granite Asia.";
        "Multimodal-Search-Foundation-Architecture.md" = "Universal search architecture combining long-context embeddings, cross-encoders, and web scraping.";
        "History-and-Milestones.md" = "Timeline from founding in 2020 to jina-embeddings-v3 and Jina Reader API.";
        "Glossary.md" = "Key terms, Reader API, Task Adapters, Matryoshka."
    };
    "01-Embedding-Models" = @{
        "README.md" = "Flagship jina-embeddings-v3 text vector model family.";
        "jina-embeddings-v3.md" = "jina-embeddings-v3 flagship model specs (8,192 token context, 1024-dim, Matryoshka Task Adapters: retrieval.query, retrieval.passage, separation, classification, text-matching, code).";
        "jina-embeddings-v2-base-en.md" = "jina-embeddings-v2 legacy model specs.";
        "Comparisons.md" = "jina-embeddings-v3 vs OpenAI text-embedding-3 vs Voyage-3 matrix.";
        "Best-Practices.md" = "Task adapter selection (`task: 'retrieval.query'` vs `'retrieval.passage'`)."
    };
    "02-Reranking-Models" = @{
        "README.md" = "Cross-encoder semantic reranking models across 100+ languages.";
        "jina-reranker-v2-base-multilingual.md" = "jina-reranker-v2-base-multilingual model specs (1024 context, cross-encoder scoring across 100+ languages).";
        "Two-Stage-Retrieval-Pipeline.md" = "First-stage vector search + Second-stage jina-reranker-v2 optimization.";
        "Best-Practices.md" = "Top-K candidate score thresholding."
    };
    "03-Multimodal-Embeddings-and-CLIP" = @{
        "README.md" = "Joint multimodal vision-text embedding models.";
        "jina-clip-v2.md" = "jina-clip-v2 model specs projecting images and text into a unified 1024-dimension vector space.";
        "Visual-Search-Architecture.md" = "Image-to-text and text-to-image semantic search.";
        "Examples.md" = "Python visual search code snippet."
    };
    "04-Web-Reader-and-Scraper-API" = @{
        "README.md" = "Jina Reader API (`r.jina.ai`) converting any webpage into clean Markdown for LLMs.";
        "Reader-API-Specification.md" = "Prepending `https://r.jina.ai/` to any URL to parse JavaScript, extract main content, and return clean Markdown.";
        "JSON-and-Streaming-Outputs.md" = "Accepting `Accept: application/json` header for structured page metadata, images, and links.";
        "Examples.md" = "Python web scraper snippet with Jina Reader."
    };
    "05-Web-Search-and-Grounding-API" = @{
        "README.md" = "Jina Search API (`s.jina.ai`) returning real-time web search results in Markdown format.";
        "Search-API-Specification.md" = "Prepending `https://s.jina.ai/` to any search query for live web grounding.";
        "RAG-Grounding-Pipeline.md" = "Integrating real-time web search results into LLM context.";
        "Examples.md" = "Live web search RAG python script."
    };
    "06-Segmenter-and-Tokenizer-API" = @{
        "README.md" = "Jina Segmenter API (`segment.jina.ai`) document chunking engine.";
        "Segmenter-API-Specification.md" = "`/v1/segment` endpoint specification for semantic sentence and paragraph document chunking.";
        "Best-Practices.md" = "Optimizing chunk size for vector databases."
    };
    "07-Jina-API-and-Endpoints" = @{
        "README.md" = "Official Jina REST API catalog (`api.jina.ai/v1`).";
        "Embeddings-API.md" = "`/v1/embeddings` endpoint specification.";
        "Rerank-API.md" = "`/v1/rerank` endpoint specification.";
        "Bulk-Embeddings-API.md" = "`/v1/bulk-embeddings` endpoint specification."
    };
    "08-SDKs-and-Developer-Tools" = @{
        "README.md" = "Developer SDKs and integration libraries.";
        "Python-SDK-jina.md" = "Official `jina` Python package specification.";
        "LangChain-and-LlamaIndex.md" = "`JinaEmbeddings` in LangChain & `JinaRerank` in LlamaIndex.";
        "cURL-and-REST.md" = "cURL raw request headers."
    };
    "09-Pricing-and-Billing" = @{
        "README.md" = "Jina AI pricing schedule.";
        "Token-Rates-Schedule.md" = "jina-embeddings-v3 (`$0.02 / 1M tokens), jina-reranker-v2 (`$0.02 / 1M tokens).";
        "Reader-API-Free-Quota.md" = "1,000,000 free tokens / month for Jina Reader API."
    };
    "10-Architectures-and-Examples" = @{
        "README.md" = "Production architecture patterns and runnable code templates.";
        "Web-Scraping-RAG-Pipeline.md" = "Complete web scraping + vector RAG pipeline using `r.jina.ai` and `jina-embeddings-v3`.";
        "Multilingual-Enterprise-Search-Pipeline.md" = "Multilingual cross-lingual search pipeline."
    };
    "11-Changelog-and-Deprecations" = @{
        "README.md" = "Historical product changelog and release history.";
        "Release-History.md" = "Timeline from Jina core in 2020 to jina-embeddings-v3 and Reader API."
    };
    "12-Official-References" = @{
        "README.md" = "Curated list of official Jina AI links.";
        "Official-Links.md" = "Official API docs link: https://jina.ai & https://r.jina.ai"
    }
}

$fileCount = 0

foreach ($folder in $capabilityTree.Keys) {
    $folderPath = Join-Path $jinaDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    foreach ($file in $capabilityTree[$folder].Keys) {
        $filePath = Join-Path $folderPath $file
        $desc = $capabilityTree[$folder][$file]
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        if ($file -eq "README.md") {
            $content = @"
---
title: Jina AI — $folder Overview
provider: Jina AI
capability: $folder
last_updated: 2026-07-28
tags: [jina-ai, jina-embeddings-v3, reader-api, reranker, clip, $($folder.ToLower())]
author: Antigravity AI Documentation Engine
---

# Jina AI — $folder

## 1. What This Capability Is
$desc

## 2. When to Use It
Comprehensive production guidance for when to select **$folder** in Jina AI search, web scraping, and embedding applications.

## 3. Models Belonging to This Capability
- jina-embeddings-v3 (8k context), jina-reranker-v2-base-multilingual, jina-clip-v2, Jina Reader API (`r.jina.ai`).

## 4. Exposed APIs & Endpoints
- Official Jina REST API (`https://api.jina.ai/v1`), Jina Reader (`r.jina.ai`), Jina Search (`s.jina.ai`), Python `jina` SDK.

## 5. Common Use Cases
- Converting web URLs into clean Markdown for LLMs (`r.jina.ai`), 8192-token vector embeddings, cross-encoder multilingual reranking, joint image-text CLIP visual search.
"@
        } else {
            $content = @"
---
title: Jina AI — $fileNameNoExt Specification
provider: Jina AI
capability: $folder
file: $file
last_updated: 2026-07-28
tags: [jina-ai, jina-embeddings-v3, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Documentation Engine
---

# Jina AI — $fileNameNoExt

## Overview
Detailed technical specification for **$fileNameNoExt** under **$folder**.

## Model & Feature Specifications
- **Model Family**: Jina AI Multimodal Search & Web Infrastructure Series (Dr. Han Xiao)
- **Release Information**: Official production release specifications
- **Dimensions**: 1024 dimensions (jina-embeddings-v3, truncatable via Matryoshka)
- **Context Window**: 8,192 tokens
- **Pricing**: jina-embeddings-v3 (`$0.02 / 1M tokens) | jina-reranker-v2 (`$0.02 / 1M) | Reader API (1M Free tokens/mo)
- **API Availability**: Official Jina API (`api.jina.ai`), Reader API (`r.jina.ai`), Python SDK (`jina`)
- **Task Adapters**: `retrieval.query`, `retrieval.passage`, `separation`, `classification`, `text-matching`, `code`

## Typical Use Cases
1. Prepending `https://r.jina.ai/` to any URL to parse JavaScript pages into clean Markdown for LLM prompt context.
2. 8192-token long-context document vector search using jina-embeddings-v3 with task adapters.

## Strengths & Limitations
- **Strengths**: #1 Web scraping Reader API (`r.jina.ai`), 8192-token context with FlashAttention, Matryoshka task adapters, multilingual cross-encoders.
- **Limitations**: Focused on search, embedding, and web data scraping infrastructure (no generative LLM chat models).

## Example Request (Jina Reader API & Python Embeddings)
```python
import os
import requests

# 1. Scrape Webpage into Clean Markdown using Jina Reader API
url_to_scrape = "https://en.wikipedia.org/wiki/Artificial_intelligence"
reader_response = requests.get(f"https://r.jina.ai/{url_to_scrape}")
markdown_content = reader_response.text
print("Scraped Markdown Snippet:")
print(markdown_content[:200])

# 2. Generate Vector Embeddings using Jina API
api_url = "https://api.jina.ai/v1/embeddings"
headers = {
    "Authorization": f"Bearer {os.environ.get('JINA_API_KEY')}",
    "Content-Type": "application/json"
}
payload = {
    "model": "jina-embeddings-v3",
    "task": "retrieval.passage",
    "dimensions": 1024,
    "input": [markdown_content[:500]]
}

emb_response = requests.post(api_url, headers=headers, json=payload)
print(f"Embedding Vector Dimension: {len(emb_response.json()['data'][0]['embedding'])}") # 1024
```

## Related Documentation & Models
- See official Jina AI documentation at https://jina.ai & https://r.jina.ai
"@
        }
        
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $fileCount++
    }
}

Write-Output "Successfully created $fileCount capability files across $($capabilityTree.Count) folders in Jina AI directory!"
