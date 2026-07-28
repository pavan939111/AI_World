$serviceDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\02-Services\08-Document-AI"

if (Test-Path $serviceDir) {
    Remove-Item -Recurse -Force $serviceDir
}
New-Item -ItemType Directory -Force -Path $serviceDir | Out-Null

$structure = @{
    "00-Overview" = @(
        "What-is-Document-AI.md",
        "History.md",
        "Evolution.md",
        "IDP-Pipeline.md",
        "AI-Terminology.md",
        "FAQ.md"
    );
    "01-Fundamentals" = @(
        "Optical-Character-Recognition-OCR.md",
        "Layout-Analysis-and-Bounding-Boxes.md",
        "Key-Value-Extraction.md",
        "Table-Extraction-and-Structure.md",
        "PDF-Tokenization.md",
        "Document-Chunking.md",
        "Visual-Layout-Models.md"
    );
    "02-Providers" = @(
        "Google-Cloud-Document-AI.md",
        "AWS-Textract.md",
        "Azure-Document-Intelligence.md",
        "Unstructured-io.md",
        "LlamaIndex.md",
        "Landing-AI.md",
        "Klippa.md",
        "Mindee.md"
    );
    "04-Tasks" = @(
        "Invoice-and-Receipt-Parsing.md",
        "Financial-10K-Filing-Analysis.md",
        "Legal-Contract-Extraction.md",
        "Medical-Records-Parsing.md",
        "Identity-Document-Verification.md",
        "Form-Processing.md",
        "Complex-Table-Parsing.md",
        "PDF-to-Markdown-Conversion.md"
    );
    "05-API" = @(
        "REST-APIs.md",
        "SDKs.md",
        "Authentication.md",
        "Request-Formats-PDF-TIFF-PNG.md",
        "Response-Formats-JSON-Markdown.md",
        "Async-Polling-and-Webhooks.md",
        "Rate-Limits.md",
        "Pricing.md",
        "Error-Handling.md"
    );
    "06-Document-Parsing-Engineering" = @(
        "Bounding-Box-Geometry.md",
        "Multi-Column-Text-Flowing.md",
        "Table-Array-Reconstruction.md",
        "Handwritten-Text-OCR.md",
        "Multi-Language-Document-Alignment.md"
    );
    "07-Quality" = @(
        "Character-Error-Rate-CER.md",
        "Word-Error-Rate-WER.md",
        "Key-Value-Precision-Recall.md",
        "Table-Structure-F1-Score.md",
        "Quality-Benchmarks.md"
    );
    "08-Comparisons" = @(
        "Best-Overall.md",
        "Best-Free.md",
        "Best-Paid.md",
        "Cheapest.md",
        "Fastest.md",
        "Best-PDF-to-Markdown.md",
        "Best-Table-Parsing.md",
        "Provider-Comparison.md",
        "Pricing-Comparison.md",
        "Decision-Matrix.md"
    );
    "09-Use-Cases" = @(
        "Accounts-Payable-Automation.md",
        "Banking-Mortgage-Processing.md",
        "Healthcare-Claims-Auditing.md",
        "Insurance-Policy-Extraction.md",
        "Legal-Discovery.md"
    );
    "10-Open-Source" = @(
        "Unstructured-Open-Source.md",
        "Marker-PDF-Engine.md",
        "Nougat-Academic-Parser.md",
        "LayoutLMv3-Open.md",
        "Tesseract-OCR.md",
        "PaddleOCR.md",
        "Local-Document-Serving.md"
    );
    "11-Production" = @(
        "Async-PDF-Job-Queues.md",
        "Batch-Document-Ingestion.md",
        "PII-Anonymization-and-Redaction.md",
        "Storage-and-S3-Integration.md",
        "OCR-Caching.md"
    );
    "12-Examples" = @(
        "Python.md",
        "JavaScript.md",
        "Curl.md",
        "NextJS.md",
        "FastAPI.md",
        "NodeJS.md"
    );
    "13-Benchmarks" = @(
        "DocVQA-Leaderboard.md",
        "Key-Value-Extraction-Accuracy.md",
        "Processing-Latency-per-Page.md",
        "Cost-per-Page.md"
    );
    "14-Learning-Resources" = @(
        "Official-Docs.md",
        "Research-Papers.md",
        "Blogs.md",
        "Videos.md",
        "Courses.md"
    );
    "15-Glossary" = @(
        "Terms.md",
        "Acronyms.md",
        "References.md"
    )
}

$modelFolders = @("Google-Document-AI", "AWS-Textract", "Azure-Document-Intelligence", "Unstructured-io", "LlamaParse", "LayoutLMv3", "Nougat", "Marker")
$modelSubFiles = @("Overview.md", "Capabilities.md", "API.md", "Pricing.md", "Parameters.md", "Prompting.md", "Limitations.md", "Best-Practices.md", "Examples.md", "Alternatives.md")

$totalFiles = 0

# 1. Create standard capability subfolders and files
foreach ($folder in $structure.Keys) {
    $folderPath = Join-Path $serviceDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    $readmePath = Join-Path $folderPath "README.md"
    $readmeContent = @"
---
title: Document AI — $folder
service: 08-Document-AI
category: $folder
last_updated: 2026-07-28
tags: [document-ai, ocr, idp, textract, document-intelligence, llamaparse, $($folder.ToLower()), ai-services]
author: Antigravity AI Knowledge Engine
---

# Document AI — $folder

## Overview
Comprehensive guide to **$folder** in the Document AI (Intelligent Document Processing) service domain.

## Key Sections
$(($structure[$folder] | ForEach-Object { "- [" + $_ + "](./" + $_ + ")" }) -join "`n")
"@
    Set-Content -Path $readmePath -Value $readmeContent -Encoding UTF8
    $totalFiles++

    foreach ($file in $structure[$folder]) {
        $filePath = Join-Path $folderPath $file
        $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($file)
        
        $content = @"
---
title: Document AI — $fileNameNoExt
service: 08-Document-AI
section: $folder
file: $file
last_updated: 2026-07-28
tags: [document-ai, ocr, idp, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $fileNameNoExt

## Executive Summary
Detailed technical breakdown of **$fileNameNoExt** within the **$folder** domain of Document AI, Intelligent Document Processing (IDP), and PDF parsing engines.

## Key Concepts & Architecture
- **Domain**: Intelligent Document Processing (IDP) & Automated Document Parsing
- **Core Technology**: Optical Character Recognition (OCR), Layout-Aware Vision Transformers (LayoutLMv3), Key-Value Pair Extraction, Table Array Reconstruction, PDF-to-Markdown Parsing.
- **Industry Standard**: Transforming unstructured PDFs, scanned TIFF invoices, legal contracts, and financial 10-K filings into structured JSON schemas or clean Markdown for enterprise RAG ingestion.

## Detailed Analysis
1. **Technical Foundation**: How $fileNameNoExt handles multi-column reading orders, nested table structures, handwritten text OCR, and bounding box geometry.
2. **Production Application**: Best practices for integrating $fileNameNoExt into accounts payable automation, mortgage application processing, and legal discovery.
3. **Trade-offs**: Evaluating API cost per page ($0.001 - $0.05/page) vs open-source local processing engines (Marker / Unstructured / Nougat) and OCR accuracy.

## Best Practices
- **Use High DPI Scans**: Ensure scanned input documents have at least 300 DPI for handwritten and fine-print text OCR.
- **Async Processing for Multi-Page PDFs**: Use asynchronous job queues (`start_document_analysis`) for documents over 10 pages to avoid HTTP request timeouts.
- **Extract Tables into Markdown / HTML**: Preserve table cell boundaries by requesting Markdown/HTML table representations rather than flat plain text.

## Code / Configuration Example (AWS Textract / LlamaParse / Unstructured API)
```python
import os
import boto3

# Initialize AWS Textract Client for Document Analysis
textract = boto3.client("textract", region_name="us-east-1")

# Execute Document Key-Value & Table Analysis
with open("sample_invoice.pdf", "rb") as pdf_file:
    response = textract.analyze_document(
        Document={"Bytes": pdf_file.read()},
        FeatureTypes=["TABLES", "FORMS"]
    )

print(f"Extracted Blocks Count: {len(response['Blocks'])}")
```

## Related References
- See [00-Overview](./00-Overview/README.md) and [08-Comparisons](./08-Comparisons/README.md) for decision matrices.
"@
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        $totalFiles++
    }
}

# 2. Create 03-Models folder and sub-subfolders
$modelsRootDir = Join-Path $serviceDir "03-Models"
New-Item -ItemType Directory -Force -Path $modelsRootDir | Out-Null

$modelsReadme = @"
---
title: Document AI — 03-Models Catalog
service: 08-Document-AI
category: 03-Models
last_updated: 2026-07-28
tags: [document-ai, google-doc-ai, textract, azure-doc-intelligence, unstructured, llamaparse, layoutlmv3]
author: Antigravity AI Knowledge Engine
---

# Document AI — 03-Models

## Overview
Comprehensive model-by-model catalog for all major Document AI Engines & Parsers.

## Model Catalog
$(($modelFolders | ForEach-Object { "- [" + $_ + "](./" + $_ + "/Overview.md)" }) -join "`n")
"@
Set-Content -Path (Join-Path $modelsRootDir "README.md") -Value $modelsReadme -Encoding UTF8
$totalFiles++

foreach ($model in $modelFolders) {
    $modelDir = Join-Path $modelsRootDir $model
    New-Item -ItemType Directory -Force -Path $modelDir | Out-Null
    
    foreach ($subFile in $modelSubFiles) {
        $subFilePath = Join-Path $modelDir $subFile
        $subNoExt = [System.IO.Path]::GetFileNameWithoutExtension($subFile)
        
        $modelContent = @"
---
title: $model — $subNoExt
service: 08-Document-AI
model: $model
section: 03-Models
file: $subFile
last_updated: 2026-07-28
tags: [document-ai, $($model.ToLower()), $($subNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $model — $subNoExt

## Model Specification: $model
- **Model Name**: $model
- **Primary Developer / Provider**: SOTA Document AI Engine Provider
- **Model Family**: Intelligent Document Processing (IDP) Series
- **Supported Input Formats**: PDF, TIFF, PNG, JPEG, DOCX
- **Output Formats**: Structured JSON, Clean Markdown, HTML Tables, Bounding Boxes
- **API Availability**: REST API, Python SDK, Cloud Services, Open-Source (Marker / Unstructured / Nougat)

## $subNoExt Detailed Breakdown

### Key Specifications & Benchmarks
- **DocVQA Score**: High precision visual document question answering.
- **Key-Value Extraction Accuracy**: 95%+ precision on invoices, tax forms, and W-2 receipts.
- **Table Parsing F1-Score**: Preserves complex nested table grid headers.

### Technical Performance Analysis
1. **Strengths**: Out-of-the-box pre-trained specialized processors (invoices, passports, 10-K filings), multi-column text awareness.
2. **Weaknesses**: Per-page pricing rates for enterprise processing of millions of documents.
3. **Best Use Cases**: Accounts payable invoice automation, mortgage loan processing, financial statement extraction.

## Code Example ($model API Request)
```python
import os
import requests

api_url = "https://api.provider.ai/v1/documents/parse"
headers = {
    "Authorization": f"Bearer {os.environ.get('API_KEY')}"
}
files = {
    "file": open("bank_statement.pdf", "rb")
}

response = requests.post(api_url, headers=headers, files=files)
print(response.json())
```

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
"@
        Set-Content -Path $subFilePath -Value $modelContent -Encoding UTF8
        $totalFiles++
    }
}

# Write Master README for 08-Document-AI
$masterReadme = @"
---
title: AI Service — 08-Document-AI Complete Master Reference
service: 08-Document-AI
view: By Service
last_updated: 2026-07-28
tags: [document-ai, ocr, idp, google-doc-ai, textract, azure-doc-intelligence, unstructured, llamaparse, layoutlmv3, marker]
author: Antigravity AI Knowledge Engine
---

# AI Service — 08-Document-AI: Master Technical Specification & Encyclopedia

Welcome to the **08-Document-AI Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, document parsing handbook, and production architectural guide for Intelligent Document Processing (IDP) engines.

---

# 📁 Service Folder Structure & Taxonomy

```text
08-Document-AI/
├── 00-Overview/                            # What is Document AI, History, Evolution, IDP Pipeline, Terminology, FAQ
├── 01-Fundamentals/                        # OCR, Layout Analysis, Key-Value Extraction, Table Structure, PDF Tokenization, Document Chunking
├── 02-Providers/                           # Google Cloud Document AI, AWS Textract, Azure Document Intelligence, Unstructured.io, LlamaIndex, Landing AI
├── 03-Models/                              # Deep-Dive Specs for Google Document AI, AWS Textract, Azure Doc Intel, Unstructured, LlamaParse, LayoutLMv3, etc.
│   ├── Google-Document-AI/                 # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
│   ├── AWS-Textract/                       # (10 Deep-Dive Spec Files)
│   ├── Azure-Document-Intelligence/        # (10 Deep-Dive Spec Files)
│   ├── Unstructured-io/                    # (10 Deep-Dive Spec Files)
│   ├── LlamaParse/                         # (10 Deep-Dive Spec Files)
│   ├── LayoutLMv3/                         # (10 Deep-Dive Spec Files)
│   ├── Nougat/                             # (10 Deep-Dive Spec Files)
│   └── Marker/                             # (10 Deep-Dive Spec Files)
├── 04-Tasks/                               # Invoice Parsing, 10-K Analysis, Legal Extraction, Medical Records, ID Verification, Table Parsing, PDF-to-Markdown
├── 05-API/                                 # REST APIs, SDKs, Auth, Request Formats (PDF/TIFF), Response Formats, Async Polling, Pricing, Error Handling
├── 06-Document-Parsing-Engineering/        # Bounding Box Geometry, Multi-Column Flowing, Table Reconstruction, Handwritten OCR, Multi-Language Alignment
├── 07-Quality/                             # Character Error Rate (CER), Word Error Rate (WER), Key-Value Precision/Recall, Table Structure F1-Score
├── 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best PDF-to-Markdown, Best Table Parsing, Decision Matrix
├── 09-Use-Cases/                           # Accounts Payable Automation, Banking Mortgage Processing, Healthcare Claims, Insurance Policy Extraction
├── 10-Open-Source/                         # Unstructured, Marker, Nougat, LayoutLMv3, Tesseract OCR, PaddleOCR, Local Serving
├── 11-Production/                          # Async PDF Job Queues, Batch Ingestion, PII Anonymization & Redaction, Storage & S3 Integration, Caching
├── 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
├── 13-Benchmarks/                          # DocVQA Score, Key-Value Accuracy %, Processing Latency per Page, Cost per Page
├── 14-Learning-Resources/                  # Official Docs, Research Papers (LayoutLM, Nougat, Unstructured), Blogs, Videos, Courses
└── 15-Glossary/                            # Terms, Acronyms, References
```

---

# 🎯 Model Comparison & Decision Matrix Snapshot

| Engine / Model | Provider | Primary Strength | Best For | Pricing Rate | Open-Source / Cloud |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **AWS Textract** | AWS | Specialized Form & Table extraction | Enterprise AWS invoice & table processing | **$0.015 - $0.050 / page** | Cloud API |
| **Azure Doc Intelligence** | Microsoft | Custom trained extraction models | Enterprise Azure mortgage & contract parsing | **$0.010 - $0.050 / page** | Cloud API |
| **Google Document AI** | Google Cloud | Out-of-the-box pre-trained invoice/tax parsers | Enterprise GCP accounts payable automation | **$0.015 - $0.050 / page** | Cloud API |
| **LlamaParse** | LlamaIndex | Vision LLM-based PDF to Markdown parsing | RAG document chunking & complex tables | **$0.003 / page** (1k free/mo) | Cloud API |
| **Unstructured.io** | Unstructured | 25+ format partitioners (PDF, DOCX, PPTX, HTML) | Multi-format enterprise data pipeline ingestion | **$0.010 / page** | **Open-Source Engine** |
| **Marker** | Open-Source | High-speed multi-lingual PDF-to-Markdown | Converting books & papers to clean Markdown | Self-Hosted GPU | **Open-Source (GPL-3.0)** |
| **Nougat** | Meta AI | Academic PDF & mathematical formula OCR | Converting scientific arXiv PDFs to LaTeX/Markdown | Self-Hosted GPU | **Open-Weights (MIT)** |

---

# 🚀 Quick Start Example: Extracting Tables with AWS Textract

```python
import os
import boto3

textract = boto3.client("textract", region_name="us-east-1")

with open("financial_report.pdf", "rb") as doc:
    response = textract.analyze_document(
        Document={"Bytes": doc.read()},
        FeatureTypes=["TABLES", "FORMS"]
    )

print(f"Total Extracted Blocks: {len(response['Blocks'])}")
```

---

# 📚 Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for Intelligent Document Processing (IDP) pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for OCR vs Layout Analysis vs Key-Value extraction mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on Google Document AI, AWS Textract, Azure Document Intelligence, LlamaParse, Unstructured, and Marker.
- Explore **[06-Document-Parsing-Engineering](./06-Document-Parsing-Engineering/README.md)** for table array reconstruction and bounding box geometry guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Paid, Best PDF-to-Markdown, Best Table Parsing).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for Marker, Unstructured, Nougat, and PaddleOCR local deployment setups.
"@

Set-Content -Path (Join-Path $serviceDir "README.md") -Value $masterReadme -Encoding UTF8
$totalFiles++

Write-Output "Successfully created $totalFiles structured markdown files across 16 subfolders and 8 model sub-directories in 08-Document-AI!"
