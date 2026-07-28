---
title: AI Service â€” 08-Document-AI Complete Master Reference
service: 08-Document-AI
view: By Service
last_updated: 2026-07-28
tags: [document-ai, ocr, idp, google-doc-ai, textract, azure-doc-intelligence, unstructured, llamaparse, layoutlmv3, marker]
author: Antigravity AI Knowledge Engine
---

# AI Service â€” 08-Document-AI: Master Technical Specification & Encyclopedia

Welcome to the **08-Document-AI Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, document parsing handbook, and production architectural guide for Intelligent Document Processing (IDP) engines.

---

# ðŸ“ Service Folder Structure & Taxonomy

`	ext
08-Document-AI/
â”œâ”€â”€ 00-Overview/                            # What is Document AI, History, Evolution, IDP Pipeline, Terminology, FAQ
â”œâ”€â”€ 01-Fundamentals/                        # OCR, Layout Analysis, Key-Value Extraction, Table Structure, PDF Tokenization, Document Chunking
â”œâ”€â”€ 02-Providers/                           # Google Cloud Document AI, AWS Textract, Azure Document Intelligence, Unstructured.io, LlamaIndex, Landing AI
â”œâ”€â”€ 03-Models/                              # Deep-Dive Specs for Google Document AI, AWS Textract, Azure Doc Intel, Unstructured, LlamaParse, LayoutLMv3, etc.
â”‚   â”œâ”€â”€ Google-Document-AI/                 # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
â”‚   â”œâ”€â”€ AWS-Textract/                       # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Azure-Document-Intelligence/        # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Unstructured-io/                    # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ LlamaParse/                         # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ LayoutLMv3/                         # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Nougat/                             # (10 Deep-Dive Spec Files)
â”‚   â””â”€â”€ Marker/                             # (10 Deep-Dive Spec Files)
â”œâ”€â”€ 04-Tasks/                               # Invoice Parsing, 10-K Analysis, Legal Extraction, Medical Records, ID Verification, Table Parsing, PDF-to-Markdown
â”œâ”€â”€ 05-API/                                 # REST APIs, SDKs, Auth, Request Formats (PDF/TIFF), Response Formats, Async Polling, Pricing, Error Handling
â”œâ”€â”€ 06-Document-Parsing-Engineering/        # Bounding Box Geometry, Multi-Column Flowing, Table Reconstruction, Handwritten OCR, Multi-Language Alignment
â”œâ”€â”€ 07-Quality/                             # Character Error Rate (CER), Word Error Rate (WER), Key-Value Precision/Recall, Table Structure F1-Score
â”œâ”€â”€ 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best PDF-to-Markdown, Best Table Parsing, Decision Matrix
â”œâ”€â”€ 09-Use-Cases/                           # Accounts Payable Automation, Banking Mortgage Processing, Healthcare Claims, Insurance Policy Extraction
â”œâ”€â”€ 10-Open-Source/                         # Unstructured, Marker, Nougat, LayoutLMv3, Tesseract OCR, PaddleOCR, Local Serving
â”œâ”€â”€ 11-Production/                          # Async PDF Job Queues, Batch Ingestion, PII Anonymization & Redaction, Storage & S3 Integration, Caching
â”œâ”€â”€ 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
â”œâ”€â”€ 13-Benchmarks/                          # DocVQA Score, Key-Value Accuracy %, Processing Latency per Page, Cost per Page
â”œâ”€â”€ 14-Learning-Resources/                  # Official Docs, Research Papers (LayoutLM, Nougat, Unstructured), Blogs, Videos, Courses
â””â”€â”€ 15-Glossary/                            # Terms, Acronyms, References
`

---

# ðŸŽ¯ Model Comparison & Decision Matrix Snapshot

| Engine / Model | Provider | Primary Strength | Best For | Pricing Rate | Open-Source / Cloud |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **AWS Textract** | AWS | Specialized Form & Table extraction | Enterprise AWS invoice & table processing | **.015 - .050 / page** | Cloud API |
| **Azure Doc Intelligence** | Microsoft | Custom trained extraction models | Enterprise Azure mortgage & contract parsing | **.010 - .050 / page** | Cloud API |
| **Google Document AI** | Google Cloud | Out-of-the-box pre-trained invoice/tax parsers | Enterprise GCP accounts payable automation | **.015 - .050 / page** | Cloud API |
| **LlamaParse** | LlamaIndex | Vision LLM-based PDF to Markdown parsing | RAG document chunking & complex tables | **.003 / page** (1k free/mo) | Cloud API |
| **Unstructured.io** | Unstructured | 25+ format partitioners (PDF, DOCX, PPTX, HTML) | Multi-format enterprise data pipeline ingestion | **.010 / page** | **Open-Source Engine** |
| **Marker** | Open-Source | High-speed multi-lingual PDF-to-Markdown | Converting books & papers to clean Markdown | Self-Hosted GPU | **Open-Source (GPL-3.0)** |
| **Nougat** | Meta AI | Academic PDF & mathematical formula OCR | Converting scientific arXiv PDFs to LaTeX/Markdown | Self-Hosted GPU | **Open-Weights (MIT)** |

---

# ðŸš€ Quick Start Example: Extracting Tables with AWS Textract

`python
import os
import boto3

textract = boto3.client("textract", region_name="us-east-1")

with open("financial_report.pdf", "rb") as doc:
    response = textract.analyze_document(
        Document={"Bytes": doc.read()},
        FeatureTypes=["TABLES", "FORMS"]
    )

print(f"Total Extracted Blocks: {len(response['Blocks'])}")
`

---

# ðŸ“š Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for Intelligent Document Processing (IDP) pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for OCR vs Layout Analysis vs Key-Value extraction mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on Google Document AI, AWS Textract, Azure Document Intelligence, LlamaParse, Unstructured, and Marker.
- Explore **[06-Document-Parsing-Engineering](./06-Document-Parsing-Engineering/README.md)** for table array reconstruction and bounding box geometry guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best Paid, Best PDF-to-Markdown, Best Table Parsing).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for Marker, Unstructured, Nougat, and PaddleOCR local deployment setups.
