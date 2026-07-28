---
title: AI Service â€” 07-Image-Understanding Complete Master Reference
service: 07-Image-Understanding
view: By Service
last_updated: 2026-07-28
tags: [image-understanding, vision-llm, gpt-4o-vision, claude-3-7-vision, gemini-2-5-vision, llama-3-2-vision, pixtral, qwen-2-5-vl]
author: Antigravity AI Knowledge Engine
---

# AI Service â€” 07-Image-Understanding: Master Technical Specification & Encyclopedia

Welcome to the **07-Image-Understanding Service Knowledge Base**. This directory serves as an exhaustive, provider-agnostic technical reference, model comparison center, visual prompt engineering handbook, and production architectural guide for Vision-Language Large Language Models (Vision LLMs).

---

# ðŸ“ Service Folder Structure & Taxonomy

`	ext
07-Image-Understanding/
â”œâ”€â”€ 00-Overview/                            # What is Image Understanding, History, Evolution, Visual QA Pipeline, Terminology, FAQ
â”œâ”€â”€ 01-Fundamentals/                        # ViT, CLIP Alignment, SigLIP, Patch Tokenization, High-Res Tiling, Bounding Box Grounding
â”œâ”€â”€ 02-Providers/                           # OpenAI, Google AI, Anthropic, Meta AI, Mistral AI, Alibaba Qwen, DeepSeek, Microsoft
â”œâ”€â”€ 03-Models/                              # Deep-Dive Specs for GPT-4o Vision, Claude 3.7 Sonnet Vision, Gemini 2.5 Pro Vision, Llama 3.2 Vision, etc.
â”‚   â”œâ”€â”€ GPT-4o-Vision/                      # Overview, Capabilities, API, Pricing, Parameters, Prompting, Limitations, Best Practices, Examples, Alternatives
â”‚   â”œâ”€â”€ Claude-3-7-Sonnet-Vision/           # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Gemini-2-5-Pro-Vision/              # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Llama-3-2-90B-Vision/               # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Pixtral-Large/                      # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ Qwen-2-5-VL-72B/                    # (10 Deep-Dive Spec Files)
â”‚   â”œâ”€â”€ DeepSeek-VL2/                       # (10 Deep-Dive Spec Files)
â”‚   â””â”€â”€ Florence-2/                         # (10 Deep-Dive Spec Files)
â”œâ”€â”€ 04-Tasks/                               # Visual QA, Image Captioning, OCR, Chart Analysis, Object Grounding, UI UX Layout Analysis
â”œâ”€â”€ 05-API/                                 # REST APIs, SDKs, Auth, Request Formats (Base64/URL), Rate Limits, Pricing, Error Handling
â”œâ”€â”€ 06-Visual-Prompt-Engineering/           # Visual System Prompts, Crop & Zoom, High-Res Tokens, Coordinate Prompting, Multi-Image Prompts
â”œâ”€â”€ 07-Quality/                             # MMMU Benchmark, DocVQA, ChartQA, MathVista, RealWorldQA, Spatial Reasoning Accuracy
â”œâ”€â”€ 08-Comparisons/                         # Best Overall, Best Free, Best Paid, Cheapest, Fastest, Best OCR, Best Chart Analysis, Decision Matrix
â”œâ”€â”€ 09-Use-Cases/                           # Invoice Parsing, UI-to-Code Conversion, Medical Analysis, Defect Inspection, E-Commerce Tagging
â”œâ”€â”€ 10-Open-Source/                         # Llama 3.2 Vision, Pixtral Large, Qwen 2.5 VL, LLaVA-NeXT, Florence-2, vLLM Vision, Ollama Vision
â”œâ”€â”€ 11-Production/                          # Image Resizing & Tiling, Image Token Budgeting, Batch Vision Inference, Caching, Storage
â”œâ”€â”€ 12-Examples/                            # Python, JavaScript, cURL, NextJS, FastAPI, NodeJS
â”œâ”€â”€ 13-Benchmarks/                          # MMMU Score, DocVQA Score, Vision Inference Latency (ms), Cost per 1k Image Tokens
â”œâ”€â”€ 14-Learning-Resources/                  # Official Docs, Research Papers (ViT, CLIP, LLaVA, Florence-2), Blogs, Videos, Courses
â””â”€â”€ 15-Glossary/                            # Terms, Acronyms, References
`

---

# ðŸŽ¯ Model Comparison & Decision Matrix Snapshot

| Model | Developer | MMMU Score | DocVQA Accuracy | High-Res Tiling | API Pricing (per 1k image tokens) | Open-Weights |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Claude 3.7 Sonnet Vision** | Anthropic | **70.2%** (#1 SOTA) | **95.2%** | Yes | **.003 / 1k** | Proprietary API |
| **GPT-4o Vision** | OpenAI | **69.1%** | **92.8%** | Yes (detail="high") | **.0025 / 1k** | Proprietary API |
| **Gemini 2.5 Pro Vision** | Google AI | **68.6%** | **93.5%** | Native (Up to 2M ctx) | **.00125 / 1k** | Proprietary API |
| **Qwen 2.5 VL 72B** | Alibaba | **67.8%** | **94.1%** | Naive Dynamic Resolution | **.00080 / 1k** | **Open-Weights (Apache 2.0)** |
| **Llama 3.2 90B Vision** | Meta AI | **64.5%** | **90.1%** | Yes (Slices 4 patches) | **.00060 / 1k** | **Open-Weights (Community)** |
| **Florence-2 Large** | Microsoft | N/A (Specialized) | **89.5%** | Crop-based | **Free (MIT)** | **Open-Weights (MIT)** |

---

# ðŸš€ Quick Start Example: Visual Document Question Answering

`python
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
`

---

# ðŸ“š Detailed Sub-Directory Navigation

- Explore **[00-Overview](./00-Overview/README.md)** for Visual QA pipeline concepts.
- Explore **[01-Fundamentals](./01-Fundamentals/README.md)** for Vision Transformers (ViT) and patch tokenization mechanics.
- Explore **[03-Models](./03-Models/README.md)** for deep-dive specifications on GPT-4o Vision, Claude 3.7 Sonnet Vision, Gemini 2.5 Pro Vision, Llama 3.2 Vision, and Qwen 2.5 VL.
- Explore **[06-Visual-Prompt-Engineering](./06-Visual-Prompt-Engineering/README.md)** for visual coordinate prompting and high-res detail token guides.
- Explore **[08-Comparisons](./08-Comparisons/README.md)** for decision matrices (Best Free, Best OCR, Best Chart Analysis).
- Explore **[10-Open-Source](./10-Open-Source/README.md)** for Qwen 2.5 VL, Llama 3.2 Vision, and local vLLM Vision serving setups.
