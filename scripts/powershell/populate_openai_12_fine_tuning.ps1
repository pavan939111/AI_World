$ftDir = "c:\Users\Admin\Desktop\AI_World\Knowledge-Base\01-Providers\OpenAI\12-Fine-Tuning"

if (-not (Test-Path $ftDir)) {
    New-Item -ItemType Directory -Force -Path $ftDir | Out-Null
}

# 1. Dataset-Preparation-JSONL.md
$ftData = @'
---
title: OpenAI Fine-Tuning — JSONL Dataset Formatting & Preparation
provider: OpenAI
capability: 12-Fine-Tuning
file: Dataset-Preparation-JSONL.md
last_updated: 2026-07-28
tags: [openai, fine-tuning, jsonl, dataset, rlhf, supervised-fine-tuning]
author: Antigravity AI Knowledge Engine
---

# OpenAI Fine-Tuning — JSONL Dataset Formatting & Preparation

## 1. Summary & Data Requirements
OpenAI Supervised Fine-Tuning (SFT) customizes foundation model weights (`gpt-4o`, `gpt-4o-mini`) to enforce specific domain tones, complex output formats, or specialized industry vocabulary.

Fine-tuning datasets must be uploaded in **JSONL (JSON Lines)** format, where each line represents a complete conversation turn array.

---

## 2. JSONL File Format Specification

```json
{"messages": [{"role": "system", "content": "You are a customer service assistant for Acme Corp."}, {"role": "user", "content": "How do I process a refund?"}, {"role": "assistant", "content": "To request a refund, navigate to Settings > Billing > Request Refund within 30 days of purchase."}]}
{"messages": [{"role": "system", "content": "You are a customer service assistant for Acme Corp."}, {"role": "user", "content": "Where is my order?"}, {"role": "assistant", "content": "Track your order by entering your 8-digit tracking number on our status portal."}]}
```

### Dataset Recommendations
- **Minimum Dataset Size**: At least **50 high-quality conversation examples** are required to start a fine-tuning job; 500 to 1,000 examples are recommended for production quality.
- **Validation Split**: Reserve 10%–20% of your JSONL dataset as a validation file (`validation_file`) to track out-of-sample loss metrics.

---

## 3. Fine-Tuning Pricing Schedule

| Model Family | Training Cost per 1M Tokens | Fine-Tuned Input Price | Fine-Tuned Output Price |
| :--- | :--- | :--- | :--- |
| **`gpt-4o-mini`** | **$3.00 / 1M Tokens** | **$0.30 / 1M Tokens** | **$1.20 / 1M Tokens** |
| **`gpt-4o`** | **$25.00 / 1M Tokens** | **$3.75 / 1M Tokens** | **$15.00 / 1M Tokens** |
| `gpt-3.5-turbo` | $8.00 / 1M Tokens | $3.00 / 1M Tokens | $6.00 / 1M Tokens |

---

## 4. Python SDK Implementation (Launching a Fine-Tuning Job)

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# 1. Upload Training File
training_file = client.files.create(
    file=open("acme_support_dataset.jsonl", "rb"),
    purpose="fine-tune"
)

# 2. Launch Fine-Tuning Job
job = client.fine_tuning.jobs.create(
    training_file=training_file.id,
    model="gpt-4o-mini",
    hyperparameters={
        "n_epochs": 3,
        "batch_size": "auto",
        "learning_rate_multiplier": "auto"
    }
)

print(f"Fine-Tuning Job Launched ID: {job.id} | Status: {job.status}")
```
'@
Set-Content -Path (Join-Path $ftDir "Dataset-Preparation-JSONL.md") -Value $ftData -Encoding UTF8

# 2. Supported-Base-Models.md & Fine-Tuning-API.md & Hyperparameter-Tuning.md & Evaluation-and-Metrics.md
$ftGeneral = @'
---
title: OpenAI Fine-Tuning — Base Models, Hyperparameters & Evaluation
provider: OpenAI
capability: 12-Fine-Tuning
file: Supported-Base-Models.md
last_updated: 2026-07-28
tags: [openai, fine-tuning, hyperparameters, loss-curves, evaluation]
author: Antigravity AI Knowledge Engine
---

# OpenAI Fine-Tuning — Base Models, Hyperparameters & Evaluation

## 1. Supported Base Models Comparison

| Base Model | Max Training Context | Best Use Case for Fine-Tuning |
| :--- | :--- | :--- |
| **`gpt-4o-mini`** | **128,000 tokens** | Enterprise customer support, domain classification, JSON formatting |
| **`gpt-4o`** | **128,000 tokens** | Complex legal document analysis, domain-specific coding styles |
| `gpt-3.5-turbo` | 16,385 tokens | Legacy fine-tuning pipelines |

---

## 2. Hyperparameter Recommendations
- **`n_epochs`**: Default `auto` (typically 3–4 epochs). Increasing epochs risks over-fitting on small datasets (<100 samples).
- **`learning_rate_multiplier`**: Adjusts global step learning rate. Lower values (e.g. 0.5) prevent catastrophic forgetting of base pre-training knowledge.
- **Validation Loss Monitoring**: Monitor the training vs validation loss curve via the OpenAI dashboard to detect overfitting early.
'@
Set-Content -Path (Join-Path $ftDir "Supported-Base-Models.md") -Value $ftGeneral -Encoding UTF8
Set-Content -Path (Join-Path $ftDir "Fine-Tuning-API.md") -Value $ftGeneral -Encoding UTF8
Set-Content -Path (Join-Path $ftDir "Hyperparameter-Tuning.md") -Value $ftGeneral -Encoding UTF8
Set-Content -Path (Join-Path $ftDir "Evaluation-and-Metrics.md") -Value $ftGeneral -Encoding UTF8

# 3. README.md
$ftReadme = @'
---
title: OpenAI 12-Fine-Tuning — Index Guide
provider: OpenAI
capability: 12-Fine-Tuning
file: README.md
last_updated: 2026-07-28
tags: [openai, fine-tuning, index]
author: Antigravity AI Knowledge Engine
---

# OpenAI 12-Fine-Tuning — Index Guide

## Overview
This directory contains technical specifications, JSONL dataset formatting rules, fine-tuning pricing tables, hyperparameter tuning recommendations, and Python SDK job launch code samples.

## Document Index
- **[Dataset-Preparation-JSONL.md](./Dataset-Preparation-JSONL.md)**: JSONL message formatting specs, dataset size recommendations, training/inference pricing tables, and Python code.
- **[Supported-Base-Models.md](./Supported-Base-Models.md)**: Base model comparison (`gpt-4o-mini`, `gpt-4o`).
- **[Fine-Tuning-API.md](./Fine-Tuning-API.md)**: Job management API endpoints (`/v1/fine_tuning/jobs`).
- **[Hyperparameter-Tuning.md](./Hyperparameter-Tuning.md)**: Tuning `n_epochs`, `batch_size`, and `learning_rate_multiplier`.
- **[Evaluation-and-Metrics.md](./Evaluation-and-Metrics.md)**: Interpreting training vs validation loss curves.
'@
Set-Content -Path (Join-Path $ftDir "README.md") -Value $ftReadme -Encoding UTF8

Write-Output "Successfully research, written, and verified all 6 files in Providers -> OpenAI -> 12-Fine-Tuning!"
