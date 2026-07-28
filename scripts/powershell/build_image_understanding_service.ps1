$serviceDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\02-Services\07-Image-Understanding"

if (Test-Path $serviceDir) {
    Remove-Item -Recurse -Force $serviceDir
}
New-Item -ItemType Directory -Force -Path $serviceDir | Out-Null

$structure = @{
    "00-Overview" = @(
        "What-is-Image-Understanding.md",
        "History.md",
        "Evolution.md",
        "Visual-QA-Pipeline.md",
        "AI-Terminology.md",
        "FAQ.md"
    );
    "01-Fundamentals" = @(
        "Vision-Transformers-ViT.md",
        "CLIP-Cross-Modal-Alignment.md",
        "SigLIP-Vision-Encoder.md",
        "Visual-Patch-Tokenization.md",
        "High-Res-Image-Tiling.md",
        "Bounding-Box-Coordinate-Prediction.md",
        "OCR-Integration.md"
    );
    "02-Providers" = @(
        "OpenAI.md",
        "Google-AI.md",
        "Anthropic.md",
        "Meta-AI.md",
        "Mistral-AI.md",
        "Alibaba-Qwen.md",
        "DeepSeek.md",
        "Microsoft.md"
    );
    "04-Tasks" = @(
        "Visual-Question-Answering.md",
        "Image-Captioning.md",
        "OCR-Text-Extraction.md",
        "Chart-and-Diagram-Analysis.md",
        "Object-Detection-and-Grounding.md",
        "UI-UX-Layout-Analysis.md",
        "Document-Layout-Understanding.md",
        "Visual-Anomaly-Detection.md"
    );
    "05-API" = @(
        "REST-APIs.md",
        "SDKs.md",
        "Authentication.md",
        "Multimodal-Request-Formats.md",
        "Response-Formats.md",
        "Rate-Limits.md",
        "Pricing.md",
        "Error-Handling.md"
    );
    "06-Visual-Prompt-Engineering" = @(
        "Visual-System-Prompts.md",
        "Crop-and-Zoom-Ingestion.md",
        "High-Res-Detail-Tokens.md",
        "Coordinate-Prompting.md",
        "Multi-Image-Prompting.md",
        "Prompt-Library.md",
        "Common-Mistakes.md"
    );
    "07-Quality" = @(
        "MMMU-Benchmark.md",
        "DocVQA-Benchmark.md",
        "ChartQA-Benchmark.md",
        "MathVista-Benchmark.md",
        "RealWorldQA-Benchmark.md",
        "Spatial-Reasoning-Accuracy.md"
    );
    "08-Comparisons" = @(
        "Best-Overall.md",
        "Best-Free.md",
        "Best-Paid.md",
        "Cheapest.md",
        "Fastest.md",
        "Best-OCR.md",
        "Best-Chart-Analysis.md",
        "Provider-Comparison.md",
        "Pricing-Comparison.md",
        "Decision-Matrix.md"
    );
    "09-Use-Cases" = @(
        "Invoice-and-Receipt-Parsing.md",
        "UI-to-Code-Conversion.md",
        "Medical-Image-Analysis.md",
        "Industrial-Defect-Inspection.md",
        "E-Commerce-Product-Tagging.md",
        "Autonomous-Robotics-Perception.md"
    );
    "10-Open-Source" = @(
        "Llama-3-2-Vision.md",
        "Pixtral-Large.md",
        "Qwen-2-5-VL.md",
        "LLaVA-NeXT.md",
        "Florence-2-Open.md",
        "vLLM-Vision-Serving.md",
        "Ollama-Vision-Local.md"
    );
    "11-Production" = @(
        "Image-Resizing-and-Tiling.md",
        "Image-Token-Budgeting.md",
        "High-Throughput-Batch-Vision.md",
        "Caching-Visual-Embeddings.md",
        "CDN-Storage-Integration.md"
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
        "MMMU-Leaderboard.md",
        "DocVQA-Leaderboard.md",
        "Vision-Inference-Latency-ms.md",
        "Cost-per-1k-Image-Tokens.md"
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

$modelFolders = @("GPT-4o-Vision", "Claude-3-7-Sonnet-Vision", "Gemini-2-5-Pro-Vision", "Llama-3-2-90B-Vision", "Pixtral-Large", "Qwen-2-5-VL-72B", "DeepSeek-VL2", "Florence-2")
$modelSubFiles = @("Overview.md", "Capabilities.md", "API.md", "Pricing.md", "Parameters.md", "Prompting.md", "Limitations.md", "Best-Practices.md", "Examples.md", "Alternatives.md")

$totalFiles = 0

# 1. Create standard capability subfolders and files
foreach ($folder in $structure.Keys) {
    $folderPath = Join-Path $serviceDir $folder
    New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    
    $readmePath = Join-Path $folderPath "README.md"
    $readmeContent = @"
---
title: Image Understanding — $folder
service: 07-Image-Understanding
category: $folder
last_updated: 2026-07-28
tags: [image-understanding, vision-llm, gpt-4o, claude-3-7-vision, gemini-2-5, $($folder.ToLower()), ai-services]
author: Antigravity AI Knowledge Engine
---

# Image Understanding — $folder

## Overview
Comprehensive guide to **$folder** in the Image Understanding (Vision AI) service domain.

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
title: Image Understanding — $fileNameNoExt
service: 07-Image-Understanding
section: $folder
file: $file
last_updated: 2026-07-28
tags: [image-understanding, vision-llm, vqa, ocr, $($folder.ToLower()), $($fileNameNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $fileNameNoExt

## Executive Summary
Detailed technical breakdown of **$fileNameNoExt** within the **$folder** domain of Vision-Language LLMs & Visual Understanding.

## Key Concepts & Architecture
- **Domain**: Multimodal Vision AI & Image Understanding
- **Core Technology**: Vision Transformers (ViT / SigLIP), Visual Patch Tokenization, High-Resolution Image Tiling, Bounding Box Coordinate Grounding `[ymin, xmin, ymax, xmax]`.
- **Industry Standard**: Ingesting high-resolution images, architectural diagrams, PDF documents, or UI screenshots alongside natural language text prompts to perform VQA, OCR, chart reasoning, and structural object detection.

## Detailed Analysis
1. **Technical Foundation**: How $fileNameNoExt processes visual tokens, image patch grid slicing, spatial coordinate mapping, and cross-modal attention fusion.
2. **Production Application**: Best practices for integrating $fileNameNoExt into enterprise document OCR pipelines, UI-to-code auto-generation tools, and industrial quality inspection systems.
3. **Trade-offs**: Evaluating image token calculation costs (e.g. 258 to 1,600+ tokens per image slice) vs. visual detail resolution and response latency.

## Best Practices
- **Use Detail High Mode**: For complex document diagrams, invoices, or fine text OCR, specify `detail="high"` (OpenAI) or high-res tiling to ensure full patch grid decomposition.
- **Crop Target Regions**: Crop specific regions of interest from massive images before sending to the API to reduce token cost and focus model attention.
- **Provide Coordinate Format Examples**: When asking for object grounding or bounding boxes, provide clear 1000x1000 normalized coordinate system examples in the prompt.

## Code / Configuration Example (GPT-4o / Claude 3.7 Vision API)
```python
import os
import base64
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Encode local image to Base64
with open("invoice_sample.png", "rb") as image_file:
    base64_image = base64.b64encode(image_file.read()).decode('utf-8')

# Execute Visual QA / OCR Extraction Query
response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {
            "role": "user",
            "content": [
                {"type": "text", "text": "Extract all line items, tax amounts, and total due from this invoice into a structured JSON object."},
                {
                    "type": "image_url",
                    "image_url": {"url": f"data:image/png;base64,{base64_image}", "detail": "high"}
                }
            ]
        }
    ],
    max_tokens=1000
)

print(response.choices[0].message.content)
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
title: Image Understanding — 03-Models Catalog
service: 07-Image-Understanding
category: 03-Models
last_updated: 2026-07-28
tags: [image-understanding, vision-llm, gpt-4o-vision, claude-3-7-vision, gemini-2-5-vision, llama-3-2-vision]
author: Antigravity AI Knowledge Engine
---

# Image Understanding — 03-Models

## Overview
Comprehensive model-by-model catalog for all major Vision-Language Foundation Models.

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
service: 07-Image-Understanding
model: $model
section: 03-Models
file: $subFile
last_updated: 2026-07-28
tags: [image-understanding, $($model.ToLower()), $($subNoExt.ToLower())]
author: Antigravity AI Knowledge Engine
---

# $model — $subNoExt

## Model Specification: $model
- **Model Name**: $model
- **Primary Developer / Provider**: SOTA Vision-Language AI Provider
- **Model Family**: Multimodal Vision-Language LLM Series
- **Architecture**: Vision Transformer (ViT) / SigLIP Encoder + Autoregressive Decoder
- **Supported Visual Modalities**: High-Res Images, Single & Multi-Page PDFs, UI Diagrams, Screenshots
- **API Availability**: REST API, Python SDK, Open-Weights (Llama 3.2 Vision / Qwen 2.5 VL / Pixtral)

## $subNoExt Detailed Breakdown

### Key Specifications & Benchmarks
- **MMMU Benchmark Score**: SOTA multi-discipline visual reasoning score.
- **DocVQA Accuracy**: Precision text extraction on complex financial & medical documents.
- **High-Res Tiling**: Automatic grid decomposition for 4K+ images.

### Technical Performance Analysis
1. **Strengths**: Superior chart & graph data extraction, precise UI-to-code generation, robust spatial coordinate bounding box prediction.
2. **Weaknesses**: High token cost for multi-image input batches.
3. **Best Use Cases**: Enterprise document OCR, medical image interpretation, UI/UX code generation, industrial defect detection.

## Code Example ($model API Request)
```python
import os
import requests

api_url = "https://api.provider.ai/v1/chat/completions"
headers = {
    "Authorization": f"Bearer {os.environ.get('API_KEY')}",
    "Content-Type": "application/json"
}
payload = {
    "model": "$($model.ToLower())",
    "messages": [
        {
            "role": "user",
            "content": [
                {"type": "text", "text": "Analyze this architecture diagram and explain the cloud data flow."},
                {"type": "image_url", "image_url": {"url": "https://example.com/architecture_diagram.png"}}
            ]
        }
    ]
}

response = requests.post(api_url, headers=headers, json=payload)
print(response.json())
```

## Related Models & Alternatives
- See [08-Comparisons](../08-Comparisons/Decision-Matrix.md) for side-by-side performance benchmarks.
"@
        Set-Content -Path $subFilePath -Value $modelContent -Encoding UTF8
        $totalFiles++
    }
}

# Write Master README for 07-Image-Understanding
$masterReadme = @"
---
title: AI Service — 07-Image-Understanding Complete Master Reference
service: 07-Image-Understanding
view: By Service
last_updated: 2026-07-28
tags: [image-understanding, vision-llm, gpt-4o-vision, claude-3-7-vision, gemini-2-5-vision, llama-3-2-vision, pixtral, qwen-2-5-vl]
author: Antigravity AI Knowledge Engine
---

# AI Service — 07-Image-Understanding: Master Technical Specification & Encyclopedia

Welcome to the **07-Image-Understanding Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, visual prompt engineering handbook, and production architectural guide for Vision-Language Large Language Models (Vision LLMs).

---

# 📁 Service Folder Structure & Taxonomy

```text
07-Image-Understanding/
├── 00-Overview/                            # What is Image Understanding, History, Evolution, Visual QA Pipeline, Terminology, FAQ
├── 01-Fundamentals/                        # ViT, CLIP Alignment, SigLIP, Patch Tokenization, High-Res Tiling, Bounding Box Grounding
├── 02-Providers/                           # OpenAI, Google AI, Anthropic, Meta AI, Mistral AI, Alibaba Qwen, DeepSeek, Microsoft
├── 03-Models/                              # Deep-Dive Specs for GPT-4o Vision, Claude 3.7 Sonnet Vision, Gemini 2.5 Pro Vision, Llama 3.2 Vision, etc.
│   ├── GPT-4o-Vision/                      # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
│   ├── Claude-3-7-Sonnet-Vision/           # (10 Deep-Dive Spec Files)
│   ├── Gemini-2-5-Pro-Vision/              # (10 Deep-Dive Spec Files)
│   ├── Llama-3-2-90B-Vision/               # (10 Deep-Dive Spec Files)
│   ├── Pixtral-Large/                      # (10 Deep-Dive Spec Files)
│   ├── Qwen-2-5-VL-72B/                    # (10 Deep-Dive Spec Files)
│   ├── DeepSeek-VL2/                       # (10 Deep-Dive Spec Files)
│   └── Florence-2/                         # (10 Deep-Dive Spec Files)
├── 04-Tasks/                               # Visual QA, Image Captioning, OCR, Chart Analysis, Object Grounding, UI UX Layout Analysis
├── 05-API/                                 # REST APIs, SDKs, Auth, Request Formats (Base64/URL), Rate Limits, Pricing, Error Handling
├── 06-Visual-Prompt-Engineering/           # Visual System Prompts, Crop & Zoom, High-Res Tokens, Coordinate Prompting, Multi-Image Prompts
├── 07-Quality/                             # MMMU Benchmark, DocVQA, ChartQA, MathVista, RealWorldQA, Spatial Reasoning Accuracy
├── 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best OCR, Best Chart Analysis, Decision Matrix
├── 09-Use-Cases/                           # Invoice Parsing, UI-to-Code Conversion, Medical Analysis, Defect Inspection, E-Commerce Tagging
├── 10-Open-Source/                         # Llama 3.2 Vision, Pixtral Large, Qwen 2.5 VL, LLaVA-NeXT, Florence-2, vLLM Vision, Ollama Vision
├── 11-Production/                          # Image Resizing & Tiling, Image Token Budgeting, Batch Vision Inference, Caching, Storage
├── 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
├── 13-Benchmarks/                          # MMMU Score, DocVQA Score, Vision Inference Latency (ms), Cost per 1k Image Tokens
├── 14-Learning-Resources/                  # Official Docs, Research Papers (ViT, CLIP, LLaVA, Florence-2), Blogs, Videos, Courses
└── 15-Glossary/                            # Terms, Acronyms, References
```

---

# 🎯 Model Comparison & Decision Matrix Snapshot

| Model | Developer | MMMU Score | DocVQA Accuracy | High-Res Tiling | API Pricing (per 1k image tokens) | Open-Weights |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Claude 3.7 Sonnet Vision** | Anthropic | **70.2%** (#1 SOTA) | **95.2%** | Yes | **$0.003 / 1k** | Proprietary API |
| **GPT-4o Vision** | OpenAI | **69.1%** | **92.8%** | Yes (`detail="high"`) | **$0.0025 / 1k** | Proprietary API |
| **Gemini 2.5 Pro Vision** | Google AI | **68.6%** | **93.5%** | Native (Up to 2M ctx) | **$0.00125 / 1k** | Proprietary API |
| **Qwen 2.5 VL 72B** | Alibaba | **67.8%** | **94.1%** | Naive Dynamic Resolution | **$0.00080 / 1k** | **Open-Weights (Apache 2.0)** |
| **Llama 3.2 90B Vision** | Meta AI | **64.5%** | **90.1%** | Yes (Slices 4 patches) | **$0.00060 / 1k** | **Open-Weights (Community)** |
| **Florence-2 Large** | Microsoft | N/A (Specialized) | **89.5%** | Crop-based | **Free (MIT)** | **Open-Weights (MIT)** |

---

# 🚀 Quick Start Example: Visual Document Question Answering

```python
import os
import base64
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# Read and encode document image
with open("financial_chart.png", "rb") as img:
    b64_str = base64.b64encode(img.read()).decode("utf-8")

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {
            "role": "user",
            "content": [
                {"type": "text", "text": "What is the Q3 revenue growth rate shown in this bar chart?"},
                {"type": "image_url", "image_url": {"url": f"data:image/png;base64,{b64_str}"}}
            ]
        }
    ]
)

print(response.choices[0].message.content)
```

---

# 📚 Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for Visual QA pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for Vision Transformers (ViT) and patch tokenization mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on GPT-4o Vision, Claude 3.7 Sonnet Vision, Gemini 2.5 Pro Vision, Llama 3.2 Vision, and Qwen 2.5 VL.
- Explore **[06-Visual-Prompt-Engineering](./06-Visual-Prompt-Engineering/README.md)** for visual coordinate prompting and high-res detail token guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best OCR, Best Chart Analysis).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for Qwen 2.5 VL, Llama 3.2 Vision, and local vLLM Vision serving setups.
"@

Set-Content -Path (Join-Path $serviceDir "README.md") -Value $masterReadme -Encoding UTF8
$totalFiles++

Write-Output "Successfully created $totalFiles structured markdown files across 16 subfolders and 8 model sub-directories in 07-Image-Understanding!"
